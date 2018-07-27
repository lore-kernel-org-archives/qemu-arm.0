Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp507426wru;
        Fri, 27 Jul 2018 02:55:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpebt3ASBx+oefkiodnGRKr2OUBYaWiTHksumZAODo9B7Pvzfkup94ULT3V1TRiLOHv4dpoB
X-Received: by 2002:a37:1649:: with SMTP id g70-v6mr5018224qkh.137.1532685351242;
        Fri, 27 Jul 2018 02:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532685351; cv=none;
        d=google.com; s=arc-20160816;
        b=pzrFgmjSWPHENToY0igKTbycduOgYX0URvSNLTTfyXA8B/PuvNy41QS1jBfAGUn6t6
         9wnO/fDkCqaaqd8Vhm7tcSbCdD8IzWufyNv8fjpC5fSrasTQP1CqwMX116HWn3fEhNpf
         yCsU4zU8JfozSS1/lzNaDSI0UHm+/ig+Pt93+YPiAhUIS3L+yRi2OesU1WedphlA1pKv
         zIoYREpeRNHZeyhGx/dxYn0xSZmMok5tOeEeZsx1QRboMsCPDWGycspX62QNGd3XJ8HO
         M7ACFEAA3UFLw/z3wH1Cua77pTbNe02FvZNwxuBY0FYD9qCu4Eql9EfDsF34FsaEeoRw
         vUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=5rmhkdPNuELQl3KgmBVV5wWwjo1Pt3YjsTrFOqQaE10=;
        b=l8MkvrL/Mm5N5QN7muPbhcjUBfUziAqH52hMj3mLIgze3f5uW+sVtY2P8kTaKbwLY+
         c7ooL94Y6U7t9Tql1A+DjQIb7GEH2rY2U/oe8yWUSDRUXp2iid3kmkaydkr6VkJGjn+8
         ZlOXDihpoXaROO0r50YakVFqczkk3wMdX0v5liedYSl6UwjwIfiMF9xtI0kStEbv7UA+
         citM4N5d2d6QdsN3VE42MAfkWBIWl8gB5+qNlojymzvgrZseSAQXGFSa3OmomJjswuob
         kXogk8lwgP2uz5xyRMAdEFKSPwpTjTQFoKy5Yj+MnPgHzRu8Jmhsl/EUr2ZK25qMBpv+
         oP9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7AjKhycw;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qVEoA2GY;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=1m14VJX+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h48-v6si627312qta.340.2018.07.27.02.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jul 2018 02:55:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=7AjKhycw;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qVEoA2GY;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=1m14VJX+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fizTS-0004f6-LM
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 05:55:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSg-0003ep-8q
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1fizSZ-0006C6-Nc
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 05:55:02 -0400
Received: from greensocs.com ([193.104.36.180]:47516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1fizSZ-00068b-BK; Fri, 27 Jul 2018 05:54:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 81649400DC8;
	Fri, 27 Jul 2018 11:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685291;
	bh=D8nOeM0hkgP3m8t/j+HxFvspboGSK9VoL5Iu0bUzWvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7AjKhycwAUjMZ0yNuH3kIcXvZRNNP74WFUMHvtETWe2GS5JbzQI0MmLHpV98OZwnF
	Hcc76O5WMpiBRE5dPXk9UbFsEYoIfU4137AgLxMEE7tkI4kStUA80Qzb8HYzYaN9J7
	2BOVCyENdDFTTz68rOJ3J6QmJ5k5kGdG80MrBJmI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=qVEoA2GY;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=1m14VJX+
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rkv04sM-VRLO; Fri, 27 Jul 2018 11:54:50 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 2CC8F443572; Fri, 27 Jul 2018 11:54:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685289;
	bh=D8nOeM0hkgP3m8t/j+HxFvspboGSK9VoL5Iu0bUzWvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qVEoA2GYjlbIuVeU26aSpUuQq//eSJmvSx9lgnXC6kSxErpB3ItUqC2RWIG0WQd3X
	yhBmGDxFqkE5Uudj9N731y4b+eYEdaLv17nMGiGS/XCisu5+NzkztDl7LyM+lNOzcn
	9LKyMNWSatTBbgaBJBPMKNh4KIEfnv0h564F5Dog=
Received: from michell-laptop.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id AB854443485;
	Fri, 27 Jul 2018 11:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1532685288;
	bh=D8nOeM0hkgP3m8t/j+HxFvspboGSK9VoL5Iu0bUzWvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1m14VJX+LEtX3SiEWcK1eWe75C19HvrbWw8ucreOBcZ22Z6MayUMOCx7PG4zd2Ruh
	BzHQqhukUfYvOXDcX++mAyHtKG+5VDP2/P7bQzf9SHtQIny8pySdsIVtfCqXHVXmvD
	wFQBXgrZ2b2s1d9s2tnF6y74JUynizIUaKAWyJRk=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Jul 2018 11:54:16 +0200
Message-Id: <20180727095421.386-16-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v5 15/20] intc/arm_gic: Implement the virtual
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
X-TUID: GwmlhZudlC/U

Implement the read and write functions for the virtual interface of the
virtualization extensions in the GICv2.

One mirror region per CPU is also created, which maps to that specific
CPU id. This is required by the GIC architecture specification.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 235 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 233 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 7ee2e6bcbb..6063196487 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -145,10 +145,28 @@ static void gic_update(GICState *s)
         qemu_set_irq(s->parent_irq[cpu], irq_level);
         qemu_set_irq(s->parent_fiq[cpu], fiq_level);
     }
 }
 
+/* Return true if this LR is empty, i.e. the corresponding bit
+ * in ELRSR is set.
+ */
+static inline bool gic_lr_entry_is_free(uint32_t entry)
+{
+    return (GICH_LR_STATE(entry) == GICH_LR_STATE_INVALID)
+        && (GICH_LR_HW(entry) || !GICH_LR_EOI(entry));
+}
+
+/* Return true if this LR should trigger an EOI maintenance interrupt, i.e. the
+ * corrsponding bit in EISR is set.
+ */
+static inline bool gic_lr_entry_is_eoi(uint32_t entry)
+{
+    return (GICH_LR_STATE(entry) == GICH_LR_STATE_INVALID)
+        && !GICH_LR_HW(entry) && GICH_LR_EOI(entry);
+}
+
 static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
                                  int cm, int target)
 {
     if (level) {
         GIC_DIST_SET_LEVEL(irq, cm);
@@ -1570,10 +1588,204 @@ static MemTxResult gic_thisvcpu_write(void *opaque, hwaddr addr,
     GICState *s = (GICState *)opaque;
 
     return gic_cpu_write(s, gic_get_current_vcpu(s), addr, value, attrs);
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
+static MemTxResult gic_hyp_read(void *opaque, int cpu, hwaddr addr,
+                                uint64_t *data, MemTxAttrs attrs)
+{
+    GICState *s = ARM_GIC(opaque);
+    int vcpu = cpu + GIC_NCPU;
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
+static MemTxResult gic_hyp_write(void *opaque, int cpu, hwaddr addr,
+                                 uint64_t value, MemTxAttrs attrs)
+{
+    GICState *s = ARM_GIC(opaque);
+    int vcpu = cpu + GIC_NCPU;
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
+static MemTxResult gic_thiscpu_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
+                                    unsigned size, MemTxAttrs attrs)
+{
+    GICState *s = (GICState *)opaque;
+
+    return gic_hyp_read(s, gic_get_current_cpu(s), addr, data, attrs);
+}
+
+static MemTxResult gic_thiscpu_hyp_write(void *opaque, hwaddr addr,
+                                     uint64_t value, unsigned size,
+                                     MemTxAttrs attrs)
+{
+    GICState *s = (GICState *)opaque;
+
+    return gic_hyp_write(s, gic_get_current_cpu(s), addr, value, attrs);
+}
+
+static MemTxResult gic_do_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
+                                    unsigned size, MemTxAttrs attrs)
+{
+    GICState **backref = (GICState **)opaque;
+    GICState *s = *backref;
+    int id = (backref - s->backref);
+
+    return gic_hyp_read(s, id, addr, data, attrs);
+}
+
+static MemTxResult gic_do_hyp_write(void *opaque, hwaddr addr,
+                                     uint64_t value, unsigned size,
+                                     MemTxAttrs attrs)
+{
+    GICState **backref = (GICState **)opaque;
+    GICState *s = *backref;
+    int id = (backref - s->backref);
+
+    return gic_hyp_write(s, id + GIC_NCPU, addr, value, attrs);
+
+}
+
 static const MemoryRegionOps gic_ops[2] = {
     {
         .read_with_attrs = gic_dist_read,
         .write_with_attrs = gic_dist_write,
         .endianness = DEVICE_NATIVE_ENDIAN,
@@ -1591,21 +1803,27 @@ static const MemoryRegionOps gic_cpu_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
 static const MemoryRegionOps gic_virt_ops[2] = {
     {
-        .read_with_attrs = NULL,
-        .write_with_attrs = NULL,
+        .read_with_attrs = gic_thiscpu_hyp_read,
+        .write_with_attrs = gic_thiscpu_hyp_write,
         .endianness = DEVICE_NATIVE_ENDIAN,
     },
     {
         .read_with_attrs = gic_thisvcpu_read,
         .write_with_attrs = gic_thisvcpu_write,
         .endianness = DEVICE_NATIVE_ENDIAN,
     }
 };
 
+static const MemoryRegionOps gic_viface_ops = {
+    .read_with_attrs = gic_do_hyp_read,
+    .write_with_attrs = gic_do_hyp_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
 static void arm_gic_realize(DeviceState *dev, Error **errp)
 {
     /* Device instance realize function for the GIC sysbus device */
     int i;
     GICState *s = ARM_GIC(dev);
@@ -1643,10 +1861,23 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
         s->backref[i] = s;
         memory_region_init_io(&s->cpuiomem[i+1], OBJECT(s), &gic_cpu_ops,
                               &s->backref[i], "gic_cpu", 0x100);
         sysbus_init_mmio(sbd, &s->cpuiomem[i+1]);
     }
+
+    /* Extra core-specific regions for virtual interfaces. This is required by
+     * the GICv2 specification.
+     */
+    if (s->virt_extn) {
+        for (i = 0; i < s->num_cpu; i++) {
+            memory_region_init_io(&s->vifaceiomem[i + 1], OBJECT(s),
+                                  &gic_viface_ops, &s->backref[i],
+                                  "gic_viface", 0x1000);
+            sysbus_init_mmio(sbd, &s->vifaceiomem[i + 1]);
+        }
+    }
+
 }
 
 static void arm_gic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-- 
2.18.0

