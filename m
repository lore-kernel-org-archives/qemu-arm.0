Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp175306lfg;
        Thu, 25 Feb 2021 00:59:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9y8eH1DTUYOmzhMsyxjWzhjCGF0wZCiguiPUQ8JOaKq/G39Te+vlDjyVDFrvMRHQcDcB4
X-Received: by 2002:a5d:9913:: with SMTP id x19mr1820901iol.201.1614243582487;
        Thu, 25 Feb 2021 00:59:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614243582; cv=none;
        d=google.com; s=arc-20160816;
        b=U/LLBh5bMXww/AU5WHcvKNwBHBryqUNgZEROW9H0dL8xk/ECypkm3Y2c2EqCjKLENL
         7J/zPkFY9YTK5/3VeR8YRtrR1MYV0fxRam3BAV0RNz228KkwxelHx+mAaUq3YARVhF1J
         yGmDYkg9nsASALMH6rh1HcKmDDrlx1dJzWwFn/jc9AjoxV/orxUY2dlT8FxBE1MVNfHz
         EJBGcr6DmZVuBnAedAq5P4VZruvoF6N+i8vQ4U1lNGy6AtVNjVsPbYetl80hly17LtVE
         PkL7XJrYnD9zeF0AwsIJQ6mlMffRqaxw7tk1XDZLejViO/Ho2pEArbUqs8XPB/0DMj95
         1zwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=4scetzRMAn9zRFTnNJo8tPfdU6MHW2bjvXZjf/RmR58=;
        b=LqhjlKf9zLbj1JAmdLYMpSvF0pptaNQaOTbYcq5IDQ5VNr0lZR0S3psvf429ChI/fI
         j4uqIOcwP1gIv+wWJGFTzra7g+Pcaq6gciCtrYEIoI+aH1kSAdtLNQaR7Fp2OjZCcVCL
         8Yp7Vk+/AoOGl2AE50WFMw0Qy+OvnFMlVd96+kD4T1uRQkkgByCE9DubZHgacb11bh8G
         YDfMdvKoKrP+SliEY0GSlj8lgZr8jMFuB00fpJFG8MFPHKZG+dX9qsVxVNqCaPyYizeC
         zDzz/xgM8eNnTvbKH9Ru2HgafnNdvirphAwQB5k+DQ3vmmfrF/gK58ItQblZrdElEJX0
         Rw/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 11si4413312ilx.115.2021.02.25.00.59.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Feb 2021 00:59:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFCUn-0001MV-Nx
	for alex.bennee@linaro.org; Thu, 25 Feb 2021 03:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSG-0007Zz-Sl; Thu, 25 Feb 2021 03:57:04 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1lFCSC-0003u0-Ek; Thu, 25 Feb 2021 03:57:04 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DmRSf4wwLz16CNl;
 Thu, 25 Feb 2021 16:55:14 +0800 (CST)
Received: from localhost (10.174.186.67) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Feb 2021
 16:56:44 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 4/5] hw/acpi/aml-build: add processor hierarchy node
 structure
Date: Thu, 25 Feb 2021 16:56:26 +0800
Message-ID: <20210225085627.2263-5-fangying1@huawei.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20210225085627.2263-1-fangying1@huawei.com>
References: <20210225085627.2263-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=fangying1@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 zhang.zhanghailiang@huawei.com, mst@redhat.com, salil.mehta@huawei.com,
 Henglong Fan <fanhenglong@huawei.com>, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fWW4w5cx81me

Add the processor hierarchy node structures to build ACPI information
for CPU topology. Since the private resources may be used to describe
cache hierarchy and it is variable among different topology level,
three helpers are introduced to describe the hierarchy.

(1) build_socket_hierarchy for socket description
(2) build_processor_hierarchy for processor description
(3) build_smt_hierarchy for thread (logic processor) description

Signed-off-by: Ying Fang <fangying1@huawei.com>
Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
---
 hw/acpi/aml-build.c         | 40 +++++++++++++++++++++++++++++++++++++
 include/hw/acpi/acpi-defs.h | 13 ++++++++++++
 include/hw/acpi/aml-build.h |  7 +++++++
 3 files changed, 60 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index a2cd7a5830..a0af3e9d73 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1888,6 +1888,46 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                  table_data->len - slit_start, 1, oem_id, oem_table_id);
 }
 
+/*
+ * ACPI 6.3: 5.2.29.1 Processor hierarchy node structure (Type 0)
+ */
+void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
+{
+    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR); /* Type 0 - processor */
+    build_append_byte(tbl, 20);         /* Length, no private resources */
+    build_append_int_noprefix(tbl, 0, 2);  /* Reserved */
+    build_append_int_noprefix(tbl, ACPI_PPTT_PHYSICAL_PACKAGE, 4);
+    build_append_int_noprefix(tbl, parent, 4); /* Parent */
+    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
+    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
+}
+
+void build_processor_hierarchy(GArray *tbl, uint32_t flags,
+                               uint32_t parent, uint32_t id)
+{
+    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR);  /* Type 0 - processor */
+    build_append_byte(tbl, 20);         /* Length, no private resources */
+    build_append_int_noprefix(tbl, 0, 2);      /* Reserved */
+    build_append_int_noprefix(tbl, flags, 4);  /* Flags */
+    build_append_int_noprefix(tbl, parent, 4); /* Parent */
+    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
+    build_append_int_noprefix(tbl, 0, 4);  /* Number of private resources */
+}
+
+void build_thread_hierarchy(GArray *tbl, uint32_t parent, uint32_t id)
+{
+    build_append_byte(tbl, ACPI_PPTT_TYPE_PROCESSOR); /* Type 0 - processor */
+    build_append_byte(tbl, 20);           /* Length, no private resources */
+    build_append_int_noprefix(tbl, 0, 2); /* Reserved */
+    build_append_int_noprefix(tbl,
+                              ACPI_PPTT_ACPI_PROCESSOR_ID_VALID |
+                              ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD |
+                              ACPI_PPTT_ACPI_LEAF_NODE, 4);  /* Flags */
+    build_append_int_noprefix(tbl, parent , 4); /* parent */
+    build_append_int_noprefix(tbl, id, 4);      /* ACPI processor ID */
+    build_append_int_noprefix(tbl, 0, 4);       /* Num of private resources */
+}
+
 /* build rev1/rev3/rev5.1 FADT */
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id)
diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index cf9f44299c..45e10d886f 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -618,4 +618,17 @@ struct AcpiIortRC {
 } QEMU_PACKED;
 typedef struct AcpiIortRC AcpiIortRC;
 
+enum {
+    ACPI_PPTT_TYPE_PROCESSOR = 0,
+    ACPI_PPTT_TYPE_CACHE,
+    ACPI_PPTT_TYPE_ID,
+    ACPI_PPTT_TYPE_RESERVED
+};
+
+#define ACPI_PPTT_PHYSICAL_PACKAGE          (1)
+#define ACPI_PPTT_ACPI_PROCESSOR_ID_VALID   (1 << 1)
+#define ACPI_PPTT_ACPI_PROCESSOR_IS_THREAD  (1 << 2)      /* ACPI 6.3 */
+#define ACPI_PPTT_ACPI_LEAF_NODE            (1 << 3)      /* ACPI 6.3 */
+#define ACPI_PPTT_ACPI_IDENTICAL            (1 << 4)      /* ACPI 6.3 */
+
 #endif
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 380d3e3924..7f0ca1a198 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -462,6 +462,13 @@ void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
 void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id);
 
+void build_socket_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
+
+void build_processor_hierarchy(GArray *tbl, uint32_t flags,
+                               uint32_t parent, uint32_t id);
+
+void build_thread_hierarchy(GArray *tbl, uint32_t parent, uint32_t id);
+
 void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
                 const char *oem_id, const char *oem_table_id);
 
-- 
2.23.0

