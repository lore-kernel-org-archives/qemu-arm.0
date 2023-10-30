Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1863549ejc;
        Mon, 30 Oct 2023 06:21:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG047z70b1W0qGxVII87mVkWzMMQ4aVPxg/+OTxBcjTfAQ/CSK1+r0t+DwSIBRsbW9eCT/H
X-Received: by 2002:a05:620a:1a91:b0:778:8ce0:221a with SMTP id bl17-20020a05620a1a9100b007788ce0221amr10228737qkb.63.1698672105357;
        Mon, 30 Oct 2023 06:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698672105; cv=none;
        d=google.com; s=arc-20160816;
        b=lMANUhaBO1unA45QeoV6l8Su0i33uzkdwlbCXkcC8mZS97UWfjjy/NTKaDXTur89QC
         PcPPdDAEqWMFs0iYa82N5lUm3K1pDRmHDxLxXeAOL6+H2WnGpJ5nYMDOrxCzh2+9btxk
         g6VZ9INHLGIftQx5dIoOors8/U6Imh8dUdrMnERu1TvT+UGnKq/mUUV14jZK8S3eFAx3
         E1cjM8Kod08+Rp6fBNpDv/fTq1vbgi2vYnNVeCSn8TemC4EeTU4n/hHDKFTOIjc7Sf0h
         /O5g8ECHkrKqNAjkFsjQz5mbyfrFZiHkjZtOhDJTjxjeX2vcrlwgDUdJNtsnVLf9MBWW
         HIzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/WGOkPkGN7tv/gSpkSvp7dZKwocQSlsYgp8ZegSWvEw=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=GRSV3oEhYjsEncw0o5OlCjeudbwSm1R/MfvfuTsR//ty6262LFazYd7i/EyzTNgakQ
         GvmMOSjQIdg/6y5Y5WHBOmJHRfLHKS4D99zzCF4THSzTXAkz69QHq2yNZiB/heEJWp3g
         S/0qDNPODEfOTrlzwcugxasDJ7v8NsoO5AVoQpLb+64g4QXswo88XdJuZDeNTk7rMfDJ
         ELNWDzb27T38JuNUPeKN005UCIfTPMpM5KZ0efM8yAuA/4iTWJ3b+sDhIpDLz3dYy0Xy
         4v6E4lDtR64SnOoO2DkEaA4o1v1U631Yi+3TsM8bre+1ae69Fi38vp6RhcgQCcI7arK7
         eAOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=lZ7sHuE+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020a05620a248800b00775cadf4b83si5704508qkn.249.2023.10.30.06.21.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 06:21:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=lZ7sHuE+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxSCy-0006hU-BR; Mon, 30 Oct 2023 09:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSCv-0006ga-VI
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:21:29 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSCo-0002pG-Cv
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:21:29 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-280260db156so1713667a91.2
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698672080; x=1699276880; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/WGOkPkGN7tv/gSpkSvp7dZKwocQSlsYgp8ZegSWvEw=;
 b=lZ7sHuE+svFs/69m+Bi1x9hQXYgZE2M2fXTCWhDosBBOkhc0kLN28CiITB2/6vKc3J
 wXgVv6nSSOz0QOnU0GH24/ytTfAUVdfmw+0EOOFxSshCJlPhTPxzM28rMl5hcGNibDc8
 HWSdhtDX0JywFhoS3oxd6bAZizXJ+CPViG0KKaTTcAskYtfcNMKnw2v7AooZA3ozwoUl
 HsRs7tzMUWKgYpXiHHgMtYsrdFkcB78z/U4RXqXU9la4ncE1tNCAp7hbwQXCzdbco2mL
 wtzib5qtKsUljvSQgRyh45q+uZ/5xjfI4RUPq3bo4J6aXKMQYK8Bh6rY29V7RIH6OMie
 6ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672080; x=1699276880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/WGOkPkGN7tv/gSpkSvp7dZKwocQSlsYgp8ZegSWvEw=;
 b=ds/ObeiqaiPNmhvZ5cuuTdlSEQigvkS4kLlIRTPfNWvgOqRzlPb6wOwITA4JoHP+o6
 tspYVx5d+t+RP9MDfx2BMwwhiJXXsgfb9S5I1IN9TMi+0klIK2qdW0i7E3mHf3mW2cQC
 cdcDVGzSwnrS5LmOUwRL4vfjtrqvyDKSy/3vU7WAh/RqBan256CUmamJpxyA0xiIYkMz
 D8e4dHugoY4d8ku9mx/OlaVRKnPc7bFxfPc6YI2ln2RUUpw8nkelHz928rOcJI1iKip3
 71QDOY5iYgfEtRA+ezsT8y/LxHi1nSB/aVwebUsL/WhTC7ncLUy2k0+craLYLJK80kL9
 zaAg==
X-Gm-Message-State: AOJu0Yw3JFda/t0cjW+qOI7BpLhrmWSljQpRbhNayb3do3Kq/kvrhRK0
 FaFWwJRZR4DvM3OxxZ6WeA2K+HbtLv1k7bXphLRhCw==
X-Received: by 2002:a17:90a:2dca:b0:280:35d:4532 with SMTP id
 q10-20020a17090a2dca00b00280035d4532mr8841203pjm.14.1698672080074; 
 Mon, 30 Oct 2023 06:21:20 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 15-20020a17090a000f00b0027ced921e80sm8122412pja.38.2023.10.30.06.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:21:19 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 02/13] hw/arm/virt-acpi-build.c: Migrate virtio creation to
 common location
Date: Mon, 30 Oct 2023 18:50:47 +0530
Message-Id: <20231030132058.763556-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jV9dtQfDfGhM

RISC-V also needs to create the virtio in DSDT in the same way as ARM.
So, instead of duplicating the code, move this function to the device
specific file which is common across architectures.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/arm/virt-acpi-build.c        | 32 ++++----------------------------
 hw/virtio/meson.build           |  1 +
 hw/virtio/virtio-acpi.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-acpi.h | 16 ++++++++++++++++
 4 files changed, 53 insertions(+), 28 deletions(-)
 create mode 100644 hw/virtio/virtio-acpi.c
 create mode 100644 include/hw/virtio/virtio-acpi.h

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index dd2e95f0ea..b73ddd0c38 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -58,6 +58,7 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
 #include "hw/acpi/viot.h"
+#include "hw/virtio/virtio-acpi.h"
 
 #define ARM_SPI_BASE 32
 
@@ -118,32 +119,6 @@ static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
     aml_append(scope, dev);
 }
 
-static void acpi_dsdt_add_virtio(Aml *scope,
-                                 const MemMapEntry *virtio_mmio_memmap,
-                                 uint32_t mmio_irq, int num)
-{
-    hwaddr base = virtio_mmio_memmap->base;
-    hwaddr size = virtio_mmio_memmap->size;
-    int i;
-
-    for (i = 0; i < num; i++) {
-        uint32_t irq = mmio_irq + i;
-        Aml *dev = aml_device("VR%02u", i);
-        aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
-        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
-        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
-
-        Aml *crs = aml_resource_template();
-        aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
-        aml_append(crs,
-                   aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
-                                 AML_EXCLUSIVE, &irq, 1));
-        aml_append(dev, aml_name_decl("_CRS", crs));
-        aml_append(scope, dev);
-        base += size;
-    }
-}
-
 static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
                               uint32_t irq, VirtMachineState *vms)
 {
@@ -850,8 +825,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     }
     fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
-    acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
-                    (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
+    virtio_acpi_dsdt_add(scope, memmap[VIRT_MMIO].base, memmap[VIRT_MMIO].size,
+                         (irqmap[VIRT_MMIO] + ARM_SPI_BASE),
+                         0, NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
     if (vms->acpi_dev) {
         build_ged_aml(scope, "\\_SB."GED_DEVICE,
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index c0055a7832..9d62097a21 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -79,3 +79,4 @@ system_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
 system_ss.add(files('virtio-hmp-cmds.c'))
 
 specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: specific_virtio_ss)
+system_ss.add(when: 'CONFIG_ACPI', if_true: files('virtio-acpi.c'))
diff --git a/hw/virtio/virtio-acpi.c b/hw/virtio/virtio-acpi.c
new file mode 100644
index 0000000000..682283800f
--- /dev/null
+++ b/hw/virtio/virtio-acpi.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * virtio ACPI Support
+ *
+ */
+
+#include "hw/virtio/virtio-acpi.h"
+#include "hw/acpi/aml-build.h"
+
+void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
+                          uint32_t mmio_irq, long int start_index, int num)
+{
+    long int i;
+    hwaddr virtio_base = base;
+
+    for (i = start_index; i < start_index + num; i++) {
+        uint32_t irq = mmio_irq + i;
+        Aml *dev = aml_device("VR%02u", (unsigned)i);
+        aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
+        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
+        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+        Aml *crs = aml_resource_template();
+        aml_append(crs, aml_memory32_fixed(base, size, AML_READ_WRITE));
+        aml_append(crs,
+                   aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                                 AML_EXCLUSIVE, &irq, 1));
+        aml_append(dev, aml_name_decl("_CRS", crs));
+        aml_append(scope, dev);
+        virtio_base += size;
+    }
+}
diff --git a/include/hw/virtio/virtio-acpi.h b/include/hw/virtio/virtio-acpi.h
new file mode 100644
index 0000000000..844e102569
--- /dev/null
+++ b/include/hw/virtio/virtio-acpi.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * ACPI support for virtio
+ */
+
+#ifndef VIRTIO_ACPI_H
+#define VIRTIO_ACPI_H
+
+#include "qemu/osdep.h"
+#include "exec/hwaddr.h"
+
+void virtio_acpi_dsdt_add(Aml *scope, const hwaddr virtio_mmio_base,
+                          const hwaddr virtio_mmio_size, uint32_t mmio_irq,
+                          long int start_index, int num);
+
+#endif
-- 
2.39.2

