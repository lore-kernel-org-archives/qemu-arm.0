Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp149217ejb;
        Fri, 14 Jun 2024 02:54:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWloPxOVna3Jk1zB4z+fySjaKQb7vRkF31+rtSfKTkMhpayP2Zg9jZPmZaoLBN/G1YQBUIsAbQTg1UqV+cItJgk5Q0awaxP
X-Google-Smtp-Source: AGHT+IHPf/9FvctN3pucctNy1emxHi9GzIWv6jacDafuQfXxQ5WzzZgTUVnxevUTDDX1N7Q1zV2D
X-Received: by 2002:a05:620a:4145:b0:795:5896:f847 with SMTP id af79cd13be357-798d240e54dmr217388285a.32.1718358889542;
        Fri, 14 Jun 2024 02:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718358889; cv=none;
        d=google.com; s=arc-20160816;
        b=o1fFUKBE+vZRKLol5nY7B+YqD+JS+R08D6CERlme8ALmTP/0CfYW5VFjxUimTmoPlq
         TmxBCgC6xLH6vcGOKFpPfcDJZvyqtiCaLyRbUta7GL8eyKimQv3bbcVia9NV66IHBIHS
         wsDPwyO/wnpDlY5qDJFQ4yXnvOTgRwL0gtf3F4faNinweuw2E6KgJtPW9aVyOGKyswgM
         lUFwkoRL3y9kkN/ZYL1LYNF7nKSxIkk5O6jNE4qJN9wLhT2/+0SdgKBrokX9y/kxSFWi
         exxrUSqSjvMBFn+pnQV1sNWkEvkSMh+mu6T2IrS1tVLa399CKAJlPi3qbXRQBQvmceJw
         jrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TYVDyBaXbId670jhHS4RsXy3i9UaSll07aLmdQKxZ4M=;
        fh=NBkbC8z0yxZVnBu5+T/osSPCS2NzeZu/yHpj5pv7NrY=;
        b=jxV+Gg9SdK3NbGsX7A/F789A0OiLsXvo6hZktFYdcVAMA4LGCMPalQ5aC/f9daVshT
         vZFl+mnjvv0P2xR0slCCYotW3o347p0LDCZW0LhM7KH9so9yOaR8af3wvj+4jTsRxjsT
         BylaboYHpOtHib8UcXmniHroNnLr3k3W2FRNS04+9fpOz2tVItBLMKzsVGpENktUMLFB
         74TfeGK48fhSiRrsh2OwJbmUwhbRXzR59/N3s6yXiD//V0MKYtVecRhEDie+KalxajwH
         WLXGCpseSkyZR5AfsjzErznajMHl/XXDyztHSH4E+ef3nW6BY8LGbjiWb3P5xrc/ImTQ
         QGog==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EIDHD/2C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798abe5048esi331218485a.535.2024.06.14.02.54.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 02:54:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="EIDHD/2C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sI3dj-0006Ca-TZ; Fri, 14 Jun 2024 05:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sI3df-0006Ax-In
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 05:54:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1sI3dd-0003Xl-LV
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 05:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718358869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TYVDyBaXbId670jhHS4RsXy3i9UaSll07aLmdQKxZ4M=;
 b=EIDHD/2CJnYCD1vrIRiCGn9t/5SJVHJgOmWTDfVfl78KmFz8tGDKaNk7v5eSSCjaPZSSH1
 eTrsgOvnvN6S3VUqEbMSpCtQV9e+hvTGq5XxW2VsvE2AKU8OXrx7llNcx+8ubS1PwUONVi
 NQ6hNGPUvYWkew2oZJ8q8aZCOivDQg0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-577-krIfCD_2NC-8vCAhyz746g-1; Fri,
 14 Jun 2024 05:54:24 -0400
X-MC-Unique: krIfCD_2NC-8vCAhyz746g-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8220119560A2; Fri, 14 Jun 2024 09:54:23 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.191])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2CFE4300021A; Fri, 14 Jun 2024 09:54:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, clg@redhat.com, yanghliu@redhat.com,
 zhenzhong.duan@intel.com
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com
Subject: [PATCH v4 2/8] virtio-iommu: Implement set|unset]_iommu_device()
 callbacks
Date: Fri, 14 Jun 2024 11:52:52 +0200
Message-ID: <20240614095402.904691-3-eric.auger@redhat.com>
In-Reply-To: <20240614095402.904691-1-eric.auger@redhat.com>
References: <20240614095402.904691-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gUR4BuKyOomm

Implement PCIIOMMUOPs [set|unset]_iommu_device() callbacks.
In set(), the HostIOMMUDevice handle is stored in a hash
table indexed by PCI BDF. The object will allow to retrieve
information related to the physical IOMMU.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v3 -> v4:
- Simply use native HostIOMMUDevice instead of VirtioHostIOMMUDevice

v2 -> v3:
- include host_iommu_device.h in virtio-iommu.h header
- introduce hiod_destroy() and fix UAF in
  virtio_iommu_unset_iommu_device()
---
 include/hw/virtio/virtio-iommu.h |  2 +
 hw/virtio/virtio-iommu.c         | 82 ++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 83a52cc446..bdb3da72d0 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -25,6 +25,7 @@
 #include "hw/pci/pci.h"
 #include "qom/object.h"
 #include "qapi/qapi-types-virtio.h"
+#include "sysemu/host_iommu_device.h"
 
 #define TYPE_VIRTIO_IOMMU "virtio-iommu-device"
 #define TYPE_VIRTIO_IOMMU_PCI "virtio-iommu-pci"
@@ -57,6 +58,7 @@ struct VirtIOIOMMU {
     struct virtio_iommu_config config;
     uint64_t features;
     GHashTable *as_by_busptr;
+    GHashTable *host_iommu_devices;
     IOMMUPciBus *iommu_pcibus_by_bus_num[PCI_BUS_MAX];
     PCIBus *primary_bus;
     ReservedRegion *prop_resv_regions;
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 1326c6ec41..16c8ec3ca4 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -69,6 +69,11 @@ typedef struct VirtIOIOMMUMapping {
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
@@ -462,8 +467,82 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
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
+static void hiod_destroy(gpointer v)
+{
+    object_unref(v);
+}
+
+static HostIOMMUDevice *
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
+    struct hiod_key *new_key;
+
+    assert(hiod);
+
+    if (get_host_iommu_device(viommu, bus, devfn)) {
+        error_setg(errp, "Host IOMMU device already exists");
+        return false;
+    }
+
+    new_key = g_malloc(sizeof(*new_key));
+    new_key->bus = bus;
+    new_key->devfn = devfn;
+
+    object_ref(hiod);
+    g_hash_table_insert(viommu->host_iommu_devices, new_key, hiod);
+
+    return true;
+}
+
+static void
+virtio_iommu_unset_iommu_device(PCIBus *bus, void *opaque, int devfn)
+{
+    VirtIOIOMMU *viommu = opaque;
+    HostIOMMUDevice *hiod;
+    struct hiod_key key = {
+        .bus = bus,
+        .devfn = devfn,
+    };
+
+    hiod = g_hash_table_lookup(viommu->host_iommu_devices, &key);
+    if (!hiod) {
+        return;
+    }
+
+    g_hash_table_remove(viommu->host_iommu_devices, &key);
+}
+
 static const PCIIOMMUOps virtio_iommu_ops = {
     .get_address_space = virtio_iommu_find_add_as,
+    .set_iommu_device = virtio_iommu_set_iommu_device,
+    .unset_iommu_device = virtio_iommu_unset_iommu_device,
 };
 
 static int virtio_iommu_attach(VirtIOIOMMU *s,
@@ -1357,6 +1436,9 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 
     s->as_by_busptr = g_hash_table_new_full(NULL, NULL, NULL, g_free);
 
+    s->host_iommu_devices = g_hash_table_new_full(hiod_hash, hiod_equal,
+                                                  g_free, hiod_destroy);
+
     if (s->primary_bus) {
         pci_setup_iommu(s->primary_bus, &virtio_iommu_ops, s);
     } else {
-- 
2.41.0

