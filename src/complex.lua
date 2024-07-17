--Complex Operation
--z = x + yi 
--@usage
--      local Complex = requare("src.complex")
--Ex:   local complex_num = Complex.new(1,2)


local m_sin   =  math.sin
local m_cos   =  math.cos
local m_sqrt  =  math.sqrt
local m_atan2 =  math.atan2
local m_log   =  math.log


local c_e        =  2.71828182845904523536028747135
local c_pi       =  3.14159265358979323846264338328
local c_half_pi  =  1.5707963267948966192
local c_two_pi   =  6.2831853071795864769 -- 2*Pi
local c_radian   =  57.2957795130823208767981548141 -- 1 rad == 53 deg
local c_sqrt_two =  1.41421356237309504880168872421 -- sqrt(2)
local c_phi      =  1.61803398874989484820458683437
local c_log2     =  0.69314718055994530942


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


return Complex