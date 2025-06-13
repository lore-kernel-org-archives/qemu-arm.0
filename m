Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp308195njc;
        Fri, 13 Jun 2025 07:49:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVldvZuN7sYexIgnan7c/rekWtKduhFPe2SfLQaRr0172u5KGQB9xBgiCFXtmNF55EqJvPHfBo7sAFNeA==@linaro.org
X-Google-Smtp-Source: AGHT+IFgsqfUWBWs7m3oEWwdw81n6P/5GTTfLmpB0f7G2OFck4ZLAQxO1hQgAWkSeIB/TXj9g2wq
X-Received: by 2002:a05:620a:3908:b0:7d3:9218:6d1b with SMTP id af79cd13be357-7d3bc3acaf8mr587665685a.25.1749826140286;
        Fri, 13 Jun 2025 07:49:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749826140; cv=none;
        d=google.com; s=arc-20240605;
        b=FZoHqG54IbqjBxzQxcUVUCwuoaJLDQIZu5UdiOUnTnZ+K/JKKXMFnSdE6NORITK8LT
         8jmg+PgbVpMT9Nv1IcRDchbXAZig09EsstmxAbbC2189uMRTUbrAZ8QI09RiDmhijLkr
         AJiK5qSViv4/YTwMdBNNC5xuxGteBg0H4+wOedWazx1GyClzzSKaYQ40lhdWq3c+m6ck
         Hzsq1Eb2RQSkYr4wPgwGIdUT5tWihKGw5/i+cVs2VTp4QbrbHvt6ScwcLD1sYbR9Un4u
         x+do5OMHNc0PYTgi4KdIrCp9wgAHNYyirWGYgKtjItoODNCR5fweMNlbElhaNlP5zazx
         FLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=d7BjYQt7mMucYSMbTkLm7oLJgmaRGMseVeHttrUXhsQ=;
        fh=12ij1D0xizeHJ+1WEqwo/9QFN2xwslWS8h/2oI6OPA8=;
        b=IwwK4Nvj4USJMyJ3w+K+PGWB+dd+uyYG9vz3a9nyoGwEShJI7dMMc/xfli0xVQK24h
         g88nYA5TC3vKwcB0xJ6pheiTa0W+BD7oO3+8o+4+4cMvXwR85GT/6mOLq6hj3hC20XQc
         k7ks6qFTvTLdzcSNRTqa6wtL+VBVVbRGhW+UQgMAVCpSMbhAroLdJOteB6MIV4YbkLUj
         gMUFh42eHBAArgh2ig0EkCW1kEo7tjlyWhXUNQr/2R82b3eFFSycA5a7PPk4Z6ngXBKD
         HmegNovU9P7joNL2yO7xbL/RyS+jA00wZb4D79Rq7bBLPL9rbJuLh68UPwvzPogBqYXm
         ap8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8dc32a8si322722385a.51.2025.06.13.07.49.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 07:49:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uQ5fl-0007mR-QP; Fri, 13 Jun 2025 10:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uQ5fj-0007l7-7N; Fri, 13 Jun 2025 10:46:23 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uQ5fh-0006eT-Es; Fri, 13 Jun 2025 10:46:22 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bJhyx6F54z6M4jb;
 Fri, 13 Jun 2025 22:45:45 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 44271140393;
 Fri, 13 Jun 2025 22:46:13 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Jun 2025 16:46:05 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: [PATCH v4 1/7] hw/arm/smmu-common: Check SMMU has PCIe Root Complex
 association
Date: Fri, 13 Jun 2025 15:44:43 +0100
Message-ID: <20250613144449.60156-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rml/lLV1ZXhC

Although this change does not affect functionality at present, it is
required when we add support for user-creatable SMMUv3 devices in
future patches.

Tested-by: Nathan Chen <nathanc@nvidia.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmu-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index f39b99e526..7890aa12c1 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -20,6 +20,7 @@
 #include "trace.h"
 #include "exec/target_page.h"
 #include "hw/core/cpu.h"
+#include "hw/pci/pci_bridge.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
 #include "qemu/jhash.h"
@@ -937,7 +938,8 @@ static void smmu_base_realize(DeviceState *dev, Error **errp)
                                      g_free, g_free);
     s->smmu_pcibus_by_busptr = g_hash_table_new(NULL, NULL);
 
-    if (s->primary_bus) {
+    if (s->primary_bus && object_dynamic_cast(OBJECT(s->primary_bus)->parent,
+                                              TYPE_PCI_HOST_BRIDGE)) {
         pci_setup_iommu(s->primary_bus, &smmu_ops, s);
     } else {
         error_setg(errp, "SMMU is not attached to any PCI bus!");
-- 
2.47.0

