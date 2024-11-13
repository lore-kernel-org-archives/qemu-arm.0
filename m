Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp207235njc;
        Wed, 13 Nov 2024 00:37:51 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWORGTr9GiACnkKEJXBO/bCtvycPoL8YX+CHjKmQDxfxFDt3JPs8LJFp2+BidnF8/tjhlWJjcPfHBJauA==@linaro.org
X-Google-Smtp-Source: AGHT+IEpLHCjPIOFfFqkyejy+eBFFsIQryV4koJrZYe9tamBbvbM1YWkw1hWR+LwfG+FLd9paNZp
X-Received: by 2002:a17:907:7e82:b0:a9e:c2b5:198d with SMTP id a640c23a62f3a-a9eeffdb921mr1896186766b.42.1731487071300;
        Wed, 13 Nov 2024 00:37:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731487071; cv=pass;
        d=google.com; s=arc-20240605;
        b=Ox1MQsu2QwB1gVWZiS1I8bRgpvlp3helEyZwJ2cWF9X5u/aXyTG27LbuUok+zj5iyn
         HNVytc3n30jvvNdeoYRlfruxjC4tJIw5Vw+boqeQtSAayShswziBQ5yKVOh72+jK7Ou1
         2k/XSUU2SvW70vRCJ/dwy8CuajV1J7r67aWPFv1nnyonttw20xMpz+UqQZT7YYYO94Bb
         XnZP6r/41a2NL9+oC9z3hArR4HdGtB/HvglO+KSV89B/32xE6UTWukhkyh63X5n9h2Po
         ntsWa/TR8TOm3iTW3Fl90cozT0SmJqmjlXTE1/SY0vb/ANY25778g+XPZxfNvXnoU2WZ
         IYIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=PIQ7J+afDRfB8vv7REoULt0/U3ieyd+3OTo9W9enwAE=;
        fh=CRs7z0tjeZ1EnV9xVnQmMZKD2ZnYvmmZpCmDuBC5g/0=;
        b=dNyF6BM9b6Z/XBdKPFBwkGihpXvJvVGHG9ZOkCTbSDQI2i4UJrJajTcjO1Cj6AiFJK
         XXICwlLd76p7c/7BOdGEktHOWL0QoW2xnWWV7VZd6mZ+MAI5ZemxQUavutcnQ1MwWJrd
         o6e0lmcdmtrr0A9PMlrBp+yyDLLCR2iaIcvmJSmSb7WB4GXgwYAafJCJPR/GKL6Pi+Nm
         VAcAMVS5Z7NTpt67G57b8yFYs8ULTnBANLYtWmthrFyi8RGnIIjuTMpiD3qGPh//6NOJ
         KXdq8SmU+pApWBe5/voXT8Jf0KwzV7lU2yFK/KquyasCtTYO//+yt8SWcFS+NpypnTqv
         ooSg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="NypOU/VA";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-407241-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-407241-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-407241-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-a9ee0e0ee72si905935666b.674.2024.11.13.00.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:37:51 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-407241-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b="NypOU/VA";
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-407241-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-407241-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2D071F242BA
	for <alex.bennee@linaro.org>; Wed, 13 Nov 2024 08:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC69018B478;
	Wed, 13 Nov 2024 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NypOU/VA"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A495B18A947
	for <linux-kernel@vger.kernel.org>; Wed, 13 Nov 2024 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731487058; cv=none; b=nlU8X9pLXsrhaPew0AXB662tCuGYsuhG1n354rhH+U33eyjeB+zbteXGfr5hcLrZ+y/u9wQAjcG94AztkJe6LQHOoDYbu+FkYwSq89NLgB5YXCLcZtogDRrYFdmihg/sH5HuvqrYA7rOrVg8ULEjPnRiDsGCuoNq8lm4/XZZuXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731487058; c=relaxed/simple;
	bh=/iAxRTnw7vCpxt41/a6sF+wbxF47+a06+AruAFNnzSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0WImVe9uGNgKlejtHHOXiYigzgZSkUXG/NQaZKSzMSqiWVTUWBSb29IOrgTJpg167MqCVen2ifzlKE6Lv9Etz6zz85HUxidVVRgYOtVc4iWv+hS/0TpvM8RDZoJq4j2LnGLKWaJnr6nqx9rjkJMiXC+LxHhDjGYHunvN2n1XAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NypOU/VA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59183C4CEDE;
	Wed, 13 Nov 2024 08:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731487058;
	bh=/iAxRTnw7vCpxt41/a6sF+wbxF47+a06+AruAFNnzSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NypOU/VAZkWbjlGShSU5D6T9SfMSDZylNBKKldk9mxYWIA0O32AWZqsLkhCpCUoxC
	 yOrxQooMkmxpvZY3dTrz2SVmQKW6VdL+Z6V3u7icsby+45VF3qbfQS9E0AmHEgO78R
	 G4AGA3Mab3+dBkJcu/cTOdqv1ZirxVwCF+3WgWR8Cdlb8PvtPWHIGhs4qb3rKZyzxq
	 kWcdNJ5apcm+hyOuBPP7ZxABw+zHcwOkaVs9gHrVo6gJv15JOYJAFWW5tsYfZvvs5W
	 QuK1sFMmHmoHSi1Xf04H6Slal1LFe3nKlnMAmP3dZYLGB2Kxyt4zwcIOWiRBjd0Poz
	 aTZl+O/SsXlUA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tB8sZ-00000001KwG-3tFT;
	Wed, 13 Nov 2024 09:37:35 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
	qemu-devel@nongnu.org
Subject: [PATCH 6/6] acpi/generic_event_device: add logic to detect if HEST addr is available
Date: Wed, 13 Nov 2024 09:37:03 +0100
Message-ID: <92fdd4cbfb0b52450cd0a2abac0a3227458c9618.1731486604.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1731486604.git.mchehab+huawei@kernel.org>
References: <cover.1731486604.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: B3Em7eAkN7d7

Create a new property (x-has-hest-addr) and use it to detect if
the GHES table offsets can be calculated from the HEST address
(qemu 9.2 and upper) or via the legacy way via an offset obtained
from the hardware_errors firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/generic_event_device.c |  1 +
 hw/acpi/ghes.c                 | 27 ++++++++++++++++++++-------
 hw/arm/virt-acpi-build.c       | 30 ++++++++++++++++++++++++++----
 hw/core/machine.c              |  2 ++
 include/hw/acpi/ghes.h         |  1 +
 5 files changed, 50 insertions(+), 11 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index c1116dd8d7ae..df6b4fab2d30 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
+    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.hest_lookup, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 9ee25efe8abf..2d34a6ddf133 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -365,6 +365,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
 {
     AcpiTable table = { .sig = "HEST", .rev = 1,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
+    AcpiGedState *acpi_ged_state;
+    AcpiGhesState *ags = NULL;
     int i;
 
     build_ghes_error_table(hardware_errors, linker, num_sources);
@@ -385,10 +387,19 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
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
+    if (acpi_ged_state) {
+        ags = &acpi_ged_state->ghes_state;
+    }
+
+    if (ags->hest_lookup) {
+        bios_linker_loader_write_pointer(linker,
+                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                         sizeof(uint64_t),
+                                         ACPI_BUILD_TABLE_FILE, hest_offset);
+    }
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
@@ -402,8 +413,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
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
@@ -518,7 +531,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     }
     ags = &acpi_ged_state->ghes_state;
 
-    if (!ags->hest_addr_le) {
+    if (!ags->hest_lookup) {
         get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
                              &cper_addr, &read_ack_register_addr);
     } else {
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 40f66792570c..930ba9e0a14c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -893,6 +893,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
     {ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA},
 };
 
+static const AcpiNotificationSourceId hest_ghes_notify_9_1[] = {
+    {ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA},
+};
+
 static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
@@ -946,10 +950,28 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
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
+                                tables->linker, hest_ghes_notify_9_1,
+                                ARRAY_SIZE(hest_ghes_notify_9_1),
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
index a35c4a8faecb..00521a1963ba 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -34,10 +34,12 @@
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/acpi/generic_event_device.h"
 #include "audio/audio.h"
 
 GlobalProperty hw_compat_9_1[] = {
     { TYPE_PCI_DEVICE, "x-pcie-ext-tag", "false" },
+    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
 };
 const size_t hw_compat_9_1_len = G_N_ELEMENTS(hw_compat_9_1);
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index a07c30ef13b7..040d6ee366b2 100644
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
2.47.0

