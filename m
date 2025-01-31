Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp587227njb;
        Fri, 31 Jan 2025 09:44:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWeGA5yD/A+3CLYb4NJoDNd+4FtpwRgx3eaB/9pCzFI6KqUxvzMiEkrL7qIPAoMtzr1QhO2U3OeR/95qg==@linaro.org
X-Google-Smtp-Source: AGHT+IGiyBH8eK9POY/bScQnyjqBjDzEMpgOkfn2LVgKd4Y2MpAo/dwadZepXq0bM9TfdRJzgxNI
X-Received: by 2002:a05:6214:2628:b0:6da:dbf0:962a with SMTP id 6a1803df08f44-6e243b8fc5bmr147743666d6.9.1738345476736;
        Fri, 31 Jan 2025 09:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738345476; cv=none;
        d=google.com; s=arc-20240605;
        b=LaHlyDidA67OvmP3L+WVPJitDxJJgK2kkHljrwj5MLZ5u72+aGIngB3mNoPd8iKLhG
         0/RZ3vBrzr/CPAhnnMlFe3MnE+4Rnp+MlXT+UfjpyCDX2X15l30JwgwzJvgOSmuyGCsv
         lJHZRUf1e4/O2IfAKAAPCapjlLkWzg+B8fNsGlhBOVTTcGhTHlQKuoxvKiXEtlXQhB1G
         7Q9OiX10+QAGv44DSffNrbfm7I/+dWkqYJOL+LIEyVVVdFmrDKv1MufK6eqFg2sKaB+V
         4GBihBGtaEGOQOgL4tcqBLFmT8Zq6UY7FLRV+LMl2+QT+dE4UJJZZJl5GAOErsKVt/WY
         LRXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GUOzNUqrjNLMQeiO8ByT8fJvqKFayE31KJNPA1NIUUg=;
        fh=EfJ3+7Wifs+k/fEXqutbeLDyMpipwpXdOiZcC+ySt/s=;
        b=FUjf7hGJ/eX/T4cNDObikxSvnavjtP6tzucov5s2sLIzHGXB+WwJQG2RSstIr+N5c3
         qE6rh7176bz5YJJID1tWyXt4/hY/PdYkFBqp/3TXVcpc/Rg0FSfAH3j5wQzA13N7DjVS
         yVuGV2vzOZJe1/4XAdp+L+5S3bZk7MqnHkwtzt3yQxPHAsTN8NzJESk+rkNOSFZhmTxd
         +H+dJwD8yjGqxIHGEsY9o6l1HziJU53ADjLd7jIVyZomG5x22FdXnoQQYH4gdb2IO3gH
         Y8DAwTEmWjf9V0DyvDpuYdyDCwNlvBaHDiIdD2OhTw+XRJtRKQs5OQmHd00Jv02p+uYT
         vV4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WfdD9Cqe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e2549e0088si37821256d6.454.2025.01.31.09.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jan 2025 09:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=WfdD9Cqe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdv33-00066z-Uh; Fri, 31 Jan 2025 12:43:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tdv31-000640-5p; Fri, 31 Jan 2025 12:43:19 -0500
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tdv2z-0001oP-4g; Fri, 31 Jan 2025 12:43:18 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3C7B2A420DD;
 Fri, 31 Jan 2025 17:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A45A2C4AF0D;
 Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738345389;
 bh=ynH8ansBrhLKxawN2oQ7B/QkR6iKd6ExjA8Azv9arTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WfdD9CqeBnsnKy0bbzJxJyI83VRAHzImt7XMiWIHnAgdV/8GtCCMd27drHSX+hsJp
 kiV0DBhOvbqkcFp08KwUR4D975hF5HRU2heSAZlw84V2rD8QcW8u/WKTNq5dcp5dkI
 Gef/hxFBOPvBPxjo98fCIEMsCkPwZ6XMgVQLp0HByxqj4Aamqv47czcCZbNedgJkKM
 fRfxXJmZRLRD/iPAUs1OY1b+MPbZUzwvOsAAHCdLLl+GUG5q+DwY05I1E479s55U3t
 Ew9B443ktcqEYxo2R05vm+o847WjHHmA34WFEibxGwFeuikjEoWp89iSFYIY71Urd6
 XHzjhuZ6XgNng==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tdv2p-00000006ggy-0Xz9; Fri, 31 Jan 2025 18:43:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/14] acpi/generic_event_device: add logic to detect if
 HEST addr is available
Date: Fri, 31 Jan 2025 18:42:46 +0100
Message-ID: <0fb474d83bcb4464cf8b23822044688bdc3fd945.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=147.75.193.91;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YJkoyAJu4hB/

Create a new property (x-has-hest-addr) and use it to detect if
the GHES table offsets can be calculated from the HEST address
(qemu 10.0 and upper) or via the legacy way via an offset obtained
from the hardware_errors firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/generic_event_device.c |  1 +
 hw/acpi/ghes.c                 | 17 ++++++-----------
 hw/arm/virt-acpi-build.c       | 32 ++++++++++++++++++++++++++++----
 hw/core/machine.c              |  2 ++
 include/hw/acpi/ghes.h         |  3 ++-
 5 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 5346cae573b7..14d8513a5440 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
+    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, false),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 8f284fd191a6..a91dcd777433 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -359,7 +359,8 @@ static void build_ghes_v2_entry(GArray *table_data,
 }
 
 /* Build Hardware Error Source Table */
-void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
+void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
+                     GArray *hardware_errors,
                      BIOSLinker *linker,
                      const AcpiNotificationSourceId *notif_source,
                      int num_sources,
@@ -369,14 +370,6 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
     uint32_t hest_offset;
     int i;
-    AcpiGedState *acpi_ged_state;
-    AcpiGhesState *ags = NULL;
-
-    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
-                                                       NULL));
-    if (acpi_ged_state) {
-        ags = &acpi_ged_state->ghes_state;
-    }
 
     hest_offset = table_data->len;
 
@@ -415,8 +408,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
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
index 3d411787fc37..9de51105a513 100644
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
@@ -950,10 +954,30 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_dbg2(tables_blob, tables->linker, vms);
 
     if (vms->ras) {
-        acpi_add_table(table_offsets, tables_blob);
-        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
-                        hest_ghes_notify, ARRAY_SIZE(hest_ghes_notify),
-                        vms->oem_id, vms->oem_table_id);
+        static const AcpiNotificationSourceId *notify;
+        AcpiGedState *acpi_ged_state;
+        unsigned int notify_sz;
+        AcpiGhesState *ags;
+
+        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
+                                                       NULL));
+        if (acpi_ged_state) {
+            ags = &acpi_ged_state->ghes_state;
+
+            acpi_add_table(table_offsets, tables_blob);
+
+            if (!ags->use_hest_addr) {
+                notify = hest_ghes_notify_9_2;
+                notify_sz = ARRAY_SIZE(hest_ghes_notify_9_2);
+            } else {
+                notify = hest_ghes_notify;
+                notify_sz = ARRAY_SIZE(hest_ghes_notify);
+            }
+
+            acpi_build_hest(ags, tables_blob, tables->hardware_errors,
+                            tables->linker, notify, notify_sz,
+                            vms->oem_id, vms->oem_table_id);
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
index 6c2e57af0456..bfc8fd851648 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -76,7 +76,8 @@ typedef struct AcpiNotificationSourceId {
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

