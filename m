Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp1686373dlj;
        Mon, 13 Jan 2025 05:09:06 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVDvVKjb+FUVw6oA1lEjcQCjEitUPJatA9deygDvipDO1/LYuqATc/xfNx4fVkYNFtq58ceFBF1zZNIzA==@linaro.org
X-Google-Smtp-Source: AGHT+IHVDYFfesn5HNaN6toY0B5AYk5cAaykAQWVYDN9SGFsVdESgcxN2+e/roVwy0+gp7wagLAE
X-Received: by 2002:a17:907:9622:b0:aa6:af66:7c89 with SMTP id a640c23a62f3a-ab2ab670587mr1962944466b.5.1736773746376;
        Mon, 13 Jan 2025 05:09:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736773746; cv=pass;
        d=google.com; s=arc-20240605;
        b=kzyuBatnmFQkSVBXur5mbYa60h0xqv3awibIVXyBMC95ZeQgiKVGqLFoIT7Y2d3872
         0lrXKVvARzsnU//6Mjx03YIveym9YjaWjD8QD5Tzsf3oU/dvwgleoeDf72Yn6PUMv+Bv
         nxGo6ZaJoFdQ8RHu0n5P7vR2GKTTshm3n3DbHy2dR8G//2FA0Jzf1fT3ORJEE19Iqk8m
         YxcNaMZYRmAflBSMV1+sfCzd8UrfuRfDP5noDNk9uDviJCRucvscNAZOR2ZbIKbs4xKw
         thdRKC8c76CMrKtaqtS/KswLrEXZ/WgkoLzwop4LSn9cPX73Um/2TVQrpO4Z0Q3s2/xE
         YVEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=pQufSITnYeIQu6/fyZEtLjzqytRkqeZIQ57mZw1MfUQ=;
        fh=6g+XkWzQ6FxDoFGpGpDf0c5zAAOiu1xjE/i+EDDeu3M=;
        b=MQaq6I6gQaO4INMa0SewjF8L8dI7qQcj1VMO6dziAwNha9dtx3BNjRbUQ8PXjuRbQD
         MRH4lNt1EetjOpxhC2+sIiRnDsoWF/HGGpak1lZy6jIReBW0z3nZXktRA/jShDIF6VUv
         X6eirnEwB++OoMQtIlTaOD+BW0T5D0pJ9pZuOVMSr1pUVQsg43qZybgu7oNjYWIGbUKm
         E/wj1BllU+DMIQUGzRqH0yg3P4sGfBlCIzMQFRFtvlEwkGQGmcGPNPP35vS0U8VshZBf
         afSP9s+YLpze+k63M6++NPoHnL6oj8NNuEwDi5RnCLEZ0LCYLTW9XcozOFqSywDjJV1I
         /UrQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BN28QsOs;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-474009-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-474009-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-474009-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id a640c23a62f3a-ab2c905a47dsi639423066b.121.2025.01.13.05.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:09:06 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-474009-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=BN28QsOs;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-474009-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-474009-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0440D18863CD
	for <alex.bennee@linaro.org>; Mon, 13 Jan 2025 13:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669292343A5;
	Mon, 13 Jan 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BN28QsOs"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8B322F156
	for <linux-kernel@vger.kernel.org>; Mon, 13 Jan 2025 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736773739; cv=none; b=JzmRZGWczY8BwjmfuNo4e+Ay6xgHlUVz6+OyI/7bdD12kKMB/YuJ5Xm/GQMSpbjE37xsriAuZB50UOVPVP2qPlnv5nUmNzgUuw/9tIyan8RiqirNn4Vin4xP4QiGSzCQDRG1Q10ZnQ4/y1ub8ITT63CS+QGhGJieUiHZZbfELoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736773739; c=relaxed/simple;
	bh=TsEli4wt5d3p7EHJ+mjJKQY7ofvU+IDL+UvjwPBZaX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HDwrIIC5YrCzb2++sUvjDhbhyKzweJWowAsbSyhO35PFlBA68sFsmgvcAlPG0TA5/MAEtaYRATp7JH/zd0QJYxQKj73GevYqs5UXskEt5fYw2hGyqKWzNKglZD7iTR0e3jMRUoNDTigPBebz8IaHjC+TS8vuPPJazxElVKjao30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BN28QsOs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B5CC4CEDD;
	Mon, 13 Jan 2025 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736773738;
	bh=TsEli4wt5d3p7EHJ+mjJKQY7ofvU+IDL+UvjwPBZaX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BN28QsOs7JtROT1g/Sw6vXX+8VfvXZ7FI9sGTwDuE7AMxb9axkwNfWxg16aETCof+
	 MrU/7QoshyiZoeoIRRhsryDH3OgdbThDkhDOAIO51KVcwUkdx79O0/35U4DTEK64OF
	 0R3RzU8QsVZ/dMDbf1KKCqJUsiJh6Ih7KQeaTZ1K9vuOIXnQI5pb0vkfS1JxWUssx2
	 0bQ5Sy2LXN6juYFTNELxuzlXLChGmX868O6POklLPObUtwJO1vbA/WztnzdRV2H1H1
	 I8IvEeN3pWgv5yrNRhltOweurm829UTkcWrLZlcm2LoysTXRrxIL6y397hDdwEWF7B
	 QRnNcyUpPTMwQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tXKBc-00000003Ymx-3Opv;
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
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v4 2/5] acpi/ghes: add a firmware file with HEST address
Date: Mon, 13 Jan 2025 14:08:48 +0100
Message-ID: <20250113130854.848688-3-mchehab+huawei@kernel.org>
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
X-TUID: D04TnBct5tw5

Store HEST table address at GPA, placing its content at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

---

Change from v8:
- hest_addr_lr is now pointing to the error source size and data.
---
 hw/acpi/ghes.c         | 17 ++++++++++++++++-
 include/hw/acpi/ghes.h |  1 +
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index b77e5c9d1b19..4a826c8ca6d4 100644
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
2.47.1

