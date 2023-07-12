Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2741283eje;
        Wed, 12 Jul 2023 09:40:55 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEMbOPC9tede+ZnJ/jFQqygsTrMW8PdWlIx4PUVkwzgzrQY+xXokqCoAS3/VpTcpBBerPPT
X-Received: by 2002:a67:db89:0:b0:43b:44f2:afb2 with SMTP id f9-20020a67db89000000b0043b44f2afb2mr9496813vsk.27.1689180054872;
        Wed, 12 Jul 2023 09:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689180054; cv=none;
        d=google.com; s=arc-20160816;
        b=BAxd+xIxMYlY38o6Hd6ymtBtRf6fV41PgVbalGuKBy2C8WH1/S39KHoKZ5JoIzoICT
         fPNB51IVi+7hD63N9wzz+9leftoYIzqGmIcmaB/8xQioQXbPmEbte+IW4KEq3gGycMFq
         tn4VFMyVIUemj+ZxXEat4RfgzcY0LLF9woK26OI2+Ht7X0snVy00ku1GNBrMxAArb3FJ
         WSCbiERJbqLze38LePjKKbMhSJyVyqq91T97iGrq1mqgyo59bPTEUd6l6Zi28YRaynRc
         AuaUybWWGuRijLsFgvbkvz9zTiixEppXJQhN1nDdHtfdREEwAsPbShiBNquNZxmKYUgs
         JENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Lu6/lJ6nJ6IfmttPhp9N/F2YV6d72m51nrXTGOHEspY=;
        fh=QsSyH/XJB0d/FRsyBb/wvDqny4l1zc3rGbeONrDGr3Y=;
        b=f1ZHO9oxFdRy0fu0qyFnMI9H2fxPELBFmipw8NcsvTeOpRD1xQR88RAAfPS66+fcqH
         u8W5YwMP52ugLUDT3ShjiBvZBOlpSuGInceFyjaw0iSChBZ3DJYGOGcQ555mOXyFPtWy
         hSp6E6eNlOM5jwvBVSmymRm5vqQuUUw6rCuU+4LhWG0wQqucOX2+xZtXziEIin96KF8h
         fBa6S6d6g1ux5WNnRtGPQuVyx4XZayBwdS2PROPUuqZawiCG1eKaKLeyao0VXQ7ydJvK
         L4afY0mkKQztXZHpzKdxTVRpuMZtBDd1wV+yJva40sTUL4zoTxUU8VtXIwawlPH513A8
         h4YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=nNyCRAf2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a0cb38b000000b0063002a1ddb3si1846256qve.136.2023.07.12.09.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 09:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=nNyCRAf2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJcsj-0003ee-7U; Wed, 12 Jul 2023 12:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsi-0003du-9A
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 12:40:00 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsf-0004bA-Nq
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 12:40:00 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-666e6ecb52dso4325721b3a.2
 for <qemu-arm@nongnu.org>; Wed, 12 Jul 2023 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689179996; x=1691771996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lu6/lJ6nJ6IfmttPhp9N/F2YV6d72m51nrXTGOHEspY=;
 b=nNyCRAf2TUj0DvZhG1de5ksAnfMkfEcDO8CGWId+8vnT+WcUNMc/a5zMT0q/1PGxNp
 3KLiOgNlsyWY7SW84WtMuksJINdFtzVPCJcpSgXSnOB7lhCAyk/29VxC+olVaBEjbxpl
 +2xOjokoc35pP6tRELvHnZS3sIP8lTaSO3g6u1Etles2/wGiKrJkEdeCD/MOudi3ddGl
 2/K3zxwkEVu7Z/dRJ3LSpGzPCivaGYbfu/NNrbjApNMh1GC+nSM101qXZ3oYqUI6gXgO
 O5g9sO3X4x71kajkRCPLxnmWEHiLBwAI7OOw5925l+MbaI1XL7zj105mG/QCkIYjxtwj
 8r6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689179996; x=1691771996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lu6/lJ6nJ6IfmttPhp9N/F2YV6d72m51nrXTGOHEspY=;
 b=k0qaD8jksV8Xrj1jhBA3ASz38w6gsLIfxPOf/Qwb9zV2aRa0MeTY1K4yhHfokkSxx/
 aur0rD93VGfN0iuG4dn8q5mZDysffnxIvdDZomS32WE4zb8L5wz5vYvKEFUeLuQ1Q+w5
 h+YLWO50foKUsk9TpcNKmcUmT5CJx+1RCCydznhXwxu02AMjWQ5tT3LcurOzoShsDin1
 By13WtpKyIcGOaNrpNpZo9GeNItRRr9CAJhT2UspnRxrdqXm9rusMT9QrMVRu6iST5tO
 MhNH91VbJ9CGTWzPGlMfOAP/Opm0RpnAAkG59wl7dUSRSmTfd1W96ejSw7QnSQDP9jUB
 SB2A==
X-Gm-Message-State: ABy/qLYbDnsLnGtZgh51mfWMIcnAORCOrgVSj1glNJNS2RotrgvoEiaC
 xYqaaAoLXyrTvczJ7dLtXcJ34A==
X-Received: by 2002:a17:902:6bc9:b0:1b8:2537:541c with SMTP id
 m9-20020a1709026bc900b001b82537541cmr13238841plt.32.1689179996161; 
 Wed, 12 Jul 2023 09:39:56 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709027d9200b001ac7f583f72sm4172824plm.209.2023.07.12.09.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:39:55 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 01/10] hw/arm/virt-acpi-build.c: Move fw_cfg and virtio to
 common location
Date: Wed, 12 Jul 2023 22:09:34 +0530
Message-Id: <20230712163943.98994-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712163943.98994-1-sunilvl@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42b.google.com
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
X-TUID: 0h7I6ZEzEP9+

The functions which add fw_cfg and virtio to DSDT are same for ARM
and RISC-V. So, instead of duplicating in RISC-V, move them from
hw/arm/virt-acpi-build.c to common aml-build.c.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/acpi/aml-build.c         | 41 ++++++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 42 -------------------------------------
 hw/riscv/virt-acpi-build.c  | 16 --------------
 include/hw/acpi/aml-build.h |  6 ++++++
 4 files changed, 47 insertions(+), 58 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index ea331a20d1..eeb1263c8c 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2467,3 +2467,44 @@ Aml *aml_i2c_serial_bus_device(uint16_t address, const char *resource_source)
 
     return var;
 }
+
+void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
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
+
+void acpi_dsdt_add_virtio(Aml *scope,
+                          const MemMapEntry *virtio_mmio_memmap,
+                          uint32_t mmio_irq, int num)
+{
+    hwaddr base = virtio_mmio_memmap->base;
+    hwaddr size = virtio_mmio_memmap->size;
+    int i;
+
+    for (i = 0; i < num; i++) {
+        uint32_t irq = mmio_irq + i;
+        Aml *dev = aml_device("VR%02u", i);
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
+        base += size;
+    }
+}
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6b674231c2..fdedb68e2b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -35,7 +35,6 @@
 #include "target/arm/cpu.h"
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/acpi.h"
-#include "hw/nvram/fw_cfg.h"
 #include "hw/acpi/bios-linker-loader.h"
 #include "hw/acpi/aml-build.h"
 #include "hw/acpi/utils.h"
@@ -94,21 +93,6 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
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
@@ -133,32 +117,6 @@ static void acpi_dsdt_add_flash(Aml *scope, const MemMapEntry *flash_memmap)
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
diff --git a/hw/riscv/virt-acpi-build.c b/hw/riscv/virt-acpi-build.c
index 7331248f59..01843e4509 100644
--- a/hw/riscv/virt-acpi-build.c
+++ b/hw/riscv/virt-acpi-build.c
@@ -97,22 +97,6 @@ static void acpi_dsdt_add_cpus(Aml *scope, RISCVVirtState *s)
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
 
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index d1fb08514b..c4a8967310 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -3,6 +3,7 @@
 
 #include "hw/acpi/acpi-defs.h"
 #include "hw/acpi/bios-linker-loader.h"
+#include "hw/nvram/fw_cfg.h"
 
 #define ACPI_BUILD_APPNAME6 "BOCHS "
 #define ACPI_BUILD_APPNAME8 "BXPC    "
@@ -497,4 +498,9 @@ void build_fadt(GArray *tbl, BIOSLinker *linker, const AcpiFadtData *f,
 
 void build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog,
                 const char *oem_id, const char *oem_table_id);
+
+void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap);
+void acpi_dsdt_add_virtio(Aml *scope, const MemMapEntry *virtio_mmio_memmap,
+                          uint32_t mmio_irq, int num);
+
 #endif
-- 
2.39.2

