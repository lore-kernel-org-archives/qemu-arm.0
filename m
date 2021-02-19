Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8874941lfc;
        Fri, 19 Feb 2021 01:44:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+AwBsVnUGas7kTh/xaSqPbA1ypEHTxd44Kjy35v/bNQEunlH9OvYx9zG6ogU0NN0Wbsib
X-Received: by 2002:a25:8087:: with SMTP id n7mr12969729ybk.367.1613727864776;
        Fri, 19 Feb 2021 01:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613727864; cv=none;
        d=google.com; s=arc-20160816;
        b=kETdomSxWa1/TiXcfGCxajoPLLHh6rZCUcKXVCdRweuyB9l4DtGOvTQgtAzQPB8it1
         m4YWJq/YYNX69j5wOPvUgewe3fq76g8jut80ihSmzy/tE23REetkJXj2iYYWQIxjreEQ
         bRsMwibvmA0I5ul+MNMFWZdgVKYKnRPA1LhqLJOgNgmpNIuO7u3IQWvSAwYABCVo/aBR
         8eylWqcLhRwwe0i94gAGLG11fJPEksbEMJk1YAbCbO6dL4/11pjYjdajp8RBojoci2s7
         Ah1YJ3A+HRc1u95nBwIvOQxOYw4dfRq1uMuFa5YWZoYGuO22eWYtbnejleixTMdUD6Ay
         9e2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=trhu3ivdmYFh6xhVZYKGcXhaKDbkZk6dM1u/milXuew=;
        b=Ho/W/32WvVXFM2dixM0p+70izH8jAceQ0gQXOda4ryFyU5KbAsbG3BpouHd8VfyXfS
         6apDxhQmfOHAElOl7DHtzkBru2O0bGUSXADjoOnLm4e3+vz6fhbhlmWi+zl5GFOC8Inc
         baaKfr3RK4YFOTx2O+qKaOFbEH6ah/E/K3ez4uZtWgEE35lmd1KolN0XEpAEj/KkA+3I
         bsVgT9otWV0oi8WM0Xzo96gp0JoDr1XIG96LA0vy6IDC4PZ3yAThhbyociUNqUPkpjah
         YEasqZM8ZqH3JirpeHstF1BVdifaGFVSVSMwx7ALfABDDBaQRp7I8YWCjUtcM5FpOMtX
         kc0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r35si8279047ybd.335.2021.02.19.01.44.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 01:44:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD2Km-0000wZ-1u
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 04:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lD2KP-0000v3-OS; Fri, 19 Feb 2021 04:44:01 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lD2K8-0006XP-JM; Fri, 19 Feb 2021 04:43:59 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DhmnC51DMzjPxL;
 Fri, 19 Feb 2021 17:41:51 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Fri, 19 Feb 2021 17:43:17 +0800
From: Kunkun Jiang <jiangkunkun@huawei.com>
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Alex Williamson <alex.williamson@redhat.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: [RFC PATCH 1/3] vfio: Introduce helpers to mark dirty pages of a RAM
 section
Date: Fri, 19 Feb 2021 17:42:28 +0800
Message-ID: <20210219094230.231-2-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20210219094230.231-1-jiangkunkun@huawei.com>
References: <20210219094230.231-1-jiangkunkun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=jiangkunkun@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 Keqian Zhu <zhukeqian1@huawei.com>, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4nBarfGns4kY

Extract part of the code from vfio_sync_dirty_bitmap to form a
new helper, which allows to mark dirty pages of a RAM section.
This helper will be called for nested stage.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 hw/vfio/common.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9225f10722..7c50905856 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1203,6 +1203,19 @@ err_out:
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
+                       TARGET_PAGE_ALIGN(section->offset_within_address_space),
+                       int128_get64(section->size), ram_addr);
+}
+
 typedef struct {
     IOMMUNotifier n;
     VFIOGuestIOMMU *giommu;
@@ -1244,8 +1257,6 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 static int vfio_sync_dirty_bitmap(VFIOContainer *container,
                                   MemoryRegionSection *section)
 {
-    ram_addr_t ram_addr;
-
     if (memory_region_is_iommu(section->mr)) {
         VFIOGuestIOMMU *giommu;
 
@@ -1274,12 +1285,7 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
         return 0;
     }
 
-    ram_addr = memory_region_get_ram_addr(section->mr) +
-               section->offset_within_region;
-
-    return vfio_get_dirty_bitmap(container,
-                       TARGET_PAGE_ALIGN(section->offset_within_address_space),
-                       int128_get64(section->size), ram_addr);
+    return vfio_dma_sync_ram_section_dirty_bitmap(container, section);
 }
 
 static void vfio_listerner_log_sync(MemoryListener *listener,
-- 
2.23.0

