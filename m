Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp324917njb;
        Thu, 27 Feb 2025 08:03:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWyB6prArUvGzMHHvWQds57vkuOy/LCnoSpX0jwz9xvSbzKY6ZtzNL+kaqHXKmxk8Rb0stTB0YCW7fahA==@linaro.org
X-Google-Smtp-Source: AGHT+IHpKowa+4KSApw0XEQy5owfnKUCw0sheYNKTNft9koyLLzZX1onoTEuMY5z6Uz+5sAoZjb8
X-Received: by 2002:ad4:4eeb:0:b0:6e8:9f52:6d44 with SMTP id 6a1803df08f44-6e89f526ebemr12928586d6.9.1740672217950;
        Thu, 27 Feb 2025 08:03:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740672217; cv=none;
        d=google.com; s=arc-20240605;
        b=doBBMBfAV7Ro11FeTPov3ZGcV03vA+FbVz74gFmLWdQ4gx8ngmnJC7PGHF3X8CxVbU
         8JpazwZ5169EINboAJXpnrTQg6vT9T3k6bjaiSWczNBho5iGUJtEONeIOtgi+FwfUv+7
         pfkYNgtukzpm/VNud54owPxMbyAIdzUaDjPAjPhhEG54nbdd9ruGSRI6KYIIXOEKq1+o
         g2x+taanzaJzkMb7Edz1pOjFBF1YdpHA5+wbiyMgr5WV3T0rYoFi5UpTTl80Ic+l48Om
         cwtwVkow3VDpqeAYkwjldjQ0FUfxgwcEwiRegb7XhL3Fs+POO2C2PSnfatbmGOBKtSlS
         vK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cQchnQTJjg2djnE568ffCPd7iOumLMHacHiCMnf3T1c=;
        fh=DHdByYTgC/foY7OnbddFKZbKoFJ6/yoOas4Te19gHEc=;
        b=jftuCgYtUe+2jvSwk+Sa6zJAFzjCInISeEdVWASjO0PUE1T5qLLeOD0mdEFNAtxxQo
         Z+0hVyXpgf4INAu6lW+0RCE3TKQZhe+ptZmjJy9jXld6l2MJ8InWl138KY/sin/Inpiw
         8VhU9pAawmz78lyfTO8i9PW1MbNzvaqhXFiaMcBhjaqeRj+AiVw2G/PfqTXa3x48etUP
         d1sTd+VJKOxSXm9bKuiC1a7SiOYLlZu9l1AxOtEHg+jbeQmJZOSSuIwm+F550ORkJmk8
         ex66jux0+VV9bdVj/VZFNgbgKu+V/1gU8Xo8qO9fZMDZMtlRvU+DesY/JBo4P6n/Icct
         8Spg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ISqiUzpj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e897702293si14700816d6.503.2025.02.27.08.03.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 08:03:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=ISqiUzpj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tngK8-00078s-Ov; Thu, 27 Feb 2025 11:01:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJz-00070F-7K; Thu, 27 Feb 2025 11:01:11 -0500
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJv-0007H9-Cq; Thu, 27 Feb 2025 11:01:10 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E58D61F39;
 Thu, 27 Feb 2025 16:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FD4C4CEF9;
 Thu, 27 Feb 2025 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740672062;
 bh=43wQnGF5bHXoBiXyFpeGog9TgdwJxwGs68pbdiJLeDU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ISqiUzpjh8nXc4rLp2dogRiIcUUTNhfISsOUidTiVvdKzp68qE4/WkTyY5bH3YlSj
 nfXHlrLns2erS3MDDWLDDIfnCDSUgntBRLJjVYcQMWysHGwCR6Uxqyel+T06yov5FS
 qJdec64YkGr5Erozn+4dB6/bBdELCY+4dd+QNf+jut1JOMPGvBgN8B0vBVIx48AggU
 aUXrfQS0e0J8MSQKMSR+XAGgrJiUlczbCa7Mf+roB/RmqpqmXnnSJlL/qxwEhCY1y1
 g1db1zNVMGlPdqvEsREdH9H4jljp5Yd2hbvnYMuZYrYSSYFjcseTj5QVFk+zwTzsFj
 sT7L/yjtWm5Xw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tngJp-000000023bP-06v1; Thu, 27 Feb 2025 17:01:01 +0100
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
Subject: [PATCH v6 11/19] acpi/generic_event_device: add logic to detect if
 HEST addr is available
Date: Thu, 27 Feb 2025 17:00:49 +0100
Message-ID: <045fdc23abaeeb7bb3b0141b57b935fe9bb176e5.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2600:3c04::f03c:95ff:fe5e:7468;
 envelope-from=mchehab+huawei@kernel.org; helo=tor.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: cneLR6brs74P

Create a new property (x-has-hest-addr) and use it to detect if
the GHES table offsets can be calculated from the HEST address
(qemu 10.0 and upper) or via the legacy way via an offset obtained
from the hardware_errors firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c |  2 ++
 hw/arm/virt-acpi-build.c       | 18 ++++++++++++++++--
 hw/core/machine.c              |  2 ++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 5346cae573b7..471d1a7afc76 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -318,6 +318,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
+    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState,
+                     ghes_state.use_hest_addr, false),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index ea9682ee2662..5443615d976d 100644
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
@@ -951,15 +955,25 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
     if (vms->ras) {
         AcpiGedState *acpi_ged_state;
+        static const AcpiNotificationSourceId *notify;
+        unsigned int notify_sz;
         AcpiGhesState *ags;
 
         acpi_ged_state = ACPI_GED(vms->acpi_dev);
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

