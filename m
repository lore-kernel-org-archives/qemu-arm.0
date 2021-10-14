Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp4040309lfc;
        Thu, 14 Oct 2021 06:22:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzao2CMdxGeL9yBuULXOB3vXXxA88LHYOu6qvVECqR5qGKlhgyyOpiUq/2yD/nLRkKSAS9J
X-Received: by 2002:ae9:d8c6:: with SMTP id u189mr4837204qkf.391.1634217768185;
        Thu, 14 Oct 2021 06:22:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634217768; cv=none;
        d=google.com; s=arc-20160816;
        b=0GWQmPBgf9prXnVS7Olg+jGR0yhrRtBjx6hTwIphzGN1Tr6GN0s1bgRTuBi91urdm2
         ZfbDqKkSwbzPTLe9biNWZVXGc5BLxC0pxHywYOEN4uejNCF0DeTXDQ+u/hA8RVrYeeYY
         hJqX8M8Rl8Tltmb9hgH681nJgsx+CFhXCdU9nTl9CT83XwKvJLAomVMoCHtP4GN+2ooE
         onG9cLxl8WI9iVZkE6uXyEUAvnXzBxQW9XyKcNiEpZszg8d81ZBVmASVPMYFyZLIH3ZR
         gbbWy0PgVv1XITkiGSIT4SbGLeyMboC8NvphnC5mEbhe8sAdu2RKoHeGAnnXOY06ZfWq
         Qmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=dgDKUXehAfaN7NyFGdtn16V0wzCpC9Y0pc0DCr0Gd50=;
        b=D8yToTCgjMIWuj2ih0Z7yApVP1gALQ4Bsqos4dLZgPJsb5sacMYMrtcKvF/qVkLEX+
         mnsVKCiJvb2je4lXq5V+C+UjUhZXWWhggmpfrrH0GzrJzA1tu0B9iQn/MneKsaiJvkQo
         YWpVe9SshS0LmN+nVXNaM9s/n2X48pudEFxgWQENlMKp6Y/NDPTOIsLl/tN11F1V5dN4
         X5E37FSphdI+W068HInWktueN1sJePndUOza+cuVIs6m9/8WKY4XjZ2C+0NDbdWkGBxM
         zUMw6F4oiYlRuPZx9GB2vI8lztkssgE9cJtOlHJuRhtqUJvcfXaMQhDB4jRKWWCSp2GN
         5xdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2si2639901qki.335.2021.10.14.06.22.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 06:22:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:49112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mb0h5-0003cO-Gy
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 09:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mb0gj-0003ZH-Uz; Thu, 14 Oct 2021 09:22:25 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mb0gh-0001So-5i; Thu, 14 Oct 2021 09:22:25 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HVVLz0q9szbcwg;
 Thu, 14 Oct 2021 21:17:47 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 14 Oct 2021 21:22:15 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 14 Oct 2021 21:22:14 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v8 7/8] hw/arm/virt-acpi-build: Generate PPTT table
Date: Thu, 14 Oct 2021 21:22:05 +0800
Message-ID: <20211014132206.19220-8-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211014132206.19220-1-wangyanan55@huawei.com>
References: <20211014132206.19220-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
X-TUID: 9zTcoEYH41Ga

Generate PPTT table for Arm virt machines.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
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

