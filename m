Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp730283wrq;
        Fri, 29 Jun 2018 06:31:29 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpck5keKk7J7y9yGS+xYbz1QOzdUQriFv1Yw8/QFUevtkeWn+oVIB0L21W+CUaEpqetRN3tP
X-Received: by 2002:a0c:9259:: with SMTP id 25-v6mr12991442qvz.239.1530279089019;
        Fri, 29 Jun 2018 06:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279089; cv=none;
        d=google.com; s=arc-20160816;
        b=Wd4SwDqao+rf+DsqzkQJ3gnGtQKhr2JmSrrXW64ZNVOBXmJFACjDrjAjXzTq3HPUx3
         WbGK3nmPtyCJfGQAs8COgKu07J8W8342EpHFMJNXXzdhz07aOl0VQKIJS/YtLcCypbdf
         n6oU5yt9njfxebTrzMJcOrmYn8hZMNC7CUxniaQ6RBFBBHfeckmgh4wiKv/r0VvKkpF2
         RuRxIMQWchjpzRXnpMdJLJEsrWjEWg7KHcEKucOjrzaLAZNFyuD7YSKFSGUpr77WJarj
         TSRpuDR6MyxmGeVDBgKLULWsPsWR2mYb5VcV1E8rQGnRAsXrQMqQZcmLSRq0d9sxhqar
         rMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=Jw4YCCQmvWGvS/emY+xN+siuS+n3CLh3w7yK4LLYH58=;
        b=0DCeJtzL1gsrXoldOmE3VydZo0mzwWlQYVWrm32g0IyfgN1fCn2a7/irtAvNhLHuJn
         nuREBM6YpxiUIi7TzbvBgqomwyMHJcvTCyGpO2z/PXkRocZ8F+LZix4imFZYPt942C7Z
         kPGpcZ40Qf3hlInk3fgkWCvzzO7TrkI+jB5KL81lMIQ6djz5oJM+ATN3HYAUVqkW7Iwv
         BI0wLYGwtd098hBqfe5c9XNFV9wMbZXhjaIvWdShBeGmLZM4GwmUAdkmvlunNuzd0pIJ
         KGrGfRZMpd/0K3KHi0Xrqm258ftHdahCKHXk8k8CzHdGcAYsiA6VtVkMh1bdxZaxG1vn
         UN1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=lf5D6Aoi;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IvFNyGOR;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=XXoreDuC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c33-v6si1306129qve.47.2018.06.29.06.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:31:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=lf5D6Aoi;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=IvFNyGOR;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=XXoreDuC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtUm-0007y6-D9
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:31:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU6-0007Zw-U7
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU3-0006q6-1M
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:46 -0400
Received: from greensocs.com ([193.104.36.180]:58614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU2-0006mO-A3; Fri, 29 Jun 2018 09:30:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 59AFA4434B3;
	Fri, 29 Jun 2018 15:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279036;
	bh=HwYjVSWnlKOVRNfYFf6N6iHysaScDzknQYqvQobDsn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lf5D6AoiPIfE1FmHFqPvPVgM3xIfzwS3HzAIhC09yl1ya1CF0m2VqMUzFpRbK09oh
	U06o4NH6zpf55LTBxTQ4ipuSD6oDJqFXYVtvts47+AL7zgebXDRVOrpNCI+sbPqcxV
	Ftts4ROJPk+3XRDPlIgouu3tG6uZqOKcvinCjc9o=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=IvFNyGOR;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=XXoreDuC
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IA7iBMmH6qLL; Fri, 29 Jun 2018 15:30:35 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 255C04434AF; Fri, 29 Jun 2018 15:30:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279035;
	bh=HwYjVSWnlKOVRNfYFf6N6iHysaScDzknQYqvQobDsn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IvFNyGOR0XrXasd40CSBDnVSnkEvrvDROZdbe0IJdiSNtvekSa9iG7PnGmkPnNmGp
	NiUr37d4fjoBuR+Lry7D/AXw+gw66rIlg2OM+AIFnd7Pg9XG2bmrmkbuLp1aZtsIrr
	4bwC3NvZa83DxDIdRREGp64lVYTfaS9WOT52osAs=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 381244434AC;
	Fri, 29 Jun 2018 15:30:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279034;
	bh=HwYjVSWnlKOVRNfYFf6N6iHysaScDzknQYqvQobDsn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XXoreDuChSOLCR65B85JIQA1/0iuf37INmj2e6KIPL5e3K63iA3oMfpseZxT/Rapm
	cCjHW10zXsKQFKaM2wS/Rztkit0V8v+UJLQrnzJ6wlgCgnSu47czt7P8uKVuLJ51x7
	BFX6JWP3/aIPZPXV/7sQH0vEkrL+0hl5Pp2uCk8U=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:41 +0200
Message-Id: <20180629132954.24269-8-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 07/20] intc/arm_gic: Add virtualization
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
X-TUID: KNPqdXPVj7sL

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
gic_get_lr_entry() tries to find the LR entry for a given (vCPU, irq)
pair. gic_get_lr_entry_nofail() is meant to be used in contexts where we
know for sure that the entry exists, so we can avoid the NULL check on
the returned pointer.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c      |  5 ++++
 hw/intc/gic_internal.h | 65 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index b2dd379bd2..f25d1b1270 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -61,6 +61,11 @@ static inline int gic_get_current_cpu(GICState *s)
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
diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
index 1aa888a576..4242a16bd4 100644
--- a/hw/intc/gic_internal.h
+++ b/hw/intc/gic_internal.h
@@ -129,6 +129,20 @@ REG32(GICH_LR63, 0x1fc)
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
@@ -164,4 +178,55 @@ static inline bool gic_is_vcpu(int cpu)
     return cpu >= GIC_NCPU;
 }
 
+static inline int gic_get_vcpu_real_id(int cpu)
+{
+    return (cpu >= GIC_NCPU) ? (cpu - GIC_NCPU) : cpu;
+}
+
+static inline bool gic_lr_entry_is_free(uint32_t entry)
+{
+    return (GICH_LR_STATE(entry) == GICH_LR_STATE_INVALID)
+        && (GICH_LR_HW(entry) || !GICH_LR_EOI(entry));
+}
+
+static inline bool gic_lr_entry_is_eoi(uint32_t entry)
+{
+    return (GICH_LR_STATE(entry) == GICH_LR_STATE_INVALID)
+        && !GICH_LR_HW(entry) && GICH_LR_EOI(entry);
+}
+
+/* Return a pointer on the LR entry for a given (irq,vcpu) pair.
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
+            (!gic_lr_entry_is_free(*entry))) {
+            return entry;
+        }
+    }
+
+    return NULL;
+}
+
+static inline bool gic_virq_is_valid(GICState *s, int irq, int vcpu)
+{
+    return gic_get_lr_entry(s, irq, vcpu) != NULL;
+}
+
+static inline uint32_t *gic_get_lr_entry_nofail(GICState *s, int irq, int vcpu)
+{
+    uint32_t *entry = gic_get_lr_entry(s, irq, vcpu);
+    assert(entry);
+
+    return entry;
+}
+
 #endif /* QEMU_ARM_GIC_INTERNAL_H */
-- 
2.17.1

