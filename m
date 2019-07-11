Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp979457wrv;
        Thu, 11 Jul 2019 10:32:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwl44VUIia1+DYcNrtR5ubdkyWKJNJz11/NLeM0aNChcV3+CyDaDVEWNVwIwG6y6Ir31gFI
X-Received: by 2002:a17:906:d052:: with SMTP id bo18mr369364ejb.311.1562866347947;
        Thu, 11 Jul 2019 10:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562866347; cv=none;
        d=google.com; s=arc-20160816;
        b=t92xd2+HD3RFv4Mxd8X6cg2veVKXqHacLcOqtrLpg6sig/jKpTr6utHNy89HAYw+Zo
         XteguzGJh8n1rYHAldbl+92XErivsK4aLJy2qVRQzzPButHfLCukVJJkbKXh8Et3JzDg
         LDHueWvbR4Gvf1petcCCuw9lxVOxm/iPl8UWVl+TObmQnnbt+24koqp1wwdApr8yCg8j
         x0HAWVdDuqlS/pl7XY+so6ZSj5SlIoJ0Ub1tskKpsYU1Ry+EWmClOA7zur8MA7/AiNpN
         Q2cKF9YqTPnyr/hQX1UHikqYWE7ehv7eJdh2ZsgI1Mr9QXkh88MIVYPAQKDgOEvYZsrI
         sA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=n+shw8snQG3PdT0xuzl46tjwc/uTsaMeI0eD+Z6vhCU=;
        b=Z+k5dDgfVeahzoAjjw6vFRACSKbF3jkIg1ONJf3cjxCX0To4lBERGp2JZWj5g36npe
         2VGWXc95y6A6Cv10CNnB0Em+DF4c9e95auM4J1WeNxa7z0BffeDC/E7jk0gV/LRoiHIJ
         WiGg1c6Wn1OnzJwrZr9TvBY94zPwVGc/oIxHOnNHVGT9hibjOjpj4qxkCYPodWrQ1tof
         3J9gheuXanCxE1ays5Vks5X19rf6NWuE95Uw9VESZgeohrZFPK3bRNS4o7VgNxxTUW8w
         QeHfq4rqs2U+UHcvjXPqWSC69Bv5adkme6dTHpuJ+8+k9hAheWSotab7biIy8vpWivx1
         uDXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si3969337edb.196.2019.07.11.10.32.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 10:32:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlcvh-0006Gg-Br
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 13:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34426)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hlcuI-0001eH-KX
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:31:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hlcuG-0003Cu-DA
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 13:30:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58606)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hlcuB-00038q-PU; Thu, 11 Jul 2019 13:30:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0C977309174E;
 Thu, 11 Jul 2019 17:30:51 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-46.ams2.redhat.com [10.36.116.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16D265C1B4;
 Thu, 11 Jul 2019 17:30:38 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Thu, 11 Jul 2019 19:28:29 +0200
Message-Id: <20190711172845.31035-14-eric.auger@redhat.com>
In-Reply-To: <20190711172845.31035-1-eric.auger@redhat.com>
References: <20190711172845.31035-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 11 Jul 2019 17:30:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC v4 13/29] pci: introduce PCIPASIDOps to PCIDevice
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
Cc: drjones@redhat.com, yi.l.liu@intel.com, mst@redhat.com,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, peterx@redhat.com,
 alex.williamson@redhat.com, vincent.stehle@arm.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TUEQvGXB68Xj

From: Liu Yi L <yi.l.liu@intel.com>

This patch introduces PCIPASIDOps for IOMMU related operations.

https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg00078.html
https://lists.gnu.org/archive/html/qemu-devel/2018-03/msg00940.html

So far, to setup virt-SVA for assigned SVA capable device, needs to
configure host translation structures for specific pasid. (e.g. bind
guest page table to host and enable nested translation in host).
Besides, vIOMMU emulator needs to forward guest's cache invalidation
to host since host nested translation is enabled. e.g. on VT-d, guest
owns 1st level translation table, thus cache invalidation for 1st
level should be propagated to host.

This patch adds two functions: alloc_pasid and free_pasid to support
guest pasid allocation and free. The implementations of the callbacks
would be device passthru modules. Like vfio.

Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
---
 hw/pci/pci.c             | 34 ++++++++++++++++++++++++++++++++++
 include/hw/iommu/iommu.h |  3 +++
 include/hw/pci/pci.h     | 11 +++++++++++
 3 files changed, 48 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8076a80ab3..43c0cef2f6 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2626,6 +2626,40 @@ void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn,=
 void *opaque)
     bus->iommu_opaque =3D opaque;
 }
=20
+void pci_setup_pasid_ops(PCIDevice *dev, PCIPASIDOps *ops)
+{
+    assert(ops && !dev->pasid_ops);
+    dev->pasid_ops =3D ops;
+}
+
+bool pci_device_is_pasid_ops_set(PCIBus *bus, int32_t devfn)
+{
+    PCIDevice *dev;
+
+    if (!bus) {
+        return false;
+    }
+
+    dev =3D bus->devices[devfn];
+    return !!(dev && dev->pasid_ops);
+}
+
+int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn,
+                               IOMMUConfig *config)
+{
+    PCIDevice *dev;
+
+    if (!bus) {
+        return -EINVAL;
+    }
+
+    dev =3D bus->devices[devfn];
+    if (dev && dev->pasid_ops && dev->pasid_ops->set_pasid_table) {
+        return dev->pasid_ops->set_pasid_table(bus, devfn, config);
+    }
+    return -ENOENT;
+}
+
 static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
 {
     Range *range =3D opaque;
diff --git a/include/hw/iommu/iommu.h b/include/hw/iommu/iommu.h
index 9e60ece160..12092bda7b 100644
--- a/include/hw/iommu/iommu.h
+++ b/include/hw/iommu/iommu.h
@@ -12,6 +12,9 @@
=20
 #ifndef QEMU_HW_IOMMU_IOMMU_H
 #define QEMU_HW_IOMMU_IOMMU_H
+#ifdef __linux__
+#include <linux/iommu.h>
+#endif
=20
 typedef struct IOMMUConfig {
     union {
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index aaf1b9f70d..84be2847a5 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -9,6 +9,7 @@
 #include "hw/isa/isa.h"
=20
 #include "hw/pci/pcie.h"
+#include "hw/iommu/iommu.h"
=20
 extern bool pci_available;
=20
@@ -263,6 +264,11 @@ struct PCIReqIDCache {
 };
 typedef struct PCIReqIDCache PCIReqIDCache;
=20
+typedef struct PCIPASIDOps PCIPASIDOps;
+struct PCIPASIDOps {
+    int (*set_pasid_table)(PCIBus *bus, int32_t devfn, IOMMUConfig *conf=
ig);
+};
+
 struct PCIDevice {
     DeviceState qdev;
=20
@@ -352,6 +358,7 @@ struct PCIDevice {
     MSIVectorUseNotifier msix_vector_use_notifier;
     MSIVectorReleaseNotifier msix_vector_release_notifier;
     MSIVectorPollNotifier msix_vector_poll_notifier;
+    PCIPASIDOps *pasid_ops;
 };
=20
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
@@ -485,6 +492,10 @@ typedef AddressSpace *(*PCIIOMMUFunc)(PCIBus *, void=
 *, int);
 AddressSpace *pci_device_iommu_address_space(PCIDevice *dev);
 void pci_setup_iommu(PCIBus *bus, PCIIOMMUFunc fn, void *opaque);
=20
+void pci_setup_pasid_ops(PCIDevice *dev, PCIPASIDOps *ops);
+bool pci_device_is_pasid_ops_set(PCIBus *bus, int32_t devfn);
+int pci_device_set_pasid_table(PCIBus *bus, int32_t devfn, IOMMUConfig *=
config);
+
 static inline void
 pci_set_byte(uint8_t *config, uint8_t val)
 {
--=20
2.20.1

