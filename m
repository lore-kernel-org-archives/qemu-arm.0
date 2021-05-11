Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3533312lfg;
        Mon, 10 May 2021 19:19:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf+W29M1Wx1yoYedKcazO3sc5TqBFeVuUYaO3z6zDPL7pXa7eN+w2YHgyWixllocjvEkX4
X-Received: by 2002:a05:6e02:2144:: with SMTP id d4mr15273059ilv.84.1620699597228;
        Mon, 10 May 2021 19:19:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620699597; cv=none;
        d=google.com; s=arc-20160816;
        b=omHjadxkyRGUBEGXF+9vmddCS8zbXkVVVjzvsf/4zUw5OM2WlWY4HbrGfAtJlq8DhZ
         N9/7JccT7H5o92kE6hLpKacv9GDnqmtcG34qDOK4gLpAldHm0g+zbRrXoql2O3+ADJN5
         AEjTbMY+IiFj//sj5eK/12aDUsAowC/1hjxD1oVn+FUBETwy/quhwz1ardKs3Gxl/GwN
         KD/YG1j0+0ZzGD6IgAyPL9h/w8nAtrUPXTIMBFJNheLDPi4eMnoA2BQRpS6fv8nL40hs
         ctmZQp1BuZPiuS2SwtBplMGBfewKdjgIkouk+DGCK/OPzkR70+2SSZwakIfUoTLO9ocO
         IQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=g7kLbW/UZzXQKdYMRHyyoh+1Nv8E7PxSO0tEERqCaho=;
        b=lBXt727tUqD9A5lSfJLFMrYCm0HvOAepLBg2r2QG09PxYyyGQFfS09djQNFh6jDPYA
         /zKRSkThypWeFh59bZpI2vEmO2fwWQXQhzxFxJivqK+BMevZmXN5UIJ0xx0BRSuNSRdk
         4qEMmp4rMKPEUi1PMBdR0D3p2ScoBO3gOzhNEMHS6gd1G2MMspknnLTVR47FOXY5ZSrK
         rC1qMmFIbjVEnrAdVK/IeMn51wfPsh9LF2iLz3XgLnptrBPRWMcc9z1EuzafqARepLz/
         X8Nm9Kr+89T9qs7es+2WEWNzOo9X2jQcbMZEFebXgaiU5JPcwhUgsFgcxBNNE9/1EOub
         rAeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m5si18175739ili.151.2021.05.10.19.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 19:19:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:42186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgI04-00051b-JE
	for alex.bennee@linaro.org; Mon, 10 May 2021 22:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lgHyR-0002YJ-VO; Mon, 10 May 2021 22:18:15 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lgHyP-0001wj-UK; Mon, 10 May 2021 22:18:15 -0400
Received: from dggeml701-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FfM341PLXzYgmT;
 Tue, 11 May 2021 10:15:44 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml701-chm.china.huawei.com (10.3.17.134) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 10:18:11 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 10:18:10 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH v3 3/4] vfio: Add
 vfio_prereg_listener_global_log_start/stop in nested stage
Date: Tue, 11 May 2021 10:08:15 +0800
Message-ID: <20210511020816.2905-4-jiangkunkun@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevin.tian@intel.com, Kunkun Jiang <jiangkunkun@huawei.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dp+ybo/PxQz/

In nested mode, we set up the stage 2 and stage 1 separately. In my
opinion, vfio_memory_prereg_listener is used for stage 2 and
vfio_memory_listener is used for stage 1. So it feels weird to call
the global_log_start/stop interface in vfio_memory_listener to switch
dirty tracking, although this won't cause any errors. Add
global_log_start/stop interface in vfio_memory_prereg_listener
can separate stage 2 from stage 1.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 149e535a75..6e004fc00f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1209,6 +1209,17 @@ static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
+    /* For nested mode, vfio_prereg_listener is used to start dirty tracking */
+    if (container->iommu_type != VFIO_TYPE1_NESTING_IOMMU) {
+        vfio_set_dirty_page_tracking(container, true);
+    }
+}
+
+static void vfio_prereg_listener_log_global_start(MemoryListener *listener)
+{
+    VFIOContainer *container =
+        container_of(listener, VFIOContainer, prereg_listener);
+
     vfio_set_dirty_page_tracking(container, true);
 }
 
@@ -1216,6 +1227,17 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
 
+    /* For nested mode, vfio_prereg_listener is used to stop dirty tracking */
+    if (container->iommu_type != VFIO_TYPE1_NESTING_IOMMU) {
+        vfio_set_dirty_page_tracking(container, false);
+    }
+}
+
+static void vfio_prereg_listener_log_global_stop(MemoryListener *listener)
+{
+    VFIOContainer *container =
+        container_of(listener, VFIOContainer, prereg_listener);
+
     vfio_set_dirty_page_tracking(container, false);
 }
 
@@ -1408,6 +1430,8 @@ static const MemoryListener vfio_memory_listener = {
 static MemoryListener vfio_memory_prereg_listener = {
     .region_add = vfio_prereg_listener_region_add,
     .region_del = vfio_prereg_listener_region_del,
+    .log_global_start = vfio_prereg_listener_log_global_start,
+    .log_global_stop = vfio_prereg_listener_log_global_stop,
     .log_sync = vfio_prereg_listener_log_sync,
 };
 
-- 
2.23.0

