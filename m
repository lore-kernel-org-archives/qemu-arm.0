Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp1960626njb;
        Sun, 2 Mar 2025 00:23:30 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWX4wIzYA5iniymFU4u0oAJ0e5R6mxmaPfYxH6YDWOpcP9n4/UvzTWQ7U/PvOvweqoae3r69KB+U0kfAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEnBqsD1FgYX8C7gItcY4wahLPnXsCGTIq/4XQsOxn+tZvRnspLoT2wa+PsaahB+SAIRwMT
X-Received: by 2002:a05:6402:3482:b0:5e4:cfb0:f66b with SMTP id 4fb4d7f45d1cf-5e4d6acd48fmr11435042a12.7.1740903810612;
        Sun, 02 Mar 2025 00:23:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740903810; cv=pass;
        d=google.com; s=arc-20240605;
        b=TX12vEnkCjN360OY7d4iuebuYd/CdTXzaJRmNMCSclAV42VnHg8qhxcnMu3rsmDHKP
         70jyt8L8HU2oQQowNGWj3KMV8l+RR23yvMmmSlRtY3s+LAJ9D1o6gEu1aK2W7yko6ra8
         SZ1VivUXYKjDrEfcWDVe4ygEkC1BzVpIpZJgLmQQtxPuPRUjzKHVnrhghs0RK8pBMY/8
         /JEblKQVsC75x7lxMuGKh6ymszPinqInPVGSMVro3fOYNyh5NNJPerZ9AVAMZQFSIqOn
         a0kL8qUHcEAP/gxdDhgFBqoCL2Q3ieKFK7fOo4VV849KJFSSJLlk1f0FWkdirJgm/l66
         rx3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=cQchnQTJjg2djnE568ffCPd7iOumLMHacHiCMnf3T1c=;
        fh=DHdByYTgC/foY7OnbddFKZbKoFJ6/yoOas4Te19gHEc=;
        b=DmGh6m0TLMmy5KKPrkL6j0txMCoSHAD+oOBe/WXwLFRzadiX/aJHGZGJyUs8x2Ax76
         WcW7lXr1wBZMJ0JA/1bM1TM+LmPl44h97E7GZI04lq0/UVrqwtVKLgmFOEquR19fff0S
         HugFf+35jsmX2XRU0NW3+mEBbKrTWh4QaEtjfxKglkhiAo5IfD8kDGTktGdXgybTEsiD
         UbjL9vRf8fhcXBzBpHriYF+p0QzXFmD9dLW6aG5esrYkvgPphsLhqEBBSco005Fy6yap
         RnONsH0v2JTpPibWozl6PPO/iLlOSMV0at+VfBm1v0eKksF7xPyP0StWgCbNg2DGu6xL
         8uxg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dxYYeXz8;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-540439-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-540439-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-540439-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5e4c3d9fbe0si7235118a12.184.2025.03.02.00.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 00:23:30 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-540439-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=dxYYeXz8;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-540439-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-540439-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF37E1893A55
	for <alex.bennee@linaro.org>; Sun,  2 Mar 2025 08:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0727D1E3774;
	Sun,  2 Mar 2025 08:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxYYeXz8"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C4C1D7E4C
	for <linux-kernel@vger.kernel.org>; Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740903737; cv=none; b=hs8JS8rD0iz6yZmwPQVzqe3r7XjK6L/cbuLVAmm5IgQ/cm63UDaEwPKkHS8zCNBNvcwayxFSiwKJjtjrhLx/M7ci3OHC/IVkRIUdw8SjauFGpzG7qrD8e+sFHZmOZvrQcfnkaUGx+ZclOP9SvMAvp9dHylt1euQotoqnPL38k6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740903737; c=relaxed/simple;
	bh=43wQnGF5bHXoBiXyFpeGog9TgdwJxwGs68pbdiJLeDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HjpfcJ7l8ytS8Zt+Y5zL07Bv4bXypjUAgbAw+cUMpXFA894E3ji3Yw00OPnX8/wX4qU+afClcPEzc9iUZfmthm/dgJZKUFk4/DAcaQ3j9qjmWVcIjUqNkRmTq+3kRMMpFAsUwBpmVAi/lKI3ncP/mczr47tKA1m1VRIkkjc/52w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxYYeXz8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF2EC4AF0E;
	Sun,  2 Mar 2025 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740903737;
	bh=43wQnGF5bHXoBiXyFpeGog9TgdwJxwGs68pbdiJLeDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dxYYeXz8tMDwzRIC7LwpMlD8DhLje7tC4COtCc6/fB2+bIrStFzmlUIUoDzGFDx3/
	 cSZfJm489fcgbCXj8QUI4LPGOaGBzWfeXDV+7StcQ88crOYGI/ikPtBI52OqxePt8R
	 B0pgTPZw0rtOlBloamuAbI0jJMT6xy5Na7Qnq3uLYFZ2QhPG7w5W8wGnR0D0Ozh6UW
	 X3VqK1cHpydc8I0URVsN2Sd4p7LV3dmo1SffqpKCjEWwR6ZwBENsUiP/Zl7o/OXjaS
	 0S8O5VhxGo3J2YUyaBzFGf1UDCoHqVAvrYykNv35xXNWbrGu/MFs8f1EjPkh1grzYQ
	 yQPQMXvPNGa7w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1toeaU-000000043SC-3CNQ;
	Sun, 02 Mar 2025 09:22:14 +0100
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
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 11/19] acpi/generic_event_device: add logic to detect if HEST addr is available
Date: Sun,  2 Mar 2025 09:21:58 +0100
Message-ID: <c881a5fb1332d9666e92c382aa605799941e1092.1740903110.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740903110.git.mchehab+huawei@kernel.org>
References: <cover.1740903110.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: RenfK1uzApeu

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

