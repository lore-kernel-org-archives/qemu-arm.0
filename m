Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp141402njb;
        Thu, 27 Feb 2025 03:05:39 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWBCKPVaMe/zMGriT3j4dE2tvnaVILapUPLUNyLYAsUy0dccD3q5XUkMe00YlzPlwBk1wxIujuh1Sf49A==@linaro.org
X-Google-Smtp-Source: AGHT+IGGtApyRixHSTiS30DtfDbaJqVs36lbFzaYYvROXENEJin7BIoD8UpZy8ZCrKnJEPDlVmu1
X-Received: by 2002:a05:6830:6385:b0:727:11be:f4ae with SMTP id 46e09a7af769-728a50c22ecmr4476212a34.3.1740654339543;
        Thu, 27 Feb 2025 03:05:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740654339; cv=pass;
        d=google.com; s=arc-20240605;
        b=a6XzqbzmQpl1u1vI50bEsyA96fqh+3GhEpx6zaPDC0kIsbQk+rp25Z5oMtwSUHW09G
         /nJ2K4+CNzVvEGjouTPRdZeJVi3C8uxRBljN2iR/jFd1t8lwqYI6CXVc2WDEuZecvo+t
         1Ex1eUQs21q58gNM53jGhPtD5LeOoTVfIWzXUaIdAQKDiP1EiyzBK88GyO1Dz00HiJyw
         q4Ddf86HXJ1pYYtuvSNw604VMRxJZexeGGVjB3YCxIJ/o77lhxVI9cEplnGdyBX8WRz9
         nqneVNmiwk/DLcSjaZ4yVHS7poSx8+stRQJue448w3CSLXAjeWZY/Vpj6PGoOz380u7r
         TOXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=/rgJjZifLRexnrR+l2zV0P1pKla+6zDGNE7mM4kyyiw=;
        fh=M7BIFN6MARWKkWyrZnacp989sIldlEKVCOu1j14z3wo=;
        b=ZXK/Xr1dw4dfeOUjNN0qp7lUMc0gGMKubIFBZJfaOyTDAPuRaAF+VB8sdcGkWNx376
         byBUOEW72Watbpkbd0XwBZBtQCPswUyT3Gl7GRVFVW4tfoT1uX03GdlJZLPYPO0ISuEF
         SfE0DEg25z4F8ICI7hl3l4TuDjY6PfL+K70bcnT3BwDsuxELQ4r/DYUKUsW+Xuz5sCGX
         UHo/F5/H/tBDzKvmtyWA8ITvj63jIjA8RsNuImhR82gM9ElLAypHam/Gjy4a7WoNX+mr
         zEOFkk8u4Ux0jwsl03dez9WS5if2JgsZttWGnWc2t0d5DrdqYYMK9FMdj5akisXLmDFa
         DkkQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=cSJeDe2c;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536075-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536075-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-536075-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 586e51a60fabf-2c15c13024fsi879944fac.89.2025.02.27.03.05.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:05:39 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-536075-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=cSJeDe2c;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-536075-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-536075-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 372253B3658
	for <alex.bennee@linaro.org>; Thu, 27 Feb 2025 11:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A8122DF96;
	Thu, 27 Feb 2025 11:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSJeDe2c"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BE922B5B1
	for <linux-kernel@vger.kernel.org>; Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740654238; cv=none; b=IJufWdooyzS7h4TkNzJiy+a2BG8G1CN+xZuyaUGpLbbNVjU6nJySjtgBDVh4Fofu4cEWBjlOhqkhb4R+1Gub9sX0ljZ4TUExM+7Mkibu4aZpG9fkIWNe/7v/o5jmbNh+IzY5UekWxKG6OQTTQSowHMyNCFhn8u04cpUc/KE8sUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740654238; c=relaxed/simple;
	bh=qoAwpofTgnS8pOUcQgqd+LN0vqWMRItwj30QM5CzQhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sU4+WfNDfFfYiCp1tr8Va2jIBvWlDoWQJqn7OhpcLUmx0FCmyRalpuEQUMRY5gCWD4UV7ra8Cn6HkZRbgHXR8ntu7GFVhpy72zTrwWGqA8n4PHkFH6CrluETDkbdI7T5plEPqS7btxV1DP3SYfLCHxTKkBJVuACUD7xnGMnric0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSJeDe2c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB0FC4CEF0;
	Thu, 27 Feb 2025 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740654238;
	bh=qoAwpofTgnS8pOUcQgqd+LN0vqWMRItwj30QM5CzQhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cSJeDe2cBsmnvmTv3+vNUfWfgH4cQdbhHfzx2taoyjm+lE9SoE6QL7VPSjxJYJLWN
	 +qiz5EWH8Q1A5JbHe+flAs3we3XcNKYiOrzup1qWmOm7YIzO3BnGmJcrzjIthrCpR0
	 UvhT+07No7whfLCnTMfR5ohCUCWvGRtbnI+0G04fUSLSyLsDxJRzrWKl2sD0g5r1QJ
	 WNT5rrSSs20CN/W/UUNjJ5Gt09b8kHrl+BB3h6kx+KP7L7hcv2AiX3Oe35ubHW5pTb
	 tyzXZ26RGeQfAgL5+DtAUqCsF9TasoUFRUGxViP0is9hUhAWcCtPUiRyplNG/ALVM7
	 /ISXyfbgM+fJw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tnbgK-00000001mQq-0ZNu;
	Thu, 27 Feb 2025 12:03:56 +0100
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
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 05/21] acpi/ghes: prepare to change the way HEST offsets are calculated
Date: Thu, 27 Feb 2025 12:03:35 +0100
Message-ID: <d1b8873b680b1b56ec798d25b71a1622cf1eb3ab.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: lOliITcugOqt

Add a new ags flag to change the way HEST offsets are calculated.
Currently, offsets needed to store ACPI HEST offsets and read ack
are calculated based on a previous knowledge from the logic
which creates the HEST table.

Such logic is not generic, not allowing to easily add more HEST
entries nor replicates what OSPM does.

As the next patches will be adding a more generic logic, add a
new use_hest_addr, set to false, in preparation for such changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c           | 39 ++++++++++++++++++++++++---------------
 hw/arm/virt-acpi-build.c | 14 +++++++++++---
 include/hw/acpi/ghes.h   | 12 +++++++++++-
 3 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 84b891fd3dcf..9243b5ad4acb 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -206,7 +206,8 @@ ghes_gen_err_data_uncorrectable_recoverable(GArray *block,
  * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
  * See docs/specs/acpi_hest_ghes.rst for blobs format.
  */
-static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
+static void build_ghes_error_table(AcpiGhesState *ags, GArray *hardware_errors,
+                                   BIOSLinker *linker)
 {
     int i, error_status_block_offset;
 
@@ -251,13 +252,15 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
                                        i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
     }
 
-    /*
-     * tell firmware to write hardware_errors GPA into
-     * hardware_errors_addr fw_cfg, once the former has been initialized.
-     */
-    bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
-                                     sizeof(uint64_t),
-                                     ACPI_HW_ERROR_FW_CFG_FILE, 0);
+    if (!ags->use_hest_addr) {
+        /*
+         * Tell firmware to write hardware_errors GPA into
+         * hardware_errors_addr fw_cfg, once the former has been initialized.
+         */
+        bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE,
+                                         0, sizeof(uint64_t),
+                                         ACPI_HW_ERROR_FW_CFG_FILE, 0);
+    }
 }
 
 /* Build Generic Hardware Error Source version 2 (GHESv2) */
@@ -331,14 +334,15 @@ static void build_ghes_v2(GArray *table_data,
 }
 
 /* Build Hardware Error Source Table */
-void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
+void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
+                     GArray *hardware_errors,
                      BIOSLinker *linker,
                      const char *oem_id, const char *oem_table_id)
 {
     AcpiTable table = { .sig = "HEST", .rev = 1,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
 
-    build_ghes_error_table(hardware_errors, linker);
+    build_ghes_error_table(ags, hardware_errors, linker);
 
     acpi_table_begin(&table, table_data);
 
@@ -357,9 +361,11 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
                     hardware_error->len);
 
-    /* Create a read-write fw_cfg file for Address */
-    fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
+    if (!ags->use_hest_addr) {
+        /* Create a read-write fw_cfg file for Address */
+        fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
+            NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
+    }
 }
 
 static void get_hw_error_offsets(uint64_t ghes_addr,
@@ -395,8 +401,11 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
     }
 
     assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
-    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
-                         &cper_addr, &read_ack_register_addr);
+
+    if (!ags->use_hest_addr) {
+        get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
+                             &cper_addr, &read_ack_register_addr);
+    }
 
     cpu_physical_memory_read(read_ack_register_addr,
                              &read_ack_register, sizeof(read_ack_register));
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3ac8f8e17861..e6328af5d238 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -946,9 +946,17 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_dbg2(tables_blob, tables->linker, vms);
 
     if (vms->ras) {
-        acpi_add_table(table_offsets, tables_blob);
-        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
-                        vms->oem_id, vms->oem_table_id);
+        AcpiGedState *acpi_ged_state;
+        AcpiGhesState *ags;
+
+        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                       NULL));
+        ags = &acpi_ged_state->ghes_state;
+        if (ags) {
+            acpi_add_table(table_offsets, tables_blob);
+            acpi_build_hest(ags, tables_blob, tables->hardware_errors,
+                            tables->linker, vms->oem_id, vms->oem_table_id);
+        }
     }
 
     if (ms->numa_state->num_nodes > 0) {
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index f96ac3e85ca2..5000891f163f 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -64,11 +64,21 @@ enum {
     ACPI_GHES_ERROR_SOURCE_COUNT
 };
 
+/*
+ * AcpiGhesState stores an offset that will be used to fill HEST entries.
+ *
+ * When use_hest_addr is false, the GPA of the etc/hardware_errors firmware
+ * is stored at hw_error_le. This is the default on QEMU 9.x.
+ *
+ * An GPA value equal to zero means that GHES is not present.
+ */
 typedef struct AcpiGhesState {
     uint64_t hw_error_le;
+    bool use_hest_addr;         /* Currently, always false */
 } AcpiGhesState;
 
-void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
+void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
+                     GArray *hardware_errors,
                      BIOSLinker *linker,
                      const char *oem_id, const char *oem_table_id);
 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
-- 
2.48.1

