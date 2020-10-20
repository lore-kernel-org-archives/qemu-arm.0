Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp4784378lfa;
        Tue, 20 Oct 2020 06:22:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlE02B/KzR8mOUnQ+xkWdMXZA3V4U09QwPbRTNhwwW4hBqzyMXgngbUBVUsK8eRluhPk++
X-Received: by 2002:a25:810c:: with SMTP id o12mr3706788ybk.198.1603200145101;
        Tue, 20 Oct 2020 06:22:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603200145; cv=none;
        d=google.com; s=arc-20160816;
        b=K8oE5glR5unirorWWOR8691+DUTOY8r+/Zzzbk8qh2TfqK2FPTr2bnNR3xW/m4iO+j
         lDTPP5Y0RID6hcuYune71qwwguF3+fIOM3Dxbof0OPYNtQeQ1EIFYUXDhlAgiw28hDzX
         VopLyXfkOmQeShaWRTzcGWWz3+jdSvdiQB210CacEgvYohGjboUa3Mb8/aCymudBFwpZ
         ljGkTHqNyDoK0jHhcSxOKutsAX9Er77BOWfH+zUfRJIxjxtOf09xOQgT01kVC6dqJwf0
         i+XYiSc8bpvaJ37bW+3jX2M/xq0DxSBJ6DvpmZosz9vUeVOX6VcIK1ODJE1WoYPhTUYs
         kuMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=KeFVQdA0cOXTH8ngiSdP9UY4T+GGsZcUNuejuSHG/Pk=;
        b=E0s1ddkwTbzaNdvXD49Iw2ARHVWtHSOQ0PpPi/MSrj5qjQQSbjMv+18sHxMvyQyobF
         fAQnsdbDFrZrOH6w8nmceqkeMmy4H0lLaUfe5wf4A2DLnkfcqpTx/oKz52UgNV0XNpPZ
         01GH0zMH7PDgnqLmoCApJdqprN+me3ge2FCgbz5bqI0T460uZkOTwX+qCLJW1JvQdggY
         lvx/5hXvcWWAe1psUQDYvGOsZz5HbAVtt5QivKUULhv0hxdXJqR2yO/S4oYsw4FScZNC
         zzvLrIeUj+NBhgIfI+D4f+OjNjFMaUbA1RS6ac6nhYIV9v1wz/pASdUWPgaw+nK7yTHJ
         tZwA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d31si1854586ybi.184.2020.10.20.06.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Oct 2020 06:22:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUraq-000138-95
	for alex.bennee@linaro.org; Tue, 20 Oct 2020 09:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU9-0000OH-QY; Tue, 20 Oct 2020 09:15:29 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:42650 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kUrU0-000779-NB; Tue, 20 Oct 2020 09:15:29 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 536F2BE80799AE2F9550;
 Tue, 20 Oct 2020 21:15:12 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Tue, 20 Oct 2020
 21:15:03 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH v2 08/13] hw/acpi/aml-build: add processor hierarchy node
 structure
Date: Tue, 20 Oct 2020 21:14:35 +0800
Message-ID: <20201020131440.1090-9-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201020131440.1090-1-fangying1@huawei.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 09:15:06
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
X-TUID: VZ11GZ8VPZQe

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
index 3792ba96ce..da3b41b514 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1770,6 +1770,43 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms)
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
index fe0055fffb..56474835a7 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -437,6 +437,13 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
 
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

