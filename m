Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp8046221lfq;
        Fri, 25 Dec 2020 01:50:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZovqp1WwYU+o1YWKYcJfscAj8IuPkabaLhUoe7YULZX8JPfTzh+ZdSuPuGNpj1AZrusK+
X-Received: by 2002:a25:4090:: with SMTP id n138mr32416186yba.276.1608889856128;
        Fri, 25 Dec 2020 01:50:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608889856; cv=none;
        d=google.com; s=arc-20160816;
        b=KnvhxvRxQ0Czi4MC4112m9KvRcURXcCZtt09N9fJYacNC2ge1bURWo3ZYtYroVIIET
         u9AOeLDIVaDMkrYHFlJ1tRwUnmXa5UChwRVYsSxRsnXUAt1W85nYqcgSI5tk33IkksCk
         BoeNfLqn8EkYI0dud0uh5xrIQXeHoLOE6FqDmwR1zgq0VAgTNUmebFbk4iFRJW3EsyAb
         7pqwSTcyBesOmnrcRcaJxAssEpzv4jekz07s9oLKzTbWW3A9BAgJv3MjUFCCWr6p3jvE
         gUgpl9IxGKGlz39PauhnrVDijYcj/bNL/5jylE0OINCspD47a3giQJLJG4R8ZJA5BA52
         uHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=BfKAYogb3o6ZXhVJEmYpNFHBtwl3uF/E70Ieu82QiYM=;
        b=lE8zxqnfg5WL487oex78xXci2s/cO2m6SBboL1kXSHKmde+2tVVQ8AtidcdA5f7Vrj
         yjcKq4Rv/3BHmDsGRR5d7G8XnlgGPzDF4E1bUQXIFpDVFdLfxj2r82G+DMlABnZw1eq+
         fKusLDbcZ71VAgb97cA8VCGFnfyBkCJpRqo/EmSfouxSJDKifTg6Bddt/DPSQwSwSUMf
         IMtm1RlzdFXKaYiUBs6VijYuMhXzzrK1sfwUaywrHO7TiHpv/k8Ka5bLZRpbuYCrToF6
         p8UK4YAhxsEeJ/PoSF5OVYzqg2cnz9Y6XCc7Dr859wdt8tEjXK3cLQvDHsRmBbs8MRKk
         z6UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si27286748ybi.148.2020.12.25.01.50.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Dec 2020 01:50:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ksjkN-0005aE-Hc
	for alex.bennee@linaro.org; Fri, 25 Dec 2020 04:50:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1ksjkD-0005Zq-Pa; Fri, 25 Dec 2020 04:50:45 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1ksjkB-0003OE-0z; Fri, 25 Dec 2020 04:50:45 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D2McL3ddyzhwsq;
 Fri, 25 Dec 2020 17:49:54 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Fri, 25 Dec 2020 17:50:20 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/smmuv3: Fix addr_mask for range-based invalidation
Date: Fri, 25 Dec 2020 17:50:15 +0800
Message-ID: <20201225095015.609-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=yuzenghui@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MOU7d5BqYkD9

When performing range-based IOTLB invalidation, we should decode the TG
field into the corresponding translation granule size so that we can pass
the correct invalidation range to backend. Set @granule to (tg * 2 + 10) to
properly emulate the architecture.

Fixes: d52915616c05 ("hw/arm/smmuv3: Get prepared for range invalidation")
Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hw/arm/smmuv3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index bbca0e9f20..65231c7d52 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -801,7 +801,7 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
 {
     SMMUDevice *sdev = container_of(mr, SMMUDevice, iommu);
     IOMMUTLBEvent event;
-    uint8_t granule = tg;
+    uint8_t granule;
 
     if (!tg) {
         SMMUEventInfo event = {.inval_ste_allowed = true};
@@ -821,6 +821,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
             return;
         }
         granule = tt->granule_sz;
+    } else {
+        guanule = tg * 2 + 10;
     }
 
     event.type = IOMMU_NOTIFIER_UNMAP;
-- 
2.19.1

