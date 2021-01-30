Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1688394lfo;
        Fri, 29 Jan 2021 20:32:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1yzDLihTgtaP8VH/bw56w1KfunRT/BNiItYc6JkLX3wWGCyZJiJyjVIQVXUaFnyAAa5Xg
X-Received: by 2002:a25:7c06:: with SMTP id x6mr12865857ybc.445.1611981176323;
        Fri, 29 Jan 2021 20:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611981176; cv=none;
        d=google.com; s=arc-20160816;
        b=YNrFInbY5WDQJMWsVwBbsSJ7CN8EWe+HUTc+T63/OQtiFPg9e7m9jjNo7Ex9+bq3d3
         TcdW0uC13RkG500BU8yhog/L0hr+7ehvP3DR3zJATfvLAaVIJ8XQN/pG+mCg8fNIfq8q
         KMe+J/UcjZUZiQ23ne7m7bI5RyIyHJpA6wUM4Zq2GViZO3yOQviFq8HLNGl172JTY7bN
         5TQ4NqgaTSIvtOsZxK9zOZeFz0oMhsDbj8TjZzigF2rOP8IX//lMKBamIZTGwlCbO1Py
         k8XICDW2DG8Yq+PodZqVr60fKRVUne86bq8AANdzyXceOzGZ/Qtq1g9cRgh3+E/Q5OLy
         2v8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=bKgshwxF7NR++HCu3eWPGHli1Qnu2NP2MlGOgPsWQg4=;
        b=OM8barxKr2tlYXa7efFH450A+02OTDk+YLZrJET7wrtY0/BKR8prXPrblbHHlrO1mH
         odBO46f3yG+0aP4oH8jXdCFOltbl+UD9LygWR/VniaiO2/O5bub5xWzxKzlCcUK6q02C
         /UHm4QgKP0UGrLq2zYo9CtX7eKsoekkdkDKn81/fGNrhZi7rxWRKzBopoy9/W71gidLj
         s1raBM/bDmHKpMmlIUfJ5HSnP7TnhjobW3QCwJC+DcdEuNCOonJhIoMf5gQKc/qVJQzV
         m0svuIxtO3CF9FXbGCLOTzJnYOMX/9fC7CVHxR/LKuFnPyEhTTtwbuNZ5VDnn2RrNEay
         Qyug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si10134584ybp.62.2021.01.29.20.32.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 20:32:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5hwN-0003eH-Mu
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 23:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1l5hwD-0003dr-Uj; Fri, 29 Jan 2021 23:32:45 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1l5hwB-0008Ip-BQ; Fri, 29 Jan 2021 23:32:45 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DSLrP4FBRzjBJ7;
 Sat, 30 Jan 2021 12:31:33 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Sat, 30 Jan 2021 12:32:27 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>
Subject: [PATCH v2] hw/arm/smmuv3: Fix addr_mask for range-based invalidation
Date: Sat, 30 Jan 2021 12:32:20 +0800
Message-ID: <20210130043220.1345-1-yuzenghui@huawei.com>
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
X-TUID: XQeo6kNmq2uM

When handling guest range-based IOTLB invalidation, we should decode the TG
field into the corresponding translation granule size so that we can pass
the correct invalidation range to backend. Set @granule to (tg * 2 + 10) to
properly emulate the architecture.

Fixes: d52915616c05 ("hw/arm/smmuv3: Get prepared for range invalidation")
Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
* From v1:
  - Fix the compilation error

 hw/arm/smmuv3.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index bbca0e9f20..98b99d4fe8 100644
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
+        granule = tg * 2 + 10;
     }
 
     event.type = IOMMU_NOTIFIER_UNMAP;
-- 
2.19.1

