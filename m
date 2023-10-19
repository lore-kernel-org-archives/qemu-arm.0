Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp527803ejb;
        Thu, 19 Oct 2023 06:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjK8dp32jvdCGxLYmKARIfCC9nji5d1rTnpA0/Xb3npeNQhP8aEME437oTFmGis7eErdAg
X-Received: by 2002:a05:6102:4750:b0:457:bda2:d667 with SMTP id ej16-20020a056102475000b00457bda2d667mr2132091vsb.12.1697723418018;
        Thu, 19 Oct 2023 06:50:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697723418; cv=none;
        d=google.com; s=arc-20160816;
        b=HRom3AsfpM0dYlnBGm6VqDjzd/NYzKkaaKwJAUwtCeu0S1Rvoo/uA3vJQi0uOXax8h
         V6x2F0Ad3S9bcDSpm0oGFS+7T89ygpCcLsC86QqAD84sb+WsA623+rDXGlNdVLIcZq98
         8qoAmkoA8JuXswdaQXAzR9yJr28MvHv8jbmXgUeLAe2RksRZD12tGUBvh8pk5dMQmy40
         v3yka2JG5hlnLl9IPg02dsmPkH75dUOZFNcEYgW/5i6cm0JAsDXwtair9PuVFcGZL+/z
         xNHUrR0QNWl6p3yNPBVehw2iv7R8Bhuw4ODPSpXzuwQQEDM3LToV7U9PUbh9kpU1STHp
         q/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ofh4u66gfddwedSBCVBfP3BxpNSHj+laCUEhGt/Uj7I=;
        fh=tKh4J0nBsRIusPtBH+FcUVX1EUO0S/KOQKlAHLEPEHM=;
        b=gYfJE0/Kw9hV2/TShD5QakGuasrf+dP6u7nilETBZCohGOZ/cORCN1PcpzYu6SwOhs
         apaHRokCtkQlhyeeVATdSlho79yDuXwpOB/ai62YeqC/49hPJ78MElABzNwCf1x2OAjP
         AhPD3W2Ax8M1l6uClhMps/rrZxFt68K3G4sRjblbq5j0JGJltV2b3XMrlGOqXcOh7jYv
         KxjZLTGvYmkmBrjmoQs28RNd9E98dz5eyshRXe//BJGO+nPlEX0qLxBqpJizJvnHq/O7
         gVMXp9U9BHz2PBQmqH0cufdBSjQyKQESSu6lARFHCeLhN7ikovW85I5x/SnqVSp2ylG6
         Q2hg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CdV5jDW9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8-20020ae9e408000000b007683fd3debdsi1514174qkc.145.2023.10.19.06.50.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 06:50:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CdV5jDW9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtTNL-0001aa-EJ; Thu, 19 Oct 2023 09:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTNC-0001TE-LB
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:47:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qtTNA-00030N-8i
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 09:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697723255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ofh4u66gfddwedSBCVBfP3BxpNSHj+laCUEhGt/Uj7I=;
 b=CdV5jDW9I8zSC1JCq5I9caYxaSL+jS/H89Uj04ICTK6+KaRtRNY+oVt+N/jcby3CDKn8OY
 FbjMhfRfja2xo3GB44KQ3WcAvKKKFJZ/xA5Ob3MdsayyKAQY6bigpTOfnKFMEnLlWz9Dz/
 pUe2jJJRYCHP8MorPo4uzkrF1/65nWs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-682-SXcaUjf2N8CNlZ7pDzXfqA-1; Thu, 19 Oct 2023 09:47:32 -0400
X-MC-Unique: SXcaUjf2N8CNlZ7pDzXfqA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5047110395FA;
 Thu, 19 Oct 2023 13:47:30 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 954C7492BFA;
 Thu, 19 Oct 2023 13:47:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 yanghliu@redhat.com
Subject: [PATCH v4 11/12] virtio-iommu: Consolidate host reserved regions and
 property set ones
Date: Thu, 19 Oct 2023 15:45:17 +0200
Message-ID: <20231019134651.842175-12-eric.auger@redhat.com>
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
X-TUID: J5Ptfz/urqOE

Up to now we were exposing to the RESV_MEM probe requests the
reserved memory regions set though the reserved-regions array property.

Combine those with the host reserved memory regions if any. Those
latter are tagged as RESERVED. We don't have more information about
them besides then cannot be mapped. Reserved regions set by
property have higher priority.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Yanghang Liu <yanghliu@redhat.com>
---
 hw/virtio/virtio-iommu.c | 36 ++++++++++++++++++++++++++++++++++++
 hw/virtio/trace-events   |  1 +
 2 files changed, 37 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 15aadd6fdd..dede0d41aa 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -21,6 +21,7 @@
 #include "qemu/log.h"
 #include "qemu/iov.h"
 #include "qemu/range.h"
+#include "qemu/reserved-region.h"
 #include "exec/target_page.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio.h"
@@ -1156,6 +1157,40 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
     return 0;
 }
 
+/**
+ * rebuild_resv_regions: rebuild resv regions with both the
+ * info of host resv ranges and property set resv ranges
+ */
+static int rebuild_resv_regions(IOMMUDevice *sdev)
+{
+    GList *l;
+    int i = 0;
+
+    /* free the existing list and rebuild it from scratch */
+    g_list_free_full(sdev->resv_regions, g_free);
+    sdev->resv_regions = NULL;
+
+    /* First add host reserved regions if any, all tagged as RESERVED */
+    for (l = sdev->host_resv_ranges; l; l = l->next) {
+        ReservedRegion *reg = g_new0(ReservedRegion, 1);
+        Range *r = (Range *)l->data;
+
+        reg->type = VIRTIO_IOMMU_RESV_MEM_T_RESERVED;
+        range_set_bounds(&reg->range, range_lob(r), range_upb(r));
+        sdev->resv_regions = resv_region_list_insert(sdev->resv_regions, reg);
+        trace_virtio_iommu_host_resv_regions(sdev->iommu_mr.parent_obj.name, i,
+                                             range_lob(&reg->range),
+                                             range_upb(&reg->range));
+        i++;
+    }
+    /*
+     * then add higher priority reserved regions set by the machine
+     * through properties
+     */
+    add_prop_resv_regions(sdev);
+    return 0;
+}
+
 /**
  * virtio_iommu_set_iova_ranges: Conveys the usable IOVA ranges
  *
@@ -1211,6 +1246,7 @@ static int virtio_iommu_set_iova_ranges(IOMMUMemoryRegion *mr,
     range_inverse_array(iova_ranges,
                         &sdev->host_resv_ranges,
                         0, UINT64_MAX);
+    rebuild_resv_regions(sdev);
 
     return 0;
 error:
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 1cb9027d1e..b49d9c4b0a 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -134,6 +134,7 @@ virtio_iommu_notify_flag_add(const char *name) "add notifier to mr %s"
 virtio_iommu_notify_flag_del(const char *name) "del notifier from mr %s"
 virtio_iommu_switch_address_space(uint8_t bus, uint8_t slot, uint8_t fn, bool on) "Device %02x:%02x.%x switching address space (iommu enabled=%d)"
 virtio_iommu_freeze_granule(uint64_t page_size_mask) "granule set to 0x%"PRIx64
+virtio_iommu_host_resv_regions(const char *name, uint32_t index, uint64_t lob, uint64_t upb) "mr=%s host-resv-reg[%d] = [0x%"PRIx64",0x%"PRIx64"]"
 
 # virtio-mem.c
 virtio_mem_send_response(uint16_t type) "type=%" PRIu16
-- 
2.41.0

