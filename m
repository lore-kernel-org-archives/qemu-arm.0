Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id o1-20020a5d4a81000000b002c3d67aac74sm980093wrq.88.2023.02.03.02.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 02:05:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id EF8E31FFB7;
	Fri,  3 Feb 2023 10:05:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH] target/arm: disable FEAT_SME if we turn off SVE
Date: Fri,  3 Feb 2023 10:05:51 +0000
Message-Id: <20230203100551.2445547-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qKsLJBZ2SRzo

Before this change booting a -cpu max,sve=off would trigger and
assert:

  qemu-system-aarch64: ../../target/arm/helper.c:6647: sve_vqm1_for_el_sm: Assertion `sm' failed.

when the guest attempts to write to SMCR which shouldn't even exist if
SVE has been turned off.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
---
 target/arm/cpu64.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 0e021960fb..a38d43421a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -409,6 +409,13 @@ static void cpu_arm_set_sve(Object *obj, bool value, Error **errp)
     t = cpu->isar.id_aa64pfr0;
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, value);
     cpu->isar.id_aa64pfr0 = t;
+
+    /* FEAT_SME requires SVE, so disable it if no SVE */
+    if (!value) {
+        t = cpu->isar.id_aa64pfr1;
+        t = FIELD_DP64(t, ID_AA64PFR1, SME, 0);
+        cpu->isar.id_aa64pfr1 = t;
+    }
 }
 
 void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
-- 
2.39.1
