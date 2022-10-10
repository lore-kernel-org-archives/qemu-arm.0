Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id ck15-20020a5d5e8f000000b0022afe4fb459sm9399509wrb.51.2022.10.10.08.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 08:32:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DF37A1FFB7;
	Mon, 10 Oct 2022 16:32:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Arnd Bergmann <arnd@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2] target/arm: update the cortex-a15 MIDR to latest rev
Date: Mon, 10 Oct 2022 16:32:25 +0100
Message-Id: <20221010153225.506394-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1cvlJtaNZmRQ

QEMU doesn't model micro-architectural details which includes most
chip errata. The ARM_ERRATA_798181 work around in the Linux
kernel (see erratum_a15_798181_init) currently detects QEMU's
cortex-a15 as broken and triggers additional expensive TLB flushes as
a result.

Change the MIDR to report what the latest silicon would (r4p0). We
explicitly set the IMPDEF revidr bits to 0 because we don't need to
set anything other than the silicon revision to indicate these flushes
are not needed. This cuts about 5s from my Debian kernel boot with the
latest 6.0rc1 kernel (29s->24s).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Arnd Bergmann <arnd@linaro.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Message-Id: <20220906172257.2776521-1-alex.bennee@linaro.org>

---
v2
  - set revdir=0 instead of 0x200, update commit message
---
 target/arm/cpu_tcg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 98b5ba2160..60ff539fa1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -592,7 +592,9 @@ static void cortex_a15_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_EL3);
     set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A15;
-    cpu->midr = 0x412fc0f1;
+    /* r4p0 cpu, not requiring expensive tlb flush errata */
+    cpu->midr = 0x414fc0f0;
+    cpu->revidr = 0x0;
     cpu->reset_fpsid = 0x410430f0;
     cpu->isar.mvfr0 = 0x10110222;
     cpu->isar.mvfr1 = 0x11111111;
-- 
2.34.1
