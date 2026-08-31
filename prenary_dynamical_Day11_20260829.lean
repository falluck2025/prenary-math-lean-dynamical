import Mathlib

/- ================================================================
   偏元数学 · 微分方程与动力系统（Day11 · 偏元手术）
   核心：演化/变换/迭代 = 经典 + ε；ε=0 退化；动作留差破坏线性性
   对象层不动（方程结构、变换算子 T、迭代函数 f），动作层留 ε
   注：傅里叶/拉普拉斯是"变换算子 T"的具体实例（统一手术）；
       PDE 的 Δ、Picard 迭代、李雅普诺夫、混沌门槛属深度分析，进迷雾储物箱待确认。
   ================================================================ -/

noncomputable section

-- ============ 一、偏元 ODE（演化动作留差） ============

-- 偏元 ODE：dy/dt = f(y,t) + ε（演化这个动作留差）
def prenary_ode (f : ℝ → ℝ → ℝ) (y : ℝ → ℝ) (t : ℝ) (ε : ℝ) : Prop :=
  deriv y t = f t (y t) + ε

theorem prenary_ode_degenerate (f : ℝ → ℝ → ℝ) (y : ℝ → ℝ) (t : ℝ) :
    prenary_ode f y t 0 ↔ deriv y t = f t (y t) := by
  unfold prenary_ode
  simp

theorem prenary_ode_non_trivial (f : ℝ → ℝ → ℝ) (y : ℝ → ℝ) (t : ℝ) {ε : ℝ} (hε : ε ≠ 0) :
    prenary_ode f y t ε → deriv y t ≠ f t (y t) := by
  intro h
  unfold prenary_ode at h
  intro hclassic
  have hε0 : ε = 0 := by linarith
  exact hε hε0

-- ============ 二、偏元变换（傅里叶/拉普拉斯的统一手术） ============

-- 偏元变换：经典变换算子 T 作用后留 ε
noncomputable def prenary_transform (T : (ℝ → ℝ) → (ℝ → ℝ)) (f : ℝ → ℝ) (ε : ℝ) : ℝ → ℝ :=
  fun x => T f x + ε

theorem prenary_transform_degenerate (T : (ℝ → ℝ) → (ℝ → ℝ)) (f : ℝ → ℝ) :
    prenary_transform T f 0 = T f := by
  unfold prenary_transform
  funext x
  simp

theorem prenary_transform_non_trivial (T : (ℝ → ℝ) → (ℝ → ℝ)) (f : ℝ → ℝ) {ε : ℝ} (hε : ε ≠ 0) :
    prenary_transform T f ε ≠ T f := by
  intro h
  have hx := congrFun h 0
  unfold prenary_transform at hx
  have hε0 : ε = 0 := by
    have h' : T f 0 + ε = T f 0 + 0 := by simpa using hx
    exact add_left_cancel h'
  exact hε hε0

-- 线性性破坏（新结构）：偏元变换不是线性映射 F_ε(f+g) ≠ F_ε(f)+F_ε(g)
theorem prenary_transform_not_linear :
    prenary_transform (fun h : ℝ → ℝ => h) (fun _ : ℝ => 0) 1 +
      prenary_transform (fun h : ℝ → ℝ => h) (fun _ : ℝ => 0) 1 ≠
      prenary_transform (fun h : ℝ → ℝ => h) ((fun _ : ℝ => 0) + (fun _ : ℝ => 0)) 1 := by
  intro h
  unfold prenary_transform at h
  have hx := congrFun h 0
  norm_num at hx

-- ============ 三、偏元动力系统迭代（迭代留差） ============

-- 偏元迭代：x_{n+1} = f(x_n) + ε（每步迭代动作留差）
noncomputable def prenary_iterate (f : ℝ → ℝ) (x₀ : ℝ) (n : ℕ) (ε : ℝ) : ℝ :=
  (f^[n] x₀) + ε

theorem prenary_iterate_degenerate (f : ℝ → ℝ) (x₀ : ℝ) (n : ℕ) :
    prenary_iterate f x₀ n 0 = f^[n] x₀ := by
  unfold prenary_iterate
  rw [add_zero]

theorem prenary_iterate_non_trivial (f : ℝ → ℝ) (x₀ : ℝ) (n : ℕ) {ε : ℝ} (hε : ε ≠ 0) :
    prenary_iterate f x₀ n ε ≠ f^[n] x₀ := by
  intro h
  unfold prenary_iterate at h
  have hε0 : ε = 0 := by linarith
  exact hε hε0

end
