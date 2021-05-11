Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3532520lfg;
        Mon, 10 May 2021 19:18:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUIU9h3RPvw5LVZ+JNewUSuSl0bqcQO1YaUVh3azcyMbJ5ZZZS4i94Wwx9zdCyJqP7yKWz
X-Received: by 2002:a5d:8c82:: with SMTP id g2mr20301461ion.34.1620699524454;
        Mon, 10 May 2021 19:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620699524; cv=none;
        d=google.com; s=arc-20160816;
        b=jLf1PYNVauIRdU7D+ekqpH2Men7M9u5u416U+zVEgBZc8DfXdAkS7dR6fWw0sy1t0z
         pGG9UT56wq/HAMViy+SWBTHiX16obNz8ShInR3BcdF+mpy7zh7yow0RYYYZxgFCyaaTS
         5GR3hNXQX3h7IS7bACo3C1ymqX1i+wXr0RQbj6lg5vpLiILq0Y7aILqg/7vRALWMkN4L
         u4VHa6bvaouhk63IrC/fBk26QxJ5usCYQBjA0Q+0fMy54qCvySLXvO4ygTp8T9pbyZmF
         uxdEiYT5gATDN8xWdb5P7c7vkAyOAh7ieDkNVxIddkL/2jKHyBPjdQf2K41uVRlHG/vv
         6V3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=T1EwfrjDm4pQnrAG6mgRKhyR/60X8dH21TyESnQgWx0=;
        b=YRtkqh05ifd3H9/bsFGSH1IB1bQTn7ckEraKOaYDDQ9j9FAheuO+qA7PPlLyVm6vfn
         Yy04QRWFxb29hkwvmm3e7NC8VIM3tsEudpC6a3Xp6Y8fdDD1BDO430D9ZNz6bJuZc5gk
         3ymTFn58B5sw23jSORSC1Ed0W5JvBy2HjyTTE+fYKCmK+EITTGQyh2h2R/W7Nt+aQVzg
         q2JucEoGKjJnXXeMbGepDbyx9do8NS6/oVtsYV2v6Kam8A1pOYluAtb1J+4R6sz1OCN4
         spPk3qIXgW4QCEIdM2578mjjImgaMkbEW+0hhflz1h96wWoscgb7ZzJsZ4Ryxqy9gdVC
         k0TA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si20621012jaj.50.2021.05.10.19.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 19:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgHyt-0002lw-QL
	for alex.bennee@linaro.org; Mon, 10 May 2021 22:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lgHyJ-0002Ha-AG; Mon, 10 May 2021 22:18:07 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lgHyF-0001p9-Nc; Mon, 10 May 2021 22:18:07 -0400
Received: from dggeml702-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FfM0m5TS2z19NS3;
 Tue, 11 May 2021 10:13:44 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggeml702-chm.china.huawei.com (10.3.17.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 10:17:58 +0800
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 11 May 2021 10:17:57 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH v3 1/4] vfio: Introduce helpers to mark dirty pages of a
 RAM section
Date: Tue, 11 May 2021 10:08:13 +0800
Message-ID: <20210511020816.2905-2-jiangkunkun@huawei.com>
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
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=jiangkunkun@huawei.com; helo=szxga08-in.huawei.com
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
X-TUID: gOOZmqtRrDX2

Extract part of the code from vfio_sync_dirty_bitmap to form a
new helper, which allows to mark dirty pages of a RAM section.
This helper will be called for nested stage.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index dc8372c772..9fb8d44a6d 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1271,6 +1271,19 @@ err_out:
     return ret;
 }
 
+static int vfio_dma_sync_ram_section_dirty_bitmap(VFIOContainer *container,
+                                                  MemoryRegionSection *section)
+{
+    ram_addr_t ram_addr;
+
+    ram_addr = memory_region_get_ram_addr(section->mr) +
+               section->offset_within_region;
+
+    return vfio_get_dirty_bitmap(container,
+                    REAL_HOST_PAGE_ALIGN(section->offset_within_address_space),
+                    int128_get64(section->size), ram_addr);
+}
+
 typedef struct {
     IOMMUNotifier n;
     VFIOGuestIOMMU *giommu;
@@ -1312,8 +1325,6 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 static int vfio_sync_dirty_bitmap(VFIOContainer *container,
                                   MemoryRegionSection *section)
 {
-    ram_addr_t ram_addr;
-
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
 
@@ -1342,12 +1353,7 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
         return 0;
     }
 
-    ram_addr = memory_region_get_ram_addr(section->mr) +
-               section->offset_within_region;
-
-    return vfio_get_dirty_bitmap(container,
-                   REAL_HOST_PAGE_ALIGN(section->offset_within_address_space),
-                   int128_get64(section->size), ram_addr);
+    return vfio_dma_sync_ram_section_dirty_bitmap(container, section);
 }
 
 static void vfio_listener_log_sync(MemoryListener *listener,
-- 
2.23.0

