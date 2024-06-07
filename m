Received: by 2002:a17:906:acd:b0:a66:557b:2f6e with SMTP id z13csp1246101ejf;
        Fri, 7 Jun 2024 16:51:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUQfIZHebyVJXiAKcliNGWaKa/t8oZzW5/kxMZr0uR2ZbPRJ5Rkb5xkPA0ph380KzxxmhgBFRtJ2/CCbsxW+w7fVGLbXALB
X-Google-Smtp-Source: AGHT+IEld3pceXK/oYNze41M7fBGpr6sR2TR9Uv5Yt6lXlo04ChmoRYqnUBe9fn9wX3OrPj53OtG
X-Received: by 2002:a05:620a:29c2:b0:794:a993:711e with SMTP id af79cd13be357-7953c31d34emr494417585a.16.1717804271258;
        Fri, 07 Jun 2024 16:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717804271; cv=none;
        d=google.com; s=arc-20160816;
        b=KR1uOf1B2KOLxW6da5IG2hDe2g8wyNLFo+o5GjjdXZQUjSoOkDfzcKjxSOw8MlUiru
         PAyFX+WcvKaweoBf6qsWWWChq60MpRCZVOu8M7OxB9uqNkkFYrMXHD79bjzbK4liWkYD
         LD/jzF/c5cSNeZM57aRUiDyYwKFeugp9JiMvOfxAV0xUoRtU5CFWuwH2vwm6XiNsr8zs
         Edb3k1Ny3rpoY+Cl+cBuDtvojRpZa0hqW0MX5y21a9BuP30PujPxznaa7NPv33e1F9i2
         wYh3vPoEq55wWI62z+VRfn5KWKQY5GosWX7njT29YGr9NjZqj8KVDltPQX/1YoWz+cPO
         08AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sxoYtCwqn6c+3/9Ce6QALKIyPjypJJl1PydGzJDqgAc=;
        fh=RVuuaU7Ghp1omAcM/aHHQKcSvJxs+IjfJSTvOY2eDr8=;
        b=V/ZjqN/ovr17NKVmDCQDKtx6W8ai0L5pPTzAeuyKPV89V7xmtoDIE4CdEuXcW0Mu9L
         Zc9G9Y7N2TsBsp9j2kTfvLOhayDU7RcQCBUVYA5qb1Uf0Za3aUI/aR1I+W9028ZZcY96
         louN5mM8BdQ+IefnE/cOJyvsfbQ1FMR4tcD0i2SOeWwIj+q6plpgu1CbQmuTn3ZRBr3O
         Qdanf8G7orGj3KwPoHEA0NFQYZBQA0KCUTM49lU9V3M0UV+4qMbLMe7G443g5NcIUlKd
         cLqj2dIzwVVqFRQIqzBmnCaKW7ENGZXvGdg/oZ60DuzxqqHa+fIREGtRsPEs/sfDGj3+
         +d/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AkOdpJlv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79538894eb0si431942385a.325.2024.06.07.16.51.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2024 16:51:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AkOdpJlv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sFakj-0005kT-I8; Fri, 07 Jun 2024 10:39:37 -0400
Received: from [2001:470:142:3::10] (helo=eggs.gnu.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sFaki-0005cy-Ky
 for qemu-devel@nongnu.org; Fri, 07 Jun 2024 10:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sFakh-0003Oa-2i
 for qemu-devel@nongnu.org; Fri, 07 Jun 2024 10:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717771174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxoYtCwqn6c+3/9Ce6QALKIyPjypJJl1PydGzJDqgAc=;
 b=AkOdpJlvTIHM3limNwW7n7xsOYYOme78iQbY9I1fbWjPYJwCwPajSVHUp5lNl6zdD8UFbB
 KqcNDbNZopG3h3Jqh766mI8o3JQcLV7pn1RRx5Vgqi1nTqd4xYoQJGkQH7x+mMxFt541Up
 ZrfFisQ94u47ZoD0NDjEbVZx2+re8eU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-JNvzNWrMMkeB4zzqKL3pMA-1; Fri,
 07 Jun 2024 10:39:28 -0400
X-MC-Unique: JNvzNWrMMkeB4zzqKL3pMA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A7D7D1955F36; Fri,  7 Jun 2024 14:39:26 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 81D1A1956050; Fri,  7 Jun 2024 14:39:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 imammedo@redhat.com, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com, zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [RFC v2 2/7] virtio-iommu: Implement set|unset]_iommu_device()
 callbacks
Date: Fri,  7 Jun 2024 16:37:22 +0200
Message-ID: <20240607143905.765133-3-eric.auger@redhat.com>
In-Reply-To: <20240607143905.765133-1-eric.auger@redhat.com>
References: <20240607143905.765133-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hwPrVOhFpUkj

Implement PCIIOMMUOPs [set|unset]_iommu_device() callbacks.
In set(), a VirtioHostIOMMUDevice is allocated which holds
a reference to the HostIOMMUDevice. This object is stored in a hash
table indexed by PCI BDF. The handle to the Host IOMMU device
will allow to retrieve information related to the physical IOMMU.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/virtio/virtio-iommu.h |  9 ++++
 hw/virtio/virtio-iommu.c         | 87 ++++++++++++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 83a52cc446..4f664ea0c4 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -45,6 +45,14 @@ typedef struct IOMMUDevice {
     bool probe_done;
 } IOMMUDevice;
 
+typedef struct VirtioHostIOMMUDevice {
+    void *viommu;
+    PCIBus *bus;
+    uint8_t devfn;
+    HostIOMMUDevice *dev;
+    QLIST_ENTRY(VirtioHostIOMMUDevice) next;
+} VirtioHostIOMMUDevice;
+
 typedef struct IOMMUPciBus {
     PCIBus       *bus;
     IOMMUDevice  *pbdev[]; /* Parent array is sparse, so dynamically alloc */
@@ -57,6 +65,7 @@ struct VirtIOIOMMU {
     struct virtio_iommu_config config;
     uint64_t features;
     GHashTable *as_by_busptr;
+    GHashTable *host_iommu_devices;
     IOMMUPciBus *iommu_pcibus_by_bus_num[PCI_BUS_MAX];
     PCIBus *primary_bus;
     ReservedRegion *prop_resv_regions;
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1326c6ec41..0680a357f0 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -28,6 +28,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/host_iommu_device.h"
 #include "qemu/reserved-region.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
@@ -69,6 +70,11 @@ typedef struct VirtIOIOMMUMapping {
     uint32_t flags;
 } VirtIOIOMMUMapping;
 
+struct hiod_key {
+    PCIBus *bus;
+    uint8_t devfn;
+};
+
 static inline uint16_t virtio_iommu_get_bdf(IOMMUDevice *dev)
 {
     return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
@@ -462,8 +468,86 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
     return &sdev->as;
 }
 
+static gboolean hiod_equal(gconstpointer v1, gconstpointer v2)
+{
+    const struct hiod_key *key1 = v1;
+    const struct hiod_key *key2 = v2;
+
+    return (key1->bus == key2->bus) && (key1->devfn == key2->devfn);
+}
+
+static guint hiod_hash(gconstpointer v)
+{
+    const struct hiod_key *key = v;
+    guint value = (guint)(uintptr_t)key->bus;
+
+    return (guint)(value << 8 | key->devfn);
+}
+
+static VirtioHostIOMMUDevice *
+get_host_iommu_device(VirtIOIOMMU *viommu, PCIBus *bus, int devfn) {
+    struct hiod_key key = {
+        .bus = bus,
+        .devfn = devfn,
+    };
+
+    return g_hash_table_lookup(viommu->host_iommu_devices, &key);
+}
+
+static bool virtio_iommu_set_iommu_device(PCIBus *bus, void *opaque, int devfn,
+                                          HostIOMMUDevice *hiod, Error **errp)
+{
+    VirtIOIOMMU *viommu = opaque;
+    VirtioHostIOMMUDevice *vhiod;
+    struct hiod_key *new_key;
+
+    assert(hiod);
+
+    vhiod = get_host_iommu_device(viommu, bus, devfn);
+    if (vhiod) {
+        error_setg(errp, "VirtioHostIOMMUDevice already exists");
+        return false;
+    }
+
+    vhiod = g_malloc0(sizeof(VirtioHostIOMMUDevice));
+    vhiod->bus = bus;
+    vhiod->devfn = (uint8_t)devfn;
+    vhiod->viommu = viommu;
+    vhiod->dev = hiod;
+
+    new_key = g_malloc(sizeof(*new_key));
+    new_key->bus = bus;
+    new_key->devfn = devfn;
+
+    object_ref(hiod);
+    g_hash_table_insert(viommu->host_iommu_devices, new_key, vhiod);
+
+    return true;
+}
+
+static void
+virtio_iommu_unset_iommu_device(PCIBus *bus, void *opaque, int devfn)
+{
+    VirtIOIOMMU *viommu = opaque;
+    VirtioHostIOMMUDevice *vhiod;
+    struct hiod_key key = {
+        .bus = bus,
+        .devfn = devfn,
+    };
+
+    vhiod = g_hash_table_lookup(viommu->host_iommu_devices, &key);
+    if (!vhiod) {
+        return;
+    }
+
+    g_hash_table_remove(viommu->host_iommu_devices, &key);
+    object_unref(vhiod->dev);
+}
+
 static const PCIIOMMUOps virtio_iommu_ops = {
     .get_address_space = virtio_iommu_find_add_as,
+    .set_iommu_device = virtio_iommu_set_iommu_device,
+    .unset_iommu_device = virtio_iommu_unset_iommu_device,
 };
 
 static int virtio_iommu_attach(VirtIOIOMMU *s,
@@ -1357,6 +1441,9 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 
     s->as_by_busptr = g_hash_table_new_full(NULL, NULL, NULL, g_free);
 
+    s->host_iommu_devices = g_hash_table_new_full(hiod_hash, hiod_equal,
+                                                  g_free, g_free);
+
     if (s->primary_bus) {
         pci_setup_iommu(s->primary_bus, &virtio_iommu_ops, s);
     } else {
-- 
2.41.0

