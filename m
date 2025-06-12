Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2421893njc;
        Thu, 12 Jun 2025 08:19:33 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCU6cLgegCFPGxggzo1tSpS9c5fEipzBW3HXb5/qZGtl1sG2Lf6iJQcCEjU2CzQbLVS8RU8KcDOiAq8vrg==@linaro.org
X-Google-Smtp-Source: AGHT+IECo46/MSOsMo2x8Y4zx5hb18FUVYAv3HvEvPbmRNvYYzW8OJO+3KScLgykhjSDSV/aooF6
X-Received: by 2002:a17:90a:c2cc:b0:311:ff02:3fcb with SMTP id 98e67ed59e1d1-313bfc03a3amr5425169a91.28.1749741493372;
        Thu, 12 Jun 2025 08:18:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1749741493; cv=pass;
        d=google.com; s=arc-20240605;
        b=jpFoml95m/w85UUY6z1OaM9SI7CCnklB7gXLyeTqXgXrJlgHSOWrzNadqBlF2WrNu4
         FmDms7b5iRrN1jOIKGCTvk6HE3y28sQtv1i0hRcppzOCkS25Qh/5cj43x5ZipcU/18ve
         SIlI4reKB4FB0uGS/Bs1zgnAID3fJNINX9B9BPciDDG1TTTYIp6eAwfPf/hZ0vofz0hz
         vJs/QHWJVQHBBOd3RclCxoOVlYa7fNJwNxWLaRRIfWIpQNpByZB08RQA+uTD4SBDxb8/
         AmR6muVSdlK/A0BM4ydx19DM8JjmB7Chv1gZzVpxqZicGJo6vTOw8Vw4uJkdH3DlRwV0
         t7ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=qEcQpPok6KdwBcXMmE7FNWmpUp+RvtHBqJADTsW+0l0=;
        fh=hTLU5mNQKwnri22ef6rNORXQEnayYeGogGHi7V9gOk8=;
        b=G1+2cJEb0oBtvyriReScsv5FFoknj33TI8XGs+sjy66qSuA2SQ9DkVikyd9pget1RX
         7g1tH2wuRLd7Vo4bLsfQBRq7LAh0Aorp4TFAxVUbtXCakAXkOouyRJxHLUFErzsnE8TI
         tVFYY9ukpJD9A3820M7AY2bCHxdeX13hmxYVpR35mK7hb1mzmo0uoN2KurKvE7Koqnl4
         DSmljZA8aGQy109ZPgxJOpyeVX4Hx8qJ+Cwq4+d7fHSj6rUhpu7gVzTJiuBLt1FWwKqQ
         iMJ+COUdSQJvmAD3aTgj4qGExhZ4xjdLfu3KoCTbMpecpAV+WhZhPiM5Tz4dbyfsytNU
         3ryw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=q1SxZrup;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-49280-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-49280-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <kvm+bounces-49280-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-2364e719fecsi22753485ad.430.2025.06.12.08.18.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:18:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-49280-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=q1SxZrup;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of kvm+bounces-49280-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-49280-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEAB43A6B37
	for <alex.bennee@linaro.org>; Thu, 12 Jun 2025 15:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC21298CCD;
	Thu, 12 Jun 2025 15:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q1SxZrup"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACFA298990;
	Thu, 12 Jun 2025 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741469; cv=none; b=JCSSg7hwJFwgIlG3lbYBA4yf/K3iuqjT06UX82pM8cosBeMX2HLDt4v2sqQzut3SIUW8K2b4rjzP8I4Vfolxgv7CCxbkaCyuoici1l7UwF4mkVgnvDs01EEvHDBKOxNNoHv/ynG0USJH/5nJ6tssruP4qMKlBDQnQdP1su+kN3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741469; c=relaxed/simple;
	bh=1N6hea/7ukAd+5GaVGFyPu+VhER4xnCVrmTaiBTUYb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cVSWcng+XnM+msm0rhStyVpmBfca9Yc6L1hLckin/NgTQPbxMXaVjz0Kltf6/l7QTK9eHeVlgccNIfrJFX0urcRbGOxGrMIbbmiztDe0SOOJrLmxVfqEIqomaAiOqjBlL1N38YHaKKWa+FyEcFONCOIdsxwlnsfsfHSykOvdgiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q1SxZrup; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4755C4CEF7;
	Thu, 12 Jun 2025 15:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749741468;
	bh=1N6hea/7ukAd+5GaVGFyPu+VhER4xnCVrmTaiBTUYb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q1SxZruptAuOs12qvd0H6OJYiEgDdo1o9oOAmryeNL7p3uIJqa0mmYenyB3220wBq
	 /HguqattQkj3gDxcd5lMFZ2mpZ6RcHP2tdK2vxbdqDinzO3csUKXz8qmVSRhj/rjhS
	 PSv5CJVD/zN5vL3Tbjpw2Y8/lbjUnxocLgE0JDCNwR19z1D58hmc6lghZng5Kox2yU
	 abEN+wEH5KYessJpqAI08GU7/Ff2RCMWIvY91DaH4U/1FFOriSbBB5x028O0TOR+zG
	 F9rEgcO6gt9PSspNnYk0QfjvyA+pUESYYeGNiYEbbpeB2rxtxw4uTFnAiILVmFnYCa
	 urGfR7oRvAl7w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uPjgZ-00000005Eva-08Z2;
	Thu, 12 Jun 2025 17:17:47 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Ani Sinha" <anisinha@redhat.com>,
	"Dongjiu Geng" <gengdongjiu1@gmail.com>,
	"Paolo Bonzini" <pbonzini@redhat.com>,
	"Peter Maydell" <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Shannon Zhao" <shannon.zhaosl@gmail.com>,
	"Yanan Wang" <wangyanan55@huawei.com>,
	"Zhao Liu" <zhao1.liu@intel.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 (RESEND) 07/20] acpi/ghes: add a firmware file with HEST address
Date: Thu, 12 Jun 2025 17:17:31 +0200
Message-ID: <31b533ac65fa4746ff3f21e74acf2ab1a78d8b7d.1749741085.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749741085.git.mchehab+huawei@kernel.org>
References: <cover.1749741085.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: +FSLBiMDu7hG

Store HEST table address at GPA, placing its the start of the table at
hest_addr_le variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/ghes.c         | 22 ++++++++++++++++++++--
 include/hw/acpi/ghes.h |  6 +++++-
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 9243b5ad4acb..cbc96c1909f0 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -30,6 +30,7 @@
 
 #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
 #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
+#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
 
 /* The max size in bytes for one error block */
 #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
@@ -341,6 +342,9 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
 {
     AcpiTable table = { .sig = "HEST", .rev = 1,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
+    uint32_t hest_offset;
+
+    hest_offset = table_data->len;
 
     build_ghes_error_table(ags, hardware_errors, linker);
 
@@ -352,6 +356,17 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
                   ACPI_GHES_NOTIFY_SEA, ACPI_HEST_SRC_ID_SEA);
 
     acpi_table_end(linker, &table);
+
+    if (ags->use_hest_addr) {
+        /*
+         * Tell firmware to write into GPA the address of HEST via fw_cfg,
+         * once initialized.
+         */
+        bios_linker_loader_write_pointer(linker,
+                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                         sizeof(uint64_t),
+                                         ACPI_BUILD_TABLE_FILE, hest_offset);
+    }
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
@@ -361,7 +376,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
                     hardware_error->len);
 
-    if (!ags->use_hest_addr) {
+    if (ags->use_hest_addr) {
+        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+    } else {
         /* Create a read-write fw_cfg file for Address */
         fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
             NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
@@ -484,7 +502,7 @@ AcpiGhesState *acpi_ghes_get_state(void)
     }
     ags = &acpi_ged_state->ghes_state;
 
-    if (!ags->hw_error_le) {
+    if (!ags->hw_error_le && !ags->hest_addr_le) {
         return NULL;
     }
     return ags;
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 411f592662af..ea9baab764e2 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -70,9 +70,13 @@ enum {
  * When use_hest_addr is false, the GPA of the etc/hardware_errors firmware
  * is stored at hw_error_le. This is the default on QEMU 9.x.
  *
- * An GPA value equal to zero means that GHES is not present.
+ * When use_hest_addr is true, the GPA of the HEST table is stored at
+ * hest_addr_le. This is the default for QEMU 10.x and above.
+ *
+ * Whe both GPA values are equal to zero means that GHES is not present.
  */
 typedef struct AcpiGhesState {
+    uint64_t hest_addr_le;
     uint64_t hw_error_le;
     bool use_hest_addr;         /* Currently, always false */
 } AcpiGhesState;
-- 
2.49.0

