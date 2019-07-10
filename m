Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x18sm3047130wmi.12.2019.07.10.10.24.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 10:24:46 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 810B31FF87;
	Wed, 10 Jul 2019 18:24:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	1836078@bugs.launchpad.net,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for 4.1] target/arm: report ARMv8.2 FP16 for ARM -cpu max
Date: Wed, 10 Jul 2019 18:24:37 +0100
Message-Id: <20190710172437.628-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NB3W+mTR297r

When we converted to using feature bits in 602f6e42cfbf we missed out
the fact (dp && arm_dc_feature(s, ARM_FEATURE_V8)) was supported for
-cpu max configurations. This caused a regression in the GCC test
suite. Fix this by setting the appropriate FP16 bits in mvfr1.FPHP.

Fixes: https://bugs.launchpad.net/qemu/+bug/1836078
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e75a64a25a..0a0a202fe3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2452,6 +2452,10 @@ static void arm_max_initfn(Object *obj)
             t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
             cpu->isar.id_isar6 = t;
 
+            t = cpu->isar.mvfr1;
+            t = FIELD_DP32(t, MVFR1, FPHP, 2);     /* v8.2 FP16 */
+            cpu->isar.mvfr1 = t;
+
             t = cpu->isar.mvfr2;
             t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
             t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
-- 
2.20.1
