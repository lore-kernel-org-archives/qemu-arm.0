Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp572153wrw;
        Fri, 9 Nov 2018 03:36:30 -0800 (PST)
X-Google-Smtp-Source: AJdET5fSZxtx41YxlNFk36kmY++MlKkSkg+YRNdX0FbkWx6VGzA8+jfZ0MtWif8uc690unBOYlA+
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr8396185qvj.228.1541763390119;
        Fri, 09 Nov 2018 03:36:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541763390; cv=none;
        d=google.com; s=arc-20160816;
        b=UJYAy4CYh/UjOnEImkeS8g3Byj03tih8o1hapfPU7DRwWuhR+/ETz24G1DAeDrl7JG
         erdoug9LTVc6HjxvVWdds05IEOSIs67UxCfwJdZdzOyrLv85tYzQVzThtIBMNHb/C9BX
         gmB7jkeTnMtB7R0VPSFsghIWabbhFGKqgpZA8Eu7uVLWmpTMZ7aaMzxn6FbqLvILeUOx
         zjKxCHBPjUjZCXq7UmkOsCUOjpVKG/GaWhxDYU2D4Rf65WHjAeOIfsq438LODJyYI80R
         6vwCdl1c8Z1ill+FBhT7fbdhvg+Tm6mW/+s8PHrfQuodwapZ/qluL1f/bXXzrup6SaX/
         pwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=2nmnu0njWTd6aCRzPK3ayrySw8bNwX/Ru3Kd4wjLfUM=;
        b=dAToP9bRLSOvYwp5yJce2K8TijfUUt6UgOhSJnXIlJpQFyqCIeTUdimUgZoVCnNgel
         Ac99zuLU67gbLZRH0wYPS7G9+I8FVOc5FK1HVwM7GB54Sq+TpB40Q91J0Y3lHnk4DXIO
         /Z1ZigLCSpq4vIrl3ZmJWEUe7OzgN27/AifbZK8mIetV+RozoSKsS/354HsnfwOI4C2u
         /VFNb/Ex17FvtYceJHpOrvvU9PExRraj5Ii7jgKeK90BUPunSEkxxW/x6lA0UJdScCxl
         vJp+yQikSizmlkdk7ru7QvCVWpEnPBcXs+c9ZXxPiXHNTC4VTTK459nusZ47k+eBzmUf
         9rwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z5si133510qvo.132.2018.11.09.03.36.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 03:36:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL55R-0004Cr-JW
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 06:36:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL505-0006mb-Og
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gL504-0001By-Os
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 06:30:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51608)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gL504-00018v-DW; Fri, 09 Nov 2018 06:30:56 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80049308339D;
	Fri,  9 Nov 2018 11:30:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-55.ams2.redhat.com [10.36.116.55])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 396BD5C219;
	Fri,  9 Nov 2018 11:30:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
	jean-philippe.brucker@arm.com
Date: Fri,  9 Nov 2018 12:29:50 +0100
Message-Id: <20181109112957.10067-12-eric.auger@redhat.com>
In-Reply-To: <20181109112957.10067-1-eric.auger@redhat.com>
References: <20181109112957.10067-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 09 Nov 2018 11:30:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v8 11/18] virtio-iommu: Add an msi_bypass property
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
X-TUID: rMnSnvXvpnN7

In case the msi_bypass property is set, it means we need
to register the IOAPIC MSI window as a reserved region:
0xFEE00000 - 0xFEEFFFFF.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
---
 hw/virtio/virtio-iommu.c         | 52 ++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-iommu.h |  1 +
 2 files changed, 53 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 6164b5a7d1..e6ad8a0c61 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -41,6 +41,9 @@
 #define VIOMMU_DEFAULT_QUEUE_SIZE 256
 #define VIOMMU_PROBE_SIZE 512
 
+#define IOAPIC_RANGE_START      (0xfee00000)
+#define IOAPIC_RANGE_SIZE       (0x100000)
+
 #define SUPPORTED_PROBE_PROPERTIES (\
     VIRTIO_IOMMU_PROBE_T_NONE | \
     VIRTIO_IOMMU_PROBE_T_RESV_MEM)
@@ -103,6 +106,25 @@ static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
     ep->domain = NULL;
 }
 
+static void virtio_iommu_register_resv_region(viommu_endpoint *ep,
+                                              uint8_t subtype,
+                                              uint64_t start, uint64_t end)
+{
+    viommu_interval *interval;
+    struct virtio_iommu_probe_resv_mem *reg;
+
+    interval = g_malloc0(sizeof(*interval));
+    interval->low = start;
+    interval->high = end;
+
+    reg = g_malloc0(sizeof(*reg));
+    reg->subtype = subtype;
+    reg->start = cpu_to_le64(start);
+    reg->end = cpu_to_le64(end);
+
+    g_tree_insert(ep->reserved_regions, interval, reg);
+}
+
 static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
                                                   uint32_t ep_id)
 {
@@ -120,6 +142,12 @@ static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
     ep->reserved_regions = g_tree_new_full((GCompareDataFunc)interval_cmp,
                                             NULL, (GDestroyNotify)g_free,
                                             (GDestroyNotify)g_free);
+    if (s->msi_bypass) {
+        virtio_iommu_register_resv_region(ep, VIRTIO_IOMMU_RESV_MEM_T_MSI,
+                                          IOAPIC_RANGE_START,
+                                          IOAPIC_RANGE_SIZE);
+    }
+
     return ep;
 }
 
@@ -864,8 +892,32 @@ static void virtio_iommu_set_status(VirtIODevice *vdev, uint8_t status)
     trace_virtio_iommu_device_status(status);
 }
 
+static bool virtio_iommu_get_msi_bypass(Object *obj, Error **errp)
+{
+    VirtIOIOMMU *s = VIRTIO_IOMMU(obj);
+
+    return s->msi_bypass;
+}
+
+static void virtio_iommu_set_msi_bypass(Object *obj, bool value, Error **errp)
+{
+    VirtIOIOMMU *s = VIRTIO_IOMMU(obj);
+
+    s->msi_bypass = value;
+}
+
 static void virtio_iommu_instance_init(Object *obj)
 {
+    VirtIOIOMMU *s = VIRTIO_IOMMU(obj);
+
+    object_property_add_bool(obj, "msi_bypass", virtio_iommu_get_msi_bypass,
+                             virtio_iommu_set_msi_bypass, NULL);
+    object_property_set_description(obj, "msi_bypass",
+                                    "Indicates whether msis are bypassed by "
+                                    "the IOMMU. Default is YES",
+                                    NULL);
+
+    s->msi_bypass = true;
 }
 
 static const VMStateDescription vmstate_virtio_iommu = {
diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index f55f48d304..56c8b4e57f 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -59,6 +59,7 @@ typedef struct VirtIOIOMMU {
     GTree *domains;
     QemuMutex mutex;
     GTree *endpoints;
+    bool msi_bypass;
 } VirtIOIOMMU;
 
 #endif
-- 
2.17.2

