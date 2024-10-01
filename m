Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp117573njl;
        Tue, 1 Oct 2024 04:43:22 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVHQQjUkejgM5c5afThrEowOl7ETjof2SIkk2Y8yWIZib+vIHBo6rqp5o2K5g2Ewoay46ODx4zrK+YTyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFvv9iuR53S7ZU/jSOS5ZzoE8IM/hEy0BBWYkaobnAdfwgggzJRg/x+SdCXBq00HwtotBon
X-Received: by 2002:a05:6214:3a8a:b0:6cb:39bc:3acf with SMTP id 6a1803df08f44-6cb3b5c0afdmr244678736d6.6.1727783002489;
        Tue, 01 Oct 2024 04:43:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727783002; cv=pass;
        d=google.com; s=arc-20240605;
        b=RKxHZJEq3BbQILWVVxtmQb/CN9jbn0aIzKQWa2mnMVU4Lt0GwgcG8ga4lpAN+x1BMa
         GneYATQZYHaNAvl/IzLcbC9WKmgSKc3TbjH9M9IU9FLY2liarn8jFeRKtl6LwX0phHUb
         KpFX7LHIlWpQzFvg6nHJGNoEoU/boKwoDVk6Eum/eUP7LzauDSRoE6gG3GKduZMIyMm7
         5IEYuGtowN50kWFOWgxwkVWW+6TvWvFmDnq0BxGYe7mDRzw59L4GglTqbyEW0BN0RdcU
         qM05N9JmJElrwRkZbx69duTvMOc4EtyHfJVn3JfFgwEB6zSEH4n6Xf0zsUUoCA0WqZoS
         slxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=TD7QuW4I7eJ3bSdP7vMZYZotrK/khT7O+TgvvATHZyg=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=LAxbz+vnOlqaS+X7Zmn623n3Fi7p//NhSPxXGM+/duIEjubF9W/Hwc+jZamy61SyYO
         jFZlPRr7qeemZ5HvbrDI+hd8l1biEtuZbP7hFf2s8LU+tgBux3+SuIoBnMGWh+yyGGT4
         qljEa+u99oLxEvyyKrvnsqzCQfHrA3Fit0bFyPvs7mvLGL8tYxy2ljmA88TJ0r/AB1/+
         xl3wPqKEaU/2tlR/tUyixQbB72I2CPWZ4XpbDQZsjTImZDSSFvZibhYXD/G+grErSXyw
         QhDCX8PevvaAslmZkwoaqzOW4wTtBp8EP8zCb2OFwqfrfACS5RoK3NKOwnxm4gcJsPVx
         2zWg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ighTY4LY;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345814-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345814-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-345814-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b687a7bsi109288916d6.368.2024.10.01.04.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-345814-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ighTY4LY;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-345814-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-345814-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0F191C21922
	for <alex.bennee@linaro.org>; Tue,  1 Oct 2024 11:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326701BFE1A;
	Tue,  1 Oct 2024 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ighTY4LY"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF81BFDE8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Oct 2024 11:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782997; cv=none; b=HB+lwSkBjJgPewOM5FUpp6rC3HftbDtu4lQbKOkxo64O3giH0sp3UOJPijdJpRhmulm0MipPqJe6e4kCwJ/3lSmCjPPFdipdpH5e/YLyxGrcFsfnsKpwLn1UX0Cv6+dTxcveclamzCR1XL1ZecHHsRBC9zcMvPls4xf2GSqY+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782997; c=relaxed/simple;
	bh=kdOhicYRP+Af5pJK9ojcMdnLO0Tz2ve669IOTmMN/5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ToraNQ0CeCJE4MWeIa4LP+EGL21NgWFFYEYzN75U+VBEA3Bxz4gVz3UQZrlI+Xggmw/GDM3t2CRm56pg1VpVeqH5QYc9aMKfhAZkU2AKI715rN5+iEqFf3/kJ0/uFoIW9Jcom9O0glZIQOcNE0BdPT53txZzr0J/WGvkXxCSY00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ighTY4LY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90CEDC4CEC6;
	Tue,  1 Oct 2024 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782996;
	bh=kdOhicYRP+Af5pJK9ojcMdnLO0Tz2ve669IOTmMN/5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ighTY4LYYcsYAgYz1pVX3GDXUV1SgifvBVb9rjpmhVSw9JoYWc7ygT8ELMmp2VZ6i
	 ZWsaHPCV4EqEiS9oCxuKbl4LDqrm51gqzKfvMjZpJjDr/f5FM9Aq4hNb0OtXQ0cgDs
	 +yVTY8oYxLjXnllkIPJg4WRmoiYrxDCMpEx5KovpDp48MC5vLS2Izu80zPR+mEKffM
	 KXMIZfNSgmiNLwQljuHPbMn5w5y2Mp8Yh70qLn9wTB3j4kkM89cTbvLq7sg9CyZcQf
	 GFDFxHG6X/u3jgtHeJtjuEGHLG9jz2e/lKKdHYK5mEMxvVkj8OJVGj7yBuJS3RkVEH
	 KcXTCEvtAVLVA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1svbHd-0000000Adcs-3Buw;
	Tue, 01 Oct 2024 13:43:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH RFC 1/5] acpi/ghes: add a firmware file with HEST address
Date: Tue,  1 Oct 2024 13:42:46 +0200
Message-ID: <e8cb64741000b49ec53e70c30952ed845b7d403a.1727782588.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727782588.git.mchehab+huawei@kernel.org>
References: <cover.1727782588.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: oFea5Lc85E7C

Store HEST table address at GPA, placing its content at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---

Change from v8:
- hest_addr_lr is now pointing to the error source size and data.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c         | 15 +++++++++++++++
 include/hw/acpi/ghes.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 8b3292be07e7..2c2cf444edeb 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -30,6 +30,7 @@
 
 #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
 #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
+#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -361,6 +362,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 
     acpi_table_begin(&table, table_data);
 
+    int hest_offset = table_data->len;
+
     /* Error Source Count */
     build_append_int_noprefix(table_data, num_sources, 4);
     for (i = 0; i < num_sources; i++) {
@@ -368,6 +371,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
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
@@ -381,6 +393,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
+    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+
     ags->present = true;
 }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index e47ffacbb5c9..a07c30ef13b7 100644
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
2.46.1

