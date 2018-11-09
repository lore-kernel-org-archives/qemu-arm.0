Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp572423wrw;
        Fri, 9 Nov 2018 03:36:46 -0800 (PST)
X-Google-Smtp-Source: AJdET5fMsXIgDmY6hojQ/LPxKPSklLD2nMIz4V2UF8xGhvtQ27GTOUJOTWYFgVDyizgvZLw+bKWh
X-Received: by 2002:ad4:4312:: with SMTP id c18mr8260867qvs.59.1541763406587;
        Fri, 09 Nov 2018 03:36:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763406; cv=none;
        d=google.com; s=arc-20160816;
        b=qpXyoUn0679sYAhNeiVOAYefGHX3AZMsKbUhfqcnuLV5NR/pg+88eutIQ+5kOhQbPa
         lwMR++JH790t3OayhZA5nH6SHN6J1gSc6z/1Sn9fvM7A0WU3JFXVUxf4eDXACJeHeKZe
         u3XnNcewoS22nDDHZffaK7fhArq6IkcGNAowbAfd1vkupHSB/DfOULdYavuC+gSYSluw
         aAdD5jWW5DkF0+40vRtLyzhdzmOlQZ/w4J9sbxHdaTV5yzc0YHVx4oPXQ59YFiOydLVE
         97RO7x88dLGZEacruXfVuq/rqYXkMrXKU8rfXELqyeuSS6N784Am4+r1r5kmhWG+V9cM
         KbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=YXqlsXryh4VMuAnS/Ch8Fc8T7HjiW3aScfi1WfLRoFk=;
        b=FmBMDHHISc72e9QY9XoS3WtqkYT35lAAsG21uxsywkdDaCxkddc5tIvwEZ+SWVe/m0
         O2Dt4jYdrn/y1uEqjrzr5K2zCiuzGY3gKE7u773CoY573QdVyOHp0hDao8vCdZ0vceFu
         lE/J+/E8H5qur+G8URz3FDiuATat/SQrpR/Ir0KUCHN7+4jBlFLiSsRN341evtwUdttt
         uwuBBn8BBkIvAGhxD7y4/orm9AhgmO2DcwwLIKBYMn53eBeHRi9Y06Tp6J7JUilv9B6F
         Zcc++3vnTTRz38sJODL8/7iAWrdx2+gTUoxhFgT28l3o1SDdosJueoyMqhmsu+H+QqCg
         KBww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j4-v6si724268qtb.398.2018.11.09.03.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:36:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL55h-0004P1-Tt
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:36:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50O-000708-9e
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:31:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL50K-0002L6-DU
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:31:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40488)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL50K-0002EX-5o; Fri, 09 Nov 2018 06:31:12 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 064DC30BF470;
	Fri,  9 Nov 2018 11:31:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBDDF5C219;
	Fri,  9 Nov 2018 11:31:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:53 +0100
Message-Id: <20181109112957.10067-15-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 09 Nov 2018 11:31:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v8 14/18] virtio-iommu-pci: Add virtio iommu pci
 support
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
Cc: tn@semihalf.com, kevin.tian@intel.com, bharat.bhushan@nxp.com,
	peterx@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ngJzO7fcoHhn

This patch adds virtio-iommu-pci, which is the pci proxy for
the virtio-iommu device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-pci.c | 50 ++++++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-pci.h | 14 ++++++++++++
 include/hw/pci/pci.h   |  1 +
 qdev-monitor.c         |  1 +
 4 files changed, 66 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index a954799267..45b294b34d 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -2342,6 +2342,55 @@ static const TypeInfo virtio_balloon_pci_info = {
     .class_init    = virtio_balloon_pci_class_init,
 };
 
+/* virtio-iommu-pci */
+
+static Property virtio_iommu_pci_properties[] = {
+    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
+{
+    VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
+    DeviceState *vdev = DEVICE(&dev->vdev);
+
+    qdev_set_parent_bus(vdev, BUS(&vpci_dev->bus));
+    object_property_set_link(OBJECT(dev),
+                             OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
+                             "primary-bus", errp);
+    object_property_set_bool(OBJECT(vdev), true, "realized", errp);
+}
+
+static void virtio_iommu_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioPCIClass *k = VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
+    k->realize = virtio_iommu_pci_realize;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->props = virtio_iommu_pci_properties;
+    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_IOMMU;
+    pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
+    pcidev_k->class_id = PCI_CLASS_OTHERS;
+}
+
+static void virtio_iommu_pci_instance_init(Object *obj)
+{
+    VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_IOMMU);
+}
+
+static const TypeInfo virtio_iommu_pci_info = {
+    .name          = TYPE_VIRTIO_IOMMU_PCI,
+    .parent        = TYPE_VIRTIO_PCI,
+    .instance_size = sizeof(VirtIOIOMMUPCI),
+    .instance_init = virtio_iommu_pci_instance_init,
+    .class_init    = virtio_iommu_pci_class_init,
+};
+
 /* virtio-serial-pci */
 
 static void virtio_serial_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
@@ -2712,6 +2761,7 @@ static void virtio_pci_register_types(void)
 #endif
     type_register_static(&virtio_scsi_pci_info);
     type_register_static(&virtio_balloon_pci_info);
+    type_register_static(&virtio_iommu_pci_info);
     type_register_static(&virtio_serial_pci_info);
     type_register_static(&virtio_net_pci_info);
 #ifdef CONFIG_VHOST_SCSI
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 813082b0d7..a17100b4a0 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -26,6 +26,7 @@
 #include "hw/virtio/virtio-input.h"
 #include "hw/virtio/virtio-gpu.h"
 #include "hw/virtio/virtio-crypto.h"
+#include "hw/virtio/virtio-iommu.h"
 #include "hw/virtio/vhost-user-scsi.h"
 #if defined(CONFIG_VHOST_USER) && defined(CONFIG_LINUX)
 #include "hw/virtio/vhost-user-blk.h"
@@ -57,6 +58,7 @@ typedef struct VirtIOInputHostPCI VirtIOInputHostPCI;
 typedef struct VirtIOGPUPCI VirtIOGPUPCI;
 typedef struct VHostVSockPCI VHostVSockPCI;
 typedef struct VirtIOCryptoPCI VirtIOCryptoPCI;
+typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
 
 /* virtio-pci-bus */
 
@@ -363,6 +365,18 @@ struct VirtIOInputHIDPCI {
     VirtIOInputHID vdev;
 };
 
+/*
+ *  * virtio-iommu-pci: This extends VirtioPCIProxy.
+ *   */
+#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-pci"
+#define VIRTIO_IOMMU_PCI(obj) \
+        OBJECT_CHECK(VirtIOIOMMUPCI, (obj), TYPE_VIRTIO_IOMMU_PCI)
+
+struct VirtIOIOMMUPCI {
+    VirtIOPCIProxy parent_obj;
+    VirtIOIOMMU vdev;
+};
+
 #ifdef CONFIG_LINUX
 
 #define TYPE_VIRTIO_INPUT_HOST_PCI "virtio-input-host-pci"
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index e6514bba23..a01fd4d2e1 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -85,6 +85,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_VIRTIO_RNG         0x1005
 #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
 #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
+#define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1013
 
 #define PCI_VENDOR_ID_REDHAT             0x1b36
 #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
diff --git a/qdev-monitor.c b/qdev-monitor.c
index 07147c63bf..4f1ae056da 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -62,6 +62,7 @@ static const QDevAlias qdev_alias_table[] = {
     { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
     { "virtio-input-host-pci", "virtio-input-host",
             QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
     { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_S390X },
     { "virtio-keyboard-pci", "virtio-keyboard",
             QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
-- 
2.17.2

