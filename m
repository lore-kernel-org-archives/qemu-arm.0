Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1864431ejc;
        Mon, 30 Oct 2023 06:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7iooEi67sDCmHCgCTZ2xi80uNTG2vAV26SXfcHfoV0ln2uk5VJooSyFZfhtEJKYqWmNY0
X-Received: by 2002:a05:620a:3189:b0:76f:1808:997c with SMTP id bi9-20020a05620a318900b0076f1808997cmr11110689qkb.20.1698672186262;
        Mon, 30 Oct 2023 06:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698672186; cv=none;
        d=google.com; s=arc-20160816;
        b=WHN/Qujmaafo/vM5AqhOuoP3RTJi7xLYn8vMxskFQk7PXcYem8FzrRur/2X8KKcxgX
         y+IDZztJRoox7GQayENyJqP6qHEDuYgDrDS1F1w+0Fv29W2qyp3VJrew44zWP50rhI+L
         yD7O/lokhNXVneouTB/74QKacEXjugC8Wyc/rrfzGl8gxRHsGWcGqWTdEAGmipEOH+OG
         9s+jbqLrhmU5JAW0CQaZcHdq7TK6qxs0dBSHXoSU6YK51elf5l4ZWLPUtaw6eoDDJSTP
         2eRlkahz3FA+KGpvIPzuyCjAy8aWYO4d41RqreL7+ldAmyeFzmtlmJswwbJ6i9rlRqNJ
         wnvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+IAaldn5RVA9cV47Xi68k8nkyyuxtPnS4XmmOD4/W2k=;
        fh=ieNWTeoXViVzjD3GbjL7nI2u2Tkk33Uc9BsQY+9ivz0=;
        b=ENjd09DD6y9qD2LbA+1ETFaOccgUb1RZ0OSqLmlUfxW6SZWNBn/xo91MXXz0tBV8C1
         sY1JvAXX7rZmdFDvV2BQSGwGfmbqvTsdpnVQmbX/3UOUHD7hQ3sxd05O/VeMGCzaRcQz
         cTqdahBOZwpOihhV0qD/mBySgNd3NTAlo3atQHlyqrSLzyVc+WowxyHsqj9BVbvgfVKJ
         +179ucvF9p0Ik1JGCx0v8PYd8aif1/Y3ftIy8votUKol8rNhOwUIsWBNzRzmNLwF0anC
         TjG+Ll9RIQbZcUDTR17Q4rjZganN4a/AV4EV2VVEziInjIDLhabq0RIxpd94PA5nBt+6
         NTug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=OtJzOM5k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs30-20020a05620a471e00b0077404c6c51fsi5920037qkb.371.2023.10.30.06.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 06:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=OtJzOM5k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxSDs-00089Y-DS; Mon, 30 Oct 2023 09:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSDq-00083f-CN
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:22:26 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qxSDn-0002zS-Fc
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 09:22:26 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-28041176e77so744224a91.0
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698672141; x=1699276941; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+IAaldn5RVA9cV47Xi68k8nkyyuxtPnS4XmmOD4/W2k=;
 b=OtJzOM5khhIVTTBrdjmge4TP81lm/zwZR+LyvLQHY3YSl8zSvNhGlS+eIB5g8Hk+L/
 YhrKOxl/BKBMvTUKbQo8PvlaOs7Jh5Xl37qIVRx3hm4Ja8a2snwE1+ehsdU6aYLJSkID
 EfX4+x4Q1UX5CjZbf2XChBITEbRCDDz6AZcCg6MsoQo21PAaGdeyuo/hCv3xcbQA5J4Q
 7KoWPcbA64jWn0yDiLG7kJGR2ECiQVTOvV5XGgo5UGdEE9t4lESnQeOJyOxAKCFTpdzs
 z/ja4TH1eQpeRjcqjgYme6JvyeyhahlLGCGXVmeJUuVa7KCzOO83WUvTT38m3xl+oWYE
 8RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698672141; x=1699276941;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+IAaldn5RVA9cV47Xi68k8nkyyuxtPnS4XmmOD4/W2k=;
 b=doa9zSSsKmpXdjs0aLFOWi5O3wVsfO250zd+XcMc3wpIi5q73tWyhZPpOSM3rmk+RX
 B0f10uy5ZC6n4zW4kgucuJ13krdNS97DgLQTcGn77E3+H7W9FlCVBMTDwcYHcQrN0dzH
 1VpGehZTMqmi8bT/ez9SPdFD1H0QmnkjE4vCw/35DFJcYGTL6e/jS4eRkUFzgHuUWL/1
 PLXUVp+eB/N7gp4y1Q+by3500b+A3OXrGkzm2H3kKugbC1OIw2DfAVhfhFPuwznjJTjW
 Lb6o5/AR9S5/5nhkY1bR8VU/Ik5UohCjpQT/FdOEOLRz3Rks0qGHwYWHdkUi/thV6M0X
 WBSA==
X-Gm-Message-State: AOJu0Yy1RkqtaIcB83tSa/VVGAg9Vfxi1Lg1Ie9NnVF8rez2zD/22wnf
 otXHW4hvIy79y0rz2ITSOpb+KneZfEbwwCPYEt5ykw==
X-Received: by 2002:a17:90a:1a44:b0:280:24a:9141 with SMTP id
 4-20020a17090a1a4400b00280024a9141mr7099148pjl.28.1698672141567; 
 Mon, 30 Oct 2023 06:22:21 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 15-20020a17090a000f00b0027ced921e80sm8122412pja.38.2023.10.30.06.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:22:20 -0700 (PDT)
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
Subject: [PATCH v5 12/13] hw/riscv/virt-acpi-build.c: Add IO controllers and
 devices
Date: Mon, 30 Oct 2023 18:50:57 +0530
Message-Id: <20231030132058.763556-13-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030132058.763556-1-sunilvl@ventanamicro.com>
References: <20231030132058.763556-1-sunilvl@ventanamicro.com>
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
X-TUID: N0y4Yi7RD2V1

Add basic IO controllers and devices like PCI, VirtIO and UART in the
ACPI namespace.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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

