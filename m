Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp527027ejb;
        Thu, 19 Oct 2023 06:49:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOJ7JLJIlggO1NUt2qFfrzzw2TThJHqfjkLC+XbFCam1NRF3iXg6Rm4BFu7EP4F1kvXTcC
X-Received: by 2002:a05:6808:3c4:b0:3a1:e17a:b3fb with SMTP id o4-20020a05680803c400b003a1e17ab3fbmr2006277oie.1.1697723346966;
        Thu, 19 Oct 2023 06:49:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697723346; cv=none;
        d=google.com; s=arc-20160816;
        b=IkkkVd9Bp8s3zDPr8c272upqFhUMM6VkdxgPerGQzactBKuj3ebC6rBafH7BSHi4JI
         Ncgvy7OO2j9MKpMDzc0TxoNY6ZYghdwcyjAK8w6lC1WCa3MavYaf12jkZmL0sTdfN2WK
         tztM8QbuwE5E/Iyn0sshyeqVaS4BYnDwxsFphhdaPyCW0rExBl82uCzka0/rg95DAuvA
         zx0ZorhBwLhcG9dhDSvHaCP4/lEnJFd3iqpsPdpX9J5EF9WwDcMQ2WsESSIGC0vrvNJa
         GnPtJqn/4wfaGWZfZCe/oyeCnZbnrYo8/ZYjSd6MG5XUHHAFJgbd72SWLRLzH5smL238
         SV7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZyxvKKV37UEkSIVN7bDkdAQ3nGiGEA0Bs3s8lC1e/vQ=;
        fh=tKh4J0nBsRIusPtBH+FcUVX1EUO0S/KOQKlAHLEPEHM=;
        b=vK2Av2FbmOVvTK1lMNd4zT28+ZhOWbLn9i5RqRbKE6xt20OiFjmwD5LxSDFcerVnG/
         Bw/LySitDYHIqulokYq6AnATNqj06Sjx7Phcw+6+hat5tZGyCrd3FgfDoq6RFMhtPnW5
         Mr3iNUQF6a0rMjXIc5P2UJhJG5nVDc1jtRpMmLuWHfdfXXk8DJwlpgx9xxjL6DLIExBy
         +2diQh5VaOHIHYRH3Y2+WiuMB0ZJqclpZdpek8eWENiCEwRfiIkj07IhpNx+KGpir44D
         ZvN6ggCMRPZ1jJadbX4pMWkl8J0nIwqq/DW1FvhDsWieQvBh7Vxmlq8AA6qSYz4bo483
         Bpug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iHvPutWi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10-20020a37c24a000000b00773bbc97627si1495538qkm.467.2023.10.19.06.49.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:49:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iHvPutWi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtTNC-0001UN-Os; Thu, 19 Oct 2023 09:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTMx-0001Iz-Mu
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:47:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTMv-0002wv-LT
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:47:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697723241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZyxvKKV37UEkSIVN7bDkdAQ3nGiGEA0Bs3s8lC1e/vQ=;
 b=iHvPutWiIseGSBKDKQU0IvikKBEdaYy8HulLidWhuP+nFZzfN4R+4ZHzB7xyYovRODT9mv
 gMKp55GecZ4trhWzFTTAuakVU9b8v+2pezjEKAmaQ3Y+c5iMGfRZBqTjMvXqIc3OlaMMjD
 mzhtzVHjZ2jkOq5rGgmA8Cb7S7LrIXI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-h0DAROapOf-w1cq3aHOeBw-1; Thu, 19 Oct 2023 09:47:18 -0400
X-MC-Unique: h0DAROapOf-w1cq3aHOeBw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43AC83C0F457;
 Thu, 19 Oct 2023 13:47:17 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 904E3492BFA;
 Thu, 19 Oct 2023 13:47:14 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 yanghliu@redhat.com
Subject: [PATCH v4 07/12] virtio-iommu: Introduce per IOMMUDevice reserved
 regions
Date: Thu, 19 Oct 2023 15:45:13 +0200
Message-ID: <20231019134651.842175-8-eric.auger@redhat.com>
In-Reply-To: <20231019134651.842175-1-eric.auger@redhat.com>
References: <20231019134651.842175-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: EoVXEk+d4QqK

For the time being the per device reserved regions are
just a duplicate of IOMMU wide reserved regions. Subsequent
patches will combine those with host reserved regions, if any.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Yanghang Liu <yanghliu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

---

v2 -> v3:
- do the initialization of the GList when creating the IOMMUDevice
  instead of in virtio_iommu_fill_resv_mem_prop(), which is called
  conditionnally in driver's probe. Also use resv_region_list_insert()
---
 include/hw/virtio/virtio-iommu.h |  1 +
 hw/virtio/virtio-iommu.c         | 37 +++++++++++++++++++++++++-------
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index eea4564782..70b8ace34d 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -39,6 +39,7 @@ typedef struct IOMMUDevice {
     AddressSpace  as;
     MemoryRegion root;          /* The root container of the device */
     MemoryRegion bypass_mr;     /* The alias of shared memory MR */
+    GList *resv_regions;
 } IOMMUDevice;
 
 typedef struct IOMMUPciBus {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 979cdb5648..0e2370663d 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -26,6 +26,7 @@
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
+#include "qemu/reserved-region.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "trace.h"
@@ -378,6 +379,19 @@ static void virtio_iommu_put_domain(gpointer data)
     g_free(domain);
 }
 
+static void add_prop_resv_regions(IOMMUDevice *sdev)
+{
+    VirtIOIOMMU *s = sdev->viommu;
+    int i;
+
+    for (i = 0; i < s->nr_prop_resv_regions; i++) {
+        ReservedRegion *reg = g_new0(ReservedRegion, 1);
+
+        *reg = s->prop_resv_regions[i];
+        sdev->resv_regions = resv_region_list_insert(sdev->resv_regions, reg);
+    }
+}
+
 static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
                                               int devfn)
 {
@@ -408,6 +422,7 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
 
         memory_region_init(&sdev->root, OBJECT(s), name, UINT64_MAX);
         address_space_init(&sdev->as, &sdev->root, TYPE_VIRTIO_IOMMU);
+        add_prop_resv_regions(sdev);
 
         /*
          * Build the IOMMU disabled container with aliases to the
@@ -629,17 +644,23 @@ static ssize_t virtio_iommu_fill_resv_mem_prop(VirtIOIOMMU *s, uint32_t ep,
 {
     struct virtio_iommu_probe_resv_mem prop = {};
     size_t size = sizeof(prop), length = size - sizeof(prop.head), total;
-    int i;
+    IOMMUDevice *sdev;
+    GList *l;
 
-    total = size * s->nr_prop_resv_regions;
+    sdev = container_of(virtio_iommu_mr(s, ep), IOMMUDevice, iommu_mr);
+    if (!sdev) {
+        return -EINVAL;
+    }
 
+    total = size * g_list_length(sdev->resv_regions);
     if (total > free) {
         return -ENOSPC;
     }
 
-    for (i = 0; i < s->nr_prop_resv_regions; i++) {
-        unsigned subtype = s->prop_resv_regions[i].type;
-        Range *range = &s->prop_resv_regions[i].range;
+    for (l = sdev->resv_regions; l; l = l->next) {
+        ReservedRegion *reg = l->data;
+        unsigned subtype = reg->type;
+        Range *range = &reg->range;
 
         assert(subtype == VIRTIO_IOMMU_RESV_MEM_T_RESERVED ||
                subtype == VIRTIO_IOMMU_RESV_MEM_T_MSI);
@@ -857,7 +878,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     bool bypass_allowed;
     int granule;
     bool found;
-    int i;
+    GList *l;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -895,8 +916,8 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
         goto unlock;
     }
 
-    for (i = 0; i < s->nr_prop_resv_regions; i++) {
-        ReservedRegion *reg = &s->prop_resv_regions[i];
+    for (l = sdev->resv_regions; l; l = l->next) {
+        ReservedRegion *reg = l->data;
 
         if (range_contains(&reg->range, addr)) {
             switch (reg->type) {
-- 
2.41.0

