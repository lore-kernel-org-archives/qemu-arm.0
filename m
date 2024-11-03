Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp1602515njc;
        Sun, 3 Nov 2024 07:07:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjNJ7n6QonpMe5fduzJkV4YqIRXMyS8AbyKYewyqZjeeZg45ZvTtzTWKLfuqVG208Nb8itxCLVYCqbSg==@linaro.org
X-Google-Smtp-Source: AGHT+IFhu5p4WJHIQ4yMz792yxOznb6nbcEJ3PKFuAk4efKfNg3kw8lgaynu/8M3SAjr/5qg8nk6
X-Received: by 2002:a05:620a:243:b0:7b1:c604:b26c with SMTP id af79cd13be357-7b1c604b4a8mr1744664085a.53.1730646452986;
        Sun, 03 Nov 2024 07:07:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730646452; cv=none;
        d=google.com; s=arc-20240605;
        b=N9uaPPQBSZugCqu/u1vduAnTLE8UuEWOkJxfglSgDgGPVPqu51E0TcKNjzUm4c1DOD
         hFVmwCCaF1+QR6hG1d6cUwYDZu6bOwSULQcbRG4F0gUGzlHaXSB9gQHbXfncT1J+J8gA
         CE9GvzGN/8Pn/9HEKTDy+nF6WgOyl+vJ3VgQZIaBE+PTyOcnnjzspdH7AWPz6fUwSm9a
         j6rQ6c2arirBLoqtauAR8H/Jym/+bH5KGKEt69n+roRZfJKy/tq7BBIhJoIqJQAhPRP3
         WdefUhSUHl0aaYYaXNasOllxbASPcRUuW3Pbpc4MOjc3phi+nOl+90v0xZJm9aJqq7sT
         ElLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x+k/PF8+vCgqdSd3OBbwXPjj944Hr1rxzziAT3BfgZ0=;
        fh=X/cEeG0IecOcbktZzhggOUgW8rnsW2Y9KQE40BZHOoA=;
        b=GfkC2aWVvK6Yw3b1/JvJyTnA2ysvyrWDTH5whIwJkL6xIBJIMTMcEBd2uL/rijcleU
         3P3LPQMr1QYI4w2n5MvToYU+PyYiOvpPvI8zAQhDBGLyVjCNihE3oMaGQu57mTzXG2aA
         bFiWKMNfWjb+0iohcpyjbDi3PeXicOB3VSnMSKUb2fwyOlYaqf890LS9QIpf2mDUDczX
         pw2WWPLVAFMjOm8JwIf3joJt+JauMwuNccUb6/L7IHzD+1uUUEGkJTz5EqAMvNMA8Xi7
         JGJ0rgGJso99V0S4vH5WXVf+ZgJFKkVLDol9q73AybCu/ikmyxZjAO4wfUh8K0lpt3bt
         JJPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=vHEjwbc2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f39f22c5si880475685a.29.2024.11.03.07.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Nov 2024 07:07:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=vHEjwbc2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7c6m-0000Ho-7v; Sun, 03 Nov 2024 10:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t7c6A-0008BX-Ai
 for qemu-devel@nongnu.org; Sun, 03 Nov 2024 10:01:04 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t7c63-0006Va-GT
 for qemu-devel@nongnu.org; Sun, 03 Nov 2024 10:01:01 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a0ef5179dso558615366b.1
 for <qemu-devel@nongnu.org>; Sun, 03 Nov 2024 07:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730646054; x=1731250854;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+k/PF8+vCgqdSd3OBbwXPjj944Hr1rxzziAT3BfgZ0=;
 b=vHEjwbc2AMgneincGTUi7fZy9tN28GhBcI6xoeS4irJoeYhUJOoNoyQv0DsYTZJ97B
 ONbyCp9B90E/Q1j29lE48xRGCFTgFWPijGhm9vstXuQV8NIhoWORWJKkUIXJg6QGcRLW
 UR/7x+eSBfVA1X/qi3IOUlVvWxwSTllR8MVgiPas/9RA2bx6kgwwbZJT4bysQnJeo1OE
 Ftm6UvLAJ9OUc4KT9cJKpyGrBbz8r9ZMsXPfmtrHjfgPxOS2k/E390G6nM7oI+F4sc1A
 60Nf95E+hYokt5vcv0E1qWQpPokVkCgLjs9KQ954ZWWyJYERyCLbBiJ5TdCDUZE0HICC
 2GFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730646054; x=1731250854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x+k/PF8+vCgqdSd3OBbwXPjj944Hr1rxzziAT3BfgZ0=;
 b=xGvhbbKSh83ksr8S/8CxrLX0MCu3J2QJQfVcqNMyblcvaPZqyBz1456kSRzVGN2k19
 dOgXGiBv4kjD4NzujVofYR5z/AR8NKFLFNZ74H13So530Lb5QGf1umWqceI7k1rFK52I
 yCCeNH6WT/BDxkKkXI7BBilUu2tp8e2ipeOCFtaVksc6121AnyK7KgKwrpm+jcm+eCFU
 b8/D8u7SxVWxiq/xmLgI6q6Ju0Hy5zlyNOW4k6UBbrz5k+rLLvwfNRGoBA7RkgHUWQJS
 aYpOL90qpd92EOKkslW5TtgtYT6pbqm8MZBCgJJGlCBGkDCNIuSnYXhh5oJvWHS+7tL9
 2zpQ==
X-Gm-Message-State: AOJu0YxYYXfNkVTs0fPMkR5VUQXU/ejQZz+Px3tucAGp3tMbtBDUYljE
 pXq8Oo3B7SUsFsqplAXK5IZ8T54v4/pw7W2EnP3QhoRSV9jRG8Ym343csgQxkx4lb4vxg/LnWV1
 9jw==
X-Received: by 2002:a17:907:e8d:b0:a9a:55dd:bc23 with SMTP id
 a640c23a62f3a-a9de5d6f205mr2818718366b.8.1730646054030; 
 Sun, 03 Nov 2024 07:00:54 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e5664350esm431536666b.159.2024.11.03.07.00.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 03 Nov 2024 07:00:53 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v6 03/15] hw/display/apple-gfx: Adds PCI implementation
Date: Sun,  3 Nov 2024 16:00:25 +0100
Message-Id: <20241103150037.48194-4-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241103150037.48194-1-phil@philjordan.eu>
References: <20241103150037.48194-1-phil@philjordan.eu>
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
X-TUID: QI+K4SrN7nmy

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

 hw/display/Kconfig         |   4 +
 hw/display/apple-gfx-pci.m | 149 +++++++++++++++++++++++++++++++++++++
 hw/display/meson.build     |   1 +
 3 files changed, 154 insertions(+)
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
index 00000000000..870d0c41e66
--- /dev/null
+++ b/hw/display/apple-gfx-pci.m
@@ -0,0 +1,149 @@
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
+        /* The following is done on device not class init to avoid running
+         * ObjC code before fork() in -daemonize mode. */
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
+static void apple_gfx_pci_interrupt(PCIDevice *dev, AppleGFXPCIState *s,
+                                    uint32_t vector)
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
+                   false /*msi_per_vector_mask*/, errp);
+    if (ret != 0) {
+        return;
+    }
+
+    @autoreleasepool {
+        PGDeviceDescriptor *desc = [PGDeviceDescriptor new];
+        desc.raiseInterrupt = ^(uint32_t vector) {
+            apple_gfx_pci_interrupt(dev, s, vector);
+        };
+
+        apple_gfx_common_realize(&s->common, desc, errp);
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
+    // TODO: Property for setting mode list
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
index 619e642905a..78e1c41ea0a 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -65,6 +65,7 @@ system_ss.add(when: 'CONFIG_MAC_PVG',         if_true: [files('apple-gfx.m'), pv
 if cpu == 'aarch64'
   system_ss.add(when: 'CONFIG_MAC_PVG_MMIO',  if_true: [files('apple-gfx-mmio.m'), pvg, metal])
 endif
+system_ss.add(when: 'CONFIG_MAC_PVG_PCI',     if_true: [files('apple-gfx-pci.m'), pvg, metal])
 
 if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss = ss.source_set()
-- 
2.39.3 (Apple Git-145)

