Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp848089njb;
        Wed, 27 Nov 2024 07:04:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCULe0SMsgJTNT8m3txwbyjuW4RKS7Rv0siGziZZduLVWeyDx2gl934nGcp0LhnQzh1pNQDt0CxG++qP7A==@linaro.org
X-Google-Smtp-Source: AGHT+IEZWpgsvmA8j+8JcCguTRzC0XOtV8m9Dyhy8UYpj60ZGX/GsXsMETbO83sRqTiXzilWj90f
X-Received: by 2002:a05:6402:22d9:b0:5d0:819b:3cca with SMTP id 4fb4d7f45d1cf-5d0819b3cdbmr2415862a12.8.1732719892011;
        Wed, 27 Nov 2024 07:04:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732719891; cv=none;
        d=google.com; s=arc-20240605;
        b=Vv+QVqgJawQVCAMVR0ukznuB6UA7Om59T0SmScTerli9nVK9wKTImw2RS0alzSHj5t
         oAbbhRKuoiyw3+ovvm4FcaGYTbEzK6Uommb+LwQ1xlLvQnBEkW2gfnK1eliYypzk6JZW
         eJ3EMedc3gS4b6N1+SL5Qrt9tWsOTnUElT8xgQmF7WAS1ATTBp24hUW25hebwIjz2cKn
         Dfb0NgDRwS3G4g4jWtTNpquYuCKhYgrqbcjUYN+VLehP4vnFomlubCPZZTo9cA/G9yS1
         IaYzukZsKlEQRTdaaZU2X80E7PL97h/duVlUZWeZj0PUTeLlxMpkIgJ53kdpg4tpk/L9
         vn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GI0RXs9vlqCEk25LyBl3ZSvpDR95J1zyX9dsyAX9zTk=;
        fh=iTi15bBJ69MfBQEhraOGK9jYcomPpdH22ZY/zg5/wnw=;
        b=hiDwf/E3qrKEtJDtAddWzyYfMaPTnsN7bRl92qXmmOMKqr0uNy5ALzgToiFFuH+x2L
         rFq+iub/cKh0jxRWuWJcMYI2B3pMVEGxPWqlWOJ8g31pkUh7ThCfEDL7ZE5a/sY0XN5G
         mZ5JYeE8b3dN+6g7cIRwgfUKdN4w1phnSHoGq14yYymEOevsolV1kOjgO+CTsioVS/8T
         EA+tCz/4PShOxo3Z2ST72Xjsn6UnSnLb7VgwtvWZW0fGHNzJ3ph21cCB3LmN/ZQN3eSY
         3EKLjgCo1hWTplKnC2JOA7IEwnZG4pdW36zCo+wP2jTcSSydsDd8Hc7Rs0cZyFuulJpZ
         UYzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="C0/Mkl9g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5d06777617fsi3005279a12.359.2024.11.27.07.04.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 07:04:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="C0/Mkl9g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGJae-0007G3-6X; Wed, 27 Nov 2024 10:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJaP-00074N-T5
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 10:04:14 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJaN-0007En-8Q
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 10:04:13 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-434a8640763so14939215e9.1
 for <qemu-arm@nongnu.org>; Wed, 27 Nov 2024 07:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732719850; x=1733324650;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GI0RXs9vlqCEk25LyBl3ZSvpDR95J1zyX9dsyAX9zTk=;
 b=C0/Mkl9gA/jbnqRnB0FkH8LhPHGFujq9UBDfDSA3Rea0nXVQ3mxAsNMoJvPy9/g0GN
 eAK/YM7GBj+vXQPpUcQE9seTjJAh2wvKw5VQQLFJ7k0uRGSERrcKew48HQMsOk64mtBt
 r5TLbbMacrf8C/Un6ZQf4Y0JjH9mrKH4NA5GqZ08JQDnF3FN/a/99rlQBWrxv/pU3ZoR
 n9aKkpzVIJi40PK/Z8psXtjJ1XYnvjaa3NJ7RTlBj3mwjxK5WK2Z/cTUprrMz2MH2q2s
 xUfamBqPjFqeYzNtc4sWXDpYEadbORd7rQhmFKH4rM/gLlGP2SS7eAOB9nkCZz5XcZXA
 aZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732719850; x=1733324650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GI0RXs9vlqCEk25LyBl3ZSvpDR95J1zyX9dsyAX9zTk=;
 b=O3o8aUhzeuXenBJbhN69vy6eb06lLXPp5Po4I9mfQ/cKe4B/iLTjYtVwud4R0HV775
 ormCmDbhlMF95u4yycv6m5ZXGKPZBePIWMFnrLey9ihGgf8VzLzqTAlVhMI3ZibhgShr
 mM/ieCmhODvrl/1sXlzXql4J9TCgHg9EFSDz3IIhLAehoHPw4aAsiaCyohieAWpRcbCI
 eLKvPm6modRbqWG+Ni3jsfHik8ZnTyn0DoXFVrGTxLdszH+5QbxbcCPXatEaLYsVmrwG
 C6nDfcfE7mbCPsmfPd22acmfq9OyBus51b144dZn5cglDMM3eejSNiRVChQUZgyOPDzd
 DvZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUHYnngjnmsR/GZ5uugYvo0+/o2AT2CSmybBaCd4JC9oTzhyu4kVn6txahPxDh4+NRA2k3jwL4GA==@nongnu.org
X-Gm-Message-State: AOJu0YwruZA24w6e42kU9PJu/qsN31FmmKox7alo/lb4R6TKI0t1P3NH
 S5569PzoxLjWz0+m6EtzHDH4Dk0tRKRkM/saZzOxUXZ0Lt7DV+TTINVVlH7kUQ==
X-Gm-Gg: ASbGnctHO2/3luuqcIWZVTqjK7bPwBW1GUUZPvRDAWLgEk76PnIms5i26UefATncwsd
 5hzczbWGaJrIIAPREj0E0dV6uKUcVBbAOGco021WFqQmlwxaQOxIY3LnwO84hM0S9GaxX2ctb/a
 oR04D/WCeJ0t7crn8EnD43Jgxabdg8Nkv8b3M5QRGrlF8S6tocBze2g7xyk8dKZLbxJ1OPhFDqC
 9Yxa38j0G69N4tK1dcO4t/nWLNucNqk1Sg8XSuSx0e1XCcPSSBJs2TPaaOt9gbTvd176AzICkXk
 1LFGxylpXc8AKzPsmZDWRJVFhA==
X-Received: by 2002:a05:600c:4ece:b0:432:b38e:a048 with SMTP id
 5b1f17b1804b1-434a9dbeb5emr31450835e9.12.1732719832287; 
 Wed, 27 Nov 2024 07:03:52 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e256esm23339155e9.32.2024.11.27.07.03.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Nov 2024 07:03:43 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu
Subject: [PATCH v11 03/15] hw/display/apple-gfx: Adds PCI implementation
Date: Wed, 27 Nov 2024 16:02:37 +0100
Message-Id: <20241127150249.50767-4-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241127150249.50767-1-phil@philjordan.eu>
References: <20241127150249.50767-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::32e;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: LihO9Z7frDpE

This change wires up the PCI variant of the paravirtualised
graphics device, mainly useful for x86-64 macOS guests, implemented
by macOS's ParavirtualizedGraphics.framework. It builds on code
shared with the vmapple/mmio variant of the PVG device.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
---

v4:

 * Threading improvements analogous to those in common apple-gfx code
   and mmio device variant.
 * Smaller code review issues addressed.

v5:

 * Minor error handling improvement.

v6:

 * Removed an unused function parameter.

v9:

 * Fixup of changed common call.
 * Whitespace and comment formatting tweaks.

v11:

 * Comment formatting fix.

 hw/display/Kconfig         |   4 +
 hw/display/apple-gfx-pci.m | 150 +++++++++++++++++++++++++++++++++++++
 hw/display/meson.build     |   1 +
 3 files changed, 155 insertions(+)
 create mode 100644 hw/display/apple-gfx-pci.m

diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 6a9b7b19ada..2b53dfd7d26 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -149,3 +149,7 @@ config MAC_PVG_MMIO
     bool
     depends on MAC_PVG && AARCH64
 
+config MAC_PVG_PCI
+    bool
+    depends on MAC_PVG && PCI
+    default y if PCI_DEVICES
diff --git a/hw/display/apple-gfx-pci.m b/hw/display/apple-gfx-pci.m
new file mode 100644
index 00000000000..5ff6a487cfc
--- /dev/null
+++ b/hw/display/apple-gfx-pci.m
@@ -0,0 +1,150 @@
+/*
+ * QEMU Apple ParavirtualizedGraphics.framework device, PCI variant
+ *
+ * Copyright © 2023-2024 Phil Dennis-Jordan
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * ParavirtualizedGraphics.framework is a set of libraries that macOS provides
+ * which implements 3d graphics passthrough to the host as well as a
+ * proprietary guest communication channel to drive it. This device model
+ * implements support to drive that library from within QEMU as a PCI device
+ * aimed primarily at x86-64 macOS VMs.
+ */
+
+#include "apple-gfx.h"
+#include "hw/pci/pci_device.h"
+#include "hw/pci/msi.h"
+#include "qapi/error.h"
+#include "trace.h"
+#import <ParavirtualizedGraphics/ParavirtualizedGraphics.h>
+
+OBJECT_DECLARE_SIMPLE_TYPE(AppleGFXPCIState, APPLE_GFX_PCI)
+
+struct AppleGFXPCIState {
+    PCIDevice parent_obj;
+
+    AppleGFXState common;
+};
+
+static const char* apple_gfx_pci_option_rom_path = NULL;
+
+static void apple_gfx_init_option_rom_path(void)
+{
+    NSURL *option_rom_url = PGCopyOptionROMURL();
+    const char *option_rom_path = option_rom_url.fileSystemRepresentation;
+    apple_gfx_pci_option_rom_path = g_strdup(option_rom_path);
+    [option_rom_url release];
+}
+
+static void apple_gfx_pci_init(Object *obj)
+{
+    AppleGFXPCIState *s = APPLE_GFX_PCI(obj);
+
+    if (!apple_gfx_pci_option_rom_path) {
+        /*
+         * The following is done on device not class init to avoid running
+         * ObjC code before fork() in -daemonize mode.
+         */
+        PCIDeviceClass *pci = PCI_DEVICE_CLASS(object_get_class(obj));
+        apple_gfx_init_option_rom_path();
+        pci->romfile = apple_gfx_pci_option_rom_path;
+    }
+
+    apple_gfx_common_init(obj, &s->common, TYPE_APPLE_GFX_PCI);
+}
+
+typedef struct AppleGFXPCIInterruptJob {
+    PCIDevice *device;
+    uint32_t vector;
+} AppleGFXPCIInterruptJob;
+
+static void apple_gfx_pci_raise_interrupt(void *opaque)
+{
+    AppleGFXPCIInterruptJob *job = opaque;
+
+    if (msi_enabled(job->device)) {
+        msi_notify(job->device, job->vector);
+    }
+    g_free(job);
+}
+
+static void apple_gfx_pci_interrupt(PCIDevice *dev, uint32_t vector)
+{
+    AppleGFXPCIInterruptJob *job;
+
+    trace_apple_gfx_raise_irq(vector);
+    job = g_malloc0(sizeof(*job));
+    job->device = dev;
+    job->vector = vector;
+    aio_bh_schedule_oneshot(qemu_get_aio_context(),
+                            apple_gfx_pci_raise_interrupt, job);
+}
+
+static void apple_gfx_pci_realize(PCIDevice *dev, Error **errp)
+{
+    AppleGFXPCIState *s = APPLE_GFX_PCI(dev);
+    int ret;
+
+    pci_register_bar(dev, PG_PCI_BAR_MMIO,
+                     PCI_BASE_ADDRESS_SPACE_MEMORY, &s->common.iomem_gfx);
+
+    ret = msi_init(dev, 0x0 /* config offset; 0 = find space */,
+                   PG_PCI_MAX_MSI_VECTORS, true /* msi64bit */,
+                   false /* msi_per_vector_mask */, errp);
+    if (ret != 0) {
+        return;
+    }
+
+    @autoreleasepool {
+        PGDeviceDescriptor *desc = [PGDeviceDescriptor new];
+        desc.raiseInterrupt = ^(uint32_t vector) {
+            apple_gfx_pci_interrupt(dev, vector);
+        };
+
+        apple_gfx_common_realize(&s->common, DEVICE(dev), desc, errp);
+        [desc release];
+        desc = nil;
+    }
+}
+
+static void apple_gfx_pci_reset(Object *obj, ResetType type)
+{
+    AppleGFXPCIState *s = APPLE_GFX_PCI(obj);
+    [s->common.pgdev reset];
+}
+
+static void apple_gfx_pci_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *pci = PCI_DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    rc->phases.hold = apple_gfx_pci_reset;
+    dc->desc = "macOS Paravirtualized Graphics PCI Display Controller";
+    dc->hotpluggable = false;
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+
+    pci->vendor_id = PG_PCI_VENDOR_ID;
+    pci->device_id = PG_PCI_DEVICE_ID;
+    pci->class_id = PCI_CLASS_DISPLAY_OTHER;
+    pci->realize = apple_gfx_pci_realize;
+
+    /* TODO: Property for setting mode list */
+}
+
+static TypeInfo apple_gfx_pci_types[] = {
+    {
+        .name          = TYPE_APPLE_GFX_PCI,
+        .parent        = TYPE_PCI_DEVICE,
+        .instance_size = sizeof(AppleGFXPCIState),
+        .class_init    = apple_gfx_pci_class_init,
+        .instance_init = apple_gfx_pci_init,
+        .interfaces = (InterfaceInfo[]) {
+            { INTERFACE_PCIE_DEVICE },
+            { },
+        },
+    }
+};
+DEFINE_TYPES(apple_gfx_pci_types)
+
diff --git a/hw/display/meson.build b/hw/display/meson.build
index cf9e6dd35d2..94f4f05d36f 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -63,6 +63,7 @@ system_ss.add(when: 'CONFIG_ATI_VGA', if_true: [files('ati.c', 'ati_2d.c', 'ati_
 
 if host_os == 'darwin'
   system_ss.add(when: 'CONFIG_MAC_PVG',         if_true: [files('apple-gfx.m'), pvg, metal])
+  system_ss.add(when: 'CONFIG_MAC_PVG_PCI',     if_true: [files('apple-gfx-pci.m'), pvg, metal])
   if cpu == 'aarch64'
     system_ss.add(when: 'CONFIG_MAC_PVG_MMIO',  if_true: [files('apple-gfx-mmio.m'), pvg, metal])
   endif
-- 
2.39.5 (Apple Git-154)

