Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c12sm8239845wrr.90.2021.06.04.09.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:32:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E371E20014;
	Fri,  4 Jun 2021 16:53:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 91/99] target/arm: tcg: remove superfluous CONFIG_TCG check
Date: Fri,  4 Jun 2021 16:53:04 +0100
Message-Id: <20210604155312.15902-92-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: i+/kMvXg2Il1

From: Claudio Fontana <cfontana@suse.de>

modules under tcg/ are only built for CONFIG_TCG anyway.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/vfp_helper.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/tcg/vfp_helper.c b/target/arm/tcg/vfp_helper.c
index 521719f327..0cc6c85270 100644
--- a/target/arm/tcg/vfp_helper.c
+++ b/target/arm/tcg/vfp_helper.c
@@ -21,10 +21,8 @@
 #include "cpu.h"
 #include "exec/helper-proto.h"
 #include "internals.h"
-#ifdef CONFIG_TCG
 #include "qemu/log.h"
 #include "fpu/softfloat.h"
-#endif
 
 /* VFP support.  We follow the convention used for VFP instructions:
    Single precision routines have a "s" suffix, double precision a
@@ -40,8 +38,6 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
     vfp_set_fpscr(env, val);
 }
 
-#ifdef CONFIG_TCG
-
 #define VFP_HELPER(name, p) HELPER(glue(glue(vfp_,name),p))
 
 #define VFP_BINOP(name) \
@@ -1110,5 +1106,3 @@ void HELPER(check_hcr_el2_trap)(CPUARMState *env, uint32_t rt, uint32_t reg)
 
     raise_exception(env, EXCP_HYP_TRAP, syndrome, 2);
 }
-
-#endif
-- 
2.20.1
