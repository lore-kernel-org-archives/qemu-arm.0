Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3261451lfb;
        Sun, 8 Nov 2020 19:05:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykjIW9hofDU8QH+SsdPmkC+nEMxioWbmPyaTR5DEedN5KjtWwm+l3/D7R18fcxT+HboLs+
X-Received: by 2002:a25:b705:: with SMTP id t5mr16695304ybj.381.1604891154416;
        Sun, 08 Nov 2020 19:05:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604891154; cv=none;
        d=google.com; s=arc-20160816;
        b=VnW/q40CyTjzsxYRP05bvGMnEF2T5dYAG3kgPuMM/boAl8pzP1C0QC0l/ToERS9ahb
         ifVdLZ5lqfx26y44ELqL6sQMlgKUm6b5HiDWHGUZmFUw4NjQTFbbFNvVPJW4j0ysF+8D
         930+QnsMrydechhudbxbVlbJBiTea+lXfyuW8VzaouEScKb9noTyUIup14KtNsdoZw6b
         lqW7F2C1IIxNi5duJuXDQ/K8nWApO/5ARINbcOoundmAScaMoI3jwvEmq6po47stgPRO
         CUraq4CLZdosv1HxdgG5LRidzfYbJKijL1an4/w9bQpfIigXeg0KUcttjXDlzok7txWm
         1xhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=U9wBwhS+6kFZP8XgrwLAltJiCKw2UfFF8yxvdzBYmEU=;
        b=Lg1/aYhoioMKy5t8lQ6iJKBMV3pItbr8fPhMNJmXvPqypyldvUsHfZWEKRral3jUU6
         D+VeieDVB0MrbBMEFi4p2gDTBC9C7Wy8afpDlQz+wb0ap1RzY7CXqZpoxWUxDrrYFs8u
         t3ObIjce6xX1+GgUoR5Fxv4KApSvHsXL4KnSOGnLE5YPadKvBm6T5QeAEPomNFKP6tOR
         NotJB6EStv/RVQxkes8QJP9YEJmeNHXsk1Gq9UYKaF1Ga1nqQhiAMfhoiKM/0Mfm8tgi
         NlcoacQt7K4ahw4MTO2wHYacW9w8bXnyjrP7LXWQoW3Txz8mKvxN7ENIx4GJa7bBxns/
         dSOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e131si10064621ybf.129.2020.11.08.19.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 19:05:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbxVB-0001bU-QT
	for alex.bennee@linaro.org; Sun, 08 Nov 2020 22:05:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUr-0001aQ-BY; Sun, 08 Nov 2020 22:05:33 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUn-0006jI-Fq; Sun, 08 Nov 2020 22:05:33 -0500
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CTwpm0CzHz15SjP;
 Mon,  9 Nov 2020 11:05:20 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 11:05:17 +0800
From: Ying Fang <fangying1@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [RFC PATCH v3 12/13] hw/acpi/aml-build: Build ACPI cpu cache
 hierarchy information
Date: Mon, 9 Nov 2020 11:04:51 +0800
Message-ID: <20201109030452.2197-13-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201109030452.2197-1-fangying1@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 22:05:17
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: drjones@redhat.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com, salil.mehta@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OliUYZ7uyPvq

To build cache information, An AcpiCacheInfo structure is defined to
hold the type 1 cache structure according to ACPI spec v6.3 5.2.29.2.
A helper function build_cache_hierarchy is also introduced to encode
the cache information.

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/acpi/aml-build.c         | 26 ++++++++++++++++++++++++++
 include/hw/acpi/acpi-defs.h |  8 ++++++++
 include/hw/acpi/aml-build.h |  3 +++
 3 files changed, 37 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index d1aa9fd716..1a38110149 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1770,6 +1770,32 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms)
                  table_data->len - slit_start, 1, NULL, NULL);
 }
 
+/* ACPI 6.3: 5.29.2 Cache type structure (Type 1) */
+static void build_cache_head(GArray *tbl, uint32_t next_level)
+{
+    build_append_byte(tbl, 1);
+    build_append_byte(tbl, 24);
+    build_append_int_noprefix(tbl, 0, 2);
+    build_append_int_noprefix(tbl, 0x7f, 4);
+    build_append_int_noprefix(tbl, next_level, 4);
+}
+
+static void build_cache_tail(GArray *tbl, AcpiCacheInfo *cache_info)
+{
+    build_append_int_noprefix(tbl, cache_info->size, 4);
+    build_append_int_noprefix(tbl, cache_info->sets, 4);
+    build_append_byte(tbl, cache_info->associativity);
+    build_append_byte(tbl, cache_info->attributes);
+    build_append_int_noprefix(tbl, cache_info->line_size, 2);
+}
+
+void build_cache_hierarchy(GArray *tbl,
+              uint32_t next_level, AcpiCacheInfo *cache_info)
+{
+    build_cache_head(tbl, next_level);
+    build_cache_tail(tbl, cache_info);
+}
+
 /*
  * ACPI 6.3: 5.2.29.1 Processor hierarchy node structure (Type 0)
  */
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index 38a42f409a..3df38ab449 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -618,4 +618,12 @@ struct AcpiIortRC {
 } QEMU_PACKED;
 typedef struct AcpiIortRC AcpiIortRC;
 
+typedef struct AcpiCacheInfo {
+    uint32_t size;
+    uint32_t sets;
+    uint8_t  associativity;
+    uint8_t  attributes;
+    uint16_t line_size;
+} AcpiCacheInfo;
+
 #endif
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 56474835a7..01078753a8 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -437,6 +437,9 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
 
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms);
 
+void build_cache_hierarchy(GArray *tbl,
+              uint32_t next_level, AcpiCacheInfo *cache_info);
+
 void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
 
 void build_processor_hierarchy(GArray *tbl, uint32_t flags,
-- 
2.23.0

