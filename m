Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp654318wrq;
        Sat, 14 Jul 2018 10:23:54 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcw2Gjhi6u6WFNq09RcqI4u/LwRV5/P9QYBwII1yRZe5d+vu0VLcENEztiMr9g3985Ff95I
X-Received: by 2002:ac8:3f8a:: with SMTP id d10-v6mr9947493qtk.238.1531589034738;
        Sat, 14 Jul 2018 10:23:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531589034; cv=none;
        d=google.com; s=arc-20160816;
        b=qiNUtlf65kguHjFhfwKx+N41pZydJ11dy5WWeZ5cLNUwlsK0QX3SUmbU/6Q4mPbbQ0
         cq1+oknHn3dA8Crt0x60ASsQWs8zNZma6yvJP6t76wjQVYKX8vhWqBdHYUPHoJl3Y4QY
         cjbMioZQ1LoO2eR9LJnT5hPALKVf6WUSeY70L3nrSZ8sWRMv4X7clKIL9dKq6U+fzEN1
         e6BXOJr2YgQskbDK0VWcp3kOu7pa51VWXQ+ylkAJApL6JSsHaj4esJygl/P6KIZ55qpx
         7qpcAsx1DD5psQl7iF3tXjnPS3X0pkhPLFmK++cUqhoLLKlDX4eklOV2di7fskG69HQR
         MaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature:arc-authentication-results;
        bh=g6m9BGPQSEkon3TVccmSW2ES++DMFqvnSSaj/+ueM1Y=;
        b=fJv/oOcrANi+eXy0FITNg1Iit7NM5zkHl6kVLdp5DLFLttQAacfPqFCb3phOnn1wy5
         1/bcXkwUPL92kg6dRkB/Jd+9NsfQ6AzfkhxhC+3JDzQFwrNTV39LyTAuZvAirGnjH+xJ
         oBRMP1SgVqE678BddKGOJidDbhZla0OZZx72LkPLflXjzfvsUsNKIX9/JBmA1iGuHB5P
         UOy/Fhgn24dpteoeo3DWEBnnmN29qFF/8oj/lEWm+8KofN4YlJwS0uV2MpWNVK/eVbwK
         tqer/3LVVGsTdU0uylNC2epfLKPv+Rn1izBcBBbllQe3fQngvprIR0d0D+u42oENrU75
         krPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qTx2Ofnm;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=V47TOg7Q;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=kCpViizu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5-v6si8177037qvi.177.2018.07.14.10.23.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 14 Jul 2018 10:23:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=qTx2Ofnm;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=V47TOg7Q;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=kCpViizu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1feOGw-00033g-4A
	for alex.bennee@linaro.org; Sat, 14 Jul 2018 13:23:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9u-0005nD-CT
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1feO9n-0004Ww-Ez
	for qemu-arm@nongnu.org; Sat, 14 Jul 2018 13:16:35 -0400
Received: from greensocs.com ([193.104.36.180]:57359)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1feO9m-0004Vu-Ua; Sat, 14 Jul 2018 13:16:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 67AB8C7AF9;
	Sat, 14 Jul 2018 19:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588590;
	bh=SKtJqMG+GH1kcHIFSEAAr3x3C2DWg3274Gh33dT4l8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qTx2OfnmgHfhPOLZlHgIDJZuXgUUZyYVXWVjtUKaTEqgmCq/wylS7EN2AC+na9nQv
	Yz2VR71A2bJXeFY6pSFPRuniDTv0k+UKq0q0aR7ECS3SzcC/0b40Ue0449wCWxE7+F
	Waq+bCoJsvPPqw+fUknh9+CaYhNzW77/HSMfnS6Q=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=V47TOg7Q;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=kCpViizu
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xlXcmYzqB2qb; Sat, 14 Jul 2018 19:16:29 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 022DCC7AF4; Sat, 14 Jul 2018 19:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588589;
	bh=SKtJqMG+GH1kcHIFSEAAr3x3C2DWg3274Gh33dT4l8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V47TOg7QRDXCFvasllnBxDf9M+Glw2bNfNXgc+vEYC2DYFWZjjY+/+QhazOGOeA1l
	0F+/zpLg3q4whQ+P5wfVt7Nk15H+HTXyEB/i4Nn/l+Ky/2XsHyJUOzmOnpiQxUpmq2
	XKS9Zfp/YaL3RSd3uLbBAfgqXEclkT+eOFmTYkyM=
Received: from localhost.localdomain (unknown [105.98.38.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0D612C7AE3;
	Sat, 14 Jul 2018 19:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1531588588;
	bh=SKtJqMG+GH1kcHIFSEAAr3x3C2DWg3274Gh33dT4l8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kCpViizu+jvrJ6rq4nshvmkb1fiCqI6/DNiW1rSQE9IJ882fO7BO44N8cmNBezjnW
	/XXUI4bduoTbCEkusDSt7KVH6+88RRFq0e4VTPYH68pi+L5qyyButHOxnfhXGhekpR
	RBQuhAVV1Xql177JfAZEuUFaoSjWFgNnbAQTukMM=
From: Luc Michel <luc.michel@greensocs.com>
To: qemu-devel@nongnu.org
Date: Sat, 14 Jul 2018 19:15:56 +0200
Message-Id: <20180714171601.5734-16-luc.michel@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180714171601.5734-1-luc.michel@greensocs.com>
References: <20180714171601.5734-1-luc.michel@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 15/20] intc/arm_gic: Implement the virtual
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
X-TUID: tXDe3kPWnOVk

Implement the read and write functions for the virtual interface of the
virtualization extensions in the GICv2.

Signed-off-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gic.c | 235 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 233 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index be44015c39..d8e9cf0a3a 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -147,6 +147,24 @@ static void gic_update(GICState *s)
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
@@ -1531,6 +1549,200 @@ static MemTxResult gic_thisvcpu_write(void *opaque, hwaddr addr,
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
@@ -1552,8 +1764,8 @@ static const MemoryRegionOps gic_cpu_ops = {
 
 static const MemoryRegionOps gic_virt_ops[2] = {
     {
-        .read_with_attrs = NULL,
-        .write_with_attrs = NULL,
+        .read_with_attrs = gic_thiscpu_hyp_read,
+        .write_with_attrs = gic_thiscpu_hyp_write,
         .endianness = DEVICE_NATIVE_ENDIAN,
     },
     {
@@ -1563,6 +1775,12 @@ static const MemoryRegionOps gic_virt_ops[2] = {
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
@@ -1604,6 +1822,19 @@ static void arm_gic_realize(DeviceState *dev, Error **errp)
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
-- 
2.18.0

