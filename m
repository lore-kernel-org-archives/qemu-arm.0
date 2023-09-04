Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1176627ejb;
        Mon, 4 Sep 2023 01:09:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHjFKbKQoPPCcr0f7KSBdxkvbxIaFWTbCaeOmPBhdRp78yVMv/R4uNFIC41kRqah+qTIQt
X-Received: by 2002:a05:620a:4310:b0:76d:ae6b:ce3d with SMTP id u16-20020a05620a431000b0076dae6bce3dmr10889384qko.4.1693814960053;
        Mon, 04 Sep 2023 01:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693814960; cv=none;
        d=google.com; s=arc-20160816;
        b=Ng/9Jw6YNUKipY9v0cjn7+jcQE5zYOyfOWqDFVGmCOt7anmZmXwfTcTJYOuQTUgCzY
         tzfNb/C0Nhsbs3F7CY09F3ZZl01F+lJaDgMhO9IjCi3DMNZex2y6e5sybN1Shh439UUI
         Xfqwmoe45Ur7KvqW3rNEasqRwiftUaLnSyTAyWtVrGg52vmtF+f6NdoEQ+4JLgDllA6z
         Go3cM191vBMkOwQC0CW9ntHh++rMQWbBdiQGxCGVWdvbivrOgOtWVNxc1EfCXXv366E9
         0ASBNtQg0j+JytC73zfm28cP9aJK+vcY3kdFMctRc7M2Uwfc4r3Z4H99lMOskHphhAPc
         cxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+oWpFb2g/83VBCkX6ZRLRafCOFZTt914xW2uQS8bpf0=;
        fh=vPp9P9nRoVzg/+h2e3p9KngL/viJb9qzJXYZDzy4B8s=;
        b=JNftTcI2gDsr0kA9jnecGPGfbEaNMMUaLyjYAidP3+67Nq+hR9ISRHWjyTDpLd1inh
         qOgjApPAgckHiH/jbX9nbdkPEmKOFJFl6H+lQ8q5jGEPci1/M75h7pQ8uiPb/ZPXoYvO
         nud9vnkyjuH3POP63ywuE7g/icB83e5xdDajEsFPc+nkQGZsDiDHyMM+1RGZu6zDoMOj
         2dCqCuoSxEjbCUPF+cC4Uq2MGqp2EsY4EnugF0hUlVDB8V4mGeU4b0nCVYZRLBZvODtm
         XUsNgdDv9LhfLGWwC9oW0ifICaQ+4Pmq0PgwSkGQ8iWd+U82QMykXJNQtnxgTM2XVS+3
         YDEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VMsHE4w8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn6-20020a05620a2ac600b00767c57e399fsi5790713qkb.72.2023.09.04.01.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 01:09:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VMsHE4w8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qd4c5-0002MR-La; Mon, 04 Sep 2023 04:07:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4c0-0002Av-BK
 for qemu-devel@nongnu.org; Mon, 04 Sep 2023 04:07:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4bu-0006XF-JI
 for qemu-devel@nongnu.org; Mon, 04 Sep 2023 04:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693814821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+oWpFb2g/83VBCkX6ZRLRafCOFZTt914xW2uQS8bpf0=;
 b=VMsHE4w8uesobl4JTVm5uzhqrXh/KbM6bLRCMsWx9TaT1VIukGwhuGHqS4lDd1LM03FDYt
 KJaFFdv0c2AQM7ApIJozS59hdVQhc53MZ1x3E0qUGw8aqLmb75oFzMCTNiwGScUXWFmv44
 APHYzFcjIjJw9PlAiVqCs7C2iKcMF7w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-lWseRNySNoaqT0zV_E8IzQ-1; Mon, 04 Sep 2023 04:05:27 -0400
X-MC-Unique: lWseRNySNoaqT0zV_E8IzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C542F925FD4;
 Mon,  4 Sep 2023 08:05:26 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F2F740ED77D;
 Mon,  4 Sep 2023 08:05:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org
Subject: [PATCH 10/13] virtio-iommu: Consolidate host reserved regions and
 property set ones
Date: Mon,  4 Sep 2023 10:03:53 +0200
Message-ID: <20230904080451.424731-11-eric.auger@redhat.com>
In-Reply-To: <20230904080451.424731-1-eric.auger@redhat.com>
References: <20230904080451.424731-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-TUID: FkXXN0IYPRGo

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
index 02f1a59d57..d260235078 100644
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

