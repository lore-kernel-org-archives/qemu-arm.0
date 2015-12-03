Received: by 10.182.158.201 with SMTP id ww9csp3412425obb;
        Wed, 2 Dec 2015 16:19:10 -0800 (PST)
X-Received: by 10.140.241.146 with SMTP id m140mr8139389qhc.102.1449101950069;
        Wed, 02 Dec 2015 16:19:10 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v11si6061282qka.39.2015.12.02.16.19.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:19:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:60905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hc5-0004Gb-Qb
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:19:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc3-0004Bq-6u
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 19:19:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4Hc1-0001yb-Qh
	for qemu-arm@nongnu.org; Wed, 02 Dec 2015 19:19:07 -0500
Received: from mail-qg0-x232.google.com ([2607:f8b0:400d:c04::232]:34947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4Hbw-0001vz-Op; Wed, 02 Dec 2015 19:19:00 -0500
Received: by qgec40 with SMTP id c40so48206175qge.2;
	Wed, 02 Dec 2015 16:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4C9f7CQ48dSAegHBP2bHbh1jxQ36BTjo09GTUGKW/3M=;
	b=xYP019I4gU9PG5xarwWndnC8zN31GClbofCF4RlsZZDxbLxs4mExeXQAHFBGhbucI/
	N5tSqg7Pok+OrODAxcV5FMi1eCnMYtC8GUzYBnv9UFqY706oQkBDaynjDR5q0POKTsgP
	2rMBZkQaNSiqkqovC4+eaJzn03AsbyivOzJcpPNY+xcdz4gwIVnfU6Xl82uXnvk969JZ
	ceCcfxNAz/XatViy12/5BIdN4Zx+KAKVwCK74VtfBa6XsNL8+4MT3nQzokS5kJbPEmAz
	Qt+izhF8j8t9Aehif3w7DSZQQDMG+0G5wBvF9fRuAfwCMu54V9jEdVvzEtWleL2cY5cy
	N65A==
X-Received: by 10.140.31.73 with SMTP id e67mr7904104qge.46.1449101940327;
	Wed, 02 Dec 2015 16:19:00 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.18.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:18:59 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:28 -0500
Message-Id: <1449101933-24928-2-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::232
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-arm] [PATCH v2 01/26] armv7m: MRS/MSR handle unprivileged
	access
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vfFygTVwtYZ6

The MRS and MSR instruction handling isn't checking
the current permission level.

Prevent privlaged from changing writing EPSR fields.
Access to unknown/undefined special registers not
fatal (read 0, write ignored) w/ guest error message.
---
 target-arm/helper.c | 79 +++++++++++++++++++++++++----------------------------
 1 file changed, 37 insertions(+), 42 deletions(-)

diff --git a/target-arm/helper.c b/target-arm/helper.c
index afc4163..2c631e3 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7375,23 +7375,32 @@ uint32_t HELPER(get_r13_banked)(CPUARMState *env, uint32_t mode)
 
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
@@ -7403,40 +7412,26 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
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
@@ -7477,8 +7472,8 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
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

