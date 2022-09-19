half = BFloat16(0.5f0)
whole = BFloat16(1.0f0)
two = BFloat16(2.0f0)

phi = BFloat16(0.0f0 + Base.Math.MathConstants.golden)
invphi = BFloat16(1.0f0 / Base.Math.MathConstants.golden)
phi3 = phi * phi * phi
invphi3 = invphi * invphi * invphi

for F in  (:abs, :abs2, :sqrt, :cbrt,
          :exp, :exp2, :exp10, :expm1,
          :log, :log2, :log10, :log1p,
          :sin, :cos, :tan, :csc, :sec, :cot,
          :asin, :acos, :atan, :acot,
          :sinh, :cosh, :tanh, :csch, :sech, :coth,
          :asinh, :atanh, :acsch, :asech)
  @eval begin
    @test $F(invphi) == BFloat16($F(Float32(invphi)))
  end
end

for F in (:asec, :acsc, :cosh, :acosh, :acoth)
  @eval begin
    @test $F(phi) == BFloat16($F(Float32(phi)))
  end
end
