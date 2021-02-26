Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1083330lfg;
        Fri, 26 Feb 2021 00:53:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyt34egihDKEEtMSLgCY/hFCZd1uSfIm4fjhI/lBpBXsCTGsVHcJ3cxFDKbpH9QpYvEcFzI
X-Received: by 2002:a05:6902:706:: with SMTP id k6mr3047202ybt.52.1614329594541;
        Fri, 26 Feb 2021 00:53:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614329594; cv=none;
        d=google.com; s=arc-20160816;
        b=AH0e7e00g7Ex3iPuyPJRbjWq41WbWwHWDfwFB7pea90yZuxRrGZDvMEOXO4BIvDQ3H
         dKXIWX5kR2f9oDeBgjSa+DN3gQDdfbVgy+Rt/wOwMIPAj3rAIvU/G9jK9yagNqAk2nDB
         +ZywjwabFKIhW26848nhsqE2jyLktqyfOONiw4NmMOYSFU5hifmooOS8RHFMahmgOLPx
         VREPsBXU2SRaej58LqrT35rJLaBuV4I/hR5oYRnpWLwRL7sTU9QqL/oYQMFz8Kb+OUDc
         kmjiUg9XpSD/DmWwVEs20aXgAJy+vs08mPPHydlkoaGgitSMU3qf6JkNELnyC/725ov9
         +G5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=sbzFPJ2QO5cK2sB8vdASmmbQR/662gbSXtEVTD0npWA=;
        b=OtbmNnVjSHvf7IeOkaUsU0we62R05XO5aUAV4K9QakAzRJC3qN6B1saUmcZcFq+v8a
         jn68Wsqut+7IJeWVig+7hufl5gUWcFp7Hz7lpOK1UJYLhNAuDDMs2Py3Kqn1foZC+btY
         neidA8DVVQOQhUWvZOqhM9Xm/He5OgVkfqtN4Kag47giYszuUnT2msCasQE3Gg1CVacd
         A8NjOc9cQZiJbxcAMJX1AyIPAWorAYJHWERAtIMap8bNLpGBQ/w9qX7MKSJX8O9i/9bf
         r4747uZpoz1f3lu1gccyG8xsrbi9aVJrKojxJNaFqpdFhNeVdWNF+tjRRk6osoWP3jVd
         Lffw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si7615595ybg.408.2021.02.26.00.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 00:53:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFYs5-0007Yu-Lt
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 03:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFYol-0004rb-RK; Fri, 26 Feb 2021 03:49:47 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lFYoj-0003Yq-Ae; Fri, 26 Feb 2021 03:49:47 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Dn3Fl1mc8z7qQg;
 Fri, 26 Feb 2021 16:47:55 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Fri, 26 Feb 2021
 16:49:26 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 2/4] hw/pci: Add iommu option for pci root bus
Date: Fri, 26 Feb 2021 08:49:11 +0000
Message-ID: <1614329353-2124-3-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1614329353-2124-1-git-send-email-wangxingang5@huawei.com>
References: <1614329353-2124-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=wangxingang5@huawei.com; helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 wangxingang5@huawei.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RAMteOy+svQq

From: Xingang Wang <wangxingang5@huawei.com>

This add iommu option for pci root bus, including primary bus
and pxb root bus. Default option is set to true, and the option
is valid only if the iommu option for machine is properly set.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/arm/virt.c                       | 29 +++++++++++++++++++++++++++++
 hw/pci-bridge/pci_expander_bridge.c |  6 ++++++
 hw/pci/pci.c                        |  2 +-
 include/hw/arm/virt.h               |  1 +
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 371147f3ae..0c9e549759 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -79,6 +79,7 @@
 #include "hw/virtio/virtio-iommu.h"
 #include "hw/char/pl011.h"
 #include "qemu/guest-random.h"
+#include "include/hw/pci/pci_bus.h"
 
 #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
     static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
@@ -1232,6 +1233,10 @@ static void create_smmu(const VirtMachineState *vms,
 
     dev = qdev_new("arm-smmuv3");
 
+    if (vms->primary_bus_iommu) {
+        bus->flags |= PCI_BUS_IOMMU;
+    }
+
     object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
                              &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
@@ -2305,6 +2310,20 @@ static void virt_set_iommu(Object *obj, const char *value, Error **errp)
     }
 }
 
+static bool virt_get_primary_bus_iommu(Object *obj, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    return vms->primary_bus_iommu;
+}
+
+static void virt_set_primary_bus_iommu(Object *obj, bool value, Error **errp)
+{
+    VirtMachineState *vms = VIRT_MACHINE(obj);
+
+    vms->primary_bus_iommu = value;
+}
+
 static CpuInstanceProperties
 virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
 {
@@ -2629,6 +2648,13 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set the IOMMU type. "
                                           "Valid values are none and smmuv3");
 
+    object_class_property_add_bool(oc, "primary_bus_iommu",
+                                  virt_get_primary_bus_iommu,
+                                  virt_set_primary_bus_iommu);
+    object_class_property_set_description(oc, "primary_bus_iommu",
+                                          "Set on/off to enable/disable "
+                                          "iommu for primary bus");
+
     object_class_property_add_bool(oc, "ras", virt_get_ras,
                                    virt_set_ras);
     object_class_property_set_description(oc, "ras",
@@ -2696,6 +2722,9 @@ static void virt_instance_init(Object *obj)
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
 
+    /* Iommu is enabled by default for primary bus */
+    vms->primary_bus_iommu = true;
+
     /* Default disallows RAS instantiation */
     vms->ras = false;
 
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index aedded1064..7971ce9bd9 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -57,6 +57,7 @@ struct PXBDev {
 
     uint8_t bus_nr;
     uint16_t numa_node;
+    bool iommu;
 };
 
 static PXBDev *convert_to_pxb(PCIDevice *dev)
@@ -254,6 +255,10 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
     bus->address_space_io = pci_get_bus(dev)->address_space_io;
     bus->map_irq = pxb_map_irq_fn;
 
+    if (pxb->iommu) {
+       bus->flags |= PCI_BUS_IOMMU;
+    }
+
     PCI_HOST_BRIDGE(ds)->bus = bus;
 
     pxb_register_bus(dev, bus, &local_err);
@@ -301,6 +306,7 @@ static Property pxb_dev_properties[] = {
     /* Note: 0 is not a legal PXB bus number. */
     DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
     DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
+    DEFINE_PROP_BOOL("iommu", PXBDev, iommu, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index a9ebef8a35..dc969989c9 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2712,7 +2712,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
 
         iommu_bus = parent_bus;
     }
-    if (iommu_bus && iommu_bus->iommu_fn) {
+    if (pci_bus_has_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
         return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
     }
     return &address_space_memory;
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index ee9a93101e..babe829486 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -147,6 +147,7 @@ struct VirtMachineState {
     OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
+    bool primary_bus_iommu;
     VirtMSIControllerType msi_controller;
     uint16_t virtio_iommu_bdf;
     struct arm_boot_info bootinfo;
-- 
2.19.1

