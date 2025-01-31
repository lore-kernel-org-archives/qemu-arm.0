Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp586449njb;
        Fri, 31 Jan 2025 09:43:18 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWBbgBALiyqJR4yBoso3oMVjuPm+WZsydLVSuLsdoPaOZBtT7bQP59uJ3FMredTDFEM9GiI2R6GXVrP7w==@linaro.org
X-Google-Smtp-Source: AGHT+IHOw5480hw8FDvZAvKD5V77FcQTUehn9//LCtch5evVAn9eK0015md5zBvGFOWrcXXgKvk4
X-Received: by 2002:a05:6402:27d2:b0:5dc:8fb1:d44d with SMTP id 4fb4d7f45d1cf-5dc8fb1d71emr305748a12.31.1738345397797;
        Fri, 31 Jan 2025 09:43:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738345397; cv=pass;
        d=google.com; s=arc-20240605;
        b=P6DxEUyN7X4ILEOqLlaEypV0v5C1+hqqyIcX8/OMVYXNxMmHMVZAmCnYh2G2iKKfG0
         MeKazi0jGADq8/iEo+xt317RokcPYlzl4aSBpdIMHGn93aVGa1rftzyssJI/BEwp8uSV
         fQbHbkfzIupeYS1K5NKW3N2EbuFyyqzu+DWnEbiTpf22IcN3fMHldRt9RyuEsqPqisnn
         S40E82fXmUoFerbtdO5QKCcm14UVqh9TlgRm/x9abx1b4JLc1fc2IIKJ1pqv8P3pfC4r
         XLYPGYBv6b7CV5YLn3ddMGN6efJ1bAtfc2rDRSSvieC48i6Z9drqqWI87bI9b8h4Gi1u
         VC8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=bI7obNXUPTUicEzmzEai/emTS89PYeZHtezPxuxWq/Q=;
        fh=BaBMhsa8otE44w+eiuuCkoL0QFe4OiybwLz9x35r5BM=;
        b=gI9F52qUVX4tvA6XfA+joR5xrahXPOuHA0kSnv2oS29jtRMjk1i3rETZEqOXfyYQ4T
         eAfNv0VNSmYksdZyA3qo3SMdm+0BxTYRcsjxdsp9nBnAHNSUlpgiLXNsQQ+dfb+epIcy
         qxPRbgkMfSoPnytYytz/4vuOUh8472LAEfsYkcQ7moDowH5UN2w5aOP4Q+2epwG64CR1
         3WZ/tv3y3aDUSJXgK7zq9jVQklP6S4muqNJckgbxHeylvcs0ELLLXysuzm4dACSbclaW
         eIUII1BgeakrShIisglzqYNLzqdEp7xYwoptvzH4Rjs6ySJAe9p3j3oquzmiIVnucovz
         Wp0Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=aWJTo5Kw;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-494837-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-494837-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-494837-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5dc723ce49bsi3376632a12.5.2025.01.31.09.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 09:43:17 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-494837-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=aWJTo5Kw;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-494837-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-494837-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50B66188AD41
	for <alex.bennee@linaro.org>; Fri, 31 Jan 2025 17:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64C751F0E56;
	Fri, 31 Jan 2025 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWJTo5Kw"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D331EC011
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345390; cv=none; b=B717S5MMlxWXdb0JuA12cjCQHJM2ciMPcGEW6EVaQVg7MSw0BZL0SIvlFImUoGb8XfG2PMyKZ/CkX5J7iufGCYqRv9AoxbWVW7XpPCBdRoYrpimuIZUAH6kbl4DpIyfEf0xIGNc66fNuygyUaDmn02g0CwUnty47kVF+wE21zX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345390; c=relaxed/simple;
	bh=KouCoSf4mWghkLKK/X/OLNqtXx7bPryJTJFiRxmO5ak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SUkThcl3SGYKgm7fldr4OW+B4HMYhATscnSpFwjFv2K8XU6rGMGNmsB5dK6F0APR0AVgaGqsDNQysJWH30YfTPTAezYT+cIBLJZ8gzopyp9pFybWtDKU6BZiT/JJszgk7WELykJFwbhCGLgqBQhKgrYiklIGQUmDjj/FrBzlByw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWJTo5Kw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDC1C4CEDF;
	Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738345389;
	bh=KouCoSf4mWghkLKK/X/OLNqtXx7bPryJTJFiRxmO5ak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aWJTo5KwJAE32CQmmI0AJNKYYBZ2K/rQAezzsrgF3VfUY/hxpbmcvys3T+LhaHtuk
	 Cd6rB4iAqIx16ps1U2k66YeDd444tUdPfyBCZJTzoQqhotCTxqhQTeArwEfvNpqfUB
	 szzwHpcIIkmxOkU3FdO8NlpIVV+VJ2AM3khH0XzsbPZ/mWyB9y85N1rUNG9Ns3kzj1
	 N232tx8cu8LdZu3wAwcIN4s/CoWs+dNsFYgyie9u/iLHM4ylrO2ZzRgSTYHyZgAOVV
	 Z1qnSkreFKRc9xLDxM2EFl4s6ooHGS6Rm39njFtWnHvMlXsHWJpOL68W0XmWP7/qbW
	 NXgaclXcmVDJA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdv2p-00000006ggm-0Bae;
	Fri, 31 Jan 2025 18:43:07 +0100
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
Subject: [PATCH v3 02/14] acpi/ghes: add a firmware file with HEST address
Date: Fri, 31 Jan 2025 18:42:43 +0100
Message-ID: <5082df62da57450674413f13c20e937330676a0a.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: u9mBaCXjA3Ro

Store HEST table address at GPA, placing its the start of the table at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 16 ++++++++++++++++
 include/hw/acpi/ghes.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 4cabb177ad47..27478f2d5674 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -30,6 +30,7 @@
 
 #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
 #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
+#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -349,8 +350,11 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 {
     AcpiTable table = { .sig = "HEST", .rev = 1,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
+    uint32_t hest_offset;
     int i;
 
+    hest_offset = table_data->len;
+
     build_ghes_error_table(hardware_errors, linker, num_sources);
 
     acpi_table_begin(&table, table_data);
@@ -362,6 +366,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
     }
 
     acpi_table_end(linker, &table);
+
+    /*
+     * Tell firmware to write into GPA the address of HEST via fw_cfg,
+     * once initialized.
+     */
+    bios_linker_loader_write_pointer(linker,
+                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                     sizeof(uint64_t),
+                                     ACPI_BUILD_TABLE_FILE, hest_offset);
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
@@ -375,6 +388,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
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

