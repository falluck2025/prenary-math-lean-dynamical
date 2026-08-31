import Mathlib

/- ================================================================
   偏元数学 · 微分方程与动力系统 Day11-03（偏元线性系统 · 稳定点偏移）
   核心：偏元线性迭代 x_{n+1} = a x_n + ε 的稳定点从 0 偏移到 ε/(1-a)。
   这是"偏元手术"的真结论：稳定点被 ε 平移，不是被消除（李雅普诺夫 ε-球的线性特例）。
   对象层不动（线性映射 x ↦ a x），动作层留 ε（每步 + ε）
   注：加常数 ε 的系统仍是仿射（线性），Lyapunov 指数 = ln|a|，不产生混沌——
       "稳定点偏移"才是真新维度，不是"混沌"。
   ================================================================ -/

noncomputable section

-- 偏元线性迭代步：x_{n+1} = a x_n + ε
noncomputable def prenary_linear_step (a x ε : ℝ) : ℝ :=
  a * x + ε

-- 固定点定理：x* = ε/(1-a) 满足 x* = a x* + ε（a≠1）
theorem prenary_linear_fixed_point (a ε : ℝ) (ha : a ≠ 1) :
    a * (ε / (1 - a)) + ε = ε / (1 - a) := by
  field_simp [ha]
  ring

-- 稳定点偏移：ε≠0 时，偏元固定点偏离原点（经典固定点是 0）
theorem prenary_linear_fixed_point_shifted (a ε : ℝ) (ha : a ≠ 1) (hε : ε ≠ 0) :
    ε / (1 - a) ≠ 0 := by
  exact div_ne_zero hε (sub_ne_zero.mpr ha.symm)

-- 退化：ε=0 时，偏元固定点退回 0（经典线性系统的稳定点）
theorem prenary_linear_fixed_point_degenerate (a : ℝ) :
    0 / (1 - a) = 0 := by
  simp

end
