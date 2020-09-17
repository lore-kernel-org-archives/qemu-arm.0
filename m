Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp213247lfq;
        Wed, 16 Sep 2020 20:30:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySpDr5SYKl9Hm1Y4/LGUIBCfB4Nwpd0WoAhmI8juWBFvAEp28Ktgp4F8LnCLq61XLx31zl
X-Received: by 2002:a25:ea4f:: with SMTP id o15mr36977528ybe.231.1600313413793;
        Wed, 16 Sep 2020 20:30:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600313413; cv=none;
        d=google.com; s=arc-20160816;
        b=oKNrdNE9Crjek+dYxZhpXpxJnynu5NRPLc7mHq9hGws8+KTIJcSEqUPXseNHIXIgSw
         QVjP+CLTyd6S+tr17ieqy2BLwVnVmILbsTwuWibfTtzSwnyFGtvnMfs9H6feYZ471PU7
         GArR4lbRPkFvKmnWYiXSYusGZHd9FsSvkwjAnR7F/TND2KDlhlohyXfDePYSGvm1PZNr
         xVzvGslPlAD2ji6mxgyKnW/Wl5WWZO/oFJPFcb3c54MToJCq7hIwb/YJIkmGgcRc31Mi
         JfGWnrdiQ18AKj5knTsYh714Y82x7mWLjvX1BUcXtJiyi6b0Zc6z6GLIirP7N3sr+GDa
         wRzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=16EmQw68i3zsaPr8QeDXWQYgZO/KWvQSjF2Rsic8Lyw=;
        b=IB5wWLNWtUYGwXGIyDv/ufZaGgyHCgO7RqzlqsnzUTNgjI7NpFmIZlFfgPUTlq+UuC
         WxxFO63/6abX9+3c842CfUCr0nOBdQq+G60ISkUojmA9ovjy5TnwMg4I+w/itWnI12Gb
         nbB47JcEH3+vGRG8FvWL0nOR7gAkFQ+CVeVF77V+yY8lTYVneE5yBlOqkMrS3ONLlbEg
         ZBA6ZS1X2pd42YXZky6r630Qriu5uyzytc57xPOJ0r2VVgn3YvQolzpjelwyQ96h4cBi
         k4Q9uBXVx/S4QvhPjW9YhtrqOzuN/ozUwWXMZSpPMTJUzfURD0Fb5nEvAMkZpqUSG5pg
         3vcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v198si19301505ybe.341.2020.09.16.20.30.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 20:30:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIkcf-0000JO-3k
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 23:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUV-0005G0-HZ; Wed, 16 Sep 2020 23:21:47 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4702 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUM-0004RX-Ol; Wed, 16 Sep 2020 23:21:47 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9A6A556C8413BBCE50E3;
 Thu, 17 Sep 2020 11:21:15 +0800 (CST)
Received: from localhost (10.174.185.104) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 11:21:06 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 11/12] hw/acpi/aml-build: build ACPI CPU cache topology
 information
Date: Thu, 17 Sep 2020 11:20:32 +0800
Message-ID: <20200917032033.2020-12-fangying1@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20200917032033.2020-1-fangying1@huawei.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 23:20:53
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: palK7maPtqew

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
index 13eb6e1345..123eb032cd 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1754,6 +1754,32 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms)
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
index ff4c6a38f3..ced1ae6a83 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -435,6 +435,9 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
 
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms);
 
+void build_cache_hierarchy(GArray *tbl,
+              uint32_t next_level, AcpiCacheInfo *cache_info);
+
 void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
 
 void build_processor_hierarchy(GArray *tbl, uint32_t flags,
-- 
2.23.0

