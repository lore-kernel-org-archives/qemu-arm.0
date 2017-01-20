Received: by 10.25.77.65 with SMTP id a62csp125231lfb;
        Fri, 20 Jan 2017 10:45:01 -0800 (PST)
X-Received: by 10.237.35.210 with SMTP id k18mr13113923qtc.219.1484937900917;
        Fri, 20 Jan 2017 10:45:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r49si5445183qta.172.2017.01.20.10.45.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Jan 2017 10:45:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cUeBG-00033p-3B
	for alex.bennee@linaro.org; Fri, 20 Jan 2017 13:44:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cUeBB-00033d-SW
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 13:44:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cUeBA-0002Ux-Ga
	for qemu-arm@nongnu.org; Fri, 20 Jan 2017 13:44:53 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48217)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cUeBA-0002QO-8Z; Fri, 20 Jan 2017 13:44:52 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cUeB2-00046h-GY; Fri, 20 Jan 2017 18:44:44 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 20 Jan 2017 18:44:38 +0000
Message-Id: <1484937883-1068-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
References: <1484937883-1068-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/6] armv7m: MRS/MSR: handle unprivileged access
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
Cc: Liviu Ionescu <ilg@livius.net>, Michael Davidsaver <mdavidsaver@gmail.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wKzGxkYU9eOg

From: Michael Davidsaver <mdavidsaver@gmail.com>

The MRS and MSR instruction handling has a number of flaws:
 * unprivileged accesses should only be able to read
   CONTROL and the xPSR subfields, and only write APSR
   (others RAZ/WI)
 * privileged access should not be able to write xPSR
   subfields other than APSR
 * accesses to unimplemented registers should log as
   guest errors, not abort QEMU

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
[PMM: rewrote commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 79 +++++++++++++++++++++++++----------------------------
 1 file changed, 37 insertions(+), 42 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7111c8c..ad23de3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8243,23 +8243,32 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 
 uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
 {
-    ARMCPU *cpu = arm_env_get_cpu(env);
+    uint32_t mask;
+    unsigned el = arm_current_el(env);
+
+    /* First handle registers which unprivileged can read */
+
+    switch (reg) {
+    case 0 ... 7: /* xPSR sub-fields */
+        mask = 0;
+        if ((reg & 1) && el) {
+            mask |= 0x000001ff; /* IPSR (unpriv. reads as zero) */
+        }
+        if (!(reg & 4)) {
+            mask |= 0xf8000000; /* APSR */
+        }
+        /* EPSR reads as zero */
+        return xpsr_read(env) & mask;
+        break;
+    case 20: /* CONTROL */
+        return env->v7m.control;
+    }
+
+    if (el == 0) {
+        return 0; /* unprivileged reads others as zero */
+    }
 
     switch (reg) {
-    case 0: /* APSR */
-        return xpsr_read(env) & 0xf8000000;
-    case 1: /* IAPSR */
-        return xpsr_read(env) & 0xf80001ff;
-    case 2: /* EAPSR */
-        return xpsr_read(env) & 0xff00fc00;
-    case 3: /* xPSR */
-        return xpsr_read(env) & 0xff00fdff;
-    case 5: /* IPSR */
-        return xpsr_read(env) & 0x000001ff;
-    case 6: /* EPSR */
-        return xpsr_read(env) & 0x0700fc00;
-    case 7: /* IEPSR */
-        return xpsr_read(env) & 0x0700edff;
     case 8: /* MSP */
         return env->v7m.current_sp ? env->v7m.other_sp : env->regs[13];
     case 9: /* PSP */
@@ -8271,40 +8280,26 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
         return env->v7m.basepri;
     case 19: /* FAULTMASK */
         return (env->daif & PSTATE_F) != 0;
-    case 20: /* CONTROL */
-        return env->v7m.control;
     default:
-        /* ??? For debugging only.  */
-        cpu_abort(CPU(cpu), "Unimplemented system register read (%d)\n", reg);
+        qemu_log_mask(LOG_GUEST_ERROR, "Attempt to read unknown special"
+                                       " register %d\n", reg);
         return 0;
     }
 }
 
 void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
 {
-    ARMCPU *cpu = arm_env_get_cpu(env);
+    if (arm_current_el(env) == 0 && reg > 7) {
+        /* only xPSR sub-fields may be written by unprivileged */
+        return;
+    }
 
     switch (reg) {
-    case 0: /* APSR */
-        xpsr_write(env, val, 0xf8000000);
-        break;
-    case 1: /* IAPSR */
-        xpsr_write(env, val, 0xf8000000);
-        break;
-    case 2: /* EAPSR */
-        xpsr_write(env, val, 0xfe00fc00);
-        break;
-    case 3: /* xPSR */
-        xpsr_write(env, val, 0xfe00fc00);
-        break;
-    case 5: /* IPSR */
-        /* IPSR bits are readonly.  */
-        break;
-    case 6: /* EPSR */
-        xpsr_write(env, val, 0x0600fc00);
-        break;
-    case 7: /* IEPSR */
-        xpsr_write(env, val, 0x0600fc00);
+    case 0 ... 7: /* xPSR sub-fields */
+        /* only APSR is actually writable */
+        if (reg & 4) {
+            xpsr_write(env, val, 0xf8000000); /* APSR */
+        }
         break;
     case 8: /* MSP */
         if (env->v7m.current_sp)
@@ -8345,8 +8340,8 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
         switch_v7m_sp(env, (val & 2) != 0);
         break;
     default:
-        /* ??? For debugging only.  */
-        cpu_abort(CPU(cpu), "Unimplemented system register write (%d)\n", reg);
+        qemu_log_mask(LOG_GUEST_ERROR, "Attempt to write unknown special"
+                                       " register %d\n", reg);
         return;
     }
 }
-- 
2.7.4

