Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp731785lfc;
        Fri, 22 Nov 2019 10:42:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqy5RBvbUpuufxuSqZfAwItxXgpWOsuhP6dUp8tcHPhFsikl+H1355k8qPFv1elg1PO9Qfdw
X-Received: by 2002:a05:6402:512:: with SMTP id m18mr2937222edv.250.1574448141019;
        Fri, 22 Nov 2019 10:42:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574448141; cv=none;
        d=google.com; s=arc-20160816;
        b=Xt5WqRcw7/FCEosdqwsAMo2WtNk5zSLtzAQUACSB1GNYOPYoxAnihxthjHPjTX67SZ
         3N4hflbk9e4Bjzkl+F7zwgJp55T5FomRuJgvumRL28TPBuyyt0Sd3wpJxyadKOYU5wFx
         klYa0nw5+fmPbzKwgzhQf/uDmTqW9XyoHlVmFuzQCtaaYBQDMKQ964LKmvPmPNcaS0gm
         cQnickq8XozwehFwCMlLC1oyC34ZSErjSqNHzfvDU0wz9ZeE1Ptvj6TxFDCdBTeQ9N3P
         100q7jFfQYrH9dr8AX6tVPFekU8+AEL1ID6+l2uKlp/fWCSuHfpqYGX/N0CPQhqVx+xf
         zxYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TPw8HfXS6c8+/kaQMqsXBz05eJr0Po1JCxc9Y7B3JfM=;
        b=gDv0TR94AEAPSwdp14lpTsk+oiHORZ9kzNAe183XkIrU+RJW5yAzfd+0M+zK9nouFX
         rcrBlYqlmdZUwjejsDe+NHl2gB/TVRbSA+hmOl4rWRK9yCpZJ//HpY8K+LfEMD+R/BaP
         V00c5StQu+4ufXQAfPBGkHvCZ0j57mL/8bWyoJEEdYccAo+1HOX6OWJ385ZyvjIYlQ4L
         8hrrQpl1Yq7IEH1p81YZurWG5bYlSki5xfRC79/oJ+xtMB3z8p9l3k8PZnLNooodlpwx
         WurhMKdn7Jjsq7gv2HRMbQxuTnMZoNqRLksBE8p0iAoPCLUAU1g2xJ43/7GFJSbPfQ7G
         YGjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bnZmZ0Fu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l40si5928392edb.432.2019.11.22.10.42.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2019 10:42:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bnZmZ0Fu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iYDsp-0004NO-Jf
	for alex.bennee@linaro.org; Fri, 22 Nov 2019 13:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iYDiF-0000UM-OL
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:31:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iYDiD-0000K1-8k
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:31:23 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45116
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iYDiD-0000Jt-4O
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:31:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574447480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TPw8HfXS6c8+/kaQMqsXBz05eJr0Po1JCxc9Y7B3JfM=;
 b=bnZmZ0Ful9ISM5iF2NXZHan957LaRlQ8wiPTrQGjTh108w20RC3GsIkNZQ4CaBSvJYo284
 xz0vI1QtQsJ9MWo1RBXHv+/T/6Hmg1HseWZAeL0rT07fpILS1AlKDy9tU2psYVJg87pa5s
 L/jyvWfIsTvgNFMWAI9NBBnCu+qX5E8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-OrGnNxdAMZOzpYtLVAZBRA-1; Fri, 22 Nov 2019 13:31:19 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E3BE800054;
 Fri, 22 Nov 2019 18:31:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F28A26E712;
 Fri, 22 Nov 2019 18:31:07 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, jean-philippe.brucker@arm.com, bharatb.linux@gmail.com,
 yang.zhong@intel.com, dgilbert@redhat.com, quintela@redhat.com
Subject: [PATCH for-5.0 v11 10/20] virtio-iommu-pci: Add virtio iommu pci
 support
Date: Fri, 22 Nov 2019 19:29:33 +0100
Message-Id: <20191122182943.4656-11-eric.auger@redhat.com>
In-Reply-To: <20191122182943.4656-1-eric.auger@redhat.com>
References: <20191122182943.4656-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: OrGnNxdAMZOzpYtLVAZBRA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: kevin.tian@intel.com, peterx@redhat.com, tnowicki@marvell.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DRGHaDvDilJZ

This patch adds virtio-iommu-pci, which is the pci proxy for
the virtio-iommu device.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v10 -> v11:
- add the reserved_regions array property

v9 -> v10:
- include "hw/qdev-properties.h" header

v8 -> v9:
- add the msi-bypass property
- create virtio-iommu-pci.c
---
 hw/virtio/Makefile.objs          |  1 +
 hw/virtio/virtio-iommu-pci.c     | 91 ++++++++++++++++++++++++++++++++
 include/hw/pci/pci.h             |  1 +
 include/hw/virtio/virtio-iommu.h |  1 +
 qdev-monitor.c                   |  1 +
 5 files changed, 95 insertions(+)
 create mode 100644 hw/virtio/virtio-iommu-pci.c

diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index f68ac14a90..33e6bc591a 100644
--- a/hw/virtio/Makefile.objs
+++ b/hw/virtio/Makefile.objs
@@ -29,6 +29,7 @@ obj-$(CONFIG_VIRTIO_INPUT_HOST) +=3D virtio-input-host-pc=
i.o
 obj-$(CONFIG_VIRTIO_INPUT) +=3D virtio-input-pci.o
 obj-$(CONFIG_VIRTIO_RNG) +=3D virtio-rng-pci.o
 obj-$(CONFIG_VIRTIO_BALLOON) +=3D virtio-balloon-pci.o
+obj-$(CONFIG_VIRTIO_IOMMU) +=3D virtio-iommu-pci.o
 obj-$(CONFIG_VIRTIO_9P) +=3D virtio-9p-pci.o
 obj-$(CONFIG_VIRTIO_SCSI) +=3D virtio-scsi-pci.o
 obj-$(CONFIG_VIRTIO_BLK) +=3D virtio-blk-pci.o
diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
new file mode 100644
index 0000000000..280230b31e
--- /dev/null
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -0,0 +1,91 @@
+/*
+ * Virtio IOMMU PCI Bindings
+ *
+ * Copyright (c) 2019 Red Hat, Inc.
+ * Written by Eric Auger
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2 or
+ *  (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+
+#include "virtio-pci.h"
+#include "hw/virtio/virtio-iommu.h"
+#include "hw/qdev-properties.h"
+
+typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
+
+/*
+ * virtio-iommu-pci: This extends VirtioPCIProxy.
+ *
+ */
+#define VIRTIO_IOMMU_PCI(obj) \
+        OBJECT_CHECK(VirtIOIOMMUPCI, (obj), TYPE_VIRTIO_IOMMU_PCI)
+
+struct VirtIOIOMMUPCI {
+    VirtIOPCIProxy parent_obj;
+    VirtIOIOMMU vdev;
+};
+
+static Property virtio_iommu_pci_properties[] =3D {
+    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
+    DEFINE_PROP_ARRAY("reserved-regions", VirtIOIOMMUPCI,
+                      vdev.nb_reserved_regions, vdev.reserved_regions,
+                      qdev_prop_interval, Interval),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **err=
p)
+{
+    VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(vpci_dev);
+    DeviceState *vdev =3D DEVICE(&dev->vdev);
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
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    VirtioPCIClass *k =3D VIRTIO_PCI_CLASS(klass);
+    PCIDeviceClass *pcidev_k =3D PCI_DEVICE_CLASS(klass);
+    k->realize =3D virtio_iommu_pci_realize;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    dc->props =3D virtio_iommu_pci_properties;
+    pcidev_k->vendor_id =3D PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id =3D PCI_DEVICE_ID_VIRTIO_IOMMU;
+    pcidev_k->revision =3D VIRTIO_PCI_ABI_VERSION;
+    pcidev_k->class_id =3D PCI_CLASS_OTHERS;
+}
+
+static void virtio_iommu_pci_instance_init(Object *obj)
+{
+    VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(obj);
+
+    virtio_instance_init_common(obj, &dev->vdev, sizeof(dev->vdev),
+                                TYPE_VIRTIO_IOMMU);
+}
+
+static const VirtioPCIDeviceTypeInfo virtio_iommu_pci_info =3D {
+    .base_name             =3D TYPE_VIRTIO_IOMMU_PCI,
+    .generic_name          =3D "virtio-iommu-pci",
+    .transitional_name     =3D "virtio-iommu-pci-transitional",
+    .non_transitional_name =3D "virtio-iommu-pci-non-transitional",
+    .instance_size =3D sizeof(VirtIOIOMMUPCI),
+    .instance_init =3D virtio_iommu_pci_instance_init,
+    .class_init    =3D virtio_iommu_pci_class_init,
+};
+
+static void virtio_iommu_pci_register(void)
+{
+    virtio_pci_types_register(&virtio_iommu_pci_info);
+}
+
+type_init(virtio_iommu_pci_register)
+
+
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index db75c6dfd0..d7715c826a 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -86,6 +86,7 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
 #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
 #define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
+#define PCI_DEVICE_ID_VIRTIO_IOMMU       0x1014
=20
 #define PCI_VENDOR_ID_REDHAT             0x1b36
 #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-io=
mmu.h
index f55f48d304..1ab6993d29 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -25,6 +25,7 @@
 #include "hw/pci/pci.h"
=20
 #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
+#define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-device-base"
 #define VIRTIO_IOMMU(obj) \
         OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
=20
diff --git a/qdev-monitor.c b/qdev-monitor.c
index e6b112eb0a..e61ca62061 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -66,6 +66,7 @@ static const QDevAlias qdev_alias_table[] =3D {
     { "virtio-input-host-ccw", "virtio-input-host", QEMU_ARCH_S390X },
     { "virtio-input-host-pci", "virtio-input-host",
             QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
+    { "virtio-iommu-pci", "virtio-iommu", QEMU_ARCH_ALL & ~QEMU_ARCH_S390X=
 },
     { "virtio-keyboard-ccw", "virtio-keyboard", QEMU_ARCH_S390X },
     { "virtio-keyboard-pci", "virtio-keyboard",
             QEMU_ARCH_ALL & ~QEMU_ARCH_S390X },
--=20
2.20.1

