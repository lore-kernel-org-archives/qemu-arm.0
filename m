Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp649660wrq;
        Sat, 14 Jul 2018 10:17:08 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdD+LMXs8s2u+pVJKg+6FAXjch8HeP0+0llKNj1lTwWa4VJUWt+2iOqW7oKlPNuaVFhc3Ni
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr9035244qkm.75.1531588628011;
        Sat, 14 Jul 2018 10:17:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588628; cv=none;
        d=google.com; s=arc-20160816;
        b=bJJ0SMDQo2pX5taVrXzFrC4cPA1H0Z7acnA8HsiSFw0djBnYcXWhr+A5Y1LmVRN7ne
         fWffDFl94j2XR3BzoURqR6rhSfWwY//43DuZ7g5ViaM9eaZCP2DX65o0lR4bx038Q+m4
         xw9IHi8gcjS0x5PwD0DFXfWl6cqlkQaBVtwI8USddWcHYD9/mlEhmNAr4354JlnRPn3Z
         sZI7UprVgTjTq2DIkGoQ9JXurdYQs5JoQnxva22+iJTt6Pza83Xi1iZ87Ow9bYPeh4jT
         ORItw+bLO08DO33DmibnQB1LtiPpqlCcnkDMIBWfJNS5NPxGgsMlAf0D7XTUlZzFiH21
         E3tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=gYV+Nn4cXhDBTtQowEFHeOZMzoKGLjATJX7aFPHkm6E=;
        b=BVEu8+ICJCq15BEuQMWlA7pCSu3oWdNrQKvkQ8iGPzxfCxiFx+61JGT8Y3DZ42f+PE
         42fwOZWvVz3vwoXN6k6UfdO1NM4D5WHIZs13O+KD6Bur5v8zXZkg2FjkMd10FB1iPkbt
         vmGrzzkOm2fHr46qlNpMFTIoMmIOsEZ9iL7tLCIjvKhjS2Outlp5J1/Smgq3CAesCQCZ
         AK0WMin36sNFRH792OKVlefH+tLc8Tf3Qu5Lc4cydKLYfx/XyIZtpjvsIn2N2R0YTM0u
         8KUszV10SZELNIFk0CGeap4es+BD4yKEBqmj3Cy5Z5PLypW2ePi5C68B2m9BEaKXGhah
         2O7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=aSonkLPV;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="WvmDr/4f";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pSkVRANX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n32-v6si272285qta.356.2018.07.14.10.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=aSonkLPV;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="WvmDr/4f";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=pSkVRANX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42051 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOAN-00064W-FO
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:17:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9m-0005k6-A6
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9j-0004S0-U1
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:30 -0400
Received: from greensocs.com ([193.104.36.180]:57315)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9j-0004QV-FW; Sat, 14 Jul 2018 13:16:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 2AA7A388FC7;
	Sat, 14 Jul 2018 19:16:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588585;
	bh=mj0E0fGdjtwxaKm72+hIt1Ta3Is13HKiu08Sv8mBdX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aSonkLPVvhfmmIBhIXUpyupL7iuOWNPWMQL1hSpJmVjnRF7p0UKqUYDiavr21R0AL
	kOGOgG23RU5x5UzU0K5wYY6mGe1iYmtgmPqUU6AHWxw6C/m/u4AgExxdS6Sad2Ggbn
	dRZ5CfpEGfN2xtEaW+xvZt3G9bdhAbmgqRPYSWn4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=WvmDr/4f;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=pSkVRANX
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHKlFjokaTHh; Sat, 14 Jul 2018 19:16:24 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 08A60C7AF9; Sat, 14 Jul 2018 19:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588584;
	bh=mj0E0fGdjtwxaKm72+hIt1Ta3Is13HKiu08Sv8mBdX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WvmDr/4fEr6lsWQqhg2MOF8TJT0fYDvOpSlWDkp68FzREaueWDq4AUIaiFPHBjArN
	w+uprJjQ7KJxH0DUdOCiO6Y8l20fBvCOA3AAWXSlbdXQqrT6qwbmAVMmdaAGliaeo2
	N26n637EGR36l3p+j/4NgLC1Vr1VocdKs6E+X9/8=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 380EDC7ADD;
	Sat, 14 Jul 2018 19:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588583;
	bh=mj0E0fGdjtwxaKm72+hIt1Ta3Is13HKiu08Sv8mBdX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pSkVRANXxPgN9r4RnsN8S9z4Z+vikdbIHM5/4gRFdMYA/ihdX1HpX0a+YR63Hzm05
	E0qxMEMnieOFI7dUkWC+XUmwwTJqocSyPAb30FPNueHVKw8JriUC987dJkNdNM5RLU
	/5arTWWfALcfdMvS/Xbtr/mWggfkQYYGo17C8skI=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:50 +0200
Message-Id: <20180714171601.5734-10-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 09/20] intc/arm_gic: Add virtualization
 enabled IRQ helper functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, mark.burton@greensocs.com,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uG4XQ/NhapAe

Add some helper functions to gic_internal.h to get or change the state
of an IRQ. When the current CPU is not a vCPU, the call is forwarded to
the GIC distributor. Otherwise, it acts on the list register matching
the IRQ in the current CPU virtual interface.

gic_clear_active can have a side effect on the distributor, even in the
vCPU case, when the correponding LR has the HW field set.

Use those functions in the CPU interface code path to prepare for the
vCPU interface implementation.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c      | 32 +++++++---------
 hw/intc/gic_internal.h | 83 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 18 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 53cc257ed8..ad241d12c2 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -222,7 +222,8 @@ static uint16_t gic_get_current_pending_irq(GICState *s, int cpu,
     uint16_t pending_irq = s->current_pending[cpu];
 
     if (pending_irq < GIC_MAXIRQ && gic_has_groups(s)) {
-        int group = GIC_DIST_TEST_GROUP(pending_irq, (1 << cpu));
+        int group = gic_test_group(s, pending_irq, cpu);
+
         /* On a GIC without the security extensions, reading this register
          * behaves in the same way as a secure access to a GIC with them.
          */
@@ -253,7 +254,7 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
 
     if (gic_has_groups(s) &&
         !(s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) &&
-        GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
+        gic_test_group(s, irq, cpu)) {
         bpr = s->abpr[cpu] - 1;
         assert(bpr >= 0);
     } else {
@@ -266,7 +267,7 @@ static int gic_get_group_priority(GICState *s, int cpu, int irq)
      */
     mask = ~0U << ((bpr & 7) + 1);
 
-    return GIC_DIST_GET_PRIORITY(irq, cpu) & mask;
+    return gic_get_priority(s, irq, cpu) & mask;
 }
 
 static void gic_activate_irq(GICState *s, int cpu, int irq)
@@ -279,14 +280,14 @@ static void gic_activate_irq(GICState *s, int cpu, int irq)
     int regno = preemption_level / 32;
     int bitno = preemption_level % 32;
 
-    if (gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
+    if (gic_has_groups(s) && gic_test_group(s, irq, cpu)) {
         s->nsapr[regno][cpu] |= (1 << bitno);
     } else {
         s->apr[regno][cpu] |= (1 << bitno);
     }
 
     s->running_priority[cpu] = prio;
-    GIC_DIST_SET_ACTIVE(irq, 1 << cpu);
+    gic_set_active(s, irq, cpu);
 }
 
 static int gic_get_prio_from_apr_bits(GICState *s, int cpu)
@@ -355,7 +356,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
         return irq;
     }
 
-    if (GIC_DIST_GET_PRIORITY(irq, cpu) >= s->running_priority[cpu]) {
+    if (gic_get_priority(s, irq, cpu) >= s->running_priority[cpu]) {
         DPRINTF("ACK, pending interrupt (%d) has insufficient priority\n", irq);
         return 1023;
     }
@@ -364,8 +365,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
         /* Clear pending flags for both level and edge triggered interrupts.
          * Level triggered IRQs will be reasserted once they become inactive.
          */
-        GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
-                                                             : cm);
+        gic_clear_pending(s, irq, cpu);
         ret = irq;
     } else {
         if (irq < GIC_NR_SGIS) {
@@ -377,9 +377,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
             src = ctz32(s->sgi_pending[irq][cpu]);
             s->sgi_pending[irq][cpu] &= ~(1 << src);
             if (s->sgi_pending[irq][cpu] == 0) {
-                GIC_DIST_CLEAR_PENDING(irq,
-                                       GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
-                                                                : cm);
+                gic_clear_pending(s, irq, cpu);
             }
             ret = irq | ((src & 0x7) << 10);
         } else {
@@ -387,8 +385,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
              * interrupts. (level triggered interrupts with an active line
              * remain pending, see gic_test_pending)
              */
-            GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
-                                                                 : cm);
+            gic_clear_pending(s, irq, cpu);
             ret = irq;
         }
     }
@@ -544,8 +541,7 @@ static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
 
 static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 {
-    int cm = 1 << cpu;
-    int group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
+    int group = gic_has_groups(s) && gic_test_group(s, irq, cpu);
 
     if (!gic_eoi_split(s, cpu, attrs)) {
         /* This is UNPREDICTABLE; we choose to ignore it */
@@ -559,7 +555,7 @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         return;
     }
 
-    GIC_DIST_CLEAR_ACTIVE(irq, cm);
+    gic_clear_active(s, irq, cpu);
 }
 
 static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
@@ -594,7 +590,7 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
         }
     }
 
-    group = gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
+    group = gic_has_groups(s) && gic_test_group(s, irq, cpu);
 
     if (gic_cpu_ns_access(s, cpu, attrs) && !group) {
         DPRINTF("Non-secure EOI for Group0 interrupt %d ignored\n", irq);
@@ -610,7 +606,7 @@ static void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
 
     /* In GICv2 the guest can choose to split priority-drop and deactivate */
     if (!gic_eoi_split(s, cpu, attrs)) {
-        GIC_DIST_CLEAR_ACTIVE(irq, cm);
+        gic_clear_active(s, irq, cpu);
     }
     gic_update(s);
 }
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index 56e203aeb9..d772d621fd 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -143,6 +143,13 @@ REG32(GICH_LR63, 0x1fc)
 #define GICH_LR_GROUP(entry) (FIELD_EX32(entry, GICH_LR0, Grp1))
 #define GICH_LR_HW(entry) (FIELD_EX32(entry, GICH_LR0, HW))
 
+#define GICH_LR_CLEAR_PENDING(entry) \
+        ((entry) &= ~(GICH_LR_STATE_PENDING << R_GICH_LR0_State_SHIFT))
+#define GICH_LR_SET_ACTIVE(entry) \
+        ((entry) |= (GICH_LR_STATE_ACTIVE << R_GICH_LR0_State_SHIFT))
+#define GICH_LR_CLEAR_ACTIVE(entry) \
+        ((entry) &= ~(GICH_LR_STATE_ACTIVE << R_GICH_LR0_State_SHIFT))
+
 /* Valid bits for GICC_CTLR for GICv1, v1 with security extensions,
  * GICv2 and GICv2 with security extensions:
  */
@@ -239,4 +246,80 @@ static inline uint32_t *gic_get_lr_entry(GICState *s, int irq, int vcpu)
     return NULL;
 }
 
+static inline bool gic_test_group(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
+        return GICH_LR_GROUP(*entry);
+    } else {
+        return GIC_DIST_TEST_GROUP(irq, 1 << cpu);
+    }
+}
+
+static inline void gic_clear_pending(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
+        GICH_LR_CLEAR_PENDING(*entry);
+    } else {
+        /* Clear pending state for both level and edge triggered
+         * interrupts. (level triggered interrupts with an active line
+         * remain pending, see gic_test_pending)
+         */
+        GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ? ALL_CPU_MASK
+                                                             : (1 << cpu));
+    }
+}
+
+static inline void gic_set_active(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
+        GICH_LR_SET_ACTIVE(*entry);
+    } else {
+        GIC_DIST_SET_ACTIVE(irq, 1 << cpu);
+    }
+}
+
+static inline void gic_clear_active(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
+        GICH_LR_CLEAR_ACTIVE(*entry);
+
+        if (GICH_LR_HW(*entry)) {
+            /* Hardware interrupt. We must forward the deactivation request to
+             * the distributor.
+             */
+            int phys_irq = GICH_LR_PHYS_ID(*entry);
+            int rcpu = gic_get_vcpu_real_id(cpu);
+
+            if (phys_irq < GIC_NR_SGIS || phys_irq >= GIC_MAXIRQ) {
+                /* UNPREDICTABLE behaviour, we choose to ignore the request */
+                return;
+            }
+
+            /* This is equivalent to a NS write to DIR on the physical CPU
+             * interface. Hence group0 interrupt deactivation is ignored if
+             * the GIC is secure.
+             */
+            if (!s->security_extn || GIC_DIST_TEST_GROUP(phys_irq, 1 << rcpu)) {
+                GIC_DIST_CLEAR_ACTIVE(phys_irq, 1 << rcpu);
+            }
+        }
+    } else {
+        GIC_DIST_CLEAR_ACTIVE(irq, 1 << cpu);
+    }
+}
+
+static inline int gic_get_priority(GICState *s, int irq, int cpu)
+{
+    if (gic_is_vcpu(cpu)) {
+        uint32_t *entry = gic_get_lr_entry(s, irq, cpu);
+        return GICH_LR_PRIORITY(*entry);
+    } else {
+        return GIC_DIST_GET_PRIORITY(irq, cpu);
+    }
+}
+
 #endif /* QEMU_ARM_GIC_INTERNAL_H */
-- 
2.18.0

