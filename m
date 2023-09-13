Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2607649ejx;
        Wed, 13 Sep 2023 01:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwzM0+jyxT8+LmxEHZh9a7RZGhRRW8pl5jP4FpBdASnXFCGF1+VWx6mjhcf+eiGPpmsKts
X-Received: by 2002:a0c:e84a:0:b0:653:589b:9cf6 with SMTP id l10-20020a0ce84a000000b00653589b9cf6mr1869232qvo.53.1694592377808;
        Wed, 13 Sep 2023 01:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694592377; cv=none;
        d=google.com; s=arc-20160816;
        b=yfTN4TL5ZI/HJN0oVToSsTq0XrsHZWn55I+LXEGXmJ6cM4PQerrwWgq9J77kPmJEhw
         LUWBc5l7ObomeX2MZ5O7H+IIDkoSuw5i2gn2Psy/Gcc2DDwOL39m3va03ieUsxR5rETd
         uQ4iLqb5zFjZBTlWHTyq7qri4mPeq0IvRYmX1A0DMjpBC4CVJyT7MWdFgw5KEKo6pzCV
         aVam1YLhnqVZftEbXVWAHbyTqNh5XFbDQ3UTyF3tgkSXU2+Z+nZXMfJog/wGO+Jwc7Qq
         Bwdi01C9o2OsobWE4N6l6elO19/h/ZwDl9uMVwSC4ejJ1r1yYXyBS1P0Ly0RIK3i8A4G
         lNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=U5sWr5o+25aBDxNZTkf3l7WeDqKVgTxJZrGw9QlW9iM=;
        fh=vPp9P9nRoVzg/+h2e3p9KngL/viJb9qzJXYZDzy4B8s=;
        b=S95QhOF4uYJiRuV2rHMmkDX9j9UnJd1Z+3Q0LrLSOu3xXJNBGt7n1m59yPn1L9ni62
         7oHii1IAbQjAVzZysOnRf479YwigTPUIzEqEgi3FnCgV1Sgo1rOlOV2a0DAdtaWiGrY+
         FMbwr2xnjVsWIj8fwT6bNRDOUE5jNP8tGudtcFiIAw6WMucHibrkrH32dzhjXwsiX90I
         9XB2Onuj881msT4BcZOXJUy0/k3R4qfAELk0pidKpBB14I0/BxYL7aOk4hY0t4d2m4og
         nWYPpLJ5w380yS93ruef5b+udisJKNPR8ShVWK2K5Yiu5xM8aHlVu4PhiJRTQZ9uP55y
         1kFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LmEz5i0X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17-20020a0cb691000000b00655e5c99551si4132176qvd.17.2023.09.13.01.06.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Sep 2023 01:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LmEz5i0X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qgKrw-000179-Fd; Wed, 13 Sep 2023 04:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qgKru-00012f-AY
 for qemu-devel@nongnu.org; Wed, 13 Sep 2023 04:05:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qgKrr-0004oR-V3
 for qemu-devel@nongnu.org; Wed, 13 Sep 2023 04:05:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694592298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5sWr5o+25aBDxNZTkf3l7WeDqKVgTxJZrGw9QlW9iM=;
 b=LmEz5i0Xlr+tlWnFhLMDyRUZIRk2SZVI6f994xe7qEeT+FqRJuKWZAG3EOR+Xe83CPelx+
 cssdkak8YpNnIdJK6vw4ClSK93Z3FxDCe5l01LcoEQsHfhSUu+HU0mlV+s3FkkHDRP/nh8
 aCDsCj0ExNRw+l0vB74idYeTOFD/nyE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-Jk825qSrNbOCIPHMRFOq0A-1; Wed, 13 Sep 2023 04:04:57 -0400
X-MC-Unique: Jk825qSrNbOCIPHMRFOq0A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E25E856501;
 Wed, 13 Sep 2023 08:04:56 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 363302026D68;
 Wed, 13 Sep 2023 08:04:54 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 10/12] virtio-iommu: Consolidate host reserved regions and
 property set ones
Date: Wed, 13 Sep 2023 10:01:45 +0200
Message-ID: <20230913080423.523953-11-eric.auger@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: F5ZruJBLWiI/

Up to now we were exposing to the RESV_MEM probe requests the
reserved memory regions set though the reserved-regions array property.

Combine those with the host reserved memory regions if any. Those
latter are tagged as RESERVED. We don't have more information about
them besides then cannot be mapped. Reserved regions set by
property have higher priority.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/virtio/virtio-iommu.c | 17 ++++++++++++++++-
 hw/virtio/trace-events   |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index ed2df5116f..4b22fe7ff1 100644
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
@@ -630,11 +631,25 @@ static int consolidate_resv_regions(IOMMUDevice *sdev)
     VirtIOIOMMU *s = sdev->viommu;
     int i;
 
+    /* First add host reserved regions if any, all tagged as RESERVED */
+    for (i = 0; i < sdev->nr_host_resv_regions; i++) {
+        ReservedRegion *reg = g_new0(ReservedRegion, 1);
+        reg->range = sdev->host_resv_regions[i];
+        reg->type = VIRTIO_IOMMU_RESV_MEM_T_RESERVED;
+        sdev->resv_regions = resv_region_list_insert(sdev->resv_regions, reg);
+        trace_virtio_iommu_host_resv_regions(sdev->iommu_mr.parent_obj.name, i,
+                                             range_lob(&reg->range),
+                                             range_upb(&reg->range));
+    }
+    /*
+     * then add higher priority reserved regions set through properties by the
+     * machine
+     */
     for (i = 0; i < s->nr_prop_resv_regions; i++) {
         ReservedRegion *reg = g_new0(ReservedRegion, 1);
 
         *reg = s->prop_resv_regions[i];
-        sdev->resv_regions = g_list_append(sdev->resv_regions, reg);
+        sdev->resv_regions = resv_region_list_insert(sdev->resv_regions, reg);
     }
     return 0;
 }
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 7109cf1a3b..796574b0f3 100644
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

