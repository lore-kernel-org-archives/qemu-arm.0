Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp328432njc;
        Fri, 21 Feb 2025 06:37:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXpodbeBE3ahlpINJ4RDNpv7zorHY0PHiLvlyT5s7IMWQ1EvBggHOhGFYlrFWuzEDdlxSkSV6AM3DhUgw==@linaro.org
X-Google-Smtp-Source: AGHT+IEpKRmoP0qLZ0VHeUBarQ6NuiyzvmpanrlKhw+p1+iTUEkzH3eFuqmPJTS55Hb/xR8Swy2I
X-Received: by 2002:a05:620a:4108:b0:7c0:a531:fe30 with SMTP id af79cd13be357-7c0cef48582mr518828985a.35.1740148642246;
        Fri, 21 Feb 2025 06:37:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740148642; cv=none;
        d=google.com; s=arc-20240605;
        b=XCsYGZS0Cekq4mcl/qwsyBze6ILEZH6UuO7cE19ugjYFE5prvM3pULSqT3UycOgkUm
         EQOQ8PWBO3O05jjwBdNgLYU0dK64ryxS5hiHZWy/Oq4kA3LvSblQrCWibuIyruEzsEoz
         e1n9s8cy/TFGUdPDK3MLyNCIRp7ZT0U1CfTSVNuM+Xqgh+Q9quFK5E7BtQcUCUeS0wV+
         ym1SoR1MM3ZGBx1OIR+JnHU9XsV0P7CaAnvz5tYrFhlZ6ubA6ON+8zO+C9x59c+uob+b
         cWssRXqsNBZDWiCnxvVnvGTsiid+1dt4L5+nP9J2iivpFJ5ASn9596zJEqJyp3BPflmX
         sUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yY/RVgCO8C2gT3Dt477t4CCkzDpFHpFh36UPK4gqD2Q=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=Sn1Mesy0gsm01qJSW8LjJSgBAIwbWmhOFJGXC0dq48pH/0p+VjzpBw83Pcao8m30OU
         5ZF4fRfSx3LMqi34ry7aPm16N6T7njbISiEPGpwc6XB16K6EfMsbUfAAecnN7cW1eks3
         kPuwaKmrnuseHsueUMFpgYeDPXPzYgwhjUWjCNs8wlTik01j59vGAnzX6BAmTlgGaGw+
         zhyT/WB22SPbrLquX6Njw9fovXqSWblWJrJ7YL9fQ2J8S5L5cV6ZZJkBviLMy+8JLas8
         7zRnusEQrnEuGPlkt052rTTcE6p42yKfIK1kSm3R1YAKXsXtWhqYPLgig+KQ3EaHYU18
         rgcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=HrI9m+TE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c0b7929c43si481114885a.240.2025.02.21.06.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2025 06:37:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=HrI9m+TE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tlU8G-0000H9-6G; Fri, 21 Feb 2025 09:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tlU84-00009B-EW; Fri, 21 Feb 2025 09:35:48 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tlU82-0003fu-8K; Fri, 21 Feb 2025 09:35:47 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5F3DC5C656A;
 Fri, 21 Feb 2025 14:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A21E9C4CEED;
 Fri, 21 Feb 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740148535;
 bh=f3jsJF20lQ2fLkUgkIm1tbMfMYZ0iu0p9OeKwi8Wtyg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HrI9m+TEfowBNw0dp5QT4rRRbxPi/Byv9idDnXLSdLUGyKRJVIJbz2+rPm0hMpHBX
 3mDeIueWba/n4P9D1VG2Z5M73u2Pex0ATiFFcdEUpykmLCjK0EqUFk3bdYB9D6EbBE
 7yES/GEN3fb+PnPQ8tPN9l16R2jp+sRJGZo0iaQ8CQeSfzwP8A4C2MyLEGqwB+V8qB
 LLwwJMrMv60r6O2apLY0kpw6pV/6hc9v2itdbDO2TYjIvw4upy3Mh/q/7cfkRrB4gs
 gY8sVCB1fcafz7QG1Qnngz2vnuJIqS3L+fACS6dMjunJLQe0FvyFmxdFqoRyCMUzYc
 onYSpHFQVBy8w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tlU7m-00000002jDj-2gTs; Fri, 21 Feb 2025 15:35:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/14] acpi/ghes: Use HEST table offsets when preparing
 GHES records
Date: Fri, 21 Feb 2025 15:35:12 +0100
Message-ID: <0134424ddba15dea8daaf32b09e89f1bf7e81552.1740148260.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740148260.git.mchehab+huawei@kernel.org>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.424,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Wr2M9oHfUGXU

There are two pointers that are needed during error injection:

1. The start address of the CPER block to be stored;
2. The address of the ack.

It is preferable to calculate them from the HEST table.  This allows
checking the source ID, the size of the table and the type of the
HEST error block structures.

Yet, keep the old code, as this is needed for migration purposes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 100 +++++++++++++++++++++++++++++++++++++++++
 include/hw/acpi/ghes.h |   2 +-
 2 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index ba37be9e7022..7efea519f766 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -41,6 +41,12 @@
 /* Address offset in Generic Address Structure(GAS) */
 #define GAS_ADDR_OFFSET 4
 
+/*
+ * ACPI spec 1.0b
+ * 5.2.3 System Description Table Header
+ */
+#define ACPI_DESC_HEADER_OFFSET     36
+
 /*
  * The total size of Generic Error Data Entry
  * ACPI 6.1/6.2: 18.3.2.7.1 Generic Error Data,
@@ -61,6 +67,30 @@
  */
 #define ACPI_GHES_GESB_SIZE                 20
 
+/*
+ * See the memory layout map at docs/specs/acpi_hest_ghes.rst.
+ */
+
+/*
+ * ACPI 6.1: 18.3.2.8 Generic Hardware Error Source version 2
+ * Table 18-344 Generic Hardware Error Source version 2 (GHESv2) Structure
+ */
+#define HEST_GHES_V2_ENTRY_SIZE  92
+
+/*
+ * ACPI 6.1: 18.3.2.7: Generic Hardware Error Source
+ * Table 18-344 Generic Hardware Error Source version 2 (GHESv2) Structure
+ * Read Ack Register
+ */
+#define GHES_READ_ACK_ADDR_OFF          64
+
+/*
+ * ACPI 6.1: 18.3.2.7: Generic Hardware Error Source
+ * Table 18-341 Generic Hardware Error Source Structure
+ * Error Status Address
+ */
+#define GHES_ERR_STATUS_ADDR_OFF  20
+
 /*
  * Values for error_severity field
  */
@@ -412,6 +442,73 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
     *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
+static void get_ghes_source_offsets(uint16_t source_id,
+                                    uint64_t hest_addr,
+                                    uint64_t *cper_addr,
+                                    uint64_t *read_ack_start_addr,
+                                    Error **errp)
+{
+    uint64_t hest_err_block_addr, hest_read_ack_addr;
+    uint64_t err_source_entry, error_block_addr;
+    uint32_t num_sources, i;
+
+    hest_addr += ACPI_DESC_HEADER_OFFSET;
+
+    cpu_physical_memory_read(hest_addr, &num_sources,
+                             sizeof(num_sources));
+    num_sources = le32_to_cpu(num_sources);
+
+    err_source_entry = hest_addr + sizeof(num_sources);
+
+    /*
+     * Currently, HEST Error source navigates only for GHESv2 tables
+     */
+    for (i = 0; i < num_sources; i++) {
+        uint64_t addr = err_source_entry;
+        uint16_t type, src_id;
+
+        cpu_physical_memory_read(addr, &type, sizeof(type));
+        type = le16_to_cpu(type);
+
+        /* For now, we only know the size of GHESv2 table */
+        if (type != ACPI_GHES_SOURCE_GENERIC_ERROR_V2) {
+            error_setg(errp, "HEST: type %d not supported.", type);
+            return;
+        }
+
+        /* Compare CPER source address at the GHESv2 structure */
+        addr += sizeof(type);
+        cpu_physical_memory_read(addr, &src_id, sizeof(src_id));
+        if (le16_to_cpu(src_id) == source_id) {
+            break;
+        }
+
+        err_source_entry += HEST_GHES_V2_ENTRY_SIZE;
+    }
+    if (i == num_sources) {
+        error_setg(errp, "HEST: Source %d not found.", source_id);
+        return;
+    }
+
+    /* Navigate though table address pointers */
+    hest_err_block_addr = err_source_entry + GHES_ERR_STATUS_ADDR_OFF +
+                          GAS_ADDR_OFFSET;
+
+    cpu_physical_memory_read(hest_err_block_addr, &error_block_addr,
+                             sizeof(error_block_addr));
+    error_block_addr = le64_to_cpu(error_block_addr);
+
+    cpu_physical_memory_read(error_block_addr, cper_addr,
+                             sizeof(*cper_addr));
+    *cper_addr = le64_to_cpu(*cper_addr);
+
+    hest_read_ack_addr = err_source_entry + GHES_READ_ACK_ADDR_OFF +
+                         GAS_ADDR_OFFSET;
+    cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
+                             sizeof(*read_ack_start_addr));
+    *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
+}
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -437,6 +534,9 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     if (!ags->use_hest_addr) {
         get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
                              &cper_addr, &read_ack_register_addr);
+    } else {
+        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
+                                &cper_addr, &read_ack_register_addr, errp);
     }
 
     if (!cper_addr) {
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 454e97b5341c..2f06e433ce04 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -80,7 +80,7 @@ enum {
 typedef struct AcpiGhesState {
     uint64_t hest_addr_le;
     uint64_t hw_error_le;
-    bool use_hest_addr;         /* Currently, always false */
+    bool use_hest_addr; /* True if HEST address is present */
 } AcpiGhesState;
 
 void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
-- 
2.48.1

