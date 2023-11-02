Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp531266eja;
        Thu, 2 Nov 2023 10:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcipO2y9vd7jNQhwJDPxDlcG8KyrmpWofhGBV3i2ar3Yfhi8AI4kk3f6ovP64xx4qXRCon
X-Received: by 2002:a05:622a:189f:b0:41c:c27a:2927 with SMTP id v31-20020a05622a189f00b0041cc27a2927mr20553204qtc.44.1698944663178;
        Thu, 02 Nov 2023 10:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698944663; cv=none;
        d=google.com; s=arc-20160816;
        b=NiBGSkDe6qPPVRfKnWnM04cK65uFEiS6AZktGioRBnIS8Zotwqq0s/cMPTUV+UXY3z
         12QWD2BdPN5pukrZGtMgeLJqmS38aW2RohIqt2RUwKI5KO8I8W4DkyKwte0wrpt9Gr6G
         KKui4WIW4TUMURSUZA6cqcIkW9nAnyk2CecVdEzr2TKJhuzNqsF7CHdjO23jEaiTubnL
         SoUSFFYR0MHqF/GUCYjEQj+6KJXJx8uhaAPOXw4xKy/qC69vYbIeBxgrXhjflK/VDAw6
         Djjd/Ur0EDNj/PjMBgbN04EYkmTQySHJI5VrCUAUgj336XrIFUkvrl96rj30Ol6eT67r
         0UZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eZmwHBAqlWDpR0Ly31GEGuNJ8i9iUz/JPoUFQ5VSjzk=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=AJ6B3ObiSfPf9u1AsUrgd4p174WcYmG5vgJ82MiqGq92rdjQiHeODkxu8u5eC5wDKG
         G+tasOMTxvr57yGzNITqJO0Egmhe5cA7kSygpmmJTNyEosCnJomfsxu77grNQlYDQAVp
         EgRjTAk4pzg1bulSHW+M+5fb7b8VsFAdiwF730IPzpYOSWMkoFPTV2DiK6Eph40t1vH4
         Sy+EqnykYPccScg2JNsGRwje6dZMy50+F9r8hPpTjkrZW0Pi1ujcg3kYntnu4vVT9xy/
         +q9/ag+mN9uJgRS1Av2uYl/CyIs4YVHsh+wjIyJlL4Ktj92QBsTJDyjMhIvu0kGyY5Uq
         mLeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=LA4VA10M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a05622a119300b004127ba9c7efsi224268qtk.603.2023.11.02.10.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 10:04:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=LA4VA10M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyb6o-0003ps-7b; Thu, 02 Nov 2023 13:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb6l-0003me-7N
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 13:03:51 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qyb6i-0004Mo-RZ
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 13:03:50 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2802c41b716so1171666a91.1
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 10:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698944627; x=1699549427; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eZmwHBAqlWDpR0Ly31GEGuNJ8i9iUz/JPoUFQ5VSjzk=;
 b=LA4VA10MLegbgApRlQGRpjnGduYaBz+1cAddPTEPGR6YSz8cSw2tyjan/NG2nwU86m
 DraIidxKb0un8miU5QkML+MN5uq0drQShjhBAkwwmWuw1cY90oK9hneRIzER9avcbYHe
 Ot4KnYv0HxggvaH3gQZ2SuXvDp4/IaPTUf+FzwCcJeXJBRYDNzHN8jYEgEyK8nLwUzCO
 j9bfH6X6qUCzQGL9fGR1fDdME/B5SyupaB3ky4lmgfHC+jkag0G5lXfheSqZsieZZvIg
 MvFQD676mhWQTp+QWVepJYlvbQvyXylRWhYXuTetwfu5atC1MDJDbSrVqdCFUD1RkIRj
 s35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698944627; x=1699549427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eZmwHBAqlWDpR0Ly31GEGuNJ8i9iUz/JPoUFQ5VSjzk=;
 b=HsjiyiKtmsF3yyy347UZ4yaPsYdK5kXRRK29MbHLZBlFWEZqbOoySjReBkZX8aj5ZJ
 T/s81HN+fXP/+tLcTUfGW6/G/TMmFvnwSLOcNJpcpRkcWxyFNWcDInMQjqR+aBpvw3vD
 JE5tI+QwOwRjWrOX8f27tKoiGMwV3WSe0ogAQfnMBeNlEhthSL5ID76bIDWGYGf0LTdC
 +yqLtOSDpCwNjCvlXbFyDMJHrHThVnK2j7jmPEOspM3Y1EFwXGZn/AjSxyMDlJ2A0KQw
 mWpO4eYmeZiba2RhUWMotcBNXNLjNLBFo8PnByUOH4YPT1z3rEGWyXTiIUSUxSBgPZY8
 vEQQ==
X-Gm-Message-State: AOJu0YxvIkJJr6nzU+VbKYizVVDf1AROvWC36CVipscHxnfY7ihCR2AC
 P/EEg3Se7+fY1ZxbXPeDDpdyuDYwV3NiRt6wT39WSg==
X-Received: by 2002:a17:90a:f198:b0:27d:60b1:4f2c with SMTP id
 bv24-20020a17090af19800b0027d60b14f2cmr15768431pjb.4.1698944627183; 
 Thu, 02 Nov 2023 10:03:47 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 18-20020a17090a031200b0026b70d2a8a2sm25098pje.29.2023.11.02.10.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 10:03:46 -0700 (PDT)
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
Subject: [PATCH v6 12/13] hw/riscv/virt-acpi-build.c: Add IO controllers and
 devices
Date: Thu,  2 Nov 2023 22:32:22 +0530
Message-Id: <20231102170223.2619260-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
References: <20231102170223.2619260-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102a.google.com
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
X-TUID: kFzwC/dpCP3p

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

