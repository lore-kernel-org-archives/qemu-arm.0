Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp141279njb;
        Thu, 27 Feb 2025 03:05:31 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUqlqDdnEPYy0JYkALSnNqXYJK4IkcxZiCZ4AZg8wyjMCjBPZbXywaOFMNGRJaCVvC3BPViqvN8WZ00aQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEmxq75plSUOKjbJCWg9BnUaQmwzjh5mVqgXiHN7ClQgJeJHz48q2rV0/e9g9yz+6om1aPZ
X-Received: by 2002:a17:903:19ec:b0:21f:658b:8ed5 with SMTP id d9443c01a7336-22307b4556emr149214975ad.6.1740654331030;
        Thu, 27 Feb 2025 03:05:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740654331; cv=pass;
        d=google.com; s=arc-20240605;
        b=E8ibaJ61ZinV7JbT2o7qW/TQDi7IxkfVYTb5z5AdVsgU8+OhnsfL2gkeN97NWJ2U9B
         PaYoInyOaxbaqYG5GWKi/g1YcPy1uL3b+bNv3cTS+oG6AJs3pfRvjv1K7jNK2PZXgX7a
         1Rwj5oIeBlnbwa6K5p6dQBIbwY74IW0ZoJLb2CD55vgnckaA/KawXGj4jznBWd8SeRyM
         fEEG6a97FVcQtmMOeWKihWMKBq7b55mfimGkG2w9u4VkewOp9L3qP2eogB8kqnVkZh/v
         IRzC9i1qktsyyGENaUvjmpI5UktBOyFEML751rn44iR+QlYbnGJ2UdgOVDOYFbc5ABd+
         uBJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=M/ZVUTwO2XpCICQRBXWfb6ergwwdpKlIPIjPj2ihU2A=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=kIwQbDcot72Xywce0qi9OymV+MBOJ9IX2ZXMqNk9hIncsOiQQo+YoWIK6TslKz4Kpk
         pyU6yqJrmIi2kA5bzINZNiXXV4v8k9kaSK2O/jywWPf5E9pKR8jvYcO56L8SXdbfljgA
         fMinrCpcr7wSkqno6iHCmqtZkjUZKzLY8ZBXSholqxvZUAE0oVXQEH1AaG51LBIVx2JT
         JwU9IKiBLYw9+mdc3k8Mywqawp2CZiFIFWKyFiYywZF4ya7WevpZnCoW7uHQXvMgqQ/M
         0tS8wz+FKNaGjQz4Fex1ogMYjUjItwl4JmipRLncEbkPXVOGsqNsczD0t5AGS6ooYytz
         OsJg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=qqxqqqVB;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536076-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536076-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-536076-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id d9443c01a7336-22350292e68si20080065ad.200.2025.02.27.03.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:05:31 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-536076-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=qqxqqqVB;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536076-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536076-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2ADA67A3A78
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 11:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E744922DF97;
	Thu, 27 Feb 2025 11:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqxqqqVB"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415F22B5B2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654238; cv=none; b=uPwcgtjlL6oWi08mPDu+VTP5WbBH9q+D5xoowmlnj3CrzXVd2hOSkfZvBy3AYpc8ZyHZxCef7+K7Cep8Y0WGMYQ40YHFhnpI1PXO8hUIIGBGu6ktzRRyVxJdJAQonZfh46cQeJsk6NnCTIYleZnRbdJ1R3g6dc3IOGoqKLoayBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654238; c=relaxed/simple;
	bh=dNSamkVPIgpz7PdfXHB7ARhqVUNvoYsG9ISyCxpJ/iM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VUG8um1vb8cqexzp52cBFTK2YTsPLI+kBT1kfrkNBMygiMmm3vvHlICZ3YYrBN+5XqljvYD77qIk/EjGuUbhfYO2PufzXKYLbEmSpDx5d0cnv32wEmwlC/614CP/0zMv+w55ZOEVvwTUpCOXYF6UhfUjrEySDBu49t8RxEk0C+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqxqqqVB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A0AC4CEF1;
	Thu, 27 Feb 2025 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740654238;
	bh=dNSamkVPIgpz7PdfXHB7ARhqVUNvoYsG9ISyCxpJ/iM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qqxqqqVBuQtK+/ZRAeQUbvAjIQH5J+LdZap6k5YNskUbO4QpGeP5QNAuQb6NLjNX3
	 eN+xM5l+MB6KH0Xe28KNoj8x4lUrxwc5JND++jooKmjhyWWoyJjJYqcrl12Q3Wz//P
	 i4WDHqyZoP0Iphj68GI9N1rTT7kovYEcWhyntHLJuc7jjSnfYnmh47QGNoIkxO0+pN
	 imj7k4RnOY5DSHtDnq6YfBqMFaAATVACeAA9xgvBB889l1WxdOd3f1Br+Ak+0DQK7z
	 5ss0v6KGqLstnCqDB4FsLVrMyHf5fiejgIXSx7+amFJv0zKlWRyYRn/BhXkFseJ1Df
	 HuICTMNVd5Oug==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tnbgK-00000001mQy-0n8v;
	Thu, 27 Feb 2025 12:03:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 07/21] acpi/ghes: Use HEST table offsets when preparing GHES records
Date: Thu, 27 Feb 2025 12:03:37 +0100
Message-ID: <bd544e003047996eaaebe10c11e13f1d30c2751d.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: KLxSiYbSf8fn

There are two pointers that are needed during error injection:

1. The start address of the CPER block to be stored;
2. The address of the read ack.

It is preferable to calculate them from the HEST table.  This allows
checking the source ID, the size of the table and the type of the
HEST error block structures.

Yet, keep the old code, as this is needed for migration purposes
from older QEMU versions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 100 +++++++++++++++++++++++++++++++++++++++++
 include/hw/acpi/ghes.h |   2 +-
 2 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 8ec423726b3f..5158418f93cb 100644
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
+ * ACPI 6.1: 18.3.2.8 Generic Hardware Error Source version 2
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
@@ -408,6 +438,73 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
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
+        /* Compare CPER source ID at the GHESv2 structure */
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
+    /* Navigate through table address pointers */
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
 void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -423,6 +520,9 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
     if (!ags->use_hest_addr) {
         get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
                              &cper_addr, &read_ack_register_addr);
+    } else {
+        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
+                                &cper_addr, &read_ack_register_addr, errp);
     }
 
     cpu_physical_memory_read(read_ack_register_addr,
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 38abe6e3db52..dcc7288ffba5 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -79,7 +79,7 @@ enum {
 typedef struct AcpiGhesState {
     uint64_t hest_addr_le;
     uint64_t hw_error_le;
-    bool use_hest_addr;         /* Currently, always false */
+    bool use_hest_addr; /* True if HEST address is present */
 } AcpiGhesState;
 
 void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
-- 
2.48.1

