Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1917585lfp;
        Fri, 14 Feb 2020 05:35:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqzhzQlA3MCLPQQjoYzPrNGAf51ZlcjENPlUJFZW8jWRrxj5evRTS+BLxIP+/wxXp4UB/ebR
X-Received: by 2002:a05:620a:14ac:: with SMTP id x12mr2551091qkj.83.1581687307673;
        Fri, 14 Feb 2020 05:35:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581687307; cv=none;
        d=google.com; s=arc-20160816;
        b=cdWlOzm7pIFBKzY1RMvsl3cJ4uAUOq7KGo4d76jRn2CpEWvZ1XMeS1+dzgVP3FO/ao
         sbjHJeGJ8xoNOiMzkRpqp0Ko6wwQ/inyJNG/PalrPOaPUp51y5dUYE0aFxIDpkJVJJGv
         Cn26y2/SGklmEIANmxhv3u52WzYlVpa4WKm0h7N7N6lgYEMrjPBj88yd2KbsopDXYzZg
         QXw1AyKLLSzCYxAMYixVVNZYR6x0KrLGY0fUQncU6krOX8Lrg9nOgdRyUEKTH8zrsBvz
         8+mLBKrQldMOySmI0DCAgmMz4jfKpGyiKrOcuCRKUsZgn9iM3z+4IbgUlFnNfgALsYQf
         x3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mw5Txo7B8RTdVDvgpa5OdD0dWzCb9iRe7tmh1tgKvcE=;
        b=wp9CmFmOD/V6vHEgikuStai98E+vO0QONx2Bq3/V9Mkr9hdYJ1LPn3JUZrx4DM0xYg
         OEu1ku8koj5LUuNqBy0G+/S6slrQvyabif8Wrge2aznGjd9fXx9E7bVzTagOtofw1ZMd
         x1uJieK77MWTOxElvpIHgusRUiDgIe3lUyOuzqkzNOcbJRVhp3t8QwrQpTNqWXDCPf+v
         k1ICRkk7cL1J9oABsVp9/UeRSDOgNWqA6/vrw3Y8XMGzGRa4rzoxexJLrWOwAX2jiuNq
         dr+ae19xiL48L7qCiqTwtRI3v15o1oNxU7Za9M3WoDOYn8lWuZ+3Ut0vJnf1kfbsr6/q
         89GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZCLpte4/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si2806961qka.3.2020.02.14.05.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 05:35:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZCLpte4/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2b7b-0003PW-0I
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 08:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52404)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j2b2E-0002mT-UO
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:29:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j2b2D-0002PS-DE
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:29:34 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28335
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j2b2D-0002Ou-9z
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 08:29:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581686972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mw5Txo7B8RTdVDvgpa5OdD0dWzCb9iRe7tmh1tgKvcE=;
 b=ZCLpte4/26P8zHWi5Ay7Xslsco1v+1cqXOo7wpxmWEBHDiSYm3dhXjGzOPPxiVJl26GwP6
 m6gkpgIR7N4/EWG0T5Ipq0WinPGa0gqdkWFvoCRTkBvKg4aY3WXsOuBXQmVSGI8VMgREPk
 0HSMnB3cHFncNyp7WEyGDkdxUrpZ8to=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-m7yOsnNjOp-DneQW3rTyXA-1; Fri, 14 Feb 2020 08:29:31 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA4ED13E6;
 Fri, 14 Feb 2020 13:29:29 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 254485DA7D;
 Fri, 14 Feb 2020 13:29:16 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, jean-philippe@linaro.org,
 dgilbert@redhat.com, quintela@redhat.com, mst@redhat.com, peterx@redhat.com
Subject: [PATCH v16 08/10] virtio-iommu-pci: Add virtio iommu pci support
Date: Fri, 14 Feb 2020 14:27:43 +0100
Message-Id: <20200214132745.23392-9-eric.auger@redhat.com>
In-Reply-To: <20200214132745.23392-1-eric.auger@redhat.com>
References: <20200214132745.23392-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: m7yOsnNjOp-DneQW3rTyXA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kevin.tian@intel.com, bharatb.linux@gmail.com, tnowicki@marvell.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f3j5LGW78fJ+

This patch adds virtio-iommu-pci, which is the pci proxy for
the virtio-iommu device.

Currently non DT integration is not yet supported by the kernel.
So the machine must implement a hotplug handler for the
virtio-iommu-pci device that creates the device tree iommu-map
bindings as documented in kernel documentation:

Documentation/devicetree/bindings/virtio/iommu.txt

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

---
v15 -> v16:
- made the device not hotpluggable

v14 -> v15:
- checker whether the machine implements a hotplug handler
  for the virtio-iommu-pci

v13 -> v14:
- add device_class_set_props

v11 -> v12:
- added Jean's R-b
- remove the array of intervals. Will be introduced later?

v10 -> v11:
- add the reserved_regions array property

v9 -> v10:
- include "hw/qdev-properties.h" header

v8 -> v9:
- add the msi-bypass property
- create virtio-iommu-pci.c
---
 hw/virtio/Makefile.objs          |   1 +
 hw/virtio/virtio-iommu-pci.c     | 104 +++++++++++++++++++++++++++++++
 include/hw/pci/pci.h             |   1 +
 include/hw/virtio/virtio-iommu.h |   1 +
 qdev-monitor.c                   |   1 +
 5 files changed, 108 insertions(+)
 create mode 100644 hw/virtio/virtio-iommu-pci.c

diff --git a/hw/virtio/Makefile.objs b/hw/virtio/Makefile.objs
index 2fd9da7410..4e4d39a0a4 100644
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
index 0000000000..3dfbf55b47
--- /dev/null
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -0,0 +1,104 @@
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
+#include "qapi/error.h"
+#include "hw/boards.h"
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
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **err=
p)
+{
+    VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(vpci_dev);
+    DeviceState *vdev =3D DEVICE(&dev->vdev);
+
+    if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
+        MachineClass *mc =3D MACHINE_GET_CLASS(qdev_get_machine());
+
+        error_setg(errp,
+                   "%s machine fails to create iommu-map device tree bindi=
ngs",
+                   mc->name);
+        error_append_hint(errp,
+                          "Check you machine implements a hotplug handler =
"
+                          "for the virtio-iommu-pci device\n");
+        error_append_hint(errp, "Check the guest is booted without FW or w=
ith "
+                          "-no-acpi\n");
+        return;
+    }
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
+    device_class_set_props(dc, virtio_iommu_pci_properties);
+    pcidev_k->vendor_id =3D PCI_VENDOR_ID_REDHAT_QUMRANET;
+    pcidev_k->device_id =3D PCI_DEVICE_ID_VIRTIO_IOMMU;
+    pcidev_k->revision =3D VIRTIO_PCI_ABI_VERSION;
+    pcidev_k->class_id =3D PCI_CLASS_OTHERS;
+    dc->hotpluggable =3D false;
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
index 2acd8321af..cfedf5a995 100644
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
index ae88f730cf..6f67f1020a 100644
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
index 8ce71a206b..dbbe92dfa1 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -67,6 +67,7 @@ static const QDevAlias qdev_alias_table[] =3D {
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

