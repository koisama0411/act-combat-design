# 二游配队补遗(2024-2026 调研)

本文件是 [配队协同原则](team-comp-principles.md) + [配队案例库](team-comp-cases.md) 的时间敏感扩展。

- **配队协同原则** = 通用配队元规则(理论沉淀,稳定层)
- **配队案例库** = 经典神配队案例库(历史样本,稳定层)
- **本文件** = 2024-2026 中日二游调研补遗(波动层,需每 1-2 年再调研迭代)

⚠️ 本文件**时效性强**,2027+ 引用时先核对内容是否已过期。

---

## 一、8 条 2024-2026 配队设计新趋势

### 趋势 1:全队共享资源池成主流

**新样本**:
- **NIKKE Burst Gauge**:全队 NA 命中累计,**B1→B2→B3 强制顺序触发**(节拍 + 共享池双合)
- **HBR SP 池**:任意角色技能从同池扣;Yingxia 类专刷 SP(SP 经济本身就是 win condition)
- **GF2 导染索引**:全局充能 + 个体计数双轨,Klukai 攻击 +1 导染,3 点终结 CD -1

**设计要点**:共享池 ≠ 简单总能量,而是把"配队战略"持续上升到队伍级决策。配合已知样本(终末地 SP 300 / 鸣潮协奏 / BA EX cost)= 5+ 种共享池形态可借鉴。

---

### 趋势 2:"必带角色 → 多解法"过渡

2024+ 顶级二游不再设"唯一必带支援",同职业多个差异化拐工具。

**样本**:
- **FGO 拐扩到 5-6 家**:Castoria(Arts loop)/ Skadi(Quick)/ Merlin(Buster)/ **Oberon(三色全吃 + 70% 充能)** / **Tezcatlipoca(30% 全队充能,Double Tezca 80% 互充)** / Koyanskaya(Buster loop)
- **BA 2024+ 总力战**:从"必带 Hina" 转"DPS+HPS 双线",Joint Firing Drill"学生用过不能再用"强制三套不同队解法

**设计要点**:防国民老婆铁律(参见 [数值与养成](numbers-and-progression.md) buff 4 铁律) + niche 差异化是核心。

---

### 趋势 3:snapshot → dynamic 反推后台战斗单位成主流

米哈游 4.0+ 普遍把 snapshot 改 dynamic 后,buff 必须实时挂场上 → **反推"后台战斗单位"工业化兑现**(后台战斗型原型的实战证据):

- **星铁 3.x 忆灵 Memosprite**:独立行动条 + 独立 buff target,Garmentmaker SPD=35% 母体 / HP=66%+720
- **鸣潮 Cantarella**:后台协同攻击 + Outro 给 Carlotta 共鸣技/毁坏伤害 +25%
- **绝区零 Trigger**:永久增眩晕倍率;**Pulchra**:后台直接击破

**设计要点**:dynamic 时代,角色"必须留场上"否则 buff 失效;**后台单位是这困境的工程化解** — 配合 [角色原型扩展](character-archetypes-extended.md) 后台战斗型原型。

---

### 趋势 4:库洛系切人 buff 链 + 节拍同步死磕

库洛(鸣潮/战双)+ NIKKE 赌玩家手速,把切人时序锁做到极致:

- **鸣潮协奏 100% 切人**:同时触发离场 Outro + 入场 Intro 双向 buff,**Swap Cancel** 保留 buff 不真离场
- **战双 3-Ping 矩阵**:红/黄/蓝信号球 × 同色 3-Ping 触发特殊形态;Matrix 闪避时停 = 切人窗口入口
- **Selena 希声签名信号球异化**:"忘我"状态下信号球转音乐会球
- **NIKKE Burst B1→B2→B3 强制顺序**(最严格版本)

**设计要点**:强制顺序锁死灵活度但省心,**配队公式即记忆点**,适合"高 IP 度长情角色"。

---

### 趋势 5:鹰角系 1+3 即时制 ACT

从塔防过渡到即时 ACT 的新模型:

- **终末地 Endfield(2026.1.22 公测)**:1 主控 + 3 自动战斗 AI + 失衡值(类 Stagger)+ 连携治疗
- 顶配:莱万汀(主 C)+ 安洁莉娜(控制减防)+ 狼卫(爆发群伤)+ 管理员(连携 + 治疗)

**设计要点**:挑战传统 4 人手动切人模型,**单手单指可玩**对单手玩家友好(类 BA 半自动)+ 主控角色定位强化。

---

### 趋势 6:派系羁绊"允许 unit 自带"

派系羁绊的灵活版,解决传统"S1 派系冷宫"陷阱(参考 ZZZ 反例):

- **FEH Harmonized Hero(异作 2 人合身)** + **Duo Hero(同作 2 人合身)**
- 一角色自带 Title-locked buff,**给全队同 Title 单位**

**设计要点**:用单角色注入"派系信物",省去"必须凑齐 4 件套"硬约束 = 羁绊系统第二代。

---

### 趋势 7:2025 资源经济通缩重做

5+ 年长寿二游进入"刷新通缩"阶段,经济侧主动收紧:

- **プリコネ 2025-03**:取消"敌方攻击回 TP",TP 经济从被动转主动
- **HBR 2025-07**:Overdrive 加 cooldown + 战斗内 OD 次数上限,逼"不能开局速通"
- 旧配队部分失效,新角色作"重做经济适配者"

**设计要点**:**新项目立项时就该预留通胀治理空间** — 经济参数(SP / 协力槽 / 大招 cost)留 30% buffer,避免 5 年后被迫破坏性大改。

---

### 趋势 8:BA 同色相克(反传统类型克制)

攻击类型 vs 防御类型**同色 = 200%(SuperEffective)**,不同色 = 50%/100%:

- **BA 攻击 5 类(神秘/重装/突击/贯通/震荡) × 防御 4 类(轻装/重装/特殊/弹力)**
- 跟传统"火克草"反色克制**完全相反**

**设计要点**:简化"想克制 = 选同色"心智模型(降学习门槛),有反直觉风险;适合 IP 度高的"硬核手游"。

---

## 二、中国二游配队案例补充(9 款)

### 1. 星铁 3.x 记忆命途(忆灵 Memosprite)

**机制独家性**:忆灵 = **独立行动条 + 独立 buff target 实体**,跟主体共享部分属性(Garmentmaker SPD=35% 母体 / HP=66%+720)。把回合制撕开口子让"双角色异步行动"成立。**True Damage 新轴**(Anaxa/Cipher 引入)绕抗 / 减伤。

**设计层**:后台战斗单位 ✓ / 召唤指挥 ✓ / 派系羁绊(命途)△

**典型配队**:
- **Anaxa + Tribbie + Herta + 存护**:T-1 Tribbie 上场堆 HP/挂忆灵 → T+0 Anaxa 终结植入全弱点+减防 → T+N Herta + Tribbie 双追击长尾(scale 自身 HP)
- **Saber + Tribbie + Sunday + 存护**:Saber 终结技占总伤害 50%,核心狂刷大招;Tribbie 提供终结 RES 减 + 大招后追击

---

### 2. 鸣潮 2.x 协奏能量

**机制独家性**:**协奏 100% 切人 = 离场 Outro + 入场 Intro 同时触发** + Swap Cancel 保留 buff 不真离场。**共鸣回路异化**(散华花瓣 / 安可火焰 / 椿茶杯)做机制识别 UI。

**设计层**:共享池(协奏 100)✓ / 切人 buff 链 ✓ / 后台战斗单位(协同攻击)✓

**典型配队**:
- **Carlotta + Cantarella + 守岸人**:T-1 Cantarella Intro 起手堆 Trance 5 点 → T+0 Cantarella Forte 消耗 Shiver,Outro 给 Carlotta 共鸣技/毁坏伤害 +25% → T+N Carlotta 25% 增伤窗口爆发 + Cantarella 后台协同追击
- **Brant + 长离 + 守岸人**:罕见双 DPS 互 buff(Intro/Outro/共鸣解放 三层互叠)

---

### 3. 绝区零 2.x 派系完整 10 家 + 三轨

**机制独家性**:**派系本身不直接战斗加成**,藏在驱动盘 4 件套里。2.x 形成 **Anomaly(累积属性异常)+ Stun(击破)+ Disorder(双 DPS 同场)三轨**。

**派系完整名单**:Cunning Hares / Belobog / Section 6 / Hollow Special Operations / Sons of Calydon / Criminal Investigation / Stars of Lyra / Mockingbird / Spook Shack / Obol Squad

**设计层**:派系羁绊(驱动盘)✓ / 切人 buff 链(Quick Assist)✓ / 后台战斗单位(off-field Stun/Anomaly)✓

**典型配队**:
- **Hugo + Vivian + Astra Yao**:Hugo 在 Stun 状态下伤害随眩晕剩余时间线性增长。T-1 Vivian 后台堆 Anomaly + Disorder → T+0 击破 → Hugo Stun 窗口爆发 → T+N Astra 快速辅助切回堆 Anomaly
- **Yixuan + Trigger/Pulchra**:长场主 C + 后台击破单位

---

### 4. 战双 3-Ping 矩阵深入

**机制独家性**:**红/黄/蓝 3 类信号球 × 凑齐 3 个同色触发该色特殊形态**;**Matrix 闪避(QTE 闪避激活时停)= 切人窗口入口**;**签名信号球异化**(Selena 希声"忘我"转音乐会球)。

**设计层**:节拍同步(Matrix 时停)✓ / 切人 buff 链(QTE)✓ / 后台战斗单位(协助攻击)✓

**典型操作链(Lucia 绯红之渊)**:闪避(开 Matrix)→ 蓝球 3-Ping → 异色球基础形态 → 前闪 → QTE 队友 → Sword Waves。**核心团队**:Selena 希声 + Karenina 暗甜 + 物理增伤队友。

---

### 5. GF2:追放 导染索引

**机制独家性**:**Confectance Index 全局充能 + 个体计数双轨** — Klukai 攻击/队友造成腐蚀伤害 +1 导染,每攒 3 点终结技 CD -1 回合。**全局共享资源池 + 个体爆发捆绑**。

**设计层**:共享池(导染)✓ / 派系羁绊(冰/火/腐蚀流派)△ / 后台战斗单位(协同补刀)△

**典型配队**:**冰队(腐蚀流)**:索米(无限范围全队护盾 + 减伤)+ Klukai(主 AOE C)+ 佩里蒂亚(协同补刀)+ Mechty(腐蚀减防 buff)。T-1 索米跃键铺盾 → T+0 Klukai AOE 撒腐蚀,佩里蒂亚每次命中触发协同补刀 → T+N Mechty 持续叠 Corrosion,Klukai 3 点导染减 CD 下一波终结。

---

### 6. 终末地 Endfield(2026.1.22 公测)

**机制独家性**:**1 主控 + 3 自动战斗 AI 即时制 ACT**(挑战传统 4 人手动切人)+ **失衡值机制**(类 Stagger)+ 连携治疗 + 战术物品系统。

**设计层**:1+3 模型 ✓ / 节拍同步(失衡值)✓ / 召唤指挥(主控+3 AI)✓

**典型配队**:
- **新手**:管理员(连携治疗)+ 陈千语(主 C)+ 余烬(护盾)+ 秋栗(回血)
- **顶配**:莱万汀(主 C)+ 安洁莉娜(控制减防)+ 狼卫(爆发群伤)+ 管理员

---

### 7. 重返未来 1999 神秘学环克

**机制独家性**:**6 神秘学派系 = 4 元素环克 + 双向直接相克** — Mineral→Beast→Plant→Star→Mineral(环克)+ Spirit ↔ Intellect(双向)。**数值优势嵌入派系认同**,同派系"觉醒共鸣"额外强化。

**设计层**:派系羁绊(克制环)✓ / 切人 buff 链(共鸣但无切人)△

**典型配队**:
- **植物毒队**:Vila + Jessica + Sotheby(同 Plant)+ Druvis III(石化锁敌)。T-1 Druvis 石化 → T+0 Vila/Jessica 上毒 → T+N Sotheby 持续毒 tick
- **FUA 追击队**:Flutterpage + Glug Glug 3000 / 九娘子 / Fatutu

---

### 8. 七史诗(国服紫龙,2024-06 公测)

**机制独家性**:**Soul Burn 全局共享 Soul 池**(消耗强化技能)+ **Beast 神兽系统**(国服独家)按战力 scale 提供战术能力 = 召唤指挥型外挂。

**设计层**:共享池(Soul)✓ / 召唤指挥(Beast)✓

---

### 9. 崩 3 Part 2 + 国产小品配队

- **崩 3 P2 队长星环**:Part 1 三人轮换 → **1 队长星环(队长特性)+ 队员搜索匹配**,队长定盘子。2025 春节版始源 + 终焉双律者。设计层:派系羁绊(星环)△ / 切人(三人轮换)△
- **物华弥新**(2024-04 公测,文物 SRPG):2D 战棋 + 职业三角(刚/柔/技)+ 数值约束(攻-韧-速),纯回合制位置博弈
- **白荆回廊**(古剑奇谭 IP):**出场 8 人池 + 同场 4 人 + CD 好可换人**(切人 / 5 人小队的中间形态)+ **同调者羁绊**
- **阴阳师**:御魂套装 + **速度链**(白藏主 > 130 > 茨木 > 一目连 > 128 > 季 > 因)+ 因幡辉夜姬"基于防御给增伤"(反向数值轴)

---

## 三、日本二游配队案例补充(8 款)

### 1. Blue Archive 同色相克 + EX cost 共享池

**机制独家性**:
- **攻击类型 × 防御类型同色 = 200%**(反传统克制)+ 地形 +1.2x 独立轴 + Special 不吃地形负面
- **EX cost 全队共享 10 上限 / 每秒 +1**(逼"谁先放谁后放"节拍优化)
- **Striker 4 + Special 2** 池子流回:Special ATK/HP 10% / DEF/HEAL 5% → Striker(半个被动 buff 槽)
- **Joint Firing Drill**:"学生用过不能再用"强制三套不同队解法

**设计层**:共享池(EX)✓ / 类型克制矩阵 ✓ / 派系羁绊(社团)△

**典型配队 — Hieronymus(都市/神秘)**:**DPS+HPS 双线**。T-1 Himari/Hina(神秘 buffer)→ T+0 Iroha SP / Hoshino Terror / Kasumi(神秘炮)→ T+N Healer(Hanako/Ako)续航。

---

### 2. NIKKE 5 人队 + Burst 强制顺序

**机制独家性**:
- **1 Defender + 4 主力 = 5 人队**
- **Burst B1→B2→B3 强制顺序触发**(最严格切人链),每按 cooldown 进入(典型 20s)
- **Burst Gauge 全队共享**(NA 命中累计)= 节拍同步 + 共享池双合
- **元素五角克制**(Fire→Wind→Iron→Electric→Water→Fire)+ 75/50/25% 阈值 boss 无敌(逼"卡 burst 不放在阈值附近")

**设计层**:共享池(Burst Gauge)✓ / 切人链(强制顺序)✓ / 元素克制 ✓

**2025 T0 阵容**:
- **Liter(B1)**:万金油 + CDR + 还掩体
- **Crown(B2)**:5s 无敌 + 持续 buff(DPS 保险栓)
- **Naga(B2)**:二号位辅助
- **Red Hood(B3)**:AOE/单体兼备
- **Cinderella(B3,2024 末)**:单体 boss 王(无 parts boss 第一名)

**典型配队**:Liter + Crown + Naga + Red Hood + Modernia。**Win Condition** = 10s burst 窗内 stack 完所有 buff 后 B3 大幅 spike。

---

### 3. FGO 拐扩到 5-6 家 + 3T 速通

**机制独家性**:**前 3 + 后 3 共 6 人**(后 3 不在场也吃部分 CE buff);**Buster/Quick/Arts 链触发 NP**;**职阶 + 弱点 + 礼装** 三轴。

**拐扩到 5-6 家**(2024-2026 状态):
- **Castoria** = Arts loop(50% single + 20% AoE NP charge,Arts buff + NP damage,**永动机本体**)
- **Skadi** = Quick loop(2018 老,2025 仍唯一)
- **Merlin** = Buster 万能(2025 在 Koyan 之下)
- **Oberon(2024-2026 巅峰)** = **唯一三色全吃 + 70% 总充能**,任何 DPS 第一支援格优先
- **Tezcatlipoca(2024-2025)** = **自带 30% 全队充能**(不需起手 NP CE) → **Double Tezca 队 80% 互充 + 80% ATK**,解放 Black Grail 等老 CE 必装

**3T 速通**:三人 NP 全充满 + buff stack + 弱点吃满 = 三 turn 通 90++。

---

### 4. プリコネ Re:Dive 3 排站位 + 2025 经济重做

**机制独家性**:**3 排站位(前/中/后)** + **TP 各人独立但 UB 释放时机手动**(战斗自动跑 + UB 手动)+ **2025-03 取消"敌方攻击回 TP"**(经济从被动转主动,旧配队部分失效)。

**设计层**:UB 时间线手动排序 ✓ / 属性克制 ✓ / 共享池 ✗(TP 各人独立)

**Clan Battle 哲学**:5 凸 + 退避凑伤害,一天 3 凸 + 2 个低伤换余刻;**UB Timeline 按帧吃 buff/debuff**;4-5 人同色额外加成 + boss 弱点属性 +50%;**def-down stacking 必带**(Makoto 类)。

---

### 5. HBR 6 人小队 + SP 池 + Overdrive

**机制独家性**:
- **6 人小队 + SP 共享池**(任意角色技能从同池扣,Yingxia 类专刷 SP = SP 经济本身就是 win condition)
- **Overdrive 系统**(2025 重做):打中累计 40 击 = 1 line,Lv1/2/3 粉/青/黄 = ×1.1/1.2/1.3 + free turn;**2025-07 加 cooldown + 战斗内次数上限**
- **Break Gauge(DP)**:每次攻击破 DP,DP 越破 HP damage 倍率越高(P5 All-Out 扩展版,靠累积非元素弱点)
- **职业**:Stricker / Buffer / Blaster / Defender / Healer

**设计层**:共享池(SP)✓ / 节拍同步(OD 累积)✓ / 类型克制(元素 + Break)✓

**2024-2026 联动**:Air / Kanon / CLANNAD / Little Busters!(完整 Key 系联动循环),联动角色自带"特殊 SP 经济"或"独家 buff 链"。

---

### 6. Azur Lane 前 3 后 3 + 派系协同

**机制独家性**:**前 3 Vanguard(巡洋/驱逐) + 后 3 Main Fleet(战列/航母)**,**两支编队同时上场打同海图**(独家) + **同派系 ship 互 buff**(旗舰位激活 barrage) + **META Ships 装备槽 +1 跨派系修复**(PvE 终局解)。

**设计层**:派系羁绊(派系核心)✓ / 后台战斗单位(后排)✓

**派系标杆**:Sakura Empire(Nagato 旗舰)/ Iron Blood(Bismarck barrage)/ Royal Navy(QE)/ Northern Parliament(Soviet 9 艘 + Khorovod)/ Dragon Empery / Iris Libre。

**Win Condition**:旗舰位选对 + 同派系 ≥ 4 艘触发 buff stack。

---

### 7. Granblue Fantasy 主战格 + Manaster 卡组

**机制独家性**:**4 前排 + 2 后排(亚瑟王) / 6 人羁绊队** + **Element 6 环克 + Race 5** + **Series 武器盘加成**(Dark Opus / Ultima / Hollowsky / Astral / 八命武器盘叠加)+ **Manaster 卡组(2024+)4 张 slot 类 STS 抽牌强化** + **Bahamut/Lucilius/Akasha 三大召唤共享**(多人讨伐召唤 buff 全场吃)。

**设计层**:派系羁绊(Race/Series)✓ / 召唤指挥(双召唤盘)✓ / 节拍同步(Chain Burst 5 连)△

**2024-2026 终局 raid**:Ultimate Bahamut / Akasha / Lucilius PROUD+ / Belial / Diaspora。**Win Condition** = 武器盘斜率 + 召唤 chain + UB Chain Burst 5 连。

**Versus Rising(格斗)2025**:Lucilius DLC + Dark Opus 武器套,Team Battle 3v3 tag + brave counter / SBA 联段(把 GBF 本传 chain burst 翻译进格斗)。

---

### 8. FEH + 日本 4 款小品

- **FE Heroes 2025**:**Duo Hero(同作 2 人合身)** + **Harmonized Hero(异作 2 人合身)** + **Ascendant** — 独家 = **Title-locked buff**,**一角色给全队同 Title 单位 buff**(派系羁绊允许 unit 自带的开创)
- **PGR JP(战双日服)**:**Bond 系统** — 后台不在场角色也参与 Bond 触发,激励"为 buff 拉杂凑队"
- **偶大 SC(Shiny Colors / Song for Prism)**:Fes Unit 同社内 ≥ 2 人 +20% 全属性 + Vocal/Dance/Visual 三轴 × **Mental 资源池**
- **Symphogear XD**:**已停服 2024-01**,作为"3 人队 + Signature Skill + Song 切换 buff" 历史样本

---

## 四、设计层归纳速查表(2024-2026 调研补)

| 游戏 | 派系羁绊 | 共享池 | 切人 buff 链 | 后台单位 | 召唤指挥 | 节拍同步 | 类型克制 |
|---|---|---|---|---|---|---|---|
| 星铁 3.x | △(命途) | ✗ | ✗(回合) | ✓(忆灵) | ✓ | ✗ | 弱点 + path |
| 鸣潮 2.x | ✗ | ✓(协奏 100) | ✓(Outro/Intro) | ✓(协同) | ✗ | △ | △ |
| ZZZ 2.x | ✓(驱动盘) | ✗ | ✓(Quick Assist) | ✓(off-field) | ✗ | ✗ | 属性+二轨 |
| 战双 | △(同色球) | ✗ | ✓(QTE) | ✓(协助) | ✗ | ✓(Matrix) | △ |
| GF2 | △(流派) | ✓(导染) | ✗(回合) | △(协同) | ✗ | ✗ | 元素+腐蚀 |
| 终末地 | ✓(职业) | ✓(SP 300) | ✓(连携) | ✓(3 AI) | ✓(1+3) | ✓(失衡) | 元素 |
| RE1999 | ✓(环克) | ✗ | ✗ | ✗ | ✗ | ✗ | 5+2 环克 |
| 七史诗 | ✗ | ✓(Soul) | ✗ | ✗ | ✓(Beast) | ✗ | 元素 |
| 崩 3 P2 | △(星环) | ✗ | △(轮换) | △ | ✗ | △ | 元素 |
| BA | △(社团) | ✓(EX 10) | ✗ | ✗ | ✗ | ✓ | **同色相克** |
| NIKKE | ✗ | ✓(Burst) | ✓(B1→B2→B3) | ✗ | ✗ | ✓(强制顺序) | 元素五角 |
| FGO | ✗ | ✗(各人 NP) | ✗ | ✓(后 3) | ✗ | ✗ | 三色+class |
| プリコネ | △(属性) | ✗(各人 TP) | △(UB Timeline) | ✗ | ✗ | ✓(UB 排序) | 属性 |
| HBR | △(部队) | ✓(SP) | ✗ | ✗ | ✗ | ✓(OD 累积) | 元素+Break |
| Azur Lane | ✓(派系核心) | ✗ | ✗ | ✓(后排) | ✗ | ✗ | 航空/装甲 |
| GBF | ✓(Race/Series) | △(charge) | ✗ | ✓(后排) | ✓(双召唤盘) | △(Chain Burst) | 6 元素环 |
| FEH | ✓(Title) | ✗ | △(Duo/Harmonized) | ✗ | ✗ | ✗ | 三色+龙/兽 |

---

## 五、4 条通用落地启发

### 落地 1:dynamic buff 时代必须配后台战斗单位

跟着米哈游 4.0+ snapshot→dynamic 趋势,如果项目用 dynamic,**至少 1/3 角色应有"后台持续作战"形态**(忆灵 / Cantarella / Pulchra 范式),否则 buff giver 必须前台 = 全员主 C 化的设计陷阱。

### 落地 2:共享池 + 强制顺序可双合

NIKKE 的"Burst Gauge 全队共享 + B1→B2→B3 强制顺序" 是最严格组合版本。**双合的好处**:1)共享池逼"谁先放";2)强制顺序锁死配队公式 = 玩家记忆点直接拉满。**双合的代价**:灵活度归零,适合 IP 度极高的"长情角色"。

### 落地 3:Joint Firing Drill 借鉴 — "学生用过不能再用"

BA 这个机制可作"挑战副本"核心结构:强制三套不同队解法 + 同 boss 三种通关验证 = 既考验阵容深度,又防"一队打天下",还提供高重玩价值。配合 [Boss 范式库](boss-paradigms.md) 分支 mini-boss 池范式可深化。

### 落地 4:经济通缩预案

看 プリコネ 和 HBR 的 2025 大改教训,新项目立项时**经济参数留 30% buffer**(SP / 协力槽 / 大招 cost 等),避免 5 年后被迫做"挨打不回 TP"这种破坏旧配队的大改。

---

## 六、信息源(便于后续验证)

### 中国二游

- 星铁:[Prydwen Anaxa](https://www.prydwen.gg/star-rail/characters/anaxa/) / [Game8 HSR Saber](https://game8.co/games/Honkai-Star-Rail/archives/519564) / [HSR Memosprite Fandom](https://honkai-star-rail.fandom.com/wiki/Memosprite) / [Prydwen Cipher](https://www.prydwen.gg/star-rail/characters/cipher/) / [Screenrant HSR Remembrance](https://screenrant.com/honkai-star-rail-remembrance-characters-mechanics-memosprites/)
- 鸣潮:[Game8 WuWa Concerto](https://game8.co/games/Wuthering-Waves/archives/456637) / [Prydwen Cantarella](https://www.prydwen.gg/wuthering-waves/characters/cantarella/) / [WuwaLabo Team Comp](https://wuwalabo.com/en/column/best-team-compositions-guide/)
- 绝区零:[Game8 ZZZ Teams](https://game8.co/games/Zenless-Zone-Zero/archives/458656) / [Prydwen Yixuan](https://www.prydwen.gg/zenless/characters/yixuan/) / [ZZZ SoC Icy Veins](https://www.icy-veins.com/zenless-zone-zero/sons-of-calydon-faction-guide) / [ZZZ Faction Fandom](https://zenless-zone-zero.fandom.com/wiki/Faction)
- 战双:[赛琳娜 萌娘百科](https://zh.moegirl.org.cn/%E6%88%98%E5%8F%8C%E5%B8%95%E5%BC%A5%E4%BB%80:%E8%B5%9B%E7%90%B3%E5%A8%9C) / [Lucia: Crimson Abyss Fandom](https://punishing-gray-raven.fandom.com/wiki/Lucia_-_Crimson_Abyss) / [Grayravens Team Comps](https://grayravens.com/wiki/Team_Compositions/Elemental_Teams)
- GF2:[Prydwen GFL2 Klukai](https://www.prydwen.gg/gfl-exilium/characters/klukai/) / [GFL2 Lootbar Klukai](https://lootbar.gg/blog/en/girls-frontline-2-exilium-klukai-pro-build-weapon-keys-and-team.html) / [GFL2 Help Klukai](https://gfl2.help/en/character/Klukai)
- 明日方舟+终末地:[Arknights Summon Fandom](https://arknights.fandom.com/wiki/Summon) / [Push Stroker Fandom](https://arknights.fandom.com/wiki/Specialist/Push_Stroker) / [Endfield Lootbar Guide](https://lootbar.gg/blog/zh-Hant/endfield-1-0-operator-team-builds.html) / [GameKee 终末地配队](https://www.gamekee.com/zmd/690813.html)
- RE1999:[Prydwen RE1999 Teams DB](https://www.prydwen.gg/re1999/teams-database/) / [Bluestacks RE1999 Team Building](https://www.bluestacks.com/blog/game-guides/reverse-1999/rvrse-team-building-guide-en.html) / [Boundbyflame RE1999 Tier List Dec 2025](https://boundbyflame.com/reverse-1999-tier-list/)
- 其他:[物华弥新 百度百科](https://baike.baidu.com/item/%E7%89%A9%E5%8D%8E%E5%BC%A5%E6%96%B0/64004247) / [白荆回廊 网易云游戏](https://cg.163.com/static/content/65f162ff5c65073f57d85c23) / [GameKee 第七史诗](https://www.gamekee.com/epic7/76716.html) / [阴阳师 TapTap 2024 阵容](https://www.taptap.cn/moment/527198831339635792)
- 崩 3 P2:[小米游戏中心 双律者](https://game.xiaomi.com/viewpoint/16515215_1672918537448_13) / [崩坏3/后崩坏书 萌娘百科](https://zh.moegirl.org.cn/%E5%B4%A9%E5%9D%8F3/%E5%90%8E%E5%B4%A9%E5%9D%8F%E4%B9%A6)

### 日本二游

- BA:[Blue Archive Wiki Type](https://bluearchive.fandom.com/wiki/Type) / [BA.gg Attack/Defense Types](https://bluearchive.gg/attack-and-defense-types/) / [BA Wiki KAITEN FX Mk.0](https://bluearchive.wiki/wiki/Kaitenger:_KAITEN_FX_Mk.0_(Grand_Assault)) / [BA.gg Joint Firing Drill 13](https://bluearchive.gg/joint-firing-drill-13-breakthrough-guide/)
- NIKKE:[Prydwen NIKKE Meta Teams](https://www.prydwen.gg/nikke/guides/meta-teams/) / [BitTopup 2025 T0](https://bittopup.com/article/NIKKE-2025-T0-Tier-List-Liter-Crown-Red-Hood-Meta-Teams) / [NIKKE Solo Raid Golden Frame 2025](https://bittopup.com/article/NIKKE-Solo-Raid-Golden-Frame-Guide-Top-3-Teams-2025) / [Cinderella Guide](https://nikke.gg/cinderella-best-builds-teams-and-how-to-play/) / [Helm: Aqua Marine Prydwen](https://www.prydwen.gg/nikke/characters/aqua-marine-helm/)
- FGO:[GamePress Tezcatlipoca](https://grandorder.gamepress.gg/c/servants/tezcatlipoca) / [FGO Tier List](https://www.propelrc.com/ultimate-fgo-tier-list/) / [FGO 2026 SSR Tier List](https://www.ldshop.gg/blog/tier-list/fgo-tier-list.html)
- プリコネ:[GameWith April 2025 Clan Battle](https://gamewith.jp/pricone-re/article/show/494685) / [Princess Connect Wikia Clan Battle](https://princess-connect.fandom.com/wiki/Clan_Battle) / [Fansubbing Clan Battle Basics](https://fansubbing.com/priconne-clan-battle-basics/)
- HBR:[HBR Team Building Guide GachaHeaven](https://www.gachaheaven.com/2024/11/heaven-burns-red-team-building-guide.html) / [HBR Tier List 2025](https://www.vcgamers.com/news/en/heaven-burns-red-tier-list/) / [HBR Combat NamuWiki](https://en.namu.wiki/w/%ED%97%A4%EB%B8%90%20%EB%B2%88%EC%A6%88%20%EB%A0%88%EB%93%9C/%EC%A0%84%ED%88%AC) / [HBR Resetera OT](https://www.resetera.com/threads/heaven-burns-red-ot-prepare-to-cry-edition.1035900/)
- Azur Lane:[AzurLane ECGC Fleet Building](https://azurlaneecgc.com/fleetbuilding/) / [BlueStacks Bismarck Guide](https://www.bluestacks.com/blog/game-guides/azur-lane/al-bismarck-guide-en.html) / [Hakuhou Sakura Synergy](https://lootbar.gg/blog/en/azur-lane-hakuhou-ultimate-guide-skills-team-synergy.html) / [AL Tier List April 2026](https://www.appgamer.com/azur-lane-tier-list-best-battleships)
- GBF:[GBF Guide](https://gbfguide.com/) / [GBF Wiki Advanced Grids](https://dev.gbf.wiki/Team_Building) / [GBVSR Battle Mechanics](https://rising.granbluefantasy.jp/en/gamemodes/battle/) / [Dark Opus Wiki](https://gbf.wiki/Dark_Opus_Weapons) / [Lucilius (Rising)](https://gbf.wiki/Lucilius_(Rising))
- FEH+小品:[FE Heroes Best Team Compositions 2025](https://toxigon.com/fire-emblem-heroes-best-team-compositions-for-2025) / [PGR Wiki](https://punishing-gray-raven.fandom.com/wiki/CN/TW/JP_Guide) / [Shinycolors Wiki](https://shinycolors.wiki/wiki/Produce_Info) / [Symphogear EOS](https://www.gamerbraves.com/symphogear-xd-unlimited-announces-end-of-service/)

---

## 七、跟其他 references 的关系

- 配套 [配队协同原则](team-comp-principles.md) — 它管"通用配队元规则",本文件管"2024-2026 时间敏感动态"
- 配套 [配队案例库](team-comp-cases.md) — 它管"经典神配队样本",本文件管"2024-2026 最新配队样本"
- 跟 [角色原型扩展](character-archetypes-extended.md) 后台战斗型原型 — 趋势 3 是该原型工业化兑现的实战证据
- 跟 [数值与养成](numbers-and-progression.md) buff 4 铁律 — 趋势 2 "必带 → 多解法" 是防国民老婆铁律的落地
- 跟 [Boss 范式库](boss-paradigms.md) 分支 mini-boss 池范式 — 趋势 8 的 Joint Firing Drill 借鉴可深化

---

## 八、迭代计划

本文件是 **2024-2026 调研沉淀,时效性强**,后续迭代:

- **每 1-2 年再调研一次**,补新游戏/新趋势,删过时(如 Symphogear XD 已停服)
- 如发现配队协同原则 / 案例库有结构性短板(如"共享池"在通用元规则里没单列),考虑做合并瘦身轮把本文件部分内容融入
- 已彻底过时的趋势(如某游戏 2027 大改后机制完全变样),挪到"垃圾箱"段(类比角色文档垃圾箱习惯)
