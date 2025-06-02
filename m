Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2725926njh;
        Mon, 2 Jun 2025 05:56:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2odM2T4wNM1LbxoGQR7ETslhjSWstWhSXMtm8v+IgI7G51wE+me3wfhAuTbtHnl3/4r6XMlJ0glKHvA==@linaro.org
X-Google-Smtp-Source: AGHT+IH2EOxH9IqZ+eM3Rea1+X6Uo5KNVzKc0mHz7fWPk9fyZGaUVTOX6FA4hIGtpl7+sBa7Hj4o
X-Received: by 2002:a05:620a:2692:b0:7d0:a0f2:e6b1 with SMTP id af79cd13be357-7d0a4c4399amr2027706085a.32.1748868986475;
        Mon, 02 Jun 2025 05:56:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748868986; cv=none;
        d=google.com; s=arc-20240605;
        b=iRFmUJ23cLkoWiv7noxr2A/+dyAc/2ZxG/YM78SJqWZakxrV9LKJ1tZvOSckRfZqPV
         a9r8z/zh3CY2yiWzXbvSLCpuSBAOXQ7LaZPzaMvVhg5RIcHUVQIyirhAcBg5xn9Z2nb/
         URyLGc7sjZajdBPmO7OixIyDGji8suPESHBPS2Ic5XcpDb8WtA50oPvHvhbTDFGZ/MM2
         Fb/k9Ne+Ab5fGkJ6Qsx2Mk3Iw9uIUi9NzMcrAvCn2ar7IdMDm2YuxIvrD9CMcBOeQpId
         J1V1Dk7KQVk8iCZhEhqHUUKTS5K2lbYNihnYwRpsvvPJtW0WIgzk06hDgXKdRzfQwsA6
         YhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:subject:cc:to:from
         :dkim-signature:message-id;
        bh=KGywrjituAS7qj4mCxcAj/oF2EoVwo6tSAVkcUGJmyI=;
        fh=DHdByYTgC/foY7OnbddFKZbKoFJ6/yoOas4Te19gHEc=;
        b=IkAv5xOhawE5nkNz2UmnjLPUnvw8TdleAS/i7Lg8kw6167uwSPBeQxZ2LebtKoz5NW
         wmH1yc40brG+ARZ22LKRlANu/O+BPypDy36ibn5hk5cgRUYocOWdkxIBB7LsUx88X9S/
         t4Svy9r+y3NJ9B7JXehNnYW5J1461FmVzv+reUtlrR8EfREj6t6fnmy612DBRd3ZWUyz
         9vBvnRcRCyLrC/ejIsj6JopbQXq2GQkBKLrxwmGz1/TIa7KjeC5vGrj4YNvYNnEt1mJi
         5LlcsjsOemeNvm0pKAH1qqzwuq+8KZBHbiNI2RRmn1e23QhWCg663NFkSz6pKay/yLuY
         YSQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AuTUU2ET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a110489si1043273385a.37.2025.06.02.05.56.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jun 2025 05:56:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=AuTUU2ET;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Message-ID: <683d9f7a.050a0220.ec897.791fSMTPIN_ADDED_BROKEN@mx.google.com>
X-Google-Original-Message-ID: <20250602122244.081a1960@imammedo.users.ipa.redhat.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uM4i0-0002ml-6b; Mon, 02 Jun 2025 08:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uM4hz-0002mN-1N; Mon, 02 Jun 2025 08:56:07 -0400
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uM4hu-00008s-D5; Mon, 02 Jun 2025 08:56:05 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 72E885C5C20;
 Mon,  2 Jun 2025 12:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F300EC4CEEB;
 Mon,  2 Jun 2025 12:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748868960;
 bh=1y1k9L6v273vVnANqw0hHe3EnLWOX+Fa7Jbly59n7Q8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AuTUU2ETaC4zcMj2e9medq9DpK1kpQ1Z4GptW+VZfh+F0niL2wttEvT2MLo6mUH9Q
 iGtoKWqYgvlwP4M7vRgYcNy/bF67fKmEGd3PgJnJ3Qaibu2tOZmVKPkFi7v1InnG+i
 GhvVjUkiwmmDy9oxSFWraVNO2/03Fqx/O5Agz6uudV1u8Swa8LxepWWJFzShmB65z+
 F7OLADiYqScR7qVbLd/uoL6wlfQZGzMaquoiRNPN5UeqelmD+GzGJTFxysHmv96RMu
 7KSSKOYguLx5Fv7RmZS4a1rkxSKLwqWi6e5tQMYtSlFLrY4qIase30Aa26UqS8uG7h
 icbv4+ZA/omhQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1uM4hV-000000008bf-0Wcl; Mon, 02 Jun 2025 14:55:37 +0200
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
Subject: [PATCH v10 12/26] acpi/generic_event_device: add logic to detect if
 HEST addr is available
Date: Mon,  2 Jun 2025 14:52:30 +0200
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530221810.694ce02e@foz.lan>
References: <20250530221810.694ce02e@foz.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.015,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 INVALID_MSGID=0.568, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 6mJ/VoLTQjVc

Create a new property (x-has-hest-addr) and use it to detect if
the GHES table offsets can be calculated from the HEST address
(qemu 10.0 and upper) or via the legacy way via an offset obtained
from the hardware_errors firmware file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
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

