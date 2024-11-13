Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp399592njc;
        Wed, 13 Nov 2024 06:26:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW+SyJBT/MCuLUE9DC64LfYU7DROA0F2vf87dP0MKobsKfD0cJDIc2eF4TkCONGJ4eCpvxNojF1viGb/w==@linaro.org
X-Google-Smtp-Source: AGHT+IHZuwRYEjmu+CbMX6oFWcHK93B08X+LvhaxKVy8RjxfJa3UNtBBfY90ymzZpCCkz8dM8USd
X-Received: by 2002:a81:c704:0:b0:6ec:340d:40f7 with SMTP id 00721157ae682-6ec340d4e01mr86050397b3.29.1731507974499;
        Wed, 13 Nov 2024 06:26:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731507974; cv=none;
        d=google.com; s=arc-20240605;
        b=NaOY2h7/z0t1KOWo7Soc2tzmPVfyVB3d+w7T1lJ+64XDDI0hUrvCsrQuEXZnxoFDnA
         BIhWh8Ow38mtiE8/V00LgE9va+0JE9Kzn1s+hqyFjFeNUyhXFcYzfrMWmKvOZsyjE7Fu
         8YG+p+RtqNXvoX2IFxhcSAefUqc2wKcj0XsFnQU01Xj2n7zL/qulq5r/xt6MGwbJqewh
         Ll2XTYflB4hs8v5vcvBMuQR5yW7EUOlFrpdNI3e+cuV7Mca/2TytMsUFjFJ2W+o0KmHv
         82AF0P8vz187W6YOjA86hO1D7Lv7LJr7O3FkvK9zk/g4u/xK8jessgWiuruyMnNoheWw
         iEcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Qk/Z7GU/R8IHZ6QLeJGiere5nXlbHMOYqK5KhnY5k4U=;
        fh=XgncJnChD89f8YcbUPv/zS+JHnV3t/pCNdyLfi17LkQ=;
        b=Q0f697hxg74iM3HWC/2kE8yLxnB3ZTFu6s+dyPr71INcjZPG2WvvgGEfOkW5q797vv
         geLEIDggPFlekgaSiBeRitpPKi41pqd/VaR56EamHXC7CigFmgy7Rmf4/XfcLBeMqoxr
         TfDynH0WkQqf8hSiqTcnk2aTp+9MaNPoKvuLsvYV5QHlN15UilH9jsHpw2uPfcD0EQ8h
         3w693hw84YLecsccXQrg3ZR7mOroU7GJtfZX2GZhD1mMrDtwv8Kkd8nL8r9YFm3aigOp
         omh5cnTcQ3BQNL+nR0Ega4ogQOW74+xMQCk3tPh5ym+XXG7p1mBNPLJY+HNhHAliryn/
         bMSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=ereY4gmM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d39664b5f3si169098706d6.262.2024.11.13.06.26.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 06:26:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=ereY4gmM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tBEHw-0003uv-IH; Wed, 13 Nov 2024 09:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tBEHt-0003rb-HO
 for qemu-devel@nongnu.org; Wed, 13 Nov 2024 09:24:05 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tBEHo-0008SZ-Vx
 for qemu-devel@nongnu.org; Wed, 13 Nov 2024 09:24:05 -0500
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa1e6ecd353so138936866b.1
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2024 06:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731507839; x=1732112639;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qk/Z7GU/R8IHZ6QLeJGiere5nXlbHMOYqK5KhnY5k4U=;
 b=ereY4gmMZ6qsl/0wYhWkJBMiZ4HTkihCMbCWWg82yWrsBFfEcv9vo+9ivi8aPF1aLu
 GdfARKRoLR7PhQfGAxfaRkVfsK1B7WK6a2enSFskfVIwJkPmYPY0lLHgZcLZ6PoQzhin
 Hic05106DbGKBFu30UHJueoY0md3NwhfSadJfdzf46zCP7zZWQJ38+NHRbYfUL0kBu1F
 1OfdQEAUGhZjLoJKupJar86T4gBu12PjZXCT4+pEeTiKmg6peTX4rz8CTN9xvk5L65tm
 uj25+Rc2lkNMml2ITDgFSw5IumjHEhmPOO31W6v+/kNGkfJbTYifv/iNXqY9juf1PRbv
 Ph4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731507839; x=1732112639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qk/Z7GU/R8IHZ6QLeJGiere5nXlbHMOYqK5KhnY5k4U=;
 b=hQ+qmWymn/EFiX4LTPrwuBXhUKCcZVopyBkTVTXrv/AE3V1uCFimrRjw/hvjup8KVB
 xGILmE0BiZE3hxq7FuVvNJIa66V7HQn0c1lB96+T9TysVEcgFcLU8/o3TSTdUMtC2Uok
 9yI5mTezn2mz5Mzz5FPp1kA3yh2+CUy3J6cTwxkdNNIbHXeiI6t1Si2fwJbNLHcZZnWL
 MR3jAdZEAeIJUVVwXu/gIf4lgbk20P8E/A45mn4PjXy4rHeZqCYpgoCWK1KZnNY3u0AS
 LiL0kvQFFEFc0tk3T0ye02szdtHdKc3eF4rzxca5AWPIz1yJT9qEZE5ivYtugWHUhWQM
 BLrA==
X-Gm-Message-State: AOJu0Yw/kXYfo41rSEiL+waGgNw95x1kx45ZgQHhGfIaSKb/0NhO5Grm
 9bnLdFmpGor80F5JGmDmI9PyFBSYnFauvUSsTTbBsv7wusPqIFE5N4Afr7Qllb9N2WHzvhYR6q6
 tDw==
X-Received: by 2002:a05:6402:5192:b0:5cb:699c:30dd with SMTP id
 4fb4d7f45d1cf-5cf0a446b13mr22695637a12.32.1731507839050; 
 Wed, 13 Nov 2024 06:23:59 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5d76esm7134612a12.9.2024.11.13.06.23.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 13 Nov 2024 06:23:57 -0800 (PST)
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
Subject: [PATCH v10 03/15] hw/display/apple-gfx: Adds PCI implementation
Date: Wed, 13 Nov 2024 15:23:31 +0100
Message-Id: <20241113142343.40832-4-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241113142343.40832-1-phil@philjordan.eu>
References: <20241113142343.40832-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::631;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x631.google.com
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
X-TUID: +aWWuQFfPbkJ

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
index 00000000000..5a27b95ac79
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
2.39.3 (Apple Git-145)

