Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp852858eji;
        Mon, 18 Dec 2023 07:04:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsk4GyGWHXce2xNNmKEcjpLcUHI9+G08wpHkPCKh9EK5CR31tzQUNs1yuapTojv9haRhO2
X-Received: by 2002:a05:6830:18fc:b0:6db:968a:331b with SMTP id d28-20020a05683018fc00b006db968a331bmr50394otf.55.1702911857656;
        Mon, 18 Dec 2023 07:04:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911857; cv=none;
        d=google.com; s=arc-20160816;
        b=RJ8cYhcRDm9cClxK0iNfUEIrRnlkXZfTMgTp4p7tMC1tRX7vVpga7FIogPzNhq9V0E
         sXEV5COUIaXi8pR7Bnol0wyH8Ev5yJR/gJ1N+yZ7VFyvS5MKdmslY4Z4aLUrldbovhN1
         WlrvrgEZa7m0/uYYkV+1zb7F8aVRSCPkHgLBHnUlIaMwOL56jh0IXoVkubK6E7vPWkQN
         TCBseowYZdTouJQtVOav5BSxaOI2ZQPY2slOajmrmei4G4r5OjTs9vbkpaazy+6jffBU
         l9uoHeSa3v73enhD1CVZvBmUF95rBuPyV3aEkdsrrsJKICbwmDelIP+5PqKMF/uBEM2J
         hDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lDr7BejLLbrAYyx/yPUPIURAr/cRsM7lfIEp1zNlvuo=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=TRBlw0+3rRzJ0iGIqmbEz12PRH3wjB7jKaNpcgjUN2CUoGt8Hn/3KUxBCNAfcapj6V
         Qfxvh++a41hJzMQKXVFhKSP1ji1uY+3DK/pbqqZQJbjTm7pjsh0AFd214FkJXy09cDET
         JhL+L552eLS/RxJPqExG/LdKx6Iqy+EwhJixjIutFJhcGLLQIg1jXUdV5c+3ffgmh2at
         YWSsRTZ5RlepKlN+71t1eI3CDQ6WZQO7XtMRe+YNjLYdjFqOyb0ZQYTfSqdMrYIEuLap
         55ioE7DnWcdbfe14AjNAOsPClJepDTCzt7apDMdNXqArQZxsJJJfWnyb4YW0Bfy01+6S
         iaVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=KpWgYLm3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5-20020a67e8c5000000b00466a6decc78si80282vsn.508.2023.12.18.07.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:04:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=KpWgYLm3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFF9E-0001D6-E3; Mon, 18 Dec 2023 10:03:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9B-00019G-Pa
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:03:09 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF98-00078o-FL
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:03:09 -0500
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso2567242a12.3
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 07:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911783; x=1703516583; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lDr7BejLLbrAYyx/yPUPIURAr/cRsM7lfIEp1zNlvuo=;
 b=KpWgYLm3bO8lkAoPlR/lvx3y6ifH+h/e1VR19pLARCgK31LmF9ALc4/SeBjCBPjzyJ
 V4J5nkxHiZ6AbZQBcb/V2P8v5L4MaXRrLHtnXhK8S7xC03qAW8+AAkjtv+88VuLpvjyR
 HuGzxTy8Ez0UBqPN6wRbgHgUxgsS5YMD4XjfS3dqXq6Iw/aFqE5cwp9itoXa74hm2ofJ
 lJWkX5lFZ4355VlwAWIiM5reQRvzyv4cglr83J5CJMLPxxiXkwMMny+yx8tycGrV952y
 W2TGlDpHM7przJ1T62F4GIoj9JuDZjNkSsexY8WkzuF83nK00EFLJUx3S+l51s7F5911
 N/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911783; x=1703516583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lDr7BejLLbrAYyx/yPUPIURAr/cRsM7lfIEp1zNlvuo=;
 b=MQ0ieTEybp8aaocnez3yxAqm5xQD18kOWQBjsEKLfTRIOaGVLKJ8qCN/ptwBHeWW84
 mRjrSB4t6mkJI6C7/uLf/FMVSrFd6EkbxqpDhKnULhoE+kVpXhywAlc6zqdI0OY1jl3s
 CbEMJcRVN0LlTa7VYCxgDL3hWQyeARxZd2L3V52mQ35wpUOsaaVC0eQd37daifyKycv7
 PTEV1MYQoObeFtFr13eoqHN23vM4pMajei+Wssfx5rc2teajR35HrDnAnE5AXaMZxxSa
 CACPH7vaq3xQcfwSo1OUddQMLNA75vU9WJtncqdb1I6F+cmmy/UrivIY6AxuQlWHdrUn
 t4ow==
X-Gm-Message-State: AOJu0Yx7JXbkQBF8wcpP8fiUwBWYNs9Szrxjn+bmotKmcB6i9pjhwjTF
 Y/zj0jvZJHlwKcmYIyT51T347ITAQOOJxHdwRy8=
X-Received: by 2002:a05:6a20:9711:b0:18a:db41:bd0a with SMTP id
 hr17-20020a056a20971100b0018adb41bd0amr17226877pzc.39.1702911783449; 
 Mon, 18 Dec 2023 07:03:03 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:03:03 -0800 (PST)
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
Subject: [PATCH v8 01/13] hw/arm/virt-acpi-build.c: Migrate fw_cfg creation to
 common location
Date: Mon, 18 Dec 2023 20:32:35 +0530
Message-Id: <20231218150247.466427-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: oKT1UMAC6cB9

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
index 8bc35a483c..565af9b7ea 100644
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

