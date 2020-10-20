Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4783825lfa;
        Tue, 20 Oct 2020 06:21:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRsEmJFNzy+rkFfQaj4LRkGQZmcw24jwv6zc60LA1zsST8Qz79b6zAWXMQ2q73eOj/qo2z
X-Received: by 2002:a25:1d07:: with SMTP id d7mr4145954ybd.404.1603200101683;
        Tue, 20 Oct 2020 06:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603200101; cv=none;
        d=google.com; s=arc-20160816;
        b=r4tZQngI1yN1rexhiO2lfBGKghXd9P+IC+GcNPdKEChd9YSpBY+ybBRQYJ85PSggZl
         /MQGlkCULg/QtcctIUCcH2+0xVCHslGCBnwLgtFw76UN2q/4EclBHxrwAYVRGxVeioT8
         Q7TGFuyMq/zu5cB49vs4mIQAF7wSl/+FU87rwe7ylH8sfJNQknG68ViIAxnH8f9F6VZm
         ZcoMw6b0ndt1C0fBIQPbGg1bmOuMIx8KK1O13XWghhunaF7vOhJ45duUNq/pwJuOPott
         aWXmHoGpXElyJycb5HTA9qk8F0ZK8+Rv45RxRLGDG3zz3MH/XeG/t6EDUGbPx0U9Wncx
         e7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=3z3ntp11vcXJbY8o5S80L2ZJRUVlTYMhJZ+7AuCfeGc=;
        b=KtY7wsiGPEdVJPAYsTFichcRqmXzZmAPSnWvMuwsovyVl5dsqMwGWsYOX6rBRH1muw
         lvjZGhUJGPLA8eM+GabiYdeZ982BgWeizvQ1OVkTvHg/XPjCvleIWFIWk7AxlkjxgR99
         Dr7f0fODLH9MXOqMWDygi7RpJ3zDdOxZYkkH898iUwVoHXxWl3cNgte2SUO5wexBDatl
         kUiH6c6pXXoHRpHEHMAYasY2nw0yDr0bM5FD3YI0Xo5FNXXM6FaFdyUVdFIho9w2Cu+W
         9RG9YDW9OL/+6XUWg5ZKS8A///wPCn1ehtOddbHANPgDsCc01R/QPk7zyA9rY8aCKaKW
         EshA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f12si1744566ybm.256.2020.10.20.06.21.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 06:21:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUra9-00089Z-1P
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 09:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU7-0000JO-JK; Tue, 20 Oct 2020 09:15:27 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5270 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU0-00077V-Mi; Tue, 20 Oct 2020 09:15:27 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6172187ABAA52492808B;
 Tue, 20 Oct 2020 21:15:13 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 21:15:05 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 12/13] hw/acpi/aml-build: build ACPI CPU cache
 hierarchy information
Date: Tue, 20 Oct 2020 21:14:39 +0800
Message-ID: <20201020131440.1090-13-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201020131440.1090-1-fangying1@huawei.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 09:15:07
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0bLvWC4Qu575

To build cache information, An AcpiCacheInfo structure is defined to
hold the Type 1 cache structure according to ACPI spec v6.3 5.2.29.2.
A helper function build_cache_hierarchy is introduced to encode the
cache information.

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 hw/acpi/aml-build.c         | 26 ++++++++++++++++++++++++++
 include/hw/acpi/acpi-defs.h |  8 ++++++++
 include/hw/acpi/aml-build.h |  3 +++
 3 files changed, 37 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index da3b41b514..6f0e8df49b 100644
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

