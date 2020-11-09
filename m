Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3262575lfb;
        Sun, 8 Nov 2020 19:07:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrWeLnmcM62e46Af4tHdfA/2aS4Eibjv5rJyDsn/pj5y24XthR1/0fd75KsQ2z0TdNZVXG
X-Received: by 2002:ad4:4514:: with SMTP id k20mr12343250qvu.18.1604891275247;
        Sun, 08 Nov 2020 19:07:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604891275; cv=none;
        d=google.com; s=arc-20160816;
        b=s2YZHcIGXYpcslWp9QBckYfcuypf1fEteNN9vTTLTDDHnQkhslmJhcI+mhLXzl5s9U
         FmmxziIQ85MbF/hN2AVbGIvp+5y0wIrofRCcNnkZy1Jx3X7XiKt7Pj6V/F/3JRVNvYLy
         KW6OKarAKHoSqRgB78QKv63f+28O9KaSm+gEgDLg08mIeScJSQTSIh4PxpGqgyW+GMcg
         cZAk2IFO7+np72gfdpVbVL9QhS8TEERjrUCfskFyGxYUmphqH9rhwtTDfE1YHr5cVDts
         6cfnT0nGBzqVmnqSGIGZFF069MKoTfEc+W6Q6ZAQyKypK0HaPzjzCH2+WuUpt1VeeFLd
         W1QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=oQzltiYRcBjgXI88F/2+TbM5dS+3gY4lEYmhFK1zft8=;
        b=bIlJyhKxXFNL9uMOCUAotiy90dn7XXCwRMPUUtXL5R06+T8bHwx+Nu/hZCfVihluoU
         zV4k4OK37FGzXMBQhjQkov91rjwyfYEpfhS6zSwU7DxeRRV0lHNj3oKojQg2lFey9naJ
         3rWD7V4GFqPW7itq0hU2UeOvTtTvgBzh4w5wD1undo51JiFGdjwxdOWKRN1syCR4RMu+
         mlF+eoMdlvlA+j6jI30dg8PaA/trwyLeaTt5TY0d5WytB0im2SIyUBDn1Hy5dynQYsu7
         DrdwoLC4Jm2dCz/bYV+QtrOCUFuCdOPK9xeXY2c2+TArDBWI1jIyOSSVJ5+liNtb2emd
         SQag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16si4260862qkg.242.2020.11.08.19.07.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Nov 2020 19:07:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kbxX8-0005Br-Lz
	for alex.bennee@linaro.org; Sun, 08 Nov 2020 22:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUt-0001bl-53; Sun, 08 Nov 2020 22:05:35 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kbxUn-0006fu-HB; Sun, 08 Nov 2020 22:05:34 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CTwpk1YCczhj8m;
 Mon,  9 Nov 2020 11:05:18 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 11:05:14 +0800
From: Ying Fang <fangying1@huawei.com>
To: <peter.maydell@linaro.org>
Subject: [RFC PATCH v3 08/13] hw/acpi/aml-build: add processor hierarchy node
 structure
Date: Mon, 9 Nov 2020 11:04:47 +0800
Message-ID: <20201109030452.2197-9-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201109030452.2197-1-fangying1@huawei.com>
References: <20201109030452.2197-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=szxga06-in.huawei.com
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
Cc: Henglong Fan <fanhenglong@huawei.com>, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com, salil.mehta@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T0mq/qGh43s6

Add the processor hierarchy node structures to build ACPI information
for cpu topology. Three helpers are introduced:

(1) build_socket_hierarchy for socket description structure
(2) build_processor_hierarchy for processor description structure
(3) build_smt_hierarchy for thread (logic processor) description structure

We split the processor hierarchy node structure descriptions into
three helpers even if there are some identical code snippets between
them. The reason is that the private resources are variable among
different topology level. This will make the ACPI PPTT table much
more readable and easy to construct.

Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Ying Fang <fangying1@huawei.com>
Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
---
 hw/acpi/aml-build.c         | 37 +++++++++++++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h |  7 +++++++
 2 files changed, 44 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 3792ba96ce..d1aa9fd716 100644
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
+    build_append_byte(tbl, 20);           /* Length, no private resources */
+    build_append_int_noprefix(tbl, 0, 2); /* Reserved */
+    build_append_int_noprefix(tbl, 0x0e, 4);    /* Processor is a thread */
+    build_append_int_noprefix(tbl, parent , 4); /* Parent */
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

