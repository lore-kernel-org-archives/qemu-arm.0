Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id bj7-20020a0560001e0700b00228d183f9c2sm1824946wrb.89.2022.09.27.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 07:15:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 11D511FFBD;
	Tue, 27 Sep 2022 15:15:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v3 05/15] target/arm: ensure ptw accesses set appropriate MemTxAttrs
Date: Tue, 27 Sep 2022 15:14:54 +0100
Message-Id: <20220927141504.3886314-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +X0BPcskqYwD

While mapping your page table base to the GICs address space would be
an "interesting" design choice the resultant loads would still be CPU
initiated so should be tagged as such.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/ptw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4b0dc9bd14..62d32d660a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -252,7 +252,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    MemTxAttrs attrs = {};
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
     MemTxResult result = MEMTX_OK;
     AddressSpace *as;
     uint32_t data;
@@ -280,7 +280,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
                             ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
-    MemTxAttrs attrs = {};
+    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
     MemTxResult result = MEMTX_OK;
     AddressSpace *as;
     uint64_t data;
@@ -2289,8 +2289,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
     bool is_secure = regime_is_secure(env, mmu_idx);
 
-    attrs->requester_type = MEMTXATTRS_CPU;
-    attrs->requester_id = env_cpu(env)->cpu_index;
+    result->attrs.requester_type = MTRT_CPU;
+    result->attrs.requester_id = env_cpu(env)->cpu_index;
 
     if (mmu_idx != s1_mmu_idx) {
         /*
-- 
2.34.1
