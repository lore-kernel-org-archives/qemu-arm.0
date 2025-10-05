Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073E4CAC5BB
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Oct 2025 19:23:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5UDz-0007fH-5f; Sun, 05 Oct 2025 15:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UDw-0007cl-TY
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:16:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v5UDv-0006Q1-6p
 for qemu-arm@nongnu.org; Sun, 05 Oct 2025 15:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759691806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AZLZ+M4Z2xFSAdN3unBr09StgBtq20YTeJFuMTz8nds=;
 b=LRpwUIapORilB1VDCz18N+YZfF7m60J/YMjRORN9zLrJpkw+/rGZr+X5IErIJ4ILrCgD+1
 7lOk3Hrx9pSvDfSDqhTz/9dmB8WQ3cvkjSzam0ZriSVCnFCK9IIOCqaSxIxUHTbIz4uIeX
 o2jRba2V0wK4jQKpuAdFk8Y5Jz72BPQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-485Zl_86OZul0Kscudp8ig-1; Sun, 05 Oct 2025 15:16:43 -0400
X-MC-Unique: 485Zl_86OZul0Kscudp8ig-1
X-Mimecast-MFC-AGG-ID: 485Zl_86OZul0Kscudp8ig_1759691802
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3f4fbdf144dso2262785f8f.2
 for <qemu-arm@nongnu.org>; Sun, 05 Oct 2025 12:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759691802; x=1760296602;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZLZ+M4Z2xFSAdN3unBr09StgBtq20YTeJFuMTz8nds=;
 b=VeJDlsr6FJInVTFxp7Kc9gIVpdf1qEhc8viTM5v2Z2BCHKn0SwAZD/4ZkuLBJg+oC5
 9svXWgIeLeep4pwaucDuZUm7+4PHJG2c42vqPcSeWwrtt8I9OujA095lEuYBK7Rzl2M0
 5STsmFQHST35wSx+hZQjWPGp57W5Kgtn7mA0jm3JuiIGRsc8eik6HVsqtgdHxVDcCvbB
 R9f7DQRCgiYIYogyFm1rGrG5vSmX+QeylMEq/BL2qMXgLviTuJA4DWEqgKUiOkT8Jnal
 MKkrvoqgIdMRDG0KS0LyKpfKEcFgIBd/eHsWkqMVixg22q/dLiw3lguU8WaDhxlUAhsp
 dtnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjLnGpzEyFzAlycckqlTtRXYU18uFPa7bBROrFplh4EMMhbVLTF8E51wSTZzxk4wdJV1yl4TP15g==@nongnu.org
X-Gm-Message-State: AOJu0YxV7LDx3p2JsMCjahI6+cXECqAPn7OyFmg4MWL56IyrZd9jcC1k
 YHnbszar5n7e1p7CTy6XuJetTVFRLl+jV8QS0743rNtr1RsmhWUYU8DMMvnAm8oFLQkoD4GIOsD
 YK8cXzB4ly4OX6YhYJFyZ13fgke4E+Dgm7RZLSeU/Ym2Is05yfe193g==
X-Gm-Gg: ASbGncsd1zQGC9P4RK9OX5JszZ5hZUK7lUXcfXrG74cvGl9y6VE+/+YYC4xogXmw6w0
 UEIYe6h6qCTbWGpOf2UP5/vjxSi32Y214hyVVX0ht3tv+v+KGOJ6wtDuQ77+Hg6l1mObUgekHGs
 I4UYGXeYzdLUW0ApcS5MurqMuRqWzf70nsQlIQaJxed5sW64aevpI9DEP4UftQaQk1pEyVFQqpx
 0L541rHkzMsF2bxJ3PsKoDaU9OgIERf6RpL89UFzG6n6mtfLWMaHoIBeL9AYxp5YmJeF/RyDWGN
 2ttdl14fTVTZPCIEuEPjCEUPfc4QG+DLHDKmG10=
X-Received: by 2002:a05:6000:43cc:20b0:425:7c32:d969 with SMTP id
 ffacd0b85a97d-4257c32d992mr829337f8f.5.1759691801877; 
 Sun, 05 Oct 2025 12:16:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP7tfgvID6SOJgZXvKkqaQKcHp8TAH3rrVIqIv+O3sexk1yHIzj9ICdRWYNoiwkIJ62fOP+A==
X-Received: by 2002:a05:6000:43cc:20b0:425:7c32:d969 with SMTP id
 ffacd0b85a97d-4257c32d992mr829318f8f.5.1759691801312; 
 Sun, 05 Oct 2025 12:16:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1518:6900:b69a:73e1:9698:9cd3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8ab960sm17424352f8f.13.2025.10.05.12.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Oct 2025 12:16:40 -0700 (PDT)
Date: Sun, 5 Oct 2025 15:16:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Ani Sinha <anisinha@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org
Subject: [PULL 17/75] acpi/ghes: prepare to change the way HEST offsets are
 calculated
Message-ID: <2e9c5c5bc85a4f79a5e5c9d52df6c62bd1b2e116.1759691708.git.mst@redhat.com>
References: <cover.1759691708.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1759691708.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kol67l1DcNfEh1awJqPhcMqgFFDmve4MMmeOV9Wa8RU_1759691802
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.43,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Add a new ags flag to change the way HEST offsets are calculated.
Currently, offsets needed to store ACPI HEST offsets and read ack
are calculated based on a previous knowledge from the logic
which creates the HEST table.

Such logic is not generic, not allowing to easily add more HEST
entries nor replicates what OSPM does.

As the next patches will be adding a more generic logic, add a
new use_hest_addr, set to false, in preparation for such changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-ID: <f5de17bf04b27828e1a439ad396b4f7982eaf156.1758610789.git.mchehab+huawei@kernel.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/ghes.h   | 12 +++++++++++-
 hw/acpi/ghes.c           | 39 ++++++++++++++++++++++++---------------
 hw/arm/virt-acpi-build.c | 13 ++++++++++---
 3 files changed, 45 insertions(+), 19 deletions(-)

diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index f96ac3e85c..411f592662 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -64,11 +64,21 @@ enum {
     ACPI_GHES_ERROR_SOURCE_COUNT
 };
 
+/*
+ * AcpiGhesState stores GPA values that will be used to fill HEST entries.
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
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 84b891fd3d..9243b5ad4a 100644
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
index 96830f7c4e..bbe83fab9a 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -1181,9 +1181,16 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_dbg2(tables_blob, tables->linker, vms);
 
     if (vms->ras) {
-        acpi_add_table(table_offsets, tables_blob);
-        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
-                        vms->oem_id, vms->oem_table_id);
+        AcpiGedState *acpi_ged_state;
+        AcpiGhesState *ags;
+
+        acpi_ged_state = ACPI_GED(vms->acpi_dev);
+        ags = &acpi_ged_state->ghes_state;
+        if (ags) {
+            acpi_add_table(table_offsets, tables_blob);
+            acpi_build_hest(ags, tables_blob, tables->hardware_errors,
+                            tables->linker, vms->oem_id, vms->oem_table_id);
+        }
     }
 
     if (ms->numa_state->num_nodes > 0) {
-- 
MST


