Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp1686380dlj;
        Mon, 13 Jan 2025 05:09:07 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWo+I1p7QTMLUES9Cb4JeZ1Ykwrgi515MrooMryIzNvoCTyy7gFMKQ+Pj1MYg7twtZrrItrdeuVzi868w==@linaro.org
X-Google-Smtp-Source: AGHT+IHN3OyclydH3rR2uVzX53S+ucQ03c4ZYZzCdToNmeySTjPKiKHTIR0123f1FIzg1mLPIfCy
X-Received: by 2002:a05:6402:2548:b0:5d4:2ef7:1c with SMTP id 4fb4d7f45d1cf-5d972e639e4mr47376667a12.24.1736773746919;
        Mon, 13 Jan 2025 05:09:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1736773746; cv=pass;
        d=google.com; s=arc-20240605;
        b=HEqP2Ox5Xt17pKdBEk5y/ReqCbmeEX7ox7q7UXxXXlbHFyEy8cclquQP/YF5h1LDYz
         QjBVEzCrDfFD5DPKPUJ2/9K2yC+xCoJDU4Sl4IighETwLptgzp5CRuJaYBC66BJQMFkV
         6WjagXva3b5BzSStQ7ZVEPy98mreVJ9oxkyBWbGZ788xLCdegkG0F965ma8cGZRR3YS3
         O06pnmcaNHGttE4mIWYC7DyIkgMzEe9I3KykNKQOixf+dtoUGeugTAGpm6qJF/ISkcaI
         vsuRCSQOVXTONT9pq/oONduUgZK41MGax2TEj0TjY9cUkfy4gMc/vlMXitJLPDYMpK/N
         L3MA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=oqVaLx3UgU7jpudhCtqVJd018edA0IEb9J0mytvn2I4=;
        fh=8WKMlvHBit1egi9o2cK+ScoX/Z5fO36J0VVxubWVY0Q=;
        b=VB39rkCh4JjSShJp0qiStZscYppQtjyNfZXSqtikxsKsl/ocj3RZ++gcf1cybhIL7q
         JjNIVY6O46kcf0j8Pkq7Aa4QO08jUo0nBEfkJm2fQdhw0KlPk+e/NXBIn58Qe/jG6kTj
         +6hPlrd6J706kG0Wm0/eInvWOsD9IkGeaZgADEjTkfSOZe2L85DtztTjVC9ItqgRx6BZ
         4uWzqDwl2QlPMTYm01in+1v/7JFlehK4uTUjiLGBQ6rF5yWCT9tclIG/htEJUVNzJ4k2
         +0CpZAZLKfOEfVidbdlEdS6JPzhB+psaNHuPwoWEFJERAhN+8g8Tz4N1FPH4iZb+lGaH
         JXGw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Eo0+UWtg;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-474007-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-474007-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-474007-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5d99ef1dfa3si5334227a12.6.2025.01.13.05.09.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:09:06 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-474007-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Eo0+UWtg;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-474007-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-474007-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 656521886425
	for <alex.bennee@linaro.org>; Mon, 13 Jan 2025 13:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D05C2343AE;
	Mon, 13 Jan 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eo0+UWtg"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F81322F148
	for <linux-kernel@vger.kernel.org>; Mon, 13 Jan 2025 13:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736773739; cv=none; b=IaXrVWGK4jAkdxfqusGORfQfkmkMnvgfi4fAbK7vxkpOsfCqL7eZhscdNJkNXq2ZiAOdein4DzM8d/+N7IR8szjLVTh0prZ7oIxx77ZsLzcY1VBVMWtQeiOO3ce2sKnBjTIGeI4IaEtZZxjpzGquJNl09AirboQ5hBHNxxGo2wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736773739; c=relaxed/simple;
	bh=BRjriaIt8nkXUiP7jd2LKBVD4nrXXJI/n4Lw6ns9PTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AT0tkFHj9dmv9CjWRDI8crwmLVc/esCvcfsc9PIYtU6U1xQmwXZsyEaHDxw4MtXD7LaEzTJFbmNEK/1i0jlIt/4WdBfW7n+PS0x0XuNuBgxrocTOniqwfK/nV91eIk6Z0zPX+ciLSP7z8f7YCUDRVa1LslAYZ3D+CRGZ7H4KHaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eo0+UWtg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20C3C4AF09;
	Mon, 13 Jan 2025 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736773738;
	bh=BRjriaIt8nkXUiP7jd2LKBVD4nrXXJI/n4Lw6ns9PTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eo0+UWtgrGqXCa/LVSY34fEqGj5MRTm2dd576KpfLWsuAzXhk4iXyzEIRyKWoHD/u
	 +ehK+6cHmwQD4Lqk6RxwZb74FjO1kaqUrraemGhS9C3rawMDmoAihHgIA3AZUMgN+N
	 GgLIu7SYeJ9x4IJQW+YU4F+rFm2gAuPdCDJjcT9NQT3vbqMyitLCBuoGeh5Oxd12zm
	 PahVqp6mxff4l9z9oOSsdKCTV8AqeIfQVOzaIE79x+PZAJLsi9XHB8+klv+KPlPMnc
	 Ouu3zXpQlVNpMn13R5YrG+849no6jiJjgu2Di5fckE/IJvGdxMgUYZ+qiF47w8yNnz
	 f7MhkO/1/0XbQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tXKBc-00000003Yn9-3kdL;
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
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v4 5/5] acpi/generic_event_device: add logic to detect if HEST addr is available
Date: Mon, 13 Jan 2025 14:08:51 +0100
Message-ID: <20250113130854.848688-6-mchehab+huawei@kernel.org>
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
X-TUID: ksgOZvGz5hI2

Create a new property (x-has-hest-addr) and use it to detect if
the GHES table offsets can be calculated from the HEST address
(qemu 9.2 and upper) or via the legacy way via an offset obtained
from the hardware_errors firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/generic_event_device.c |  1 +
 hw/acpi/ghes.c                 | 28 +++++++++++++++++++++-------
 hw/arm/virt-acpi-build.c       | 30 ++++++++++++++++++++++++++----
 hw/core/machine.c              |  5 ++++-
 include/hw/acpi/ghes.h         |  1 +
 5 files changed, 53 insertions(+), 12 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 5346cae573b7..fe537ed05c66 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
+    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.hest_lookup, true),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index afcdabc76791..3119dcaa84e4 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -359,6 +359,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 {
     AcpiTable table = { .sig = "HEST", .rev = 1,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
+    AcpiGedState *acpi_ged_state;
+    AcpiGhesState *ags = NULL;
     int i;
 
     build_ghes_error_table(hardware_errors, linker, num_sources);
@@ -379,10 +381,20 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
      * tell firmware to write into GPA the address of HEST via fw_cfg,
      * once initialized.
      */
-    bios_linker_loader_write_pointer(linker,
-                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
-                                     sizeof(uint64_t),
-                                     ACPI_BUILD_TABLE_FILE, hest_offset);
+
+    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                       NULL));
+    if (!acpi_ged_state) {
+        return;
+    }
+
+    ags = &acpi_ged_state->ghes_state;
+    if (ags->hest_lookup) {
+        bios_linker_loader_write_pointer(linker,
+                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                         sizeof(uint64_t),
+                                         ACPI_BUILD_TABLE_FILE, hest_offset);
+    }
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
@@ -396,8 +408,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
-    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+    if (ags && ags->hest_lookup) {
+        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+    }
 
     ags->present = true;
 }
@@ -512,7 +526,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    if (!ags->hest_addr_le) {
+    if (!ags->hest_lookup) {
         get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
                              &cper_addr, &read_ack_register_addr);
     } else {
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3d411787fc37..ada5d08cfbe7 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -897,6 +897,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
     { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
 };
 
+static const AcpiNotificationSourceId hest_ghes_notify_9_2[] = {
+    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
+};
+
 static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
@@ -950,10 +954,28 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_dbg2(tables_blob, tables->linker, vms);
 
     if (vms->ras) {
-        acpi_add_table(table_offsets, tables_blob);
-        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
-                        hest_ghes_notify, ARRAY_SIZE(hest_ghes_notify),
-                        vms->oem_id, vms->oem_table_id);
+        AcpiGhesState *ags;
+        AcpiGedState *acpi_ged_state;
+
+        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                       NULL));
+        if (acpi_ged_state) {
+            ags = &acpi_ged_state->ghes_state;
+
+            acpi_add_table(table_offsets, tables_blob);
+
+            if (!ags->hest_lookup) {
+                acpi_build_hest(tables_blob, tables->hardware_errors,
+                                tables->linker, hest_ghes_notify_9_2,
+                                ARRAY_SIZE(hest_ghes_notify_9_2),
+                                vms->oem_id, vms->oem_table_id);
+            } else {
+                acpi_build_hest(tables_blob, tables->hardware_errors,
+                                tables->linker, hest_ghes_notify,
+                                ARRAY_SIZE(hest_ghes_notify),
+                                vms->oem_id, vms->oem_table_id);
+            }
+        }
     }
 
     if (ms->numa_state->num_nodes > 0) {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index c949af97668d..23bbc5ebcc4a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -34,9 +34,12 @@
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/acpi/generic_event_device.h"
 #include "audio/audio.h"
 
-GlobalProperty hw_compat_9_2[] = {};
+GlobalProperty hw_compat_9_2[] = {
+    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
+};
 const size_t hw_compat_9_2_len = G_N_ELEMENTS(hw_compat_9_2);
 
 GlobalProperty hw_compat_9_1[] = {
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 237721fec0a2..164ed8b0f9a3 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -61,6 +61,7 @@ typedef struct AcpiGhesState {
     uint64_t hest_addr_le;
     uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
+    bool hest_lookup; /* True if HEST address is present */
 } AcpiGhesState;
 
 /*
-- 
2.47.1

