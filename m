Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp338107lfg;
        Wed, 31 Mar 2021 03:17:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH55giXWxk+Aor95JtZY51p5EoqFmzrJmfk5m0oXG5wR31WhcXy6KCI5vGvxREJFTo+351
X-Received: by 2002:a05:6602:1689:: with SMTP id s9mr1665331iow.171.1617185847197;
        Wed, 31 Mar 2021 03:17:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617185847; cv=none;
        d=google.com; s=arc-20160816;
        b=NWnpewh9R0/P4U5VYSN7I4tk8XR7yf1RfrQdycSgOb+UZnPZWDPu8CQIZIKzNjJscn
         elylRf5GASAJ4+1iiM/0Vg90QsqU/bMiQFdLDs+EzJSSUHlupovrf3+3d1n3EBGHk28P
         cbZsRisVUkzMDli+tttSjXJbD+/D5YHiTuaaSbQya7Zk4Z1iEuHAKnQqEk4inaPexa3a
         I2unh3ujmL6RoosR1Py5mf8U+UArVHekDak2u7JEaAVufLyo6IRSYY7WjKD8pxQzaK4i
         +nScSkV9TGeCdrFiM2lHcc2KtS+B6lMIoEcIWTBtxAlL3A43ER8/wDlswM37TW8VkV4U
         VYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Wd/LNLzH/B5LIrkjQpQpI069Xz3QxI3LbFznEjlUcCM=;
        b=ERumc5M5oMLmbFu9iD6qaBl/24BowAX0Y3FCV4j8L7yP6CS9zSXMbrHElHDE2/gqYo
         Taemap16L6IsCeC/ugXP+vgMwHHaLRwCBMdln4jisDGB66WbN1SWEHoJQ/S5UbG0xgIh
         5pCdhgNcrTR2l6Q3Mcp9fWVNadIMEzlx9Ip8vX/ToYEkulON5HaMdSXLR7kMmqEPdkmX
         /fAFYtbIFy+t5GePM/CcDOVTIt5f2KmDvbd0WHG9DtxRUb4+8cJdjDrGe1EC/D2/fstK
         tct9lDguFBaJIYVVlguBmvsXPVxwn/7Z3jZ2qngzients3b4aF8i8DyFTZhBm+L3Z9mM
         ZYrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q19si1575292jat.59.2021.03.31.03.17.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 03:17:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:53612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRXug-0006lW-Ho
	for alex.bennee@linaro.org; Wed, 31 Mar 2021 06:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRXr5-0002X4-MB; Wed, 31 Mar 2021 06:13:43 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRXr0-0005iE-0N; Wed, 31 Mar 2021 06:13:43 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9MXt33c5z1BG04;
 Wed, 31 Mar 2021 18:11:26 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 18:13:25 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, Yi Sun <yi.y.sun@linux.intel.com>, "open list:ARM
 SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 2/4] vfio: Add vfio_prereg_listener_log_sync in nested
 stage
Date: Wed, 31 Mar 2021 18:12:57 +0800
Message-ID: <20210331101259.2153-3-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210331101259.2153-1-jiangkunkun@huawei.com>
References: <20210331101259.2153-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=jiangkunkun@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Liu Yi L <yi.l.liu@intel.com>, shameerali.kolothum.thodi@huawei.com,
 Kirti Wankhede <kwankhede@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xIZyk8h7gR7K

On Intel, the DMA mapped through the host single stage. Instead
we set up the stage 2 and stage 1 separately in nested mode as there
is no "Caching Mode".

Legacy vfio_listener_log_sync cannot be used in nested stage as we
don't need to pay close attention to stage 1 mapping. This patch adds
vfio_prereg_listener_log_sync to mark dirty pages in nested mode.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3117979307..86722814d4 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1284,6 +1284,22 @@ static int vfio_dma_sync_ram_section_dirty_bitmap(VFIOContainer *container,
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
+    if (vfio_devices_all_dirty_tracking(container)) {
+        vfio_dma_sync_ram_section_dirty_bitmap(container, section);
+    }
+}
+
 typedef struct {
     IOMMUNotifier n;
     VFIOGuestIOMMU *giommu;
@@ -1328,6 +1344,16 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
 
+        /*
+         * In nested mode, stage 2 (gpa->hpa) and stage 1 (giova->gpa) are
+         * set up separately. It is inappropriate to pass 'giova' to kernel
+         * to get dirty pages. We only need to focus on stage 2 mapping when
+         * marking dirty pages.
+         */
+        if (container->iommu_type == VFIO_TYPE1_NESTING_IOMMU) {
+            return 0;
+        }
+
         QLIST_FOREACH(giommu, &container->giommu_list, giommu_next) {
             if (MEMORY_REGION(giommu->iommu) == section->mr &&
                 giommu->n.start == section->offset_within_region) {
@@ -1382,6 +1408,7 @@ static const MemoryListener vfio_memory_listener = {
 static MemoryListener vfio_memory_prereg_listener = {
     .region_add = vfio_prereg_listener_region_add,
     .region_del = vfio_prereg_listener_region_del,
+    .log_sync = vfio_prereg_listener_log_sync,
 };
 
 static void vfio_listener_release(VFIOContainer *container)
-- 
2.23.0

