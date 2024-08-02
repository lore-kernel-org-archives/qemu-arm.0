Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp121896njb;
        Fri, 2 Aug 2024 14:44:32 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVLyy1l6Vt0XZDKwKRZOWd88wt6p4j1QXGdJ4UAPM9J6SOGpabFiHv9w3M4hvZskmNcAFaSprxo48xLPV4S6NKpfamqqmGr
X-Google-Smtp-Source: AGHT+IEPVf2mM8sw5GUT1ujv3IsqVYlsr7Efm2mBBXtE1arkVCR1jbOoZdHhU0x1CyuSAAJOndJg
X-Received: by 2002:a05:6a21:1508:b0:1c2:9095:7382 with SMTP id adf61e73a8af0-1c69964b417mr5156260637.52.1722635072734;
        Fri, 02 Aug 2024 14:44:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722635072; cv=pass;
        d=google.com; s=arc-20160816;
        b=B6ONjCVori9XfVnFZsgk3mAbRu+uMlnWVacK0SfnmnYztfbjY32liGFvZ3wW/9qyw9
         k6NSjoatHF6lDS/f0MclPdlfwFpjVfSEpIqMWy7d5mF2DD+zpqRY3BxVsCyyjZ6fZqNx
         bWM2aEOeoQ9Uh7seoRE0mpK/AZPGd/3N25juP2ivAnXLfKQO7p6vcm4uLxjnQIArFh6g
         oTo5qFDUMpyKUP5S19rRSVGw8UWbXlm5X5HmwBsLkXtXWH0FbikeqenVcggTMXtGgV0q
         4NBq4SN0xgbBQYy4N9ehxvowPjGt3oRUJ9IpwaH+TZ41eGAhT8OocOL5NmFUYOXofKAL
         rG4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=10FpiqlYE7WmrvFge6hFaqPKkXzYETeLIyJKUlIk9jA=;
        fh=5gvMMhD2S7UP3QzB201JMOyteTDVwhvTYOpwAATLSYI=;
        b=B5FuFNASxvNcIoAHR7Z1bT1484MayA8o/2vTAkDN670cnZErp/g1ZgAZVHeiIGZD7p
         OZzQhu6k+d7KjOoc8K/4HaH6dZ906+uMerbffFwGu9HucQtEJ5nHJ5DkpiRzo9+g/qnu
         +CgesuKg19ukK3Gmf00hAN0mO21psSMGzpdEiS8LzyozVB7aBic9vkcVXrI1gxVBz7nk
         9wbWCzQhUlxLTB0D+/nBZDiZPy0fy/cWMONkty+gdMl9k6DVQ5KpnIJOH1g2AmbQkl/B
         SDynUVjTjnz1ZZJ7qt9pdfn1t2hzMzkHi9UePFI8Qms7gWtDRtzU2PdryKyV5RM2eq+8
         2wNw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=k23NbhNc;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-273172-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-273172-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-273172-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id d2e1a72fcca58-7106ed9821esi2561885b3a.392.2024.08.02.14.44.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 14:44:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-273172-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=k23NbhNc;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-273172-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="linux-kernel+bounces-273172-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70EADB227A6
	for <alex.bennee@linaro.org>; Fri,  2 Aug 2024 21:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E75D133987;
	Fri,  2 Aug 2024 21:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k23NbhNc"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186A87A13A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Aug 2024 21:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722635064; cv=none; b=GblPEVUE2il8RPVNqY134tbr/sXjRRrQ7602FcEgTEPj1ZUj8ECMhxgJ3nXUUBlUNDX89ubXLYHlPgbTKSuOqkZtFQJI0l03Si6+kO9vTznRjikOrG0dF6psozfjAtAalK/ttYTAM9/S2l7QMKvzgOuyqAhw64jwc50yhdNlusk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722635064; c=relaxed/simple;
	bh=ZSlU9yW3n4NevgGhDHVq1qOszSSTbSe+VJ0pqN5i5yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmXiP3k87Ry9/HhiuCMOFZGmU/TcR2BsH0b7THHrtnTy1fvh2doXVWdFW95WybmIxVrgGYCyvqnFM5BOijFedxCdWS807E8Zbq7hxK0PuwtlXsbfC01TW+Efb5ovHpgnsOK5/71Sm9Rq78PPCie8CR94S+7oKueZiqyNF5/YzUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k23NbhNc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3F1C4AF0F;
	Fri,  2 Aug 2024 21:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722635063;
	bh=ZSlU9yW3n4NevgGhDHVq1qOszSSTbSe+VJ0pqN5i5yU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k23NbhNcvr7qcW0xNGW/lpc063Ke8p+T3amvRCJSiFCEVRb4H7p9pBQPO4OJZjc02
	 53j4U8mzbsz+hPg8IgcdmW8yhjJ0vaCvj2dpLFta0vt9caHzuWJiQ1imY+Y+6gOVhC
	 Wcs6+zgkYqfLB2ebYMcPy/zpjTAyyi7UYUcsVRSxtA74T/qeBsMtWSSfnZWb10wW7l
	 A8P8LlShEqoplvkwGKaAOe53Zfi/oadN4z6Exx8NDvjC7dLBgEA2uL1+ec4o4T6C+J
	 qtJ0c+7W7CPQy9V+SS4KX8b/U1pk0fQaJD+/UynF0GUD+kbgw+gGNrVbCHbUt6k+F9
	 GsePxlR5709Vw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1sa04T-00000002naP-2z0m;
	Fri, 02 Aug 2024 23:44:21 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v5 4/7] acpi/ghes: Support GPIO error source
Date: Fri,  2 Aug 2024 23:43:59 +0200
Message-ID: <5d53042ebc5bc73bbc71f600e1ec1dea41f346b9.1722634602.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722634602.git.mchehab+huawei@kernel.org>
References: <cover.1722634602.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: xs20yrsEhHA6

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Add error notification to GHES v2 using the GPIO source.

[mchehab: do some cleanups at ACPI_HEST_SRC_ID_* checks]

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 16 ++++++++++------
 include/hw/acpi/ghes.h |  3 ++-
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 8d0262e6c1aa..a745dcc7be5e 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -34,8 +34,8 @@
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
 
-/* Now only support ARMv8 SEA notification type error source */
-#define ACPI_GHES_ERROR_SOURCE_COUNT        1
+/* Support ARMv8 SEA notification type error source and GPIO interrupt. */
+#define ACPI_GHES_ERROR_SOURCE_COUNT        2
 
 /* Generic Hardware Error Source version 2 */
 #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
@@ -290,6 +290,9 @@ void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
 static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
 {
     uint64_t address_offset;
+
+    assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
+
     /*
      * Type:
      * Generic Hardware Error Source version 2(GHESv2 - Type 10)
@@ -327,6 +330,9 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
          */
         build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_SEA);
         break;
+    case ACPI_HEST_SRC_ID_GPIO:
+        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_GPIO);
+        break;
     default:
         error_report("Not support this error source");
         abort();
@@ -370,6 +376,7 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
     /* Error Source Count */
     build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
     build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
+    build_ghes_v2(table_data, ACPI_HEST_SRC_ID_GPIO, linker);
 
     acpi_table_end(linker, &table);
 }
@@ -406,10 +413,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
     start_addr = le64_to_cpu(ags->ghes_addr_le);
 
     if (physical_address) {
-
-        if (source_id < ACPI_HEST_SRC_ID_RESERVED) {
-            start_addr += source_id * sizeof(uint64_t);
-        }
+        start_addr += source_id * sizeof(uint64_t);
 
         cpu_physical_memory_read(start_addr, &error_block_addr,
                                  sizeof(error_block_addr));
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 6891eafff5ab..33be1eb5acf4 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -59,9 +59,10 @@ enum AcpiGhesNotifyType {
     ACPI_GHES_NOTIFY_RESERVED = 12
 };
 
+/* Those are used as table indexes when building GHES tables */
 enum {
     ACPI_HEST_SRC_ID_SEA = 0,
-    /* future ids go here */
+    ACPI_HEST_SRC_ID_GPIO,
     ACPI_HEST_SRC_ID_RESERVED,
 };
 
-- 
2.45.2

