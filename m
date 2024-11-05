Received: by 2002:a05:7022:611:b0:8f:43c:4b5e with SMTP id 17csp2905943dlb;
        Tue, 5 Nov 2024 07:31:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVQQyUdvI/eesLb5kP/cLc/OTnPiUVEz8LXyftDXXCuGBezmKGGR1KlbmFd2//QQQVHN6nx5YKubWMxBA==@linaro.org
X-Google-Smtp-Source: AGHT+IEJ4XhJ6Bq/fRH7GJXDkalUKF2u067uKO4+9oRKYFvxYEtvC3Itawr50LBejft++ah2t0ce
X-Received: by 2002:a05:620a:40c6:b0:7a9:9fb6:64e4 with SMTP id af79cd13be357-7b193f3cfa0mr5257010185a.51.1730820711829;
        Tue, 05 Nov 2024 07:31:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730820711; cv=none;
        d=google.com; s=arc-20240605;
        b=HIh8bb3GdrgP+2dxVVUYcUJqrAmXKsdOgTtc1jO/yD3N2AAuQcf2GbhyRudFzA/yFc
         J9FGq9JuRK+EOBh589Ms+j1OxQ862jx/CENxe8MD7eJsF6lfOEcF4GoorK3Eoy/SGzCL
         56UvRln5NQRSg4NHHSYN5YVcSyWIKRec5d0jsLFSdUpYQ5xCbyqOSLbYoypBLgDitlo+
         STobyHUMKv+Ww3P+CfsNNuXMd4uIPTo54yuEumbHKUrhnycP1WulhyrsNt8fAZeD+evS
         bCL9M8tcY7+g4+9y/UQZjEEHaiwZRrlGVESV1Jh/FpBVkFs9BrY45Rc5TwfxJBWbmQXy
         RBXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+6VLcugSGEjuEKcewFLaKrp43pG3qxbRhauE21i8QJw=;
        fh=kHyLu0fFKygxz0UsbTae2koSEaZbBzwTZygfmuMalKs=;
        b=Go7u2eF5FRi6NoMf7IyMAAhD6hjv+DUyEdXi3Vi4l2k+tZJJqxcs8d6jVVHuIbMDyF
         au0Jg3yVGorD3lKlkz8c6B138ixiWi7+5mUjPywADt2hTrVP/8YUzUuccgofVD1DBEgj
         psaDogcw/2eHY/cr2ZvVLl2vYI3MtnKrIO1Oa31woIe+JzAPue+YDb2OFBJ9EaHbtMFb
         uJml7WF5sPWJWWkHyyO3nXooT7OhsG1H9RbOqLTLeKGQc7EC39IVB6Ui7hLNosC10fqT
         7SNMfQIy2SbRylA3GtWEyWlMXr6STVYZDgfp6DGv/arGSS6jnN2V9Y5WjNz7YQg0+w0I
         eacA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=VjIuGwW4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad19e833si137364211cf.346.2024.11.05.07.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 07:31:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=VjIuGwW4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t8LW9-0005Vv-HA; Tue, 05 Nov 2024 10:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t8LW6-0005Tb-Bc
 for qemu-devel@nongnu.org; Tue, 05 Nov 2024 10:30:50 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t8LW3-00040O-Uq
 for qemu-devel@nongnu.org; Tue, 05 Nov 2024 10:30:50 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c96b2a10e1so7996737a12.2
 for <qemu-devel@nongnu.org>; Tue, 05 Nov 2024 07:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730820645; x=1731425445;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6VLcugSGEjuEKcewFLaKrp43pG3qxbRhauE21i8QJw=;
 b=VjIuGwW4FtuBZpVFKeKJRLc23H8SlaNrdiQ52gCdUpmPkwo1ierwC3iMid7buKgFBZ
 woy1D0jO9a9+tThvSv2mJAmlW+dBIvYYK4SGO15ND2t0hY9q/vJGq3NNh2X4uvY3rPvl
 uwlbap2Ya27AQoPsZtfk5FF3OvmPvp+YbynUVbUgJgOE6TLjj9NXGUedu0c99p/XE3fJ
 nlwpUwLiUGqFGYQuZeOv9aNZiG5YbFr4Sjpe/iOp9LgzCKO/JuruXcwBSXaausM45G7C
 rBMHwIm34gkLEGqw2thWvn3WCGQ0S7r6GERM5g1UD5Om4/o8LKVcdvrzRCCizOwxvSJJ
 8s6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730820645; x=1731425445;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6VLcugSGEjuEKcewFLaKrp43pG3qxbRhauE21i8QJw=;
 b=WyTS1dHwQPTdrnr3Xw+4PBXMoe083LI0lRtvt6lMtMwVSt6gc2tjTNAeohQgWPsCjq
 nbEaob4e2HnplPBvy4pt4Z+88e3asQMdeBxEFzKaL/sUHQROTZT2kvO2CGlZsGSVNER7
 bmpmcWceyU9M+Zhsqx/+r6oKv77Tyz8fH8X+z2DIKgur+HgDQn6P2LWFub1zxAzU+ljK
 oSXpqcOGDlUpn77LEOmfdONu7ehpo0c1mF4Zq4NbnzfN7fXldT/9Iab9WQTJ45Pmhpil
 L6W5QJ3dJeqZeif009Vr41s5jSvh71Cs/wHljPHBT06cdSjQRGvCPh1nBLEWGJ7CmAIn
 KLow==
X-Gm-Message-State: AOJu0YzZL7GCMHOpL0SH9TLFMIE+PLIAsL/S2i04RtBXtyMqDQVBaSPj
 pzP8NS7beoOpdpen5Kkb+R5IM/7xT6ZC6d5yA+Z+ag+TN9Ce3YuVIncw6bCJSkU06IXIDI4r6fg
 2Gg==
X-Received: by 2002:a05:6402:d09:b0:5c8:8d5e:19b0 with SMTP id
 4fb4d7f45d1cf-5cbbfa74da6mr25856020a12.30.1730820644825; 
 Tue, 05 Nov 2024 07:30:44 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6aae3fcsm1419415a12.21.2024.11.05.07.30.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 07:30:43 -0800 (PST)
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
 qemu-riscv@nongnu.org
Subject: [PATCH v7 03/15] hw/display/apple-gfx: Adds PCI implementation
Date: Tue,  5 Nov 2024 16:30:10 +0100
Message-Id: <20241105153022.91101-4-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241105153022.91101-1-phil@philjordan.eu>
References: <20241105153022.91101-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::535;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x535.google.com
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
X-TUID: o4u1jY3iaHUA

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

 hw/display/Kconfig         |   4 +
 hw/display/apple-gfx-pci.m | 148 +++++++++++++++++++++++++++++++++++++
 hw/display/meson.build     |   1 +
 3 files changed, 153 insertions(+)
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
index 00000000000..8bd7c0df443
--- /dev/null
+++ b/hw/display/apple-gfx-pci.m
@@ -0,0 +1,148 @@
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
+                   false /*msi_per_vector_mask*/, errp);
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

