Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8875101lfc;
        Fri, 19 Feb 2021 01:44:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1BJ0xZiNgD3vUNj/3boW6uQgvwfTMyCpzt0I48CWSG8BFMq43nlGY4nc4EQx0CF42v+QO
X-Received: by 2002:a25:f07:: with SMTP id 7mr12877829ybp.399.1613727876179;
        Fri, 19 Feb 2021 01:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613727876; cv=none;
        d=google.com; s=arc-20160816;
        b=RBnJTxRlrmvCO6PO0ObFv4z/H2VvuLRYjYk7MmnVIXKcVFphzyvNozPDU1+NxzyZ6j
         ae1gtNV76kbjuiN4f7mSGsEZYTZ5DoiSTIwUQBisaZJo0MC73DPJSpYaiYr3RiG4AB8s
         JaXVJMFwK7HeDtuTQ2vv2MIyn+ahR5puafQiUjXY7C1xzUNMuZl/s8fv8ftzoAJFrvZ7
         gfXQYOzM9pYlUuaRIUl75+x4H6bvAZ+bKAtio4BISMInUPUoWahjCfPYFpBXYJRvXLOK
         7jSWdMTk0oeqLuECffYVTXQEvX7o//39ltHHsTwlUVasCNAJLs1td1KxseaGA4T80Y+P
         nIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=TQCuuYdQy4rpWkqO4zaBNt8NLgpiAbymS1MpbawJr74=;
        b=kiLOFZpNHjR4sFuwDysy2t23YcYPeYnELYcwzlwob6ep/nNIKUTUBI4cSj/17laqiI
         6ReEl4nVio6ZRq6V/xcot0Ox49919qmrrfboJSWdZZ/+FzwCgGpf86pJLTP656yKJ1zU
         EcZBrHaOcyc/k5w6ETdFR/epX/l+ZZmBmNPMtG4Vt1gCnOOCP/E3v4eyck/HPtihzixg
         qnov5TwjBDTWPJIzEEjqj1n+LPqteGfV/1EW5MKmFK2o9LdeqViRviHBu8Su+2Eht0/P
         ZAkMk/KIA1M498TRPodf7VLYxF9wrPkvXQ1Jkb1Rf87dO0vxzZs9LPdFg+ECqOjmKeEN
         0HqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9si8052679ybp.309.2021.02.19.01.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 01:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD2Kx-0001Mv-If
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 04:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lD2KR-0000vc-DX; Fri, 19 Feb 2021 04:44:03 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:3044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lD2K8-0006Yb-UW; Fri, 19 Feb 2021 04:44:03 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Dhmnd72y3zjNpd;
 Fri, 19 Feb 2021 17:42:13 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Feb 2021 17:43:19 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH 2/3] vfio: Add vfio_prereg_listener_log_sync in nested
 stage
Date: Fri, 19 Feb 2021 17:42:29 +0800
Message-ID: <20210219094230.231-3-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210219094230.231-1-jiangkunkun@huawei.com>
References: <20210219094230.231-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=jiangkunkun@huawei.com; helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wZ6niO/dA/aB

On Intel, the DMA mapped through the host single stage. Instead
we set up the stage 2 and stage 1 separately in nested mode as there
is no "Caching Mode".

Legacy vfio_listener_log_sync cannot be used in nested stage as we
don't need to pay close attention to stage 1 mapping. This patch adds
vfio_prereg_listener_log_sync to mark dirty pages in nested mode.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7c50905856..af333e0dee 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1216,6 +1216,22 @@ static int vfio_dma_sync_ram_section_dirty_bitmap(VFIOContainer *container,
                        int128_get64(section->size), ram_addr);
 }
 
+static void vfio_prereg_listener_log_sync(MemoryListener *listener,
+                                          MemoryRegionSection *section)
+{
+    VFIOContainer *container =
+        container_of(listener, VFIOContainer, prereg_listener);
+
+    if (!memory_region_is_ram(section->mr) ||
+        !container->dirty_pages_supported) {
+        return;
+    }
+
+    if (vfio_devices_all_saving(container)) {
+        vfio_dma_sync_ram_section_dirty_bitmap(container, section);
+    }
+}
+
 typedef struct {
     IOMMUNotifier n;
     VFIOGuestIOMMU *giommu;
@@ -1260,6 +1276,14 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
 
+        /*
+         * In nested mode, stage 2 and stage 1 are set up separately. We
+         * only need to focus on stage 2 mapping when marking dirty pages.
+         */
+        if (container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
+            return 0;
+        }
+
         QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
             if (MEMORY_REGION(giommu->iommu) == section->mr &&
                 giommu->n.start == section->offset_within_region) {
@@ -1312,6 +1336,7 @@ static const MemoryListener vfio_memory_listener = {
 static MemoryListener vfio_memory_prereg_listener = {
     .region_add = vfio_prereg_listener_region_add,
     .region_del = vfio_prereg_listener_region_del,
+    .log_sync = vfio_prereg_listener_log_sync,
 };
 
 static void vfio_listener_release(VFIOContainer *container)
-- 
2.23.0

