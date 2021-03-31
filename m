Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp336285lfg;
        Wed, 31 Mar 2021 03:14:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOsji01/3MlCOhSy5MmLeZsxnJLOtsutRAmNTXBKaLg5jaxFGj+5dYzD2RLyxbiIJoHf1Q
X-Received: by 2002:a5e:a508:: with SMTP id 8mr1756283iog.135.1617185692779;
        Wed, 31 Mar 2021 03:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617185692; cv=none;
        d=google.com; s=arc-20160816;
        b=l/V6O1TEgvgjghLfY8FZF1wqAH1KamiBn0rf6H5H1Wssee5wcCPAPPexOGHoZJflF2
         Ynytjl6TapHJtMeQM7koYU/oALUcGUppn99XJY15qiie5V2HYIwtLiUM76yGAyxfgeNP
         xcK04lqhqercHw7gnWi8rQX1yROTuQOZHHybfRBNlQdSgVHkt+w1sQnEE8Qg2lLFRL3u
         WmKxc8xz7uHm++MH0p9Mx7xZqJC3vuwcLml75XtqWr3DVBMWQgZpAOYgz6gUhqdU3c8X
         98/l8810fwJv13aTac+FWNYRYdg+XHmzaklGixcvfW5nePDhxiGDS+5X+NJ1pa+PBsnP
         iNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=jMLQBH9nqoQ0/Lg8nw+ls07p0AACJPYr4QSxSVYSFJk=;
        b=TW8eBNxBDDagXkEW0a6c2BxPa4NFEtQ+ptaREf3e5ITeZ+UYH8HMd9+rKzH2TlvDlB
         BnMmqJrV6pEyEp+DkVkPS1w5ekMmH1cUP4YTWEI5gEqD/442zERx9MuZpLaO3Nz41x/s
         6AQuBzcKtqnhykwDzMZ4Ygv9VWgHFPatS3yC/LQMaL6nrbqLh9u9gwbeMX0lSe2d4Vxy
         lW6w2EuUOL+2FwUpBqANhUZqQRR3npxVXn5ou68IPd7grBAIxK7GesI2vT2oJIBlu4PL
         FNFJFSdJVo3n5sbUijSmGuuFoX/SLdo0rHv9YnQ8PwNPfiM5AcvlaITgaAq24JUK9yuQ
         1uuw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w29si1095105iox.12.2021.03.31.03.14.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 03:14:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRXsC-0003g5-4a
	for alex.bennee@linaro.org; Wed, 31 Mar 2021 06:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRXr1-0002U3-4B; Wed, 31 Mar 2021 06:13:40 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lRXqw-0005iF-Jz; Wed, 31 Mar 2021 06:13:38 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F9MXF1lGKznVL4;
 Wed, 31 Mar 2021 18:10:53 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 18:13:21 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 <kevin.tian@intel.com>, Yi Sun <yi.y.sun@linux.intel.com>, "open list:ARM
 SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 1/4] vfio: Introduce helpers to mark dirty pages of a
 RAM section
Date: Wed, 31 Mar 2021 18:12:56 +0800
Message-ID: <20210331101259.2153-2-jiangkunkun@huawei.com>
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
Cc: Liu Yi L <yi.l.liu@intel.com>, shameerali.kolothum.thodi@huawei.com,
 Kirti Wankhede <kwankhede@nvidia.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QUj4Fpv44cqL

Extract part of the code from vfio_sync_dirty_bitmap to form a
new helper, which allows to mark dirty pages of a RAM section.
This helper will be called for nested stage.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7da1e95b43..3117979307 100644
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

