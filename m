Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp307154njc;
        Fri, 13 Jun 2025 07:47:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXymBlasQzGGlpuWTE5hx/GNeh9ZULSLTkRuLHQiYqYrePxDe+53xBjUleNydTHOHgj6OChmmbnk9C3DA==@linaro.org
X-Google-Smtp-Source: AGHT+IEmxQqmemF7TJlozlIqrSu1cu0mPk4WWxdfCz0BTgmcNzf8V8fC+iqMeHpvU8gzAX9Pb+qA
X-Received: by 2002:a05:622a:580e:b0:4a4:34d7:5af with SMTP id d75a77b69052e-4a72fe98897mr62430751cf.4.1749826027501;
        Fri, 13 Jun 2025 07:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749826027; cv=none;
        d=google.com; s=arc-20240605;
        b=jwKxxcaGoevzFncDW/iOjEJ4/2VKFeHhxnMg4fsDLgyQ8gKHpIukzlhYngcQ53JMIS
         PPw6wd+avj8MGDGaNkwDHU33/iHJJzChe8ZcTVR9s046oo9/rnXm1I6dmu9kMNkcJUfO
         MflesDX+Po6DeR3AZ8zTYWhZTDcr+Z6tADLbSq/VyjhsGRzXsdmp0MKlmDHwVFgq7+BR
         ovIn4BLCaJ/J//lxV+GpkX+78BMkoKYobjtyHoR0fUmVlvSpeNQSvOcfYWi9O0oyQkEi
         K+zdUep8GEaQqOR0DKaupZ6JeKHfckTi3FlRzH2gOeMWR3XyiOuI1I9GLjpwSonQbm+k
         qauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=aYgjnIjKbsYxPe4V+4h1ZOxFXZi6fu9QekfgUWlaCfs=;
        fh=12ij1D0xizeHJ+1WEqwo/9QFN2xwslWS8h/2oI6OPA8=;
        b=ac2JP2r8j2i5BMt0u5REMzJ+4ektWLJxmKEm+0Y7+D5y+S7wUST0OwD/iIPldAl4Df
         BQeV/WVO78lR14SGXoxUR0G86gGotUH2jTW7FRGUWcJ8McqYQCe3fCk2XKp4irjU9JRl
         Vkp5AwaWq/SvB5XWjJf8eGWMVRPGlX1fjSa2yuMWY+LrXWUyyo+Sr1olvCxlaQkfs+8s
         HxqCNLcFYX4pWQI8fAwYdDCa29ItdPYOT7KZgI/IK6zIOpyRiXTN8dcgcCeq6m5ARvQt
         HvyiqLNaaJz48ry3dRLaS5tfwlhMTBL5wvlNTmM5qYHO+rw3ca5dt8qexciThJ+XqUZ2
         5VlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4cdd76si33254311cf.370.2025.06.13.07.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 07:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uQ5gJ-00081K-2V; Fri, 13 Jun 2025 10:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uQ5gC-0007vv-Ll; Fri, 13 Jun 2025 10:46:53 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uQ5gA-0006jp-PS; Fri, 13 Jun 2025 10:46:52 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bJhxp3rrnz6L4sL;
 Fri, 13 Jun 2025 22:44:46 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 0A9111402F7;
 Fri, 13 Jun 2025 22:46:45 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Jun 2025 16:46:36 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: [PATCH v4 4/7] hw/arm/virt: Factor out common SMMUV3 dt bindings code
Date: Fri, 13 Jun 2025 15:44:46 +0100
Message-ID: <20250613144449.60156-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i+BRCnZ3KegZ

No functional changes intended. This will be useful when we
add support for user-creatable smmuv3 device.

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Nathan Chen <nathanc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c | 54 +++++++++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 73bd2bd5f2..71b923f786 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1412,19 +1412,43 @@ static void create_pcie_irq_map(const MachineState *ms,
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
@@ -1443,27 +1467,7 @@ static void create_smmu(const VirtMachineState *vms,
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
2.47.0

