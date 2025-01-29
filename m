Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3616766njk;
        Wed, 29 Jan 2025 00:04:35 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWCFDth2n6k3HA5cwgXHw5pZ34dbMM9L9Y3ZnjV/4BONsw15ydd62HSRSJWJk7GLDuJ42yavqdw/EEsWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHd02IpeQqkG2qkV5XFbrjdgePp3cVjGk8ZROsDlhwfy4t3MNk+E7JnDGA88F3AQc+bHDld
X-Received: by 2002:a17:903:2347:b0:216:2f9d:32c with SMTP id d9443c01a7336-21dd7e2d8bbmr31062155ad.53.1738137875062;
        Wed, 29 Jan 2025 00:04:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738137875; cv=pass;
        d=google.com; s=arc-20240605;
        b=cLEH3StJWTU5fqVw7KH385zBpBa/sdIiWyIn+4mI5aUNztlmROJJKvzbK81QFQApzC
         unOb6gS8K2Y3g7JItK/6j4CSPnNBHA792PplGcwg6u5mpt2n1oIXBGHWJ80GEMgSAd80
         1ubuQcbX4f6RPvdchUKBKBkh/johrbdM37PpV7ZmOv6m9jh8ijNlWSsda3lMCymsbOYm
         vJn0B3VCGJQDzonMwD8H5VLpJGfZO76L4RmZOH+fn4bH5J9BvIQ8NTOFT/tsyPEgsCiM
         okIHgpJr2IfqAlnX8yZX6FoWFWN4rZ5SEmLQZcIacgTWo5nYHtcMlc/k991i4DrXL67w
         rXFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=0IFtN1LcjLG3jiw8w0f/yLMJTYxE7fjnI/eVxXjN/I0=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=j6xTXNuO8kMJ4htf3Z0uGwLPzLcnYgZXwT0LtgJYOWwOc4qbUnkAEU93q2fyzqrbsK
         lfAph1xVUSVWz08GZV/jaS6HvcDKdXN/8pQgJuNk8OV6en67bg6ZsCsRrjBWUCtBJGud
         LiBzcN0rUSsQUCxPYtFtmkluS+kxYbBNx3VxE411rGF07wjasvhqqAL4KEstByKL+4Zi
         hD9R8MJgU5DakxQScYZRrt9nhVwLVJ5JlxPmL6WEvtMr6swpuPA0Y9rxVjjHdgJWXznG
         /cyVsOKn26f762ayWIcFjiAPSpXRThtxGrZhcg6GylPY9iqFljsSQmO1hJpfnffrc5rx
         Dhcg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dOF3sOLa;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492173-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492173-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-492173-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-21da414c50dsi147514125ad.332.2025.01.29.00.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:04:35 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492173-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dOF3sOLa;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492173-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492173-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DC843A531C
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 08:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811FD19A28D;
	Wed, 29 Jan 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dOF3sOLa"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3882B193084
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137867; cv=none; b=IJtfk78upsvJOcZ/TH4WzmDnnWuri7jzjUGpROpq5F+KSsBF0sqJ2RKiPXIwNpREw8WDP4eUVXlspECZ7tCo+nv78hubETxp9ExdhSMVcPeO9a6O98RVfkqf4oAOw7zT58UibOwuk+km6Ah1jyGZRVOhH5rPkjeUmQqCRC2l6/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137867; c=relaxed/simple;
	bh=onMmwxUv41PXDDiw0FOWAM2KGKbQpHwRmyCrG0Wj84c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lf73BVFMfIsGYGMUpOL54Swk5FgZOaJW55e329UQSXpq9Lvn5ScWfFyFY1+xlmMvCusdwWKnfEmlD4yOIlSvgcruQAt9KBx1R7KFtmzZT6WIiQ0rXpbbo8fgjlwnqPlyokkudwCdliMoWj/WqN6SnvN/uCKl56hs5+KOyMStPIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dOF3sOLa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE1AC4CEE0;
	Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738137866;
	bh=onMmwxUv41PXDDiw0FOWAM2KGKbQpHwRmyCrG0Wj84c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dOF3sOLae8QoIyXO8ys5tA6PhGVuIYZvoP7m2Uf2uHyJllNEXlBXoNhk9vUo6GY5Q
	 lX0MFt8+qBloIBidoj9SSkiRbHrtUtewCy4BOlHwn1RHmysb4kJ4MaW3j94/CSgjQ5
	 R2rDwTpO0A5onPYtlO3O15WufzZfH6T98/zF/hsM5WJ6tJ+M5PGChDrDB3vaTrEmTf
	 xULjiKuinU5JkYJaOFOqhp+V82D3jeCTbHFYVxjBGr+hjdVy9BrUagQhbhHZ6Wqr/m
	 h8wBsePCEmHCj495svFusa4nyBwZlMRNst62tTkwbWpwpRtabWokTXIo49mFFKbiLu
	 xZi1tPCh3v6IQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1td33g-00000004DPm-392e;
	Wed, 29 Jan 2025 09:04:24 +0100
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
Subject: [PATCH v2 04/13] acpi/ghes: Use HEST table offsets when preparing GHES records
Date: Wed, 29 Jan 2025 09:04:10 +0100
Message-ID: <de81bd00f4b0b656bc0d191232610b86e157fcb8.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: FENiZ3h5ZxJ0

There are two pointers that are needed during error injection:

1. The start address of the CPER block to be stored;
2. The address of the ack.

It is preferable to calculate them from the HEST table.  This allows
checking the source ID, the size of the table and the type of the
HEST error block structures.

Yet, keep the old code, as this is needed for migration purposes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 111 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 101 insertions(+), 10 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index db6bed010eb0..adf80945c6db 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -61,6 +61,25 @@
  */
 #define ACPI_GHES_GESB_SIZE                 20
 
+/*
+ * Offsets with regards to the start of the HEST table stored at
+ * ags->hest_addr_le, according with the memory layout map at
+ * docs/specs/acpi_hest_ghes.rst.
+ */
+
+/*
+ * ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
+ * Table 18-382 Generic Hardware Error Source version 2 (GHESv2) Structure
+ */
+#define HEST_GHES_V2_TABLE_SIZE  92
+#define GHES_READ_ACK_ADDR_OFF          64
+
+/*
+ * ACPI 6.2: 18.3.2.7: Generic Hardware Error Source
+ * Table 18-380: 'Error Status Address' field
+ */
+#define GHES_ERR_STATUS_ADDR_OFF  20
+
 /*
  * Values for error_severity field
  */
@@ -212,14 +231,6 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
 {
     int i, error_status_block_offset;
 
-    /*
-     * TODO: Current version supports only one source.
-     * A further patch will drop this check, after adding a proper migration
-     * code, as, for the code to work, we need to store a bios pointer to the
-     * HEST table.
-     */
-    assert(num_sources == 1);
-
     /* Build error_block_address */
     for (i = 0; i < num_sources; i++) {
         build_append_int_noprefix(hardware_errors, 0, sizeof(uint64_t));
@@ -420,6 +431,81 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
     *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
+static void get_ghes_source_offsets(uint16_t source_id,
+                                    uint64_t hest_entry_addr,
+                                    uint64_t *cper_addr,
+                                    uint64_t *read_ack_start_addr,
+                                    Error **errp)
+{
+    uint64_t hest_err_block_addr, hest_read_ack_addr;
+    uint64_t err_source_entry, error_block_addr;
+    uint32_t num_sources, i;
+
+    if (!hest_entry_addr) {
+        return;
+    }
+
+    cpu_physical_memory_read(hest_entry_addr, &num_sources,
+                             sizeof(num_sources));
+    num_sources = le32_to_cpu(num_sources);
+
+    err_source_entry = hest_entry_addr + sizeof(num_sources);
+
+    /*
+     * Currently, HEST Error source navigates only for GHESv2 tables
+     */
+
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
+
+        if (le16_to_cpu(src_id) == source_id) {
+            break;
+        }
+
+        err_source_entry += HEST_GHES_V2_TABLE_SIZE;
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
+
+    error_block_addr = le64_to_cpu(error_block_addr);
+
+    cpu_physical_memory_read(error_block_addr, cper_addr,
+                             sizeof(*cper_addr));
+
+    *cper_addr = le64_to_cpu(*cper_addr);
+
+    hest_read_ack_addr = err_source_entry + GHES_READ_ACK_ADDR_OFF +
+                         GAS_ADDR_OFFSET;
+
+    cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
+                             sizeof(*read_ack_start_addr));
+
+    *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
+}
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -440,8 +526,13 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
-                         &cper_addr, &read_ack_register_addr);
+    if (!ags->hest_addr_le) {
+        get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
+                             &cper_addr, &read_ack_register_addr);
+    } else {
+        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
+                                &cper_addr, &read_ack_register_addr, errp);
+    }
 
     if (!cper_addr) {
         error_setg(errp, "can not find Generic Error Status Block");
-- 
2.48.1

