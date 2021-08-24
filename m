Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2748723lfg;
        Tue, 24 Aug 2021 05:20:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4iAWkEzQ4J6enxvRCI9Z3qJ1EwICjM94sbzgN4Eq78elgRv/Jxou+wnvl439ekJendbTC
X-Received: by 2002:a05:6122:791:: with SMTP id k17mr7374981vkr.8.1629807659272;
        Tue, 24 Aug 2021 05:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629807659; cv=none;
        d=google.com; s=arc-20160816;
        b=Q8p3ILVgG/KDhceK9H0aGc6eF+2RucY27nETqlKEo5+0e0vx47JQpRsZeZt/nn9RU8
         q7yITRVt1Y+6IUaFlHU17Lp3vPY9xDqem5LsDdLtMCiPAieSTKJ6ril/5s2p5wL6CQbZ
         55IV5TrSSXXbHJoxgfwSPex0xq0+C2KqbNROu2ghVokub+Dfw7mvEre73Cd0uHMlyrO3
         f7DKwjCjfgJ3d2bGbE85y6TSt55eltFw7l8Hl6bLitkq+oakJccTN2vnDr8+H12Sra0i
         At1AttAQDI6FlYUTmpuSh1aFp6qDI6max+N9rk/Lg+2E0CPnXGPry5vAEiHc0jZiDFiL
         HC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=COVS5c3m4X/4heGLoh/f7DWrhQKQX/EONLaqxQZE/6Y=;
        b=Jx99UooswmcvguPG19kL63QJwboGbcv8fVptMr2iLckJCJit8FXPK0Hb4xjFSXASnv
         SIKbDgUixc7XSSyDuh4AVMQjKTtj5F/7ls3ouEfwllfXgwMuFeYNJmvLi7QPjvDDC0x+
         ribSJgyULaqJIflA4Ank/4lPomM2aSNDPcqYy4GPCxf16+r81MNgiIKfHemsgxY+ijXw
         K+lS9UNGuILkmfaFEpK/fqun/8d1mf2farmzV82V+mUgFKGye/b0bdrCtUHLSiGP2iUp
         h4ErThpsGHWqisIFG7wsKClPdg5G32CTfCZKiH5yyImbCGn4bxx6G3QimrW8FsLejoMx
         CD8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si3726823vkh.37.2021.08.24.05.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Aug 2021 05:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:39002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIVQI-0007Wp-GR
	for alex.bennee@linaro.org; Tue, 24 Aug 2021 08:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mIVPu-0007Qr-2d; Tue, 24 Aug 2021 08:20:35 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mIVPq-0003Zk-Uu; Tue, 24 Aug 2021 08:20:33 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Gv7V26flKz89gn;
 Tue, 24 Aug 2021 20:20:10 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 20:20:24 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 20:20:24 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>
Subject: [PATCH v6 4/5] hw/acpi/aml-build: Add Processor hierarchy node
 structure
Date: Tue, 24 Aug 2021 20:20:15 +0800
Message-ID: <20210824122016.144364-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210824122016.144364-1-wangyanan55@huawei.com>
References: <20210824122016.144364-1-wangyanan55@huawei.com>
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
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 wanghaibin.wang@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6BmuYfy0q8ap

Add a generic API to build Processor hierarchy node structure (Type 0),
which is strictly consistent with descriptions in ACPI 6.2: 5.2.29.1.

This function will be used to build ACPI PPTT table for cpu topology.

Co-developed-by: Ying Fang <fangying1@huawei.com>
Co-developed-by: Henglong Fan <fanhenglong@huawei.com>
Co-developed-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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
2.19.1

