Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp741107ejc;
        Thu, 24 Aug 2023 07:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuKy90N/a2DIz+8K8mXPfDRwmYTNKUeb+Bqugedehl5F64bbO06gMJKd3nsXqvpiTRVp7d
X-Received: by 2002:a05:6214:5f0f:b0:649:dc3e:d75d with SMTP id lx15-20020a0562145f0f00b00649dc3ed75dmr16159500qvb.15.1692887430030;
        Thu, 24 Aug 2023 07:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692887430; cv=none;
        d=google.com; s=arc-20160816;
        b=CpDQQiLOa/vAQLZ5/rDYiGaq6zS1bH6zLkf6WOD9YhHPW8OeahWpr+8e7CpLvpH+Ql
         5brdJ7/Fv6aXjTFjRGvGaKV1u8iU0x75Lzj4TPSALY8ToN9Sjt40DHP10oITdOnhqqHf
         eEimEKl08ji9rchnfzr9J96Ii050QDQZ1XdNJPtAgCKB+ICG7fWpLOzw3R9Rg1zzI/lY
         4q1uPGViBIH4BSRsao5vCGHZT69H72jXFn6cAXVPXxHii/yEzje99ZWyL2G2NyaMharG
         iGSE3o1gzZ433Lg797tB6bk65Vd564EndZJ0OSwCMoscN3kbQOV5QHgOAY/y+0j7zb6d
         0Vaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zfFqdPtHLQvYRAvHSc2Gm780+2CB9SAvKYRl85qGXZA=;
        fh=FstQSHJ5xalY0qvCfwQnzF4rG/Wi+NaC2f1qQ65wDU0=;
        b=tu/egqWLMw0wgXKDIesB+gLof+BPW1xTXHtTKrYHgTvoXqIOeOoD3mj0N5LKCc4/Fz
         sXcvf+/U+o+bypDLnAondC6pMb5+caNJLWrndL69+qTl5kdIYA2G8IU2lm4rg5OHnI8o
         J5VZUzVlV+m+R7ZC6pyA8H5Q9d4tUJBoHhw62W9reyrjfdARR40Yx4Z0f+e81dEemo7h
         EkD0/PuT4qoA54k+jolzr/IiciVmR4mE5zgTAlYk3x6XmfKsPHh8o0lAzV69HWYjqmua
         /SBGmXGRDwtVrQp6KObXBrndEBA+K8TlddTX6qd0RkaUp8VyKMwlMLwG9y23bc5h9+8l
         cVtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=mgq0+C+7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16-20020a0ce4d0000000b006471113a98dsi7112473qvm.441.2023.08.24.07.30.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 07:30:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=mgq0+C+7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZBLi-0007ug-KV; Thu, 24 Aug 2023 10:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBLh-0007st-5A
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:30:13 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qZBLe-0000AZ-5x
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 10:30:12 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1cca7cf6e01so2033316fac.0
 for <qemu-arm@nongnu.org>; Thu, 24 Aug 2023 07:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1692887408; x=1693492208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zfFqdPtHLQvYRAvHSc2Gm780+2CB9SAvKYRl85qGXZA=;
 b=mgq0+C+7gmDwNTPYlqftuvmbyhtxrT+Ae/6iKjpKUJ4jlrpuh9yqBDKxrQZmeAYaev
 GtdCSabE7lxlYfPITN8rYr0i6XFSAUC2XvTsf9l2zk2aJi/31U155fkKnF5M/WEA0clD
 4tnk4EFkYGSqD5wpchL1LFBzsOjDflyokJc6v5JczXek4Ik4xH2RWLC51S3h+y2CHFgm
 uYDjuMvH5k64Hb/ZV7/zAToHdZjPYvGP1H03xrAMV/VRu7ryEv78YUfUuuaTocymM+2y
 Ac1+NlF0WZOJFuGG2LPBb4YhLU6H966z+4JKUQ1X7FSF9DkMHDSaNhZYSHYHcpvt+rPk
 8ufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692887408; x=1693492208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zfFqdPtHLQvYRAvHSc2Gm780+2CB9SAvKYRl85qGXZA=;
 b=FeR/KwWo+14kjyBITCW3rXGdbCRF9+TdtAkksZLk3xy29zolUJGrWkjXpkaUPgF1o4
 Ac4ok+I8i2VwHh6zfn5jB1gXKM1HgX+XLLWoSqqkCsFVdP+gCAG+usUlmzdbJe7jjzq7
 EeIEAwgAZ4gI2RWkB/7MKW4P8b6pw1VPYQcGGejQr9mi+7UYS0YuE3WgnWxXa1DSVpLN
 mfG4NL3SpBL/ppkVVS2STK6xKmQcFP9388l7khYVehlNG5vTwu0Lwq85CmyB6OFAa5vK
 aYO2PAac3Ut82Fhhm5VA4YiIB4ZpDrEJGGXk8xJ0T20MC8xAs7MaZ/ZLxvjS0/2JN6Mv
 sNPA==
X-Gm-Message-State: AOJu0Yw6jATp7gVTZVSA6HsXx3i4rsvYOwaZ4b9iqu8yppXGF53V4AgY
 VZMvxMWd9CztE3mfF0YieC9edhQcjWB+PDSJltw=
X-Received: by 2002:a05:6870:c154:b0:1bb:eb37:1d69 with SMTP id
 g20-20020a056870c15400b001bbeb371d69mr16610212oad.14.1692887408653; 
 Thu, 24 Aug 2023 07:30:08 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.191.205])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a17090a2bc600b00262fc3d911esm1666864pje.28.2023.08.24.07.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Aug 2023 07:30:06 -0700 (PDT)
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
Subject: [PATCH v2 01/12] hw/arm/virt-acpi-build.c: Migrate fw_cfg creation to
 common location
Date: Thu, 24 Aug 2023 19:59:31 +0530
Message-Id: <20230824142942.3983650-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
References: <20230824142942.3983650-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: u3hqDd6nA+6B

RISC-V also needs to use the same code to create fw_cfg in DSDT. So, avoid
code duplication by moving the code in arm and riscv to a device specific
file.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/arm/virt-acpi-build.c       | 19 ++-----------------
 hw/nvram/fw_cfg-acpi.c         | 17 +++++++++++++++++
 hw/nvram/meson.build           |  1 +
 hw/riscv/virt-acpi-build.c     | 19 ++-----------------
 include/hw/nvram/fw_cfg_acpi.h |  9 +++++++++
 5 files changed, 31 insertions(+), 34 deletions(-)
 create mode 100644 hw/nvram/fw_cfg-acpi.c
 create mode 100644 include/hw/nvram/fw_cfg_acpi.h

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6b674231c2..b8e725d953 100644
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
index 0000000000..4eeb81bc36
--- /dev/null
+++ b/hw/nvram/fw_cfg-acpi.c
@@ -0,0 +1,17 @@
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
index 988dff6f8e..69e6df5aac 100644
--- a/hw/nvram/meson.build
+++ b/hw/nvram/meson.build
@@ -21,3 +21,4 @@ system_ss.add(when: 'CONFIG_XLNX_EFUSE_ZYNQMP', if_true: files(
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
index 0000000000..6e2c5f04b7
--- /dev/null
+++ b/include/hw/nvram/fw_cfg_acpi.h
@@ -0,0 +1,9 @@
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

