Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1202639njk;
        Wed, 18 Dec 2024 12:23:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX62vJbpUP87UKDFhUZLq40jkkreP83kU3FORpINCDdJjy/QcxPqBQYnZ/WHEEqGzZ2+BfTym1X4ZxH0w==@linaro.org
X-Google-Smtp-Source: AGHT+IFVyc4JC1Ha40cUq9qOZKIUMWmfPZzcH5XBhOo8IvwqzrFpmupwKlRTHOYirCXU4Y2sOjta
X-Received: by 2002:a05:622a:606:b0:458:3c2a:1d6f with SMTP id d75a77b69052e-46a3a810b4dmr10386451cf.31.1734553387538;
        Wed, 18 Dec 2024 12:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734553387; cv=none;
        d=google.com; s=arc-20240605;
        b=INdnMgBEKmSKyPCDUdo7NsjKIX0Z5NRsT64JYzZELXnORxs3lBV3tX+2zHjGHRVnVH
         FWxbSlAIOz/v0ho/90fWyQxClkshQMJXYqL4gdOYy7b/eHN5Cn6lIKXcQWt+aXWDtQxg
         TP0pwsmuP3LpDxcaS1KoU0Qt/68RDrzO0RO04eV3eCN+hJfi2EeB4DiB9gtX9EdKZkeZ
         EljciZo0Ala1dgWJSfCG7Ed+yztDeghkTBqmVVP+CT/eiUI+EHR43gPw3czyxjJ8IME8
         xoXVDLP+iV9ng0y1ZLARM5tfSudV/GJnVRF2FE5ZzR13ItPw4LPyncfVc+joRYN9ymRM
         eh5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=l9CSE0Le6C9EUk9Pa8FAy+M2SSGHzc5sfGAFZk3Ode0=;
        fh=XgncJnChD89f8YcbUPv/zS+JHnV3t/pCNdyLfi17LkQ=;
        b=CWC0gLNMSPm8ooIiD8uGP9kSahuktIGJYK32P5FAFETKddWS4J2SC7toeqWx7PO15O
         VlLcGQKJYD8RuGTp2pmvShn/xiadFV74T0T256PLeQ4wuMbwlXhIifh/Sawjwm48xQ5/
         t+QHR/fAxK42dLn+9BHu0WOswhuMC89y0QbqZ2bwmoQLVpAOyq6333aP8KvtIZMrxiRQ
         pc3hE5Xc7HRw5zeOpIFNvRhh3rEtgg2e+dUGt2ypvElHzPLHPdfMXu4eGVHZzChMckh1
         BlYYchCUQ/Q3psM9mYiMgf67ZyExknj/6TUwW+hpZYrNY9MDc23pQoZSpjVl1ZcQf7EP
         HcYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=zCiqflNp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467b2ed03c1si128840101cf.421.2024.12.18.12.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2024 12:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=zCiqflNp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tO0XZ-0001KS-N4; Wed, 18 Dec 2024 15:21:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tO0XV-0001Gq-Nb
 for qemu-devel@nongnu.org; Wed, 18 Dec 2024 15:21:02 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tO0XR-0000F1-23
 for qemu-devel@nongnu.org; Wed, 18 Dec 2024 15:21:00 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4361fe642ddso525995e9.2
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2024 12:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734553255; x=1735158055;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l9CSE0Le6C9EUk9Pa8FAy+M2SSGHzc5sfGAFZk3Ode0=;
 b=zCiqflNpWYKQSLwGd13uHq2h73rRlOQgjZlRl88NG8qTcPFl3hFVnPwRwjQfTL8pNX
 0e9IWJLIZSa9CbjD3+4CtDcSVoagwYMRK5oaom5r/vrf46H7X/KI1pPrMzb3AI/rEewC
 y4C54OvysiOhWKKlfqCJIOfkzoZi1h0GzVXk613LVBFv49Co9DPqp970raBo0UMYVe2+
 pHAa+EXhWZckzI9CaurKETsUvrUhqBVQ2oeYpR8xm+bUoaumpEd9bkFKnSsP7GuyAhrQ
 IxPgHva/j4x7cvRaxbRtjbASoe+056f+N/lfSFawC9YYs+U9QxasWfmjbHOFbeuR+hlm
 ctxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734553255; x=1735158055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l9CSE0Le6C9EUk9Pa8FAy+M2SSGHzc5sfGAFZk3Ode0=;
 b=oO8CCCLt3rUZydsnJP3jYSK2qnt3h5rXZqkqVWR2l2kBzCPGAX6LFIEq0zZPkKGpK4
 HekWUts/OE9QY8ydiju3iKrM6BwSgaOBUhl5Jl1QzWsqUOCVGNYzhFJYUN83WZJiI+IO
 /1GGkIkU177dRpZj1Q5UllW3WkuCZKdWir1lNl7SuYD/lV34DqdNveop6YYXFX2ioCjr
 BHZQsAqUDa2m/Mfwa8b5Yf2k4WCQQUu5CVRBY8cYiFqQUoiGoWBBGGvKmJQ7MclFsEer
 mMU/ukzHCZ81kmDkkjp3/m+p85zLVdWBQdt26Ovwd0bsLPzg4L6p5oSDweouduz99M0c
 wHPw==
X-Gm-Message-State: AOJu0Yx49pw+gGxYM/Vkgkm/7+20PA4NC1ZxFyiYwMp2j9c7cIFAOPpX
 +tCDcS3B0CclNgG0MGdq0ti6HJfhSaYatdUMVNeN+hYcKIIWuSTuAusPYTBiKQzZMhJQARMTat3
 CPQ==
X-Gm-Gg: ASbGncvokBuYrfeoctaR2vH6BRUhQKRaGfZy3/VzjR4jJ1imMkUuScnS18zQ4N2db3T
 BQRU9x5YSFeOLK1Xu1nopNb1iyk4Xy8lavQCvBdZrso6m+L9YctukocP5tmnfhHZDz3zxN8r/Ml
 JnwTtd513kw6JwzarEd/sFTGzRap6Cj7bMuaFcdrFjqCn3Kgh2eyUAxff4W8jw0Z+rn2SI1hQEK
 QkTAdMKv3QXyMh4aRG0sqdjhCaWE554KiLEhNF7a1HDwam/824ciM64xae8emWtOjvjk9obxrUo
 e9uo5ITF7iC6dVrko+2WSHeU0yF6dLTx
X-Received: by 2002:a05:600c:1d27:b0:434:f753:600f with SMTP id
 5b1f17b1804b1-43655395816mr37858925e9.19.1734553255399; 
 Wed, 18 Dec 2024 12:20:55 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80120c7sm14842267f8f.13.2024.12.18.12.20.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Dec 2024 12:20:55 -0800 (PST)
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
Subject: [PATCH v15 03/15] hw/display/apple-gfx: Adds PCI implementation
Date: Wed, 18 Dec 2024 21:20:24 +0100
Message-Id: <20241218202036.80064-4-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241218202036.80064-1-phil@philjordan.eu>
References: <20241218202036.80064-1-phil@philjordan.eu>
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
X-TUID: f/wWVJHQSlAi

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

