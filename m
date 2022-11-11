Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id p25-20020a05600c1d9900b003c64c186206sm3651008wms.16.2022.11.11.10.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 10:25:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 233261FFBD;
	Fri, 11 Nov 2022 18:25:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v5 05/20] target/arm: ensure m-profile helpers set appropriate MemTxAttrs
Date: Fri, 11 Nov 2022 18:25:20 +0000
Message-Id: <20221111182535.64844-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IUENy0jwC0B1

There are a number of helpers for M-profile that deal with CPU
initiated access to the vector and stack areas. While it is unlikely
these coincided with memory mapped IO devices it is not inconceivable.
Embedded targets tend to attract all sorts of interesting code and for
completeness we should tag the transaction appropriately.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v5
  - rebase fixes for refactoring
---
 target/arm/m_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 355cd4d60a..2fb1ef95cd 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -184,7 +184,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult txres;
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
@@ -272,7 +272,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult txres;
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
@@ -665,7 +665,7 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
     MemTxResult result;
     uint32_t addr = env->v7m.vecbase[targets_secure] + exc * 4;
     uint32_t vector_entry;
-    MemTxAttrs attrs = {};
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
     ARMMMUIdx mmu_idx;
     bool exc_secure;
 
@@ -1999,7 +1999,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx, bool secure,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     V8M_SAttributes sattrs = {};
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     MemTxResult txres;
 
@@ -2047,7 +2047,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult txres;
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     uint32_t value;
 
@@ -2805,7 +2805,7 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
      * inspecting the other MPU state.
      */
     if (arm_current_el(env) != 0 || alt) {
-        GetPhysAddrResult res = {};
+        GetPhysAddrResult res = { .f.attrs = MEMTXATTRS_CPU(env_cpu(env)) };
         ARMMMUFaultInfo fi = {};
 
         /* We can ignore the return value as prot is always set */
-- 
2.34.1
