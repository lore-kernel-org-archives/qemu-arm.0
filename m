Received: by 10.223.188.70 with SMTP id a6csp5071404wrh;
        Tue, 22 Aug 2017 08:16:05 -0700 (PDT)
X-Received: by 10.55.94.2 with SMTP id s2mr1486768qkb.253.1503414965368;
        Tue, 22 Aug 2017 08:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503414965; cv=none;
        d=google.com; s=arc-20160816;
        b=I8l9fcskQp0DjGcvfjrEoS1pFbueOSI00zo0aSLeQTxqOUBR/mWFLT3ITJySsYhFNm
         FSU3Qkh2bFFflpR+1mmL7c3xCY2hrAE0tJmdUUrVebcjE+xz1hWiCSGh+Ygwqb/inJNh
         VgZPLcS1pvsHnG5pbO44cB06pVSeAmFGOjkEj5ZbfyJi299/syKJTtx8OlIwhQKbbA36
         bqQY2kEQPEEHRy6+6p7HnNlMRquDA9ORUey0wIolXnQCAR5dPfqsyjDU+1UnHM7k4LSa
         nfEwq+p3lSbNwpX552cb+Se7DpfOqYvAtvQf1SkRwtVvF4RmA819ImUXKVKr1+bzcU/J
         O63w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=NNboBZotAIAVMSi6x36KmTEDEdhY00C2VbUCH+AYSQk=;
        b=BDK0ZeIwVklI8Mu+lF5+09bbPkfeCWTjt188XXvaxKLCo/CEfSY+GlyzvaZrYkwq9Q
         ZoohtvysNmXiGDc/ZIXtnK2rAhd0YiLFe2BtNk+V6nVH1hJ+2VeRcy5UJpOTDnJ5YkEL
         VqyU4LZNw7wv2LAzDZ/h4vZbFPUeIJ+L7BkLI+Q1ukFBTq+ybEkv7WgweJT4hc0ZS1IF
         OaGa5Pvu759SdkKzqwjoJN6ERNHni6TckKB2gTPJC7+kFM8s4z0d15NJwyPZo6d+owCP
         iDNPQHJ+cYsRYjRg64dH3+evCJlhYY3fw0mTWPeT5KPB6aM+mogXDW1lNyIlS71howEW
         1nyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b32si14846845qkh.122.2017.08.22.08.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:16:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkAuQ-0004X8-UH
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:16:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnl-0006Li-WC
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1dkAnk-0003AV-RC
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:09:09 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1dkAnk-00031e-KS; Tue, 22 Aug 2017 11:09:08 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1dkAnd-0004fk-J2; Tue, 22 Aug 2017 16:09:01 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 22 Aug 2017 16:08:45 +0100
Message-Id: <1503414539-28762-7-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 06/20] target/arm: Make BASEPRI register banked
 for v8M
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
X-TUID: llPIKyYUG7lc

Make the BASEPRI register banked if v8M security extensions are enabled.

Note that we do not yet implement the functionality of the new
AIRCR.PRIS bit (which allows the effect of the NS copy of BASEPRI to
be restricted).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 14 +++++++++++++-
 hw/intc/armv7m_nvic.c |  4 ++--
 target/arm/helper.c   | 10 ++++++----
 target/arm/machine.c  |  3 ++-
 4 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 436ca0d..0c28dfd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -72,6 +72,18 @@
 #define ARMV7M_EXCP_PENDSV  14
 #define ARMV7M_EXCP_SYSTICK 15
 
+/* For M profile, some registers are banked secure vs non-secure;
+ * these are represented as a 2-element array where the first element
+ * is the non-secure copy and the second is the secure copy.
+ * When the CPU does not have implement the security extension then
+ * only the first element is used.
+ * This means that the copy for the current security state can be
+ * accessed via env->registerfield[env->v7m.secure] (whether the security
+ * extension is implemented or not).
+ */
+#define M_REG_NS 0
+#define M_REG_S 1
+
 /* ARM-specific interrupt pending bits.  */
 #define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
 #define CPU_INTERRUPT_VIRQ  CPU_INTERRUPT_TGT_EXT_2
@@ -409,7 +421,7 @@ typedef struct CPUARMState {
     struct {
         uint32_t other_sp;
         uint32_t vecbase;
-        uint32_t basepri;
+        uint32_t basepri[2];
         uint32_t control;
         uint32_t ccr; /* Configuration and Control */
         uint32_t cfsr; /* Configurable Fault Status */
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index c0dbbad..2a41e5d 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -171,8 +171,8 @@ static inline int nvic_exec_prio(NVICState *s)
         running = -1;
     } else if (env->v7m.primask) {
         running = 0;
-    } else if (env->v7m.basepri > 0) {
-        running = env->v7m.basepri & nvic_gprio_mask(s);
+    } else if (env->v7m.basepri[env->v7m.secure] > 0) {
+        running = env->v7m.basepri[env->v7m.secure] & nvic_gprio_mask(s);
     } else {
         running = NVIC_NOEXC_PRIO; /* lower than any possible priority */
     }
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1debebc..1087f19 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8838,7 +8838,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
         return env->v7m.primask;
     case 17: /* BASEPRI */
     case 18: /* BASEPRI_MAX */
-        return env->v7m.basepri;
+        return env->v7m.basepri[env->v7m.secure];
     case 19: /* FAULTMASK */
         return env->v7m.faultmask;
     default:
@@ -8898,12 +8898,14 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         env->v7m.primask = val & 1;
         break;
     case 17: /* BASEPRI */
-        env->v7m.basepri = val & 0xff;
+        env->v7m.basepri[env->v7m.secure] = val & 0xff;
         break;
     case 18: /* BASEPRI_MAX */
         val &= 0xff;
-        if (val != 0 && (val < env->v7m.basepri || env->v7m.basepri == 0))
-            env->v7m.basepri = val;
+        if (val != 0 && (val < env->v7m.basepri[env->v7m.secure]
+                         || env->v7m.basepri[env->v7m.secure] == 0)) {
+            env->v7m.basepri[env->v7m.secure] = val;
+        }
         break;
     case 19: /* FAULTMASK */
         env->v7m.faultmask = val & 1;
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 745adae..8476efd 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -115,7 +115,7 @@ static const VMStateDescription vmstate_m = {
     .needed = m_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.vecbase, ARMCPU),
-        VMSTATE_UINT32(env.v7m.basepri, ARMCPU),
+        VMSTATE_UINT32(env.v7m.basepri[M_REG_NS], ARMCPU),
         VMSTATE_UINT32(env.v7m.control, ARMCPU),
         VMSTATE_UINT32(env.v7m.ccr, ARMCPU),
         VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
@@ -250,6 +250,7 @@ static const VMStateDescription vmstate_m_security = {
     .needed = m_security_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.v7m.secure, ARMCPU),
+        VMSTATE_UINT32(env.v7m.basepri[M_REG_S], ARMCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.7.4

