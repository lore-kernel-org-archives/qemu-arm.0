Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp741840ejc;
        Thu, 24 Aug 2023 07:31:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz+SIDszDvgO6G//tElRWDGQUe+iQexttsurpycpT/B0MAqTZXx6sn464EmEBMjSKdmKjS
X-Received: by 2002:a05:622a:1889:b0:411:fcc1:7bb5 with SMTP id v9-20020a05622a188900b00411fcc17bb5mr2979551qtc.47.1692887487675;
        Thu, 24 Aug 2023 07:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692887487; cv=none;
        d=google.com; s=arc-20160816;
        b=XY4C2E7dvMKWWj26lh29zXS5IZpgkjenq2cxX9viYJJDtorNpluZBSWF06T5D9dbVl
         NOP2itm5ktOLGZxYyoSAsX1ZFnpjkUfGjbBgLfU+ENSgpXbBnOrhUhmgNToC7QL1t2sd
         kpjKPT11xzU9kIJtE7zWlyLC9rlm7WJpnCxtipLrFpq2fHa4wVui75NQ4ieFRlvKltCT
         3hVG+e8TLfHZE7DD+uDTwcj0mF+Uaa9Vl/KTmU4TDP8Hx9S7Vq82TB0TfVPSouadKIs7
         WtST0lTkM464BTJZZ2OrKMQyP8qUdAIBUH96AZJZcwG0hrmmwFBgirH2dhAgzysZo8u/
         DLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7EEtzW/yDSwNYpHxOq+BMaImRS+4pnaLp19/AKav5UI=;
        fh=FstQSHJ5xalY0qvCfwQnzF4rG/Wi+NaC2f1qQ65wDU0=;
        b=MCRoIBS39UdBME1izfJyyBVhVRjh9hQ2ZXOfrOfarDbEpYNDHtP2T83p9a6oPT6HVd
         tL6/pcmk7aUB0YseKiJRgbgG7lVJG3Tk6VAxye+9QLdcwx+qtNJq6WZmWYX8bBrkzFxk
         BxjEd8SL2KFUJZUHAaba/aCI/7cR3eDY0QQAa/Pyu9juUH8kLQ2mI1APxFW/WvJGYklD
         N/uFb8z9k6v4Z3ZHx7y4TswoNI3cJy5UxMvu9Ty1h0tZ9oKOpgr/hMrQMofMlsBW7JII
         65/emT/HgH/t5bJBkfRicCr+slTO9xuzhnhefgEyVGnqroakBZOkTTf7KwAZ8bhiPtIf
         +t3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=d2IaI1B1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 18-20020ac85712000000b00403d7809e5fsi8522174qtw.62.2023.08.24.07.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 07:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=d2IaI1B1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZBLq-0007yO-Fu; Thu, 24 Aug 2023 10:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBLp-0007y2-80
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:30:21 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBLm-0000Ez-SQ
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:30:20 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-26814e27a9eso3909004a91.0
 for <qemu-arm@nongnu.org>; Thu, 24 Aug 2023 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692887417; x=1693492217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7EEtzW/yDSwNYpHxOq+BMaImRS+4pnaLp19/AKav5UI=;
 b=d2IaI1B1MAwbGk+BH2VRO6gWZEs/fzQQjmCw7hUW3l3QlelOUkGGYxflRbq2+tusFF
 ggJk7F/duGxIOONyn5WdzAAEyH75gHAp3YTk08ZMVnoBz1YjEA4rVlyGqJFUwpBU+oZa
 8s+Hm442eLZoQlmiow4xc/eYRQdr4z+CEfer9vryDJkivwCrszn6Q3qcUgz3BjYq2Nk8
 KZiY75M+V2pGA2dznalWKiqe8Qi+CmzWoYW8/8MTfC3glfFPbtMgD4cMVmGBX978wQJR
 YYzoiD4kWBMJw6LzAefg6txpIylTQLpbQwSgps/OMD0BIjGROkl1u0iaoREAPh4de7sw
 27yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887417; x=1693492217;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7EEtzW/yDSwNYpHxOq+BMaImRS+4pnaLp19/AKav5UI=;
 b=lqTCNT40AfRXpeB8MsHbJhvRWxApuc8I4E0R1TOwbwdooNBlH5e0NqHa6fJ7gKZMqv
 kZHk2BWUfSb5u9KH/MGEfOhZcns2esc7CAakemNYvhHegiAZ/FJLTG1XYK+y+acjDxqQ
 DdcA/mQEvBH2JhbC3LuwQ62YdX0w3376RhwUmxGk7+mBXAGN4J0cDwhsVsmXprAeTmlg
 nSEj6jKYj+bkyhtjQQuDT1mlCmm55OAWzBuc1+CYw+5m+XbKxobQ7i5TD2YSLjAwEJ9c
 ltQbPOl8LqcKrw9WW7ibcx/VqUUpNxrjqenI0qWCqBRvKlhi8fN7x90/FJ+BlwFZNSrf
 hUKg==
X-Gm-Message-State: AOJu0Yxbc0AlnX1s4quYL0YGmzijrQCWX1CaqEeeWKBwp/pXENB8neU3
 nm6fqgtSGX83A7KUXQL+177tFd96aHXpFuNq++4=
X-Received: by 2002:a17:90a:854c:b0:26d:1201:a8c4 with SMTP id
 a12-20020a17090a854c00b0026d1201a8c4mr12961399pjw.13.1692887417408; 
 Thu, 24 Aug 2023 07:30:17 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.191.205])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a17090a2bc600b00262fc3d911esm1666864pje.28.2023.08.24.07.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 07:30:14 -0700 (PDT)
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
Subject: [PATCH v2 02/12] hw/arm/virt-acpi-build.c: Migrate virtio creation to
 common location
Date: Thu, 24 Aug 2023 19:59:32 +0530
Message-Id: <20230824142942.3983650-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1031.google.com
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
X-TUID: rP+cXdauQZmU

RISC-V also needs to create the virtio in DSDT in the same way as ARM. So,
instead of duplicating the code, move this function to the device specific
file which is common across architectures.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/arm/virt-acpi-build.c        | 29 ++---------------------------
 hw/virtio/meson.build           |  1 +
 hw/virtio/virtio-acpi.c         | 28 ++++++++++++++++++++++++++++
 include/hw/virtio/virtio-acpi.h | 11 +++++++++++
 4 files changed, 42 insertions(+), 27 deletions(-)
 create mode 100644 hw/virtio/virtio-acpi.c
 create mode 100644 include/hw/virtio/virtio-acpi.h

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index b8e725d953..69733f6663 100644
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
@@ -850,7 +825,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
     }
     fw_cfg_acpi_dsdt_add(scope, &memmap[VIRT_FW_CFG]);
-    acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
+    virtio_acpi_dsdt_add(scope, &memmap[VIRT_MMIO],
                     (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
     acpi_dsdt_add_pci(scope, memmap, irqmap[VIRT_PCIE] + ARM_SPI_BASE, vms);
     if (vms->acpi_dev) {
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index 13e7c6c272..3ae1242bcf 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -75,3 +75,4 @@ system_ss.add(when: 'CONFIG_ALL', if_true: files('virtio-stub.c'))
 system_ss.add(files('virtio-hmp-cmds.c'))
 
 specific_ss.add_all(when: 'CONFIG_VIRTIO', if_true: specific_virtio_ss)
+system_ss.add(when: 'CONFIG_ACPI', if_true: files('virtio-acpi.c'))
diff --git a/hw/virtio/virtio-acpi.c b/hw/virtio/virtio-acpi.c
new file mode 100644
index 0000000000..977499defd
--- /dev/null
+++ b/hw/virtio/virtio-acpi.c
@@ -0,0 +1,28 @@
+#include "hw/virtio/virtio-acpi.h"
+#include "hw/acpi/aml-build.h"
+
+void virtio_acpi_dsdt_add(Aml *scope,
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
diff --git a/include/hw/virtio/virtio-acpi.h b/include/hw/virtio/virtio-acpi.h
new file mode 100644
index 0000000000..b8687b1b42
--- /dev/null
+++ b/include/hw/virtio/virtio-acpi.h
@@ -0,0 +1,11 @@
+#ifndef VIRTIO_ACPI_H
+#define VIRTIO_ACPI_H
+
+#include "qemu/osdep.h"
+#include "exec/hwaddr.h"
+
+void virtio_acpi_dsdt_add(Aml *scope, const MemMapEntry *virtio_mmio_memmap,
+                          uint32_t mmio_irq, int num);
+
+#endif
+
-- 
2.39.2

