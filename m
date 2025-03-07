Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2404842njm;
        Fri, 7 Mar 2025 11:15:08 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUCQhOt4TzmK27QW7ReEsUtvetGKeE0NT6Ro8OhkIUT+3wYWDBjCXGDUvNAiUE0E4R4zNzIh1+lsw8f8g==@linaro.org
X-Google-Smtp-Source: AGHT+IHaCgkeHLFsdFDWU/ls0ZmJ46dC2xNLSBqr6d2vTFBR//XbskPYTeZEmFRwEUdYz5z+f9mE
X-Received: by 2002:a05:6a21:3396:b0:1f3:47d6:aa08 with SMTP id adf61e73a8af0-1f544ad89c0mr8118732637.2.1741374908609;
        Fri, 07 Mar 2025 11:15:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1741374908; cv=pass;
        d=google.com; s=arc-20240605;
        b=iNRv2ENvUIaDQFidDiFFrkEH/RYxzHbxx8YEQH+ISOxL3Kt58W1KK6+TGP0JJzpOZ1
         kWcDpfhPW1xPJGNOhJSai8rcmxSy96uU6w1ymWlDtf6uMh8Zu3isRTfsQ8MuvX84KSgK
         rvqc8gycY7rc8oNdRQdfngf/EKfSwlVfMyENhqYXPJVu18XEz3SRsLgK1NtQh1GSqmVd
         abELC8DEArogO8N6ysZc9znb1NfXxwI/PnN528RzSPjs37caI+Jot1RU1eruVJULsJmQ
         qtmO4Z3cDMfCq3ugfiwq/hXPPzBCAqIRTXr7PYysspNRoJWEA+0M9em/aT2p2zHUQN3j
         jPyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=1x8ONiPj+BJ0cL3UzLV0knyR9S+eCgvxhLoj65pLvsA=;
        fh=lqla2kPYHU+SxBmWJY6H7M6q1517DnIASMNkK19dDgM=;
        b=DEOMkeVNIj6Up6eWYrAFGPqGkqDOYdSVJ8M30vGcKZOD32EvJaoU/R31P07ZsQ8Sgn
         YYafPZ7Bf/oEqdFJcJjQhvFMnHy3Nkh6a0baoqToXL836BbP70j5V12Hpj/6WI1fxixO
         SumQpsyv2/HZfoV2DavKd/R5LnFt0jV8UQLZ2g4dh69t1H57lcaUep0ksFN8xf3vo2Ds
         wRNu+UvN1qoG+ICOzSzMpHSsQfhlTo9vwFvJWIIwL20AfSBzmd/pVD/0y9Q04ia/eX3+
         qSOLW2pmBERH+HFJx51KjFwM5fIskTY8i24BrrMyBaCNKuExa9LK8yrsI5IOIPieKEyP
         QSlw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=NWFyoN7o;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-551805-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-551805-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-551805-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-af283e0d9d6si5929863a12.8.2025.03.07.11.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 11:15:08 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-551805-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=NWFyoN7o;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-551805-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-551805-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 761453B621A
	for <alex.bennee@linaro.org>; Fri,  7 Mar 2025 19:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC982512CD;
	Fri,  7 Mar 2025 19:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWFyoN7o"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C342505C2
	for <linux-kernel@vger.kernel.org>; Fri,  7 Mar 2025 19:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741374898; cv=none; b=A/TE8i2hZ2B2Q/2E4XQtvR+yqo+t2D4HhL3zWyN0ahQ2niJAcW0LsdVG/JLf447iAt/qO+f+RAJp/j4vr+hgSEXkSciku7TKozQ7ua4G6+ypV94ou30wWD9G+lp/mkGMzMA9bnZ7BAGEw94DO3/eRTEseOCmkp+viR2Yr9S6Cg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741374898; c=relaxed/simple;
	bh=Gj8pds6qQJyNoVx1JIwsKELvm2AAmJ9YGS0647jBI7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E28HM+qD3wYu254tiKJjtMINpM41CDIFNt1pO/OIzJUkkMKEot2ru5xMkJNbczGjhXNfXIMwYL3sC7ksYbRLE2idsYgkWHp+JW5WiN05CkR5pObBgBXk/uc7oI/B+TB5gyFazbXmJ89dGzgAmR6NnHTLKtc1sdqYuUOSJQA8Yyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWFyoN7o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91F1C4CED1;
	Fri,  7 Mar 2025 19:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741374897;
	bh=Gj8pds6qQJyNoVx1JIwsKELvm2AAmJ9YGS0647jBI7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NWFyoN7o8sdxNFJZKS9h9VZ60nzPm4L0l7tQ3nfF+f1dCFGEhGbIG3u4uu9IAwxTO
	 FVQUwj9utkFvvmvN4tE5PIi1yxsjKsPDKfmmV0IrxEPECdlh/8wvOCRUxqG/+VOqeA
	 NrZa7kjfZqWCn2UzcJ7wVVbm8PfljnctRaUVM6j/au8ZM/6jI6bZzSkv2l3Lh9duHa
	 o+qjiHiqwt9sWE6WEpZck90WwuBkEMfyLGz3NC5K6wl+mvHhESmtOFGiKSsqA7TZFe
	 EIh3E9uKESdxS1yqtUVlx8S8DOtwQE6Pnyyp1LpgCf1hSd8a/HjGf/inO9ELqZGFU1
	 wyH6qJY8DJ/tA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tqd9r-0000000BQn3-3xbI;
	Fri, 07 Mar 2025 20:14:55 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Gavin Shan" <gshan@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 12/20] acpi/generic_event_device: add logic to detect if HEST addr is available
Date: Fri,  7 Mar 2025 20:14:41 +0100
Message-ID: <6bdd6596b8f5771a4ee41d66609cd2bd29a534b2.1741374594.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1741374594.git.mchehab+huawei@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: yHj1Mk+wxIcN

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
index b68b8b94a3c4..f5f0731e7062 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -35,6 +35,7 @@
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/acpi/generic_event_device.h"
 #include "audio/audio.h"
 
 GlobalProperty hw_compat_9_2[] = {
@@ -44,6 +45,7 @@ GlobalProperty hw_compat_9_2[] = {
     { "virtio-balloon-pci-non-transitional", "vectors", "0" },
     { "virtio-mem-pci", "vectors", "0" },
     { "migration", "multifd-clean-tls-termination", "false" },
+    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
 };
 const size_t hw_compat_9_2_len = G_N_ELEMENTS(hw_compat_9_2);
 
-- 
2.48.1

