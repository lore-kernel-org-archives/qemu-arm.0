Received: by 10.182.158.201 with SMTP id ww9csp3416096obb;
        Wed, 2 Dec 2015 16:29:22 -0800 (PST)
X-Received: by 10.55.217.147 with SMTP id q19mr7596797qkl.109.1449102562577;
        Wed, 02 Dec 2015 16:29:22 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g35si1464069qgf.53.2015.12.02.16.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Dec 2015 16:29:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:32795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a4Hly-0006SM-5T
	for alex.bennee@linaro.org; Wed, 02 Dec 2015 19:29:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcC-0004W7-Da
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1a4HcA-00024Z-Uf
	for qemu-devel@nongnu.org; Wed, 02 Dec 2015 19:19:16 -0500
Received: from mail-qg0-x236.google.com ([2607:f8b0:400d:c04::236]:34343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1a4HcA-00024K-Pi; Wed, 02 Dec 2015 19:19:14 -0500
Received: by qgeb1 with SMTP id b1so48725710qge.1;
	Wed, 02 Dec 2015 16:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jI4yO/lJO9WQ9OMhTd/8kVEF32P8WZgtLhbuDv1dFtk=;
	b=P/TXMHLQwjU8McuLuVBf6s/n+DtRblvA0xvXV/IAAI53MBK6byRX5B2OYkW2Iw7YEJ
	fwdIB2XQz3KRFw1YvkWl8k29n+iEb/i235h6J2PU7tazyhZOYnkXGjnCz+cCyYT6ILxn
	LE5jaUOeK40McJz0zC5Cz4cPa4bz7TdykmBaBQ9MJ4ejaNvpIze8hQR2jy8LtY6WADK5
	dfIrWYtSvma9HBCEJifjLx5JiSBCVx1PRMqultgI3214P6PwgiS0Ls7LwpHRBrIsxcDl
	SilGZ3Q2R3TMrnDJLEcgt5lW1AcKZUuxa4oTH+RwNv1Kc3++04y1tjKdnaeQLnbLuZQN
	mjiA==
X-Received: by 10.140.195.18 with SMTP id q18mr8208980qha.44.1449101954443;
	Wed, 02 Dec 2015 16:19:14 -0800 (PST)
Received: from desktop.local (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	e31sm2276326qge.11.2015.12.02.16.19.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 16:19:14 -0800 (PST)
From: Michael Davidsaver <mdavidsaver@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed,  2 Dec 2015 19:18:49 -0500
Message-Id: <1449101933-24928-23-git-send-email-mdavidsaver@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::236
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [Qemu-devel] [PATCH v2 22/26] armv7m: priority field mask
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
X-TUID: 3pQB6d+pKjq0

Many v7m CPUs don't implement all of the 8 bits
of the priority fields.  Typically, only the
top N bits are available.  Existing practice
implies that writes to unimplemented
bits will be ignore, and read as zero.

This allows a guest to discover the implemented
bits by writing 0xff to (eg. basepri).
The value read back will have only the available
bits set.
---
 hw/intc/armv7m_nvic.c | 2 ++
 target-arm/cpu-qom.h  | 6 ++++++
 target-arm/cpu.c      | 7 +++++++
 target-arm/helper.c   | 6 ++++--
 4 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 2b42d9d..e2410a3 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -149,6 +149,8 @@ void set_prio(NVICState *s, unsigned irq, uint8_t prio)
     assert(irq > 3); /* only use for configurable prios */
     assert(irq < NVIC_MAX_VECTORS);
 
+    prio &= s->cpu->v7m_priority_mask;
+
     s->vectors[irq].raw_prio = prio;
     s->vectors[irq].prio_group = (prio>>(s->prigroup+1));
     s->vectors[irq].prio_sub = irq + (prio & submask) * NVIC_MAX_VECTORS;
diff --git a/target-arm/cpu-qom.h b/target-arm/cpu-qom.h
index 25fb1ce..79cf591 100644
--- a/target-arm/cpu-qom.h
+++ b/target-arm/cpu-qom.h
@@ -108,6 +108,12 @@ typedef struct ARMCPU {
     /* PMSAv7 MPU number of supported regions */
     uint32_t pmsav7_dregion;
 
+    /* Some v7-M targets don't impliment the full 8 bits
+     * of the priority fields.  Writes to unimplimented
+     * bits are treated as zero (guest can discover mask).
+     */
+    uint8_t v7m_priority_mask;
+
     /* PSCI conduit used to invoke PSCI methods
      * 0 - disabled, 1 - smc, 2 - hvc
      */
diff --git a/target-arm/cpu.c b/target-arm/cpu.c
index 8b85888..27cf482 100644
--- a/target-arm/cpu.c
+++ b/target-arm/cpu.c
@@ -527,6 +527,9 @@ static Property arm_cpu_has_mpu_property =
 static Property arm_cpu_pmsav7_dregion_property =
             DEFINE_PROP_UINT32("pmsav7-dregion", ARMCPU, pmsav7_dregion, 16);
 
+static Property armv7m_priority_mask_property =
+        DEFINE_PROP_UINT8("priority-mask", ARMCPU, v7m_priority_mask, 0xff);
+
 static void arm_cpu_post_init(Object *obj)
 {
     ARMCPU *cpu = ARM_CPU(obj);
@@ -565,6 +568,10 @@ static void arm_cpu_post_init(Object *obj)
         }
     }
 
+    if (IS_M(&cpu->env) && arm_feature(&cpu->env, ARM_FEATURE_V7)) {
+        qdev_property_add_static(DEVICE(obj), &armv7m_priority_mask_property,
+                                 &error_abort);
+    }
 }
 
 static void arm_cpu_finalizefn(Object *obj)
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 2661da4..c890b3a 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -7569,6 +7569,8 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
 
 void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
 {
+    ARMCPU *cpu = arm_env_get_cpu(env);
+
     if (arm_current_el(env) == 0 && reg > 7) {
         /* only xPSR sub-fields may be written by unprivileged */
         return;
@@ -7601,10 +7603,10 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t reg, uint32_t val)
         }
         break;
     case 17: /* BASEPRI */
-        env->v7m.basepri = val & 0xff;
+        env->v7m.basepri = val & cpu->v7m_priority_mask;
         break;
     case 18: /* BASEPRI_MAX */
-        val &= 0xff;
+        val &= cpu->v7m_priority_mask;
         if (val != 0 && (val < env->v7m.basepri || env->v7m.basepri == 0))
             env->v7m.basepri = val;
         break;
-- 
2.1.4

