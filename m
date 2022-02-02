Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x6sm20225761wrn.18.2022.02.02.04.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 04:24:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 19EE41FFB7;
	Wed,  2 Feb 2022 12:24:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] arm: force flag recalculation when messing with DAIF
Date: Wed,  2 Feb 2022 12:23:53 +0000
Message-Id: <20220202122353.457084-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HCMm4hyp254i

The recently introduced debug tests in kvm-unit-tests exposed an error
in our handling of singlestep cause by stale hflags. This is caught by
--enable-debug-tcg when running the tests.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>
---
 target/arm/helper-a64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index d6a6fd73d9..7cf953b1e6 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -83,12 +83,14 @@ void HELPER(msr_i_daifset)(CPUARMState *env, uint32_t imm)
 {
     daif_check(env, 0x1e, imm, GETPC());
     env->daif |= (imm << 6) & PSTATE_DAIF;
+    arm_rebuild_hflags(env);
 }
 
 void HELPER(msr_i_daifclear)(CPUARMState *env, uint32_t imm)
 {
     daif_check(env, 0x1f, imm, GETPC());
     env->daif &= ~((imm << 6) & PSTATE_DAIF);
+    arm_rebuild_hflags(env);
 }
 
 /* Convert a softfloat float_relation_ (as returned by
-- 
2.30.2
