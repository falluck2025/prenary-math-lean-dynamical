# 偏元数学微分方程与动力系统 · Lean 4 形式化验证
# Prenary Differential Equations & Dynamical Systems · Formal Verification in Lean 4

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22207668.svg)](https://doi.org/10.5281/zenodo.22207668)

> **声明**：本文工作尚未得到独立实验验证，全部结论均为形式化验证层面的初步结果。

---

## 摘要 / Abstract

偏元数学（Prenary Mathematics）是在经典数学结构上引入"动作残差 ε"的一种尝试：**经典对象保持不变，残差 ε 仅附加于"动作"（演化、变换、迭代）层面；当 ε=0 时，全部退化为经典数学。**

本仓库以 Lean 4 对微分方程与动力系统的几个基础结构（常微分方程的演化、积分变换、动力系统迭代、Picard 迭代的收敛性、线性系统的稳定点）做了形式化验证，观察到一个初步现象：动作残差 ε **不破坏**收敛、稳定等拓扑性质，但**会破坏**线性等代数结构。

Prenary Mathematics is an attempt to introduce an "action residual ε" onto classical mathematical structures: classical objects remain unchanged, while the residual ε is attached only to "actions" (evolution, transformation, iteration); when ε = 0, everything degenerates to classical mathematics. This repository formally verifies, in Lean 4, several foundational structures of differential equations and dynamical systems — the evolution of ODEs, integral transforms, iteration of dynamical systems, convergence of Picard iteration, and fixed points of linear systems — observing a preliminary phenomenon: the action residual ε does not break topological properties such as convergence and stability, but it does break algebraic structures such as linearity.

——老陈与AI的深夜实验室 发布 请笑纳——

— Published by Lao Chen & AI's Late Night Lab. Please accept with a smile.

---

## 关键词 / Keywords

偏元数学、δ₀、减法不可清零、微分方程、动力系统、Lean 4 形式化验证；Prenary Mathematics、Differential Equations、Dynamical Systems、Lean 4、Formal Verification；PGI蛟龙；华夏思哲偏元注（Huaxia Sizhe Pianyuan Zhu）；陈偏贞；老陈与AI的深夜实验室（Chensong_AI_LateNightLab）

---

## 定理清单

### 第一部分：演化 · 变换 · 迭代（Day11）

| 定理 | 命题 | 结果 |
|:--|:--|:--|
| `prenary_ode_degenerate` | ε=0 时偏元常微分方程退化为经典方程 | 退化成立 |
| `prenary_ode_non_trivial` | ε≠0 时偏元演化偏离经典演化 | 非平凡 |
| `prenary_transform_degenerate` | ε=0 时偏元变换退化为经典变换 | 退化成立 |
| `prenary_transform_non_trivial` | ε≠0 时偏元变换偏离经典变换 | 非平凡 |
| `prenary_transform_not_linear` | 偏元变换不满足线性（F_ε(f+g) ≠ F_ε(f)+F_ε(g)） | 线性破坏 |
| `prenary_iterate_degenerate` | ε=0 时偏元迭代退化为经典迭代 | 退化成立 |
| `prenary_iterate_non_trivial` | ε≠0 时偏元迭代偏离经典迭代 | 非平凡 |

### 第二部分：Picard 迭代（Day11-02）

| 定理 | 命题 | 结果 |
|:--|:--|:--|
| `prenary_picard_degenerate` | ε=0 时偏元 Picard 算子退化为经典算子 | 退化成立 |
| `prenary_picard_dist_invariant` | 加 ε 是平移，不改变两点距离 | 平移保距 |
| `prenary_picard_contraction_preserved` | 加 ε 不破坏 Lipschitz 收缩性 | 收缩保持 |

### 第三部分：线性系统稳定点（Day11-03）

| 定理 | 命题 | 结果 |
|:--|:--|:--|
| `prenary_linear_fixed_point` | x* = ε/(1-a) 是偏元线性系统的固定点 | 固定点 |
| `prenary_linear_fixed_point_shifted` | ε≠0 时固定点偏离原点 | 稳定点偏移 |
| `prenary_linear_fixed_point_degenerate` | ε=0 时固定点退回 0 | 退化成立 |

---

## 验证记录

| 项 | Day11 | Day11-02 | Day11-03 |
|:--|:--|:--|:--|
| 平台 | live.lean-lang.org（Lean 4） | 同左 | 同左 |
| 内核验证 | No goals（7 定理） | No goals（3 定理） | No goals（3 定理） |
| Comparator 二次验证 | 通过 | 通过 | 通过 |
| 验证哈希 | `e3cc6fa49a2662e938b5bfa948c64e2f4a146f2c54fa3ea4623e8deeffbe7817` | `d394cdfca8b691bd682a5ae64c515de282eac4b04f9caf6875fd129daa3f5115` | `38e1e30c6dae122a646b50351fa818e365f21476e7b0c337c5a0f100e6911aa0` |
| 验证日期 | 2026-08-29 | 2026-08-29 | 2026-08-29 |

---

## 文件说明

| 文件 | 内容 |
|:--|:--|
| `prenary_dynamical_Day11_20260829.lean` | 演化 · 变换 · 迭代（偏元版三定理） |
| `prenary_picard_Day11_02_20260829.lean` | Picard 迭代（平移保距 + 收缩保持） |
| `prenary_linear_Day11_03_20260829.lean` | 线性系统稳定点偏移 |
| `evidence/` | 内核 No goals、Comparator 哈希、Git 时间戳、Zenodo DOI 截图 |

---

## 复现方式（3 步）

1. 打开 [live.lean-lang.org](https://live.lean-lang.org)，新建文件。
2. 将 `.lean` 文件内容原样粘贴（首行 `import Mathlib`）。
3. 光标逐个停在 `theorem` 上，右侧 `No goals` 即通过。

---

## 可证伪条件

若以下任一条件不成立，本文的相应结论自动失效：

1. "动作残差 ε 附着于动作、而非对象"这一前提不成立；
2. 在某一经典结构中，ε=0 时无法退化为经典结果；
3. 平移保距、收缩保持、稳定点偏移在更一般的（非线性、无穷维）系统上不成立。

---

## 作者

陈松（Chen Song）· ORCID: 0009-0002-9510-2239 · GitHub: [falluck2025](https://github.com/falluck2025) · Zenodo 社区：cosmos-breathe-spectrum

## 致谢

感谢一切偶然的必然和必然的偶然。

本文及相关论文的作者为民科独立研究者，全部工作自2026年2月14日起为爱发电进行中。若您认同本研究的方向，并有意为这份独立工作提供任何支持，欢迎通过以下邮箱与作者联系：pgi_cs_cbs@163.com。我们都将在后续论文预印本的"致谢"中如实记录，以志不忘。

## 许可

[CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/)（署名-非商业-禁止演绎，完整法律文本见 LICENSE 文件）

---


——老陈与AI的深夜实验室 发布 请笑纳——
