import Mathlib

/- ================================================================
   偏元数学 · 微分方程与动力系统 Day11-02（Picard 迭代 · 偏元手术）
   核心：Picard 算子加 ε 是"平移"，不改变两点距离 → 不破坏收缩性，
         所以经典 Picard-Lindelöf（解存在唯一）的收敛前提不动摇，解只偏移 ε。
   对象层不动（Picard 算子 P），动作层留 ε（P_ε = P + ε）
   注：PDE 稳定性、李雅普诺夫、混沌门槛属完整分析/开放问题，进迷雾储物箱待确认。
   ================================================================ -/

noncomputable section

-- 偏元 Picard 算子：P_ε(y) = P(y) + ε
noncomputable def prenary_picard (P : ℝ → ℝ) (y : ℝ) (ε : ℝ) : ℝ :=
  P y + ε

-- 退化定理：ε=0 → 经典 Picard 算子
theorem prenary_picard_degenerate (P : ℝ → ℝ) (y : ℝ) :
    prenary_picard P y 0 = P y := by
  unfold prenary_picard
  rw [add_zero]

-- 平移保距：加 ε 不改变两点距离（Picard 收敛性的关键前提）
theorem prenary_picard_dist_invariant (P : ℝ → ℝ) (y z : ℝ) (ε : ℝ) :
    ‖prenary_picard P y ε - prenary_picard P z ε‖ = ‖P y - P z‖ := by
  unfold prenary_picard
  congr 1
  ring

-- 收缩保持：加 ε 不破坏 Lipschitz 收缩性（Picard 收敛前提不动摇）
theorem prenary_picard_contraction_preserved (P : ℝ → ℝ) {L : ℝ} (y z : ℝ) (ε : ℝ)
    (h : ‖P y - P z‖ ≤ L * ‖y - z‖) :
    ‖prenary_picard P y ε - prenary_picard P z ε‖ ≤ L * ‖y - z‖ := by
  rw [prenary_picard_dist_invariant]
  exact h

end
