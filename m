Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2889354lfg;
        Tue, 22 Jun 2021 02:41:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy92vWu3tcJNxswEjU94MBPLqtXOlQXoZzT5Rrcnn+4cVJhlzG7p4QUFjWoxg1zRgGzkmtx
X-Received: by 2002:a37:7bc1:: with SMTP id w184mr3269752qkc.176.1624354863140;
        Tue, 22 Jun 2021 02:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624354863; cv=none;
        d=google.com; s=arc-20160816;
        b=GinSvxyEh2OY/1lWfzgw8uCg4dvRFcNEBHEf1N4mNSiKNSlExxpJ2tCx0dUfYjiRPs
         4RkDLTWi65sQhJF1lGF1l5yzQAvjqk3bGFb7h5XIVO8+I7fXck4kra3riYxInm4t1l7N
         TG4e9PZAZQnZBfQ80TahZa8TWwBb2B+5DwgBBXOskEEorN/lzhmdaCLkNH/BPT0Fayg0
         6FWPkzVolu4AYTOUkL3y21PqCRn7mIssZSJ22UFaval4DG7Q91ekAu+9xdhDaDpRv/KN
         6dH4/v0/IDtxBsRIspNDVU+6B276rL6Yy8nkEBNVZ5uSyUHO4SjrsXx2oax3DN4OyHse
         Ejxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=MeVMHMpor5CJaaHkCunlXCOZuB3M+yP2GvNJ5xyo6CY=;
        b=SnKh3hOygdvwk5380vnnd+zqWl67F14fuaHCmXUqHVYCwFbbJ1uH4VdYTe1WughqMx
         9VSbaEG7du9Qw+Ek7uApxmZWYpYz7htATo1cHHOov7owPXJxl8Lhb30CAJESC7knrkx6
         Ar31ufiNcTjOBX294EJq3qjRLuKZN2IsiokbbpSMF34PKtHpUaBD0dnyaPB040MVD8ZY
         b2U+UuK8C7tMeiGN1aa91UmLgeOx1X4l6TkgV98bXoFmf1M6DCWdVEiwkbgatobEUAEv
         1M9J2nSlswc9NxdLGj/VDjMB182TFd6/8rHEwZbMbu/NIUqWUGdsPNfVwkQu3L9enSKI
         65Qg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l13si17241352qvb.95.2021.06.22.02.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 02:41:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:38412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvcty-0000jX-El
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 05:41:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnm-000357-S8; Tue, 22 Jun 2021 05:34:38 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lvcnh-00032p-0R; Tue, 22 Jun 2021 05:34:38 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G8LkB1qbyz71kX;
 Tue, 22 Jun 2021 17:31:14 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:29 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 22 Jun 2021 17:34:28 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
Subject: [RFC PATCH v4 6/7] hw/acpi/aml-build: Add Processor hierarchy node
 structure
Date: Tue, 22 Jun 2021 17:34:12 +0800
Message-ID: <20210622093413.13360-7-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210622093413.13360-1-wangyanan55@huawei.com>
References: <20210622093413.13360-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Yanan Wang <wangyanan55@huawei.com>, Ying Fang <fangying1@huawei.com>,
 Henglong Fan <fanhenglong@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bjauiD6tzSOO

Add a generic API to build Processor hierarchy node structure (Type 0),
which is strictly consistent with descriptions in ACPI 6.2: 5.2.29.1.

This function will be used to build ACPI PPTT table for cpu topology.

Co-developed-by: Ying Fang <fangying1@huawei.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
Co-developed-by: Henglong Fan <fanhenglong@huawei.com>
Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/acpi/aml-build.c         | 26 ++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index d5103e6d7b..9fa5024414 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1920,6 +1920,32 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                  table_data->len - slit_start, 1, oem_id, oem_table_id);
 }
 
+/* ACPI 6.2: 5.2.29.1 Processor hierarchy node structure (Type 0) */
+void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
+                                    uint32_t parent, uint32_t id,
+                                    uint32_t *priv_rsrc, uint32_t priv_num)
+{
+    int i;
+
+    build_append_byte(tbl, 0);                 /* Type 0 - processor */
+    build_append_byte(tbl, 20 + priv_num * 4); /* Length */
+    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
+    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
+    build_append_int_noprefix(tbl, parent, 4); /* Parent */
+    build_append_int_noprefix(tbl, id, 4);     /* ACPI Processor ID */
+
+    /* Number of private resources */
+    build_append_int_noprefix(tbl, priv_num, 4);
+
+    /* Private resources[N] */
+    if (priv_num > 0) {
+        assert(priv_rsrc);
+        for (i = 0; i < priv_num; i++) {
+            build_append_int_noprefix(tbl, priv_rsrc[i], 4);
+        }
+    }
+}
+
 /* build rev1/rev3/rev5.1 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 471266d739..ea74b8f6ed 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -462,6 +462,10 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id);
 
+void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
+                                    uint32_t parent, uint32_t id,
+                                    uint32_t *priv_rsrc, uint32_t priv_num);
+
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id);
 
-- 
2.23.0

