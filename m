Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2435151dyb;
        Mon, 23 Jun 2025 02:45:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWboS3WfGbHt5Qux0Q9fzLtxNgChBcKQLBzEfjvqD36jQITcYHhPBKOkEnEebuD2pn66b3UFVpvmn6zug==@linaro.org
X-Google-Smtp-Source: AGHT+IGRHEJYuBIGBtDQCLM9X/Pzetc0z2LAQgGixFcIpsFxsRETeSqMQtO42TOGWZQUtvBNWP61
X-Received: by 2002:a05:622a:6182:b0:4a6:f594:c88d with SMTP id d75a77b69052e-4a77a1aeb9emr176348131cf.8.1750671918727;
        Mon, 23 Jun 2025 02:45:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750671918; cv=none;
        d=google.com; s=arc-20240605;
        b=RI9mT1lbGcn7EieHoZS1SEdIdunSvrgfypmuJRy8jMn4J7JJOyQNg8xJ+lCziN8wDs
         zjCQDs/oRwLZdWWPUxgkIVzV6h2BOF7ElB7f/9NvLJBh8cVh9SWWopTMVyaTm8xw+npV
         WjwJF5wTLuxyWtYU32s+EeJnwaYruEL5p4augZcn26Hz37rCZCRbX6r/GDDwhfpF0XD2
         KgYzoR8QzSlbjdST/IafWEqLdPl/sR1Ggog4lfpMKwBat8nNpX/mdd8J2qlUt5SF3E3k
         8z5g15a5f0MarHZRQtgcCp+6UkhIp4ktWWFCcyl/ZAWoaqfUivMwBLwe9svnvG3VcVyG
         q0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=UhZQSKd8rM8/rjA3XE7pxvQgfXu31phrumtC4lxBir8=;
        fh=y6a9dndW+0CJHcvYdghYwLzdcwMeXoOVhEZ+ThybITY=;
        b=V4VjRgC969pFn+vaTYoGwNv/jKSZFyCtJf8bH4x3ntg+4OiMzmatF1F/pIbIT5mSJN
         o4r3j6//RCjYSv+YE36PpsFHB0MsIfuyvxJuxQ25nA0UaV87xa4csqaK5LhBV9xqhoaF
         +GAgLdx8V8MHUNnXvUVoYoM0r8RB7kGjZHC0XMhWQTgkq8VtpN3mYk9xY7wcOOkbHVpI
         Vxr/03ADy+8d7Wz3rF+H+fsEOrGvbc3x7kYdZ4kiHr0F6lDzJNYT8URSzqldAtvKkIiO
         Sbr/veoqdkU5Yv0OwOFFnrBcCV81RoeMA08qWwepXUIbWys8tcQFHzZ30GqWQ/EwaS06
         mT0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a77a0d285dsi80397931cf.475.2025.06.23.02.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jun 2025 02:45:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uTdj5-0005dg-GD; Mon, 23 Jun 2025 05:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uTdj4-0005b4-9Z; Mon, 23 Jun 2025 05:44:30 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uTdiw-0002gi-PF; Mon, 23 Jun 2025 05:44:30 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bQjlg59GHz6HJpg;
 Mon, 23 Jun 2025 17:41:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 67C8C1402F6;
 Mon, 23 Jun 2025 17:44:18 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Jun 2025 11:44:09 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <gustavo.romero@linaro.org>, <linuxarm@huawei.com>,
 <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [PATCH v5 07/11] hw/arm/virt: Allow user-creatable SMMUv3 dev
 instantiation
Date: Mon, 23 Jun 2025 10:42:26 +0100
Message-ID: <20250623094230.76084-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
References: <20250623094230.76084-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, RDNS_NONE=0.793, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
X-TUID: GdstHCae0U1r

Allow cold-plugging of an SMMUv3 device on the virt machine when no
global (legacy) SMMUv3 is present or when a virtio-iommu is specified.

This user-created SMMUv3 device is tied to a specific PCI bus provided
by the user, so ensure the IOMMU ops are configured accordingly.

Due to current limitations in QEMU’s device tree support, specifically
its inability to properly present pxb-pcie based root complexes and
their devices, the device tree support for the new SMMUv3 device is
limited to cases where it is attached to the default pcie.0 root complex.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmu-common.c         |  8 +++++-
 hw/arm/smmuv3.c              |  2 ++
 hw/arm/virt.c                | 50 ++++++++++++++++++++++++++++++++++++
 hw/core/sysbus-fdt.c         |  3 +++
 include/hw/arm/smmu-common.h |  1 +
 5 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index b15e7fd0e4..2ee4691299 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -959,7 +959,12 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
                 goto out_err;
             }
         }
-        pci_setup_iommu(pci_bus, &smmu_ops, s);
+
+        if (s->smmu_per_bus) {
+            pci_setup_iommu_per_bus(pci_bus, &smmu_ops, s);
+        } else {
+            pci_setup_iommu(pci_bus, &smmu_ops, s);
+        }
         return;
     }
 out_err:
@@ -984,6 +989,7 @@ static void smmu_base_reset_exit(Object *obj, ResetType type)
 
 static const Property smmu_dev_properties[] = {
     DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
+    DEFINE_PROP_BOOL("smmu_per_bus", SMMUState, smmu_per_bus, false),
     DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus,
                      TYPE_PCI_BUS, PCIBus *),
 };
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index ab67972353..bcf8af8dc7 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1996,6 +1996,8 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
     device_class_set_parent_realize(dc, smmu_realize,
                                     &c->parent_realize);
     device_class_set_props(dc, smmuv3_properties);
+    dc->hotpluggable = false;
+    dc->user_creatable = true;
 }
 
 static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ae30320c38..e52347634f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -56,6 +56,7 @@
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/virtio/virtio-pci.h"
 #include "hw/core/sysbus-fdt.h"
@@ -1443,6 +1444,28 @@ static void create_smmuv3_dt_bindings(const VirtMachineState *vms, hwaddr base,
     g_free(node);
 }
 
+static void create_smmuv3_dev_dtb(VirtMachineState *vms,
+                                  DeviceState *dev, PCIBus *bus)
+{
+    PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
+    SysBusDevice *sbdev = SYS_BUS_DEVICE(dev);
+    int irq = platform_bus_get_irqn(pbus, sbdev, 0);
+    hwaddr base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
+    MachineState *ms = MACHINE(vms);
+
+    if (strcmp("pcie.0", bus->qbus.name)) {
+        warn_report("SMMUv3 device only supported with pcie.0 for DT");
+        return;
+    }
+    base += vms->memmap[VIRT_PLATFORM_BUS].base;
+    irq += vms->irqmap[VIRT_PLATFORM_BUS];
+
+    vms->iommu_phandle = qemu_fdt_alloc_phandle(ms->fdt);
+    create_smmuv3_dt_bindings(vms, base, SMMU_IO_LEN, irq);
+    qemu_fdt_setprop_cells(ms->fdt, vms->pciehb_nodename, "iommu-map",
+                           0x0, vms->iommu_phandle, 0x0, 0x10000);
+}
+
 static void create_smmu(const VirtMachineState *vms,
                         PCIBus *bus)
 {
@@ -2932,6 +2955,16 @@ static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
         qlist_append_str(reserved_regions, resv_prop_str);
         qdev_prop_set_array(dev, "reserved-regions", reserved_regions);
         g_free(resv_prop_str);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3)) {
+        if (vms->legacy_smmuv3_present || vms->iommu == VIRT_IOMMU_VIRTIO) {
+            error_setg(errp, "virt machine already has %s set. "
+                       "Doesn't support incompatible iommus",
+                       (vms->legacy_smmuv3_present) ?
+                       "iommu=smmuv3" : "virtio-iommu");
+        } else if (vms->iommu == VIRT_IOMMU_NONE) {
+            /* The new SMMUv3 device is specific to the PCI bus */
+            object_property_set_bool(OBJECT(dev), "smmu_per_bus", true, NULL);
+        }
     }
 }
 
@@ -2955,6 +2988,22 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
         virtio_md_pci_plug(VIRTIO_MD_PCI(dev), MACHINE(hotplug_dev), errp);
     }
 
+    if (object_dynamic_cast(OBJECT(dev), TYPE_ARM_SMMUV3)) {
+        if (!vms->legacy_smmuv3_present && vms->platform_bus_dev) {
+            PCIBus *bus;
+
+            bus = PCI_BUS(object_property_get_link(OBJECT(dev), "primary-bus",
+                                                   &error_abort));
+            if (pci_bus_bypass_iommu(bus)) {
+                error_setg(errp, "Bypass option cannot be set for SMMUv3 "
+                           "associated PCIe RC");
+                return;
+            }
+
+            create_smmuv3_dev_dtb(vms, dev, bus);
+        }
+    }
+
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         PCIDevice *pdev = PCI_DEVICE(dev);
 
@@ -3157,6 +3206,7 @@ static void virt_machine_class_init(ObjectClass *oc, const void *data)
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_VFIO_PLATFORM);
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_UEFI_VARS_SYSBUS);
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ARM_SMMUV3);
 #ifdef CONFIG_TPM
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
 #endif
diff --git a/hw/core/sysbus-fdt.c b/hw/core/sysbus-fdt.c
index c339a27875..e80776080b 100644
--- a/hw/core/sysbus-fdt.c
+++ b/hw/core/sysbus-fdt.c
@@ -31,6 +31,7 @@
 #include "qemu/error-report.h"
 #include "system/device_tree.h"
 #include "system/tpm.h"
+#include "hw/arm/smmuv3.h"
 #include "hw/platform-bus.h"
 #include "hw/vfio/vfio-platform.h"
 #include "hw/vfio/vfio-calxeda-xgmac.h"
@@ -518,6 +519,8 @@ static const BindingEntry bindings[] = {
 #ifdef CONFIG_TPM
     TYPE_BINDING(TYPE_TPM_TIS_SYSBUS, add_tpm_tis_fdt_node),
 #endif
+    /* No generic DT support for smmuv3 dev. Support added for arm virt only */
+    TYPE_BINDING(TYPE_ARM_SMMUV3, no_fdt_node),
     TYPE_BINDING(TYPE_RAMFB_DEVICE, no_fdt_node),
     TYPE_BINDING(TYPE_UEFI_VARS_SYSBUS, add_uefi_vars_node),
     TYPE_BINDING("", NULL), /* last element */
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index e5e2d09294..80d0fecfde 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -161,6 +161,7 @@ struct SMMUState {
     QLIST_HEAD(, SMMUDevice) devices_with_notifiers;
     uint8_t bus_num;
     PCIBus *primary_bus;
+    bool smmu_per_bus; /* SMMU is specific to the primary_bus */
 };
 
 struct SMMUBaseClass {
-- 
2.34.1

