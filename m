Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp731530wrq;
        Fri, 29 Jun 2018 06:32:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcGtSfku3iygievA8YfFd3TSFCTKxUrrBSX5RIplmiDL1M30XNVcykGjTBrqYeXcKOWUSTi
X-Received: by 2002:ac8:3531:: with SMTP id y46-v6mr13092689qtb.92.1530279154745;
        Fri, 29 Jun 2018 06:32:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530279154; cv=none;
        d=google.com; s=arc-20160816;
        b=ynHLEL2zzPaAv92UkyiSz12TuMKBWNNA89aVsQCFxJJlTvVwbgmp3G/hmWR4ybstvt
         MrARi8cuYwZr8vcwCvduHcXKE2KUUm89j/BR4ou65MYkFzFmR2AbhEtHiz25S3NYJ5pG
         iHxFfdf2R+WyytmqmYWN68+4og99NKNjlzX1AdvvNXjNq+0202KAQKea4z5G4NInF35M
         e3l9Bl3vQ6lpIzcZzm8v3CFwN77JlRaFR+nx+jhwvdbkXlipA9ptLtXWNyKFljq+addR
         8DPAUUMOq6ikaUtqW5X2dsOjPh5PpXVi6oEz7jud52Ob/bbv9EwMJYkyyOXV+tPN/Jwn
         PGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=Cva0u1hgMuAHcCpvH3nQJslKbX/UudQs13A5TBhNcPM=;
        b=HdsbKQCUlPVTmcjnfjRgjWjlJSyu1ew4vjSjV1b0qwyf+M7s6VZvHCFuJJ4UgfRjSB
         aC2ziuFYg6rv+KVrtsfUuwkylbeWRjRHS+ZAriw+diyAflomhJ2aGto0pda+mkFFZKPq
         t7aKQvUW9+zqijtWp/jZ9YQzEjRrISjIrW8lm29Uzz8qFPGGzBz7Cdi/Cg55UyPk2mAC
         cBhqyWHG4uL6kr62WqE2GMFUyHkCsg8CzrzNtSJLMLp2uzw/+3ux3JEjQzZcOtLXSLZ7
         Y22kjGAEB4jHq8R3frtb0GQ2djDFDkGTflU2bD80Jtu6M6oOyseqZTurhaqjvo6aCB24
         XluQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="tWmI//A8";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=3ucvNkp0;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=3ucvNkp0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t48-v6si8918264qte.236.2018.06.29.06.32.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Jun 2018 06:32:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="tWmI//A8";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=3ucvNkp0;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=3ucvNkp0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYtVq-0000JE-2n
	for alex.bennee@linaro.org; Fri, 29 Jun 2018 09:32:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU9-0007aI-Ls
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fYtU3-0006sR-Dc
	for qemu-arm@nongnu.org; Fri, 29 Jun 2018 09:30:49 -0400
Received: from greensocs.com ([193.104.36.180]:58633)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fYtU3-0006pe-28; Fri, 29 Jun 2018 09:30:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 1B7FB4434B9;
	Fri, 29 Jun 2018 15:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279041;
	bh=2fqRjrhfWPHXK4V2w3JDrR9pnrx5hmv8Gk3+ejSLdqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tWmI//A8JVvSrp3Tt+NlAap70OvU7ITNHhP+JtjO71Ythb5pZAJmw4qIZuHkkWRj8
	jsaY0n8wbU1HTGE0NOjG2wS+eOQ27smjKB22MrjYTOKgC7IG7QGyYB/LOtE+6T1+mq
	6ictB8kE6EX9snlHnUu1UMf0KSNtkM+gzExQFcmQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=3ucvNkp0;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=3ucvNkp0
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dFzOXjb6y8b0; Fri, 29 Jun 2018 15:30:39 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id BEB9A4434BB; Fri, 29 Jun 2018 15:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279039;
	bh=2fqRjrhfWPHXK4V2w3JDrR9pnrx5hmv8Gk3+ejSLdqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=3ucvNkp0Za+iCc673B9NBTbvg39SFMs5dueGSUmmlXdh0EAj94aZrKJvqJWmWy66D
	ZgSnlPrOL5F04ylLZG5zN10pdRlHWGeGXoN10grDhrGnYjjXBzXbVa1B8XxgQFnPvF
	VSXjL3WuMiDnClew1PpJWK8zkOOT2CRR9bHPM9cI=
Received: from michell-laptop.hive.antfield.fr
	(LFbn-LYO-1-488-36.w2-7.abo.wanadoo.fr [2.7.77.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 35AB04434B5;
	Fri, 29 Jun 2018 15:30:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1530279039;
	bh=2fqRjrhfWPHXK4V2w3JDrR9pnrx5hmv8Gk3+ejSLdqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=3ucvNkp0Za+iCc673B9NBTbvg39SFMs5dueGSUmmlXdh0EAj94aZrKJvqJWmWy66D
	ZgSnlPrOL5F04ylLZG5zN10pdRlHWGeGXoN10grDhrGnYjjXBzXbVa1B8XxgQFnPvF
	VSXjL3WuMiDnClew1PpJWK8zkOOT2CRR9bHPM9cI=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 Jun 2018 15:29:49 +0200
Message-Id: <20180629132954.24269-16-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180629132954.24269-1-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v3 15/20] intc/arm_gic: Implement the virtual
 interface registers
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
X-TUID: WfIU0WqDO1JW

Implement the read and write functions for the virtual interface of the
virtualization extensions in the GICv2.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
---
 hw/intc/arm_gic.c | 161 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 9bbd544a5c..a29042f291 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -1530,6 +1530,163 @@ static MemTxResult gic_do_vcpu_write(void *opaque, hwaddr addr,
 
 }
 
+static uint32_t gic_compute_eisr(GICState *s, int cpu, int lr_start)
+{
+    int lr_idx;
+    uint32_t ret = 0;
+
+    for (lr_idx = lr_start; lr_idx < s->num_lrs; lr_idx++) {
+        uint32_t *entry = &s->h_lr[lr_idx][cpu];
+        ret = deposit32(ret, lr_idx - lr_start, 1,
+                        gic_lr_entry_is_eoi(*entry));
+    }
+
+    return ret;
+}
+
+static uint32_t gic_compute_elrsr(GICState *s, int cpu, int lr_start)
+{
+    int lr_idx;
+    uint32_t ret = 0;
+
+    for (lr_idx = lr_start; lr_idx < s->num_lrs; lr_idx++) {
+        uint32_t *entry = &s->h_lr[lr_idx][cpu];
+        ret = deposit32(ret, lr_idx - lr_start, 1,
+                        gic_lr_entry_is_free(*entry));
+    }
+
+    return ret;
+}
+
+static void gic_vmcr_write(GICState *s, uint32_t value, MemTxAttrs attrs)
+{
+    int vcpu = gic_get_current_vcpu(s);
+    uint32_t ctlr;
+    uint32_t abpr;
+    uint32_t bpr;
+    uint32_t prio_mask;
+
+    ctlr = FIELD_EX32(value, GICH_VMCR, VMCCtlr);
+    abpr = FIELD_EX32(value, GICH_VMCR, VMABP);
+    bpr = FIELD_EX32(value, GICH_VMCR, VMBP);
+    prio_mask = FIELD_EX32(value, GICH_VMCR, VMPriMask) << 3;
+
+    gic_set_cpu_control(s, vcpu, ctlr, attrs);
+    s->abpr[vcpu] = MAX(abpr, GIC_VIRT_MIN_ABPR);
+    s->bpr[vcpu] = MAX(bpr, GIC_VIRT_MIN_BPR);
+    gic_set_priority_mask(s, vcpu, prio_mask, attrs);
+}
+
+static MemTxResult gic_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
+                                unsigned size, MemTxAttrs attrs)
+{
+    GICState *s = ARM_GIC(opaque);
+    int cpu = gic_get_current_cpu(s);
+    int vcpu = gic_get_current_vcpu(s);
+
+    switch (addr) {
+    case A_GICH_HCR: /* Hypervisor Control */
+        *data = s->h_hcr[cpu];
+        break;
+
+    case A_GICH_VTR: /* VGIC Type */
+        *data = FIELD_DP32(0, GICH_VTR, ListRegs, s->num_lrs - 1);
+        *data = FIELD_DP32(*data, GICH_VTR, PREbits,
+                           GIC_VIRT_MAX_GROUP_PRIO_BITS - 1);
+        *data = FIELD_DP32(*data, GICH_VTR, PRIbits,
+                           (7 - GIC_VIRT_MIN_BPR) - 1);
+        break;
+
+    case A_GICH_VMCR: /* Virtual Machine Control */
+        *data = FIELD_DP32(0, GICH_VMCR, VMCCtlr,
+                           extract32(s->cpu_ctlr[vcpu], 0, 10));
+        *data = FIELD_DP32(*data, GICH_VMCR, VMABP, s->abpr[vcpu]);
+        *data = FIELD_DP32(*data, GICH_VMCR, VMBP, s->bpr[vcpu]);
+        *data = FIELD_DP32(*data, GICH_VMCR, VMPriMask,
+                           extract32(s->priority_mask[vcpu], 3, 5));
+        break;
+
+    case A_GICH_MISR: /* Maintenance Interrupt Status */
+        *data = s->h_misr[cpu];
+        break;
+
+    case A_GICH_EISR0: /* End of Interrupt Status 0 and 1 */
+    case A_GICH_EISR1:
+        *data = gic_compute_eisr(s, cpu, (addr - A_GICH_EISR0) * 8);
+        break;
+
+    case A_GICH_ELRSR0: /* Empty List Status 0 and 1 */
+    case A_GICH_ELRSR1:
+        *data = gic_compute_elrsr(s, cpu, (addr - A_GICH_ELRSR0) * 8);
+        break;
+
+    case A_GICH_APR: /* Active Priorities */
+        *data = s->h_apr[cpu];
+        break;
+
+    case A_GICH_LR0 ... A_GICH_LR63: /* List Registers */
+    {
+        int lr_idx = (addr - A_GICH_LR0) / 4;
+
+        if (lr_idx > s->num_lrs) {
+            *data = 0;
+        } else {
+            *data = s->h_lr[lr_idx][cpu];
+        }
+        break;
+    }
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "gic_hyp_read: Bad offset %" HWADDR_PRIx "\n", addr);
+        return MEMTX_OK;
+    }
+
+    return MEMTX_OK;
+}
+
+static MemTxResult gic_hyp_write(void *opaque, hwaddr addr, uint64_t value,
+                                 unsigned size, MemTxAttrs attrs)
+{
+    GICState *s = ARM_GIC(opaque);
+    int cpu = gic_get_current_cpu(s);
+    int vcpu = gic_get_current_vcpu(s);
+
+    switch (addr) {
+    case A_GICH_HCR: /* Hypervisor Control */
+        s->h_hcr[cpu] = value & GICH_HCR_MASK;
+        break;
+
+    case A_GICH_VMCR: /* Virtual Machine Control */
+        gic_vmcr_write(s, value, attrs);
+        break;
+
+    case A_GICH_APR: /* Active Priorities */
+        s->h_apr[cpu] = value;
+        s->running_priority[vcpu] = gic_get_prio_from_apr_bits(s, vcpu);
+        break;
+
+    case A_GICH_LR0 ... A_GICH_LR63: /* List Registers */
+    {
+        int lr_idx = (addr - A_GICH_LR0) / 4;
+
+        if (lr_idx > s->num_lrs) {
+            return MEMTX_OK;
+        }
+
+        s->h_lr[lr_idx][cpu] = value & GICH_LR_MASK;
+        break;
+    }
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "gic_hyp_write: Bad offset %" HWADDR_PRIx "\n", addr);
+        return MEMTX_OK;
+    }
+
+    return MEMTX_OK;
+}
+
 static const MemoryRegionOps gic_ops[2] = {
     {
         .read_with_attrs = gic_dist_read,
@@ -1551,8 +1708,8 @@ static const MemoryRegionOps gic_cpu_ops = {
 
 static const MemoryRegionOps gic_virt_ops[2] = {
     {
-        .read_with_attrs = NULL,
-        .write_with_attrs = NULL,
+        .read_with_attrs = gic_hyp_read,
+        .write_with_attrs = gic_hyp_write,
         .endianness = DEVICE_NATIVE_ENDIAN,
     },
     {
-- 
2.17.1

