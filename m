Received: by 10.182.158.201 with SMTP id ww9csp3415389obb;
        Wed, 2 Dec 2015 16:27:31 -0800 (PST)
X-Received: by 10.140.94.243 with SMTP id g106mr7777422qge.57.1449102451222;
        Wed, 02 Dec 2015 16:27:31 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v72si4234225qka.96.2015.12.02.16.27.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:27:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32770 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4HkA-0002e7-J1
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:27:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcB-0004Uy-QA
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcA-000242-HN
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:15 -0500
Received: from mail-qg0-x236.google.com ([2607:f8b0:400d:c04::236]:33496)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4HcA-00023V-4V; Wed, 02 Dec 2015 19:19:14 -0500
Received: by qgea14 with SMTP id a14so48165234qge.0;
	Wed, 02 Dec 2015 16:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KkU0qonUaHcvZgnVCA5raVQ8OqP9zzMRFmgq7EYUrpo=;
	b=KANcTOmvc8DHZIi9WR6G5Pp+GcEsjRrzuvqM53QyQy2tb3rmHPiP0GartLTG9uIzXB
	QoErujBs9kTeQjPPwPVdIeRlMDNf/JE+u7EqEaK0hVKPXNmW6IZWxwCBJNujIIvT36on
	hIPCjZhKTTd3xafkIluLXe4Y4f8lndFuf1GDAFANKGNPz33cXQqymejaiAPA1L/Tl1VL
	39PUbvHI9QobrlW8Z1OsOcK5ktcIqF0bC9JoaLWDW3eKdj0QPByu/GbZI3f32OY2eaYW
	auFDS7ivub4WWoFmjlO/CB4fNmboSaL2uW/R68iIOhFB695h65ezWRtNL647SP4GfmEe
	J7Sw==
X-Received: by 10.140.81.71 with SMTP id e65mr7697346qgd.27.1449101953788;
	Wed, 02 Dec 2015 16:19:13 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:13 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:48 -0500
Message-Id: <1449101933-24928-22-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::236
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 21/26] armv7m: CONTROL<1> handling
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
X-TUID: 8GUnjO2zviQG

The ARM states that this bit indicates the stack
being used, which in handler mode is always MSP.
Further CONTROL<1>==1 in handler mode is reserved.

With the TM4C always CONTROL<1>==0 in handler mode
which inconveniently prevents the handler from
knowing which stack thread mode was using...

This bit is a direct indication of which stack pointer
register is "aliased" to r13, so easiest to eliminate
the now redundant current_sp field.
---
 target-arm/cpu.h     |  1 -
 target-arm/helper.c  | 20 ++++++++++----------
 target-arm/machine.c |  1 -
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index b93f8ae..01c9cdb 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -402,7 +402,6 @@ typedef struct CPUARMState {
         uint32_t mmfar; /* MemManage Fault Address */
         uint32_t bfar; /* BusFault Address */
         unsigned mpu_hfnmiena; /* MPU_CTRL not mappable into SCTLR */
-        int current_sp;
         int exception;
         int exception_prio;
         unsigned pending;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index a5adf2d..2661da4 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -5362,14 +5362,14 @@ static uint32_t v7m_pop(CPUARMState *env)
 }
 
 /* Switch to V7M main or process stack pointer.  */
-static void switch_v7m_sp(CPUARMState *env, int process)
+static void switch_v7m_sp(CPUARMState *env, bool process)
 {
     uint32_t tmp;
-    if (env->v7m.current_sp != process) {
+    if (!!(env->v7m.control & 2) != process) {
         tmp = env->v7m.other_sp;
         env->v7m.other_sp = env->regs[13];
         env->regs[13] = tmp;
-        env->v7m.current_sp = process;
+        env->v7m.control = (env->v7m.control & ~2) | (process ? 2 : 0);
     }
 }
 
@@ -5457,7 +5457,7 @@ static void do_v7m_exception_exit(CPUARMState *env)
     xpsr = v7m_pop(env);
     xpsr_write(env, xpsr, 0xfffffdff);
 
-    assert(env->v7m.exception!=-42);
+    assert(env->v7m.exception != -42);
 
     /* Undo stack alignment.  */
     if (xpsr & 0x200)
@@ -5528,7 +5528,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     arm_log_exception(cs->exception_index);
 
     lr = 0xfffffff1;
-    if (env->v7m.current_sp)
+    if (env->v7m.control & 2)
         lr |= 4;
     if (env->v7m.exception == 0)
         lr |= 8;
@@ -7550,9 +7550,9 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
 
     switch (reg) {
     case 8: /* MSP */
-        return env->v7m.current_sp ? env->v7m.other_sp : env->regs[13];
+        return env->v7m.control & 2 ? env->v7m.other_sp : env->regs[13];
     case 9: /* PSP */
-        return env->v7m.current_sp ? env->regs[13] : env->v7m.other_sp;
+        return env->v7m.control & 2 ? env->regs[13] : env->v7m.other_sp;
     case 16: /* PRIMASK */
         return (env->daif & PSTATE_I) != 0;
     case 17: /* BASEPRI */
@@ -7582,13 +7582,13 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
         }
         break;
     case 8: /* MSP */
-        if (env->v7m.current_sp)
+        if (env->v7m.control & 2)
             env->v7m.other_sp = val;
         else
             env->regs[13] = val;
         break;
     case 9: /* PSP */
-        if (env->v7m.current_sp)
+        if (env->v7m.control & 2)
             env->regs[13] = val;
         else
             env->v7m.other_sp = val;
@@ -7616,8 +7616,8 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
         }
         break;
     case 20: /* CONTROL */
-        env->v7m.control = val & 3;
         switch_v7m_sp(env, (val & 2) != 0);
+        env->v7m.control = (env->v7m.control & ~1) | (val & 1);
         break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR, "Attempt to write unknown special"
diff --git a/target-arm/machine.c b/target-arm/machine.c
index 8852410..dab1626 100644
--- a/target-arm/machine.c
+++ b/target-arm/machine.c
@@ -105,7 +105,6 @@ static const VMStateDescription vmstate_m = {
         VMSTATE_UINT32(env.v7m.hfsr, ARMCPU),
         VMSTATE_UINT32(env.v7m.mmfar, ARMCPU),
         VMSTATE_UINT32(env.v7m.bfar, ARMCPU),
-        VMSTATE_INT32(env.v7m.current_sp, ARMCPU),
         VMSTATE_UINT32(env.v7m.mpu_hfnmiena, ARMCPU),
         VMSTATE_INT32(env.v7m.exception, ARMCPU),
         VMSTATE_END_OF_LIST()
-- 
2.1.4

