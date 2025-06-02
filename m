Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2688397njh;
        Mon, 2 Jun 2025 04:49:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEim+OjdIS0PKc+zW3rQEJMaj5z50yvVsha33PU3nzxrnnDfp/K9oJKLbKH8yPjYNVRstOEyKTx1vj1Q==@linaro.org
X-Google-Smtp-Source: AGHT+IE+qxjSllwLH60ES9J2fT20GfU1UQQhArGdHQrkoIzG5jBJshkqOkELTcoQZCEafidT39Uh
X-Received: by 2002:a05:620a:4147:b0:7d0:976a:d47 with SMTP id af79cd13be357-7d0eac3e603mr1163732185a.9.1748864996770;
        Mon, 02 Jun 2025 04:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748864996; cv=none;
        d=google.com; s=arc-20240605;
        b=Y1pC/yFGDBEKVOaAC9Jd8A9Cfuso93ilzRY6WfJVEVAMj/IiUeKfsKwQ1VttgD6hBM
         C04fs+RwhIJ6ExyZTmH3B0kCqHxtHQCAXS/1R/1cePCyk6FjihiS3Ch3cfHDfVMtIbXB
         n12HEmxJMNlxtDoHILKKgYz7nnkOxXIDCY6J1GNHARDQBDA2fhp/x26e9Fegi1MOA+zM
         ZJlNLSCKY0zA4OLwx6p49W9U9l2EgVlaIGMGMOAANFbSNzC1NPag7ZDZJ0Q8oS3oDudT
         JCkAAlCHnK6mjxsPFI+2MFCTY9XNdkg21EiC4jO8mVRrbTbww+yeEteE0W03bZ5vUcSA
         4dOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:subject:cc:to;
        bh=l7aCbAK4B1Ifiqd+MFR6iVZ7pajVgvoFwKSmSWrK9oo=;
        fh=LC8l3CQLTpTKvgP+Hk0fp5EM0ewuOWq9zFrTb298oDs=;
        b=LniwWVA1DSraoLQhlp9fweMQDI73dCiz/O4Jul/9RjsCZkGTJhJRqgrefDE/+B7Oso
         H4eQTgVfDdvi4sTbGrqjSBkPT6LsY+fTmPXQRK92IB3CRI5ad6C09XdgBm9VTbKdQe7J
         UodSwDAffO12qPQbhu2pvNByu38nfR1yM4Qt4dlLULbcxn3Jd7YmmdUclrXyPlQLUnf3
         22rKjMGIhswQh9qNidZf4kefvOwts1IKLmvYxXx1GAoB9nG2+ahXUYlE7IY37hNVAWl9
         lobbiaxv2fqvyJ7BiCuFHmgdqONXqiYFRHIczhQ5BEjMGAPx+SC1UTImck+fftGi4Jue
         j9DA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a319d39si1012527485a.616.2025.06.02.04.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jun 2025 04:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uM3fF-0008JB-MZ; Mon, 02 Jun 2025 07:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uM3fD-0008In-W8; Mon, 02 Jun 2025 07:49:12 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uM3f7-0000ky-Nq; Mon, 02 Jun 2025 07:49:11 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b9sYb5Mtpz6GFWg;
 Mon,  2 Jun 2025 19:48:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id D3DDD14027A;
 Mon,  2 Jun 2025 19:48:45 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Jun 2025 13:48:41 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <linuxarm@huawei.com>
Subject: [PATCH] hw/arm/virt: Check bypass iommu is not set for iommu-map DT
 property
Date: Mon, 2 Jun 2025 12:46:55 +0100
Message-ID: <20250602114655.42920-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) AC_FROM_MANY_DOTS=0.914, BAYES_00=-1.9,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: FNiWbvkcG7RS

default_bus_bypass_iommu tells us whether the bypass_iommu is set
for the default PCIe root bus. Make sure we check that before adding
the "iommu-map" DT property.

Fixes: 6d7a85483a06 ("hw/arm/virt: Add default_bus_bypass_iommu machine option")
Suggested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9a6cd085a3..99fde5836c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1487,9 +1487,12 @@ static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
     qemu_fdt_setprop_cell(ms->fdt, node, "phandle", vms->iommu_phandle);
     g_free(node);
 
-    qemu_fdt_setprop_cells(ms->fdt, vms->pciehb_nodename, "iommu-map",
-                           0x0, vms->iommu_phandle, 0x0, bdf,
-                           bdf + 1, vms->iommu_phandle, bdf + 1, 0xffff - bdf);
+    if (!vms->default_bus_bypass_iommu) {
+        qemu_fdt_setprop_cells(ms->fdt, vms->pciehb_nodename, "iommu-map",
+                               0x0, vms->iommu_phandle, 0x0, bdf,
+                               bdf + 1, vms->iommu_phandle, bdf + 1,
+                               0xffff - bdf);
+    }
 }
 
 static void create_pcie(VirtMachineState *vms)
@@ -1612,8 +1615,10 @@ static void create_pcie(VirtMachineState *vms)
         switch (vms->iommu) {
         case VIRT_IOMMU_SMMUV3:
             create_smmu(vms, vms->bus);
-            qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
-                                   0x0, vms->iommu_phandle, 0x0, 0x10000);
+            if (!vms->default_bus_bypass_iommu) {
+                qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map",
+                                       0x0, vms->iommu_phandle, 0x0, 0x10000);
+            }
             break;
         default:
             g_assert_not_reached();
-- 
2.34.1

