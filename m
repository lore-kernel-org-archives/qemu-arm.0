Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp5193604lfb;
        Tue, 7 Sep 2021 16:29:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtZ+RhAnxFhLq8hS7dmRMcTKJ1FvIRXHRMjq/ejvsCsdI0NgG7aiJtXpBjHkuGczqjUe4i
X-Received: by 2002:a05:620a:2155:: with SMTP id m21mr715998qkm.499.1631057346455;
        Tue, 07 Sep 2021 16:29:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631057346; cv=none;
        d=google.com; s=arc-20160816;
        b=JTA36W6veeiBp4aN3ODh+79b+w9SsWhWPZMpQsYbYPd+fJkqQKGKhP0+ELrF25/BBI
         0Upaqs2P26FGZqqg6bY2x3ek2hzmDG2/zNXgo4vIrN/wpLcrafeD76yUSxyfvUWqBG88
         nZlEH2bfGicoAnadd/f8FzAZO5yg3Av4bJfo1n+czufJa6+EwJtZBFSf64rjU/Dk6FT+
         esG4HWMgSshKt1DqI3Ss4pkaaOASyrpaKwjK0EvSMpe8cQBMTpFdrZUgx9ZNr8YFExqU
         5z1RihECOUqWrgd01yWXQa3mtYObI444feX5o1DkrXKbkNAf2Cb0DLGqgozJ2ZPa4GwP
         boow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=REz7MoTH38epZxTahZPoruXDnwdeM0XS1sTeM2Kiju8=;
        b=0Si7J5BMoG+OFsjMMh4WbXKZLGbVSWSO1Lzn6wcq4jWjYEMADdKZvqVBLD1WZNkhj7
         HFijAHkgdjkXP5y9nYHAjmv15SZL4XWO2ZL78KE3taPLxtqGXZETH2/gTWbjiAIg30lX
         PsN6URJ4NW6AWiUdlyzFzOJ//ac6DSH7SMKj9twNlLQbt1rh+4DqPlh3Y4x8eTor3mri
         eH0sjAbWWDxHMijitLLMX2+eGrWDHYaAXAqVnrb+Ps2Eya7iUee19xN4pR4IIn6TKPo4
         4i7o23rFiUoZ0JTnfR97zXwa+d74a27kvymh3v86anPrVODi3UhBRsR1/sVxqxYWyCfo
         DlNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=n6DveWXQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si260101qtl.390.2021.09.07.16.29.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 16:29:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=n6DveWXQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:33144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNkWX-0005Zu-Qs
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 19:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3KPU3YQgKCAMzxkdrwvkjrrjoh.frpthpx-dupqrqjqx.ruj@flex--wuhaotsh.bounces.google.com>)
 id 1mNkUA-0000QY-PL
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 19:26:38 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449]:55274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3KPU3YQgKCAMzxkdrwvkjrrjoh.frpthpx-dupqrqjqx.ruj@flex--wuhaotsh.bounces.google.com>)
 id 1mNkU8-00042c-Hb
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 19:26:38 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 j21-20020aa78015000000b00412badd61e2so195790pfi.21
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 16:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=REz7MoTH38epZxTahZPoruXDnwdeM0XS1sTeM2Kiju8=;
 b=n6DveWXQba8CuX974pJAEp4z1UG3fV3WMlA2pZ6IA29QuOdEA2MrLGnQYtuHWonJzV
 XiOBAV59vuJQCQH+M5FIWTh//H3CEVV1wPy/t6fvZ+jZnaxjHDIOCOzuaLSxoLiBW2yH
 JC5xgbUpPae7b4GX9o0ZeZipIkIkae2+b+8PscR0dBXjmL8EcESDGA2A42/flknSsv5U
 2sseCXDW3KYQ7BwwoY7cj5BTA+Nt+G8fdAfheSuZ6rEvsUYtKz9Cfq2GFs+yIbYjCjhG
 poLZQPz6t+CDRtlxEQL95iDj6o9a9/aAD/xuNleFm1kunXOxsihQgElMWOCCKOP8SPAt
 huxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=REz7MoTH38epZxTahZPoruXDnwdeM0XS1sTeM2Kiju8=;
 b=QYM8it5jSiIxGIEAvHRDP8yY5tf3/y5cFQuc6u5a09Jr0M+PXyYdRkbdZFHl6puZ4u
 59VE2YRTBmZmc+8Bssoh8yiC8VC1CdiPk1GRxTr3St/m6dMnIt64+gQpDYZFKAVOC4nz
 nUsgxFG46vBu2bpL4NuoVqiezS8TUWKXZw93vxF/JbvOoAO4toTVAdAORT0DJuIK9yuc
 Ro434P1cXwS1fcCyrMLFIAdjsiVN84Q9vHR8PijetfscFA0idZuHcGy7+fBa3RwnxD5+
 6U9M3dzhlDj0FP/MfMOMxkC0vQ/HElX/B5Prk3VdUzRISj6wHFXxpWMHWTKAy88oWH7C
 HVmw==
X-Gm-Message-State: AOAM531runJ0eXbrPiWwT47j9MauZZ+ArXi4z3igGPjZGQg1qxlACc+I
 1sPzbbzc/xLxfIVYH92HjR3Q/iEWQRalIQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a05:6a00:c91:b0:3ee:9bed:61be with SMTP
 id a17-20020a056a000c9100b003ee9bed61bemr660424pfv.37.1631057192097; Tue, 07
 Sep 2021 16:26:32 -0700 (PDT)
Date: Tue,  7 Sep 2021 16:25:53 -0700
In-Reply-To: <20210907232555.3268967-1-wuhaotsh@google.com>
Message-Id: <20210907232555.3268967-3-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210907232555.3268967-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH 2/4] hw/sd: add nuvoton MMC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, f4bug@amsat.org, bin.meng@windriver.com, 
 qemu-block@nongnu.org, Shengtan Mao <stmao@google.com>,
 Chris Rauer <crauer@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3KPU3YQgKCAMzxkdrwvkjrrjoh.frpthpx-dupqrqjqx.ruj@flex--wuhaotsh.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2JsEGVHoxgkr

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 hw/arm/npcm7xx.c              |  12 +++-
 hw/sd/meson.build             |   1 +
 hw/sd/npcm7xx_sdhci.c         | 131 ++++++++++++++++++++++++++++++++++
 include/hw/arm/npcm7xx.h      |   2 +
 include/hw/sd/npcm7xx_sdhci.h |  65 +++++++++++++++++
 5 files changed, 210 insertions(+), 1 deletion(-)
 create mode 100644 hw/sd/npcm7xx_sdhci.c
 create mode 100644 include/hw/sd/npcm7xx_sdhci.h

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 2ab0080e0b..878c2208e0 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -63,6 +63,8 @@
 #define NPCM7XX_ROM_BA          (0xffff0000)
 #define NPCM7XX_ROM_SZ          (64 * KiB)
 
+/* SDHCI Modules */
+#define NPCM7XX_MMC_BA          (0xf0842000)
 
 /* Clock configuration values to be fixed up when bypassing bootloader */
 
@@ -83,6 +85,7 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART3_IRQ,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
+    NPCM7XX_MMC_IRQ             = 26,
     NPCM7XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
     NPCM7XX_TIMER1_IRQ,
     NPCM7XX_TIMER2_IRQ,
@@ -443,6 +446,8 @@ static void npcm7xx_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
         object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
     }
+
+    object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
 static void npcm7xx_realize(DeviceState *dev, Error **errp)
@@ -707,6 +712,12 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
                            &error_abort);
     memory_region_add_subregion(get_system_memory(), NPCM7XX_ROM_BA, &s->irom);
 
+    /* SDHCI */
+    sysbus_realize(SYS_BUS_DEVICE(&s->mmc), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->mmc), 0, NPCM7XX_MMC_BA);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc), 0,
+            npcm7xx_irq(s, NPCM7XX_MMC_IRQ));
+
     create_unimplemented_device("npcm7xx.shm",          0xc0001000,   4 * KiB);
     create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
@@ -736,7 +747,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.usbd[8]",      0xf0838000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[9]",      0xf0839000,   4 * KiB);
     create_unimplemented_device("npcm7xx.sd",           0xf0840000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.mmc",          0xf0842000,   8 * KiB);
     create_unimplemented_device("npcm7xx.pcimbx",       0xf0848000, 512 * KiB);
     create_unimplemented_device("npcm7xx.aes",          0xf0858000,   4 * KiB);
     create_unimplemented_device("npcm7xx.des",          0xf0859000,   4 * KiB);
diff --git a/hw/sd/meson.build b/hw/sd/meson.build
index f1ce357a3b..807ca07b7c 100644
--- a/hw/sd/meson.build
+++ b/hw/sd/meson.build
@@ -9,4 +9,5 @@ softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_mmci.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_sdhost.c'))
 softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_sdhci.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-sdhost.c'))
+softmmu_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_sdhci.c'))
 softmmu_ss.add(when: 'CONFIG_CADENCE_SDHCI', if_true: files('cadence_sdhci.c'))
diff --git a/hw/sd/npcm7xx_sdhci.c b/hw/sd/npcm7xx_sdhci.c
new file mode 100644
index 0000000000..85cccdc485
--- /dev/null
+++ b/hw/sd/npcm7xx_sdhci.c
@@ -0,0 +1,131 @@
+/*
+ * NPCM7xx SD-3.0 / eMMC-4.51 Host Controller
+ *
+ * Copyright (c) 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/sd/npcm7xx_sdhci.h"
+#include "sdhci-internal.h"
+
+static uint64_t npcm7xx_sdhci_read(void *opaque, hwaddr addr, unsigned int size)
+{
+    NPCM7xxSDHCIState *s = opaque;
+    uint64_t val = 0;
+
+    switch (addr) {
+    case NPCM7XX_PRSTVALS_0:
+    case NPCM7XX_PRSTVALS_1:
+    case NPCM7XX_PRSTVALS_2:
+    case NPCM7XX_PRSTVALS_3:
+    case NPCM7XX_PRSTVALS_4:
+    case NPCM7XX_PRSTVALS_5:
+        val = (uint64_t)s->regs.prstvals[(addr - NPCM7XX_PRSTVALS_0) / 2];
+        break;
+    case NPCM7XX_BOOTTOCTRL:
+        val = (uint64_t)s->regs.boottoctrl;
+        break;
+    default:
+        val = (uint64_t)s->sdhci.io_ops->read(&s->sdhci, addr, size);
+    }
+
+    return val;
+}
+
+static void npcm7xx_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
+                                unsigned int size)
+{
+    NPCM7xxSDHCIState *s = opaque;
+
+    switch (addr) {
+    case NPCM7XX_BOOTTOCTRL:
+        s->regs.boottoctrl = (uint32_t)val;
+        break;
+    default:
+        s->sdhci.io_ops->write(&s->sdhci, addr, val, size);
+    }
+}
+
+static const MemoryRegionOps npcm7xx_sdhci_ops = {
+    .read = npcm7xx_sdhci_read,
+    .write = npcm7xx_sdhci_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {.min_access_size = 1, .max_access_size = 4, .unaligned = false},
+};
+
+static void npcm7xx_sdhci_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxSDHCIState *s = NPCM7XX_SDHCI(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    SysBusDevice *sbd_sdhci = SYS_BUS_DEVICE(&s->sdhci);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &npcm7xx_sdhci_ops, s,
+                          TYPE_NPCM7XX_SDHCI, 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_realize(sbd_sdhci, errp);
+
+    /* propagate irq and "sd-bus" from generic-sdhci */
+    sysbus_pass_irq(sbd, sbd_sdhci);
+    s->bus = qdev_get_child_bus(DEVICE(sbd_sdhci), "sd-bus");
+}
+
+static void npcm7xx_sdhci_reset(DeviceState *dev)
+{
+    NPCM7xxSDHCIState *s = NPCM7XX_SDHCI(dev);
+    device_cold_reset(DEVICE(&s->sdhci));
+    s->regs.boottoctrl = 0;
+
+    s->sdhci.prnsts = NPCM7XX_PRSNTS_RESET;
+    s->sdhci.blkgap = NPCM7XX_BLKGAP_RESET;
+    s->sdhci.capareg = NPCM7XX_CAPAB_RESET;
+    s->sdhci.maxcurr = NPCM7XX_MAXCURR_RESET;
+    s->sdhci.version = NPCM7XX_HCVER_RESET;
+
+    memset(s->regs.prstvals, 0, NPCM7XX_PRSTVALS_SIZE * sizeof(uint16_t));
+    s->regs.prstvals[0] = NPCM7XX_PRSTVALS_0_RESET;
+    s->regs.prstvals[1] = NPCM7XX_PRSTVALS_1_RESET;
+    s->regs.prstvals[3] = NPCM7XX_PRSTVALS_3_RESET;
+}
+
+static void npcm7xx_sdhci_class_init(ObjectClass *classp, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(classp);
+
+    dc->desc = "NPCM7xx SD/eMMC Host Controller";
+    dc->realize = npcm7xx_sdhci_realize;
+    dc->reset = npcm7xx_sdhci_reset;
+}
+
+static void npcm7xx_sdhci_instance_init(Object *obj)
+{
+    NPCM7xxSDHCIState *s = NPCM7XX_SDHCI(obj);
+
+    object_initialize_child(OBJECT(s), "generic-sdhci", &s->sdhci,
+                            TYPE_SYSBUS_SDHCI);
+}
+
+static TypeInfo npcm7xx_sdhci_info = {
+    .name = TYPE_NPCM7XX_SDHCI,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(NPCM7xxSDHCIState),
+    .instance_init = npcm7xx_sdhci_instance_init,
+    .class_init = npcm7xx_sdhci_class_init,
+};
+
+static void npcm7xx_sdhci_register_types(void)
+{
+    type_register_static(&npcm7xx_sdhci_info);
+}
+
+type_init(npcm7xx_sdhci_register_types)
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 61ecc57ab9..ce593235d9 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -35,6 +35,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "hw/usb/hcd-ohci.h"
 #include "target/arm/cpu.h"
+#include "hw/sd/npcm7xx_sdhci.h"
 
 #define NPCM7XX_MAX_NUM_CPUS    (2)
 
@@ -103,6 +104,7 @@ typedef struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCM7xxSDHCIState   mmc;
 } NPCM7xxState;
 
 #define TYPE_NPCM7XX    "npcm7xx"
diff --git a/include/hw/sd/npcm7xx_sdhci.h b/include/hw/sd/npcm7xx_sdhci.h
new file mode 100644
index 0000000000..4d132f521b
--- /dev/null
+++ b/include/hw/sd/npcm7xx_sdhci.h
@@ -0,0 +1,65 @@
+/*
+ * NPCM7xx SD-3.0 / eMMC-4.51 Host Controller
+ *
+ * Copyright (c) 2021 Google LLC
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+ * for more details.
+ */
+
+#ifndef NPCM7XX_SDHCI_H
+#define NPCM7XX_SDHCI_H
+
+#include "hw/sd/sdhci.h"
+#include "qom/object.h"
+
+#define TYPE_NPCM7XX_SDHCI "npcm7xx.sdhci"
+#define NPCM7XX_REG_SIZE 0x100
+
+#define NPCM7XX_PRSTVALS_SIZE 6
+#define NPCM7XX_PRSTVALS 0x60
+#define NPCM7XX_PRSTVALS_0 0x60
+#define NPCM7XX_PRSTVALS_1 0x62
+#define NPCM7XX_PRSTVALS_2 0x64
+#define NPCM7XX_PRSTVALS_3 0x66
+#define NPCM7XX_PRSTVALS_4 0x68
+#define NPCM7XX_PRSTVALS_5 0x6A
+#define NPCM7XX_BOOTTOCTRL 0x70
+
+#define NPCM7XX_PRSNTS_RESET 0x04A00000
+#define NPCM7XX_BLKGAP_RESET 0x80
+#define NPCM7XX_CAPAB_RESET 0x0100200161EE0399
+#define NPCM7XX_MAXCURR_RESET 0x0000000000000005
+#define NPCM7XX_HCVER_RESET 0x1002
+
+#define NPCM7XX_PRSTVALS_0_RESET 0x0040
+#define NPCM7XX_PRSTVALS_1_RESET 0x0001
+#define NPCM7XX_PRSTVALS_3_RESET 0x0001
+
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxSDHCIState, NPCM7XX_SDHCI)
+
+typedef struct NPCM7xxRegs {
+    /* Preset Values Register Field, read-only */
+    uint16_t prstvals[NPCM7XX_PRSTVALS_SIZE];
+    /* Boot Timeout Control Register, read-write */
+    uint32_t boottoctrl;
+} NPCM7xxRegisters;
+
+typedef struct NPCM7xxSDHCIState {
+    SysBusDevice parent;
+
+    MemoryRegion iomem;
+    BusState *bus;
+    NPCM7xxRegisters regs;
+
+    SDHCIState sdhci;
+} NPCM7xxSDHCIState;
+
+#endif /* NPCM7XX_SDHCI_H */
-- 
2.33.0.153.gba50c8fa24-goog

