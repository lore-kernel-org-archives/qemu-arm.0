Received: by 10.223.188.70 with SMTP id a6csp5092830wrh;
        Tue, 22 Aug 2017 08:35:06 -0700 (PDT)
X-Received: by 10.200.3.215 with SMTP id z23mr1530817qtg.162.1503416106294;
        Tue, 22 Aug 2017 08:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416106; cv=none;
        d=google.com; s=arc-20160816;
        b=zZoeoNsrYL6WephFcmjq/0T9asTJWLrdq3C2jrqAN23Z2h3RrPFTAFqVzEWWV/aAYO
         W5bNZRBkJbB/irMi8q9fI+UewIWX+F5o9x2CtwgKNDCExw2BNqRAcbW8DzfwOgMnn5Hl
         KJTmCO12LkUqFPYDd3tLfujs97NFWsYRbmPE93EiYGT7YeWg5ZUKvXk78/LJ1lj7QOZJ
         c7dKtalvCaia1hJ/iucXaEvFck+3rB4+JbVC8WqNajTqP6sOxkuydW3uy2xE5Ab17HP3
         zoYJVB3BB6yMkik0CTAivwM1i/NaKB80ts9M1Sw25UO60j6yx4I3L1bIGqoBA7e1BXuE
         Motw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=5nzO7zo8161xQHIbcIVqfq8W0ywj5SWr6gWM8Cdjp2E=;
        b=KyOtrKI92vIXiIVidA5gpeE4rEyRWflcN2xCOcfXVy6SwmztG1234e2gsCsSJrOktL
         5b31nsUFBhkk5GWDo8pJAJeLf+HtbyNjYnRCu0goySr4FPQcQyXroZFUaRHCr7P41dO/
         rmWs7RswlEjlibivMULbuPs1tz+bJY6b3Z1aJ632AGBPiV57PPsBqvjpftCKFCBWA7en
         Cvfx8i8nCDeeeJ+t1sH2xiuh+bze0Brk8Gwey25JHOcdRJJmivevUdcVjsVSJ894P35S
         F8Zk2XYSDnndMFAU5yZDCYuheEniXqt9AHypyXirgJKiJpdI6d1NrxHxaY5XxOkpM+2I
         TZMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si13267081qtg.85.2017.08.22.08.35.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBCp-0003LF-U6
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:35:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnq-0006Ve-GF
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnl-0003Bv-Sv
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:14 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnl-00031e-LI; Tue, 22 Aug 2017 11:09:09 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnb-0004eF-6B; Tue, 22 Aug 2017 16:08:59 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:42 +0100
Message-Id: <1503414539-28762-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 03/20] target/arm: Add state field,
 feature bit and migration for v8M secure state
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EwFeuR1tu/kH

As the first step in implementing ARM v8M's security extension:
 * add a new feature bit ARM_FEATURE_M_SECURITY
 * add the CPU state field that indicates whether the CPU is
   currently in the secure state
 * add a migration subsection for this new state
   (we will add the Secure copies of banked register state
   to this subsection in later patches)
 * add a #define for the one new-in-v8M exception type
 * make the CPU debug log print S/NS status

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       |  3 +++
 target/arm/cpu.c       |  4 ++++
 target/arm/machine.c   | 20 ++++++++++++++++++++
 target/arm/translate.c |  8 +++++++-
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b6bb78a..24666baa 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -66,6 +66,7 @@
 #define ARMV7M_EXCP_MEM     4
 #define ARMV7M_EXCP_BUS     5
 #define ARMV7M_EXCP_USAGE   6
+#define ARMV7M_EXCP_SECURE  7
 #define ARMV7M_EXCP_SVC     11
 #define ARMV7M_EXCP_DEBUG   12
 #define ARMV7M_EXCP_PENDSV  14
@@ -420,6 +421,7 @@ typedef struct CPUARMState {
         int exception;
         uint32_t primask;
         uint32_t faultmask;
+        uint32_t secure; /* Is CPU in Secure state? (not guest visible) */
     } v7m;
 
     /* Information associated with an exception about to be taken:
@@ -1264,6 +1266,7 @@ enum arm_features {
     ARM_FEATURE_THUMB_DSP, /* DSP insns supported in the Thumb encodings */
     ARM_FEATURE_PMU, /* has PMU support */
     ARM_FEATURE_VBAR, /* has cp15 VBAR */
+    ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 8b610de..f32317e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -185,6 +185,10 @@ static void arm_cpu_reset(CPUState *s)
         uint32_t initial_pc; /* Loaded from 0x4 */
         uint8_t *rom;
 
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            env->v7m.secure = true;
+        }
+
         /* The reset value of this bit is IMPDEF, but ARM recommends
          * that it resets to 1, so QEMU always does that rather than making
          * it dependent on CPU model.
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 05e2909..745adae 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -235,6 +235,25 @@ static const VMStateDescription vmstate_pmsav8 = {
     }
 };
 
+static bool m_security_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    CPUARMState *env = &cpu->env;
+
+    return arm_feature(env, ARM_FEATURE_M_SECURITY);
+}
+
+static const VMStateDescription vmstate_m_security = {
+    .name = "cpu/m-security",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = m_security_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(env.v7m.secure, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
                     VMStateField *field)
 {
@@ -484,6 +503,7 @@ const VMStateDescription vmstate_arm_cpu = {
          */
         &vmstate_pmsav7_rnr,
         &vmstate_pmsav7,
+        &vmstate_m_security,
         NULL
     }
 };
diff --git a/target/arm/translate.c b/target/arm/translate.c
index e52a6d7..dea0a6f 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12232,6 +12232,11 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
     if (arm_feature(env, ARM_FEATURE_M)) {
         uint32_t xpsr = xpsr_read(env);
         const char *mode;
+        const char *ns_status = "";
+
+        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
+            ns_status = env->v7m.secure ? "S " : "NS ";
+        }
 
         if (xpsr & XPSR_EXCP) {
             mode = "handler";
@@ -12243,13 +12248,14 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
             }
         }
 
-        cpu_fprintf(f, "XPSR=%08x %c%c%c%c %c %s\n",
+        cpu_fprintf(f, "XPSR=%08x %c%c%c%c %c %s%s\n",
                     xpsr,
                     xpsr & XPSR_N ? 'N' : '-',
                     xpsr & XPSR_Z ? 'Z' : '-',
                     xpsr & XPSR_C ? 'C' : '-',
                     xpsr & XPSR_V ? 'V' : '-',
                     xpsr & XPSR_T ? 'T' : 'A',
+                    ns_status,
                     mode);
     } else {
         uint32_t psr = cpsr_read(env);
-- 
2.7.4

