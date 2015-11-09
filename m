Received: by 10.182.105.169 with SMTP id gn9csp901310obb;
        Sun, 8 Nov 2015 17:16:14 -0800 (PST)
X-Received: by 10.55.74.7 with SMTP id x7mr26752239qka.71.1447031774241;
        Sun, 08 Nov 2015 17:16:14 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f143si9310038qhc.30.2015.11.08.17.16.14
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 17:16:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zvb49-00060W-Rh
	for alex.bennee@linaro.org; Sun, 08 Nov 2015 20:16:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1O-0001KW-4I
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1Zvb1J-0007t4-34
	for qemu-devel@nongnu.org; Sun, 08 Nov 2015 20:13:21 -0500
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:34278)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1Zvb1I-0007sV-TH; Sun, 08 Nov 2015 20:13:16 -0500
Received: by qkcn129 with SMTP id n129so65854091qkc.1;
	Sun, 08 Nov 2015 17:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BbdhP65eqMnAIukaHzvR3HRm1jiehdbpos4l4gkiW3s=;
	b=N06M9xeSKciCmB31tJl1zNmr6mKMi3UZAsnC6SvgNwxK8Fg8T9mhgRIGKrguH5YNue
	SAUhGxAlCjya0MFKGrPESW4V9focPZrZx9NHAvhx3q2htZbZPEPH9PNlLJGay5xxLCGl
	rVhJpzlKJEqB8j1yhSG9LS6NKyC1x89EffKmFR3Pavc8BKiRI37KQIu6qqYeYSVXMxUQ
	6TGLcQnWEqrHuok3PT1GjOozx/2ZnFm8gPDYT2GCgOly4xKHXlX59zCsvq5LoinVkpuP
	cbXqm3ZTSDDfT5UJpWSnHCnwHlwMd8JL9t4jAWNBz58vog5CvZnOkNoPgukDb23zhNo3
	ysRw==
X-Received: by 10.55.200.132 with SMTP id t4mr26602105qkl.78.1447031596462;
	Sun, 08 Nov 2015 17:13:16 -0800 (PST)
Received: from localhost.localdomain (ool-182df582.dyn.optonline.net.
	[24.45.245.130])
	by smtp.gmail.com with ESMTPSA id g97sm3915552qge.6.2015.11.08.17.13.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 17:13:16 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 20:11:28 -0500
Message-Id: <1447031505-12477-2-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
References: <1447031505-12477-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::233
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH 01/18] armv7m: MRS/MSR handle unprivileged
	access
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZzlduRO+aOhQ

The MRS and MSR instruction handling isn't checking
the current permission level.

Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
---
 target-arm/helper.c | 79 +++++++++++++++++++++++++----------------------------
 1 file changed, 37 insertions(+), 42 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index 4ecae61..4408100 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7365,23 +7365,32 @@ uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
 
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
+        if ((reg&1) && el) {
+            mask |= 0x000001ff; /* IPSR (unpriv. reads as zero) */
+        }
+        if (!(reg&4)) {
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
@@ -7393,40 +7402,26 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
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
+        if (reg&4) {
+            xpsr_write(env, val, 0xf8000000); /* APSR */
+        }
         break;
     case 8: /* MSP */
         if (env->v7m.current_sp)
@@ -7467,8 +7462,8 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
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
2.1.4

