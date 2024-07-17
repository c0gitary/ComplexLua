--Complex Operation
--z = x + yi 
--@usage
--      local Complex = requare("src.complex")
--Ex:   local complex_num = Complex.new(1,2)


-- Math func
local sin   =  math.sin
local cos   =  math.cos
local sqrt  =  math.sqrt
local atan2 =  math.atan2
local log   =  math.log
local exp   =  math.exp


-- Constants
local C_E        =  2.71828182845904523536028747135
local C_PI       =  3.14159265358979323846264338328
local C_HALF_PI  =  1.5707963267948966192
local C_TWO_PI   =  6.2831853071795864769 -- 2*Pi
local C_RAD      =  57.2957795130823208767981548141 -- 1 rad == 53 deg
local C_SQRT_TWO =  1.41421356237309504880168872421 -- sqrt(2)
local C_PHI      =  1.61803398874989484820458683437
local C_LOG2     =  0.69314718055994530942


local Complex = {}
Complex.__index = Complex


function Complex.new(real, imag)
   local self = setmetatable({}, Complex)
   self.real = real or 0
   self.imag = imag or 0
   return self
end


function Complex.__add(c1, c2)
   return Complex.new(c1.real + c2.real, c1.imag + c2.imag)
end


function Complex.__sub(c1, c2)
   return Complex.new(c1.real - c2.real, c1.imag - c2.imag)
end


function Complex.__mul(c1, c2)
   return Complex.new(c1.real * c2.real - c1.imag * c2.imag, c1.real * c2.imag + c1.imag * c2.real)
end


function Complex.__eq(c1, c2)
    return c1.real == c2.real and c1.imag == c2.imag
end


function Complex.__div(c1, c2)
    local denominator = c2:abs() ^ 2
    local numerator = c1 * c2:conjugate()
    return Complex.new(numerator.real / denominator, numerator.imag / denominator)
end


function Complex.__pow(cnum, power)
    if power == 0 then
        return Complex.new(1, 0)
    elseif power == 1 then
        return cnum
    else
        local result = cnum
        for _ = 2, power do
            result = result * cnum
        end
        return result
    end
end


function Complex.__unm(z)
    return Complex.new(-z.real, -z.imag)
end


function Complex.__tostring(c) --вывод
    return c.real .. " + " .. c.imag .. "i"
end 


function Complex:abs() --модуль числа (a) -> a:abs()
    return (self.real*self.real + self.imag*self.imag)^(0.5)
end

 
function Complex:conjugate() -- сопряженное число (a) -> a:conjugate()
    return Complex.new(self.real, -self.imag)
end


function Complex:arg()
    return atan2(self.real, self.imag)
end


function Complex:exp()
    local _r = exp(self.real)
    return Complex.new(_r * cos(self.imag), _r * sin(self.imag))
end


return Complex