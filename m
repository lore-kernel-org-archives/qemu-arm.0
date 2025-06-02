Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2726816njh;
        Mon, 2 Jun 2025 05:58:16 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVAn8L7YdpCtMlJNAxJwZEAILGxbSID8qpaQL05TS713bvuLh9KkAXaN9PrqnHI0J9yLgeCoWlh+2SHqA==@linaro.org
X-Google-Smtp-Source: AGHT+IFBeh+7bJuRWLrKaIesKLiNZSz4jtkyCggCostDt1qynzd3rc+009nXdArLcIcoO+GAo37y
X-Received: by 2002:a05:6a20:9f88:b0:1f5:8a1d:3905 with SMTP id adf61e73a8af0-21ba110b832mr14991297637.7.1748869096521;
        Mon, 02 Jun 2025 05:58:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1748869096; cv=pass;
        d=google.com; s=arc-20240605;
        b=j/XYP1IwpejqdUBmpwTs8JVrGMlAUsVBsddqfZv2LvVVri43ljAF75JXs070Mi/4ah
         MzUUB1m7mEp45vQJK+5mzj6nog5Tmp4Ms0DeScAKZyWc4nmC0y3FaVQZo13lqtOGP7bf
         wCq8/TWlEYiQafv0HTf5wsjwF/h9D/qp/nWfRBvEjNOHXgZzsuHNSQH5/oZA6M31lewb
         x7tIjbRWQJYn3a+oI64gnNDLIauinJCIRXDAgHrw2R2f9gjPfXnhm2PWWIPnLWbmndTk
         IEoiJIg0qdqn4901LGwOWGxXiQl73Uni/Ko30pEpCgZmt/5GRsyuurvi0RVgR4C7d5GS
         i4eg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:date
         :subject:cc:to:from:dkim-signature:message-id;
        bh=ZXfAmqtTAlzt1iBj+v4Ovr6eGsXrBq9r+O0CNqa/1x8=;
        fh=DHdByYTgC/foY7OnbddFKZbKoFJ6/yoOas4Te19gHEc=;
        b=YCHp+e4zCggUmHjBVNfC7J6V447rSyPMc8j2/La8xn41O5sl46sq+crvfYnsVHod6+
         Wmtl5LWDSg8xgx0Qxv5x+E49HOQaFtD4Suk9Hbff91OlMohlGMTpFfsmX3KqwJcRxBRY
         flZU+JVUKrPVbbs6Pd66wae0BeNCBKLoQSVbbQ6Bb5oU5k7pHswADIdqjfCcWvyfRCsV
         OSSQ9tQc+A2b6HSQ+vqf1n/Z1sELYxUF6grG6XnShhD8sl+jjRnjjZzA6HGLhKyVkKAC
         Nba/1ag4/ttFJCJiThcGVfcy01g0Ei8X1s1pN8HjhJ0i3vja1TmSxXO1s9bZNgu0vnB/
         /Dtw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=u8HhRNzr;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-670437-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-670437-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-670437-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b2eceaf7dc5si9617523a12.36.2025.06.02.05.58.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 05:58:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-670437-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=u8HhRNzr;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-670437-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-670437-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Message-ID: <683d9fe8.050a0220.49c21.414aSMTPIN_ADDED_BROKEN@mx.google.com>
X-Google-Original-Message-ID: <20250602122244.081a1960@imammedo.users.ipa.redhat.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2029E3AF8DA
	for <alex.bennee@linaro.org>; Mon,  2 Jun 2025 12:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7E3720F062;
	Mon,  2 Jun 2025 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8HhRNzr"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E3721B918
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869092; cv=none; b=HekYn2Lb0UNViYfRJVw/L164K8jd2B0lvDQtbITgwhEoq1VfefsccZeGnOhg1d2+22korOBd2gsgKGKy4T9R1nVBgWwH/MdbIBXGU/zqToJcZeBbCyPmHNPvbPZaq7qeNcgxNOS+A0OtuFRChylGVyuj5GG4rTUTfNms97Eaix4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869092; c=relaxed/simple;
	bh=UGpf4ScskYQqBIauC9Wo+ugO/mp6oc4eJcEYr5RIoR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDfb2j8C+SgNM0CPlJ8jmGPsbBBipOkVeULPHQskhvk3pvC8YJ0FpkE39qHUqBjwrVwUwy1ZG7XuBBh9MBtjNqAwIAuNUwc0HTHcAXG8VM7R9eqVwJ3rM8HlxRAxyNyu3FZmLdleQYIXUxk5A0FS04xUjvXxy2VcB4cd/b1imI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8HhRNzr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77FFC4CEEB;
	Mon,  2 Jun 2025 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748869091;
	bh=UGpf4ScskYQqBIauC9Wo+ugO/mp6oc4eJcEYr5RIoR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u8HhRNzrCqHQLjErCeTW1ab/J/WOyCqQ4162WtH2eKR1PymS4yPY6Ly2akh9ieK4C
	 +mjQnJhhT5NdJf9n2AdRXyEspFZIXMlTfHhUPgZ02+hRDIlQJFh5yVEJsHAtF7FGHu
	 gAWbVC+dxfIhrp32HBUAOjKUUkhcbTDjhL5GETxUOwEwvg/PjcR61cfP9FJRT+i/p9
	 i5If//kwZA7DkPz0K13JfvFBcYpCz0GU7uS+MBmlVPAhaxjR7SjujtA6VMQelcaaJw
	 DUTl63rJg6DoO2/sPTXEmhEqed0N7Q40LzRiojUy8aJhfX9wrOF03xJih9g/mf8p0J
	 SzO9y7fGtFF6A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uM4jx-000000008oD-3sD1;
	Mon, 02 Jun 2025 14:58:09 +0200
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
Subject: [PATCH v10 12/20 RESEND] acpi/generic_event_device: add logic to detect if HEST addr is available
Date: Mon,  2 Jun 2025 14:57:12 +0200
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530221810.694ce02e@foz.lan>
References: <20250530221810.694ce02e@foz.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: z9jKqAKtM11g

Create a new property (x-has-hest-addr) and use it to detect if
the GHES table offsets can be calculated from the HEST address
(qemu 10.0 and upper) or via the legacy way via an offset obtained
from the hardware_errors firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
PS.: patch resent as the previous version was "12/26" instead
of "12/20"

v10:
- rebased on the top of upstream

 hw/acpi/generic_event_device.c |  2 ++
 hw/arm/virt-acpi-build.c       | 18 ++++++++++++++++--
 hw/core/machine.c              |  2 ++
 3 files changed, 20 insertions(+), 2 deletions(-)

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
index c3f3a5020d0b..aa90a83d8c23 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -35,10 +35,12 @@
 #include "hw/virtio/virtio-pci.h"
 #include "hw/virtio/virtio-net.h"
 #include "hw/virtio/virtio-iommu.h"
+#include "hw/acpi/generic_event_device.h"
 #include "audio/audio.h"
 
 GlobalProperty hw_compat_10_0[] = {
     { "scsi-hd", "dpofua", "off" },
+    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
 };
 const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
 
-- 
2.49.0

