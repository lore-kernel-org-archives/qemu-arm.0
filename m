Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp140565njb;
        Thu, 27 Feb 2025 03:04:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXKnmgvWmSgGO/KvAbUt1Sv13GrgpwdLmoz+CoQEyCgjE2NUZr3D1UDpKd5SNYVYRRt+lhwNLx3evoPWw==@linaro.org
X-Google-Smtp-Source: AGHT+IHLkdscTkC+C0mr0fKrEO7lXP3x07tVJ9eSaRuqEik9AsMmra46FbjOnSPLu1dnVrKb+b9d
X-Received: by 2002:a05:622a:3d4:b0:468:f858:6662 with SMTP id d75a77b69052e-473d8f9cb3fmr36434191cf.10.1740654266375;
        Thu, 27 Feb 2025 03:04:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740654266; cv=none;
        d=google.com; s=arc-20240605;
        b=fWp8p7xMGhLMjooIVQZEn+CIg088I+zygEgd1FW1OJRSFF8pYLOUFYiUcfHhXdGJ9i
         YNNHzPhPR3w8Kj/0N6JwNifVfPEpidrD9D/dmJnvCD6mGb0inVxx1eOoVJmYnG2i06JM
         xc2BCNDCHI984PTCtqC3g7vISTRmUOu4xWhpDmfrILuyefo455N/mgm99IxOxADDRWIS
         l0hP12t3cbnh3k7ZgGPLzNYvTZrI0ZpKGL9ypDhE/BH8fQCoJ/0p/cxsjD8azf30bPNH
         bm7ylk2ilSOfMpp9bq09xmuG9KXIUPnzUSMDnY0KqF4DPacouc+V6QXFDmG+SN/1A9eQ
         NV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q11gVYVvIRMmmO8TzM17HCQhPFGQx8CuLCisiQUyRKk=;
        fh=DHdByYTgC/foY7OnbddFKZbKoFJ6/yoOas4Te19gHEc=;
        b=SxE7rVBhrADhSiSkB1cqEk8x+pVgYUsS0fiunbZKNKUdF3MGWX5yizSNeUFBjjthwm
         DkUvnzmxJv6ntpDU3nRISmm79IxkVH2IBneqN+QNiKUR0WE+OsSS7qT18yxwL6veKI6A
         XXrKGkFy7krimTXURbP/iJPou9fcRBOElPga7YbzyEIFsb78j2TiNFz/K5Mj1LrxZS62
         PO9Fm8VqW1BBeWPUZsIz+iCZXyL28Ni3ulRblsCSXxX7tNQzusjWWE6BLMfVDbE0h4/v
         luXEZTFiQClvJwXnbd/FIMT5PjHyIH4mBWb9IYcvCUMWjSFXck1Dls+aQ9iYEPSys25L
         XTWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ds9xIJMQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4747357d539si10965531cf.636.2025.02.27.03.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 03:04:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ds9xIJMQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnbga-0004p1-Dw; Thu, 27 Feb 2025 06:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgU-0004lV-8E; Thu, 27 Feb 2025 06:04:07 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgR-0007Sp-0s; Thu, 27 Feb 2025 06:04:05 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BD8D45C4A8A;
 Thu, 27 Feb 2025 11:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF32C4CEF8;
 Thu, 27 Feb 2025 11:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740654238;
 bh=vZyz76w9mbuLEkV6dVQdbcGEs4hMzqd0w9oBQQyU9u8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ds9xIJMQFvLMBiTa+Kyssak35WoSBoRhYtu14g6xCkjP0+7ozaqWz1doN+Pzv9q6b
 3GdlvU0MT0FDMG6ggkugVLbw0P/SekLRvlAFhN5tdxs/jH3f5Ld59hxMhNbJ218rE4
 d+z6MgFWEEkXt7ide6EhKxTVIXMrp28K+Co0fQf6LaB+ysswOFv+3FbNR2fEXHMmMN
 vTc5vKPMHezi1+tq3W1Q8W6PmKP4mrw7w3BLNJEV1lVQB1x01T17c5p3PwbYiZjNzL
 wnoZF91ehH+hiwiKwEEEAR/RnnvYSwehmRls2TYP7eyT9AcwVb29fVM4tqorSO5OGl
 MebN0kXXkgP5Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tnbgK-00000001mRI-1Lws; Thu, 27 Feb 2025 12:03:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/21] acpi/generic_event_device: add logic to detect if
 HEST addr is available
Date: Thu, 27 Feb 2025 12:03:42 +0100
Message-ID: <73e0b70ed4125dc07a85fb43281a7731f452750e.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: fZLFVw3gf5Ln

Create a new property (x-has-hest-addr) and use it to detect if
the GHES table offsets can be calculated from the HEST address
(qemu 10.0 and upper) or via the legacy way via an offset obtained
from the hardware_errors firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/generic_event_device.c |  1 +
 hw/arm/virt-acpi-build.c       | 18 ++++++++++++++++--
 hw/core/machine.c              |  2 ++
 3 files changed, 19 insertions(+), 2 deletions(-)

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
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index af5056201c22..03ee30b3b3f0 100644
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
@@ -951,6 +955,8 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (vms->ras) {
         AcpiGedState *acpi_ged_state;
+        static const AcpiNotificationSourceId *notify;
+        unsigned int notify_sz;
         AcpiGhesState *ags;
 
         acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
@@ -958,9 +964,17 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         ags = &acpi_ged_state->ghes_state;
         if (ags) {
             acpi_add_table(table_offsets, tables_blob);
+
+            if (!ags->use_hest_addr) {
+                notify = hest_ghes_notify_9_2;
+                notify_sz = ARRAY_SIZE(hest_ghes_notify_9_2);
+            } else {
+                notify = hest_ghes_notify;
+                notify_sz = ARRAY_SIZE(hest_ghes_notify);
+            }
+
             acpi_build_hest(ags, tables_blob, tables->hardware_errors,
-                            tables->linker, hest_ghes_notify,
-                            ARRAY_SIZE(hest_ghes_notify),
+                            tables->linker, notify, notify_sz,
                             vms->oem_id, vms->oem_table_id);
         }
     }
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 02cff735b3fb..7a11e0f87b11 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -34,6 +34,7 @@
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/acpi/generic_event_device.h"
 #include "audio/audio.h"
 
 GlobalProperty hw_compat_9_2[] = {
@@ -43,6 +44,7 @@ GlobalProperty hw_compat_9_2[] = {
     { "virtio-balloon-pci-non-transitional", "vectors", "0" },
     { "virtio-mem-pci", "vectors", "0" },
     { "migration", "multifd-clean-tls-termination", "false" },
+    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
 };
 const size_t hw_compat_9_2_len = G_N_ELEMENTS(hw_compat_9_2);
 
-- 
2.48.1

