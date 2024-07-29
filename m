Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1784025njb;
        Mon, 29 Jul 2024 06:21:27 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVLWqt0MforKSudb3+8jkS0ZiyzQWDJJJJ6QwFRC0AkjsxG5HPNygdEmTsZzl7jpUWVH3sgV5zfEdLhZqWNLDCSVP+ZwJ7R
X-Google-Smtp-Source: AGHT+IH1yfLL9Xr588nj+68DAdKISdnebAj5l7AX4QIKcEuxL7QwSKAiV/vjEs+xypxF5WgVDrlV
X-Received: by 2002:a05:6870:5589:b0:261:164e:d12a with SMTP id 586e51a60fabf-267d4dc6e28mr9063901fac.22.1722259287086;
        Mon, 29 Jul 2024 06:21:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722259287; cv=pass;
        d=google.com; s=arc-20160816;
        b=gXjE6PnCfvEbyZ8bOUyEDdqyOVdcaw7rDY90doAkTJElXXG9tGBArs/1vtRUpFIsVs
         tyiVlSP8f+RC1hOUhRd9rmd5yKqXfkfZIoqoFeXNDe4f29eVXxy2o19VfXPw2DvIgiJi
         Nbcjw7OAThU+ftoTc+BPeD2jxQRTtjq8Uvxku8aWEtADAj5C8bTPlfxdHw5buN+/T9gE
         pJDSoWjSpFpzWxZHwUYwMmB+y7sYKPjtbBE5+2Y8fX4tttmoeWDrfJXoZERXs5ieB0/g
         OMt2wbXY53aqA/GMykfZ7xFA6sw0HHSgvQcREb2kxUANIntCBHcM1nAMNu2hT4VZjKAJ
         dPRA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=7APEKKz14uTFaDJC8c4kLcf8IUjNSLfBOqD8RG/UgoU=;
        fh=/A1Jk9ewZ81/NwMlhJJbmsFJMBNnZp0hdN4unxYVqf0=;
        b=GBqQacUkXIzDiL7SyPfTE2NNobN6ekNtUqg2P/DaWlnTbU+dqC+kiSRQTx+GN4OsWR
         X7SlDaA3jzG6MyMpc8ctBzX3WgteD1vpHdKrT40hddOvH5fwTJrgPRcUA9NjkfCefgmX
         CpDQ24LJpMKFmYcbw5jlKl4FJTjXcvty3wHNvNkLWC4oNv76BP/4jmMZ2MgJza6ZCpVJ
         UoGB3CLSlWPQaI5PwuK0cRqwaQsrGdBqIUDvE0q5zgyD+xRryo1Dnqkeaq2TejGIwhpy
         ilAPK3n6iQsKzhQSPMkg/OjeCtOBXN58ckT4j2rPFTbcSUPuzhOnL3Znz03Oba4WxfUv
         KbcA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="DeTBCHM/";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265834-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265834-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-265834-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7a9f96e32b5si10484928a12.867.2024.07.29.06.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:21:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-265834-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="DeTBCHM/";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-265834-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-265834-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86C9328228E
	for <alex.bennee@linaro.org>; Mon, 29 Jul 2024 13:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A537414A4DB;
	Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DeTBCHM/"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C542148FEC
	for <linux-kernel@vger.kernel.org>; Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722259281; cv=none; b=KzoJ/Br/jDaXG8fLnKx/4Fb0qUUFmuaHvGiZbH5an2L5l8IUfbck/P0H4duAX86rOjMOyr9jjRnZXcLm6Nbcb0IgQCwRzvMGLwlFLGwpO9bJT3L4frYFgtBvR1rEKqJ9wHHU/X9LLYxLx4cyIo/gvTqhQMFbcGqoscHn+/eh7p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722259281; c=relaxed/simple;
	bh=c7zw+YFhj6uS64hOqzQNjWgop6AVDFMab3GmXvFntiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=If3lCBALEWUoxLEZ9fl8eaaWRhdcQ9xaKfhkGxPwh2HgkrhoWlKW1ztZxZ5wiywlDjC72o+Is6ZOYSdo3pYfP06dgwo4Yyq7a75RfJCbVUy2wwXWGc97QKDDkIyI3U4bRY9yDAxYRP7EXIt5TcWXtqoWfBy/DHeLL/npM5xD3cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DeTBCHM/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1586FC4AF0F;
	Mon, 29 Jul 2024 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722259281;
	bh=c7zw+YFhj6uS64hOqzQNjWgop6AVDFMab3GmXvFntiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DeTBCHM/uddoUM9+jRoKAADz4Zf0ML1GGk2xYwBmJ1SL/d9rUyZ/eJ0baswfpV3ci
	 u9f/gIPg3lAG6rim+OsqcoYU8aSEgmfkj1Oiz6SSrNn/J3uhpDaVVUgjyK6pQjTo20
	 Xc/9kd8D3vpEVZAnOavMc7bJk7oeyRsrZvoONkj3umL5QOIvkcMlIJWZEgmYKbhbI9
	 dj3sY+VQcts1rFt3miM+5eN6W9LaeDOA4Xrz20dPtOUkpDgZlrePOPkkjx4XV3izP5
	 3n4LcDmDSeQuxxrRO500jZKE8lD4gTpYCiA7aBDmDxc3PiqBHxY5F8H5PAhbErmuF3
	 hM1SGa3ndqIdw==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sYQJT-000000030Vf-0c7Q;
	Mon, 29 Jul 2024 15:21:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v4 4/6] acpi/ghes: update comments to point to newer ACPI specs
Date: Mon, 29 Jul 2024 15:21:08 +0200
Message-ID: <6771b76dbdf23317a3b1f432e467ee3478d83887.1722259246.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722259246.git.mchehab+huawei@kernel.org>
References: <cover.1722259246.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: 2SCzZveiLngI

There is one reference to ACPI 4.0 and several references
to ACPI 6.x versions.

Update them to point to ACPI 6.5 whenever possible.

There's one reference that was kept pointing to ACPI 6.4,
though, with HEST revision 1.

ACPI 6.5 now defines HEST revision 2, and defined a new
way to handle source types starting from 12. According
with ACPI 6.5 revision history:

	2312 Update to the HEST table and adding new error
	     source descriptor - Table 18.2.

Yet, the spec doesn't define yet any new source
descriptors. It just defines a different behavior when
source type is above 11.

I also double-checked GHES implementation on an open
source project (Linux Kernel). Currently upstream
doesn't currently handle HEST revision, ignoring such
field.

In any case, revision 2 seems to be backward-compatible
with revison 1 when type <= 11 and just one error is
contained on a HEST record.

So, while it is probably safe to update it, there's no
real need. So, let's keep the implementation using
an ACPI 6.4 compatible table, e. g. HEST revision 1.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 48 ++++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index e9511d9b8f71..8816af8280be 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -44,9 +44,9 @@
 #define GAS_ADDR_OFFSET 4
 
 /*
- * The total size of Generic Error Data Entry
- * ACPI 6.1/6.2: 18.3.2.7.1 Generic Error Data,
- * Table 18-343 Generic Error Data Entry
+ * The total size of Generic Error Data Entry before data field
+ * ACPI 6.5: 18.3.2.7.1 Generic Error Data,
+ * Table 18.12 Generic Error Data Entry
  */
 #define ACPI_GHES_DATA_LENGTH               72
 
@@ -58,8 +58,8 @@
 
 /*
  * Total size for Generic Error Status Block except Generic Error Data Entries
- * ACPI 6.2: 18.3.2.7.1 Generic Error Data,
- * Table 18-380 Generic Error Status Block
+ * ACPI 6.5: 18.3.2.7.1 Generic Error Data,
+ * Table 18.11 Generic Error Status Block
  */
 #define ACPI_GHES_GESB_SIZE                 20
 
@@ -75,7 +75,8 @@ enum AcpiGenericErrorSeverity {
 
 /*
  * Hardware Error Notification
- * ACPI 4.0: 17.3.2.7 Hardware Error Notification
+ * ACPI 6.5: 18.3.2.9 Hardware Error Notification,
+ * Table 18.14 - Hardware Error Notification Structure
  * Composes dummy Hardware Error Notification descriptor of specified type
  */
 static void build_ghes_hw_error_notification(GArray *table, const uint8_t type)
@@ -105,7 +106,8 @@ static void build_ghes_hw_error_notification(GArray *table, const uint8_t type)
 
 /*
  * Generic Error Data Entry
- * ACPI 6.1: 18.3.2.7.1 Generic Error Data
+ * ACPI 6.5: 18.3.2.7.1 Generic Error Data,
+ * Table 18.12 - Generic Error Data Entry
  */
 static void acpi_ghes_generic_error_data(GArray *table,
                 const uint8_t *section_type, uint32_t error_severity,
@@ -141,7 +143,8 @@ static void acpi_ghes_generic_error_data(GArray *table,
 
 /*
  * Generic Error Status Block
- * ACPI 6.1: 18.3.2.7.1 Generic Error Data
+ * ACPI 6.5: 18.3.2.7.1 Generic Error Data,
+ * Table 18.11 - Generic Hardware Error Source Structure
  */
 static void acpi_ghes_generic_error_status(GArray *table, uint32_t block_status,
                 uint32_t raw_data_offset, uint32_t raw_data_length,
@@ -286,15 +289,18 @@ void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
         0, sizeof(uint64_t), ACPI_GHES_ERRORS_FW_CFG_FILE, 0);
 }
 
-/* Build Generic Hardware Error Source version 2 (GHESv2) */
+/*
+ * Build Generic Hardware Error Source version 2 (GHESv2)
+ * ACPI 6.5: 18.3.2.8 Generic Hardware Error Source version 2 (GHESv2 - Type 10),
+ * Table 18.13: Generic Hardware Error Source version 2 (GHESv2)
+ */
 static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
 {
     uint64_t address_offset;
-    /*
-     * Type:
-     * Generic Hardware Error Source version 2(GHESv2 - Type 10)
-     */
+    /* Type: (GHESv2 - Type 10) */
     build_append_int_noprefix(table_data, ACPI_GHES_SOURCE_GENERIC_ERROR_V2, 2);
+
+    /* ACPI 6.5: Table 18.10 - Generic Hardware Error Source Structure */
     /* Source Id */
     build_append_int_noprefix(table_data, source_id, 2);
     /* Related Source Id */
@@ -335,11 +341,8 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
     /* Error Status Block Length */
     build_append_int_noprefix(table_data, ACPI_GHES_MAX_RAW_DATA_LENGTH, 4);
 
-    /*
-     * Read Ack Register
-     * ACPI 6.1: 18.3.2.8 Generic Hardware Error Source
-     * version 2 (GHESv2 - Type 10)
-     */
+    /* ACPI 6.5: fields defined at GHESv2 table */
+    /* Read Ack Register */
     address_offset = table_data->len;
     build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 0x40, 0,
                      4 /* QWord access */, 0);
@@ -358,11 +361,16 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
     build_append_int_noprefix(table_data, 0x1, 8);
 }
 
-/* Build Hardware Error Source Table */
+/*
+ * Build Hardware Error Source Table
+ * ACPI 6.4: 18.3.2 ACPI Error Source
+ * Table 18.2: Hardware Error Source Table (HEST)
+ */
 void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
                      const char *oem_id, const char *oem_table_id)
 {
-    AcpiTable table = { .sig = "HEST", .rev = 1,
+    AcpiTable table = { .sig = "HEST",
+                        .rev = 1,                   /* ACPI 4.0 to 6.4 */
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
 
     acpi_table_begin(&table, table_data);
-- 
2.45.2

