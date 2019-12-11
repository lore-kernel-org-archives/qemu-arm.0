Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s25sm2808856wmh.4.2019.12.11.09.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 09:11:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1420E1FF9D;
	Wed, 11 Dec 2019 17:05:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	alan.hayward@arm.com,
	luis.machado@linaro.org,
	damien.hedde@greensocs.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v3 14/20] target/arm: don't bother with id_aa64pfr0_read for USER_ONLY
Date: Wed, 11 Dec 2019 17:05:14 +0000
Message-Id: <20191211170520.7747-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211170520.7747-1-alex.bennee@linaro.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: E1OrQ6j3aaLV

For system emulation we need to check the state of the GIC before we
report the value. However this isn't relevant to exporting of the
value to linux-user and indeed breaks the exported value as set by
modify_arm_cp_regs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - extend the ifdef and make type CONST with no accessfn
---
 target/arm/helper.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b6e1fe51d76..58592c86714 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5878,6 +5878,7 @@ static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
     return pfr1;
 }
 
+#ifndef CONFIG_USER_ONLY
 static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -5888,6 +5889,7 @@ static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
     }
     return pfr0;
 }
+#endif
 
 /* Shared logic between LORID and the rest of the LOR* registers.
  * Secure state has already been delt with.
@@ -6308,16 +6310,24 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * define new registers here.
          */
         ARMCPRegInfo v8_idregs[] = {
-            /* ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST because we don't
-             * know the right value for the GIC field until after we
-             * define these regs.
+            /*
+             * ID_AA64PFR0_EL1 is not a plain ARM_CP_CONST in system
+             * emulation because we don't know the right value for the
+             * GIC field until after we define these regs.
              */
             { .name = "ID_AA64PFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 0,
-              .access = PL1_R, .type = ARM_CP_NO_RAW,
+              .access = PL1_R,
+#ifdef CONFIG_USER_ONLY
+              .type = ARM_CP_CONST,
+              .resetvalue = cpu->isar.id_aa64pfr0
+#else
+              .type = ARM_CP_NO_RAW,
               .accessfn = access_aa64_tid3,
               .readfn = id_aa64pfr0_read,
-              .writefn = arm_cp_write_ignore },
+              .writefn = arm_cp_write_ignore
+#endif
+            },
             { .name = "ID_AA64PFR1_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 1,
               .access = PL1_R, .type = ARM_CP_CONST,
-- 
2.20.1
