Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id d16-20020adff850000000b0022ae59d472esm1853489wrq.112.2022.09.27.07.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 07:15:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 775281FFBA;
	Tue, 27 Sep 2022 15:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v3 02/15] target/arm: ensure TCG IO accesses set appropriate MemTxAttrs
Date: Tue, 27 Sep 2022 15:14:51 +0100
Message-Id: <20220927141504.3886314-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Cs1SXg51HeJk

Both arm_cpu_tlb_fill (for normal IO) and
arm_cpu_get_phys_page_attrs_debug (for debug access) come through
get_phys_addr which is setting the other memory attributes for the
transaction. As these are all by definition CPU accesses we can also
set the requested_type/index as appropriate.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v3
  - reword commit summary
---
 target/arm/ptw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2ddfc028ab..4b0dc9bd14 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2289,6 +2289,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
     bool is_secure = regime_is_secure(env, mmu_idx);
 
+    attrs->requester_type = MEMTXATTRS_CPU;
+    attrs->requester_id = env_cpu(env)->cpu_index;
+
     if (mmu_idx != s1_mmu_idx) {
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
-- 
2.34.1
