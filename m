Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp812994eja;
        Thu, 2 Nov 2023 20:18:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAmwLEA8B8Ejxtadf9NDKIcRDqbA+5QyBLiBJSCjH4SZaBXX3H9puWgF+9mKPdtUx/y2ZG
X-Received: by 2002:a05:6214:d6f:b0:66d:2140:1f88 with SMTP id 15-20020a0562140d6f00b0066d21401f88mr21937179qvs.5.1698981506294;
        Thu, 02 Nov 2023 20:18:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698981506; cv=none;
        d=google.com; s=arc-20160816;
        b=BcawgeEYmrv9uN7g35/5/EqjqAzpM5zqg2gMvuR5RbWtnsEZ1kjO5sYsE/BokHXbmi
         og5cYvjiw4Z25hR9odAkZoykMjVcXmIuIwJjP14hktze3WM4BKuyKB9pw/kmYUx8h0CF
         VMibWVMQ/wrtUVFbhNkxJL/rTg+NLXSwD7/MYf5uY6TizgfieiIieMZvfmqximuJlrbf
         wA8u6/Gma20rnr3kgCSvuzfpRGzFIU9tyJBzlvaeK5XJVru2uIVrfD2LbNA3xPLdKYzb
         UljTj42hq7VNHjb03mkWBTYp6Zbc1fRsTe2J86cEPXtXGPldJ45KN539tx8eMo1B8XOe
         eVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oBcDk1+727YEVu+u9+AJIE/Wfuh8l0yZTfPwEBn0D44=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=S2FzBSB4nfWRfibQhD8k0A999met+c9Wy1rvVu3n0Hua9acUvNBkQOxuNHx3UXntO3
         zPkRQw3R9TFdVWV2nsZ0hNqQ0pJmG4JJJMAaKe6fZjeNUYBhk5hJjl/bZ5B23i0PXofS
         yip848/yuaswq36/pijo5DoDE2gfS+bjRsPDaGsMBGL8ssM6aUORRreZSW01DVIPbpD4
         kLY12KQ/8GNtIX487496fBjZuktp8ypySDpR4OnaAjdb/EfT5hjx74k94qr1pyG/mmGa
         WGAq8cUM+wM5nN84C0l30ce/LCGbuPi1rF7b4isnK+3MgpnXLbEDzKdwi6jUzauBkS2E
         1ipg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=BqOocE8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1-20020a0562140b2100b0066d0543b654si724938qvj.341.2023.11.02.20.18.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 20:18:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=BqOocE8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qykgR-0007oH-1g; Thu, 02 Nov 2023 23:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgO-0007nL-JA
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:17:16 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qykgM-0003JZ-3O
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 23:17:16 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2802d218242so1609647a91.1
 for <qemu-arm@nongnu.org>; Thu, 02 Nov 2023 20:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698981432; x=1699586232; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oBcDk1+727YEVu+u9+AJIE/Wfuh8l0yZTfPwEBn0D44=;
 b=BqOocE8WqPsuVWcIgWnBa6Dzt/zo+7ZTy2Os95xXC2hHti/fCwr39D69xfYruybcLx
 OVMWWYlvKB6AvD9oZfa53pg4ZaXpBfSCc15I0qY/c2iwh0etYIGzRZdSdQrzOP5Tstqi
 x9zuhL04qQIPwijhuvdCH0kQHEpH8NuSRhWiRUWmXAch3jhIQ6mekBbukAvKdQeSDf2e
 91XBsqJgYtztfWpH+hbT/xBl37d7WRn9/43niHQxi4KEQTwDcGrOvI5+rpoVVl9bFdt5
 Hj+DYrhyj+mdxyFHQe/mRoqQ/0FW7ueVhB+HxqXQN/ou1p2RB7IPVYQCtCpx1GPNnxqm
 LxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698981432; x=1699586232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBcDk1+727YEVu+u9+AJIE/Wfuh8l0yZTfPwEBn0D44=;
 b=UaJF24+uBF74FabzEmHH8AHy221OoB0SG8ULxWXCN/EW86+lC6F57OqbNn8hxbauXh
 Wo50uS3L+27caMoRtifv3eJEFX6Ze0wipVKDckstgCLRnUpcU8hp8UkvLm8NC5pXIE0H
 8GEDQU1UADu7CS5vnJ9/IoqRJScxiJI+Ww2Zu4GgbeS+ckQK/mSrANf9pd0P2DLW2gJR
 k7HbAVT1tUlWlYQjNLHwPq6NOzHK1pSy2P9YSSSuk/ZPnN6MX/PYpcn4jgGsq8Lk0394
 4QqqE8tKP9PsBCXPXrKOel7vva+3Rmp80GkU7UE8K7HQjQnE88jQXJnYIOj9SJEH6Id6
 2xaw==
X-Gm-Message-State: AOJu0Yz2lglhVJm3L4r+lgR5mrcIYaPl2kaEqHHW2fUECTkLgYQ7u2+9
 k6tr4GN4Rb1QzQmszgYUGzx/K2rkRfxOBWpzDFAOQw==
X-Received: by 2002:a17:90b:4c81:b0:280:74fc:6545 with SMTP id
 my1-20020a17090b4c8100b0028074fc6545mr11106853pjb.24.1698981431986; 
 Thu, 02 Nov 2023 20:17:11 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a17090aca9100b0027cf4c554dasm499971pjt.11.2023.11.02.20.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 20:17:11 -0700 (PDT)
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
Subject: [PATCH v7 02/13] hw/arm/virt-acpi-build.c: Migrate virtio creation to
 common location
Date: Fri,  3 Nov 2023 08:46:38 +0530
Message-Id: <20231103031649.2769834-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
References: <20231103031649.2769834-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x102f.google.com
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
X-TUID: CYCKAmfaNttl

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

