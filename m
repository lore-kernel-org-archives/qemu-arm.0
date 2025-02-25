Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp335688njg;
        Tue, 25 Feb 2025 08:32:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQxQopAZrsXh3mvBshnWjQCwX3qX8d97ICW7dr1i2H6J/1FEQ4DWub3KM2OyJhztJw2bc2Sve3LVTLmw==@linaro.org
X-Google-Smtp-Source: AGHT+IFDh8eF3O6QG1LlBxbe43s49EN3QY5T6ViVohHc/QL/svPHkD80DL2MaXtbqOVpXp0ZlxdK
X-Received: by 2002:a05:622a:1ba6:b0:472:1512:c601 with SMTP id d75a77b69052e-4737725c265mr47532551cf.40.1740501165021;
        Tue, 25 Feb 2025 08:32:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740501165; cv=none;
        d=google.com; s=arc-20240605;
        b=Mbg9r3yDAT+5bSd60hwL859iR83eHDbGd0jYcH15O8pUPgCIuQX8laiWIc3r4KWW09
         3H1U5oh48Ojo3lbC3qkgTYfJr8FZ6mgSTHoOp1Klc8S28wazbUDpTGDPmiPNiRvPPcC1
         ci771vGDIe0BHiyo2288Pm+V1fx63HT98Mqzvg5HS16atqK66CbwgqZg27LVyerJHVj7
         L5gesujIQpOiw5V4aMUSbOessquUREqV6XoGSP19PGavFfIdxS4ftzE1itQsoK45bY2J
         T2Zo6GMsKojroG9UBjcYpefpdpMdkUipib/E2zzdVJp8AO/p5lIL4LJwHHWqskNSW0cq
         6N7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8nlon3lcs2EaVmcEa1E17wkJPm3yExxTTmix/tARvYQ=;
        fh=mrCErM5HzBZPMbWrfhKaLB6Op7DKxeI6me6fB6ug8DQ=;
        b=FF3kkI7ax3foVsiV864+jlgv8+R9P0yrusETRsYn0jA3+1kQXLG5Mt23K47v6FCnft
         eJue0v5e1EZZ5qhcYSjE2/u/r8ZEJAW4LLCFKo+yjUblNOzvI/uwv1o85qzk2GWzsAB2
         oh9Uz+A4AJFhsvT5q31r8SLaNQY2l+DQ72yUxrVlD4hprWHzgc4QLsH3FdMLAjqa3faR
         Z4m8YrumDvPoyGnnGXPSU/TH3PACfMsIZrJzUR0LCPwl5AzU0GpdzICSbKc5sHpdahLs
         +JOT4x6LU28WNgypjsY+K5t7xh3uHVpwOakXNe++8pdXvGwDSMGYl+4McimZweGLCVVp
         08BA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cePvFFTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47378082c08si19770561cf.248.2025.02.25.08.32.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 08:32:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cePvFFTW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmxpm-0000xX-IU; Tue, 25 Feb 2025 11:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpe-0000pw-Vg
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:30:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tmxpa-0006Ug-V3
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 11:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740501048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nlon3lcs2EaVmcEa1E17wkJPm3yExxTTmix/tARvYQ=;
 b=cePvFFTW73AEqh8N92UwsvMkx5yNUd3Jo6HmjQQHcMlDYat0eZrJtQiV02gFQfPPxD2/wg
 IRRob8a+L2Hvq1oFb/Y8jY6BYYYelUeemEA6Cbb5nYVi0WnwyaBEWZbivqs1FpRtEL6Vwa
 nujU8R8cKAAjRYskwH6cVNBeo/MuKIk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-k8bxSjTANQ-xjE4QX4FD1A-1; Tue,
 25 Feb 2025 11:30:42 -0500
X-MC-Unique: k8bxSjTANQ-xjE4QX4FD1A-1
X-Mimecast-MFC-AGG-ID: k8bxSjTANQ-xjE4QX4FD1A_1740501035
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 19AB31800878; Tue, 25 Feb 2025 16:30:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.219])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DB4521800357; Tue, 25 Feb 2025 16:30:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8C75C18000A6; Tue, 25 Feb 2025 17:30:31 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, graf@amazon.com,
 Eric Blake <eblake@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v5 01/24] Add support for etc/hardware-info fw_cfg file
Date: Tue, 25 Feb 2025 17:30:05 +0100
Message-ID: <20250225163031.1409078-2-kraxel@redhat.com>
In-Reply-To: <20250225163031.1409078-1-kraxel@redhat.com>
References: <20250225163031.1409078-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: DOh8IWIPH6+n

edk2 looks for the etc/hardware-info fw_cfg file to discover hardware
which can not easily be found in other ways.  Entries consist of a
header with hardware type and entry size (HARDWARE_INFO_HEADER),
followed by the actual hardware description (which is type specific).
The file can have multiple entries.

This patch adds the infrastructure to add entries to the file and an
entry struct for simple devices (HARDWARE_INFO_SIMPLE_DEVICE) which have
an mmio address only.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/uefi/hardware-info.h | 35 +++++++++++++++++++++++++++++++++
 hw/uefi/hardware-info.c         | 31 +++++++++++++++++++++++++++++
 hw/uefi/meson.build             |  1 +
 3 files changed, 67 insertions(+)
 create mode 100644 include/hw/uefi/hardware-info.h
 create mode 100644 hw/uefi/hardware-info.c
 create mode 100644 hw/uefi/meson.build

diff --git a/include/hw/uefi/hardware-info.h b/include/hw/uefi/hardware-info.h
new file mode 100644
index 000000000000..94c38cff2007
--- /dev/null
+++ b/include/hw/uefi/hardware-info.h
@@ -0,0 +1,35 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * pass hardware information to uefi
+ *
+ * see OvmfPkg/Library/HardwareInfoLib/ in edk2
+ */
+#ifndef QEMU_UEFI_HARDWARE_INFO_H
+#define QEMU_UEFI_HARDWARE_INFO_H
+
+/* data structures */
+
+typedef enum {
+    HardwareInfoTypeUndefined  = 0,
+    HardwareInfoTypeHostBridge = 1,
+    HardwareInfoQemuUefiVars   = 2,
+} HARDWARE_INFO_TYPE;
+
+typedef struct {
+    union {
+        uint64_t            uint64;
+        HARDWARE_INFO_TYPE  value;
+    } type;
+    uint64_t  size;
+} HARDWARE_INFO_HEADER;
+
+typedef struct {
+    uint64_t  mmio_address;
+} HARDWARE_INFO_SIMPLE_DEVICE;
+
+/* qemu functions */
+
+void hardware_info_register(HARDWARE_INFO_TYPE type, void *info, uint64_t size);
+
+#endif /* QEMU_UEFI_HARDWARE_INFO_H */
diff --git a/hw/uefi/hardware-info.c b/hw/uefi/hardware-info.c
new file mode 100644
index 000000000000..930502a4df3a
--- /dev/null
+++ b/hw/uefi/hardware-info.c
@@ -0,0 +1,31 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * pass hardware information to uefi
+ *
+ * see OvmfPkg/Library/HardwareInfoLib/ in edk2
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/nvram/fw_cfg.h"
+#include "hw/uefi/hardware-info.h"
+
+static void      *blob;
+static uint64_t  blobsize;
+
+void hardware_info_register(HARDWARE_INFO_TYPE type, void *info, uint64_t infosize)
+{
+    HARDWARE_INFO_HEADER hdr = {
+        .type.value = cpu_to_le64(type),
+        .size       = cpu_to_le64(infosize),
+    };
+
+    blob = g_realloc(blob, blobsize + sizeof(hdr) + infosize);
+    memcpy(blob + blobsize, &hdr, sizeof(hdr));
+    blobsize += sizeof(hdr);
+    memcpy(blob + blobsize, info, infosize);
+    blobsize += infosize;
+
+    fw_cfg_modify_file(fw_cfg_find(), "etc/hardware-info", blob, blobsize);
+}
diff --git a/hw/uefi/meson.build b/hw/uefi/meson.build
new file mode 100644
index 000000000000..a8b168941255
--- /dev/null
+++ b/hw/uefi/meson.build
@@ -0,0 +1 @@
+system_ss.add(files('hardware-info.c'))
-- 
2.48.1

