Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1863447ejc;
        Mon, 30 Oct 2023 06:21:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbXTjDxFA0XZcY78vE1yv9J516TkBVEEg5+Sf8Tjs9hXMtBb11OktcUGtM5CtBxg+KIDVl
X-Received: by 2002:a05:622a:11cc:b0:41c:cfc0:5c52 with SMTP id n12-20020a05622a11cc00b0041ccfc05c52mr11864656qtk.39.1698672093322;
        Mon, 30 Oct 2023 06:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698672093; cv=none;
        d=google.com; s=arc-20160816;
        b=P/6dDEVT/KoWoWucr4YYE9eRVLzBpWIFkNUWLXXNHUpvdO8ThCQrIVfnUNGdyd+CiK
         AHd7M9NkIKyA5Y79xOT/N/Dw3pc7z6W+iQ4Eu3v7ob0ABwRjlE5qDvNiouexla0UH9r+
         /CEz3nWuql3uCMAubZCxqOQH6s89/3dguydSXqv4mSUHk2oU7/U5T17wc8nzhP4zEbH6
         DCm27SqD45PwQTMVXaUO4cgfN/fI8DNcIX53J8UMNGw9w/EaGk+Q9OJ1iB33bfZ4i4WT
         nf3p/dfKwXfpwFInmrp+Bn4hPiZLLHgHIjXuB0HXN1gv/6aOCQkuz8z1u7RCM3WbDnRT
         R9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SUOXp0KMuwuEQ8v4SeRb+knalLC8nOeygatHRi5aG0s=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=H6y/kbMZhfYulhldFjAEMeQdprAbfepMzQ5kkqmWp8cM5WDjftWGjhC2OQQ+wda/nz
         9zlWaptzoP0LSTBp5wvZ1t8dLat38E4I3StBHYYCWQU6RjYuwojUxP55xmcevEKSxkzB
         fbvHCx/+v2CEehzUeh6MxCcpa/SgMDkYWGteatXGaBZUyEfL+Jn6P4JB23yb114QynEy
         ddYNdqg57YEhgljnemRvpe/m/03iml8Q+rjw12MmkNUNHsDnyP0Ttt4kTIK8B/TUYWX1
         I2C2FHGn0GwDHAq1uT/6/T1OrLEHC2Z4mG/qRHPqsklBen9fU4TU1T35SIv9qXDLErhN
         PQhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=hnnS9KwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19-20020a05622a009300b0040378f30d44si5685758qtw.172.2023.10.30.06.21.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 06:21:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=hnnS9KwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxSCu-0006g4-UQ; Mon, 30 Oct 2023 09:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSCt-0006fJ-8h
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:21:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSCl-0002mm-A1
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:21:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-280260db156so1713589a91.2
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 06:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698672074; x=1699276874; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SUOXp0KMuwuEQ8v4SeRb+knalLC8nOeygatHRi5aG0s=;
 b=hnnS9KwXX/Z0crtQcK8FxOO4sC9pyyCHrITiBrpX43IsHQUsyt3yTK4W8tyHR3r+Rl
 EH6E1ZXmaHXnPMXDe80ZxAXrOti1BuhRkigStxIsWrqfUYFgZ0IHZ47NfKtpRK2n58Zc
 rM5SqQPiWjkA8lp6VLjD4T+yggYoliD40ZbzFLdc8Ckm0QCHB0f1A3rJrQupxlcJCc6B
 lrWU2yhGSErHpFOMeIodn+kTNzLdgn3bP5p5aa5Y5+gBTvOIVMnTzbWIoyyN44BY2a97
 Xg06z0JTPAU0mG+Phhn7ofI6oTuI9mulWl37FGFEhkL5uaZMklwe6kv1shuruFjhB3U4
 oIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672074; x=1699276874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SUOXp0KMuwuEQ8v4SeRb+knalLC8nOeygatHRi5aG0s=;
 b=J1vpeTmOIRChvEOLYzTZhmsSW8zPQNgPFyNGwv6tH9MRg5z9852NEqLQ9i+zIEWojl
 rahiZMFzhY6BGddDpRJyX+3mdX+cPQsmxS4MHGP28zygXrIEtfpGoLZ0INkBWvA2btoQ
 Eol+5qBY0oV6fmWqZV9hJK+c8igf5W+8Vd+gLmRW6FQE4POj6bGyECyd8aET4mC6ck+F
 olxRd6R1d9nfm5ktN/UAoEUn2V1wJSBPFDA2w4sz47aIGkQ1N5nuOSol7CgHAo3J9tOJ
 EGhkOBsNecBhc68iNeMGqvQjcKqhmCgPsHR/YHMkvXKrPldpX9nM74EGse4gvzGAQlAm
 /xbA==
X-Gm-Message-State: AOJu0YxnkCLwTigcrOyltDalHE4qWJFqfzKIF2Md+h+6bwf/h4Hdp1p6
 J7HQPAnWnv7pUBDBYbut9kiaoyC1yetFfMpWkBbNCA==
X-Received: by 2002:a17:90a:4b:b0:27f:f788:f950 with SMTP id
 11-20020a17090a004b00b0027ff788f950mr7767621pjb.42.1698672073963; 
 Mon, 30 Oct 2023 06:21:13 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 15-20020a17090a000f00b0027ced921e80sm8122412pja.38.2023.10.30.06.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:21:13 -0700 (PDT)
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
Subject: [PATCH v5 01/13] hw/arm/virt-acpi-build.c: Migrate fw_cfg creation to
 common location
Date: Mon, 30 Oct 2023 18:50:46 +0530
Message-Id: <20231030132058.763556-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6Gegskrs4xRr

RISC-V also needs to use the same code to create fw_cfg in DSDT. So,
avoid code duplication by moving the code in arm and riscv to a device
specific file.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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

