Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp519746njb;
        Fri, 13 Dec 2024 07:19:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWCeBjciHdyYsnLVwOAWMJIF07o/agCR6JHt9/I4u9Bjg3j04Hoz2avAHboqX5QPp6t2UQJYVZJ4aSjBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH7SFYPEHoX96jKmTQaz+NGW3BGBlB7W6s/X7IK2VGyTogltSqduQxIBqVvHgi3gYVwEGlG
X-Received: by 2002:a05:620a:4589:b0:7b6:eba3:2e08 with SMTP id af79cd13be357-7b6f8c6ffbamr837741385a.7.1734103189416;
        Fri, 13 Dec 2024 07:19:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734103189; cv=none;
        d=google.com; s=arc-20240605;
        b=ENKlkNTIK9pQnqiy8cxxlL7ASzx+dl8fsZYRNtrbgShAPYwERrh0EkSOlWT9SYTccJ
         A92clMIyJxcwV1ldF8uRO3tgQoEQL2HZH87+A4FoRoz2LvrWFdxzsWG4xbjfCjJPlZtl
         WMbLsl+wgHwYl+uC9KhlIWx6c76Fs7TpbQktcmfRuFGhOEu1LZ3zGKkIa6b3pmGX5yRQ
         p3ZEm3haTDqKJKWWlXxcVBn+ChuXbANiypgPws8whQp4falAJ3P5cJNpZGpQ+Wv9Ru7g
         mFqWwWEw+tssIzXvGDEhrMUY5AEoYlX7pZh73+0Vm9SQmwgAT3QBdnqFTicSMj7xwuBD
         VZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=l9CSE0Le6C9EUk9Pa8FAy+M2SSGHzc5sfGAFZk3Ode0=;
        fh=/Q2a6gXShWWX86rxMNM0zhf8zs/hIa3BlrZF5BjStmU=;
        b=cMECAtA52BWh7ERQFG35VywzCDUsdeWdDcqY4en+80uDZm3fcGI8ByxjD6M7lpyTJF
         z/kVyWrquQgjgG7K9JSafkP4+kfWs8DwAumUBXAnVwWmTh8QRSZfND8pKxQa5jo3taDi
         SqpnHeeaRg4dhf9moiw7dL3CJRQqEjigFuMd1SrsDFFiqhYnEFFwtoA4cmWpEYgBvB6j
         Yofr04Cx7nf2+MU9ATCgVAbWOKd+3eHigr4pvtyK7gK7xy75FPp3jRyznhATRI9DndFf
         OFpeC2iQnlvVUH2ynZluxXU93YB+rbtz55ze1v6n69emVUmMCgDIsdCJT0zxP4H3FjSh
         UUzg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=rh8NCght;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afec660569si4048779137.593.2024.12.13.07.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 07:19:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=rh8NCght;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM7RM-0004OH-Lj; Fri, 13 Dec 2024 10:18:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RJ-0004M9-GO
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:18:49 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RE-00054j-Cl
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:18:49 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9e44654ae3so280361466b.1
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 07:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103123; x=1734707923;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l9CSE0Le6C9EUk9Pa8FAy+M2SSGHzc5sfGAFZk3Ode0=;
 b=rh8NCghtXHdVmiGBeHUyPRNmkLwDF1DTDTYyAApjKZftUc4hnjcXhSUjwRgOF2UBDD
 BAsDi/afK/EVLGTj6UsJkVIc3pb+p1uVxMvcZ3wVUlP4C8+VSnl7WA7obO2rJ4YxkZFu
 HXn0Ab/2JMqu/aX7/LLmycA7imjLusS/P5A8nLVxEzc0aM0jUyJfI1ZG3VUXIqUdVvec
 hWQKX+92uQ/lAbAXp3ejkluUjI4J9kndBXzDyvfV9j7A27HbFWdmMlIkpNPo30DHvRjU
 N3uJzZvtXEM8dKmnZlUGNIQ9LwoQOW+9FR9pw4R9E5su0jwyVY/Hhs5vOyeqp7AyDQUI
 J5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103123; x=1734707923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l9CSE0Le6C9EUk9Pa8FAy+M2SSGHzc5sfGAFZk3Ode0=;
 b=LX0l9e2wCVwm/A0ohZdRgfI1MLU6f1NW35X/f5wbr7X7ceuatqz05LNaUXn6Xn3cmK
 Vz7l8pYYJPMDEseIYWcQ+KGHouhNOZRPL6Q9uGMcazdgZ76fOZacRGQtDVxmgdqLT5Qt
 7aDP2T679sOOK/0MvosUq+ZrToymYwIowctAcShviSv5/3g1DTrC3B06jMuE3N3dhAgZ
 uYr3xS6oYDljRUgY4ROdeMlXMw2sQkYKdmhCZG8bHsTUTVEg2Q4Sjx61Glfs8jyjZMTk
 s3hCSsopReP7dkFSdTtFbwnLW5AqH9ZcTG7oDzWI7yzZigA4SQeKhk/YqwYekVaWgSd9
 S4vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2swloGbeVb8z8xZlPYLWp8pHD9Uzm114lDOLb0Aia3NGb8+/cc7ECdMoGkjo43ApEaobQYueWKA==@nongnu.org
X-Gm-Message-State: AOJu0YwtvuCVt+kL017oAs3HKnTFBTNbqrhwqgKgrjzpA9T3vheNU70c
 F24x8skQ6kuyhQdBz6sipcjgKKGDvCoKn/wnSYJiKFiKfVD0MK59Qh1YlvVYng==
X-Gm-Gg: ASbGncvts9PE6lDanwuX8NSB/Y47FJtq1Y61ECU+0hsCNisEkLN1w+vviDguNUYBWMH
 V4cl8p3oML/1zTVhK1441b3oRAomRxR0ME45Zpr8WcLlOV6MmmJBAKqza34d4MHnFEbjFHriTO/
 89s1t+t60S8/c/40l6SluDNBTvuixrHVwFGFuR5ZFMNTjeoMA2llEmuxZKxomrzIZnTmAnrsyhU
 NF3OFtqfrkswdoRU6aiJYa0O1o8UUvpyfMHjV8qNsNKf+Oh+DGZ3b66sD1vStoNBkNJgU3VQooU
 eDsFI8IXaONE2u6Nsz+GspsxTz8VOjJ0
X-Received: by 2002:a17:906:dc95:b0:aa6:5ec2:966c with SMTP id
 a640c23a62f3a-aab778dfea2mr402231366b.7.1734103122835; 
 Fri, 13 Dec 2024 07:18:42 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.18.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:18:42 -0800 (PST)
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
Subject: [PATCH v13 03/15] hw/display/apple-gfx: Adds PCI implementation
Date: Fri, 13 Dec 2024 16:17:53 +0100
Message-Id: <20241213151821.65748-4-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::630;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x630.google.com
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
X-TUID: SjIigcLggVOc

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

