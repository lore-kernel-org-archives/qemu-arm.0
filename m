Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id j7-20020a5d4527000000b0022af5e36981sm2311832wra.9.2022.09.27.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 07:15:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3D4211FFBE;
	Tue, 27 Sep 2022 15:15:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v3 06/15] target/arm: ensure m-profile helpers set appropriate MemTxAttrs
Date: Tue, 27 Sep 2022 15:14:55 +0100
Message-Id: <20220927141504.3886314-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: FWZEETE1V5Yy

There are a number of helpers for M-profile that deal with CPU
initiated access to the vector and stack areas. While it is unlikely
these coincided with memory mapped IO devices it is not inconceivable.
Embedded targets tend to attract all sorts of interesting code and for
completeness we should tag the transaction appropriately.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/m_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 5ee4ee15b3..d244e9c1c5 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -184,7 +184,7 @@ static bool v7m_stack_write(ARMCPU *cpu, uint32_t addr, uint32_t value,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult txres;
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     bool secure = mmu_idx & ARM_MMU_IDX_M_S;
     int exc;
@@ -272,7 +272,7 @@ static bool v7m_stack_read(ARMCPU *cpu, uint32_t *dest, uint32_t addr,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult txres;
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .attrs = MEMTXATTRS_CPU(cs) };
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
 
@@ -1999,7 +1999,7 @@ static bool v7m_read_half_insn(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     V8M_SAttributes sattrs = {};
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     MemTxResult txres;
 
@@ -2048,7 +2048,7 @@ static bool v7m_read_sg_stack_word(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     CPUState *cs = CPU(cpu);
     CPUARMState *env = &cpu->env;
     MemTxResult txres;
-    GetPhysAddrResult res = {};
+    GetPhysAddrResult res = { .attrs = MEMTXATTRS_CPU(cs) };
     ARMMMUFaultInfo fi = {};
     uint32_t value;
 
@@ -2806,7 +2806,7 @@ uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
      * inspecting the other MPU state.
      */
     if (arm_current_el(env) != 0 || alt) {
-        GetPhysAddrResult res = {};
+        GetPhysAddrResult res = { .attrs = MEMTXATTRS_CPU(env_cpu(env)) };
         ARMMMUFaultInfo fi = {};
 
         /* We can ignore the return value as prot is always set */
-- 
2.34.1
