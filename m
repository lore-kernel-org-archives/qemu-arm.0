Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp744888njj;
        Fri, 2 May 2025 03:28:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvXYi8POj8wCzNu9HaMy/plo79yv/Or/cy4HcFBisp1uJUB7IvD/PCI1H9g39TYLLh3Eg08AAF2UUqKA==@linaro.org
X-Google-Smtp-Source: AGHT+IGzTl9ju/l2KVb04MdisOWo7mH5D95p6jCAKw1J7Udb/f3VcKbWvy+LVQodYqbstCcJnRYV
X-Received: by 2002:a05:622a:1b03:b0:479:1a41:b50d with SMTP id d75a77b69052e-48c3163d98dmr31803901cf.17.1746181705195;
        Fri, 02 May 2025 03:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746181705; cv=none;
        d=google.com; s=arc-20240605;
        b=WhQx/qDqzS+tCGLFrghBamFwR8h599T9SGPDLzeCaNnCsFOzxF/b/BQTViXFgM9PEP
         MJ5O6k15ljYfdju5BBgTcEhbAZh0QURsWeyol2BOmwivei8UPZzQIzzygy/Hx9XnuVlR
         hKQ850jcw2KJBZluiDS01e56OtQG4Md9ivUB+MEv+jPdJQ/gD4kWAbO1ocFdXRGfQqTk
         JzBG4FpkcqSV2EBVpzPUropps2RW/dcdGdiixsttxb9G5tjrZ6rB1qegLMgCth3vZERK
         zsUjoqRTeGlF+y0fMNqVHerO+7d6JoXLnD+Cl2nPthvJNdLCEn2nRrH2cscDfcLSMG9x
         e2jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=TDL8PkrdufOkVS0kk6nXIpDGW+LP37Cw9LUMQCjW9LA=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=FJJCmFECDU5FE9W5OnXWg5UclRVHP2ow2E3f3IBRsrkbj8WwxqZqBHxlPVFyV6cdhV
         LAc2OUu7VggTAsZbJW3oWko9EFAz4aUDFEBpLrYN8sdV61YXZceyBxVktkQKZd/qaT+n
         nRyMsxmtXNuYdjTRcKGREw4rS/nxzcN8ImS1iLUc7l0rAUr47/CC1tGyFfo/g5YuadwD
         QPjUgERiAlGIE9pYYgRApBw0Rckp4+XMSf/1HaQjOsjVgy7F410AXl6cL0QaRXEkLG1/
         yDsEvoR7A6EcOYZyQb1QLLpJ+BMJ+CCDPVGTYqVgq/yC8x+E2pK4k4b771nQNiEBHrIe
         OgAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b98246e13si28238691cf.249.2025.05.02.03.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 May 2025 03:28:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uAnd0-00009i-HL; Fri, 02 May 2025 06:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uAncb-0008Re-4r; Fri, 02 May 2025 06:27:58 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uAncZ-00025x-8L; Fri, 02 May 2025 06:27:56 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zpn722d9rz6K61d;
 Fri,  2 May 2025 18:22:54 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 4E46B1402ED;
 Fri,  2 May 2025 18:27:53 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 12:27:45 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v2 3/6] hw/arm/virt: Factor out common SMMUV3 dt bindings code
Date: Fri, 2 May 2025 11:27:04 +0100
Message-ID: <20250502102707.110516-4-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4X6hWvWKHbeC

No functional changes intended. This will be useful when we
add support for user-creatable smmuv3 device.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c | 54 +++++++++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index dd355f4454..464e84ae67 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1418,19 +1418,43 @@ static void create_pcie_irq_map(const MachineState *ms,
                            0x7           /* PCI irq */);
 }
 
+static void create_smmuv3_dt_bindings(const VirtMachineState *vms, hwaddr base,
+                                      hwaddr size, int irq)
+{
+    char *node;
+    const char compat[] = "arm,smmu-v3";
+    const char irq_names[] = "eventq\0priq\0cmdq-sync\0gerror";
+    MachineState *ms = MACHINE(vms);
+
+    node = g_strdup_printf("/smmuv3@%" PRIx64, base);
+    qemu_fdt_add_subnode(ms->fdt, node);
+    qemu_fdt_setprop(ms->fdt, node, "compatible", compat, sizeof(compat));
+    qemu_fdt_setprop_sized_cells(ms->fdt, node, "reg", 2, base, 2, size);
+
+    qemu_fdt_setprop_cells(ms->fdt, node, "interrupts",
+            GIC_FDT_IRQ_TYPE_SPI, irq    , GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
+            GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
+            GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
+            GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
+
+    qemu_fdt_setprop(ms->fdt, node, "interrupt-names", irq_names,
+                     sizeof(irq_names));
+
+    qemu_fdt_setprop(ms->fdt, node, "dma-coherent", NULL, 0);
+    qemu_fdt_setprop_cell(ms->fdt, node, "#iommu-cells", 1);
+    qemu_fdt_setprop_cell(ms->fdt, node, "phandle", vms->iommu_phandle);
+    g_free(node);
+}
+
 static void create_smmu(const VirtMachineState *vms,
                         PCIBus *bus)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
-    char *node;
-    const char compat[] = "arm,smmu-v3";
     int irq =  vms->irqmap[VIRT_SMMU];
     int i;
     hwaddr base = vms->memmap[VIRT_SMMU].base;
     hwaddr size = vms->memmap[VIRT_SMMU].size;
-    const char irq_names[] = "eventq\0priq\0cmdq-sync\0gerror";
     DeviceState *dev;
-    MachineState *ms = MACHINE(vms);
 
     if (vms->iommu != VIRT_IOMMU_SMMUV3 || !vms->iommu_phandle) {
         return;
@@ -1449,27 +1473,7 @@ static void create_smmu(const VirtMachineState *vms,
         sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
                            qdev_get_gpio_in(vms->gic, irq + i));
     }
-
-    node = g_strdup_printf("/smmuv3@%" PRIx64, base);
-    qemu_fdt_add_subnode(ms->fdt, node);
-    qemu_fdt_setprop(ms->fdt, node, "compatible", compat, sizeof(compat));
-    qemu_fdt_setprop_sized_cells(ms->fdt, node, "reg", 2, base, 2, size);
-
-    qemu_fdt_setprop_cells(ms->fdt, node, "interrupts",
-            GIC_FDT_IRQ_TYPE_SPI, irq    , GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
-            GIC_FDT_IRQ_TYPE_SPI, irq + 1, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
-            GIC_FDT_IRQ_TYPE_SPI, irq + 2, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI,
-            GIC_FDT_IRQ_TYPE_SPI, irq + 3, GIC_FDT_IRQ_FLAGS_EDGE_LO_HI);
-
-    qemu_fdt_setprop(ms->fdt, node, "interrupt-names", irq_names,
-                     sizeof(irq_names));
-
-    qemu_fdt_setprop(ms->fdt, node, "dma-coherent", NULL, 0);
-
-    qemu_fdt_setprop_cell(ms->fdt, node, "#iommu-cells", 1);
-
-    qemu_fdt_setprop_cell(ms->fdt, node, "phandle", vms->iommu_phandle);
-    g_free(node);
+    create_smmuv3_dt_bindings(vms, base, size, irq);
 }
 
 static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
-- 
2.34.1

