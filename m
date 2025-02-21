Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp327300njc;
        Fri, 21 Feb 2025 06:35:44 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCX/YJgqKf9SVwbHQz18VDlD4WdE/fZ+c3XZm/Cooa32v6f7Aro1OO8sZi9wkoJa4s7yuLjwhYsvrGLsgA==@linaro.org
X-Google-Smtp-Source: AGHT+IH6aXccDH7eRkk9tMNsC6nxOT3WOuVd9NDF9W4RRsKWfIjO4k6l5Bo+xWM/6Gn4IKY49vnl
X-Received: by 2002:ac8:7d0e:0:b0:472:1d98:c6df with SMTP id d75a77b69052e-4722490931fmr45106881cf.52.1740148544282;
        Fri, 21 Feb 2025 06:35:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740148544; cv=pass;
        d=google.com; s=arc-20240605;
        b=B5ttuSjXsHHeFKJ11OewdzVGwyhxGF+TDzzjKjqiPPTYSRzpGGurMJfObrvkGsiwP+
         JZvQDBtCWJCuvcAmglKwr5eBISX4xCrGsOAJeUaRrbX5Ka6Bw0EAd4uf0iMst1eWuNUA
         3uv7Umf3/Adf5hoWrHsk4ipnGJ6DE+FH0KsuYj5uTfsnGeiMF6tYXJJQV6i4Fn9IcxOG
         MFfD+U3C76f4lH18YHiWTN3YD55MRdXr/c6AZ75yW2bbUQaRFWh//tGdCkBqVkt9dDvp
         DQu+oZnZTpez/OLXo970d2apaxFTf0HR3o3IEkmBOWN1ISHInZLV6o4EUcVbmxzXcP+r
         vlew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=iFkoPo8unJoPw/iAo3owD11F4AOetBjtdH0pgzkZcIs=;
        fh=M7BIFN6MARWKkWyrZnacp989sIldlEKVCOu1j14z3wo=;
        b=Ni6C4JqQ+XPwhrtwXZF+EOjo1pra67Qd0FUMjfGHYe6pZ9NKvPSJFxMZX7W6nOC+qP
         /uZUWw9/WAyoUYRakZUVzasY1+c0AFc/3zTm2zuI3U8XZ8fKuPO28SDM4V9/1bScw41w
         LXfO33PFtJ6yaKhmEbVjd0K+5lDsdOw7cyyMFiezpnUZwXZacSUMwXPlXW9nAYwrimqZ
         zS7nusjJaDIHfKMWRlnXIvlz7IJ1M5QtveFgfnIxqyG6qcTwvi/1T1ij4wm8taSMMCNF
         R52HfBJnYL/9KbGu83T92l6mTBY/S8Wod0771OORuhtiiSO9M8TaWLVUqheFA6Qisi4y
         fl2Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Af9UKcJu;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525919-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525919-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-525919-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-471f0c61219si95265841cf.501.2025.02.21.06.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:35:44 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-525919-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Af9UKcJu;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525919-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525919-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A65F174253
	for <alex.bennee@linaro.org>; Fri, 21 Feb 2025 14:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C4120FABA;
	Fri, 21 Feb 2025 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Af9UKcJu"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012BA20D4E4
	for <linux-kernel@vger.kernel.org>; Fri, 21 Feb 2025 14:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148536; cv=none; b=ArFWwBSVtc3DDdYl7cKpUkyNbbhSqcTXYsEz9RLRGG7TxZI0038ZPBXmGCIk8daWEasgsAJObnBOx2Fe7wMEPlkWXBM7TGev6uok0k5lsIIGXVTeBYEnyZngwJat0ettCl+Lqsu2Lqg9BIp+cMLBd9pIjtiRhiHuD67OAWZhyUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148536; c=relaxed/simple;
	bh=pzXHCfCjh+mWYwhpCslFOQSI+EmLcxETX3FcgrxN5mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0+j/+DlS7vsk7Z0NyVXU7vl6NBXWiMVff/qh65CkoR3TEu4tOkghjOUjkeDPaZlivZ1Sq1uhBBggfWJHkRYpRAcWi4B7wsi4ClloCJ18j6I7UyAM6lHfz6vTrzKnhG01nHSvFReBDt4vIQMAVDkWMfRtkdj+ETtrz34b+o6Bag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Af9UKcJu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6E6C4CEE4;
	Fri, 21 Feb 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740148535;
	bh=pzXHCfCjh+mWYwhpCslFOQSI+EmLcxETX3FcgrxN5mg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Af9UKcJuSFoZDPBO6Q98XEdVaBdYd2ePnlUA2RN7EipKTbDxwkjsTMCcwh4+zuXnW
	 EbOvnjO8yiyumYKQYavB2BD9lA4B/JVI9ZQlLdSRkOGQNVewFVbLkgLXuxDeJMqe6o
	 eG7p7ZlsZVO5dszftcueSSkEIVO0KdjFsCpOYetzlJTetQnxfruN2xyvT2vqTEEuKy
	 8ob5ufhif7SR7JWY/YxDkhKh3MgZZ2d4SfZtMedC/tpky7NPuV3+NinVvkc0oGpNzq
	 y4+drOdat/EtmGE7ek4V/m2dQqP8zb0cZ07XAsC36Xyr+h6dEywtM/VnKMTTJfXE2j
	 ofBrGs2XtXOyQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tlU7m-00000002jDb-2SCb;
	Fri, 21 Feb 2025 15:35:30 +0100
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
Subject: [PATCH v4 01/14] acpi/ghes: prepare to change the way HEST offsets are calculated
Date: Fri, 21 Feb 2025 15:35:10 +0100
Message-ID: <9eeaabf88e7ddc4884633702b7bc419075975bc8.1740148260.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740148260.git.mchehab+huawei@kernel.org>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: xTswegXcd2MJ

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
 hw/acpi/ghes.c           | 46 ++++++++++++++++++++++++----------------
 hw/arm/virt-acpi-build.c | 15 ++++++++++---
 include/hw/acpi/ghes.h   | 14 ++++++++++--
 3 files changed, 52 insertions(+), 23 deletions(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index b709c177cdea..e49a03fdb94e 100644
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
 
@@ -357,11 +361,11 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
                     hardware_error->len);
 
-    /* Create a read-write fw_cfg file for Address */
-    fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
-
-    ags->present = true;
+    if (!ags->use_hest_addr) {
+        /* Create a read-write fw_cfg file for Address */
+        fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
+            NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
+    }
 }
 
 static void get_hw_error_offsets(uint64_t ghes_addr,
@@ -411,8 +415,11 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     ags = &acpi_ged_state->ghes_state;
 
     assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
-    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
-                         &cper_addr, &read_ack_register_addr);
+
+    if (!ags->use_hest_addr) {
+        get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
+                             &cper_addr, &read_ack_register_addr);
+    }
 
     if (!cper_addr) {
         error_setg(errp, "can not find Generic Error Status Block");
@@ -494,5 +501,8 @@ bool acpi_ghes_present(void)
         return false;
     }
     ags = &acpi_ged_state->ghes_state;
-    return ags->present;
+    if (!ags->hw_error_le)
+        return false;
+
+    return true;
 }
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3ac8f8e17861..8ab8d11b6536 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -946,9 +946,18 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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
+        if (acpi_ged_state) {
+            ags = &acpi_ged_state->ghes_state;
+
+            acpi_add_table(table_offsets, tables_blob);
+            acpi_build_hest(ags, tables_blob, tables->hardware_errors,
+                            tables->linker, vms->oem_id, vms->oem_table_id);
+        }
     }
 
     if (ms->numa_state->num_nodes > 0) {
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 39619a2457cb..a3d62b96584f 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -64,12 +64,22 @@ enum {
     ACPI_GHES_ERROR_SOURCE_COUNT
 };
 
+/*
+ * AcpiGhesState stores an offset that will be used to fill HEST entries.
+ *
+ * When use_hest_addr is false, the stored offset is placed at hw_error_le,
+ * meaning an offset from the etc/hardware_errors firmware address. This
+ * is the default on QEMU 9.x.
+ *
+ * An offset value equal to zero means that GHES is not present.
+ */
 typedef struct AcpiGhesState {
     uint64_t hw_error_le;
-    bool present; /* True if GHES is present at all on this board */
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

