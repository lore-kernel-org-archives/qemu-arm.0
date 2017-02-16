Received: by 10.25.77.65 with SMTP id a62csp2552581lfb;
        Thu, 16 Feb 2017 08:36:10 -0800 (PST)
X-Received: by 10.25.99.134 with SMTP id v6mr1050669lfi.170.1487262970532;
        Thu, 16 Feb 2017 08:36:10 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id 7si3694605ljv.274.2017.02.16.08.36.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Feb 2017 08:36:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ceP2P-00036U-O3; Thu, 16 Feb 2017 16:36:09 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 12/13] armv7m: Raise correct kind of UsageFault for attempts to execute ARM code
Date: Thu, 16 Feb 2017 16:36:02 +0000
Message-Id: <1487262963-11519-13-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
References: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
X-TUID: TUXJqtcTI0y2

M profile doesn't implement ARM, and the architecturally required
behaviour for attempts to execute with the Thumb bit clear is to
generate a UsageFault with the CFSR INVSTATE bit set.  We were
incorrectly implementing this as generating an UNDEFINSTR UsageFault;
fix this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 1 +
 linux-user/main.c      | 1 +
 target/arm/helper.c    | 4 ++++
 target/arm/translate.c | 8 ++++++--
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 017e301..228747f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -54,6 +54,7 @@
 #define EXCP_VFIQ           15
 #define EXCP_SEMIHOST       16   /* semihosting call */
 #define EXCP_NOCP           17   /* v7M NOCP UsageFault */
+#define EXCP_INVSTATE       18   /* v7M INVSTATE UsageFault */
 
 #define ARMV7M_EXCP_RESET   1
 #define ARMV7M_EXCP_NMI     2
diff --git a/linux-user/main.c b/linux-user/main.c
index 4fd49ce..b6043d8 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -574,6 +574,7 @@ void cpu_loop(CPUARMState *env)
         switch(trapnr) {
         case EXCP_UDEF:
         case EXCP_NOCP:
+        case EXCP_INVSTATE:
             {
                 TaskState *ts = cs->opaque;
                 uint32_t opcode;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6a476b4..948aba2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6244,6 +6244,10 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
         env->v7m.cfsr |= R_V7M_CFSR_NOCP_MASK;
         break;
+    case EXCP_INVSTATE:
+        armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_USAGE);
+        env->v7m.cfsr |= R_V7M_CFSR_INVSTATE_MASK;
+        break;
     case EXCP_SWI:
         /* The PC already points to the next instruction.  */
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_SVC);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 4436d8f..9fded03 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7978,9 +7978,13 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     TCGv_i32 addr;
     TCGv_i64 tmp64;
 
-    /* M variants do not implement ARM mode.  */
+    /* M variants do not implement ARM mode; this must raise the INVSTATE
+     * UsageFault exception.
+     */
     if (arm_dc_feature(s, ARM_FEATURE_M)) {
-        goto illegal_op;
+        gen_exception_insn(s, 4, EXCP_INVSTATE, syn_uncategorized(),
+                           default_exception_el(s));
+        return;
     }
     cond = insn >> 28;
     if (cond == 0xf){
-- 
2.7.4
