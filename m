Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1739530njc;
        Sun, 21 Jul 2024 23:46:24 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX6gErgn8JGjHajy8Xmuj+chEecBDi33PDzepKKxkGwhJzrcxGDrHY4bKft+IUhch7R5aF00ds60GSP7Hg4QoNDh3PZ0STh
X-Google-Smtp-Source: AGHT+IGka2pVEiHNGlATfON28R5wUp97AT02QijTKoe6pUxddpahBHwKrL/PpmAYf4rkuLXEa2we
X-Received: by 2002:a17:902:c204:b0:1fb:a2c0:53b4 with SMTP id d9443c01a7336-1fd74553f28mr53143495ad.18.1721630784274;
        Sun, 21 Jul 2024 23:46:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721630784; cv=pass;
        d=google.com; s=arc-20160816;
        b=kuwMDPuDIdfpvTI7p8LQThaZ52cmgwWTkJcjbrNbLVpzAmoebXktH5YiFSieGgPGgy
         A/b5EOzxGVNzh2znwb+LlCxm/NfDCgswme1G7+kEBdsX7UUHbKZjXHXThkwEzuc6rTKC
         fMcvUT9Ywex3LuRab6qxbctX93cpDhiRcVIiGsUpCsGulQTfSDrdxUECrNxU9XCiq1wl
         0Xvv6lcIp1xJ71QnvAXbg0wYmPRWq0LphYkyGzXJYwctoyZbq/MvsaXYQI/NqdfJNLGq
         o+y2fKvuW2lh7Mi1tJ4Ccy9yFuf+S0XIWg1GUMQZxRgtupXbtMUOH88JIMPSYw5Zf2Rj
         Sv5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=HeMJVo1nZ+eZGu3mtjMfFocDLIj0STfTmzxt2VgxOv4=;
        fh=/A1Jk9ewZ81/NwMlhJJbmsFJMBNnZp0hdN4unxYVqf0=;
        b=yPAJka8LKIkzgH8Y1eghpYFjPy82iOa0762TK0D7rqxQ79mznOAz5fWIkwOTPW1LcQ
         YbbE0zq43kGW4zDyXRnXkPjSMfoKNKfbZ5nC9VZDcOOSTgjWYvn4+rqqWKpJ85iMfcmR
         uvDNiuhL3zWAPdLOAz1hlX+p0UWg5QJazbcd7VpjOZd+jlS5DPaN7/jJQOuEDfS/3sYK
         9IjpJpinuJvsAkZMx/A6Mg1NOH3D7O9NK0yqIaEO6nJE8D75RUFd/sWI8q9pCEKlRUEU
         API7BPFO+ejuK3mCPE+0hf+/N/mYQoQ0hKw6egx0gXonpy4ZA72T4QrRMz2nuMQkbbUT
         oUPQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kNpRBZZs;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-258513-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-258513-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-258513-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-1fd6f3159bfsi59903835ad.207.2024.07.21.23.46.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:46:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-258513-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=kNpRBZZs;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-258513-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-258513-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFFC4281697
	for <alex.bennee@linaro.org>; Mon, 22 Jul 2024 06:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D302318AE4;
	Mon, 22 Jul 2024 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNpRBZZs"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDA2610C
	for <linux-kernel@vger.kernel.org>; Mon, 22 Jul 2024 06:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721630776; cv=none; b=VVfKGxHr2wyruAREkbQYz/RJvd/Fis+E699oinwuHMmMU+BVFryTBY8eFZnv0NQ/gx6t7NC+vJo++d4eIt95vsCevWj2486HPC+mG+zkPwqjERGbJMJUIxzS4KUpZzGidlskAycKXYBdYsKEDS8aR9oNIGk3R4kaJveSsCiiBD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721630776; c=relaxed/simple;
	bh=8fT3iZX4Ak9UXbYdPywtW7xLXPjIWOMseP9okwfRJuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VGL1tE8gTa3rRtmO+TE8npL4rpkmvJn6fi+28UDjCGEpaKjWdmYue3KN/Bc4K6S9XNO6KBsetQTm599uIti7Kt7zg7PC9hCT9BmzwxVYAyqL6a68UE4PUnSp4HHDxqn7tKswYQ7HvWYIARk020rq2GsMAgItV9Kv5kyG+gAHhew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNpRBZZs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E80C4AF0E;
	Mon, 22 Jul 2024 06:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721630776;
	bh=8fT3iZX4Ak9UXbYdPywtW7xLXPjIWOMseP9okwfRJuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kNpRBZZsm9mWd6iSI9j3jYworOiHY2yeaDBzIMmsRhBVgsfyLe/BKMCa2M+a7D2j1
	 +SpV1pEFifQ4EQoqZZlS+7wlnC+o2LihdhDKyfnxCGES7DcUUQv/U3LkklCSHaq3VN
	 bxSHWYImNcUZ0+Fhcu/acfry+UH6Mh/zm/4pKfdYgyAvsfR4ajI+7xHzrN8480zpQ1
	 Qad5WxpHn/ESnwr4kp8AAz9CDY+5p3+uXBitopiQvR7pYEJnZj/MH1bA4kvbSSPj1S
	 MLzg8uEJEMoIQDJZ/6Hin+GzvTVOyp6l+ptBvWyjzDYavsA1P0YFEKoKHbm8Arrled
	 i7NDbtmtbjZnQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sVmoI-00000000WR2-1NVJ;
	Mon, 22 Jul 2024 08:46:14 +0200
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
Subject: [PATCH v3 6/7] acpi/ghes: update comments to point to newer ACPI specs
Date: Mon, 22 Jul 2024 08:45:58 +0200
Message-ID: <66c1ab4988589be99ae925c6361548f55fea58b0.1721630625.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721630625.git.mchehab+huawei@kernel.org>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: +IRpBGvzqI4u

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
index 6075ef5893ce..ebf1b812aaaa 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -45,9 +45,9 @@
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
 
@@ -65,8 +65,8 @@
 
 /*
  * Total size for Generic Error Status Block except Generic Error Data Entries
- * ACPI 6.2: 18.3.2.7.1 Generic Error Data,
- * Table 18-380 Generic Error Status Block
+ * ACPI 6.5: 18.3.2.7.1 Generic Error Data,
+ * Table 18.11 Generic Error Status Block
  */
 #define ACPI_GHES_GESB_SIZE                 20
 
@@ -82,7 +82,8 @@ enum AcpiGenericErrorSeverity {
 
 /*
  * Hardware Error Notification
- * ACPI 4.0: 17.3.2.7 Hardware Error Notification
+ * ACPI 6.5: 18.3.2.9 Hardware Error Notification,
+ * Table 18.14 - Hardware Error Notification Structure
  * Composes dummy Hardware Error Notification descriptor of specified type
  */
 static void build_ghes_hw_error_notification(GArray *table, const uint8_t type)
@@ -112,7 +113,8 @@ static void build_ghes_hw_error_notification(GArray *table, const uint8_t type)
 
 /*
  * Generic Error Data Entry
- * ACPI 6.1: 18.3.2.7.1 Generic Error Data
+ * ACPI 6.5: 18.3.2.7.1 Generic Error Data,
+ * Table 18.12 - Generic Error Data Entry
  */
 static void acpi_ghes_generic_error_data(GArray *table,
                 const uint8_t *section_type, uint32_t error_severity,
@@ -148,7 +150,8 @@ static void acpi_ghes_generic_error_data(GArray *table,
 
 /*
  * Generic Error Status Block
- * ACPI 6.1: 18.3.2.7.1 Generic Error Data
+ * ACPI 6.5: 18.3.2.7.1 Generic Error Data,
+ * Table 18.11 - Generic Hardware Error Source Structure
  */
 static void acpi_ghes_generic_error_status(GArray *table, uint32_t block_status,
                 uint32_t raw_data_offset, uint32_t raw_data_length,
@@ -429,15 +432,18 @@ void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
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
@@ -481,11 +487,8 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
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
@@ -504,11 +507,16 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
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

