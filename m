Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp229374njx;
        Thu, 24 Oct 2024 03:33:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX1xu37dQnfyds0aPc/Ew9ozWl19oYOoS/RzeSJYqSS5lNdTIuT58FNu/ATLL3jyIG8fPJ9v3a9bH5W6g==@linaro.org
X-Google-Smtp-Source: AGHT+IE+Hx9+Yi7njWJYJJHVFnptcW1puiujQuYAweApaSrvlt4JZdz6N7lblDQIEYNwJNE2hII2
X-Received: by 2002:a05:620a:408a:b0:7b1:54f6:d1dc with SMTP id af79cd13be357-7b17e53f085mr645310785a.4.1729766002826;
        Thu, 24 Oct 2024 03:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729766002; cv=none;
        d=google.com; s=arc-20240605;
        b=adf9Rdbv/kXdYByodV1+6r2aoGCvnoE7GbfvVkeo6SXS+GoNqRu/hAHsbieT1vM3qY
         fCVcKHYDsZ3Dwa8iK7hML2xjpk9LrL9YG3ZGJG/huu5klrw9sLFV9kJcXWaxU9rFNnr3
         Q0TJwAZ3DgJk8+2JG3nyFuk663894Gliur9Y2TlUn8hKOwj9L45GlhrRGzauO27CTGbH
         P9Uv5refn5P/qrKJJXg+g9W+bmp/rMahRJ9PHGgNJSWXTl1TLDiKtut8fvftEvZVV1rY
         hR++bHi+1o15wrPbr4BdkNXN3PyYVmTJSS0WxLVSrQ72s9TNamfMfJnpRcBW+nNNuqK4
         zKjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rP0D2cZrDnPuW6xhPjmdVsND3O4YQtS5+Pte7yJoqqw=;
        fh=X/cEeG0IecOcbktZzhggOUgW8rnsW2Y9KQE40BZHOoA=;
        b=K1Ap0bAy+0wWYtQ7QJXEpUEE8x7Pf/n9WH9w4p+74jOIuLW9ibx17HM9e3RlTUy8mW
         gznBU3i5soyjRtx5enRK44fdkxbfoaYqNB+7CRcslTadW5oW2Q2L18J25WwUDFAcoXUz
         UT+sOJNvL6Ht7+FDSzYbglwOTIsHV4LSV8noRuwWMZh2BDc31FIh0ukomOTlozAXhHlL
         VKAZA1NqcU3iFWNP424aAHg2zITHlC7xidNE3G5cWgqpOF07wdYJc/lr9q6PQHYimeil
         2XCYXXtc+s1ED0evl0OXS3JJVtRvja7g8idbuCtMlw95g8C1iX+vl7AiDf8msGpzpBD9
         /7nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=ooQiMfBJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b165a89b76si1104603285a.498.2024.10.24.03.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2024 03:33:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=ooQiMfBJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t3v56-0000p7-H5; Thu, 24 Oct 2024 06:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v54-0000nk-G1
 for qemu-devel@nongnu.org; Thu, 24 Oct 2024 06:28:38 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t3v4w-00089O-VP
 for qemu-devel@nongnu.org; Thu, 24 Oct 2024 06:28:38 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a6acac4c3so104725266b.0
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2024 03:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1729765709; x=1730370509;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rP0D2cZrDnPuW6xhPjmdVsND3O4YQtS5+Pte7yJoqqw=;
 b=ooQiMfBJYyFz4aDKE3cjGSnK9jDEYQsIbxBAI98x5uh3yK9GsxDNZcfGt9hrEAltL4
 qxX5VVYRC1wZ9CeOlnD0noECg/EgpenRIzWoIcJ6RP9yir3IABfKBTGC8FpXgg4eq6La
 +iQaJ7sq5uVunJdhxixsBgPywgUX5P/Vp/NBqEnY1UUWNXoFNpZXEb95mnqXMFCSr3PT
 7Eq5psCDRa0p0TNEQViUOl4oEVwxtimoJdyvLcbUeEgxK1suZHFl7gGi0KAF1/QzToT6
 9s8/ttzQY2YdIUWsrsKoUkTj/KWoPkQXLjeDHMbsJKEpoQjGfmiXq7HS/pKp1GlVCnsx
 YcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729765709; x=1730370509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rP0D2cZrDnPuW6xhPjmdVsND3O4YQtS5+Pte7yJoqqw=;
 b=oWXWEFkze6jCdLCVsBmjh8RiYF2AQydm8kaiEMB8dZrfGkEoEtvkm19PRZdBGhJwcm
 OPXrn1bwt93AAcmNcYIokEcZfOUN67hpUPfgpmJgSH0jZF6S2PfxxSDA0waTYz/AuAJZ
 1I52MabGaT4MsGG0s3dRv/1pYagI794zAXQoY48qbukwr0cdI2Z1NnACIb41y5TcS2Fi
 d7F86B/MIsXRH5PmrK2tHzZImQFWbtsrkUOsjGlUKLaRy09FqcJJ9DamkcSm3BbTgsqL
 b8iJI/NB553jVk6bPhcSgWD+QoUTS2mq4xRA6lmoQodJE55fVYcnAcmeLEueILn+ysC9
 VSpQ==
X-Gm-Message-State: AOJu0YwNUKvRHLySBoEekQTeq7XWJcYGDzX3QgpiTxRC4a25fkOcx4QZ
 E3HaArtALshCZU6uOnaF6xFiV3oGik9PvJzdsqE/JnwascqE6ffT7FCVUVOQsnEHtjFG43+pbEU
 8hQ==
X-Received: by 2002:a17:906:7956:b0:a9a:8028:45d8 with SMTP id
 a640c23a62f3a-a9ad2711860mr127618266b.7.1729765709495; 
 Thu, 24 Oct 2024 03:28:29 -0700 (PDT)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a913706d3sm601019066b.134.2024.10.24.03.28.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 24 Oct 2024 03:28:29 -0700 (PDT)
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
Subject: [PATCH v4 03/15] hw/display/apple-gfx: Adds PCI implementation
Date: Thu, 24 Oct 2024 12:28:01 +0200
Message-Id: <20241024102813.9855-4-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241024102813.9855-1-phil@philjordan.eu>
References: <20241024102813.9855-1-phil@philjordan.eu>
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
X-TUID: e/5myjgREKC4

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

 hw/display/Kconfig         |   4 +
 hw/display/apple-gfx-pci.m | 152 +++++++++++++++++++++++++++++++++++++
 hw/display/meson.build     |   1 +
 3 files changed, 157 insertions(+)
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
index 00000000000..4ee26dde422
--- /dev/null
+++ b/hw/display/apple-gfx-pci.m
@@ -0,0 +1,152 @@
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
+    Error *err = NULL;
+    int ret;
+
+    pci_register_bar(dev, PG_PCI_BAR_MMIO,
+                     PCI_BASE_ADDRESS_SPACE_MEMORY, &s->common.iomem_gfx);
+
+    ret = msi_init(dev, 0x0 /* config offset; 0 = find space */,
+                   PG_PCI_MAX_MSI_VECTORS, true /* msi64bit */,
+                   false /*msi_per_vector_mask*/, &err);
+    if (ret != 0) {
+        error_propagate(errp, err);
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
+    assert(rc->phases.hold == NULL);
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

