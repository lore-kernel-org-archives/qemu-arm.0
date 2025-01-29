Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3617339njk;
        Wed, 29 Jan 2025 00:05:55 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCX+DL0kXUSkO2t5YekxzlmqOfj5ETY3T8yyWfVFqqzNiDLAaBrxS0jhRG5lkO2Ko4KnwVKFVmi/lacBUw==@linaro.org
X-Google-Smtp-Source: AGHT+IHe7661MT9tdUboQfMSIw5vOKQO4kdz4UNvB1oTHsUHx3rb7tVXtKjt7GfbohLhSjOjsavt
X-Received: by 2002:a17:902:ea12:b0:215:9a73:6c45 with SMTP id d9443c01a7336-21dd7d6e17bmr33790885ad.22.1738137954910;
        Wed, 29 Jan 2025 00:05:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738137954; cv=pass;
        d=google.com; s=arc-20240605;
        b=MWPY3nHlq0tSwHbBIBwVwGxzJrkVJ/3v6LCdA8Wis5WE86s1jj1WFzEiuI7OtRgvKp
         cypM0GumM4Mvt27DfrYKB4D0U92YVsqMn7DVNfzmG5K5oUMEk6GcqFBoMQFrlcBkg8Vw
         FE3JV4TPZLZ7JcNG8tzLC9LH+IcaYHcYNf3P+w6th/tgJpz/rP5b/sGX3mSfEgk6ipRG
         oIedXCEWuw3nEugnyX7F8f354S1b/qHjOC/tKwuT1S45OJXA4vBgYU4r22YRlgthIsAQ
         PC0e9zUMCJhmjfpswjkoluSMf7CaJWNxlQ4IDt/iDjU6bRHc7XILLtkdfRF19GXX4mIS
         YeJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=VgD2WkeksC0riNuhowEk/XLlBmN+jS9EF+6HN/qWpBs=;
        fh=EfJ3+7Wifs+k/fEXqutbeLDyMpipwpXdOiZcC+ySt/s=;
        b=U7CEdS5Am8vMnWQgLLujdfeemHqpA2yF9/hojmkrtePCPnHnNIa1fDJeRYkUoEStgD
         XLhrJ1Uslo4pZUTKPd6nRuQu+GWVAh45h5Q4SnSZ5rtuHVkNogjrP286pEHXp9ylpppf
         8ZBxKPua4ilo5ss1PWgK8Hd/vzKkVD3ltjNWR3OArvI9FHOkDo6GsvTzt1wJ5OmOKPGP
         QVS1aEm7Zr3p28YQx4XwLGBMuqTu/F643EtPUbNbY1iLkSdsZ4ELxHRl1TWPhC1ssFGo
         az+Z1ANegDd+cNQG0DCjf7E4tjtEuuclUDPd2ttivIS7Cm3Xzj76TJWKdd7UNW6L/zzB
         avzQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=KFr09pad;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492183-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492183-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-492183-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-21da434ca76si167552885ad.591.2025.01.29.00.05.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:05:54 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492183-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=KFr09pad;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-492183-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492183-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA97E3A524B
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 08:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A25F1AE01B;
	Wed, 29 Jan 2025 08:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFr09pad"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E37919ADA2
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738137867; cv=none; b=pP1I41v9wSOqgY6lH+x8QlA+topNlQI4Ez2x+H4aA5fKyfJtTbZKivtvLDxrp+hZReVE9bHwwgD/hFCOGToKMlTvtieaqOZH1NZh90M5FZAVyIPyh0xVzmuWJ76bsegQ4HbotMEJNcGRlXzkyMDP+a+/Qn7vHD3KtQ5qeOJqg4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738137867; c=relaxed/simple;
	bh=TJJGvQkL5tyzXsA5C9Gp2gYd6pqiqRIje1zEhSTV7IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GE4Xq8SWh06awnaKGkFSwh/4YZ7QSiGMXEmPMVcvCSrIL65HVmZjv96tEYt/TE82KxEII8c681Tyd7IAqzmTjNSNxmAk/uYoUALzRSbPt8t6DnEl+RG7MBMOfTK2e5qxpxC61g79mdx8eJZP+5M5qGgM+eu1KIUs0n9+3yrVdd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFr09pad; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BECFFC4AF09;
	Wed, 29 Jan 2025 08:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738137866;
	bh=TJJGvQkL5tyzXsA5C9Gp2gYd6pqiqRIje1zEhSTV7IQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KFr09padge2nFD0Hc+WuvGHftGqo9jN2fC2B3iXOn4OuY+KgYTzEC7Wd6OXxCDwOK
	 /EO2YUMjZ/rUwaN1mO5zzeDh6U/lVTaeLXyt1adN2K2eGfF4E9b5fLMBS4s/yI1tIc
	 Ud0LxxWvGKGjBFHvo50CezE8wR0Z+o6/oNwAqdLzcWSUgGXh9hrwLtZ2XQPjrJapuB
	 JulpEj9SmGU8KjW/QYLWviZdeurLdSL8DWyMVAa5bBxpjccXL+b0sHc24Py+7XhhNg
	 zwwqspnF+FB03UUGGQGcX2EbRmIEjnsim6fFIxNSxp9ClmNDmJrVdpYF/IstJ5RmtN
	 ZkHcDEQHO/Hag==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1td33g-00000004DPu-3NP8;
	Wed, 29 Jan 2025 09:04:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/13] acpi/generic_event_device: add logic to detect if HEST addr is available
Date: Wed, 29 Jan 2025 09:04:12 +0100
Message-ID: <2c18343e6f8dd84f734329396a789a3a314519ff.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: gkai0u76b1o0

Create a new property (x-has-hest-addr) and use it to detect if
the GHES table offsets can be calculated from the HEST address
(qemu 10.0 and upper) or via the legacy way via an offset obtained
from the hardware_errors firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/generic_event_device.c |  1 +
 hw/acpi/ghes.c                 | 20 +++++++++++++-------
 hw/arm/virt-acpi-build.c       | 30 ++++++++++++++++++++++++++----
 hw/core/machine.c              |  2 ++
 include/hw/acpi/ghes.h         |  4 +++-
 5 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 5346cae573b7..70729b6238a5 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
+    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, true),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index adf80945c6db..736287766989 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -353,7 +353,8 @@ static void build_ghes_v2_entry(GArray *table_data,
 }
 
 /* Build Hardware Error Source Table */
-void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
+void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
+                     GArray *hardware_errors,
                      BIOSLinker *linker,
                      const AcpiNotificationSourceId *notif_source,
                      int num_sources,
@@ -382,10 +383,13 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
      * Tell firmware to write into GPA the address of HEST via fw_cfg,
      * once initialized.
      */
-    bios_linker_loader_write_pointer(linker,
-                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
-                                     sizeof(uint64_t),
-                                     ACPI_BUILD_TABLE_FILE, hest_offset);
+
+    if (ags->use_hest_addr) {
+        bios_linker_loader_write_pointer(linker,
+                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
+                                         sizeof(uint64_t),
+                                         ACPI_BUILD_TABLE_FILE, hest_offset);
+    }
 }
 
 void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
@@ -399,8 +403,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
         NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
 
-    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+    if (ags->use_hest_addr) {
+        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
+            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+    }
 
     ags->present = true;
 }
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3d411787fc37..be1e51e0bb29 100644
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
+            if (!ags->use_hest_addr) {
+                acpi_build_hest(ags, tables_blob, tables->hardware_errors,
+                                tables->linker, hest_ghes_notify_9_2,
+                                ARRAY_SIZE(hest_ghes_notify_9_2),
+                                vms->oem_id, vms->oem_table_id);
+            } else {
+                acpi_build_hest(ags, tables_blob, tables->hardware_errors,
+                                tables->linker, hest_ghes_notify,
+                                ARRAY_SIZE(hest_ghes_notify),
+                                vms->oem_id, vms->oem_table_id);
+            }
+        }
     }
 
     if (ms->numa_state->num_nodes > 0) {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index c23b39949649..0d0cde481954 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -34,10 +34,12 @@
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/acpi/generic_event_device.h"
 #include "audio/audio.h"
 
 GlobalProperty hw_compat_9_2[] = {
     {"arm-cpu", "backcompat-pauth-default-use-qarma5", "true"},
+    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
 };
 const size_t hw_compat_9_2_len = G_N_ELEMENTS(hw_compat_9_2);
 
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index 237721fec0a2..bfc8fd851648 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -61,6 +61,7 @@ typedef struct AcpiGhesState {
     uint64_t hest_addr_le;
     uint64_t hw_error_le;
     bool present; /* True if GHES is present at all on this board */
+    bool use_hest_addr; /* True if HEST address is present */
 } AcpiGhesState;
 
 /*
@@ -75,7 +76,8 @@ typedef struct AcpiNotificationSourceId {
     enum AcpiGhesNotifyType notify;
 } AcpiNotificationSourceId;
 
-void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
+void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
+                     GArray *hardware_errors,
                      BIOSLinker *linker,
                      const AcpiNotificationSourceId * const notif_source,
                      int num_sources,
-- 
2.48.1

