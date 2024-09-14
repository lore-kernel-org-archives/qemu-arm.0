Received: by 2002:a05:7022:4195:b0:8a:132c:44a7 with SMTP id i21csp213435dli;
        Fri, 13 Sep 2024 23:14:01 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXktqXbkwBZpHuF9bRfEn5F36QpVVtOA2rvjdHNO1nulHkEkrbtT1ssjio26AUCOyqlPbw03MZHHUmE8g==@linaro.org
X-Google-Smtp-Source: AGHT+IFQYxiMPogg4W544A8vYXDhUJ9HpBmQe/jnzKftWMyTT0WUD4M2/53kgpHsur/MNQBu146e
X-Received: by 2002:a05:6214:3215:b0:6c5:1fe4:c642 with SMTP id 6a1803df08f44-6c57e11a9c2mr98855156d6.32.1726294441146;
        Fri, 13 Sep 2024 23:14:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1726294441; cv=pass;
        d=google.com; s=arc-20240605;
        b=ThgLdAq71QugPjyoRVJBF+aQAYOttt9ju9yi4r/26/m4fiqYnwjx3eRf0CBfxvAV4v
         HjKKeXRfczm1viWgD8f/ecJIczWpNqgfJykqCaldMZCDWcsScicupUbbwbKaYGS2Mr76
         trMMA2MoBYk4LjyEXu/5TZVGav18dl8NgHBsabsVwuef5ptNNTFCpOC1nNy/2DfYf3bq
         2yJexvHDIfyv+gxl4/XUWEcQ6R9hGx3LoMKRntzkL84Yw5tNvTxlYfp8ryZnt2CErKst
         pQtyAq6ywomds5BzClpF2d7AepfB+mZEmBZGfVgT/GtaICA35fTF92vSP+chNPzY7ztW
         Da9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=KXkxlOnXQzOVYz63GT4mulG09K5HKEAcKYp74NCGqvk=;
        fh=cHr103FZjxYpnzWV8HEdBbSUHzARr8y7HHMCd+4YRdE=;
        b=N4BuLd5jfbYCvaNjQ6UJ+K6dZ9Oh1/5auF71jRLoX2T8GHg3L23YrkJjQKKjI8r9OL
         08gmmSwqmoFWvX5w74zmOck//ae8NPCFPd8h+YaAujzONH+94WTfhBqACixelqXdWiJg
         Plu4QRubl3rtGt+5tfHq+8fPnyJDI7tuIWkHD2gPBfnmWHaJvJNWRgIBtbP6badD1eoy
         cW1Z1RUS1V0uilj3GBG8tKXh7O+PlqvpW/gr9hEY2m6XLOFWEh1GpuIxDSOna8puWB/s
         PFyNSsQks0UFnQoNTHhmqO3b8Lys559GDsxt+WLQjQ/GEFA6BklICA/jGTKtdttQFcE2
         GOFQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=LcxPAgOj;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-329159-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-329159-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-329159-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c58c7da937si8753086d6.441.2024.09.13.23.14.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 23:14:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-329159-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=LcxPAgOj;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-329159-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-329159-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC0651C2276E
	for <alex.bennee@linaro.org>; Sat, 14 Sep 2024 06:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B08DC74070;
	Sat, 14 Sep 2024 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LcxPAgOj"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965C44C6C
	for <linux-kernel@vger.kernel.org>; Sat, 14 Sep 2024 06:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726294434; cv=none; b=ccNdShQ6OgRgiYJDqxdLl2+51Fa809kdeFXajQlCoHnbY/QAJFHrqRLQtQN+i2qLSnQvkxY9m6eaTZp5pN0msi2O9fpfmuyKgtWJMcHT3E6+OfZ8dLYRLoKiB6DTHEEeZvW4W1FiEYLsdfPI0GlgwbeQ4AkzfleWTR47tSVRHxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726294434; c=relaxed/simple;
	bh=F0qnJx/PoKaPj30Cp4+WRbszXY9gXdj1bVnXeMrR5KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0UmBQaBsEnScDreC4pHaualkjo2qXtt1w7BDVuK3BCO9uuSUqGkuIhCJNAIfX1BTZ6jQLl0Y0SCBUYNH1Rv/0Zukjl2tgHwmxLYjRUwED3Il9Dx/jGWeDxQsGokiHhcW9ulheSBminjdMQ5p0YRsOyiJiye2IGOkfqeq/pIs7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LcxPAgOj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E1AC4CEC6;
	Sat, 14 Sep 2024 06:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726294434;
	bh=F0qnJx/PoKaPj30Cp4+WRbszXY9gXdj1bVnXeMrR5KA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LcxPAgOjxfSmV2IyvVBQclZyWDNC55ptVWqIQNldJiMIyT3tbT2SFc5uAwKtnxIsn
	 zZ0Tjvh7sej8yxzNWELr/8klgNWevRUco+6tDG5qFjGkysI8JcoBbp5DRuxT8k9d9W
	 xklWPXAxe0SgDGNDuZaC+lJ/Hx5gnkX1PVtRwrW98LBLrDCkl3V3kXG+0Uv0G6ZwUo
	 HC6lNWMEbUJSjs5y9jTv7cMNONvcB2856ywyMRO6nCE/7CMIoGDcLeO2UJwsm6Sf4r
	 xsKWBiuw3aZtSKDEDOQqKdGYD+n2ia7eH7T+B3Yx2GujgAjxj7FdDROv7x+pH5i4/t
	 xMeIiSRmFq78A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1spM2Z-00000003V5T-42V2;
	Sat, 14 Sep 2024 08:13:51 +0200
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
Subject: [PATCH v10 01/21] acpi/ghes: add a firmware file with HEST address
Date: Sat, 14 Sep 2024 08:13:22 +0200
Message-ID: <a1dacc20d1a2e6fc0031f957863750bd6132f423.1726293808.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726293808.git.mchehab+huawei@kernel.org>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: oP2NvxY1JoNW

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
index e9511d9b8f71..529c14e3289f 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -30,6 +30,7 @@
 
 #define ACPI_GHES_ERRORS_FW_CFG_FILE        "etc/hardware_errors"
 #define ACPI_GHES_DATA_ADDR_FW_CFG_FILE     "etc/hardware_errors_addr"
+#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -367,11 +368,22 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
 
     acpi_table_begin(&table, table_data);
 
+    int hest_offset = table_data->len;
+
     /* Error Source Count */
     build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
     build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
 
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
@@ -385,6 +397,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file_callback(s, ACPI_GHES_DATA_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
 
+    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+
     ags->present = true;
 }
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 674f6958e905..28b956acb19a 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -63,6 +63,7 @@ enum {
 };
 
 typedef struct AcpiGhesState {
+    uint64_t hest_addr_le;
     uint64_t ghes_addr_le;
     bool present; /* True if GHES is present at all on this board */
 } AcpiGhesState;
-- 
2.46.0

