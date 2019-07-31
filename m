Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t63sm62639657wmt.6.2019.07.31.09.15.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 09:15:14 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6FCE71FFB5;
	Wed, 31 Jul 2019 17:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: cota@braap.org,
	bobby.prani@gmail.com,
	aaron@os.amperecomputing.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v4 31/54] target/arm: fetch code with translator_ld
Date: Wed, 31 Jul 2019 17:06:56 +0100
Message-Id: <20190731160719.11396-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731160719.11396-1-alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Oz3o5K79ozyw

From: "Emilio G. Cota" <cota@braap.org>

Now the arm_ld*_code functions are only used at translate time we can
just pass down to translator_ld functions.

Signed-off-by: Emilio G. Cota <cota@braap.org>
[AJB: convert from plugin_insn_append to translator_ld]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v4
  - use translator_ld like the rest of them
---
 target/arm/arm_ldst.h | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/target/arm/arm_ldst.h b/target/arm/arm_ldst.h
index 5e0ac8bef06..45edb108f6a 100644
--- a/target/arm/arm_ldst.h
+++ b/target/arm/arm_ldst.h
@@ -20,25 +20,20 @@
 #ifndef ARM_LDST_H
 #define ARM_LDST_H
 
-#include "exec/cpu_ldst.h"
+#include "exec/translator.h"
 #include "qemu/bswap.h"
 
 /* Load an instruction and return it in the standard little-endian order */
 static inline uint32_t arm_ldl_code(CPUARMState *env, target_ulong addr,
                                     bool sctlr_b)
 {
-    uint32_t insn = cpu_ldl_code(env, addr);
-    if (bswap_code(sctlr_b)) {
-        return bswap32(insn);
-    }
-    return insn;
+    return translator_ldl_swap(env, addr, bswap_code(sctlr_b));
 }
 
 /* Ditto, for a halfword (Thumb) instruction */
 static inline uint16_t arm_lduw_code(CPUARMState *env, target_ulong addr,
                                      bool sctlr_b)
 {
-    uint16_t insn;
 #ifndef CONFIG_USER_ONLY
     /* In big-endian (BE32) mode, adjacent Thumb instructions have been swapped
        within each word.  Undo that now.  */
@@ -46,11 +41,7 @@ static inline uint16_t arm_lduw_code(CPUARMState *env, target_ulong addr,
         addr ^= 2;
     }
 #endif
-    insn = cpu_lduw_code(env, addr);
-    if (bswap_code(sctlr_b)) {
-        return bswap16(insn);
-    }
-    return insn;
+    return translator_lduw_swap(env, addr, bswap_code(sctlr_b));
 }
 
 #endif
-- 
2.20.1
