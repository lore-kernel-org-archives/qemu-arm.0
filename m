Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507206wru;
        Fri, 27 Jul 2018 02:55:33 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeO1Gwu0qcEaNCWMZIhCs/FnTLPdGnnxug0HT2sAADQJHp4PMGoCOLfoPACWZozb8leld7a
X-Received: by 2002:ac8:3531:: with SMTP id y46-v6mr5201034qtb.92.1532685333518;
        Fri, 27 Jul 2018 02:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685333; cv=none;
        d=google.com; s=arc-20160816;
        b=rtVI5mBLvyoSd9/c3I7Fns5vEkEWe5ydtaFk/M+3RCJ6AyuIEvKkTM0oMRw0GJPKfh
         uKdECRwrwnpL5OlFlBwekOUM1SWKOI/uXMFrJBWSk2JqrECP7NiPx1uCkIrugzsu4KOD
         3yBcjSr5hoBQlTSEsie51bIOfmlPJuBACu8FSt5hZw9NSlautRb2t+v7HFvtWfP2912I
         Clwf0q5ENGYjG8ZUcSvIsQUTOUrBDEOWVaCXpOVkwhYuSCwRy7NncneW8CCZ5MH2wwGi
         XiHfbxqQNaZ/mxiSen6eOUuR+PNEmCLiX+99Dkg+rZ0wmg3n5VdGosIbivHTIlWOuW1f
         2o5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=ct3HXDX9VRsXJEA2ixWCk7iZeIlpE3tfSW31nVZTZAs=;
        b=pzmWFIJInppxfUU/EwYl6lZxfrPqXUJf+ehumdY5/Z6xRXHeyvQAOn1BMA1H2lBTpJ
         Zdg4iK2l1RdMXYBbUXg/nLpCw5GSqXnfo7MISwAr4w4NE21/12FRgDySNx0NCic58t/Q
         eFm+JO8EHertbfBShZc1JWmOM2wWeTUaspsWx85Mlrl7fax2u9jjhC3dI5YXZZW+lz6+
         MtZEpCeSGkFEtVwMr3v6rUmKN819g4mFGesexTx1oaaGU3jAGeg6on227JdT4mvGSf6h
         bQlRFlZ0k108wEBJqTja4W9UPMJyCVoTVanbciuvBP5IJeV0+RBKwuWLPqmSdGXte8my
         sZaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gfjbCp4P;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Fo+EoMuO;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Fo+EoMuO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d23-v6si3406115qtp.373.2018.07.27.02.55.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:55:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=gfjbCp4P;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Fo+EoMuO;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=Fo+EoMuO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizTA-0004Ow-W0
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:55:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSc-0003WB-GF
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006AN-8C
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:54:58 -0400
Received: from greensocs.com ([193.104.36.180]:47518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSY-00068j-SN; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id BAB3D443573;
	Fri, 27 Jul 2018 11:54:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685287;
	bh=5wWi0/l9uiiL4aZjpWYX1GFAUVZ40KgXixAKCyknCK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gfjbCp4PYTaroGqAn19iLuNH2P5++m/WElURhTPleQDRmU0tuxBIu8iOhEgUeSIvI
	FC8HyRM4ddFgR/5R9zpzFIcQIY0b+XVpX9tNYN+MbSg5uAN/9c+xAfK2f02I6DL4Zo
	FV7hhIWwQ60VjH7tQQ/BXGpRh2Y0M7OKf4PiR1K4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Fo+EoMuO;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Fo+EoMuO
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNS0Ebf84BDQ; Fri, 27 Jul 2018 11:54:46 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id D757F44355C; Fri, 27 Jul 2018 11:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685285;
	bh=5wWi0/l9uiiL4aZjpWYX1GFAUVZ40KgXixAKCyknCK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fo+EoMuOZ7RCHjpXTq0IaiRAUWBF8W76uUigqoBti1bwul1edWwv4c9yiGKkjfXtK
	5VG5BcvVA0gJdC6gi/n4ItrROVbhlvLV/VVXFCp00MAfAdbBF9yRP1IOmH+nGybkIZ
	hE/L1nUs3Likr88iIad58yN37ZPMiaUz9y7FHQk8=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 7DCFC443485;
	Fri, 27 Jul 2018 11:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685285;
	bh=5wWi0/l9uiiL4aZjpWYX1GFAUVZ40KgXixAKCyknCK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fo+EoMuOZ7RCHjpXTq0IaiRAUWBF8W76uUigqoBti1bwul1edWwv4c9yiGKkjfXtK
	5VG5BcvVA0gJdC6gi/n4ItrROVbhlvLV/VVXFCp00MAfAdbBF9yRP1IOmH+nGybkIZ
	hE/L1nUs3Likr88iIad58yN37ZPMiaUz9y7FHQk8=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:08 +0200
Message-Id: <20180727095421.386-8-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 07/20] intc/arm_gic: Add virtualization
 extensions helper macros and functions
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
X-TUID: 5EDnhfPgFuLk

Add some helper macros and functions related to the virtualization
extensions to gic_internal.h.

The GICH_LR_* macros help extracting specific fields of a list register
value. The only tricky one is the priority field as only the MSB are
stored. The value must be shifted accordingly to obtain the correct
priority value.

gic_is_vcpu() and gic_get_vcpu_real_id() help with (v)CPU id manipulation
to abstract the fact that vCPU id are in the range
[ GIC_NCPU; (GIC_NCPU + num_cpu) [.

gic_lr_* and gic_virq_is_valid() help with the list registers.
gic_get_lr_entry() returns the LR entry for a given (vCPU, irq) pair. It
is meant to be used in contexts where we know for sure that the entry
exists, so we assert that entry is actually found, and the caller can
avoid the NULL check on the returned pointer.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c      |  5 +++
 hw/intc/gic_internal.h | 74 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 5231579985..41141fee53 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -59,10 +59,15 @@ static inline int gic_get_current_cpu(GICState *s)
         return current_cpu->cpu_index;
     }
     return 0;
 }
 
+static inline int gic_get_current_vcpu(GICState *s)
+{
+    return gic_get_current_cpu(s) + GIC_NCPU;
+}
+
 /* Return true if this GIC config has interrupt groups, which is
  * true if we're a GICv2, or a GICv1 with the security extensions.
  */
 static inline bool gic_has_groups(GICState *s)
 {
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index 1aa888a576..cc5acc5d41 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -127,10 +127,24 @@ REG32(GICH_LR63, 0x1fc)
     (R_GICH_LR0_VirtualID_MASK | R_GICH_LR0_PhysicalID_MASK | \
      R_GICH_LR0_CPUID_MASK | R_GICH_LR0_EOI_MASK | \
      R_GICH_LR0_Priority_MASK | R_GICH_LR0_State_MASK | \
      R_GICH_LR0_Grp1_MASK | R_GICH_LR0_HW_MASK)
 
+#define GICH_LR_STATE_INVALID         0
+#define GICH_LR_STATE_PENDING         1
+#define GICH_LR_STATE_ACTIVE          2
+#define GICH_LR_STATE_ACTIVE_PENDING  3
+
+#define GICH_LR_VIRT_ID(entry) (FIELD_EX32(entry, GICH_LR0, VirtualID))
+#define GICH_LR_PHYS_ID(entry) (FIELD_EX32(entry, GICH_LR0, PhysicalID))
+#define GICH_LR_CPUID(entry) (FIELD_EX32(entry, GICH_LR0, CPUID))
+#define GICH_LR_EOI(entry) (FIELD_EX32(entry, GICH_LR0, EOI))
+#define GICH_LR_PRIORITY(entry) (FIELD_EX32(entry, GICH_LR0, Priority) << 3)
+#define GICH_LR_STATE(entry) (FIELD_EX32(entry, GICH_LR0, State))
+#define GICH_LR_GROUP(entry) (FIELD_EX32(entry, GICH_LR0, Grp1))
+#define GICH_LR_HW(entry) (FIELD_EX32(entry, GICH_LR0, HW))
+
 /* Valid bits for GICC_CTLR for GICv1, v1 with security extensions,
  * GICv2 and GICv2 with security extensions:
  */
 #define GICC_CTLR_V1_MASK    0x1
 #define GICC_CTLR_V1_S_MASK  0x1f
@@ -162,6 +176,66 @@ static inline bool gic_test_pending(GICState *s, int irq, int cm)
 static inline bool gic_is_vcpu(int cpu)
 {
     return cpu >= GIC_NCPU;
 }
 
+static inline int gic_get_vcpu_real_id(int cpu)
+{
+    return (cpu >= GIC_NCPU) ? (cpu - GIC_NCPU) : cpu;
+}
+
+/* Return true if the given vIRQ state exists in a LR and is either active or
+ * pending and active.
+ *
+ * This function is used to check that a guest's `end of interrupt' or
+ * `interrupts deactivation' request is valid, and matches with a LR of an
+ * already acknowledged vIRQ (i.e. has the active bit set in its state).
+ */
+static inline bool gic_virq_is_valid(GICState *s, int irq, int vcpu)
+{
+    int cpu = gic_get_vcpu_real_id(vcpu);
+    int lr_idx;
+
+    for (lr_idx = 0; lr_idx < s->num_lrs; lr_idx++) {
+        uint32_t *entry = &s->h_lr[lr_idx][cpu];
+
+        if ((GICH_LR_VIRT_ID(*entry) == irq) &&
+            (GICH_LR_STATE(*entry) & GICH_LR_STATE_ACTIVE)) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+/* Return a pointer on the LR entry matching the given vIRQ.
+ *
+ * This function is used to retrieve an LR for which we know for sure that the
+ * corresponding vIRQ exists in the current context (i.e. its current state is
+ * not `invalid'):
+ *   - Either the corresponding vIRQ has been validated with gic_virq_is_valid()
+ *     so it is `active' or `active and pending',
+ *   - Or it was pending and has been selected by gic_get_best_virq(). It is now
+ *     `pending', `active' or `active and pending', depending on what the guest
+ *     already did with this vIRQ.
+ *
+ * Having multiple LRs with the same VirtualID leads to UNPREDICTABLE
+ * behaviour in the GIC. We choose to return the first one that matches.
+ */
+static inline uint32_t *gic_get_lr_entry(GICState *s, int irq, int vcpu)
+{
+    int cpu = gic_get_vcpu_real_id(vcpu);
+    int lr_idx;
+
+    for (lr_idx = 0; lr_idx < s->num_lrs; lr_idx++) {
+        uint32_t *entry = &s->h_lr[lr_idx][cpu];
+
+        if ((GICH_LR_VIRT_ID(*entry) == irq) &&
+            (GICH_LR_STATE(*entry) != GICH_LR_STATE_INVALID)) {
+            return entry;
+        }
+    }
+
+    g_assert_not_reached();
+}
+
 #endif /* QEMU_ARM_GIC_INTERNAL_H */
-- 
2.18.0

