Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4967245njc;
        Fri, 8 Nov 2024 06:51:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUrKs2mAtcLPthjhiMNuofVOdG3jFXQfEKyWeoVVsT2Q1NgD5nd6p4IZCNR0rnmyl3sWYqOGNhzwvOqEQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE5xM3coKcfOC2usJQwjoRk3VKMtWLctuy3UN8ZhEDSHERcvh5KX7FES+uU58kKL+F6/U0P
X-Received: by 2002:a05:620a:4505:b0:7b1:ae66:e8dc with SMTP id af79cd13be357-7b331f2550amr458882685a.53.1731077463458;
        Fri, 08 Nov 2024 06:51:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731077463; cv=none;
        d=google.com; s=arc-20240605;
        b=i9yI+svKPUzViIGAoLdmla1CD7xdOw+pRPFW8lgGvrCTBfXBKmYcVWexphNP41wjMC
         tRDeJJB/+AS2t2mQoidZm8eHK7hI0cI6DP5EMK1I0oM2C4oZR7syJoSOT//w/tCcvEOU
         4xLPcXAoudusCAZhhukbRloI9S6J9wOoibpDlK84DjTXsDyHq7Vd9zfPqsjj6etzSnzX
         1wAC4TXuLkVyU+alFPkTU34qVeJvVHU03fG1FmIk6p90EwB/M2cltj2kvvRMqVfix3AU
         I28jnn/DNgQpnq0EkAobt4BKGwF3gh6Yq+ZzppKav99jzInviQ4Rl03UD29afPiUlGub
         Tnng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+6VLcugSGEjuEKcewFLaKrp43pG3qxbRhauE21i8QJw=;
        fh=kHyLu0fFKygxz0UsbTae2koSEaZbBzwTZygfmuMalKs=;
        b=beV4fZC1WzfieqA6nkIVC0K0dOcKjHxab+73CbQjQqFJANukS/uu3N6+csjVc6NN4U
         fI/tx//AHfE1jVzaPSk+aNEp/jWmEPdHdxp/KBT42ZAcNTGJa45yZrqRSlKIox/o6ZYJ
         zpMfnFaXrZYjqF0iV1FeBIQiAyPB/X5pQ6+Ron38nThWorjBTY7GHy+nYVd0yb5XTC9d
         e1E9ZMJ6fy0gKqh4l3ns3sDIl0svMYgeAbYyCxE68R0EQudZ6tmeM/cSjUPf9DBw3s3g
         Iuk1bXIlm//Tw+cIX5pF5l9O33mrdi0ay+gnQ/ye0q5EYJQux+aJYkoQ3iGVMfi5h9Kf
         MglA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=pZusLvA8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32acba428si441832285a.349.2024.11.08.06.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 06:51:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=pZusLvA8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t9QGs-0004Ik-2a; Fri, 08 Nov 2024 09:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QGj-0004Bh-8k
 for qemu-devel@nongnu.org; Fri, 08 Nov 2024 09:47:25 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QGg-0005G5-0h
 for qemu-devel@nongnu.org; Fri, 08 Nov 2024 09:47:25 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a99e3b3a411so562282666b.0
 for <qemu-devel@nongnu.org>; Fri, 08 Nov 2024 06:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731077240; x=1731682040;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+6VLcugSGEjuEKcewFLaKrp43pG3qxbRhauE21i8QJw=;
 b=pZusLvA8kqWeILZ2hRMlincd9oWVW6vE806i/VjnJYeDTgElqaH8nRjUjK6qXwWUkr
 zdwiq/7Ue6BoD0f5gGAWikvpoiw6zUevaGfBm8K8XTlWx75qAQs38OCSpVwsQsNYdv/e
 a5wWVXAAID3gRdJEgRGRSvU6bzqQrlu8o486+6ILmK8uo7MR1ofWvu3+0N9MRbHinhq1
 WgeeJV+4aGashl4jdfh1SiJstFPTbSsiuOYN9oHnRfiFYAs41pA7GVJilEbjLkVbMwB+
 Ci2rWx6V8mIk5Zb6rkNOsnipjopNaNAXIyi0kkF8vlNZxOv1RHKHVAb1LxB/n+LVAkUU
 Stig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731077240; x=1731682040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+6VLcugSGEjuEKcewFLaKrp43pG3qxbRhauE21i8QJw=;
 b=l6Iprhhsmbdyg0Tbiwg6kmQrr+CAI3wFmL5ivSVrThbNTGEALCiZMN54CsckdVDwAH
 ePB3Y6NJ+EGK3RR4KaGeebw1ygWZT8qzQ4168UrYzKBwGTBztV6fw3PGEdXFqJ15POqo
 abqxZi7wn9hULiXkmj5sSR4SHxT6T5AQkvI4bmjcBJFr04C8BxxX6cseMoM9+RVCMYT5
 jqevJFK5HFyRlGf+12/geLJg7+et6MAjeMA4Jk66qXKmSqRd+7cvPaAYjD/oWhEyb9Os
 m8cB52dhDLFPGDbbYLKN8hsDqRTLoKzNNuATYqh/0z+wOrzOdmv5Z8PU+VlpycuDKi3D
 7e5A==
X-Gm-Message-State: AOJu0YxmfOwSb5k5t8z4dqYkzHtXeBtvPuehzTUKH5Hu9qbGPPsHQZXc
 8AIwKZmtlGu5aZx286x9xiQ6hNOaCdQM8dPZXVZaUw4D2kuFUgA0tdD3ieEBOg88IT3MJEgIulL
 wbg==
X-Received: by 2002:a17:907:3ea1:b0:a9a:ca:4436 with SMTP id
 a640c23a62f3a-a9eec9bf48emr353597566b.13.1731077240319; 
 Fri, 08 Nov 2024 06:47:20 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4a9b1sm240534066b.52.2024.11.08.06.47.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 06:47:19 -0800 (PST)
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
Subject: [PATCH v8 03/15] hw/display/apple-gfx: Adds PCI implementation
Date: Fri,  8 Nov 2024 15:46:57 +0100
Message-Id: <20241108144709.95498-4-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241108144709.95498-1-phil@philjordan.eu>
References: <20241108144709.95498-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62a;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62a.google.com
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
X-TUID: TlAKALpbFvvm

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

