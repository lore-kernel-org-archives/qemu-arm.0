Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2726941njh;
        Mon, 2 Jun 2025 05:58:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/sGcZQCr52QN3kfNkG3UR09iWmMouS5/yaUEbX9aGnUDQbJbKJxpGOWU+MhXLHCaXfieuasA7HHi+mg==@linaro.org
X-Google-Smtp-Source: AGHT+IHeXgddqE9Q62akVFaUPqK+xBL2yNOdA2zG8Z9aNcgHqOuR4EyBw0k2lhdszVLx15GXnBBo
X-Received: by 2002:a05:620a:1914:b0:7c9:6707:b466 with SMTP id af79cd13be357-7d0eac3ef5emr1137426185a.11.1748869111391;
        Mon, 02 Jun 2025 05:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748869111; cv=none;
        d=google.com; s=arc-20240605;
        b=BsmtzV2q7Cqhb4ECjjSpNCeiwCI5L5N6UcoPO2K0AQQVVBWh+2NorPsFKgXG2P+d9e
         MP/GBeIKz73MAjUtEWGGPUtoomOioS9IuWr/yqELUkDKiMwoAeHJbEXvhlhqZqLO3ht6
         CZDOz7AeYf9s8nGekK8mXt2eiiLn0IlH+OknpyyDlAl2QzlVaccT/8ecKiZAxOliDEhn
         VkeNIzC3bBvbsVMcraCGUuSMfGP2jkEYCOBfPeRb/P9M+J9vmvV4AtaIEEkuzeSf4i3l
         U8GWhp31MRQk5/BRkQFON995SDRndxlWu7BTQnHMUx1fxJRqK9NjrUAYbN5yUSRwO7IY
         rUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:date:subject:cc:to:from
         :dkim-signature:message-id;
        bh=ZXfAmqtTAlzt1iBj+v4Ovr6eGsXrBq9r+O0CNqa/1x8=;
        fh=DHdByYTgC/foY7OnbddFKZbKoFJ6/yoOas4Te19gHEc=;
        b=DZfrq2YIA2q7yx/JL6fgv8tRuzKwQS5iiDdZ2AsKmgBQN3LvG0IzD1t6AEqXN3f56n
         thRPKAN35jkiRnK0q8xl7Bt5vAHDWbnm/1iyNAsIC0WCSfmH4qVcRO4pt1um8pv621kU
         NO9ZAtyOZ9W5TVbk+eILKAXwqRiOaKon9sKqt6hO4AFiw9xYj7cNDg2VNRNWqcncxTae
         OE/vz5YOyJS+2YrV+tLLu5TN+oQsBIHHtZPPXGrP5ptDkrb6TcblV4D6VUWhp1yh7Ot9
         DvHepvvA/zJiXRywyvgg/NQo3ZMXoEBG1vZfNWmkSd8LB/6NwYRzOyXa8/nj0dKBwSb9
         sHyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=u8HhRNzr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a12e5a3si1013807785a.156.2025.06.02.05.58.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Jun 2025 05:58:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=u8HhRNzr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Message-ID: <683d9ff7.050a0220.1159de.0446SMTPIN_ADDED_BROKEN@mx.google.com>
X-Google-Original-Message-ID: <20250602122244.081a1960@imammedo.users.ipa.redhat.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uM4k5-000441-H2; Mon, 02 Jun 2025 08:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uM4k3-000433-96; Mon, 02 Jun 2025 08:58:15 -0400
Received: from nyc.source.kernel.org ([147.75.193.91])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1uM4k1-0000F6-Lx; Mon, 02 Jun 2025 08:58:15 -0400
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3B8DFA4FFAD;
 Mon,  2 Jun 2025 12:58:12 +0000 (UTC)
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
 id 1uM4jx-000000008oD-3sD1; Mon, 02 Jun 2025 14:58:09 +0200
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
Subject: [PATCH v10 12/20 RESEND] acpi/generic_event_device: add logic to
 detect if HEST addr is available
Date: Mon,  2 Jun 2025 14:57:12 +0200
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530221810.694ce02e@foz.lan>
References: <20250530221810.694ce02e@foz.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=147.75.193.91;
 envelope-from=mchehab+huawei@kernel.org; helo=nyc.source.kernel.org
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.015,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 INVALID_MSGID=0.568, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: ykPc4Um6jcya

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

