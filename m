Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp521563njb;
        Fri, 13 Dec 2024 07:22:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXxc7dIFdh64CAg44VWCES+MXiUiaS246Wk+q/0XT82JHCoYIbp5ICGCZIcwFCOnzINnKovE9zMb9ljHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEM9yOc4mpcXtfSvAZnSOSbi9YVF3hOIiVb1DynsbxTqNIglqXWuPD7KYHos6Fj1wph9Jsd
X-Received: by 2002:ad4:5aa1:0:b0:6d8:9e7d:ad4 with SMTP id 6a1803df08f44-6dc8ca6c3f5mr53196936d6.14.1734103323192;
        Fri, 13 Dec 2024 07:22:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734103323; cv=none;
        d=google.com; s=arc-20240605;
        b=jpxaQjNOreNKJlsz7D3jTO+5KXy1TMzm/YTIdac6VgWe34exkdOcYtLkj6EVtaIeW1
         Mx+uZAXOj9RyyBZ6ng0p7MrnjWUtVJ7mFURZIC/4S/01/n24CmzAz2jHjwdlucCLKTL0
         7vhu/99KZDY8Xhsj2mVlKPYp0pyaPCdYCjND6ktKpdIVyqo7HYMI0B+ol6mP06vSbWGL
         jTOXugZUgScr7enUeH753XAkQBy+X3SCq5WxbXFD4k9fgZGjaaQ4Vk0L8XNazthHWC7Z
         y7GcirBoKWkF4/mQdzsTSfLgk3QzTF4ycFZzT/u/9UGpD94GWy9KvHUXB5yB5jWc+bN4
         bo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=l9CSE0Le6C9EUk9Pa8FAy+M2SSGHzc5sfGAFZk3Ode0=;
        fh=WQuVZtx3xyX+fwMDbZ+9myprtT43wDMz9aB3bKLkIGw=;
        b=gBse3iYYDNCDuO7iHOCGM4oO1UBojHIEPDH39UQhxoUI1hct5LIdlACPAtpaiX3U2G
         Oaly3xzqRvvYZrkBzBFLHEdBUiI5hx3mvDC3m/BMVfLrj5xO7E+5HgcySFSTBmSnqnJm
         MWhxq1OYGba45XTjb3g9cBJnDz2Cbjd71A49upmjmlM3XgNoY7v2ykqrlMXU9n/wXeyN
         sHuAcVWLcTwogJs33nxLww87nPFruHB5CWAQphVcVnrmaLiU/3VVmHIuRmXFyooVLH1j
         nPVaFnIAA/d2RNz42bMMhsmKPANf9oRCjmghapGKE31A05B6jkYwp39ibpvIzKcFSBMc
         ctGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=IXUL7Dsj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d9326d8b86si81606126d6.408.2024.12.13.07.22.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 07:22:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=IXUL7Dsj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM7Sl-0006X8-2U; Fri, 13 Dec 2024 10:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7Rz-0004fe-Tr
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:33 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7Rk-0005I8-Ud
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:28 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa69077b93fso275602366b.0
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 07:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103153; x=1734707953;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l9CSE0Le6C9EUk9Pa8FAy+M2SSGHzc5sfGAFZk3Ode0=;
 b=IXUL7DsjjLU5qRkEVBcBxmRR1jPAnytRbddClZqReYyZEIdOusjHjmi+BrL4CVCm9t
 +xtOiXP+qOrb5PuXU/+IYMKI8AJfsE3fKrVDmzWuZ8HKn6BNoLXfxvJ/bb6Od9wzXuXu
 ZpOPoMVkU5f83d2eux3ksCBu9rchpSpk/iWl8vZTdEWEhwlqhZOEFpF1n/VAuERnREpo
 3C6rS7rFfbd64I3wgKAHvyJYXYy2P6U7hWx5gADQYbGA+ee12jelwuCrB5yLSHBT8JWq
 s4I2yguLGYr6E26HpJSIF5TJr0LSEtBkKuXVgcFtgWEvYC/G4fWpaP8QnPYWo6zgl4YW
 jajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103153; x=1734707953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l9CSE0Le6C9EUk9Pa8FAy+M2SSGHzc5sfGAFZk3Ode0=;
 b=pel45Esmqoetsd70jNkFbyR02zL61FCEA1Y/YIykd52quxSxF5hxhPjsNDucSITuUi
 Ot5YOEP5z/iUdS3nOfUBfq3kp837pyiUf0ANqPLiBG1pGwRnZfbiOw3bd9mFEXJuf+Se
 71RMzfOeylwNExaYDP83LWeQBZQ+BBVu00RFEuFnCsWGhO3d0b9TWEHza0QnkGAXJhln
 +3Bwf6EcJalFJUvNhd97OImHRcZxfHBl2Q/H+uZ4hHfIZiHAekXnlhBB1nYbatf2NmNP
 d44dnToP1+R4Lv/KJpEuzZ+0B5BJbllVGkXlwogOLVgbJ0Qu4TuREmgjyo8Bfk/cHaw6
 FSRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+uUqyr+9ufQRaqVIBjOFv6Pk64Wab+Z3knrYl2cnRKGHsU9wZ/ixa89yU5uuy2UN6Vig4NraR6A==@nongnu.org
X-Gm-Message-State: AOJu0Yw6mLgXSGGlsSSGmPZDucX5WpsFDnhVKgo1FaXnqBg+6XtB4Q1O
 HcLZMe0X01e9PCEbFDWI5Ro4SPHGbtAbXhN6mqZa8eVrfHdlxo3aWIzcVrphRA==
X-Gm-Gg: ASbGnct5LrHANNGRLF/JwoomP2zAxNyH2rME/ls8mx6+dL3oUfhUXWrgFEIOO1OthAY
 +S6u71CKxMNJZFezZTY7uotxYhoebqlWh0q/Cl/bUxwFhj7HSNSrN+XlPNRaOzo/j8ZQ7/5KEHB
 9bmftANf1/+AVJY3H0jvqLMQFxkSgv5V2f7Pb8CAEt7u5lrMv445qnbdFzOSHizM9t/lN3HVMdo
 2GJQ2s5XHPM0PTRDrIKhWzwZoFq+gW2+1IKdV8/bFKN0KgH5zQxVn3mNhrEdzeE3tYMbyiFHLT3
 lmBFMxm1VlB3XtYAvg1G5X+458K9VMzd
X-Received: by 2002:a17:906:c107:b0:aa6:a732:2129 with SMTP id
 a640c23a62f3a-aab779ab5dcmr267653266b.28.1734103153460; 
 Fri, 13 Dec 2024 07:19:13 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.19.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:19:13 -0800 (PST)
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
Subject: [PATCH v14 03/15] hw/display/apple-gfx: Adds PCI implementation
Date: Fri, 13 Dec 2024 16:18:09 +0100
Message-Id: <20241213151821.65748-20-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::634;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x634.google.com
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
X-TUID: YROAEjNdThnR

This change wires up the PCI variant of the paravirtualised
graphics device, mainly useful for x86-64 macOS guests, implemented
by macOS's ParavirtualizedGraphics.framework. It builds on code
shared with the vmapple/mmio variant of the PVG device.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
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

