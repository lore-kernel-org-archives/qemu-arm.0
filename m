Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2608101ejx;
        Wed, 13 Sep 2023 01:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLM2egUCtANpn8Y6kn0TIay7BLV5m6UXoboa+GCYAgPcVAuY2IKH1wbF+xJ3yeqCw2VuyW
X-Received: by 2002:a05:620a:6c7:b0:76f:1f05:e994 with SMTP id 7-20020a05620a06c700b0076f1f05e994mr1621106qky.64.1694592406533;
        Wed, 13 Sep 2023 01:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694592406; cv=none;
        d=google.com; s=arc-20160816;
        b=Bl+mj+TPsgjR1AVpY9vVW/IOHTlkd0Egzp6lH7IQcrpjEio2W9QRNOOt3zAlUmdfZY
         LXdsTq6tefMGRMwLQEUJlQziUreNEW2+vHjgVFktvfPFXmf3xwEI+UxVbp3jo2FErJ9a
         y+aYx2a1cAiF19/muJT3E/UHW0XWmA6Q3r+ZhGC36aLMs1FFxN1mi9rHZTFMmWB1DSVR
         KYg0egRpNquy4glAghKy+f0t/3lVeO+/LsMay4nSKkBJCRYkBb8l1oHxAvy3cLHQkZ4p
         z85qmxPVoa5z5/VlOSdoiVczETLe09sEpQKeWT/GR+t4boK8OVv3Qq7IN7UnVPn3zwsG
         5OGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IAZop55Ny6Gxc5AQo+TBRznDjzisZRxOxhW8y3kjP5o=;
        fh=vPp9P9nRoVzg/+h2e3p9KngL/viJb9qzJXYZDzy4B8s=;
        b=AJ58ON5/2Qf2k5qJW1MtCqIhFDITTwsV2xcthd81xD8ZiCxdU7RC89z5fXavjfCbbK
         L1HXwRUItP6hFMMF8833Up1Nhi5RNVtD2dcD1ItFBoiJRF+YX9U+GfYAU0DhQImItUzh
         qVuNS7m1zIyuKRStOym7IqJ75AUCxog6SGEJyaIKMJd74ipawuVgtpag1JIZ4f5mfG99
         ghidftgltg1p23lW1+wGOZI/GhiVosXvqoyJS2T/QMkVAfHaNck7Ck/QoKfoap+xdTWi
         b4XKIx9n/k7+l00w7aN99SybHKZsbK+NODoC/pr7rvdk5cbZm5zOYEmnejDA+is2IqvJ
         S+9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ItuJpo9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs44-20020a05620a472c00b0076daa480ef0si7030412qkb.709.2023.09.13.01.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Sep 2023 01:06:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ItuJpo9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgKrk-0000sv-OL; Wed, 13 Sep 2023 04:04:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qgKrj-0000sh-M0
 for qemu-arm@nongnu.org; Wed, 13 Sep 2023 04:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qgKrh-0004lB-I8
 for qemu-arm@nongnu.org; Wed, 13 Sep 2023 04:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694592288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IAZop55Ny6Gxc5AQo+TBRznDjzisZRxOxhW8y3kjP5o=;
 b=ItuJpo9PEqiZLGzp2INgfzZKXfceOSUqtqZjpenljyRRBnTQ1ZNieXn766guvEKNpPGje+
 96WabdSfq5Gxt8MEjYxGj7Gg7tUD6//9220jq/j5CjKePncbCDb3d0BvGXoepPe1Gj0CGW
 L5XHyfYb5P0Ft02jlGfkmOYnQY5w+Fg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-wo5xrkbmPuO_5udLIt9oxQ-1; Wed, 13 Sep 2023 04:04:44 -0400
X-MC-Unique: wo5xrkbmPuO_5udLIt9oxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52C0F800B23;
 Wed, 13 Sep 2023 08:04:43 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9CC72026D4B;
 Wed, 13 Sep 2023 08:04:40 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 05/12] virtio-iommu: Introduce per IOMMUDevice reserved
 regions
Date: Wed, 13 Sep 2023 10:01:40 +0200
Message-ID: <20230913080423.523953-6-eric.auger@redhat.com>
In-Reply-To: <20230913080423.523953-1-eric.auger@redhat.com>
References: <20230913080423.523953-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FaaL8i5dY9At

For the time being the per device reserved regions are
just a duplicate of IOMMU wide reserved regions. Subsequent
patches will combine those with host reserved regions, if any.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/virtio/virtio-iommu.h |  1 +
 hw/virtio/virtio-iommu.c         | 42 ++++++++++++++++++++++++++------
 2 files changed, 35 insertions(+), 8 deletions(-)

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
index 979cdb5648..ea359b586a 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -624,22 +624,48 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     return ret;
 }
 
+static int consolidate_resv_regions(IOMMUDevice *sdev)
+{
+    VirtIOIOMMU *s = sdev->viommu;
+    int i;
+
+    for (i = 0; i < s->nr_prop_resv_regions; i++) {
+        ReservedRegion *reg = g_new0(ReservedRegion, 1);
+
+        *reg = s->prop_resv_regions[i];
+        sdev->resv_regions = g_list_append(sdev->resv_regions, reg);
+    }
+    return 0;
+}
+
 static ssize_t virtio_iommu_fill_resv_mem_prop(VirtIOIOMMU *s, uint32_t ep,
                                                uint8_t *buf, size_t free)
 {
     struct virtio_iommu_probe_resv_mem prop = {};
     size_t size = sizeof(prop), length = size - sizeof(prop.head), total;
-    int i;
+    IOMMUDevice *sdev;
+    GList *l;
+    int ret;
 
-    total = size * s->nr_prop_resv_regions;
+    sdev = container_of(virtio_iommu_mr(s, ep), IOMMUDevice, iommu_mr);
+    if (!sdev) {
+        return -EINVAL;
+    }
 
+    ret = consolidate_resv_regions(sdev);
+    if (ret) {
+        return ret;
+    }
+
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
@@ -857,7 +883,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
     bool bypass_allowed;
     int granule;
     bool found;
-    int i;
+    GList *l;
 
     interval.low = addr;
     interval.high = addr + 1;
@@ -895,8 +921,8 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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

