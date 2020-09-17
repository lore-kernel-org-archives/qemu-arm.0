Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp210670lfq;
        Wed, 16 Sep 2020 20:24:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwN7/FHorWmt3v1fo8aCmIlt+y4UJpml24MOBzPYTbpMEiYLVM1Spmy4/Gur0WyjddX18Jn
X-Received: by 2002:a25:aba1:: with SMTP id v30mr21737056ybi.518.1600313073451;
        Wed, 16 Sep 2020 20:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600313073; cv=none;
        d=google.com; s=arc-20160816;
        b=F69rve1V920QPhTl/nIOE0Ngu4QFOIzr8kb/waD2ezobktODjExCRthvOPtFDMAxbe
         E2yF8P/pdmig4FqZHNBApIxqArKClM+K/s3s4sxVtKny4zw1b85vjGPCXHr1TjAMuFQL
         bby+Kw7QGSDHATwiSQeyNrR74coU54mweS4b0xoruVJ7Ga3tetdz4TNcJUphxoT80DJz
         AKXDHOk1wUfQeeDMvBfWRNxI0t5E+xiim1/Bdh0hFTLHFGQd1t6wbOe2earQFaYOXjGZ
         C0r2ffVFiawH0igGC/LT6whOMC2lTVTZNp1RgWD6V7WnRSBV/b/42lmQC7bHXVRp1VEC
         rpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=XVjq0lZMOnrZSaMbzkc6eVIhD1URPWVcWVf5k8Cdoqw=;
        b=kqSbw3VU297EluhFt3wrqbY8V5vb7xfKgrxBfeCBYhVCdewlJFlHy9Rj3CtR/LyJJg
         6lcXtig4g+vpmwcqVdjmBmxgHcymT41PbZgzAHY6GvsrZCz6vBN7lJeB6hqLQAgCBKL+
         H56zcAYL91B5E3J+p5ei5BkNaMtV8F0Ggtr3HB7z79bWygY4TA6cRD5lZCCDHd1is2S+
         07AGwHAU6HfJCM/uJv6CP5sVSqkB0B3BmMZO+Kf+7VRJXEsM4lZzYAHL2JcHNUh/pgrA
         HY9cOpQmUA3FDFtLYZDF7/YRTRUoHrL92us8ugEDY/fggwEuQuqzMVU3IdfHfTFFd+fI
         s+Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p82si12777507ybb.267.2020.09.16.20.24.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 20:24:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIkXA-0000m0-Oq
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 23:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUR-00054X-Ba; Wed, 16 Sep 2020 23:21:43 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:53794 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUM-0004RH-PU; Wed, 16 Sep 2020 23:21:42 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6DF405B978E71AA35A9D;
 Thu, 17 Sep 2020 11:21:07 +0800 (CST)
Received: from localhost (10.174.185.104) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 11:21:01 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 07/12] hw/acpi/aml-build: add processor hierarchy node
 structure
Date: Thu, 17 Sep 2020 11:20:28 +0800
Message-ID: <20200917032033.2020-8-fangying1@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20200917032033.2020-1-fangying1@huawei.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 23:20:58
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
 zhang.zhanghailiang@huawei.com, Henglong Fan <fanhenglong@huawei.com>,
 alex.chen@huawei.com, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 alistair.francis@wdc.com, Ying Fang <fangying1@huawei.com>,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PsoQEfLzd8Ny

Add the processor hierarchy node structures to build ACPI information
for CPU topology. Three helpers are introduced:

(1) build_socket_hierarchy for socket description structure
(2) build_processor_hierarchy for processor description structure
(3) build_smt_hierarchy for thread (logic processor) description structure

Signed-off-by: Ying Fang <fangying1@huawei.com>
Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
---
 hw/acpi/aml-build.c         | 37 +++++++++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h |  7 +++++++
 2 files changed, 44 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index f6fbc9b95d..13eb6e1345 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1754,6 +1754,43 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms)
                  table_data->len - slit_start, 1, NULL, NULL);
 }
 
+/*
+ * ACPI 6.3: 5.2.29.1 Processor hierarchy node structure (Type 0)
+ */
+void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
+{
+    build_append_byte(tbl, 0);          /* Type 0 - processor */
+    build_append_byte(tbl, 20);         /* Length, no private resources */
+    build_append_int_noprefix(tbl, 0, 2);  /* Reserved */
+    build_append_int_noprefix(tbl, 1, 4);  /* Flags: Physical package */
+    build_append_int_noprefix(tbl, parent, 4);  /* Parent */
+    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
+    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
+}
+
+void build_processor_hierarchy(GArray *tbl, uint32_t flags,
+                               uint32_t parent, uint32_t id)
+{
+    build_append_byte(tbl, 0);          /* Type 0 - processor */
+    build_append_byte(tbl, 20);         /* Length, no private resources */
+    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
+    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
+    build_append_int_noprefix(tbl, parent, 4); /* Parent */
+    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
+    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
+}
+
+void build_smt_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
+{
+    build_append_byte(tbl, 0);            /* Type 0 - processor */
+    build_append_byte(tbl, 20);           /* Length, add private resources */
+    build_append_int_noprefix(tbl, 0, 2); /* Reserved */
+    build_append_int_noprefix(tbl, 0x0e, 4);    /* Processor is a thread */
+    build_append_int_noprefix(tbl, parent , 4); /* parent */
+    build_append_int_noprefix(tbl, id, 4);      /* ACPI processor ID */
+    build_append_int_noprefix(tbl, 0, 4);       /* Num of private resources */
+}
+
 /* build rev1/rev3/rev5.1 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index d27da03d64..ff4c6a38f3 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -435,6 +435,13 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
 
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms);
 
+void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
+
+void build_processor_hierarchy(GArray *tbl, uint32_t flags,
+                               uint32_t parent, uint32_t id);
+
+void build_smt_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
+
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id);
 
-- 
2.23.0

