Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2998795ejb;
        Wed, 25 Oct 2023 13:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJHbQUCvsjAFexc//nhERR936etjjh61q24sNPPsYgz+nQx7E5nNl/AXr4A4L8tSxCnSKh
X-Received: by 2002:ac8:57c6:0:b0:412:1e51:8fef with SMTP id w6-20020ac857c6000000b004121e518fefmr21396661qta.30.1698264502546;
        Wed, 25 Oct 2023 13:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698264502; cv=none;
        d=google.com; s=arc-20160816;
        b=Ce7YsfwQk/4QnIkGO5tWwPJnoFG4oKhuE72Razgfo2W51KOuvoclgYN2n/lnIyMMpn
         iSris7MHQMNO04d+TmKvSqufot8NN220240HIdc4twXQva9Mp1aIxugLmddebBsrIaMy
         k6ctW8J1Fz9wcHJfRoCIQh3cSHT0vb+FntfBMAzDFIT5o7L/uI5pbhJxOmz2ebR+vZUK
         zC8IIjxO5vjIQfB8solnNZyYTzGpl9PrTs0VgRGk0dz8rNW1rIMxjlB13E9DcfOPNP8q
         PHM0QelSafsRzJav8G8eWE7SEO4TraY0ZrFdrHWbYy5wVN5xElIoivkCN+KuYOFfkgPr
         fL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5+fPnQzrgpqtTZWCE28PffJG9krNjihCkr2hurlEDv4=;
        fh=67Hov/BsT8RxH3/kFZB7fU49Uoc12n1VmFCLNpavJ9k=;
        b=Awb9KZslUeaFLNnIqoAWPVIUQnfGwddPBF35akvOwSB7W3OTY0tn57U3f9xTCrReyq
         cOzXA4avgEvRxNEKeqhltDngyvkiPE8lFJt7P73OqX4FqnY68YDr9N9jMJnDBXI3H0p6
         flpJR7wUiMFI4AQeGjnI2ECvN+fyX/UaO0ah1Cngg9HLSrUjHAQvQwNPt3U2Iuj9fo4K
         ZJz8G4da72QdJKkb9uvldMaiXboq+gbORu491IEMDcwNb9GCTzXTEKsE56IPK7ld44XL
         kPY428F8EvShCkhTWv/Vr+s5UBR02vAXRqqAIYJH0FTnEMkmN1OJSM5H43gGdJ4OL/3e
         oVdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=AcRma1Bc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fi14-20020a05622a58ce00b0041e2342f335si3762350qtb.755.2023.10.25.13.08.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 13:08:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=AcRma1Bc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvkAN-0007Gs-5Y; Wed, 25 Oct 2023 16:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAL-0007Ev-6C
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 16:07:45 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qvkAC-0003Pl-E9
 for qemu-devel@nongnu.org; Wed, 25 Oct 2023 16:07:44 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6b36e1fcee9so112135b3a.3
 for <qemu-devel@nongnu.org>; Wed, 25 Oct 2023 13:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698264455; x=1698869255; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5+fPnQzrgpqtTZWCE28PffJG9krNjihCkr2hurlEDv4=;
 b=AcRma1Bc65xZNcxvgZjZIgHFVyd7YEXhGoKbbj7EstgZpkMFg6zfNxj1D6PELJ06/Z
 bvOSYvTacnjyHOGxZvh09bw3NJYLIJGm03N2onDrCZibsYxT5tP2yAjqfQy/crpfVLlt
 Kw841VNunMfjkYTlM1EkYBhLi8OE8XfncPxG+u6obxJF6XA7YKTqNmJwcM1nV2yfkaBQ
 Ndvg2uOteh+ptnLHz/hnvoC1jYu1xQ/yM4JqLNQkqhBv78Q2/jC4p2iDQGxN8BmHUDTr
 sMzyS+H4uSjKMU336g8NsE5ppDMIpxNzd9TzGs055KdTdbZSx4ONURSazSvBkjRsLfCK
 ClEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698264455; x=1698869255;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5+fPnQzrgpqtTZWCE28PffJG9krNjihCkr2hurlEDv4=;
 b=S8ambQpBPqBgBuV98cx5gzRNAau06C1wVavk/vpSwX/ea3FN+RaaFJfiojuh4Y9bcf
 DLX4yHBH1DhKxZkXPMXS+qte0gUp1gqXN2cIadUQUuiaEB4t2iiUXXqnGNFtDBsTwzgn
 Gdh4gjxMSiGKABo9mT562toPvrEvvgTt8ftGcypiyJ6y3LyCNK7h/L1FlakpV1m+aIg3
 kdQySN624tWegVJr3qjU4FufbKyU1fYd9VwcZs9abbJQfo9ZMOzw16FogUcTeboaXjQr
 ENTsezuZ5aDlyGpGLbETY6JL81q8yipYIG3eiODmgTnMhYW0hiqXupjP6QC+hIyORXFE
 CO8g==
X-Gm-Message-State: AOJu0YzN1L5UJhxBiLs99Ju1dzL2tUd0lXuyGaJxnlRQ4P2LI0bDATyj
 39Uvm03mrT04qOhIKAaioxUVyw==
X-Received: by 2002:a05:6a00:248b:b0:68f:cc0e:355d with SMTP id
 c11-20020a056a00248b00b0068fcc0e355dmr15505589pfv.25.1698264455060; 
 Wed, 25 Oct 2023 13:07:35 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.188.78])
 by smtp.gmail.com with ESMTPSA id
 f1-20020aa79681000000b0068fe7c4148fsm9696768pfk.57.2023.10.25.13.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 13:07:34 -0700 (PDT)
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
Subject: [PATCH v4 02/13] hw/arm/virt-acpi-build.c: Migrate virtio creation to
 common location
Date: Thu, 26 Oct 2023 01:37:02 +0530
Message-Id: <20231025200713.580814-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025200713.580814-1-sunilvl@ventanamicro.com>
References: <20231025200713.580814-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DnLLB52QmKhg

RISC-V also needs to create the virtio in DSDT in the same way as ARM.
So, instead of duplicating the code, move this function to the device
specific file which is common across architectures.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 hw/arm/virt-acpi-build.c        | 32 ++++----------------------------
 hw/virtio/meson.build           |  1 +
 hw/virtio/virtio-acpi.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-acpi.h | 17 +++++++++++++++++
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
index 0000000000..e697058b60
--- /dev/null
+++ b/hw/virtio/virtio-acpi.c
@@ -0,0 +1,32 @@
+/*
+ * virtio ACPI Support
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "hw/virtio/virtio-acpi.h"
+#include "hw/acpi/aml-build.h"
+
+void virtio_acpi_dsdt_add(Aml *scope, const hwaddr base, const hwaddr size,
+                          uint32_t mmio_irq, long int start_index, int num)
+{
+    long int i;
+    hwaddr virtio_base = base;
+
+    for (i = start_index; i < start_index + num; i++) {
+        uint32_t irq = mmio_irq + i;
+        Aml *dev = aml_device("VR%02u", (unsigned)i);
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
+        virtio_base += size;
+    }
+}
diff --git a/include/hw/virtio/virtio-acpi.h b/include/hw/virtio/virtio-acpi.h
new file mode 100644
index 0000000000..babb2915bf
--- /dev/null
+++ b/include/hw/virtio/virtio-acpi.h
@@ -0,0 +1,17 @@
+/*
+ * virtio ACPI support
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
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

