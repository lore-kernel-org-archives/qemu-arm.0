Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4646521lfr;
        Tue, 13 Apr 2021 01:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVflM0KOsRhvVcIhJsEw8S+5gjyBlSd0hiJzaS/dP5QTGoZ1QgVeNURLFG7Tp+fYZ44het
X-Received: by 2002:ab0:596f:: with SMTP id o44mr22212257uad.8.1618301409077;
        Tue, 13 Apr 2021 01:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618301409; cv=none;
        d=google.com; s=arc-20160816;
        b=FCgK9u/3VVVEkrTifPReupbKxOZ7x4vAr7nP5s4a1yubOXLK02z3YRiULZh2CHIdkF
         tcg6mgOTsgQS7qRjXv9BgbZPc3zo5g/PW6yRlO81wlR+ay/ltVSncDxstYcn91Xz3Gdr
         fpKhG5sgakdb2i8aWhgz5Szrx6oX+fgVk2Zwv/26kSwDN+U5qoh2jrRmeeRFfAm2L9Am
         og4mNg0aV3kKZCq8mYmLrxvEHZ2mgCBqzFfKs+1GKtPQWgvaXf+g520O7HxWC3DjWRP0
         XQy0csgIOu+HhmYMO9LsGNSHhPKH//oRwIE320EjbA/RUS5KRHKfxnZu/4htdyf3Pmp/
         bGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=lennog0npifSKbmkMMLct6lUHtl2GmhSkzuk2UOAo8U=;
        b=DN+VWzhSdh1RGkpb+uMGE5BPZWBn7siLSUoBD4lTWngyaKUn4TuUZKDe/ovo/fbHFb
         jAVsjHmUXhHoKUP875lmZIiB505DXUoCWxFApszAV72H4nTHNmx3T36eiewffhzzyjBA
         9QjyH/UzJagLxKjqaAGwbJ+LRS24rnVLXjWLFkekaX7xMdW6MJHYxe9X4veg/3nTpoCp
         S3zE4LRj1WY7O4I28YfTq5Tyls6E+vsfCxDgzrVqtw9AVzqGdFSAc9EXNVZOUWcdH+yf
         eoxqaSOj8fFsC/bN6YnFogQ2LgR6I62dlHpJmIxb5ld8pqC4gvJLdi6gGhWvaD6v61zd
         VzYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13si4943172uad.92.2021.04.13.01.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 01:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:38462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWE7c-0006mY-CD
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 04:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWE5n-0004Cr-Uy; Tue, 13 Apr 2021 04:08:15 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:5033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWE5h-0006RR-FY; Tue, 13 Apr 2021 04:08:15 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FKJ8N2cm5zlXbH;
 Tue, 13 Apr 2021 16:06:12 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 16:07:54 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v2 4/6] hw/acpi/aml-build: Add processor hierarchy node
 structure
Date: Tue, 13 Apr 2021 16:07:43 +0800
Message-ID: <20210413080745.33004-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210413080745.33004-1-wangyanan55@huawei.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangyanan55@huawei.com; helo=szxga06-in.huawei.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Henglong Fan <fanhenglong@huawei.com>, Alistair
 Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Ying Fang <fangying1@huawei.com>,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /1ddodqWYvnn

Add a generic API to build Processor Hierarchy Node Structure(Type 0),
which is strictly consistent with descriptions in ACPI 6.3: 5.2.29.1.

This function will be used to build ACPI PPTT table for cpu topology.

Signed-off-by: Ying Fang <fangying1@huawei.com>
Signed-off-by: Henglong Fan <fanhenglong@huawei.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/acpi/aml-build.c         | 27 +++++++++++++++++++++++++++
 include/hw/acpi/aml-build.h |  4 ++++
 2 files changed, 31 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index d33ce8954a..75e01aea17 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1916,6 +1916,33 @@ void build_slit(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                  table_data->len - slit_start, 1, oem_id, oem_table_id);
 }
 
+/*
+ * ACPI 6.3: 5.2.29.1 Processor Hierarchy Node Structure (Type 0)
+ */
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
+    build_append_int_noprefix(tbl, id, 4);     /* ACPI processor ID */
+
+    /* Number of private resources */
+    build_append_int_noprefix(tbl, priv_num, 4);
+
+    /* Private resources[N] */
+    if (priv_num > 0 && priv_rsrc != NULL) {
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

