Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3532821lfg;
        Mon, 10 May 2021 19:19:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyp4X0yhKO+6uHq72hT2OTXNdpeei6UAZDwbn05b1pQnl6GPjpxKYdJvEQ+BvDeV+Nw4eNV
X-Received: by 2002:a05:6638:2410:: with SMTP id z16mr24620484jat.130.1620699551040;
        Mon, 10 May 2021 19:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620699551; cv=none;
        d=google.com; s=arc-20160816;
        b=dPfnRvR9iqVs5mGHH42tehlJeChKaZHwmdgPqh+TxI77fI3Qsd8FToQxM8/vBiVuGo
         a0roYagSD2w4iW8nrROxaiR4bokC8pCstoM/FqPhrkUbXZsTPepKS0N1JQyARUHF0c/R
         Vi5rmjT6YB7e2EzTgSXY6MAsoX+5o2ccokQncVtSHGH50PWGMOYxUcxP6szG99ehTVkt
         JK5fOWUznWRth8ZHCUtkES2l6jJpzmx5n377d3xt0L1NeF/sf3kEmNsdiK6aTWUKyG+B
         pmJ4x9/Noj31B6hlryghIBkLZXTAR4KsmvWAsyeZXU6QMdHgu5BgCq0vlPSvsUcCwHaw
         qnbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=r6ax6kbx0l+h6O+KQQha6LxyT/9G3OW4yfZI6G0NctU=;
        b=o9Y3up/Cop3RxhORbviV7y90jl5+d865FeX4ETMhFdmZlGAtx209B33i/9a43YrAJn
         4U5zo1GHo7L+nPbbtqoJPKhQAitstvORcZPGsyXioW88uAqziuQDeFhc44pQDo7hlR7v
         5lL2qS2TWyDu+0jyW7pyNEZnpYMjdfDF8laiCsNIpvMfzNiIZa7aqypmpo/bQr3Lpeoq
         Pxxzjx3/fBjzYHHbozyqeCbkzveaNo7ipVGpOrngpbQN8JvQk6Z6Y3IsnJPddAG/viUw
         G5PMSldZ1KWwYv02SV4Uc1W2+rsWH2MQ1gkgT0TLG5PjWMH5elNtGUsYgR4FWAlOvKd/
         U7EA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17si16814649jaj.26.2021.05.10.19.19.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 19:19:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:39928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgHzK-0003W4-Ct
	for alex.bennee@linaro.org; Mon, 10 May 2021 22:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lgHyb-0002ev-Qu; Mon, 10 May 2021 22:18:26 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lgHyQ-0001vN-4X; Mon, 10 May 2021 22:18:25 -0400
Received: from dggeml703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FfM3139pczYhYs;
 Tue, 11 May 2021 10:15:41 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml703-chm.china.huawei.com (10.3.17.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 10:18:08 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 10:18:07 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH v3 2/4] vfio: Add vfio_prereg_listener_log_sync in nested
 stage
Date: Tue, 11 May 2021 10:08:14 +0800
Message-ID: <20210511020816.2905-3-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210511020816.2905-1-jiangkunkun@huawei.com>
References: <20210511020816.2905-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kevin.tian@intel.com, Kunkun Jiang <jiangkunkun@huawei.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z0ykANCH29qr

In nested mode, we set up the stage 2 (gpa->hpa)and stage 1
(giova->gpa) separately by vfio_prereg_listener_region_add()
and vfio_listener_region_add(). So when marking dirty pages
we just need to pay attention to stage 2 mappings.

Legacy vfio_listener_log_sync cannot be used in nested stage.
This patch adds vfio_prereg_listener_log_sync to mark dirty
pages in nested mode.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9fb8d44a6d..149e535a75 100644
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

