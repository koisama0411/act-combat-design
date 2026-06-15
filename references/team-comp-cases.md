# 配队案例库(配套配队协同原则)

业界 50+ 款游戏的配队设计案例库。配合 [配队协同原则](team-comp-principles.md) 配队元规则使用。

---

## 一、神配队解构(为什么 1+1+1+1 = 10?)

### 1. 原神:雷国队(雷电+班尼特+香菱+行秋)

**Win Condition**:20 秒固定循环 + **snapshot 剥离 buff** + 高频蒸发反应。

**Buff 时序**:
1. 班尼特 E(场地)→ 香菱/行秋大招(吃满快照 atk + 火附着)
2. 雷电 Q 上场普攻 → 行秋水剑 + 香菱旋火轮被触发 → 高频蒸发
3. 雷电"愿力"被动 → 全队大招 cost - → 下循环回满

**全员四星 + 全员脱手 + 全员双 buff 覆盖** = 教科书。

### 2. 原神:胡行夜钟(反向 buff 链经典)

**Win Condition**:胡桃 50% 以下高伤 + 钟离护盾保命不治疗 + 双水蒸发。**班尼特反而是反向(治疗会踢出血祭状态)**。

### 3. 原神:纳西妲超激化/超绽放

**Win Condition**:**草反应 = multi-reaction stacking**(超绽放 = 草核 + 雷的二阶反应)。纳西妲既能 driver 又能主 C,**off-field 高频草附着不影响其他元素挂载**。

### 4. 鸣潮:菲比+赞妮+守岸人

**Win Condition**:Frazzle 层数转 Embers 伤害充能。守岸人 = 通用 best-in-slot。

### 5. 绝区零:Cunning Hares 派系队

**Win Condition**:派系套装 buff + 妮可减抗 + 安比电击破 + 猫又物理输出。**派系系统让"故事和功能合一"**,但 S2 派系扩张后被冷落 → 反面教材。

### 6. 绝区零:简毕异常队

**Win Condition**:**异常机制 = 纯粹"挂状态"成为伤害主轴**。突击 + 烈焰叠加触发紊乱 → 凯撒维持眩晕窗口。

### 7. FF7 Rebirth:Cloud+Tifa+Aerith

**三种 Synergy 配对各开不同窗口**:Firework Blade / Divine Punishment / Power Cleave。**Synergy 不只是伤害,而是"决定下一波限技窗口速度"**。

### 8. Xenoblade 3:Eunie+Taion Ouroboros + Class Swap

**Ouroboros 支持运行时切换形态** + Class swap = "6 角色 × 20 class = 120 种角色身份"。

### 9. 鬼泣 5:Vergil Doppelganger(自配)

影分身 + 本体三档速度同步关系(Haste 单击双倍 / Normal 两段连击 / Slow 陷阱式连击)— **"自己跟自己配队"** 的极致。

### 10. Hades 2:Duo Boon 反应式组合

**Duo Boons = "两 god boon 不是叠加,是产生新 mechanic"** —— Hail Storm = Freeze + Lightning 触发"冰电连锁"。

---

## 二、Roguelite Build 配对范式

### Hades Duo Boon 哲学
- Duo 强但**不可控**(只能通过 Keepsake 间接提概率)
- "随机抽到神 build"才有惊喜感

### Aspect 系统(每武器 4 个 Aspect 重做)
- Aspect of Beowulf(Hera 盾隐藏):**完全改造 Cast 机制**
- **同一身体不同灵魂** = 4 倍内容产出

### Dead Cells 三色互锁
- 主武器 + 副武器 + 技能 + 突变要**全部强化同一玩法**
- 矛盾搭配效果差,但开发者**没做 1:1 必抽**,只是 archetype 多对多

### 杀戮尖塔流派识别
- 每职业 3-5 个识别度高的流派(Ironclad: Strength scaling / Heavy Block / Bloodletting)
- **第一眼看牌就能识别归属**

### RoR2 物品堆叠三模型
- **Linear**(攻速):N 次 = 效果 × N
- **Multiplicative**(Crowbar):(1+0.4)^N
- **Hyperbolic**(减伤):递减边际

### Vampire Survivors Evolution + Union
- **Evolution**:武器 lv8 + 配件 + 10 分钟开宝箱 = 进化武器
- **Union**:两把武器 lv8 + 可能配件 = 联合武器(空出武器槽)

---

## 三、反派 Boss 群组协同设计

### 多 boss 三铁律

1. **攻击模式必须区分明显**(近 vs 远 / 快 vs 慢 / 高频 vs 低频)
2. **视野上必须能同时显示**(避免"看不见的攻击")
3. **剩 1 个时必须升级**(O&S 经典:吸收能量满血加强)

### 经典案例

| 多 boss 战 | 协同设计 |
|---|---|
| Hades 忒修斯 + 牛人 | 杀 Theseus → Asterius 狂怒;杀 Asterius → Theseus 失 Charge |
| Mantis Lords / Sisters | 单 → 双 / 单 → 三,空间压缩做难度爬坡 |
| O&S(黑魂经典) | 剩 1 个吸收能量满血加强(广度 → 深度切换) |
| MH Turf War | 两怪互殴(非协同攻击玩家,而是生态拟真) |
| 永劫 3v3 | Kurumi 治疗 + Tianhai 坦克 + Viper Ning 控场三角 |
| 鬼泣 5 三主角分线 | 用叙事承担多 boss 量 |

### 1 超强 vs 1+1 boss 选择

| 路径 | 优势 | 代表 |
|---|---|---|
| **1 超强**(深度优先) | 学单 boss moveset 学到精通 | 苇名一心 / 艾尔登梅赛尔 |
| **1+1**(广度优先) | 学多 AI 协同处理 | Hades / Hollow Knight / O&S |
| **叙事接力** | 不协同,通过派系/剧情形成连战感 | 黑神话妖怪联军 |

---

## 四、平衡哲学专题

### 米哈游为何 4 年不让班尼特/万叶/纳西妲下线

1. **环境驱动而非数值膨胀** → 推 Dendro → 老角色没被 nerf 反被激活
2. **支援角色伤害公式不重叠** → 班尼特(atk buff) / 万叶(元素+抗性) / 纳西妲(草反应+精通) = 三维度不可替代
3. **C6 解锁机制** → 不是数值翻倍而是功能切换
4. **新反应 + 新支援** → 给老支援多一种 viable 队伍

### 鸣潮:守岸人 vs Carlotta 事件

- 守岸人 2 年 T0/T0.5 = "Power-creep resistance 典范"
- Hiyuki vs Carlotta = 新角色直接挤老角色 = 反面教材

### ZZZ 派系冷宫问题

S1 派系(Cunning Hares、Belobog)在 S2 完全被冷落 → "派系限定"本身是设计陷阱 → 除非"跨派系羁绊"否则 S1 角色注定边缘化。

### DBFZ Lab Coat 21 被禁事件(反例)

- Photon Pulse:21% 永久减伤 + 21% 自伤增益 + 21 帧指令投
- CEO 2022 Top 48 里 33 人用 21
- **"永久 debuff + 自我增益 + 低风险触发" 三者集一身 = 必禁**

### Patch 五工具箱

| 优先级 | 工具 | 用法 |
|---|---|---|
| ⭐⭐⭐ | 环境改变 | 新元素 / 新机制 / 新敌人 |
| ⭐⭐ | 出新角色让旧角色复活 | Furina 让胡桃焕新 |
| ⭐⭐ | buff 老角色 | ZZZ 老角色免费加强 |
| ⚠️ | 机制改动(只对新角色生效) | 米哈游 snapshot 改 dynamic 不追溯 |
| 🚫 | 数值微调 | 玩家会反弹"我抽的角色被砍了" |

---

## 五、2024-2026 二游设计趋势(14 条)

1. 角色机制模板化 + 微差异化(职能模板 + 内部变体)
2. 召唤物 / 形态切换 = 新角色突破口
3. 弹反 / 闪避 / 完美格挡 = ACT 二游内核
4. 击破 / 失衡 / Groggy 条 = boss 战标准
5. 环境驱动 / Buff 轮换 / 周期端游 = 平衡核心
6. "新 C + 新支援"门当户对绑定
7. 老角色加强公开承诺 + 兼容性接驳
8. 派系 / 羁绊系统 = IP + 战斗 buff 双用
9. 克制矩阵 = 强制多 C 培养
10. 端游 / 深境塔 / Raid 分摊职能定位
11. 演出"短化 + 仪式化"双轨
12. 开发组态度 / 玩家反馈响应速度
13. boss 多阶段 + 转阶段叠加新机制
14. 角色机制太复杂 = 反向踩坑

---

## 六、6 大类配对系统范式(详表)

详细描述见 [跨游戏借鉴库](cross-game-reference.md) 主题 7。

| 类 | 代表 |
|---|---|
| A. 实时切人 + 协力 buff 链 | 原神 / 鸣潮 / 绝区零 / 终末地 / 战双 / 崩 3 |
| B. ATB / Synergy 型 JRPG ACT | FF7 Rebirth / Xenoblade 3 |
| C. 4 人小队 ACT | Relink / MH / Diablo |
| D. 双主角同操作 / 召唤双角色 | DMC5 V / Astral Chain / Bayonetta 3 |
| E. 格斗游戏 Tag System | DBFZ / MvC3 / Marvel Rivals |
| F. JRPG 队伍羁绊 | P5R Showtime+Baton Pass / DQ11 Pep / FE Support+Pair Up |
