Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp304041njc;
        Mon, 19 May 2025 23:42:12 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV9SR1ACKsj7ApSEDcFbPNwEuNazI3+T7ga4KP9HaKUG8Drlj0+ASitmZwfQT0vddppga1C7MeqWCzwcA==@linaro.org
X-Google-Smtp-Source: AGHT+IFgY0GlvD3YWakDo0L7Fz6LYNlaCpiCwjcjKf2KIiprfg6KYpDbzK4GiqrmgXKFheLvsW6s
X-Received: by 2002:a17:902:f691:b0:231:b7e1:c978 with SMTP id d9443c01a7336-231d43a55bdmr238993615ad.16.1747723332139;
        Mon, 19 May 2025 23:42:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747723332; cv=pass;
        d=google.com; s=arc-20240605;
        b=WtV6P2Yit3QF7vwFoP+ByjD+BhblPO8eea02nHggOtANnnwcJej7ZDLh5NHvEPqziU
         c+mJOOTz9s8n9Iuo1VanoCJGEMvRm/2vNBtCdY/HlIgu0BpCzGD/2bZJ5gJM4lQCHCzC
         lHCFi2mjDwhGmqHE+tsHdl8CFPFTOcdpox6tmD+pcSDrf7sQJcSrefqJt2fKub3yWRdl
         w4x6zk8tS41AOJ+wg8PPnzNz4ypgr++/LsT/UZD3rrKHRJRnY6mu/ENc1KF0NS3dqsxp
         kXHYVhOwKNCVWXVkfiTtbrQWRwkDoS0JZXYELpTp51Rti5mqMkPhrz1t1iCaWDG4r1x5
         UmNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=SXEzaLwWMivHuoSqAZGhNh5S1lhQImnWWPUeH2ACHfI=;
        fh=DHdByYTgC/foY7OnbddFKZbKoFJ6/yoOas4Te19gHEc=;
        b=LjiKl4ZEqHu3oJ7SZpi4QPtDPu/fmj/EGT3Gxz2mD/Xwj60rVEzKz/V5hSSGO6ZUB/
         v/+q+uOKBNMXUtMjcC7vosBJaoTIfw2vpVMVQU/URlAyXkqfbMzhcNPEyyCMot0NhrWU
         dZ+f9Dz+s+f7bcIyPnu+04zcmuFOvi+KGZIu3fZE9yVVYai0EotBQ4CPxutx9reacQLT
         Vvzs24FJDiRaMLIDoTcxa9FaT7vMrSkXJyP0KPUjaBp/utBSGrGBg+Q4Yz+pY0HeZWzY
         CdaI0s8VzhEHKdpmc51Jnl0RIn4pOPBNwS+Xtz0lzvxyrBvXtHfPqU5oSVPDhD9efF4V
         +kdQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=EfHOycek;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655010-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655010-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-655010-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-231d4ee0843si115551675ad.581.2025.05.19.23.42.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 23:42:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-655010-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=EfHOycek;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-655010-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-655010-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C9633B50FD
	for <alex.bennee@linaro.org>; Tue, 20 May 2025 06:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88F025D20A;
	Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfHOycek"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E89B25D1E1
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=kK4dpKQBvN/wMCtW53xspcKmOS/En3cozdIN3F6xfjnOLh6O/O/aYAJQ31piKTHWUTHb8kNgcG5kuk/zzZeJvd5E3nlgY39Tp2DPgBx060RtY4hVWBioEEfSJbGx6ZjE0y6JfG+8B55Q811yPMETpmudI8Or3GgkcxBf4OXImLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=g/eHqvSwmDywKfEqFFYefa8LjLEiKr/Cp099VW5RGxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lG24BsELZz4a0kG+YxUPmUZD5ow5A1wDfMh9YRX4cRiefLGSE3Tiy4VqOCectSDDEFI3Wzg9LB59FB72NBB1W1t4+2kvZ61AAu2bkVmORAqYSvPAXuQGGlWOoUQZKqNuyYHaHQ6IJ+FyKrBUg9o7njYfi31Pf48sZwH4exXsKCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfHOycek; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB139C4CEF0;
	Tue, 20 May 2025 06:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723315;
	bh=g/eHqvSwmDywKfEqFFYefa8LjLEiKr/Cp099VW5RGxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EfHOycekYbF7+ucInCy8U9D5moeZpF/puSmSa5m5j8NdJCrx5DhtOzTGKyXhzNqIY
	 sQJZLhY6Xy8E4HwBAl3+zltZhSUe1sZdy9zCrjr8zBfhfueIlBCLMmRbyS6zo2TFp5
	 hMt0T2tPwv2XnH58MpbG5tF6Tpb5iYyQhhXCwf5udTMrruO2DTmZ1q7FjJBM2SJKHJ
	 GpUKe4zVBvm/e4lCh86GDJXMcDUxvGmkoOVc+7refCVHJWeQ3JBlTXC62vx3iY74tJ
	 zkqDk6ftHurl96gfdDDP9bXUvsgv3ZT8DTroMWp8e10WCrptuv+9iPRkt5CqLmk5rg
	 pVCE9m1cFtgFg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfh-00000005qtk-461s;
	Tue, 20 May 2025 08:41:53 +0200
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
Subject: [PATCH v9 12/20] acpi/generic_event_device: add logic to detect if HEST addr is available
Date: Tue, 20 May 2025 08:41:31 +0200
Message-ID: <aa74b756f633dbee5442cf4baa2c1d81a669d2f9.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: kXgfoUxoy15Q

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
 hw/core/machine.c              |  5 ++++-
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index d292f61b4e41..3cf9dab0d01a 100644
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
index da3ebf403ef9..3126234e657d 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -893,6 +893,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
     { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
 };
 
+static const AcpiNotificationSourceId hest_ghes_notify_10_0[] = {
+    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
+};
+
 static
 void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 {
@@ -947,15 +951,25 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
 
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
+                notify = hest_ghes_notify_10_0;
+                notify_sz = ARRAY_SIZE(hest_ghes_notify_10_0);
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
index b8ae155dfa11..dfd36cf063c7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -35,9 +35,12 @@
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/acpi/generic_event_device.h"
 #include "audio/audio.h"
 
-GlobalProperty hw_compat_10_0[] = {};
+GlobalProperty hw_compat_10_0[] = {
+    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
+};
 const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
 
 GlobalProperty hw_compat_9_2[] = {
-- 
2.49.0

