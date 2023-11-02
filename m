Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp530363eja;
        Thu, 2 Nov 2023 10:03:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlozc8xVXtzK7pDhFE0ov37YTKwJQcNZUmIeze2KXOyFLrVhmZHpUG/EJkQ+FhZBuDfppz
X-Received: by 2002:ac8:5f4d:0:b0:412:1e0a:772a with SMTP id y13-20020ac85f4d000000b004121e0a772amr21129914qta.17.1698944603861;
        Thu, 02 Nov 2023 10:03:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698944603; cv=none;
        d=google.com; s=arc-20160816;
        b=kYE2KU1aYRzsY+UcJFzFyI0asrg12fcEtstVci1ycnozY0fz2CzbbySVL+lpjPaUal
         Q5FvyMucpBSoyGeSnCwXWludIFcYA6hoQ8W+jhiPYIRlN2bVqv0trV/zVFN1Nuj5SmxJ
         ciNw5GoXzeJkthUrvZ6ZG5UVHhooN5mp7LiCBMlhxqMNNrmurlhBFyE6zbV8Wus74YtQ
         jqN5WRCi+u8CjMIr11AIUXElrk33LRok1CvfXAE15CawtjTLQEB+ra567B/EvKYu8Gri
         SHnO9jCuvcLARER5QTIExxuToSi/xoPr6y0+bLN/XM5S/7dpKQIE0YBryfbQ9wnu/8ta
         oyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5R+ST1Gs2FCSwHeJBLallj2l86x2vSPEB38tW8j6/yA=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=OmfNfKXKkRnlx69lmRz2SjhW+9Fg+zjcs8f/HmD8rryuNlGvegZBw5QT8XGG82b8g5
         ycWhzbj9imAoFjB/iAyd55OiE+2Xq6TsPSnDlkSGfTTaox7gjwZJODiY178fZIForSxK
         6PHdLToRtShNLUv1susu8hK+GhVunsUKD/ZXBWO5Ib5dFgWkYo6FOXg1m+T/L1uN6AXj
         Q1P3IG1/87p75QXvSgfGZRzep85eDnYpjcyScsTvYpLDst/H4TX0f1MWkT1vt0r/Qr0C
         pMCm81WWUHkbKt1gRPeNBO5TQd0WoTzk5jNQDeaBhMBxk/m4SCtsiD+PdRvtYzwUA7rn
         FMwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=acicIm7a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o17-20020a05622a009100b0041092f38eeasi206180qtw.434.2023.11.02.10.03.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 10:03:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=acicIm7a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyb5h-0002f0-JA; Thu, 02 Nov 2023 13:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb5f-0002dh-Ht
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 13:02:43 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb5d-0003a5-KQ
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 13:02:43 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-280351c32afso1089593a91.1
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 10:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698944559; x=1699549359; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5R+ST1Gs2FCSwHeJBLallj2l86x2vSPEB38tW8j6/yA=;
 b=acicIm7am2U11WEdWF9mxspw68S5wz1jV4zHcSX0KRsZczfTLzR7PC8zOiqCX9rEs+
 E5IY6VBUcGA605Rq+cEEiueL40o1dvo/jYOc7zqnrbuJZDyDYp5Nx4Yz5toJNMPEW5A6
 PvXfr7Mfakf71dyVZZZBy8ui8sKIvHzewpFVaFEt7Sx0Dn7sMT8p/uNMhTfsWfhi8H2+
 fRCb9p35ERKUCgmBpqK/yaBS+3KPbujoWI0QvQXRvWQd6ZtVIJu1GITTYa4iuJVtYjWA
 R3KQwkkovu1hcDMACspTFXu5+FXxEhx1N9SX4/Au57wNBHwfz2DFB3p/OegWJ2/EmfZD
 Qwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698944559; x=1699549359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5R+ST1Gs2FCSwHeJBLallj2l86x2vSPEB38tW8j6/yA=;
 b=rBlP/VZYVbhfzNvZBimToeKO3aXGCF4HZRc0K1FWAG+hMwV8aCYonbZtSajprKv1yu
 9dcw1Jdw1bm9GGkTY7LoK02VKrEO1E535KVp98HPPcgWknoOlddVMKMHbFSYa0A4j4g8
 fwSHGP2UQ5ikoEgBpYeSQnWVyEuno65J1cltoMWxRr0LeD73kdjMP7OBkUsVUMGmBoTl
 tpaAEn/sJmqxFt911ITIHpYOWPb4V7x2Jo3N70ttGoOytsIjJZmYnAXmC/8nFc5X34n/
 rNlJeWVoiUjKzi24J7qXaPHNGY0MZx+v0201Ccrhdox1Z8JCcW0hgiPXAfn7lmW7PBtH
 Zv2w==
X-Gm-Message-State: AOJu0Yz1+4+kbSIvtDJTX5dFVuPzia6wnS5FUyl+QDnO3aOiqlzUbbnA
 tCk/tMgCpenk+oV8A74TLMRXeC7f+B57A/+kUZgOfQ==
X-Received: by 2002:a17:90b:304:b0:280:2856:5ef8 with SMTP id
 ay4-20020a17090b030400b0028028565ef8mr13760000pjb.30.1698944559593; 
 Thu, 02 Nov 2023 10:02:39 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 18-20020a17090a031200b0026b70d2a8a2sm25098pje.29.2023.11.02.10.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 10:02:39 -0700 (PDT)
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
Subject: [PATCH v6 01/13] hw/arm/virt-acpi-build.c: Migrate fw_cfg creation to
 common location
Date: Thu,  2 Nov 2023 22:32:11 +0530
Message-Id: <20231102170223.2619260-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
References: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 8/VlX65AkRJ2

RISC-V also needs to use the same code to create fw_cfg in DSDT. So,
avoid code duplication by moving the code in arm and riscv to a device
specific file.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c       | 19 ++-----------------
 hw/nvram/fw_cfg-acpi.c         | 23 +++++++++++++++++++++++
 hw/nvram/meson.build           |  1 +
 hw/riscv/virt-acpi-build.c     | 19 ++-----------------
 include/hw/nvram/fw_cfg_acpi.h | 15 +++++++++++++++
 5 files changed, 43 insertions(+), 34 deletions(-)
 create mode 100644 hw/nvram/fw_cfg-acpi.c
 create mode 100644 include/hw/nvram/fw_cfg_acpi.h

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 9ce136cd88..dd2e95f0ea 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -35,7 +35,7 @@
 #include "target/arm/cpu.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
-#include "hw/nvram/fw_cfg.h"
+#include "hw/nvram/fw_cfg_acpi.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
@@ -94,21 +94,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
     aml_append(scope, dev);
 }
 
-static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
-{
-    Aml *dev = aml_device("FWCF");
-    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
-    /* device present, functioning, decoding, not shown in UI */
-    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
-    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
-
-    Aml *crs = aml_resource_template();
-    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
-                                       fw_cfg_memmap->size, AML_READ_WRITE));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-    aml_append(scope, dev);
-}
-
 static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
 {
     Aml *dev, *crs;
@@ -864,7 +849,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     if (vmc->acpi_expose_flash) {
         acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     }
-    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
+    fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
     acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
diff --git a/hw/nvram/fw_cfg-acpi.c b/hw/nvram/fw_cfg-acpi.c
new file mode 100644
index 0000000000..4e48baeaa0
--- /dev/null
+++ b/hw/nvram/fw_cfg-acpi.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Add fw_cfg device in DSDT
+ *
+ */
+
+#include "hw/nvram/fw_cfg_acpi.h"
+#include "hw/acpi/aml-build.h"
+
+void fw_cfg_acpi_dsdt_add(Aml *scope, const MemMapEntry *fw_cfg_memmap)
+{
+    Aml *dev = aml_device("FWCF");
+    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
+    /* device present, functioning, decoding, not shown in UI */
+    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
+    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
+                                       fw_cfg_memmap->size, AML_READ_WRITE));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+    aml_append(scope, dev);
+}
diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
index 75e415b1a0..4996c72456 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -17,3 +17,4 @@ system_ss.add(when: 'CONFIG_XLNX_EFUSE_ZYNQMP', if_true: files(
 system_ss.add(when: 'CONFIG_XLNX_BBRAM', if_true: files('xlnx-bbram.c'))
 
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_nvram.c'))
+specific_ss.add(when: 'CONFIG_ACPI', if_true: files('fw_cfg-acpi.c'))
diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 7331248f59..d8772c2821 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -28,6 +28,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
+#include "hw/nvram/fw_cfg_acpi.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/reset.h"
@@ -97,22 +98,6 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
     }
 }
 
-static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
-{
-    Aml *dev = aml_device("FWCF");
-    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0002")));
-
-    /* device present, functioning, decoding, not shown in UI */
-    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
-    aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
-
-    Aml *crs = aml_resource_template();
-    aml_append(crs, aml_memory32_fixed(fw_cfg_memmap->base,
-                                       fw_cfg_memmap->size, AML_READ_WRITE));
-    aml_append(dev, aml_name_decl("_CRS", crs));
-    aml_append(scope, dev);
-}
-
 /* RHCT Node[N] starts at offset 56 */
 #define RHCT_NODE_ARRAY_OFFSET 56
 
@@ -226,7 +211,7 @@ static void build_dsdt(GArray *table_data,
     scope = aml_scope("\\_SB");
     acpi_dsdt_add_cpus(scope, s);
 
-    acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
+    fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
 
     aml_append(dsdt, scope);
 
diff --git a/include/hw/nvram/fw_cfg_acpi.h b/include/hw/nvram/fw_cfg_acpi.h
new file mode 100644
index 0000000000..b6553d86fc
--- /dev/null
+++ b/include/hw/nvram/fw_cfg_acpi.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * ACPI support for fw_cfg
+ *
+ */
+
+#ifndef FW_CFG_ACPI_H
+#define FW_CFG_ACPI_H
+
+#include "qemu/osdep.h"
+#include "exec/hwaddr.h"
+
+void fw_cfg_acpi_dsdt_add(Aml *scope, const MemMapEntry *fw_cfg_memmap);
+
+#endif
-- 
2.39.2

