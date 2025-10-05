Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2834ACAC5B8
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Oct 2025 19:17:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5UE2-0007ft-KZ; Sun, 05 Oct 2025 15:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UDy-0007eq-S1
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:16:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UDx-0006QK-0w
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:16:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759691808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KJibYfYpYtxiVqZnl6aI5IzK4xu2t0BO2IPKoEwaGFY=;
 b=YT+58reBFxJ/9OAqsk+b6rbzKKhLuWL+9dyTnL7z1aqWBAckhivY72CtB6vaTMaqgZZgxh
 45EmlQW3X1aLKhNfCzZHFeGIBVtRUZvQJ5EbJKSUuQcTBBVmho1GrYeH3Wz5UyEWoZeWK0
 U198XG9+B0uEDOHPf11rD3zF2Kyr+SQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-jBvmfZkkPnmv9twN1gnhVA-1; Sun, 05 Oct 2025 15:16:47 -0400
X-MC-Unique: jBvmfZkkPnmv9twN1gnhVA-1
X-Mimecast-MFC-AGG-ID: jBvmfZkkPnmv9twN1gnhVA_1759691806
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-46e35baddc1so22644275e9.2
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 12:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759691806; x=1760296606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KJibYfYpYtxiVqZnl6aI5IzK4xu2t0BO2IPKoEwaGFY=;
 b=EdoAVq4ruFBYIyvdO9abq49js1xo1T+v3eWXa3e86sLJLM+BDRctJP+WLWrqZH1dq2
 VPvPIZB24GS2SBz9/iQViEuitpPLCXyCAB5hEfAfxyIG71TX2Ek5dnsl78BsNzJa4QZH
 7pUmpvzFCFOjnEVCLPLlhNC7N67GbZut19u7aKzftPIvNV5njv7AVYd+07j6TqtMwwmo
 EafODhKgWVYK89iD0P6WQOjKdtP96rR7GpebwQxH9PJf18rlqW7jDKMz2jfUMTWfULCH
 bKU5BIadWDc6uslWXZDb47y9+W1W9+qnwVPmgimvPiGJf35F/27V4eZ0xmhNk4h1OJbV
 1L8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWqqk4X08mfs+3qchIRQZgFMunQxGSpdquQxuoOAxKry+I23HjA6oXCo+E9j6x+E257D+MuqoqWQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw4MG6nNRRwH5ArxyRI4ZSIg6t2Gj2xg5K6olPJ4C7JwerLxfyT
 GS8O3ZUni3kGEfZnvRpFFcgeXJlCl2RJL07yUjFeORN5O1RMxvxBSC7wobdGp8ptQ9cbdKbLZey
 QZzTS5gevuKgKEQuYe3mWC160Z2tP7abPzhxkZ6/y8h4Qvh8WJysaHw==
X-Gm-Gg: ASbGncuCrZOsxIhGeXb/15PjLjqCBrKf0BzVl0HLV1aBSwrHAn1AvdeQ9Pb0naTsmww
 BkwTlbPnFjI2x0l8M7Nt0qgvNIO/SytDvdaI46ae4QvzhK3YgjOZHs+8axnW9GjVI7JXbCMGYJs
 QibwnFUW2pT2GX7nJzO4vFyqF4yVDlRdqzSzZaoyi/wOnXO/zvWfOgg+xalJ22ZzHgQAnMhJwMf
 6WRUsAyDjknZk1jZA3yAvIemF4reLDj9Oyibnr3LuoKPVXw55afRWpwlYLk6iq5wwHkwcm2S3we
 8P/1TwmbGJErSR403qWh3byRZL0Umu7HFDWmuzU=
X-Received: by 2002:a05:600c:3d9b:b0:46e:45fd:946e with SMTP id
 5b1f17b1804b1-46e711474c0mr79374605e9.31.1759691805774; 
 Sun, 05 Oct 2025 12:16:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXvSC4mMBfZswAakLq/v+QW6TW6WS+i3dHLhzCs7je25xzjM6vHgSWsV2vtseAs0CZmk3jcQ==
X-Received: by 2002:a05:600c:3d9b:b0:46e:45fd:946e with SMTP id
 5b1f17b1804b1-46e711474c0mr79374485e9.31.1759691805342; 
 Sun, 05 Oct 2025 12:16:45 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1518:6900:b69a:73e1:9698:9cd3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e723432c9sm124137125e9.1.2025.10.05.12.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 12:16:44 -0700 (PDT)
Date: Sun, 5 Oct 2025 15:16:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL 19/75] acpi/ghes: Use HEST table offsets when preparing GHES
 records
Message-ID: <b74d843f7bf43f5e7e1e5b9c34da2034d622cf78.1759691708.git.mst@redhat.com>
References: <cover.1759691708.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1759691708.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3WTRVJo7BnJdIHIS0U18Ofsfz26SPEIoGP5gz7BAHac_1759691806
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.43,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

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
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <d4344e8dbe66372e1e093d968eda2e8b0527ba48.1758610789.git.mchehab+huawei@kernel.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/ghes.h |   2 +-
 hw/acpi/ghes.c         | 100 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index ea9baab764..5265102ba5 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -78,7 +78,7 @@ enum {
 typedef struct AcpiGhesState {
     uint64_t hest_addr_le;
     uint64_t hw_error_le;
-    bool use_hest_addr;         /* Currently, always false */
+    bool use_hest_addr; /* True if HEST address is present */
 } AcpiGhesState;
 
 void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index cbc96c1909..668ca72587 100644
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
-- 
MST


