Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp57315nji;
        Thu, 11 Jul 2024 02:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWhjiL+hkqNLftNQiDui2lNbW+4L+11uwJUjUMg1jW7vYGkm4OvhCD4Z3P5zlr6D3THGPPS68V3PfQzrbWenhOKbluJHr2x
X-Google-Smtp-Source: AGHT+IFbUuf45zYj6AEyBAZvbcwRvttDPoM75UjYnxv5YlF0WqihAnsI8pCrFdxpQI9Xwa5SrRZ4
X-Received: by 2002:a17:902:fc86:b0:1f7:2a95:f2f8 with SMTP id d9443c01a7336-1fbb6ce5209mr70581995ad.14.1720691546709;
        Thu, 11 Jul 2024 02:52:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1720691546; cv=pass;
        d=google.com; s=arc-20160816;
        b=xmcHotHJpFqj3yCSiz2O0YtKCmmgEwB0NXWHPionW8Ob1keSG3xfF7UZomLMo2b4F+
         PaHUgjyqeEL/BlkuaHJ7NzO5zEZ7vz3dc6FUsmHdr64MRqKr8jHw4s7SAjMa02tghONu
         A1sxwxJDUip1Hkzo8a3QBL5nHZtuYhPC+USfDxPGeFjMPQ4O96MH9Zr24HRa80vM687p
         xrrE9xUjrc5PeQQBCTIE6sFQ42nzSCCHXFNnfHNVLIhJBncsT3JHHxPSI3CVbQxrnVdB
         r4XNIdxBZped7+Rhscz2mwI4XZG2n8ErItv5hnTdKfwk7QfPZMxAffY6M8RF3EhW4lDE
         XV0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=HeMJVo1nZ+eZGu3mtjMfFocDLIj0STfTmzxt2VgxOv4=;
        fh=3+4ABBw59eJsk2DIcCOTrWhm6FNLn8Q9BsAaEWXrVjg=;
        b=x2bmbS/BT4N78i3f7xgy9QQLLYm7Yrv3SDIfqdHd2i0ATWpkTOtkQ+YzOOphdAz+yV
         NZ5nQdrtdmelVgLK8mOzgdfl6Z98OERUFY/R0rkAUqlxbL0UlIw2/CocUqb3VoZt2nt1
         eCXJLvmlI1PtM4ZUjxyrNRhPsObL5RG0+FrjidCkfSO68GlXl5v1AmYNYAD4epMED0zJ
         +1grouQSoKd8lqIu4PgHu/PXWelI8YQOJxWM/3BqyIkDZyaTYw2nkDB0waJm+XkNvi0B
         3ubaf0o6JqLMfzHme7thrHiOPexPLDldB/rSlHVyAffU1QGV3NVHzzUO2be1Y8zLy7dw
         vNAQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=N+3mx4UN;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-248916-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-248916-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-248916-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-1fbb6abf1afsi58290345ad.398.2024.07.11.02.52.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 02:52:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-248916-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=N+3mx4UN;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-248916-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-248916-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD5A12851D4
	for <alex.bennee@linaro.org>; Thu, 11 Jul 2024 09:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F65157490;
	Thu, 11 Jul 2024 09:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+3mx4UN"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54FD155CBA
	for <linux-kernel@vger.kernel.org>; Thu, 11 Jul 2024 09:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720691540; cv=none; b=MHt9LWsZPIqB/GfkchCg6cLBnfAvNDfShOdop4nJ2gTkH7BGj4/qFySbYAbJKxQWFm3IdSvT4vDflXipPG8bbW7LtdM45IHzPMl9xxPnAvVFMlI6dSU/NFoMI+UhB4xLqjvvlAX4hVJzC+/AsM9fpLY0+HY0NugNtOKjsks8O6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720691540; c=relaxed/simple;
	bh=8fT3iZX4Ak9UXbYdPywtW7xLXPjIWOMseP9okwfRJuM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOJVWHseiq0pTEoVjnerSJkkY2A2aOPXx/TVU2v7se7OmlPDfB6FJyf5/7Ix/d07EFkDgIn9Wuwoi2LjpKStPDfnbiO5jkaBDjgWxm4VfDBkEWwa5Td+ntS8FSOPPpmUJEUuq6P7/asth11yGpjG4dJ5ChcvG9qod+4/lw75KZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+3mx4UN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2DFC4AF07;
	Thu, 11 Jul 2024 09:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720691540;
	bh=8fT3iZX4Ak9UXbYdPywtW7xLXPjIWOMseP9okwfRJuM=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=N+3mx4UNN8dYWiUIP60+AhLYFaiOhAWuATFMyah3Xq/HI+oD1QiX00VMQFyvjdspr
	 WwGqXqKqlNOOrvS+QJQIM2wRJ9pzmil8TXOA4LtKD1fwuwG1n6WQBd48sgg2tjHGCK
	 XzMUyJh56sMMyO2zK6/ILApmw6UAMvJhyg8wfcXdVfsOrpuCjUpYQ+WcY160GJakgv
	 HcFm2llcvsCuDLyi1s5JWaUg5e1GsnnP0UAjVdwSvTdHKWf4eJgd+3iyOULlElxDjY
	 CiySy3vZDcsfDO+wPjEyNn7PrPnSbdHZ7G1w68zkToLGTKDhbQAq9/XYUQtXA36vS5
	 uDNjCQbHgd6bQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.97.1)
	(envelope-from <mchehab@kernel.org>)
	id 1sRqTK-00000002jZt-2siQ;
	Thu, 11 Jul 2024 11:52:18 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-edac@kernel.org,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/6] acpi/ghes: update comments to point to newer ACPI specs
Date: Thu, 11 Jul 2024 11:52:07 +0200
Message-ID: <1ca920c8cebbb5aaac2a9f65ffccf7b4443ea666.1720690278.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720690278.git.mchehab+huawei@kernel.org>
References: <cover.1720690278.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
X-TUID: y73hnW6FFPGJ

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

