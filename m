Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1640807lfc;
        Wed, 20 Oct 2021 07:23:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVGSOEhhtDczO+/cLjqxm++CKAAVU35kcnwsFUq3pgeSmhcMh0M8zIylzgaM+29Y+es5zZ
X-Received: by 2002:a9d:65c1:: with SMTP id z1mr157249oth.198.1634739837494;
        Wed, 20 Oct 2021 07:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634739837; cv=none;
        d=google.com; s=arc-20160816;
        b=hgOyvoC/4V8nSfbOn87Upj2U7bPYb4ig/dqPBAcbwGN9lADnOvvrddjcJ7HkkEHmnz
         lz/pI4AxUZxB5jY1sfRohJrmh2XbBECDG0ILv/+8OUBk08H4HLaMrh0rhCWF7OBhbAOo
         SbZ8uPkyZI4d1KXGip6TDyXiqE7AvA9t7Sc4pjEkRGCNXwnyfCxwG9TfJZYsmLtpHVgK
         YuxvApH3Rq8cnRbtYctYwPbZAPi/rZ4n3a4lsUWsltSMw/qHAt06eNfk+KzFK9QRtReu
         NTFofiluMChTrH5PHHU91V2wpYx/lpw+c2rX9pQkdb3hcqNgU4PLWMd1/+9wNspNkaDj
         FFwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=ZftvAmaxP7FULioi0AosRZMuwOLs6hg8jcRgAhkDQyc=;
        b=pnrSTvZFbaVmIqsOQb7O5nRWjdlG3SuoXEfBeiWVp4iWYFAu2KItS4vzRWh49MWbST
         Wz9+U/bW7OUO8cu9zoJ397qJV9isvcEOdtY4cSvCYAo9obvmOzPh1qxyE9LHVlg6kh/u
         jY8z2X+V6AkZLEKxtRjzmHnjREF4KMn+auyqkgXj5/8jnrqqVikTqmSVzwW/0aTC/sb8
         DrlOpuuG8xKv4Hu3rvLXzxOgvP2VI8pBloyXrVIN+BmpzHyvCmiHybdDhUxqB+CL2CNr
         moFCI+BJGuBGEAgYh7T/EQmhnUSHRee2qf+rzvjeAxYdkzSbNvPotB6a9yElD8HfcNTo
         PXdw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4si2659191oib.208.2021.10.20.07.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 07:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:46336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdCVY-0002hM-KH
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 10:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdCTQ-0006xS-SY; Wed, 20 Oct 2021 10:21:46 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mdCTL-0002Gk-Lx; Wed, 20 Oct 2021 10:21:44 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HZCNY2T1rzcfdw;
 Wed, 20 Oct 2021 22:17:01 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 22:21:35 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 22:21:34 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Eric Auger <eauger@redhat.com>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v9 7/8] hw/arm/virt-acpi-build: Generate PPTT table
Date: Wed, 20 Oct 2021 22:21:24 +0800
Message-ID: <20211020142125.7516-8-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211020142125.7516-1-wangyanan55@huawei.com>
References: <20211020142125.7516-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
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
X-TUID: 2RJB1yFPbZWc

Generate the Processor Properties Topology Table (PPTT) for ARM
virt machines supporting it (>= 6.2).

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
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

