Received: by 10.25.0.144 with SMTP id 138csp959169lfa;
        Mon, 10 Apr 2017 10:13:59 -0700 (PDT)
X-Received: by 10.55.189.130 with SMTP id n124mr54497940qkf.235.1491844439397;
        Mon, 10 Apr 2017 10:13:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n44si13993956qta.1.2017.04.10.10.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 10:13:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35546 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxct2-0001aP-PJ
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 13:13:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxcss-0001VI-9x
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cxcsr-000765-8x
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 13:13:46 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:49123)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cxcsr-00075j-2C; Mon, 10 Apr 2017 13:13:45 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cxcsq-0005jy-6g; Mon, 10 Apr 2017 18:13:44 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 10 Apr 2017 18:13:37 +0100
Message-Id: <1491844419-12485-8-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
References: <1491844419-12485-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 7/9] arm: Track M profile handler mode state
 in TB flags
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eY3mE6RwhNpw

For M profile exception-return handling we'd like to generate different
code for some instructions depending on whether we are in Handler
mode or Thread mode. This isn't the same as "are we privileged
or user", so we need an extra bit in the TB flags to distinguish.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 9 +++++++++
 target/arm/translate.h | 1 +
 target/arm/translate.c | 1 +
 3 files changed, 11 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e6f05e2..7d26357 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2291,6 +2291,9 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
 #define ARM_TBFLAG_NS_MASK          (1 << ARM_TBFLAG_NS_SHIFT)
 #define ARM_TBFLAG_BE_DATA_SHIFT    20
 #define ARM_TBFLAG_BE_DATA_MASK     (1 << ARM_TBFLAG_BE_DATA_SHIFT)
+/* For M profile only, Handler (ie not Thread) mode */
+#define ARM_TBFLAG_HANDLER_SHIFT    21
+#define ARM_TBFLAG_HANDLER_MASK     (1 << ARM_TBFLAG_HANDLER_SHIFT)
 
 /* Bit usage when in AArch64 state */
 #define ARM_TBFLAG_TBI0_SHIFT 0        /* TBI0 for EL0/1 or TBI for EL2/3 */
@@ -2327,6 +2330,8 @@ static inline bool arm_cpu_data_is_big_endian(CPUARMState *env)
     (((F) & ARM_TBFLAG_NS_MASK) >> ARM_TBFLAG_NS_SHIFT)
 #define ARM_TBFLAG_BE_DATA(F) \
     (((F) & ARM_TBFLAG_BE_DATA_MASK) >> ARM_TBFLAG_BE_DATA_SHIFT)
+#define ARM_TBFLAG_HANDLER(F) \
+    (((F) & ARM_TBFLAG_HANDLER_MASK) >> ARM_TBFLAG_HANDLER_SHIFT)
 #define ARM_TBFLAG_TBI0(F) \
     (((F) & ARM_TBFLAG_TBI0_MASK) >> ARM_TBFLAG_TBI0_SHIFT)
 #define ARM_TBFLAG_TBI1(F) \
@@ -2517,6 +2522,10 @@ static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     }
     *flags |= fp_exception_el(env) << ARM_TBFLAG_FPEXC_EL_SHIFT;
 
+    if (env->v7m.exception != 0) {
+        *flags |= ARM_TBFLAG_HANDLER_MASK;
+    }
+
     *cs_base = 0;
 }
 
diff --git a/target/arm/translate.h b/target/arm/translate.h
index abb0760..f955174 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -31,6 +31,7 @@ typedef struct DisasContext {
     bool vfp_enabled; /* FP enabled via FPSCR.EN */
     int vec_len;
     int vec_stride;
+    bool handler; /* v7M Handler mode */
     /* Immediate value in AArch32 SVC insn; must be set if is_jmp == DISAS_SWI
      * so that top level loop can generate correct syndrome information.
      */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f28c4ca..f980cda 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -11780,6 +11780,7 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
     dc->vec_len = ARM_TBFLAG_VECLEN(tb->flags);
     dc->vec_stride = ARM_TBFLAG_VECSTRIDE(tb->flags);
     dc->c15_cpar = ARM_TBFLAG_XSCALE_CPAR(tb->flags);
+    dc->handler = ARM_TBFLAG_HANDLER(tb->flags);
     dc->cp_regs = cpu->cp_regs;
     dc->features = env->features;
 
-- 
2.7.4

