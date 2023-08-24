Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp744145ejc;
        Thu, 24 Aug 2023 07:34:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzyflBhhNy+2SK3ggOi6q3xOEQW2TTjamC/rwVMwi3AmuIHevu9fjQYB/xrKNh14H8nY1u
X-Received: by 2002:a05:6214:2f0c:b0:63c:f51f:6bfc with SMTP id od12-20020a0562142f0c00b0063cf51f6bfcmr16849982qvb.37.1692887679567;
        Thu, 24 Aug 2023 07:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692887679; cv=none;
        d=google.com; s=arc-20160816;
        b=NuSkBFqG6mOPRSgObwHt/sZkqsNDusRnYt511F232lxf788QEja1pSrADZb2i7w9Wf
         tyH8Z/pKFIDmglM+9cl3SsV9F829k75nWpoghHZ03eVCy6c43JBQQNTw2datd+svCtqI
         DrCSQi7XjcSQ5SQmHLjCV37PO4MVgYVp+6XotJjWSQSlMbwsKjP0kEvDelCDkaD7rzaQ
         GgUdiD5h7uRIm83/D5vogVypxEFNwP3lUnZOK1Dy8gpZTrrmULb3mqrQrpsUbnoja5Vk
         TWKlAGeOQnjpWdtdr/xSiIjo8vTLAe9abdGESOkxVxISL+yffDKZISsxQbdCyxkQFfi0
         J7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ke3CIbiZzrEAJhnXzs0Tt9eyJ5dSeZXPJ36uEraMzCU=;
        fh=FstQSHJ5xalY0qvCfwQnzF4rG/Wi+NaC2f1qQ65wDU0=;
        b=zcg2jWQ/wIRK49FGDyOOgV/eLA0m6cbZbZOne0q6M1paICMxESiQsMPjCoGz5OOY0p
         XptuGnR2+xO5RCAW8JSGYpLSTMWmyR7ATvJpqiSg9hV4PC5U0uHzFzGdK2gQUU7Zrx3e
         CAypjEIW6xTn1Dys7AWCU8FOx10CVDzUaRKl1e9YZQhfZTh0F0j8e7VsKY2V4y1nK1cn
         tUAIQJhw07ySnWX9dBSAbmGsEJ11l3yMUnu0Z4MxNwlz+9VNZzRUpNAyLgakbHVbv5La
         ik3N1kOF8JIhYlGT2v/X4YQqH0yQXB50JIFngkdpiHsIt/uz0NjsK60aZ9Li3663Z+h9
         nC+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=J1zjNuG3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020a0cf2c3000000b0064f6ab4d034si817858qvm.512.2023.08.24.07.34.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 07:34:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=J1zjNuG3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZBNP-0002kz-Hi; Thu, 24 Aug 2023 10:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBNO-0002ZM-5R
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:31:58 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBNJ-0000yN-Rf
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:31:57 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-26f3e26e55aso3152347a91.3
 for <qemu-arm@nongnu.org>; Thu, 24 Aug 2023 07:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692887512; x=1693492312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ke3CIbiZzrEAJhnXzs0Tt9eyJ5dSeZXPJ36uEraMzCU=;
 b=J1zjNuG3AR3uBySmR1KPq442WEWdYmKFICzuig8LaQ4WA1IeZ0MIP58Sr80oiVVqU6
 aT2VMZKus7vEXJ2A249tNz+fuQ8K7Hr+ddz66Rz35bQhlKCqBThdaW7dJckwUjwRdRcQ
 CMiijlaPDtGi6IJxtKr3JXE32gF8zznKEMvUTSGLcNQqKT/wCgpribmVvl6mjXcUFt4r
 u1w8keATWD5Vu+53WILFPnmd/ESwGLZsXv5brwrNGZ4HeYAXtVFQOomHII34A31Cxp76
 j6J6jXb5qb2X1zoqkXuKkWPYflQpH7TJ4mrZAO04z0lzBCwItEq5UqSdQlipNbjuwoWt
 dDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887512; x=1693492312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ke3CIbiZzrEAJhnXzs0Tt9eyJ5dSeZXPJ36uEraMzCU=;
 b=b6xa9lGmvXwYITnBj2W7k1H66eq+24CF1bnxINCEObBSOuCgryKimftjSEWUPl2MeE
 dVLi/EjLDA2CgoWIWJbzQA6/AHDIvsMG4gDVOM8czvG11BSyUVLu+bVuX4HYR5KkfV0X
 Ojqpa8iQiya/QBR9XRybmqtVC2cbB/1RhXFB19juzSMiYBbx6sZTsp4JcPuBXuA++JwL
 hDJiYUwPZThG00Dn72xRFuqwDRqF2ebeKqg0TTcAlVuVZYjTvKqAVMGF56BkqCyY02Sx
 sk6x0H7HNvtKxKN22bKZmza959NQgNuiaEwQwVqDaBG3Vp6H/joi66cx1Xk/U8jb/zu4
 5/iA==
X-Gm-Message-State: AOJu0YyTW+BOAG0pTDdOyEpFtNQRqdnOlX1jkXDRpy5yYuYBruDNGXGT
 8D1eU9Z3+J0IRbJzsAk7cNDdt8mBhksjjmL7IAw=
X-Received: by 2002:a17:90b:3718:b0:26b:2576:1e48 with SMTP id
 mg24-20020a17090b371800b0026b25761e48mr12289878pjb.34.1692887511777; 
 Thu, 24 Aug 2023 07:31:51 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.191.205])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a17090a2bc600b00262fc3d911esm1666864pje.28.2023.08.24.07.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 07:31:50 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v2 11/12] hw/riscv/virt-acpi-build.c: Add IO controllers and
 devices
Date: Thu, 24 Aug 2023 19:59:41 +0530
Message-Id: <20230824142942.3983650-12-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102a.google.com
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
X-TUID: 20boojT71Qpf

Add basic IO controllers and devices like PCI, VirtIO and UART in the ACPI
namespace.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/Kconfig           |  1 +
 hw/riscv/virt-acpi-build.c | 76 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
index b6a5eb4452..a50717be87 100644
--- a/hw/riscv/Kconfig
+++ b/hw/riscv/Kconfig
@@ -45,6 +45,7 @@ config RISCV_VIRT
     select FW_CFG_DMA
     select PLATFORM_BUS
     select ACPI
+    select ACPI_PCI
 
 config SHAKTI_C
     bool
diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 40bd43efd0..bd0f9f3d87 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -27,15 +27,18 @@
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/aml-build.h"
+#include "hw/acpi/pci.h"
 #include "hw/acpi/utils.h"
+#include "hw/intc/riscv_aclint.h"
 #include "hw/nvram/fw_cfg_acpi.h"
+#include "hw/pci-host/gpex.h"
+#include "hw/riscv/virt.h"
+#include "hw/riscv/numa.h"
+#include "hw/virtio/virtio-acpi.h"
+#include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/reset.h"
-#include "migration/vmstate.h"
-#include "hw/riscv/virt.h"
-#include "hw/riscv/numa.h"
-#include "hw/intc/riscv_aclint.h"
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 #define ACPI_BUILD_INTC_ID(socket, index) ((socket << 24) | (index))
@@ -139,6 +142,39 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
     }
 }
 
+static void
+acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
+                    uint32_t uart_irq)
+{
+    Aml *dev = aml_device("COM0");
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0501")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+
+    Aml *crs = aml_resource_template();
+    aml_append(crs, aml_memory32_fixed(uart_memmap->base,
+                                         uart_memmap->size, AML_READ_WRITE));
+    aml_append(crs,
+                aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                               AML_EXCLUSIVE, &uart_irq, 1));
+    aml_append(dev, aml_name_decl("_CRS", crs));
+
+    Aml *pkg = aml_package(2);
+    aml_append(pkg, aml_string("clock-frequency"));
+    aml_append(pkg, aml_int(3686400));
+
+    Aml *UUID = aml_touuid("DAFFD814-6EBA-4D8C-8A91-BC9BBF4AA301");
+
+    Aml *pkg1 = aml_package(1);
+    aml_append(pkg1, pkg);
+
+    Aml *package = aml_package(2);
+    aml_append(package, UUID);
+    aml_append(package, pkg1);
+
+    aml_append(dev, aml_name_decl("_DSD", package));
+    aml_append(scope, dev);
+}
+
 /* RHCT Node[N] starts at offset 56 */
 #define RHCT_NODE_ARRAY_OFFSET 56
 
@@ -319,6 +355,8 @@ static void build_dsdt(GArray *table_data,
                        RISCVVirtState *s)
 {
     Aml *scope, *dsdt;
+    MachineState *ms = MACHINE(s);
+    uint8_t socket_count;
     const MemMapEntry *memmap = s->memmap;
     AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
@@ -338,6 +376,26 @@ static void build_dsdt(GArray *table_data,
 
     fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
 
+    socket_count = riscv_socket_count(ms);
+
+    acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ);
+
+    if (socket_count == 1) {
+        virtio_acpi_dsdt_add(scope, &memmap[VIRT_VIRTIO],
+                             VIRTIO_IRQ, VIRTIO_COUNT);
+        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ);
+    } else if (socket_count == 2) {
+        virtio_acpi_dsdt_add(scope, &memmap[VIRT_VIRTIO],
+                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES,
+                             VIRTIO_COUNT);
+        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES);
+    } else {
+        virtio_acpi_dsdt_add(scope, &memmap[VIRT_VIRTIO],
+                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES,
+                             VIRTIO_COUNT);
+        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES * 2);
+    }
+
     aml_append(dsdt, scope);
 
     /* copy AML table into ACPI tables blob and patch header there */
@@ -487,6 +545,16 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
     acpi_add_table(table_offsets, tables_blob);
     build_rhct(tables_blob, tables->linker, s);
 
+    acpi_add_table(table_offsets, tables_blob);
+    {
+        AcpiMcfgInfo mcfg = {
+           .base = s->memmap[VIRT_PCIE_MMIO].base,
+           .size = s->memmap[VIRT_PCIE_MMIO].size,
+        };
+        build_mcfg(tables_blob, tables->linker, &mcfg, s->oem_id,
+                   s->oem_table_id);
+    }
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, s->oem_id,
-- 
2.39.2

