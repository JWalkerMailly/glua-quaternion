# Quaternion

Quaternions are used to represent rotations. They are compact, don't suffer from gimbal lock and can easily be interpolated. They are based on complex numbers and are not easy to understand intuitively. You almost never access or modify individual Quaternion components (x,y,z,w); most often you would just take existing rotations (e.g. from the *Setters*) and use them to construct new rotations (e.g. to smoothly interpolate between two rotations). Note that order of operation matters.

## Globals

<code>boolean</code> <code><b>IsQuaternion(</b><i>object</i><b>)</b></code></br>

## Constructors

<code>quaternion</code> <code><b>Quaternion(</b><i></i><b>)</b></code></br>
<code>quaternion</code> <code><b>Quaternion(</b><i>w, x, y, z</i><b>)</b></code></br>
<code>quaternion</code> <code><b>Quaternion(</b><i>quaternion</i><b>)</b></code></br>

## Setters

<code>quaternion</code> <code>QUATERNION:<b>Set(</b><i>w, x, y, z</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>SetAngle(</b><i>angle</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>SetMatrix(</b><i>matrix</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>SetAngleAxis(</b><i>theta, axis</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>SetDirection(</b><i>forward</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>SetDirection(</b><i>forward, up</i><b>)</b></code></br>

## Conversion

<code>angle</code> <code>QUATERNION:<b>Angle(</b><i></i><b>)</b></code></br>
<code>matrix</code> <code>QUATERNION:<b>Matrix(</b><i></i><b>)</b></code></br>
<code>matrix</code> <code>QUATERNION:<b>Matrix(</b><i>matrix</i><b>)</b></code></br>
<code>number, vector</code> <code>QUATERNION:<b>AngleAxis(</b><i></i><b>)</b></code></br>
<code>number, number, number, number</code> <code>QUATERNION:<b>Unpack(</b><i></i><b>)</b></code></br>

## Meta Events

<code>boolean</code> <code>QUATERNION:<b>__eq(</b><i>quaternion</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>__unm(</b><i></i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>__add(</b><i>scalar</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>__add(</b><i>quaternion</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>__sub(</b><i>scalar</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>__sub(</b><i>quaternion</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>__mul(</b><i>scalar</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>__mul(</b><i>quaternion</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>__div(</b><i>scalar</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>__div(</b><i>quaternion</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>__concat(</b><i>quaternion</i><b>)</b></code></br>
<code>string</code> <code>QUATERNION:<b>__tostring(</b><i></i><b>)</b></code></br>

## Operation

<code>number</code> <code>QUATERNION:<b>AngleDifference(</b><i>quaternion</i><b>)</b></code></br>
<code>number</code> <code>QUATERNION:<b>LengthSqr(</b><i></i><b>)</b></code></br>
<code>number</code> <code>QUATERNION:<b>Length(</b><i></i><b>)</b></code></br>
<code>number</code> <code>QUATERNION:<b>Dot(</b><i>quaternion</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>AddScalar(</b><i>scalar</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>Add(</b><i>quaternion</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>SubScalar(</b><i>scalar</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>Sub(</b><i>quaternion</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>MulScalar(</b><i>scalar</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>Mul(</b><i>quaternion</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>DivScalar(</b><i>scalar</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>Div(</b><i>quaternion</i><b>)</b></code></br>

## Transformation

<code>quaternion</code> <code>QUATERNION:<b>Normalize(</b><i></i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>Normalized(</b><i></i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>Conjugate(</b><i></i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>Conjugated(</b><i></i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>Invert(</b><i></i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>Inverted(</b><i></i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>Negate(</b><i></i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>Negated(</b><i></i><b>)</b></code></br>
<code>vector</code> <code>QUATERNION:<b>RotateVector(</b><i>vector</i><b>)</b></code></br>
<code>vector</code> <code>QUATERNION:<b>RotatedVector(</b><i>vector</i><b>)</b></code></br>

## Interpolation

<code>quaternion</code> <code>QUATERNION:<b>LerpDomain(</b><i>quaternion, alphaStart, alphaEnd</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>Lerp(</b><i>quaternion, alpha</i><b>)</b></code></br>
<code>quaternion</code> <code>QUATERNION:<b>SLerp(</b><i>quaternion, alpha</i><b>)</b></code></br>