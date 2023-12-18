Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp853478eji;
        Mon, 18 Dec 2023 07:04:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhqFbpO3OAsT0U8NFxq95Fm8lRdwzhChzjfpJ2LVePZLX5GT5+lhx7gCG+3zAs6oCsRIkj
X-Received: by 2002:a05:6358:787:b0:170:b81b:4a20 with SMTP id n7-20020a056358078700b00170b81b4a20mr16959765rwj.51.1702911899003;
        Mon, 18 Dec 2023 07:04:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911898; cv=none;
        d=google.com; s=arc-20160816;
        b=GQoUcwYclcxGYn2sLdlH0XvlTdcLoSkYP1Yo/EEaHDTrn872we6/vZK5MEszLcOrn1
         PkpAXheCxGf3WPRlDLT/Lz2LxPo9i7HMfnXwsqTyjlag7QS5Fbf5ju0OF8gE7Bpw918X
         8VQeFRhuOur4TYzBDGCCdlqV1i9dhIlRAIB4yF+0XEhnzHgqf3t8HGsvVKwfXKEonOch
         O6m9QFrOQxniBvXM0RqXHbUt5PYTGsUmNE6UPhoeWPmy25E15BRshe8MoM7moob5030e
         ta3ktod+Cyk1yMlVg8VRL/sWeASUHQZjvHe9O04OS/490yUzzUIYV3fJkpg2rpteYWKK
         vIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eZmwHBAqlWDpR0Ly31GEGuNJ8i9iUz/JPoUFQ5VSjzk=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=yxt0MTC712AlWL6I6f4E6+P/ckkXTI/GDhXsq6GWfqMCiLaBmjBe/asEggyRFC0N50
         BP0xl8eFrAE0pM4Osu3KULqD1Y1UZAZ/Vq/q0o1sQ4YrO3KcwX7tKMvmShKKi5QObRqt
         xy8gx7JHtkFfVQ3e3+3uEjxHxaxH6vG/QqX6rlEmUrQgb8hGdpwNcse0OHF4imXB9TiM
         1hAOs2U4uD0Zng4EdzsW+UXTzztVowDWKp1+DklTahE8Zx6xx80kPTU6iwSAzw5gaOT5
         0K63sPgtOPi+svnuUgcF+DLwigHhKx32tZ94RVwu1p7T7c0L7qjyxLnGYkXtfJbOQuQn
         OKEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="jX1rkR/U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020ab076c2000000b007cb5ef1ce37si1893178uaq.89.2023.12.18.07.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:04:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b="jX1rkR/U";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFFAP-0004wh-43; Mon, 18 Dec 2023 10:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFFAK-0004Ox-4j
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:04:20 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFFAH-0007KE-97
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:04:19 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6d089e8b1b2so1493613b3a.3
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 07:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911855; x=1703516655; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZmwHBAqlWDpR0Ly31GEGuNJ8i9iUz/JPoUFQ5VSjzk=;
 b=jX1rkR/UxTT+vfvWoyyZiRSiIcwRqywSmjb1IcaNrTTpKrT2OuIZyUOrL0CI1Uss07
 aISorcydnl9k2jQ/9Bj1OGH8ol309GJH76ThiXptho9NuchI0lv4ewSe9hIQWjlKdmAK
 Fy/oFXvBkUBnYTFlokY0zCx7UP4LAHDLlkAnFhfgVt52Dsww2LbFHMkUfQ3t5aoqrB+T
 TTjYdN1S78DaFAb74T0ox3NAk66ZFMmTCs1ga5RerIGLir9j7+VCgxKQHU4vc1UXyW75
 GtSJy/SKAHpttRBWvP9wBwUpWnIQxgKhF7oMOWeNQPIeRdrw3K1UE4de94BqQrFNiVZg
 BlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911855; x=1703516655;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZmwHBAqlWDpR0Ly31GEGuNJ8i9iUz/JPoUFQ5VSjzk=;
 b=FksvseKjArt9atVtdn5fqRTJ2DUAVDfmPmwW706Q9N8USBRGLzRat81NYcG5H+LqxN
 JujOvOGA/jGg6PmeKmQ/vzBj1v/2U/BNUv5437g1uQvrbCMpS1PK+pKyKhB6OD9WKrSy
 /jyfmPU/l4aiuApbJnmYWokHPx/hTbNjY5vadQslLhfgBSTC2qiGXeu0UQgsh8JI40tp
 WAeLQbA4kAVxNp4KoedKaYVxXWMCGVw5OvwSOqfCJw4zOr021zaogpyRM4eaD3elmSi0
 DB4y6jDmrH6ZfURtNpzKTl/woGSNBXhXIHrpjudBBzJZ2Wby0WxaUr1GQGIyZpN0r6sj
 RbpA==
X-Gm-Message-State: AOJu0Yw59IVkbyoXC/hMhcuHv+VwEbyTvu+dX5VeMpivtYMhvChLwwrr
 M7RuXjfCnR+Jx6bq0vXMDD95huFulxdBmh4Ydi4=
X-Received: by 2002:a05:6a00:4b42:b0:6ce:2731:d5c8 with SMTP id
 kr2-20020a056a004b4200b006ce2731d5c8mr8414386pfb.57.1702911853843; 
 Mon, 18 Dec 2023 07:04:13 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:04:13 -0800 (PST)
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
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH v8 12/13] hw/riscv/virt-acpi-build.c: Add IO controllers and
 devices
Date: Mon, 18 Dec 2023 20:32:46 +0530
Message-Id: <20231218150247.466427-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x436.google.com
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
X-TUID: fcitHkdiVLLN

Add basic IO controllers and devices like PCI, VirtIO and UART in the
ACPI namespace.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/riscv/Kconfig           |  1 +
 hw/riscv/virt-acpi-build.c | 79 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 76 insertions(+), 4 deletions(-)

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
index 86c38f7c2b..4d03a27efd 100644
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
@@ -132,6 +135,39 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
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
 
@@ -310,6 +346,8 @@ static void build_dsdt(GArray *table_data,
                        RISCVVirtState *s)
 {
     Aml *scope, *dsdt;
+    MachineState *ms = MACHINE(s);
+    uint8_t socket_count;
     const MemMapEntry *memmap = s->memmap;
     AcpiTable table = { .sig = "DSDT", .rev = 2, .oem_id = s->oem_id,
                         .oem_table_id = s->oem_table_id };
@@ -329,6 +367,29 @@ static void build_dsdt(GArray *table_data,
 
     fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
 
+    socket_count = riscv_socket_count(ms);
+
+    acpi_dsdt_add_uart(scope, &memmap[VIRT_UART0], UART0_IRQ);
+
+    if (socket_count == 1) {
+        virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
+                             memmap[VIRT_VIRTIO].size,
+                             VIRTIO_IRQ, 0, VIRTIO_COUNT);
+        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ);
+    } else if (socket_count == 2) {
+        virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
+                             memmap[VIRT_VIRTIO].size,
+                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES, 0,
+                             VIRTIO_COUNT);
+        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES);
+    } else {
+        virtio_acpi_dsdt_add(scope, memmap[VIRT_VIRTIO].base,
+                             memmap[VIRT_VIRTIO].size,
+                             VIRTIO_IRQ + VIRT_IRQCHIP_NUM_SOURCES, 0,
+                             VIRTIO_COUNT);
+        acpi_dsdt_add_gpex_host(scope, PCIE_IRQ + VIRT_IRQCHIP_NUM_SOURCES * 2);
+    }
+
     aml_append(dsdt, scope);
 
     /* copy AML table into ACPI tables blob and patch header there */
@@ -465,6 +526,16 @@ static void virt_acpi_build(RISCVVirtState *s, AcpiBuildTables *tables)
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

