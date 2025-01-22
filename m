Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp865840njc;
        Wed, 22 Jan 2025 07:47:55 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCX9ChCVBg31l8j6kmWDE2IBe196j5QMRQqKePn8V7wCkquOaOURrzYLMkm0hDfxB/pxdbHH7S7uA+5Akg==@linaro.org
X-Google-Smtp-Source: AGHT+IEBQxf59XClvTqfJNXdYcTyLxhVtZ6xxT3eN+AWlnpUU4Xw3XfAP743mZ2hcHt+6GHptCnH
X-Received: by 2002:a05:6102:a53:b0:4b2:5c4b:55e7 with SMTP id ada2fe7eead31-4b690cde3a2mr16717069137.25.1737560875250;
        Wed, 22 Jan 2025 07:47:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737560875; cv=pass;
        d=google.com; s=arc-20240605;
        b=XxkR0BxIpo6JR1w1utTzeebmpmXQOnO75pbiwoBRE6LPIMuXelXN9IVc+j7AXJ7NuX
         xefu4974/jztwSmcftWme3MpU2eTw9WIKgzg7kVH1dBthaFTWP081xcZGWKYcD86sJfr
         XsMD10eJRb12O85LdD3q1Xrq+F/thxSOC+PEWdfdqzxpw/yixDcwzVBUnziQXthJTJgE
         AJ13KnU6MxkG5kyg7x6aD0pash0YPGG5LExAiTdWF2Ugi7MV9Y52wlYiVxvzkHfSOSd1
         7u0lm2UPfykY+GKbPOv6rUq8VnwOWAJHOJ7J6EA81fAng1lOjNOCxdqLey4/L45+Rdsy
         9n4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=o7L6s7zy/KxpOheI0OK8aizcio0bR/sGVL+LFIcm4UQ=;
        fh=EfJ3+7Wifs+k/fEXqutbeLDyMpipwpXdOiZcC+ySt/s=;
        b=LsemB1vHAf14aUcGqpC5ULy9+xWtfsHSU4d7ALYHf5wKU6kjygxDIkJaVq3eg5hwph
         X6wWIRQc/QHTS8Uz1/CMpiFMr0pRPHUAcgRS5rbJexwB2fn0Gbp8o302UOXoAr9tKWjC
         74PBG6YKBcZfDozHshK8vjfUBX0ZiWMZVee1Cveq5T+TCj2ZXTLdLeUozcfCadD2jvY3
         Y6mKe7vgouBlKyI9CpAfh8MGmV1clc4zASM3uFFzwNxouEtapFzrA7baO11SNfr531uF
         0FaYJ+aRVc6kJUYvOsx/a+Hv8oi4/N2l45Vj8Kuje3P/JK+KGejJbPlff9lHNkecbGsn
         rVEg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Jl7v4rhU;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485599-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485599-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-485599-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b68a1b030fsi4325660137.82.2025.01.22.07.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:47:55 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-485599-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=Jl7v4rhU;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-485599-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-485599-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1812416AC6A
	for <alex.bennee@linaro.org>; Wed, 22 Jan 2025 15:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623B921518B;
	Wed, 22 Jan 2025 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jl7v4rhU"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68466214802
	for <linux-kernel@vger.kernel.org>; Wed, 22 Jan 2025 15:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560800; cv=none; b=WPxOrYUIM8OOXrxl0WnN+KysWDaWyvJfzOmxcLBoUoLtnKoRxZSsYlp2TUlQBhHP+iEx6AgvYmXCcZqIfSuEnZGz1bMM1vJYH/NJYyK6TZtEE248KmheSFebX3iPhZ4xEirVo5w/+dGBpsh5sjTkytoWPDqoycDq+bfkOo5u1X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560800; c=relaxed/simple;
	bh=poG2Yoeg5ZDbOr3TxSAt9ETkPdTI1KltVKwvO+UZqmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nefHm0ss9gSWIJ6XzTVTAmMnXHauY7sqfpOJyw2l8OyBnKmrZACBhhjER/cT8dnb2PDB25/ET3pHOHrsEHeZdRe0LI80S2d5fTucyh4k4JYLt5zAU9cO4g2SwzfxLaPh5EkJ/JJr2I7ynPW6yz3X91vI+0wgho6X0sBRt+/bl1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jl7v4rhU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31BDC4CEE7;
	Wed, 22 Jan 2025 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737560800;
	bh=poG2Yoeg5ZDbOr3TxSAt9ETkPdTI1KltVKwvO+UZqmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jl7v4rhU7EydjcJu2/Z4LzVrJJLuZuUxAeA02FP3L8P4tGuq2BsGj4oWzs7iELK+1
	 ar8qIhU57yXNwuu8ZDSfcPwoWAiTGmVk4Fj7fekoEhqRgfEL5pjTDoFpuFu3HANzFm
	 uwduAPE2/g1uOM4iyy25vZ7e8aL0JnLo1BSPgJvY6fbJaOAWVJriNewuLHXr9njyot
	 yQKdKhyOZFyN1LMVOY17Tg3IwwKTSYsMcfqbGPfR59FGprJNhCGqm9h45RIHgZwz3+
	 D/SOPj5x1KkdadRX0VAnISWbyjHT2ZMOKLHWnPj4xTpu0LH+A0WMoxRkxPrVbKy0Of
	 KaTgUqraRH5ew==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tacw9-00000008ogY-3jdp;
	Wed, 22 Jan 2025 16:46:37 +0100
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
Subject: [PATCH 05/11] acpi/generic_event_device: add logic to detect if HEST addr is available
Date: Wed, 22 Jan 2025 16:46:22 +0100
Message-ID: <556c19c1f3fa907c6cc13b62e060f6baa6faf2cf.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: KgW3k+9rAaUQ

Create a new property (x-has-hest-addr) and use it to detect if
the GHES table offsets can be calculated from the HEST address
(qemu 9.2 and upper) or via the legacy way via an offset obtained
from the hardware_errors firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/generic_event_device.c |  1 +
 hw/acpi/ghes.c                 | 28 +++++++++++++++++++++-------
 hw/arm/virt-acpi-build.c       | 30 ++++++++++++++++++++++++++----
 hw/core/machine.c              |  2 ++
 include/hw/acpi/ghes.h         |  1 +
 5 files changed, 51 insertions(+), 11 deletions(-)

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
index b46b563bcaf8..86c97f60d6a0 100644
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
2.48.1

