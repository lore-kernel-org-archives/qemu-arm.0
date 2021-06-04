Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l9sm5987730wme.21.2021.06.04.09.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:12:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0518A20015;
	Fri,  4 Jun 2021 16:53:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 92/99] target/arm: remove v7m stub function for !CONFIG_TCG
Date: Fri,  4 Jun 2021 16:53:05 +0100
Message-Id: <20210604155312.15902-93-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: IL62XJyoYd4+

From: Claudio Fontana <cfontana@suse.de>

it is needed just once, so just move the CONFIG_TCG check in place.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu-mmu.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu-mmu.c b/target/arm/cpu-mmu.c
index c6ac90a61e..e1bebbf73e 100644
--- a/target/arm/cpu-mmu.c
+++ b/target/arm/cpu-mmu.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "sysemu/tcg.h"
 #include "cpu-mmu.h"
 
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
@@ -155,20 +156,15 @@ int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx)
     }
 }
 
-#ifndef CONFIG_TCG
-ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
-{
-    g_assert_not_reached();
-}
-#endif
-
 ARMMMUIdx arm_mmu_idx_el(CPUARMState *env, int el)
 {
     ARMMMUIdx idx;
     uint64_t hcr;
 
-    if (arm_feature(env, ARM_FEATURE_M)) {
-        return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
+    if (tcg_enabled()) {
+        if (arm_feature(env, ARM_FEATURE_M)) {
+            return arm_v7m_mmu_idx_for_secstate(env, env->v7m.secure);
+        }
     }
 
     /* See ARM pseudo-function ELIsInHost.  */
-- 
2.20.1
