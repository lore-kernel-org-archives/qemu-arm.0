Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1175552ejb;
        Mon, 4 Sep 2023 01:07:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHftJUJx2AtV5Abgz5Ujd2QeqfJZ0ITVjHX0Jh4CJlgotUhDFDwMnsN7hRT95YuyX3fZlN1
X-Received: by 2002:a0c:dc08:0:b0:64b:997f:5a73 with SMTP id s8-20020a0cdc08000000b0064b997f5a73mr8875100qvk.0.1693814821465;
        Mon, 04 Sep 2023 01:07:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693814821; cv=none;
        d=google.com; s=arc-20160816;
        b=OBhh60WbX8kJkYiq+R3S9hZgBiqp/2UyRQ4lwaTRl8vUmOOthr2ljPIux9fqJj0w2C
         ne61HlrVEZ1/0ip7CVMwME+KXA4DzjsuzPtKvUrsx9CNNrNjNxmG5VnaZBBSSHeYVpbo
         7LEHESj9qC27LoQrKu04PGmIsFoYSd594k/7m/NMgE6cr7JpudpIj1R1I+Dm/Z2Vvari
         oxzLdMtiYpwJMVlEbH+OI8jgm+NJ+pDgpMer+XTfcOPHFd8Q+HMAjBOin/W652HDYk4M
         1GtKoobew+f5U8mW1XaEHt9o49iAAifWCrH+CJwD4sRD4fIXgYfPKmEXgjwiyomNO/4H
         aD2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=deUtT+oz+1XIYevIMg+Drga7A61AlvVs6/MjQyLPDyM=;
        fh=vPp9P9nRoVzg/+h2e3p9KngL/viJb9qzJXYZDzy4B8s=;
        b=wZ6zXo09hRT0t5FlxTg2Qv8UGKQrJeCHmfbtP5ed7S3GmHLudPlSqOAHjbGrZ3FC5t
         TQEH1OxJvjqEfG5qFN0yEiXzmyiqlE0kk6IJwtFbm6+m0sy2uO0pTEof6mWb1jSEuewl
         dTBUKLnMUHl4lu/o6VGM+r45wYxN/Mf4RrBMHuO5TmVI7OsD48MsKhaCRWJiJZtNq0mp
         6FhbM7mOtNNZwQOTd0WfHq6zGS9LicBOVqnN/uPXMEwdsjPmPf7FLaw9bcYJWWAEezy4
         OX7Iuk0OnHfj45Rr7z2AHmFtx1Y8jmPYBAQBEQ8xWMkgpLeTGNlGbuIckC5hDVhBjmLs
         0QFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q6JPubzN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020a05620a24cb00b00770593c4233si4333898qkn.573.2023.09.04.01.07.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 01:07:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q6JPubzN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qd4bV-00013Y-SM; Mon, 04 Sep 2023 04:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4bR-00011S-Ri
 for qemu-devel@nongnu.org; Mon, 04 Sep 2023 04:06:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qd4bD-0006El-3w
 for qemu-devel@nongnu.org; Mon, 04 Sep 2023 04:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693814776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=deUtT+oz+1XIYevIMg+Drga7A61AlvVs6/MjQyLPDyM=;
 b=Q6JPubzNh+cliw7S8BA2lPPFgACaO1pcAtxMXLHPozpNlTt7vFCtOhgCf1UBtF4Aq1ZhzA
 vfCNZaY2wRTYVjDfmpOeqEnUE8ZeNzyOQtUEvN8zDuTiA9FPvX28c3CA1W0ObBMfFVRd3E
 i2R8gNP6wCLLN0JamqW4HrpSbHvJUX8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-0hZ-OyfcMQCV7dXXmd4C1A-1; Mon, 04 Sep 2023 04:05:05 -0400
X-MC-Unique: 0hZ-OyfcMQCV7dXXmd4C1A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDE8B8008A4;
 Mon,  4 Sep 2023 08:05:04 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4826840C1258;
 Mon,  4 Sep 2023 08:05:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, alex.williamson@redhat.com, clg@redhat.com,
 jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com,
 philmd@linaro.org
Subject: [PATCH 03/13] vfio: Collect container iova range info
Date: Mon,  4 Sep 2023 10:03:46 +0200
Message-ID: <20230904080451.424731-4-eric.auger@redhat.com>
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
X-TUID: jSJwu/n02UVw

Collect iova range information if VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
capability is supported.

This allows to propagate the information though the IOMMU MR
set_iova_ranges() callback so that virtual IOMMUs
get aware of those aperture constraints.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 include/hw/vfio/vfio-common.h |  2 ++
 hw/vfio/common.c              | 45 +++++++++++++++++++++++++++++++++--
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index da43d27352..74b9b27270 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -98,6 +98,8 @@ typedef struct VFIOContainer {
     QLIST_HEAD(, VFIOGroup) group_list;
     QLIST_HEAD(, VFIORamDiscardListener) vrdl_list;
     QLIST_ENTRY(VFIOContainer) next;
+    unsigned nr_iovas;
+    struct  vfio_iova_range *iova_ranges;
 } VFIOContainer;
 
 typedef struct VFIOGuestIOMMU {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9aac21abb7..26da38de05 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1157,6 +1157,14 @@ static void vfio_listener_region_add(MemoryListener *listener,
             goto fail;
         }
 
+        ret = memory_region_iommu_set_iova_ranges(giommu->iommu_mr,
+                container->nr_iovas, (struct Range *)container->iova_ranges,
+                &err);
+        if (ret) {
+            g_free(giommu);
+            goto fail;
+        }
+
         ret = memory_region_register_iommu_notifier(section->mr, &giommu->n,
                                                     &err);
         if (ret) {
@@ -1981,6 +1989,29 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
     return true;
 }
 
+static void vfio_get_info_iova_range(struct vfio_iommu_type1_info *info,
+                                     unsigned int *nr_iovas,
+                                     struct  vfio_iova_range **iova_ranges)
+{
+    struct vfio_info_cap_header *hdr;
+    struct vfio_iommu_type1_info_cap_iova_range *cap;
+
+    hdr = vfio_get_iommu_type1_info_cap(info,
+                                        VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE);
+    if (hdr == NULL) {
+        return;
+    }
+
+    cap = (void *)hdr;
+    *nr_iovas = cap->nr_iovas;
+
+    if (*nr_iovas == 0) {
+        return;
+    }
+    *iova_ranges = g_memdup2(cap->iova_ranges,
+                             *nr_iovas * sizeof(struct  vfio_iova_range));
+}
+
 static int vfio_setup_region_sparse_mmaps(VFIORegion *region,
                                           struct vfio_region_info *info)
 {
@@ -2433,6 +2464,12 @@ static void vfio_get_iommu_info_migration(VFIOContainer *container,
     }
 }
 
+static void vfio_free_container(VFIOContainer *container)
+{
+    g_free(container->iova_ranges);
+    g_free(container);
+}
+
 static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
                                   Error **errp)
 {
@@ -2550,6 +2587,10 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         if (!vfio_get_info_dma_avail(info, &container->dma_max_mappings)) {
             container->dma_max_mappings = 65535;
         }
+
+        vfio_get_info_iova_range(info, &container->nr_iovas,
+                                 &container->iova_ranges);
+
         vfio_get_iommu_info_migration(container, info);
         g_free(info);
 
@@ -2663,7 +2704,7 @@ enable_discards_exit:
     vfio_ram_block_discard_disable(container, false);
 
 free_container_exit:
-    g_free(container);
+    vfio_free_container(container);
 
 close_fd_exit:
     close(fd);
@@ -2717,7 +2758,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
 
         trace_vfio_disconnect_container(container->fd);
         close(container->fd);
-        g_free(container);
+        vfio_free_container(container);
 
         vfio_put_address_space(space);
     }
-- 
2.41.0

