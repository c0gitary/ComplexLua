--Complex Operation
--z = x + yi 
--@usage
--      local ... = Complex(..., ...)
--Ex:   local cc = Complex.new(1,2)

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


function Complex.__tostring(c) --вывод
    return c.real .. " + " .. c.imag .. "i"
end 

function Complex:abs() --модуль числа (a) -> a:abs()
    return math.sqrt(self.real*self.real + self.imag*self.imag)
end
 
function Complex:conjugate() -- сопряженное число (a) -> a:conjugate()
    return Complex.new(self.real, -self.imag)
end

return Complex