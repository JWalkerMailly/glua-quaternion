
CreateClientConVar("quaternion_camera", "0", false, false);

local LAG_SPEED     = 5;
local MOVE_SPEED    = 300;
local LOOK_SPEED    = 3;
local ROLL_SPEED    = 720;
local position      = Vector();
local positionLag   = Vector();
local positionDelta = Vector();
local rotation      = Quaternion();
local rotationLag   = Quaternion();
local rotationDelta = Quaternion();

local function ClearInputs(cmd)
	cmd:ClearButtons();
	cmd:ClearMovement();
end

local function ClearMove(cmd)
	position = EyePos();
	positionLag:SetUnpacked(position:Unpack());
	rotation:SetAngle(cmd:GetViewAngles());
	rotationLag:Set(rotation);
end

hook.Add("CreateMove", "Quaternion.CreateMove", function(cmd)

	if (!GetConVar("quaternion_camera"):GetBool()) then return ClearMove(cmd); end

	local frameTime      = FrameTime();
	local lagSpeed       = LAG_SPEED  * frameTime;
	local lookSpeed      = LOOK_SPEED * frameTime;
	local moveSpeed      = MOVE_SPEED * frameTime;
	local mouseW         = cmd:GetMouseWheel() * ROLL_SPEED * frameTime;
	local mouseX, mouseY = cmd:GetMouseX() * -lookSpeed, cmd:GetMouseY() * lookSpeed;

	if (mouseW != 0) then rotation:Mul(rotationDelta:SetAngleAxis(mouseW, Vector(1, 0, 0))); end
	if (mouseY != 0) then rotation:Mul(rotationDelta:SetAngleAxis(mouseY, Vector(0, 1, 0))); end
	if (mouseX != 0) then rotation:Mul(rotationDelta:SetAngleAxis(mouseX, Vector(0, 0, 1))); end

	positionDelta:SetUnpacked(0, 0, 0);
	if (cmd:KeyDown(IN_SPEED))     then moveSpeed = moveSpeed * 3; end
	if (cmd:KeyDown(IN_FORWARD))   then positionDelta.x = positionDelta.x +  moveSpeed; end
	if (cmd:KeyDown(IN_BACK))      then positionDelta.x = positionDelta.x + -moveSpeed; end
	if (cmd:KeyDown(IN_MOVELEFT))  then positionDelta.y = positionDelta.y +  moveSpeed; end
	if (cmd:KeyDown(IN_MOVERIGHT)) then positionDelta.y = positionDelta.y + -moveSpeed; end
	if (cmd:KeyDown(IN_JUMP))      then positionDelta.z = positionDelta.z +  moveSpeed; end
	if (cmd:KeyDown(IN_DUCK))      then positionDelta.z = positionDelta.z + -moveSpeed; end

	rotationLag:SLerp(rotation, lagSpeed);
	position:Add(rotationLag:RotateVector(positionDelta));
	positionLag = LerpVector(lagSpeed, positionLag, position);
	ClearInputs(cmd);
end);

hook.Add("CalcView", "Quaternion.CalcView", function()
	if (!GetConVar("quaternion_camera"):GetBool()) then return; end
	return { origin = positionLag, angles = rotationLag:Angle(), drawviewer = true };
end);