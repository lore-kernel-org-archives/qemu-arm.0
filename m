Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp865830njc;
        Wed, 22 Jan 2025 07:47:54 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWhyl6+xi+VFEV4A+vTwlNfHvzsNiOxZvErdrEFMyeLIgDpEsAbwO1CcLyinAo0pYhJOHpl8EAL6GWPyw==@linaro.org
X-Google-Smtp-Source: AGHT+IGRBoJLd3JQEwXdPSCvECy0fpLq5COnyb/MRlZ2TmSjzo5COK97Pi6OOSLet6UEdiLT27h1
X-Received: by 2002:a05:6102:50a7:b0:4b2:af6e:5fef with SMTP id ada2fe7eead31-4b690babad2mr18175650137.9.1737560874421;
        Wed, 22 Jan 2025 07:47:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737560874; cv=pass;
        d=google.com; s=arc-20240605;
        b=AiTEPVKXwQGcCPWhH5AfKUrQuDWDBWGn85gIbqp4Na8fXKz69a9OU0HC2xE+Cb+iAG
         3hFvUZWZ6fsn4UA0vT9umertPj/HEmzgY7ZdTdwmFlQp5KS09I4G6OrHmUgVCiY72qaK
         mFwm6agbmAaqlg/kZHQP0TYtaT1i2QjMdjTfN4juU50dtoY1Gkt02wdJTtcI9kzjq+iq
         LDPTkkjW14iFi7VyFek0reVi14511lI+7PLyEApjXW94+1HPfU4BpyFqZ9Ps53Wqkq2H
         BAUgpk7hteVCp2CDC1TxHgJDBZA/ejY/yFnNl3q/dOdpR2DDdKo+P3XC2RX126q7grJP
         xxpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=gpTqXBuZ44n28fuD+S8Flz/4S7S/CaSCZfDEEqqBwag=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=U+NvqPTc6fKUEih2LCKlqZ0vLgoym59MgdAMRk/I4kIhmhh5pmkzLxZHS1D/SG1nQl
         N4eiMpvHsFGnRdnXCFRHUbVbcYU94gIDb7W1bFES8e0m6Tp5EmID1tzHD6hUENuFnOdv
         DeG6F2mFLwMhVidETok+Iug3qddDuSRkrPRUbsONQrWDan+At78hzWJ+eqGRf0RNt4Ua
         qcgTei8DRjwTSoNqt+LHe/WpxORJPM6A/H+/CVcuXCA8JX2WpD7RGOQBhNvpdPf5xsl2
         BWIorvoBqJ4otvRbscQSPk4mqEmO9FuMPXDV91vCoAHNqMEeyrRRyvM1Cvv/65YLh/R5
         z85g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kcXHpCzs;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485597-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485597-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-485597-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b68a3816a8si4393668137.691.2025.01.22.07.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:47:54 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-485597-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kcXHpCzs;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485597-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485597-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 577921631E9
	for <alex.bennee@linaro.org>; Wed, 22 Jan 2025 15:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5802A215189;
	Wed, 22 Jan 2025 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcXHpCzs"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B4C2144D9
	for <linux-kernel@vger.kernel.org>; Wed, 22 Jan 2025 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560800; cv=none; b=sidvgnVI/s3fPLk2P1i4FCqAq6I4l81mmRiqYk/8k4T07CeJ2Jy/l3VAEkaxEAyweOXbfS/jQcQ5RNw71fyY0MEvlY8cKFQ6tb/FyUPsRzD1fRLaq1wm9qAHgVTC7Gdv4dRDNxDZxkBufh0UfmNe2pWpuEnHWMakk4SalcWMptY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560800; c=relaxed/simple;
	bh=7dDlOu+j2EkHoixFygEQpxqk4U+9+v1WbJNIzodNoG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=juUOUIPRjQgq3Y1bBjJEs36es8yA/zW5jYPCLPoDUYRDkcOwRTRZ0IIDoUQztSPvVI1ffzbesejNUwJ36lICZKvGf8UNKSYCZgSdKcFKQ1KrJ/vj6l2cj2dzc8ewbKhRApqVNeGHTOIffn77sRZP1iW/NMEu3OIbx4JTDLFSKSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcXHpCzs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C8AC4CED2;
	Wed, 22 Jan 2025 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737560799;
	bh=7dDlOu+j2EkHoixFygEQpxqk4U+9+v1WbJNIzodNoG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kcXHpCzsC9illiZAaQq90RTCjF9DrLxytusdORPnmH6c19a5nzETdIQZuDAF9VS9l
	 IBfrdlepBFFAawy9MkNyw4OelbjkaXiLVBleOw387c9oBbeuAHHDXKqphbvnCArjgK
	 ecYJsxYq+mbQ8osIiFqV02sulPRWAxQdViJQMpPN7LreZXoTqb1HmB+kjQue5p5kO0
	 y5gHTLw/NUO2Iy+mCBKri9uYrQcuUDNdwUUF7zqPe56qVQMlhRexplqk/eX+xSDy/4
	 hrDWKClGK0gfnvplQ9mmvY+Lkys9DW5lrtM+TBYRhRkl9J0jr3PbRDJy3yGwfl+FuP
	 Hd9ZK3Rk9JDQQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tacw9-00000008ogQ-3VaS;
	Wed, 22 Jan 2025 16:46:37 +0100
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
Subject: [PATCH 03/11] acpi/ghes: Use HEST table offsets when preparing GHES records
Date: Wed, 22 Jan 2025 16:46:20 +0100
Message-ID: <10a8a913862c9cc894235d32b10bbf2f992340ff.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: giP28+P2n7fY

There are two pointers that are needed during error injection:

1. The start address of the CPER block to be stored;
2. The address of the ack, which needs a reset before next error.

It is preferable to calculate them from the HEST table.  This allows
checking the source ID, the size of the table and the type of the
HEST error block structures.

Yet, keep the old code, as this is needed for migration purposes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 98 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 88 insertions(+), 10 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 34e3364d3fd8..b46b563bcaf8 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -61,6 +61,23 @@
  */
 #define ACPI_GHES_GESB_SIZE                 20
 
+/*
+ * Offsets with regards to the start of the HEST table stored at
+ * ags->hest_addr_le, according with the memory layout map at
+ * docs/specs/acpi_hest_ghes.rst.
+ */
+
+/* ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
+ * Table 18-382 Generic Hardware Error Source version 2 (GHESv2) Structure
+ */
+#define HEST_GHES_V2_TABLE_SIZE  92
+#define GHES_ACK_OFFSET          (64 + GAS_ADDR_OFFSET)
+
+/* ACPI 6.2: 18.3.2.7: Generic Hardware Error Source
+ * Table 18-380: 'Error Status Address' field
+ */
+#define GHES_ERR_ST_ADDR_OFFSET  (20 + GAS_ADDR_OFFSET)
+
 /*
  * Values for error_severity field
  */
@@ -212,14 +229,6 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
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
@@ -419,6 +428,70 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
     *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
 }
 
+static void get_ghes_source_offsets(uint16_t source_id, uint64_t hest_addr,
+                                    uint64_t *cper_addr,
+                                    uint64_t *read_ack_start_addr,
+                                    Error **errp)
+{
+    uint64_t hest_err_block_addr, hest_read_ack_addr;
+    uint64_t err_source_struct, error_block_addr;
+    uint32_t num_sources, i;
+
+    if (!hest_addr) {
+        return;
+    }
+
+    cpu_physical_memory_read(hest_addr, &num_sources, sizeof(num_sources));
+    num_sources = le32_to_cpu(num_sources);
+
+    err_source_struct = hest_addr + sizeof(num_sources);
+
+    /*
+     * Currently, HEST Error source navigates only for GHESv2 tables
+     */
+
+    for (i = 0; i < num_sources; i++) {
+        uint64_t addr = err_source_struct;
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
+        if (src_id == source_id) {
+            break;
+        }
+
+        err_source_struct += HEST_GHES_V2_TABLE_SIZE;
+    }
+    if (i == num_sources) {
+        error_setg(errp, "HEST: Source %d not found.", source_id);
+        return;
+    }
+
+    /* Navigate though table address pointers */
+    hest_err_block_addr = err_source_struct + GHES_ERR_ST_ADDR_OFFSET;
+    hest_read_ack_addr = err_source_struct + GHES_ACK_OFFSET;
+
+    cpu_physical_memory_read(hest_err_block_addr, &error_block_addr,
+                             sizeof(error_block_addr));
+
+    cpu_physical_memory_read(error_block_addr, cper_addr,
+                             sizeof(*cper_addr));
+
+    cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
+                             sizeof(*read_ack_start_addr));
+}
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -439,8 +512,13 @@ void ghes_record_cper_errors(const void *cper, size_t len,
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

