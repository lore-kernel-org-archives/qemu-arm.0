Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp852704eji;
        Mon, 18 Dec 2023 07:04:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBVLVg0B/oQW6VoDwbzRLxk61v8rQeKsROh9Ieda7X8QVyLtVUkODZJ+Hx6qlOomT3c/1p
X-Received: by 2002:a05:6214:2604:b0:67f:2107:f5a8 with SMTP id gu4-20020a056214260400b0067f2107f5a8mr6073628qvb.101.1702911848844;
        Mon, 18 Dec 2023 07:04:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702911848; cv=none;
        d=google.com; s=arc-20160816;
        b=U7mLsHqgWzGH9ZzaQ11lC11SCbnp1KkuSh3uL0OALvONX+tGdrOj4jpbpPji28sJbz
         a1KNbawDlegDfhtZrl6sih2b6BPrH0Zy9fKZyF6TRWjeAZVmuC/FG7kYuz0elXMm1Fuu
         eES5giiO+WhKjrj29TWiKB8nriVkxBmlCsKrUT7euwLIr3jbKgkXTVnILCqXrMXVpF1g
         k6JiXSzj5ovWI53MJwCBGCeDtcrl8Nxn5ttAFpeyYHBqo2DTNDMtaFC187uyG0uL4s+o
         18d8ROilsnSqbKksFtOXemB7vsGE9jNS+Wy9E5zHYKO8AlUGUSGKYB1CyE941ySOBK1m
         VQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YqEu8y/fycF18bWSiUgmSRlSyMN/q8PlGWmJIdYzAdk=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=iftXjilfLv4bZ0PXlZkOXP6klMhTMkNnWRFn+mWklWqI77W5PE47OY3pt2yC5UVgiE
         mlOInT+x5Y3lVSIsWILGBTVQRaHYvXWCbhEed8LLjjMWhBxf65Y2Jth+apmCtf5OJfY4
         01mJJNmHFbYVTZmJcvvtiZcPmznF0pg5PsOBP6n3d7cvPaT14b/WlfvlcxFJSDMkmDCv
         4mPcRSleRnJG7TxO3ppbYBRc6jRClYXpUn1hlXY1X8UYxt6WIwAS708Y+tK10nKlJVDh
         lk/uTypZ+T4PJhxwnTqFmePhNBgc0nZOP3o0CmfzEzxIA8Vb7kLEh//E7sIRrYJLYTZe
         uPIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=WoOuXFct;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20-20020a0cdf14000000b0067f30997ec4si4508199qvl.414.2023.12.18.07.04.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 07:04:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=WoOuXFct;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFF9Q-0001XY-6V; Mon, 18 Dec 2023 10:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9O-0001Tn-Lq
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:03:22 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rFF9E-00079o-T4
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 10:03:22 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6ceb2501f1bso2942493b3a.0
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 07:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1702911790; x=1703516590; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqEu8y/fycF18bWSiUgmSRlSyMN/q8PlGWmJIdYzAdk=;
 b=WoOuXFctq2z++rBQgkUohDMT0pYY6lO7TRvPsZkc89FEutZh/PnZ2EmkrzI2VyoWGm
 +1TyveLBgWXVzdQ0h0gQ27vYGSps1d4k0vsw2Sk8chqMLgHxJMxw/p+aaz1ns2yvAR2t
 azb11bzF52/e8RPbL60v92K7dOKtsdgB7La6GReN6DghQ/PDv8EojUXXu3a6MF56g8z0
 xbQopo1UHeBkBT4NVZ1EnEiq5R/ze3VHOqSHtrU9Nf+spoZAM9QzmmELfiKF2FLYvVKs
 Uyq0QshZn1Kr8UptENBRuRRpT0H5XZlqP+cewsgQPMxrASzK2hTYxSEXidWFchhkgjJ2
 jXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702911790; x=1703516590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqEu8y/fycF18bWSiUgmSRlSyMN/q8PlGWmJIdYzAdk=;
 b=VSKXcR6GH5Hm+Gf1nd/HOP1WRiLCLIriLHnkD4yYpx8gasu1V88AZQwJK3/BjHmT/n
 hikulRamoJknTMeXy0IOxoCN259da+5YG7BbWtmxab2VaabgLCTgqyTMVN5BIYqxXBXe
 WquoBOnJ9z/A77Zu9EhSvISRy8mkQuCNFiB9X8FOompveXR92sGCKQaGUK0JjkysXxJ7
 CjJTLdP8j31yjAFZHtC5CD5QHw8/bCJaQla5MZLuCdCMEz43oegF6EuWSiSlxvy1/jJQ
 S54YulBMM45cSXDK6xwmQiIXsaRAxHF/Fk6mlbezbHRDpucmoREPxVR/dYG+qwH9C8Gn
 pf2A==
X-Gm-Message-State: AOJu0Yy6KwLfLvcIUo0rX/JKgME7mComI9NZp0SmCTT7l62qzwlteOJH
 ZrMcs6BwOWdmfUNFEnDGKFxO8lYzXrlEug31Q7g=
X-Received: by 2002:a05:6a00:10c1:b0:6cb:a1fe:5217 with SMTP id
 d1-20020a056a0010c100b006cba1fe5217mr18333893pfu.16.1702911789997; 
 Mon, 18 Dec 2023 07:03:09 -0800 (PST)
Received: from sunil-pc.Dlink ([106.51.188.200])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a056a000a0100b006c06779e593sm18975505pfh.16.2023.12.18.07.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 07:03:09 -0800 (PST)
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
Subject: [PATCH v8 02/13] hw/arm/virt-acpi-build.c: Migrate virtio creation to
 common location
Date: Mon, 18 Dec 2023 20:32:36 +0530
Message-Id: <20231218150247.466427-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218150247.466427-1-sunilvl@ventanamicro.com>
References: <20231218150247.466427-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42d.google.com
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
X-TUID: GJq4pVh8FDW4

RISC-V also needs to create the virtio in DSDT in the same way as ARM.
So, instead of duplicating the code, move this function to the device
specific file which is common across architectures.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt-acpi-build.c        | 32 ++++----------------------------
 hw/virtio/meson.build           |  1 +
 hw/virtio/virtio-acpi.c         | 33 +++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-acpi.h | 16 ++++++++++++++++
 4 files changed, 54 insertions(+), 28 deletions(-)
 create mode 100644 hw/virtio/virtio-acpi.c
 create mode 100644 include/hw/virtio/virtio-acpi.h

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 565af9b7ea..510ab0dcca 100644
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
index 0000000000..e18cb38bdb
--- /dev/null
+++ b/hw/virtio/virtio-acpi.c
@@ -0,0 +1,33 @@
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
+    hwaddr virtio_base = base;
+    uint32_t irq = mmio_irq;
+    long int i;
+
+    for (i = start_index; i < start_index + num; i++) {
+        Aml *dev = aml_device("VR%02u", (unsigned)i);
+        aml_append(dev, aml_name_decl("_HID", aml_string("LNRO0005")));
+        aml_append(dev, aml_name_decl("_UID", aml_int(i)));
+        aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
+
+        Aml *crs = aml_resource_template();
+        aml_append(crs, aml_memory32_fixed(virtio_base, size, AML_READ_WRITE));
+        aml_append(crs,
+                   aml_interrupt(AML_CONSUMER, AML_LEVEL, AML_ACTIVE_HIGH,
+                                 AML_EXCLUSIVE, &irq, 1));
+        aml_append(dev, aml_name_decl("_CRS", crs));
+        aml_append(scope, dev);
+        virtio_base += size;
+        irq++;
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

