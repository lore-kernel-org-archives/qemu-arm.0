Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id n6-20020a05600c4f8600b003a54d610e5fsm23435275wmq.26.2022.09.06.10.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 10:23:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 89C7F1FFB7;
	Tue,  6 Sep 2022 18:23:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Arnd Bergmann <arnd@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH] target/arm: update the cortex-a15 MIDR to latest rev
Date: Tue,  6 Sep 2022 18:22:57 +0100
Message-Id: <20220906172257.2776521-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /To4jcZRrVS0

QEMU doesn't model micro-architectural details which includes most
chip errata. The ARM_ERRATA_798181 work around in the Linux
kernel (see erratum_a15_798181_init) currently detects QEMU's
cortex-a15 as broken and triggers additional expensive TLB flushes as
a result.

Change the MIDR to report what the latest silicon would (r4p0) as well
as setting the IMPDEF revidr bit to indicate these flushes are not
needed. This cuts about 5s from my Debian kernel boot with the latest
6.0rc1 kernel (29s->24s).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Arnd Bergmann <arnd@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
---
 target/arm/cpu_tcg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 3099b38e32..59d5278868 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -588,7 +588,9 @@ static void cortex_a15_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
-    cpu->midr = 0x412fc0f1;
+    /* r4p0 cpu, not requiring expensive tlb flush errata */
+    cpu->midr = 0x414fc0f0;
+    cpu->revidr = 0x200;
     cpu->reset_fpsid = 0x410430f0;
     cpu->isar.mvfr0 = 0x10110222;
     cpu->isar.mvfr1 = 0x11111111;
-- 
2.34.1
