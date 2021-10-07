Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp948953lfp;
        Wed, 6 Oct 2021 20:11:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+qUceGcb2Fvz9VrtmPQtQWxQYDdUY7MPF7ij0NrvMUiwq8m17ntx+FrsE6bF3sAOF8m+5
X-Received: by 2002:a05:6e02:1bce:: with SMTP id x14mr1338605ilv.168.1633576318349;
        Wed, 06 Oct 2021 20:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633576318; cv=none;
        d=google.com; s=arc-20160816;
        b=or4SkxvMTAqqCyfk2gwGD7TKaurMgxzk4GEVj7LE7SNqBY+OXJBzvNz6t8wIDt9cjE
         afZsahtULDdr9e2xbWnrrhiG0DtLXfEVWVZsB64CqCMu/XCNgCt0Fnbc9R8Ve9js2tQk
         P9MEMXN8kUD2E5hYUL/rtYBN9d0bqjOz6L1lg4lTy6K3QBVKFpNv5ZXrVU+udbZ6y0wW
         dDNCWueVAH46IhPwwDMHyjFzkRnSm8iEs4V9M9ewiNGhMK2AuvBiPPH09buJ/wVWCMgE
         c90gq2Qc1jwY8WWXdxBMAmZZ44ta6NNMRPAbRa7kE/Tn9ph2R0cP3flnZFCkKETC79S+
         enbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=m9NAeC22HVOPzflQvWPltQSCwt6oc0tG+CLa04U0Z9k=;
        b=qyIYReA/YLqACdzxL0TDSjxDykw7wtVC1pACoKWKOMMZyFkA9D3LGThBJh38/aMXSX
         f3dASA0hCffyD2L6j9wdbW6V0LyzGpDcCPcEI1NlFgVBARDxDo4OQq0VnujEGZk4RO5v
         nhEPhLgdzaAR7rvqGrEgvxC+zccbeEUyoiOZPYgnheGFXEtR2lmPVWlvqCmOJ7ociTk1
         whvn2Z2sXwuoPQM5KThj4RkiKRLZxSSskypVL0Z0TcbInxmFIHAqqKY6dchDkLpRAKZQ
         MyCuqZX/LzShN4BvCa+Pg0uEWrSxldkMbs16swNJSNMhoIEkfTYnFgTQRR9Tg8Mb39fK
         SKpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si29564514iot.89.2021.10.06.20.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 20:11:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYJp7-0002jM-MX
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 23:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYJlT-0004nC-5h; Wed, 06 Oct 2021 23:08:11 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mYJlR-00016x-7u; Wed, 06 Oct 2021 23:08:10 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HPx7P1WRKzPjsd;
 Thu,  7 Oct 2021 11:06:57 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:07:57 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 7 Oct 2021 11:07:56 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v7 7/8] hw/arm/virt-acpi-build: Generate PPTT table
Date: Thu, 7 Oct 2021 11:07:45 +0800
Message-ID: <20211007030746.10420-8-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211007030746.10420-1-wangyanan55@huawei.com>
References: <20211007030746.10420-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
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
Cc: qemu-devel@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A042Pg0/PEGe

Generate PPTT table for Arm virt machines.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt-acpi-build.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6cec97352b..658a0a5d39 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -875,13 +875,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     dsdt = tables_blob->len;
     build_dsdt(tables_blob, tables->linker, vms);
 
-    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
+    /* FADT MADT PPTT GTDT MCFG SPCR pointed to by RSDT */
     acpi_add_table(table_offsets, tables_blob);
     build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
 
     acpi_add_table(table_offsets, tables_blob);
     build_madt(tables_blob, tables->linker, vms);
 
+    if (!vmc->no_cpu_topology) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_pptt(tables_blob, tables->linker, ms,
+                   vms->oem_id, vms->oem_table_id);
+    }
+
     acpi_add_table(table_offsets, tables_blob);
     build_gtdt(tables_blob, tables->linker, vms);
 
-- 
2.19.1

