Received: by 10.25.77.65 with SMTP id a62csp1918309lfb;
        Tue, 24 Jan 2017 11:16:24 -0800 (PST)
X-Received: by 10.223.134.68 with SMTP id 4mr35805581wrw.49.1485285384849;
        Tue, 24 Jan 2017 11:16:24 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id h7si16281822wma.160.2017.01.24.11.16.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 11:16:24 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cW6Zs-0000Pc-BB; Tue, 24 Jan 2017 19:16:24 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 07/10] armv7m: Report no-coprocessor faults correctly
Date: Tue, 24 Jan 2017 19:16:17 +0000
Message-Id: <1485285380-10565-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
References: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
X-TUID: xnoKMw3HC/Ki

For v7M attempts to access a nonexistent coprocessor are reported
differently from plain undefined instructions (as UsageFaults of type
NOCP rather than type UNDEFINSTR).  Split them out into a new
EXCP_NOCP so we can report the FSR value correctly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 1 +
 linux-user/main.c      | 1 +
 target/arm/helper.c    | 4 ++++
 target/arm/translate.c | 8 ++++++++
 4 files changed, 14 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4b062d2..39bff86 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -53,6 +53,7 @@
 #define EXCP_VIRQ           14
 #define EXCP_VFIQ           15
 #define EXCP_SEMIHOST       16   /* semihosting call */
+#define EXCP_NOCP           17   /* v7M NOCP UsageFault */
 
 #define ARMV7M_EXCP_RESET   1
 #define ARMV7M_EXCP_NMI     2
diff --git a/linux-user/main.c b/linux-user/main.c
index db4eb68..f40d45a 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -570,6 +570,7 @@ void cpu_loop(CPUARMState *env)
 
         switch(trapnr) {
         case EXCP_UDEF:
+        case EXCP_NOCP:
             {
                 TaskState *ts = cs->opaque;
                 uint32_t opcode;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e6b1c36..c23df1b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6074,6 +6074,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
         env->v7m.cfsr |= R_V7M_CFSR_UNDEFINSTR_MASK;
         return;
+    case EXCP_NOCP:
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
+        env->v7m.cfsr |= R_V7M_CFSR_NOCP_MASK;
+        return;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index a7c2abe..493c627 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10217,6 +10217,14 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
         break;
     case 6: case 7: case 14: case 15:
         /* Coprocessor.  */
+        if (arm_dc_feature(s, ARM_FEATURE_M)) {
+            /* We don't currently implement M profile FP support,
+             * so this entire space should give a NOCP fault.
+             */
+            gen_exception_insn(s, 4, EXCP_NOCP, syn_uncategorized(),
+                               default_exception_el(s));
+            break;
+        }
         if (((insn >> 24) & 3) == 3) {
             /* Translate into the equivalent ARM encoding.  */
             insn = (insn & 0xe2ffffff) | ((insn & (1 << 28)) >> 4) | (1 << 28);
-- 
2.7.4
