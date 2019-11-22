Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp723283lfc;
        Fri, 22 Nov 2019 10:34:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwexnTCkzSz8TluOgSwZyni8ogN1NQssRZR8ShMQyvCg4tM0qnOQf6corsuDdKguBqqriFH
X-Received: by 2002:ad4:4b08:: with SMTP id r8mr14931340qvw.75.1574447640602;
        Fri, 22 Nov 2019 10:34:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574447640; cv=none;
        d=google.com; s=arc-20160816;
        b=vrUCB6CjTD46RGcXTUpmRE1TDNwCB/K6Ud9Dded8OU46+h8FA/UFpVTuhuW5BQJsWm
         nitC16cybJHVPsFQei/omKlGMupUQAPtANPI3oy3bZpdDSQTMqVGwBI5c12CGjZf41go
         jBn6o4i676QHVWsFFyWeqsdlDQ5EhNK2gzCe1THq//DNKG8WXkAVcN6kvddSw5LNCJ1n
         fPOImIn3ji1+Wl0rdWL+FLmR4WRZlTuY4jbkxdZQiM0vJhaMrG24k/jbW/fnINqaoocw
         iLAwCsnl8xrt8GB3qMbH8s1a12A5Df6imnH2uWCrlZSEaRJhswtrQBLL00JSF/JE95ux
         wJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=IYq9Kbn8tUyBJ5YbMtHCok3UyrIzqucJ1IOR+X4VnBk=;
        b=fkCuf8S9lX0r25+5J4K5mpnu/EDDSv2xEIVgEZvgWBh/g/EKgR4F3ks8HFCy4X6aKZ
         hcX+PAZNtM833rCR7jr3azycJdURzwDVQBtFBeiaDW6+hpZLgxuHtbjqU5GssdHuZD8c
         PLDvY605Gn70z4f+Vpss9SFuV4Ac8BCLPotbACRYC0RN40Jq/w4BU1ZAkEQXiXR/OCIa
         SnKAWwzznOa+XB/IgMC4ZmKXaI2cCmkSnRaPNhUmZNZcPaE46AaEymBnrpoohomICfSe
         RG6H1RS0NopLKZIMZipDw/YZTrrHOZ3F/kixAngD1KPmRQ9qPoOt340FjufSzloVGOKj
         TzDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J+Xp0n4u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si358556qvl.122.2019.11.22.10.34.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Nov 2019 10:34:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=J+Xp0n4u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iYDkk-0002vi-TX
	for alex.bennee@linaro.org; Fri, 22 Nov 2019 13:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39697)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1iYDhU-00087X-BC
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:30:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1iYDhS-0008Rr-A2
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:30:36 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49164)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1iYDhS-0008RM-59
 for qemu-arm@nongnu.org; Fri, 22 Nov 2019 13:30:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574447433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYq9Kbn8tUyBJ5YbMtHCok3UyrIzqucJ1IOR+X4VnBk=;
 b=J+Xp0n4uIdbR+ujSr+Ekf1F8leYR/7nufOkxvC4O1yZt1fh8BT82Stnzham19x1nmY1Q22
 iUFgCa/iUffmFqVijtr1pgSbIHFE8E1RLUFGXfbkne4xVrhSlnny//LHBNbM6m0aw6VXH5
 j+3xASownj16pfVJLBWwE7EVITT5GI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-tMeRrcjlNSme2BkKYasAVw-1; Fri, 22 Nov 2019 13:30:32 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83A70108C303;
 Fri, 22 Nov 2019 18:30:30 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 273536E712;
 Fri, 22 Nov 2019 18:30:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, jean-philippe.brucker@arm.com, bharatb.linux@gmail.com,
 yang.zhong@intel.com, dgilbert@redhat.com, quintela@redhat.com
Subject: [PATCH for-5.0 v11 04/20] virtio-iommu: Add the iommu regions
Date: Fri, 22 Nov 2019 19:29:27 +0100
Message-Id: <20191122182943.4656-5-eric.auger@redhat.com>
In-Reply-To: <20191122182943.4656-1-eric.auger@redhat.com>
References: <20191122182943.4656-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: tMeRrcjlNSme2BkKYasAVw-1
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
X-TUID: GmUVAo4X8Dvm

This patch initializes the iommu memory regions so that
PCIe end point transactions get translated. The translation
function is not yet implemented though.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v10 -> v11:
- use g_hash_table_new_full for allocating as_by_busptr

v9 -> v10:
- remove pc/virt machine headers
- virtio_iommu_find_add_as: mr_index introduced in that patch
  and name properly freed

v6 -> v7:
- use primary_bus
- rebase on new translate proto featuring iommu_idx

v5 -> v6:
- include qapi/error.h
- fix g_hash_table_lookup key in virtio_iommu_find_add_as

v4 -> v5:
- use PCI bus handle as a key
- use get_primary_pci_bus() callback

v3 -> v4:
- add trace_virtio_iommu_init_iommu_mr

v2 -> v3:
- use IOMMUMemoryRegion
- iommu mr name built with BDF
- rename smmu_get_sid into virtio_iommu_get_sid and use PCI_BUILD_BDF
---
 hw/virtio/trace-events           |  2 +
 hw/virtio/virtio-iommu.c         | 92 ++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |  2 +
 3 files changed, 96 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index c7276116e7..b32169d56c 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -65,3 +65,5 @@ virtio_iommu_attach(uint32_t domain_id, uint32_t ep_id) "=
domain=3D%d endpoint=3D%d"
 virtio_iommu_detach(uint32_t domain_id, uint32_t ep_id) "domain=3D%d endpo=
int=3D%d"
 virtio_iommu_map(uint32_t domain_id, uint64_t virt_start, uint64_t virt_en=
d, uint64_t phys_start, uint32_t flags) "domain=3D%d virt_start=3D0x%"PRIx6=
4" virt_end=3D0x%"PRIx64 " phys_start=3D0x%"PRIx64" flags=3D%d"
 virtio_iommu_unmap(uint32_t domain_id, uint64_t virt_start, uint64_t virt_=
end) "domain=3D%d virt_start=3D0x%"PRIx64" virt_end=3D0x%"PRIx64
+virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, int =
flag) "mr=3D%s rid=3D%d addr=3D0x%"PRIx64" flag=3D%d"
+virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index afd6397ac9..2d7b1752b7 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -23,6 +23,8 @@
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio.h"
 #include "sysemu/kvm.h"
+#include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "trace.h"
=20
 #include "standard-headers/linux/virtio_ids.h"
@@ -34,6 +36,50 @@
 /* Max size */
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
=20
+static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)
+{
+    return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
+}
+
+static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
+                                              int devfn)
+{
+    VirtIOIOMMU *s =3D opaque;
+    IOMMUPciBus *sbus =3D g_hash_table_lookup(s->as_by_busptr, bus);
+    static uint32_t mr_index;
+    IOMMUDevice *sdev;
+
+    if (!sbus) {
+        sbus =3D g_malloc0(sizeof(IOMMUPciBus) +
+                         sizeof(IOMMUDevice *) * IOMMU_PCI_DEVFN_MAX);
+        sbus->bus =3D bus;
+        g_hash_table_insert(s->as_by_busptr, bus, sbus);
+    }
+
+    sdev =3D sbus->pbdev[devfn];
+    if (!sdev) {
+        char *name =3D g_strdup_printf("%s-%d-%d",
+                                     TYPE_VIRTIO_IOMMU_MEMORY_REGION,
+                                     mr_index++, devfn);
+        sdev =3D sbus->pbdev[devfn] =3D g_malloc0(sizeof(IOMMUDevice));
+
+        sdev->viommu =3D s;
+        sdev->bus =3D bus;
+        sdev->devfn =3D devfn;
+
+        trace_virtio_iommu_init_iommu_mr(name);
+
+        memory_region_init_iommu(&sdev->iommu_mr, sizeof(sdev->iommu_mr),
+                                 TYPE_VIRTIO_IOMMU_MEMORY_REGION,
+                                 OBJECT(s), name,
+                                 UINT64_MAX);
+        address_space_init(&sdev->as,
+                           MEMORY_REGION(&sdev->iommu_mr), TYPE_VIRTIO_IOM=
MU);
+        g_free(name);
+    }
+    return &sdev->as;
+}
+
 static int virtio_iommu_attach(VirtIOIOMMU *s,
                                struct virtio_iommu_req_attach *req)
 {
@@ -172,6 +218,27 @@ out:
     }
 }
=20
+static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr =
addr,
+                                            IOMMUAccessFlags flag,
+                                            int iommu_idx)
+{
+    IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);
+    uint32_t sid;
+
+    IOMMUTLBEntry entry =3D {
+        .target_as =3D &address_space_memory,
+        .iova =3D addr,
+        .translated_addr =3D addr,
+        .addr_mask =3D ~(hwaddr)0,
+        .perm =3D IOMMU_NONE,
+    };
+
+    sid =3D virtio_iommu_get_sid(sdev);
+
+    trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
+    return entry;
+}
+
 static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t *config_da=
ta)
 {
     VirtIOIOMMU *dev =3D VIRTIO_IOMMU(vdev);
@@ -252,6 +319,15 @@ static void virtio_iommu_device_realize(DeviceState *d=
ev, Error **errp)
     virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
=20
     qemu_mutex_init(&s->mutex);
+
+    memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
+    s->as_by_busptr =3D g_hash_table_new_full(NULL, NULL, NULL, g_free);
+
+    if (s->primary_bus) {
+        pci_setup_iommu(s->primary_bus, virtio_iommu_find_add_as, s);
+    } else {
+        error_setg(errp, "VIRTIO-IOMMU is not attached to any PCI bus!");
+    }
 }
=20
 static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp)
@@ -310,6 +386,14 @@ static void virtio_iommu_class_init(ObjectClass *klass=
, void *data)
     vdc->vmsd =3D &vmstate_virtio_iommu_device;
 }
=20
+static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
+                                                  void *data)
+{
+    IOMMUMemoryRegionClass *imrc =3D IOMMU_MEMORY_REGION_CLASS(klass);
+
+    imrc->translate =3D virtio_iommu_translate;
+}
+
 static const TypeInfo virtio_iommu_info =3D {
     .name =3D TYPE_VIRTIO_IOMMU,
     .parent =3D TYPE_VIRTIO_DEVICE,
@@ -318,9 +402,17 @@ static const TypeInfo virtio_iommu_info =3D {
     .class_init =3D virtio_iommu_class_init,
 };
=20
+static const TypeInfo virtio_iommu_memory_region_info =3D {
+    .parent =3D TYPE_IOMMU_MEMORY_REGION,
+    .name =3D TYPE_VIRTIO_IOMMU_MEMORY_REGION,
+    .class_init =3D virtio_iommu_memory_region_class_init,
+};
+
+
 static void virtio_register_types(void)
 {
     type_register_static(&virtio_iommu_info);
+    type_register_static(&virtio_iommu_memory_region_info);
 }
=20
 type_init(virtio_register_types)
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-io=
mmu.h
index 4d47b6abeb..f55f48d304 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -28,6 +28,8 @@
 #define VIRTIO_IOMMU(obj) \
         OBJECT_CHECK(VirtIOIOMMU, (obj), TYPE_VIRTIO_IOMMU)
=20
+#define TYPE_VIRTIO_IOMMU_MEMORY_REGION "virtio-iommu-memory-region"
+
 #define IOMMU_PCI_BUS_MAX      256
 #define IOMMU_PCI_DEVFN_MAX    256
=20
--=20
2.20.1

