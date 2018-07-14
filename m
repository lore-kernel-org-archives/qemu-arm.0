Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp649829wrq;
        Sat, 14 Jul 2018 10:17:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdI/jIqNIhmaXcf/DF8CjtQ3gxQSY8N38z0Or8rn4DCeJqkXyEgzRgJg0t2bLNhk3CNUU8p
X-Received: by 2002:a37:4904:: with SMTP id w4-v6mr9523231qka.85.1531588643899;
        Sat, 14 Jul 2018 10:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531588643; cv=none;
        d=google.com; s=arc-20160816;
        b=WjeT8hHvhxiussYS21WWFHE2wNF6icljIOj+WULiX1u6WRFSy7rVghOagAVIndNKNU
         1r+zk/X/c9swPN+7RqZRwPkS06dVJmvwIylDuSUgnUwwlPfPfbLshI9HwLw3JMDX7YEa
         +XZyzMYX9QK0AygCMcEhWCFJMC1bc2b5krAT+xNcHFkFsxyQO5znnMTetYE6WHCxBjpO
         dTdqyqeUR+EUEXkhjt62CBzTgiAYJEsPk6oivvdLjyXC9JLfQAUcb+Kbdc5PP3c23jIG
         mqrpoBRF6tRJFKg/LIKkEE7pAOz/TD4r6aq7CGukVbBiNjXcfPTQrmAFrTmkFvUnI0Vu
         X+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=5tB859hhX2Fq3bHsxxIXs1aZznphDtFll+P42xx+0a8=;
        b=JUEDGopbA1jAtoLowPPdp+G6GuAv7Z27nKWE7g7U/1dVADJDXLtDy1Vx/H3Hcpchvh
         hM2H12yIqjViWSO5sROQaeBPFbzcncUk8/rfq6A8Z8diRnnTSpVY83Re3LAFx+TknH/b
         YOXUSYPJZ3VoyxM3+k8KAh6WODz5lzdzqcvUQp7w4opHJfBlHbR39U6cs9YMkv8s7MCW
         WvKhPCY0UGqKuEW5GvPhZhQtAT1aOc9dZk3BDKQzTkJ3V2kSLG5uUQ6sqIQ5x5UV9tOV
         RFN/8m3XPjtCPgqBwoGx9HamlEEDj2HpIuIbAZuzaHMT2UzEAtEwfE++qaa+FMNDHNFj
         Nu+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=CFpB6jS6;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=L5XnKzbA;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=L5XnKzbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42-v6si9260402qvf.139.2018.07.14.10.17.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:17:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=CFpB6jS6;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=L5XnKzbA;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=L5XnKzbA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOAd-0006I8-B5
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:17:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9m-0005kA-Bl
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9j-0004Rm-TK
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:30 -0400
Received: from greensocs.com ([193.104.36.180]:57314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9j-0004QP-F8; Sat, 14 Jul 2018 13:16:27 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 9D366C7AF4;
	Sat, 14 Jul 2018 19:16:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588582;
	bh=xNjnMLYUIBx96PTSTbfrQ2nqtjoguZlGigq1zNkz3Ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CFpB6jS6VAaW/PweLXlxNEzqYmXGQjG27Bdv5rcCanEdZuczZnwzyN8LQPTnBcIy0
	XnBEZXA7kRiyiQT9v8DTjs9sNJHboWh/m7P3gZpeI4Sn8/0a6tAgKqMZnTb7tExRXE
	/PgqcEZytKa5/NBfCc7Ei3kJJn8fFbkHtSz6jowQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=L5XnKzbA;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=L5XnKzbA
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BZ5dYFPUE-k8; Sat, 14 Jul 2018 19:16:21 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id C00BEC7AF0; Sat, 14 Jul 2018 19:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588581;
	bh=xNjnMLYUIBx96PTSTbfrQ2nqtjoguZlGigq1zNkz3Ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L5XnKzbAnqHaYx4w7FzUW8EERhKhcAQnNNs3J80Zp/lUc8V5tzgnUCI+/0EH++5BJ
	YO2VmotBbTxr4wLKykUP2uhg8wkouoTxKKLp3Ex5uYsVlKBKajiduZthXAM04f5G0N
	EgDjl3zsdeez5FqRtmGxZkBg103INCupd9pdLh60=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0B04CC7ADD;
	Sat, 14 Jul 2018 19:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588581;
	bh=xNjnMLYUIBx96PTSTbfrQ2nqtjoguZlGigq1zNkz3Ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L5XnKzbAnqHaYx4w7FzUW8EERhKhcAQnNNs3J80Zp/lUc8V5tzgnUCI+/0EH++5BJ
	YO2VmotBbTxr4wLKykUP2uhg8wkouoTxKKLp3Ex5uYsVlKBKajiduZthXAM04f5G0N
	EgDjl3zsdeez5FqRtmGxZkBg103INCupd9pdLh60=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:48 +0200
Message-Id: <20180714171601.5734-8-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 07/20] intc/arm_gic: Add virtualization
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
X-TUID: haGyhZZCfRzy

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
---
 hw/intc/arm_gic.c      |  5 +++
 hw/intc/gic_internal.h | 75 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index aaa34426a1..1ac0fe740c 100644
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
index 1aa888a576..56e203aeb9 100644
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
@@ -164,4 +178,65 @@ static inline bool gic_is_vcpu(int cpu)
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
+    return NULL;
+}
+
 #endif /* QEMU_ARM_GIC_INTERNAL_H */
-- 
2.18.0

