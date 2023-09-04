Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1176872ejb;
        Mon, 4 Sep 2023 01:09:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTPRot0vcc0Su+/Co4RpJ4vmyk9jgN845HSiH2+d/ob4NstyFaXYoqLclpJFSuKuTq+8sZ
X-Received: by 2002:a05:622a:14d3:b0:40d:6219:d813 with SMTP id u19-20020a05622a14d300b0040d6219d813mr13757169qtx.68.1693814985356;
        Mon, 04 Sep 2023 01:09:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693814985; cv=none;
        d=google.com; s=arc-20160816;
        b=pt64br31n8DD9ElYkGcDlShqclqOq4zsyM28XRQmT5E0dt7Dq8TLWlUkqRcXOC1FPU
         ojJO0+p7BLdn82jBKONxM/PPCKwLipaFHbZv+kgtdorvaw07sUMAMxOWVzLxCdhBi2QG
         5n3QsOZ3+jAvqmML80I3GsqZnBjBrTV4tfHzJlZIYVhyew0CTo3ElPTrc4gYNs2onb8N
         GBXlqWqxtaMYjez7OFvcliwJSCaP0fRJQzw1VztwZbb1YWLExv8vofmqg0Gxuva1zCaK
         YlAkWeF9rqUdW2UUDm3DdU6D7rvlm1BmwjBZ/2+RaDu+YNokGFJjb+6la2CAlVHiqfLF
         +dXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mqcE63CfOAlQUpwWTYprlvV2vd+VNunVacYwB1rAneQ=;
        fh=vPp9P9nRoVzg/+h2e3p9KngL/viJb9qzJXYZDzy4B8s=;
        b=jDTQfvjZBACdzSK9Si1Bsm0t8+i+5zicZO0Im2ww8qUPQVpvyqKrNtW+o49eIP3Rlp
         1CKk2Bn3lltwl2vj49gkXcXxgJ0PLCO4qb3hcOJrOGgSQk/W4WIUugriP6oEz0vRwsE1
         ast7KDAak566twEU62wjDzpTmPrv7bpK9YMvqEfOdl9m85Q+je5QI2lZxdFPThk7RkGM
         jirCL/61ZCGKJAF7fjg1dNO6vuAB/81UZNp1aaP5aElrBzJOOtZpUM7kiV30KGvZITSn
         DaV0g4+30pG/VjtL5JfnVcMwdxDwXg8nNzfOEba2lzREEkOFvfsJvR8VyzDDOg7cIVTS
         yn9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z5LpflDA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020a05622a045100b004122ed9aa29si5987901qtx.730.2023.09.04.01.09.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 01:09:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z5LpflDA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qd4bd-0001BG-Lp; Mon, 04 Sep 2023 04:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4bV-00013U-OE
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 04:06:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4bR-0006MB-C5
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 04:06:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693814787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqcE63CfOAlQUpwWTYprlvV2vd+VNunVacYwB1rAneQ=;
 b=Z5LpflDA7fWGhd25elLsdyNh1QeLSg1uw4bTscRpwpK7WbkMmq057f7njYR5eh60ujFpNH
 BvIg1/Vb+rYb8ZiITcFTcQvT2kd0RhcWTrUo9zdoRxl1Cdcyu9toF5tsmLuhGXfjT7zx05
 Qwsdv/E7FPD36eTnvXY47DeF5mQo2Lo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-C9ssjOpUM-OtlYBHnwSxMw-1; Mon, 04 Sep 2023 04:05:18 -0400
X-MC-Unique: C9ssjOpUM-OtlYBHnwSxMw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1D62382C969;
 Mon,  4 Sep 2023 08:05:17 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CFDB400D277;
 Mon,  4 Sep 2023 08:05:15 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org
Subject: [PATCH 07/13] virtio-iommu: Implement set_iova_ranges() callback
Date: Mon,  4 Sep 2023 10:03:50 +0200
Message-ID: <20230904080451.424731-8-eric.auger@redhat.com>
In-Reply-To: <20230904080451.424731-1-eric.auger@redhat.com>
References: <20230904080451.424731-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
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
X-TUID: bKtu0ZVNqgBr

The implementation populates the array of per IOMMUDevice
host reserved regions.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/virtio/virtio-iommu.h |  2 ++
 hw/virtio/virtio-iommu.c         | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
index 70b8ace34d..31b69c8261 100644
--- a/include/hw/virtio/virtio-iommu.h
+++ b/include/hw/virtio/virtio-iommu.h
@@ -40,6 +40,8 @@ typedef struct IOMMUDevice {
     MemoryRegion root;          /* The root container of the device */
     MemoryRegion bypass_mr;     /* The alias of shared memory MR */
     GList *resv_regions;
+    Range *host_resv_regions;
+    uint32_t nr_host_resv_regions;
 } IOMMUDevice;
 
 typedef struct IOMMUPciBus {
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index ea359b586a..02f1a59d57 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/iov.h"
+#include "qemu/range.h"
 #include "exec/target_page.h"
 #include "hw/qdev-properties.h"
 #include "hw/virtio/virtio.h"
@@ -1158,6 +1159,21 @@ static int virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
     return 0;
 }
 
+static int virtio_iommu_set_iova_ranges(IOMMUMemoryRegion *mr,
+                                        uint32_t nr_ranges,
+                                        struct Range *iova_ranges,
+                                        Error **errp)
+{
+    IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
+    assert(nr_ranges);
+
+
+    range_inverse_array(nr_ranges, iova_ranges,
+                        &sdev->nr_host_resv_regions, &sdev->host_resv_regions);
+
+    return 0;
+}
+
 static void virtio_iommu_system_reset(void *opaque)
 {
     VirtIOIOMMU *s = opaque;
@@ -1453,6 +1469,7 @@ static void virtio_iommu_memory_region_class_init(ObjectClass *klass,
     imrc->replay = virtio_iommu_replay;
     imrc->notify_flag_changed = virtio_iommu_notify_flag_changed;
     imrc->iommu_set_page_size_mask = virtio_iommu_set_page_size_mask;
+    imrc->iommu_set_iova_ranges = virtio_iommu_set_iova_ranges;
 }
 
 static const TypeInfo virtio_iommu_info = {
-- 
2.41.0

