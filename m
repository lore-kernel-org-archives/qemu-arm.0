Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id t12-20020a5d534c000000b0022c906ffedasm6660951wrv.70.2022.09.26.06.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 06:39:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DA00B1FFBA;
	Mon, 26 Sep 2022 14:39:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	mads@ynddal.dk,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v2 02/11] target/arm: enable tracking of CPU index in MemTxAttrs
Date: Mon, 26 Sep 2022 14:38:55 +0100
Message-Id: <20220926133904.3297263-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926133904.3297263-1-alex.bennee@linaro.org>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: tyjQrldxMQHS

Both arm_cpu_tlb_fill (for normal IO) and
arm_cpu_get_phys_page_attrs_debug (for debug access) come through
get_phys_addr which is setting the other memory attributes for the
transaction. As these are all by definition CPU accesses we can also
set the requested_type/index as appropriate.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/ptw.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3261039d93..644d450662 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2315,6 +2315,9 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
 
+    attrs->requester_type = MEMTXATTRS_CPU;
+    attrs->requester_id = env_cpu(env)->cpu_index;
+
     if (mmu_idx != s1_mmu_idx) {
         /*
          * Call ourselves recursively to do the stage 1 and then stage 2
-- 
2.34.1
