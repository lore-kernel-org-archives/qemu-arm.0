Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u7sm1508669wrt.18.2021.06.04.09.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:12:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1A3B920002;
	Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 84/99] target/arm: cpu-common: wrap a64-only check with is_a64
Date: Fri,  4 Jun 2021 16:52:57 +0100
Message-Id: <20210604155312.15902-85-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qLCsKq6L0Ro8

From: Claudio Fontana <cfontana@suse.de>

now that is_a64() is just always false when !TARGET_AARCH64,
we can just use that instead of introducing a new ifdef.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-common.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu-common.c b/target/arm/cpu-common.c
index b7a199a8d6..585223350f 100644
--- a/target/arm/cpu-common.c
+++ b/target/arm/cpu-common.c
@@ -305,9 +305,13 @@ uint64_t arm_sctlr(CPUARMState *env, int el)
 {
     /* Only EL0 needs to be adjusted for EL1&0 or EL2&0. */
     if (el == 0) {
-        ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
-        el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
-            ? 2 : 1;
+        if (is_a64(env)) {
+            ARMMMUIdx mmu_idx = arm_mmu_idx_el(env, 0);
+            el = (mmu_idx == ARMMMUIdx_E20_0 || mmu_idx == ARMMMUIdx_SE20_0)
+                ? 2 : 1;
+        } else {
+            el = 1;
+        }
     }
     return env->cp15.sctlr_el[el];
 }
-- 
2.20.1
