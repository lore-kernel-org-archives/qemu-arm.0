Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp4343537njk;
        Mon, 23 Dec 2024 14:19:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUuqFtIKbayqy9mWy+85cK3ZVsxdHMQFXeZmBsjqv0bwIVe8UJTk0PgMgsHUavKr1yXMAcTx9ueTfyWRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFvJH42ct6QvWKqxzHRyCDMJqCRI8heJ/p/7zdeyic7lc5NPyBx4gRL1JEk/653hJPStM13
X-Received: by 2002:a05:6214:c6b:b0:6d8:af66:6344 with SMTP id 6a1803df08f44-6dd2330afbcmr233425826d6.2.1734992388887;
        Mon, 23 Dec 2024 14:19:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734992388; cv=none;
        d=google.com; s=arc-20240605;
        b=QSs0q5Uuh45gTjpvIvckbBvA3OHbwrJlZjRbNAKKqKDfe/awekaKNh2DO2iE32FDB+
         FKutbs1c0qLxrg0bc1kM9pLCAYEQruyxQW1vGJ2ouITRydtjVL5e7FtqfuWSKM3ertGj
         3xuOpx35hYHv5cIBC4bwKoWRP5hJmt7UXswhKgbJRSORzcqyifwBedBwZAHlsTl8Kr1e
         a+P/AKOiUhodLDqsCHnWs3zH1mthB/VYHiueSAEai+59HKA0XUIkXLzAqqoq/NVZ3C5U
         2B1799v9tVUWbsARdUv078UuqqmH2xAls4ztBPaN8FklN+tBJcd8w9zMez5NQbqQtGhe
         w85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TIRatgzSFkl09IQb+9ZydXiSr5OkE2BgWIJQfracaS0=;
        fh=5UJxWpyPaQyILWFVu4i59c6hdvYXHkuuqHX6lMFhQcs=;
        b=URn/OvrKSUev3EEtnsz738CUcLq6GveYhZ2Hu5Lxgnbn7btVZBcTEjlfSG94ZShzK/
         gx04jqvoJhgj4VHPhyp35XNFPMUrfJ5psB7GjzNj8yV5cwyKmMlThvGdvyOUbXqWEZ/L
         055MSSDMewlQewGP/se0Ip4Hl/qsBPsYGGURfoDnM4irl2mo1akDE9IWLiQH4JqLCIvX
         JneFVQtve2wNIHAePShHXIoq4K3ikHBNurpOlagNJIiRcrlZ4VHOZE/Tujya5TFaWSKS
         Mu8aYBbQYlf67QIYx2mAb4Qttmfe+SKB6BdrXnCibtJIXdfYm0YHmqmpXVlAxHmQX4xf
         0Ylw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=MuGQenrg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ec00ab1si124011251cf.653.2024.12.23.14.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2024 14:19:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=MuGQenrg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tPqk2-00028w-LV; Mon, 23 Dec 2024 17:17:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tPqja-0001xu-7b
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 17:17:07 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tPqjV-0006vA-OC
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 17:17:05 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4364a37a1d7so48364825e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Dec 2024 14:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734992220; x=1735597020;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIRatgzSFkl09IQb+9ZydXiSr5OkE2BgWIJQfracaS0=;
 b=MuGQenrgVvsOWpu8Im5EXgARVInxeQgv4Zt8Rd3+094DPU1fOp447iYegbi8nhDqgs
 vQLpSHvhj9ZQic8j/XWNhtnhc6Fd+vxg/8fs8Teqv8ukoWkDzwg/kcUL6ymaQsIGj4QB
 4TUVbEnFxn0AkrD2ZVmz6BLnpaSihdMVcN7ZTzYQgb2knIDuwOL+iRDPTP67+pgcDhR5
 XCCw8j163W4HvPTMN8ZL1D4l/sFmf8w4/qufeGG8Eb9V/Q6CqYGA0sUUllpByPhIx/X1
 JYmH21Xt9TYOsn9gzDmO6svvprXCfuIDjQEhez1TU9U/QeW2W2ESF00gPOz1WIy0OYFm
 z7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734992220; x=1735597020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIRatgzSFkl09IQb+9ZydXiSr5OkE2BgWIJQfracaS0=;
 b=uqYJ21ZzDXEWSi3JuT5zPGmFhtJnuWpL4BdnywWYXrIs1Mm2H/QxtcqTTkQu17R6xr
 0usyA/89GPzEwaVMP3mxvVTeIzJZAXgenUVW+opboR3vUQd9cYvn0apqv6FBIo0Zfpqt
 R13ekwfEtQGI4iB6E4ZklRGAjFS3RpVS4sODeB4PDtN/IpohJfaNu6ajXRQvjR7FCSPf
 sPYNsbizfHr9duGHyQaJfWzqJHPmWpj2uTIMM8A1FJqR9yCMHKSOlHbXGRfsqRDibuu8
 WDpFW8URv4yC0N07i4a/IrWyRk66YoYRqWxfCVV5i/OptxVE9fs9Vm1M3OOwXCGTJn/6
 WJFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMypQXqFO/dV+q+JUrwt7pb4DNwXeKTzv1C/0R/MD6lDmrMw+WHCp1XIc2WCRnsQU0MPN5/TGyrQ==@nongnu.org
X-Gm-Message-State: AOJu0YxzqQgEgNdFzeRpmTH0vJiYzdIwgvg9IYAZcWiwihWkn1DHLwqn
 xLNlUCMHRegzrqozRuGeu/cJIXjqrkhQ4GU9YQtp0aWOkaPsE4n4cLyrSoYABQ==
X-Gm-Gg: ASbGncu1KqRPW4LGxTtJXOdJPMoKnIHAOs4aIJHDcEURR+pX2DwOvwSuWke/fUUeF9E
 2A/+pAqDsNvu1mImfbKo1iFTT13VHplPbona223qtC9EAzs0IP6nwM0JxtRW72GybTLkNO6ObiV
 5BTaJi2oROsvW0SQMqi/rAnrq316FgVBhKucrPBBC4Gmo9DjjVLvvJoK9hVm31mJX2G+k4U23we
 kKf9xJRj0o+tFoxRpkjcKfRoek27wI6GdczE6dQ60AL7HiXpmiy41zQiGDx5uywIeLsV+iVkuJR
 vodXShRJMiCuywVD0ZXiQDK8z6HxYIsR
X-Received: by 2002:a05:600c:3110:b0:434:ffb2:f9df with SMTP id
 5b1f17b1804b1-43668646bb5mr131607945e9.17.1734992219631; 
 Mon, 23 Dec 2024 14:16:59 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611fc161sm147561075e9.10.2024.12.23.14.16.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 23 Dec 2024 14:16:59 -0800 (PST)
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
Subject: [PATCH v16 03/14] hw/display/apple-gfx: Adds PCI implementation
Date: Mon, 23 Dec 2024 23:16:34 +0100
Message-Id: <20241223221645.29911-4-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241223221645.29911-1-phil@philjordan.eu>
References: <20241223221645.29911-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::331;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x331.google.com
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
X-TUID: Q6PNutD3WwWG

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
index 6a9b7b19ad..2b53dfd7d2 100644
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
index 0000000000..5ff6a487cf
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
index cf9e6dd35d..94f4f05d36 100644
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

