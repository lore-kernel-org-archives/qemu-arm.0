Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp328214njc;
        Fri, 21 Feb 2025 06:37:05 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCW1NS7FsN40kQM4A9EHCHLRuwfWQmejw+6w/XSNx0aDa0kDHt94+AWIJNXz8OaGWy76l5fV9fNVKHTOlg==@linaro.org
X-Google-Smtp-Source: AGHT+IG2SihYzK3BKjO2bVEDMDktr1fkpELoADI5ChDaMMYTldy7E/Jn83eh+KcTR0KKVrvD92fg
X-Received: by 2002:ac8:58d2:0:b0:471:cdae:ac44 with SMTP id d75a77b69052e-47222965e74mr58653641cf.47.1740148624964;
        Fri, 21 Feb 2025 06:37:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1740148624; cv=pass;
        d=google.com; s=arc-20240605;
        b=e5SCHZjzJcj8fIEl4zaZbfpZ3oi49fiesrHZDm77aBnvFPnqXsLYAvcTflU3OkBmIn
         teZnjeyn+i4zOnib609ZDQAmoTgiu68mCtgXycB22HlLvghJSmSCqrtAs/rhzifY9DmD
         M/hWrX8a1g0jMXmg6W6rzrtF8JO13fNSvIJYMqc4IlsV+FXiMnZ/thyUK0oYZZ9EuzP3
         XwrrdGvAxh0q/Uij7ZKUWaIlyRBZr9gt4JCz7pc9ETI/yW21UnGgm5nAlEcz1g+keYly
         rXaMy4DFicA/cu+mZpmw8NrDhSNB051UbJvIWSIPd+f5WBbntEWWS/rx4iPZlU33UGiv
         lqmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=P+532E3o2CSt2EeeUPY276H1eubV3FzOFEq4l48IHi0=;
        fh=DHdByYTgC/foY7OnbddFKZbKoFJ6/yoOas4Te19gHEc=;
        b=kRAmyGKhdk0UDWX1x3QaKTs9jC6nwSHwCycQ7VOnbh44KTxXQLLEljcGL2L0GqLEqH
         dklJJzbDIcCmOZLfC8Ccqk4ueFmA0+OOzI91pZf+EYFCiw3xRkDWNTONFrGNfA/Nxjf/
         rPdspfgb4p2QETOVTv2zNCh/m97WvBfO+kW0FCvAdiu5rDMB4uCtwtoeqNkEjaZ/LV5+
         jEh3eV1E1epDFznQUPPuyy0ILGHIJPvZT26Mv2pm6+innkucuwcZneYTgA2wOIHfDR65
         zCgPeybp1nfNEmtMeSZ4GJzWv8KXRMQf2Ct67cGT5MhMh/hod8gTufpKUk/h+RVCcetr
         mWQQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lv9BnXDJ;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525926-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525926-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-525926-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-472043bcfe7si63754251cf.68.2025.02.21.06.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:37:04 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-525926-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=lv9BnXDJ;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-525926-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-525926-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DA2317D221
	for <alex.bennee@linaro.org>; Fri, 21 Feb 2025 14:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080BE213E9E;
	Fri, 21 Feb 2025 14:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lv9BnXDJ"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F6921019A
	for <linux-kernel@vger.kernel.org>; Fri, 21 Feb 2025 14:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740148536; cv=none; b=BeMswJjYZ0AJ7p/QTbl5XTbIZjqBqDiPZwVFTc8VzHk4J/fRvIf8vsOxH2b32gNVt/GLoTB6WQIfP7BbskTRqr4L0Y0GYOOiynsQ1IRbyuG8q0zRagIMuv+WeV7/C9DPZ3ekecb9I68Jjb1QrtUWYLIwywbwrPR9KtgUQQDQAvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740148536; c=relaxed/simple;
	bh=WR2eFSLdIkjOOB+IcImoFhsaXnuc9o37F6d83ATQ7Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SIeZylHzkLIs1oG1H5a4uqHe+uLrOltgJuAsmtzN+KX9RkTpbVhD9DVCAFX9lp9/aJWNaV6LOoFrxl4435KhK1VaBvMKl3VlbfL56hx8EqVezBqiWADn+tJNvOqYTsD4MUC0FQVSnxLktVxoet9LgixOy2vpQAkYVLcn0lDM5Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lv9BnXDJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2909C4CEF0;
	Fri, 21 Feb 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740148535;
	bh=WR2eFSLdIkjOOB+IcImoFhsaXnuc9o37F6d83ATQ7Qc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lv9BnXDJ6lFeXO042nLvOPT912WDebHJzYAtRO8Rb06seUhZ9PsQqpOWh6ZMm2pec
	 ens5XzRXnKcjovX9r7d7f9/YJmECoWQAyLngElMh7CfYmcL3z32AQuKzDMZ6H857Rd
	 Kl9wWKRMOk7YVW+fz9NCqdIfIQmZG3f22H4nhIYiIIU8g+XjDmy0sl/z94fCfMwDjn
	 6Fss2kprrfDHG5/k9wysXjHmCFyKRDcCoUy80SYiKwHs/lRFafzyWLGZ6jEI3wg8hb
	 RGgPZ7XxXeW84HKAtMxmjvaKjpOybOPEiKRabC6+RJmn63gW0MA+1M6hY019Q2/W9c
	 MYlGR0RxpBeJA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tlU7m-00000002jE3-3GL5;
	Fri, 21 Feb 2025 15:35:30 +0100
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
Subject: [PATCH v4 08/14] acpi/generic_event_device: add logic to detect if HEST addr is available
Date: Fri, 21 Feb 2025 15:35:17 +0100
Message-ID: <e9e0aafd7cc8613709171ec5d8a6d9d9be62d7c1.1740148260.git.mchehab+huawei@kernel.org>
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
X-TUID: D6dJqfnkohu3

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
index 4439252e1a75..9de51105a513 100644
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
@@ -950,7 +954,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     build_dbg2(tables_blob, tables->linker, vms);
 
     if (vms->ras) {
+        static const AcpiNotificationSourceId *notify;
         AcpiGedState *acpi_ged_state;
+        unsigned int notify_sz;
         AcpiGhesState *ags;
 
         acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
@@ -959,9 +965,17 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
             ags = &acpi_ged_state->ghes_state;
 
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

