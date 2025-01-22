Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp865847njc;
        Wed, 22 Jan 2025 07:47:56 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWhTyVKgnMctRsu5NF3djPYDCdwnnFTjX9iyMHTk47d/tL8O0pBQqN1+5ZmDF+/QEEZWjrSgDFBkX6rHw==@linaro.org
X-Google-Smtp-Source: AGHT+IG+QKYOz8ahE4KOLWzlCquZBGxe/bAA1KzAWDj2iUN/EyMtsUEL9KMquHBR75y7duxBXxua
X-Received: by 2002:a17:907:989:b0:a9a:bbcc:5092 with SMTP id a640c23a62f3a-ab38b380857mr2015277266b.39.1737560875770;
        Wed, 22 Jan 2025 07:47:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737560875; cv=pass;
        d=google.com; s=arc-20240605;
        b=ePB71HhKYN18bBco55dUyeP8Hxs5L8BZ2OmBJp+K2SZTY/3f8lf9RgRtxgxCqfiyiK
         GY6xsZ1nPFDkyKmjF7OTqY5YARVU5hpZBYax+EX3nEHKy4ezCkJ1r2WvHQvN9HBK+csI
         cVpc2Yt1rmMpJQ+7FmM/vLQVqZ292oWEE1Y7hN0zLJAouhqhS+w4EOyRByOXXawaR412
         /+JmzB87PQ9H7dhJ5mYef+7FIQcowO9mb8LDETQARyti9VDNnvkgPgZPYbXd4l+b8iPI
         vWnrebQlDnZ9aeYy7gvRL6TIDjzPxCabFn2Md0cQzuTkXCELAeg8IF40TFwAt/NT3gho
         QkqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=PXM289cg6aO7ZmdWHjp3tV8ztYqvmcE7HLVvSpt2D04=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=aFPrH5d2ShkrfThxlavBJRPdCYNwQzZfEYSoeZ6FwZrpDektcgdD0k8HCa1E4FKWHS
         oldjr0OwmCi88RV2aFibQJQOlifrs95kb2+jQMDa8ijIKuMTl7V353S9sGFjoHuimpZj
         zFHpoW2xhS8jlRERuP9NVLPmUgTVP+4NfPatLDuuxajyDQyx9CQG8rMFn6YhDbkXjO6V
         0xjfUi9wo/zRlKT8VN4R5o8PP1PS2oKRKx6mTXaPMSaL7/n/CFzvAjOOJYc2iIshKaO/
         u75D9CCW3o/MFexglNHMNt2my2bQW2tuAd/RJs2wC67bsDHovST6jXvTNdGYOYmIiBG6
         g05A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="qLVcpd2/";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485598-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485598-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-485598-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab384d2d408si986028066b.236.2025.01.22.07.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:47:55 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-485598-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="qLVcpd2/";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485598-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485598-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F28911887AEE
	for <alex.bennee@linaro.org>; Wed, 22 Jan 2025 15:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FA5215188;
	Wed, 22 Jan 2025 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLVcpd2/"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BAB2147E5
	for <linux-kernel@vger.kernel.org>; Wed, 22 Jan 2025 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560800; cv=none; b=DmroLu06FBNBtjyyQdC9PghEhXXncr4JMV0G16a8yfh+9NZPbQRsxEyXWPjIr9s65M4KjpDtBLw40V4FansEvpYvRiL1SFO6Z4zk7II2bXApXVM16dsIGrIQG67MF6K8NkkXE/SODuhgPUeowlSP0rDYdp/5Co14FCmeGc67Rgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560800; c=relaxed/simple;
	bh=dVoyxElY60NM8RK48eYr47WE+kDPX7wZDrmsKdOm7/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0g8MiSB3Va0MumIRtQbyhMrFFmTsko61+/D49zzPY6lr32Lcxct/LT5YByEsZ/p9yQ1tYBhHYLil5N8bQRXc7t3LqbnwBosEoCK/9ZmIzRAuazk6ojpSaPZP+YNq2WjUrWr9DdmCNHP/18XCEuyrLidIST2bCq4vkdFkPsCAVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLVcpd2/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEF4C4CEE2;
	Wed, 22 Jan 2025 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737560799;
	bh=dVoyxElY60NM8RK48eYr47WE+kDPX7wZDrmsKdOm7/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qLVcpd2/p4QC6Ntez29y1wRk/1Q4Xt8+eExqhreF8BAuUQ8B5D/H3eQxW5vxuxEN0
	 FkwzP6TLLeuPIZZhLa5pNlTeIHE1NBUwlINEsaEAIXvEnLMHAKh2snSZAQwKY+M1mY
	 twOxHjJeDWxkm1Olv0YeODk9gtq6INdEsgKKoQj3tdPd8NgJxY+KtmxeOvHvOIgobs
	 8wNzW+kcxCTzl4B/eH3eA3tmHTp07drdsmgI8lV9FO5g8cQglFHSluC7Ndd3W8/iCQ
	 puWHcCK1hMvYe0pThmR41Ywv3oKLPSKDrCQ21EAZMyed/yNlrq2vXqZrvNz3Mrg+xl
	 F4BifeGeDoJVA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tacw9-00000008ogM-3OqU;
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
Subject: [PATCH 02/11] acpi/ghes: add a firmware file with HEST address
Date: Wed, 22 Jan 2025 16:46:19 +0100
Message-ID: <a3579f6c2c24e764e544f83b6e1b2dbef730e3e3.1737560101.git.mchehab+huawei@kernel.org>
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
X-TUID: Dvdv5g22eApi

Store HEST table address at GPA, placing its content at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---

Change from v8:
- hest_addr_lr is now pointing to the error source size and data.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 17 ++++++++++++++++-
 include/hw/acpi/ghes.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 3f519ccab90d..34e3364d3fd8 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -30,6 +30,7 @@
 
 #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
 #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
+#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -261,7 +262,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
     }
 
     /*
-     * tell firmware to write hardware_errors GPA into
+     * Tell firmware to write hardware_errors GPA into
      * hardware_errors_addr fw_cfg, once the former has been initialized.
      */
     bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
@@ -355,6 +356,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 
     acpi_table_begin(&table, table_data);
 
+    int hest_offset = table_data->len;
+
     /* Error Source Count */
     build_append_int_noprefix(table_data, num_sources, 4);
     for (i = 0; i < num_sources; i++) {
@@ -362,6 +365,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
     }
 
     acpi_table_end(linker, &table);
+
+    /*
+     * tell firmware to write into GPA the address of HEST via fw_cfg,
+     * once initialized.
+     */
+    bios_linker_loader_write_pointer(linker,
+                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                     sizeof(uint64_t),
+                                     ACPI_BUILD_TABLE_FILE, hest_offset);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
@@ -375,6 +387,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
+    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+
     ags->present = true;
 }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 9f0120d0d596..237721fec0a2 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -58,6 +58,7 @@ enum AcpiGhesNotifyType {
 };
 
 typedef struct AcpiGhesState {
+    uint64_t hest_addr_le;
     uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
-- 
2.48.1

