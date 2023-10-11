Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp264140ejc;
        Wed, 11 Oct 2023 10:58:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkw47iGSEeAhYjMe5B3b/YW4oyyC+N6h7DP7yPWyfb/vn23tjDma7jtFDyhTqxUKHTzhXH
X-Received: by 2002:a05:600c:15cc:b0:407:6120:cdec with SMTP id v12-20020a05600c15cc00b004076120cdecmr1980215wmf.38.1697047121030;
        Wed, 11 Oct 2023 10:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697047121; cv=none;
        d=google.com; s=arc-20160816;
        b=F4nLzL2V4/C0tC/c12OGrhkgoGpsVX/Z6zfBTVf8Oaq3XmjbJFFCQ9x1uSe/PcSRI1
         zz1PYHJMLV7Ul5yRNEHefEw/EcyNK3irkbHqZk8lIKq8598irZKWIqgN443+p5Kb70Bd
         CKEVp/SHAAuUrQP0RlbJY+azUX2IKowmRKyR4h1z/vpEBeipx/RiV0B6llZ1gSPnLUMF
         oR5S7rPDlHgR4Xs5EyPvLzPoLJrEuudSVEe0Fhj5+j5SanhU1Vf8TtRfPSXOYaYOc/GI
         rjFEOCWNVhH71eUwyf8mgDJ+yip7McIuZQ73Alr+8ikCuEzHn1eJlXRFXtqkvbyxvU0a
         qMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DoIUo/ZpRcnk2IRWay+/r0Syt0sDfoaV5wBJ7Os2/3Q=;
        fh=9ZVtvpfpBEZx1oWqIMPFEsByQUx/hbHUkY9aIbMmkns=;
        b=CFvi7dgeSy20Aoi1zp9wwA45+d7D3C77eVm9gmaoer5w1vix1J/mQu7/ItxXXzw+ZZ
         iOKl7PXlaIu1MsmwXbRLQX3+Mq42cbjZt8mT47hK944YRhEO4Lc1CYfuKlUDtqtGXgHZ
         FQLwiebUYpLasMv7TggjRgt0qXqarjpWczHV6nzvkdgEWRSMoReJ9sYzHx9WbLUtyH7H
         0UFoeyCjjpyu7bHPQgjeHtTcBI99dBNtTqEEZREtYpWSmMAW36tuueaOZlEmR1obXtvb
         8fEFUkoOotQL519qtG+mIBNycNXHaw/fF81l1tPRBKB6RLCZY6qgfQ2GvQHk1xPFecdy
         xtXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FJxNHxnY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020adffec4000000b0031c63de0ea6si5946079wrs.833.2023.10.11.10.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Oct 2023 10:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FJxNHxnY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqdRg-0001hv-VP; Wed, 11 Oct 2023 13:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdRO-0001No-Ep
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:56:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qqdRM-0006iz-9X
 for qemu-arm@nongnu.org; Wed, 11 Oct 2023 13:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697046971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DoIUo/ZpRcnk2IRWay+/r0Syt0sDfoaV5wBJ7Os2/3Q=;
 b=FJxNHxnY9KnJz3YCE3dhJZDJ+cYX13gacRAjGXwCo6MirzVIqXL2yvto7O5OOt+7kawybR
 MJiI4WAHlOS9rptixj8G5lD/7zSkWL5GOgFRmo+YjeQO0VSgZf+Lsy0cB7lTasyN73DjIi
 1sDW1E9kl7T1mVHLmtBZdRkb5PxAyqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-B61ngbdoNaOE1g7FjCxAjA-1; Wed, 11 Oct 2023 13:56:08 -0400
X-MC-Unique: B61ngbdoNaOE1g7FjCxAjA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DFD2101AA6E;
 Wed, 11 Oct 2023 17:56:07 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4C0A492C3E;
 Wed, 11 Oct 2023 17:56:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com
Subject: [PATCH v3 11/13] virtio-iommu: Consolidate host reserved regions and
 property set ones
Date: Wed, 11 Oct 2023 19:52:27 +0200
Message-ID: <20231011175516.541374-12-eric.auger@redhat.com>
In-Reply-To: <20231011175516.541374-1-eric.auger@redhat.com>
References: <20231011175516.541374-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-TUID: 21bRGJQmWSkx

Up to now we were exposing to the RESV_MEM probe requests the
reserved memory regions set though the reserved-regions array property.

Combine those with the host reserved memory regions if any. Those
latter are tagged as RESERVED. We don't have more information about
them besides then cannot be mapped. Reserved regions set by
property have higher priority.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
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

