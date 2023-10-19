Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp527593ejb;
        Thu, 19 Oct 2023 06:50:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUh0oRvxS0oKWXgAJ0tRCcmQyAeHskR1SFIC23OMUVOs5hJTD/dPVfBT4ZqvSHF9niEoH1
X-Received: by 2002:a05:622a:452:b0:415:2623:d8df with SMTP id o18-20020a05622a045200b004152623d8dfmr2481113qtx.7.1697723401202;
        Thu, 19 Oct 2023 06:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697723401; cv=none;
        d=google.com; s=arc-20160816;
        b=MtVc6LscTqHHsmdxE5FfThtVapTnkp0rW8vtXLBqftCSfRTqbu70XWBAqRuillSy9k
         F2dSDAUn/Au/8pWvD5mdk4CNj/GDg/hyrBzmkpm21I0FfA9OlFBgVmEkswrwZqSiIGA6
         wpctdWSmqTMUU8TRca/ahr09dinbibesmUJZBoI/2wTxW67Ge4k5V+WuHhyaq0kT0Hau
         jcxKGO3/7RfWmSaVZplSy2GTXKtLc5NdJu+x80M3i+ww9WtnPpHyqlJ4IFOHcP68aDwA
         HJajNzIU+C/j+5njFZ5QYDOS1oP2qKBBZXa9Ur9yaN1WXG7h4N6cjrDrm6cUn9oq2JLG
         wJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0um3utt9/1movVRFy+igDQuhccAs7y0T3mpq4ca9qc0=;
        fh=tKh4J0nBsRIusPtBH+FcUVX1EUO0S/KOQKlAHLEPEHM=;
        b=gV83D/6T5UWhzww2d/tXrW9Mn9qwBV5IbS9M9c0y9fJuWqVJ2KOg1UNMvFnlzJmP5I
         ih3CaBVMcizvgV3oMxHfPmIYSP5AO1sqDVJab6Kil3F6K+PqVU4jIVdTyTY2pUHGQLN8
         G+b1HLReLEhPTPC6yd7eYyoO4rrq84VV88Mj8cLAatortULcRjt7AT/jhJpY3sIgJ1qQ
         b4aKYfSPEl01P9dSWn7LWX424PkRL8Ie6rlfeXqJSAdm1WKXyzHYn7gfUSGX+ULrXySQ
         7Sf9kQHHqD9S7qtXcrnasRxI6p+TgIWAQ+tATxPsDCBdo4dy700r8//IpAPI6cyccOzX
         b8Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QlY0UZv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t22-20020ac85896000000b00417bb85e45csi1567335qta.541.2023.10.19.06.50.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:50:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QlY0UZv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtTNN-0001h0-GM; Thu, 19 Oct 2023 09:47:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTNF-0001V6-1X
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:47:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTND-00031S-61
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697723258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0um3utt9/1movVRFy+igDQuhccAs7y0T3mpq4ca9qc0=;
 b=QlY0UZv1WW4Pr5XZJ1wrrPrtH6xHE0JRN662Z1AMMjNb6XByi4n4hHNMmpGgAeg7zjbsea
 pWk7nlknzDgLCFVqbaN5fDU+TtQzLCE5SsFguS/EdH3PATjXJqsI3oaWLSpLCOWug8oc+D
 WMK4A74DAvDQZGJcK7g1Z1HdMdz7uLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-OJ6vQzqUNQG9YwAs24xabA-1; Thu, 19 Oct 2023 09:47:29 -0400
X-MC-Unique: OJ6vQzqUNQG9YwAs24xabA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 541128995B6;
 Thu, 19 Oct 2023 13:47:23 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FEFA492BFA;
 Thu, 19 Oct 2023 13:47:20 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 yanghliu@redhat.com
Subject: [PATCH v4 09/12] virtio-iommu: Record whether a probe request has
 been issued
Date: Thu, 19 Oct 2023 15:45:15 +0200
Message-ID: <20231019134651.842175-10-eric.auger@redhat.com>
In-Reply-To: <20231019134651.842175-1-eric.auger@redhat.com>
References: <20231019134651.842175-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: /hqoAPxf0SZe

Add an IOMMUDevice 'probe_done' flag to record that the driver
already issued a probe request on that device.

This will be useful to double check host reserved regions aren't
notified after the probe and hence are not taken into account
by the driver.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Yanghang Liu <yanghliu@redhat.com>
---
 include/hw/virtio/virtio-iommu.h |  1 +
 hw/virtio/virtio-iommu.c         | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 70b8ace34d..1dd11ae81a 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -40,6 +40,7 @@ typedef struct IOMMUDevice {
     MemoryRegion root;          /* The root container of the device */
     MemoryRegion bypass_mr;     /* The alias of shared memory MR */
     GList *resv_regions;
+    bool probe_done;
 } IOMMUDevice;
 
 typedef struct IOMMUPciBus {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 0e2370663d..13c3c087fe 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -639,19 +639,13 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
     return ret;
 }
 
-static ssize_t virtio_iommu_fill_resv_mem_prop(VirtIOIOMMU *s, uint32_t ep,
+static ssize_t virtio_iommu_fill_resv_mem_prop(IOMMUDevice *sdev, uint32_t ep,
                                                uint8_t *buf, size_t free)
 {
     struct virtio_iommu_probe_resv_mem prop = {};
     size_t size = sizeof(prop), length = size - sizeof(prop.head), total;
-    IOMMUDevice *sdev;
     GList *l;
 
-    sdev = container_of(virtio_iommu_mr(s, ep), IOMMUDevice, iommu_mr);
-    if (!sdev) {
-        return -EINVAL;
-    }
-
     total = size * g_list_length(sdev->resv_regions);
     if (total > free) {
         return -ENOSPC;
@@ -688,19 +682,27 @@ static int virtio_iommu_probe(VirtIOIOMMU *s,
                               uint8_t *buf)
 {
     uint32_t ep_id = le32_to_cpu(req->endpoint);
+    IOMMUMemoryRegion *iommu_mr = virtio_iommu_mr(s, ep_id);
     size_t free = VIOMMU_PROBE_SIZE;
+    IOMMUDevice *sdev;
     ssize_t count;
 
-    if (!virtio_iommu_mr(s, ep_id)) {
+    if (!iommu_mr) {
         return VIRTIO_IOMMU_S_NOENT;
     }
 
-    count = virtio_iommu_fill_resv_mem_prop(s, ep_id, buf, free);
+    sdev = container_of(iommu_mr, IOMMUDevice, iommu_mr);
+    if (!sdev) {
+        return -EINVAL;
+    }
+
+    count = virtio_iommu_fill_resv_mem_prop(sdev, ep_id, buf, free);
     if (count < 0) {
         return VIRTIO_IOMMU_S_INVAL;
     }
     buf += count;
     free -= count;
+    sdev->probe_done = true;
 
     return VIRTIO_IOMMU_S_OK;
 }
-- 
2.41.0

