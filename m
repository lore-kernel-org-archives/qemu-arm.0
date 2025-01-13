Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp1686394dlj;
        Mon, 13 Jan 2025 05:09:08 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUir/f2FQ1s1LEDz1BsDGZtZ0PYp2kv+uSy0qCwM1uqbYZgG0h6kDghGzLV+iW/eDUO/b0PTTk2KSdvCw==@linaro.org
X-Google-Smtp-Source: AGHT+IEwTn22Gy3rJzKkc2vHb2DJpV9RiH7GbM7Z2XdmLklBBwRP5YUV4DWNTpc9sVn/ZZMkWrqH
X-Received: by 2002:a17:90b:51cb:b0:2ef:3192:d280 with SMTP id 98e67ed59e1d1-2f548f162acmr27886300a91.5.1736773748499;
        Mon, 13 Jan 2025 05:09:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736773748; cv=pass;
        d=google.com; s=arc-20240605;
        b=Z/QowsxPQtguB2Ju7/lJbvjuxNU7IB6KteKlZmbbb0pV/zY2wbmteMIFsANgT7boQj
         f+FQDKwiHZfmmvrFT32B067hVpta0B6WE+OUOW0oYLhdypUjXWtoErQ18jKbGbKXez9/
         FeJg31yu2xAYBXjTafbt0sdGPXhT18VyqY3pMve1VMuFHxOZVnJ4iYlSRL4VdZevp7ju
         XbSPwjnrWROQf4diyWtsah7rKHd3r485qye+cRSmd2qa99DP0GZhuXAjjzZLZimqXoly
         hQDdL2XCIfTA2qSFzEWlqHVJad23qYEBonfKHCeGdgrDiJpxjG9nb5Y6aHOxhTwbj3XF
         2VGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=DRImJ05CReFxRjanWACl47734ncOhpNVTmyAwGAl52c=;
        fh=8WKMlvHBit1egi9o2cK+ScoX/Z5fO36J0VVxubWVY0Q=;
        b=KmPCuH8S3hnw8p/9h4wLh/hjcPO3X7ICJYUcTHE7enhkg7ElbXeP8g31SSsN/u//75
         W1L8n00+TAdECXgbsqBTEAN93EohZFWemorS46fYqgznqussnR29ywMCouyly8Y0ib54
         Kud/NSKxkjlWGb+v4wu2alPrX6rMT6hN0H/VqEk87fDTBAoktTK7Ysa4g+0vhbhI6RsO
         /cH/F+1e81bDyBU+qd8PYJIjH+HP0l28NUTwjqykoiLnKjKBGlzjVl4U/wk6qbwGPGsd
         ytNL+AG3jOSsqL7m3O/zEvd2I6yahX9wYTx7yNjznV6JCc0S9Wr6cH2cj1OiZthOKMPm
         PnBw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=QwcOb8f0;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-474006-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-474006-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-474006-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2f558863fc5si10944364a91.19.2025.01.13.05.09.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:09:08 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-474006-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=QwcOb8f0;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-474006-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-474006-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 841047A1381
	for <alex.bennee@linaro.org>; Mon, 13 Jan 2025 13:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D508234962;
	Mon, 13 Jan 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwcOb8f0"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7AC22A4F4
	for <linux-kernel@vger.kernel.org>; Mon, 13 Jan 2025 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736773739; cv=none; b=Gy5/Tgm22wJcXlqF2YNVQg7p5cJTxW/ElI3DVGqi+6PuXHSnFHurgeacfSkd/T9ibejRPWJoBcHuF/JVCDUj6j8NXLmRibm7AmkT5Jcv8Paq2fFGhZtPeu1UHfstqd31eQkwy8Y1GTKW+l3RNv9dTNqbgTio5H8KYi104GjiFlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736773739; c=relaxed/simple;
	bh=MU0G6LeVHpib1KGQyhmnkOCxz8W6BYrpvk6qjxPDW/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eoekKyVHYvti0vAyowW22f//uAv9+FxN9kbYeM+mMK8VJu0k/+3eYKVtH8oPq3eqPeOICxMUOwYiz+02orcsNJRxbR5LfEQMpQth3WzV0LoM2FT7IbMAUC6mw9suZeeLQ73Cr4XtE6kjKZJFPiyGA+eQj0Tv4fXLbpuVP8BaH+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwcOb8f0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE8AC4CEE3;
	Mon, 13 Jan 2025 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736773738;
	bh=MU0G6LeVHpib1KGQyhmnkOCxz8W6BYrpvk6qjxPDW/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QwcOb8f002bQRpgXbcoZ56q4iF27hln+7Es0Lb5edrNPFelKbiXgmxc6GlJNwaP0z
	 c11Zc2M9qQsJuHQ5TTfW5S3v00tVEMCFpS0smkIEIPGr+WIaCh75PwetH/5BH9Xi8i
	 gxYTj0J36865Ibs1n9ucsA8y/CqICFe9ttj1rKFrbLLhWEJ72wA1aAAeMTFCINHilF
	 U+pxXGt/dHRok4bAkksbERdamMqvikkXPfYNwOTrnfZAwPbeMp+LDv9j+VgCglgCNd
	 khVZr7/86Y7wNlGazup0WRA8HPpJw9qV4meiyM11Lfq/JcAzpMHSkaomeSsWDs94Pw
	 jMiYoahNfhY8Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tXKBc-00000003Yn1-3W66;
	Mon, 13 Jan 2025 14:08:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 3/5] acpi/ghes: Use HEST table offsets when preparing GHES records
Date: Mon, 13 Jan 2025 14:08:49 +0100
Message-ID: <20250113130854.848688-4-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113130854.848688-1-mchehab+huawei@kernel.org>
References: <20250113130854.848688-1-mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: t+YY39Rqo2DV

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
index 4a826c8ca6d4..afcdabc76791 100644
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
2.47.1

