Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3845164ejb;
        Tue, 19 Sep 2023 13:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3MNSDkazBHj4pvKIBbBfWCW66naivFnqTLhp1UL59a43ue8VzMkqZqhm0Z7N9h2GH2yh4
X-Received: by 2002:a05:6214:262d:b0:649:8f20:5528 with SMTP id gv13-20020a056214262d00b006498f205528mr605219qvb.60.1695153942920;
        Tue, 19 Sep 2023 13:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695153942; cv=none;
        d=google.com; s=arc-20160816;
        b=V7CgfmutdMqk1QtkypGto4zj7Ala6NXIhce1DgD2HMUD66fDTcY061cKndKQWqc3LP
         OayTtWhdVW6KggmwlXPi2aloXGtQisq2p2Q3P2KBh4yhNFvzybtp/gKYzdMLim5byMYI
         hC6Zii0xvsnWF1d1wChovsF3+dyi1LHbzfT4v7OBC1Hjo0jN9L+K9B7ecI/AlDS2eP08
         PU3qFCveLZ1mN53r/SjSmHuSKH9+ZO+iQVunUfuxp+b7ezQ6LjXP9BzbljMq0sOiE7XH
         Zf4o8LAypxt1hxD6rieh2uKJWXEsIw0VyNrj/jq0uoOLkBXAKSi5cKzyttsVC4qN9GMR
         kvBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=I1VIeiCAZCg+w4w+YfOFwVZZgVacsljumaA1DMB3Cd8=;
        fh=31Pgf1blV3SQPmQ8WOxvGy7Z8ujSo7iGO5C67upv8D4=;
        b=G3V0gMxf8Sja5GRlrXF8j+W2OF5lupxzQ84L2tmh74QGK+O48xc6J6Wt+xNXqAj14Q
         ThGmOEs42Xc4xoLjqBeKuI6DHNHqwB+RR1s4uUBm+VIHLIJwDNzWSWauzYM8AZy+kN/6
         Mf2yNdv1egJ889/fYQiZVLKPlj7UPpCarM3pkfvJ0MZZxUaeHQxFqjJ6uT4xVq0yWwBt
         TdKAGcUbPSPoeOIhONz+Dh/PiTIhaq/6bqkMdLSaEBZoOMs74XLn7jDBf+bkUUxqI15t
         nBTctfIhasAmPbYhFMKzn9U23e7mV6pGtXDUtV87jf3OmcuPY+fedbzV1M4rjtW9WGm6
         ntTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=lTG7jjPT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020a0cec0d000000b006238ad6d2d2si7506303qvo.577.2023.09.19.13.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 13:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=lTG7jjPT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qigxG-0005c3-Gx; Tue, 19 Sep 2023 16:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3EeEJZQwKCCoTGHONKYZKLGTMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--nabihestefan.bounces.google.com>)
 id 1qiez2-00056f-WD
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:58:01 -0400
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3EeEJZQwKCCoTGHONKYZKLGTMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--nabihestefan.bounces.google.com>)
 id 1qieyl-00010S-20
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 13:58:00 -0400
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-59beb3a8291so74305527b3.1
 for <qemu-arm@nongnu.org>; Tue, 19 Sep 2023 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695146258; x=1695751058; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=I1VIeiCAZCg+w4w+YfOFwVZZgVacsljumaA1DMB3Cd8=;
 b=lTG7jjPTuruDxGbRFBKi3IYeF5MogkFN/nyqe0pYqePzyD1SOF8GZ/kuZN5LbG/1kN
 f+aMjNip1JXUw9DEAZG7CxoYo7Bo2xg7FxWL89iVxG5kqhqxlmAKc5otLywDIBFGB6Wq
 vmIFhSEWW0PehrfpvVSJ+PgJyJJQsRK+jOpHIU+nem+f9umFEA+XqhYn0HVqqqxOOGFN
 vA/dXBpYoF/p56DKdAq7NMXAE8sJ5XXwzmyrf056AJrJGZJ8nyiVYHaURUWX7ZGUAMi5
 9+lYqpot2/cXvHe9u9KKEuUt2X3owEm99ip6BD+QdvDx4sXy/k9jYD7C4D3+rJq2G1hp
 uo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695146258; x=1695751058;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I1VIeiCAZCg+w4w+YfOFwVZZgVacsljumaA1DMB3Cd8=;
 b=B7XXM28ef5txgftCPk3m8uiZC61lG6b46JjDSMehym9eT7mpWJGIOQ7YCgBHgDMtMf
 JoJiOmKkoDXgP1U9gFa8JEhzhrCTaYAJQ6ufcVxjh17gAS2iiSvv3yC32PBgHOCNk009
 +MDyGBGbRYXPhKw2mmsRNKQl0y1PGiSk4mZ3A/3rjean/cl93OiB2NSQ00JrvGu9oSPn
 4c1/ICJ79fUbbQo4rCJva+6b2hEr2Ie4CmybzgrFrB5Umaaxp1Df4c8qzyl9s2caNDB9
 cRPnRxutFd6E+h+eEOcGzF222lzPE9treHLz3dpVrx65aWXtZJ4T92+XN+Pqh6vF2l1w
 027g==
X-Gm-Message-State: AOJu0Ywt3T3u77Q2JAnkEG+u5DXxBEwfceHY+KS4zgpAkZEJPX8oj5Ug
 BRhvdKgkkQb60ygkCrCuWITbizsZlDAJZ36TNRY=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a81:8b54:0:b0:589:a855:7af with SMTP
 id e20-20020a818b54000000b00589a85507afmr4615ywk.7.1695146257934; Tue, 19 Sep
 2023 10:57:37 -0700 (PDT)
Date: Tue, 19 Sep 2023 17:57:12 +0000
In-Reply-To: <20230919175725.3413108-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20230919175725.3413108-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230919175725.3413108-2-nabihestefan@google.com>
Subject: [PATCH 01/14] hw/misc: Add Nuvoton's PCI Mailbox Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, Avi.Fishman@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3EeEJZQwKCCoTGHONKYZKLGTMUUMRK.IUSWKSa-GXSTUTMTa.UXM@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 19 Sep 2023 16:04:13 -0400
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
X-TUID: aejvfIGYsV+h

From: Hao Wu <wuhaotsh@google.com>

The PCI Mailbox Module is a high-bandwidth communcation module
between a Nuvoton BMC and CPU. It features 16KB RAM that are both
accessible by the BMC and core CPU. and supports interrupt for
both sides.

This patch implements the BMC side of the PCI mailbox module.
Communication with the core CPU is emulated via a chardev and
will be in a follow-up patch.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 hw/misc/meson.build                |   1 +
 hw/misc/npcm7xx_pci_mbox.c         | 176 +++++++++++++++++++++++++++++
 hw/misc/trace-events               |   5 +
 include/hw/misc/npcm7xx_pci_mbox.h |  63 +++++++++++
 4 files changed, 245 insertions(+)
 create mode 100644 hw/misc/npcm7xx_pci_mbox.c
 create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h

diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 892f8b91c5..1f4ec94584 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -70,6 +70,7 @@ system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
   'npcm7xx_clk.c',
   'npcm7xx_gcr.c',
   'npcm7xx_mft.c',
+  'npcm7xx_pci_mbox.c',
   'npcm7xx_pwm.c',
   'npcm7xx_rng.c',
 ))
diff --git a/hw/misc/npcm7xx_pci_mbox.c b/hw/misc/npcm7xx_pci_mbox.c
new file mode 100644
index 0000000000..d82a87fc41
--- /dev/null
+++ b/hw/misc/npcm7xx_pci_mbox.c
@@ -0,0 +1,176 @@
+/*
+ * Nuvoton NPCM7xx PCI Mailbox Module
+ *
+ * Copyright 2021 Google LLC
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
+#include "hw/irq.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties-system.h"
+#include "hw/misc/npcm7xx_pci_mbox.h"
+#include "hw/registerfields.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/bitops.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "qemu/timer.h"
+#include "qemu/units.h"
+#include "trace.h"
+
+REG32(NPCM7XX_PCI_MBOX_BMBXSTAT, 0x00);
+REG32(NPCM7XX_PCI_MBOX_BMBXCTL, 0x04);
+REG32(NPCM7XX_PCI_MBOX_BMBXCMD, 0x08);
+
+
+#define NPCM7XX_PCI_MBOX_NR_CI 8
+#define NPCM7XX_PCI_MBOX_CI_MASK MAKE_64BIT_MASK(0, NPCM7XX_PCI_MBOX_NR_CI)
+
+static void npcm7xx_pci_mbox_update_irq(NPCM7xxPCIMBoxState *s)
+{
+    /* We should send an interrupt when one of the CIE and CIF are both 1. */
+    if (s->regs[R_NPCM7XX_PCI_MBOX_BMBXSTAT] &
+        s->regs[R_NPCM7XX_PCI_MBOX_BMBXCTL] &
+        NPCM7XX_PCI_MBOX_CI_MASK) {
+        qemu_irq_raise(s->irq);
+        trace_npcm7xx_pci_mbox_irq(1);
+    } else {
+        qemu_irq_lower(s->irq);
+        trace_npcm7xx_pci_mbox_irq(0);
+    }
+}
+
+static uint64_t npcm7xx_pci_mbox_read(void *opaque, hwaddr offset, unsigned size)
+{
+    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(opaque);
+    uint16_t value = 0;
+
+    if (offset / sizeof(uint32_t) >= NPCM7XX_PCI_MBOX_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
+                      __func__, offset);
+        return 0;
+    }
+
+    value = s->regs[offset / sizeof(uint32_t)];
+    trace_npcm7xx_pci_mbox_read(DEVICE(s)->canonical_path, offset, value, size);
+    return value;
+}
+
+static void npcm7xx_pci_mbox_write(void *opaque, hwaddr offset,
+                              uint64_t v, unsigned size)
+{
+    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(opaque);
+
+    trace_npcm7xx_pci_mbox_write(DEVICE(s)->canonical_path, offset, v, size);
+    switch (offset) {
+    case A_NPCM7XX_PCI_MBOX_BMBXSTAT:
+        /* Clear bits that are 1. */
+        s->regs[R_NPCM7XX_PCI_MBOX_BMBXSTAT] &= ~v;
+        break;
+
+    case A_NPCM7XX_PCI_MBOX_BMBXCTL:
+        s->regs[R_NPCM7XX_PCI_MBOX_BMBXCTL] = v;
+        break;
+
+    case A_NPCM7XX_PCI_MBOX_BMBXCMD:
+        /* Set the bits that are 1. */
+        s->regs[R_NPCM7XX_PCI_MBOX_BMBXCMD] |= v;
+        /* TODO: Set interrupt to host. */
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: offset 0x%04" HWADDR_PRIx " out of range\n",
+                      __func__, offset);
+    }
+    npcm7xx_pci_mbox_update_irq(s);
+}
+
+static const struct MemoryRegionOps npcm7xx_pci_mbox_ops = {
+    .read       = npcm7xx_pci_mbox_read,
+    .write      = npcm7xx_pci_mbox_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid      = {
+        .min_access_size        = 4,
+        .max_access_size        = 4,
+        .unaligned              = false,
+    },
+};
+
+static void npcm7xx_pci_mbox_enter_reset(Object *obj, ResetType type)
+{
+    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(obj);
+
+    memset(s->regs, 0, 4 * NPCM7XX_PCI_MBOX_NR_REGS);
+}
+
+static void npcm7xx_pci_mbox_hold_reset(Object *obj)
+{
+    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(obj);
+
+    qemu_irq_lower(s->irq);
+}
+
+static void npcm7xx_pci_mbox_init(Object *obj)
+{
+    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    memory_region_init_ram_device_ptr(&s->ram, obj, "pci-mbox-ram",
+                                      NPCM7XX_PCI_MBOX_RAM_SIZE, s->content);
+    memory_region_init_io(&s->iomem, obj, &npcm7xx_pci_mbox_ops, s,
+                          "pci-mbox-iomem", 4 * KiB);
+    sysbus_init_mmio(sbd, &s->ram);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static const VMStateDescription vmstate_npcm7xx_pci_mbox = {
+    .name = "npcm7xx-pci-mbox-module",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, NPCM7xxPCIMBoxState,
+                             NPCM7XX_PCI_MBOX_NR_REGS),
+        VMSTATE_END_OF_LIST(),
+    },
+};
+
+static void npcm7xx_pci_mbox_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM7xx PCI Mailbox Controller";
+    dc->vmsd = &vmstate_npcm7xx_pci_mbox;
+    rc->phases.enter = npcm7xx_pci_mbox_enter_reset;
+    rc->phases.hold = npcm7xx_pci_mbox_hold_reset;
+}
+
+static const TypeInfo npcm7xx_pci_mbox_info = {
+    .name               = TYPE_NPCM7XX_PCI_MBOX,
+    .parent             = TYPE_SYS_BUS_DEVICE,
+    .instance_size      = sizeof(NPCM7xxPCIMBoxState),
+    .class_init         = npcm7xx_pci_mbox_class_init,
+    .instance_init      = npcm7xx_pci_mbox_init,
+};
+
+static void npcm7xx_pci_mbox_register_type(void)
+{
+    type_register_static(&npcm7xx_pci_mbox_info);
+}
+type_init(npcm7xx_pci_mbox_register_type);
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 4d1a0e17af..32743e00ce 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -148,6 +148,11 @@ npcm7xx_pwm_write(const char *id, uint64_t offset, uint32_t value) "%s offset: 0
 npcm7xx_pwm_update_freq(const char *id, uint8_t index, uint32_t old_value, uint32_t new_value) "%s pwm[%u] Update Freq: old_freq: %u, new_freq: %u"
 npcm7xx_pwm_update_duty(const char *id, uint8_t index, uint32_t old_value, uint32_t new_value) "%s pwm[%u] Update Duty: old_duty: %u, new_duty: %u"
 
+# npcm7xx_pci_mbox.c
+npcm7xx_pci_mbox_read(const char *id, uint64_t offset, uint64_t value, unsigned size) "%s offset: 0x%04" PRIx64 " value: 0x%02" PRIx64 " size: %u"
+npcm7xx_pci_mbox_write(const char *id, uint64_t offset, uint64_t value, unsigned size) "%s offset: 0x%04" PRIx64 " value: 0x%02" PRIx64 " size: %u"
+npcm7xx_pci_mbox_irq(int irq_level) "irq level: %d"
+
 # stm32f4xx_syscfg.c
 stm32f4xx_syscfg_set_irq(int gpio, int line, int level) "Interrupt: GPIO: %d, Line: %d; Level: %d"
 stm32f4xx_pulse_exti(int irq) "Pulse EXTI: %d"
diff --git a/include/hw/misc/npcm7xx_pci_mbox.h b/include/hw/misc/npcm7xx_pci_mbox.h
new file mode 100644
index 0000000000..0f8fda0db1
--- /dev/null
+++ b/include/hw/misc/npcm7xx_pci_mbox.h
@@ -0,0 +1,63 @@
+/*
+ * Nuvoton NPCM7xx PCI Mailbox Module
+ *
+ * Copyright 2021 Google LLC
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
+#ifndef NPCM7XX_PCI_MBOX_H
+#define NPCM7XX_PCI_MBOX_H
+
+#include "chardev/char-fe.h"
+#include "exec/memory.h"
+#include "hw/clock.h"
+#include "hw/irq.h"
+#include "hw/pci/pci.h"
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define NPCM7XX_PCI_MBOX_RAM_SIZE 0x4000
+
+#define NPCM7XX_PCI_VENDOR_ID   0x1050
+#define NPCM7XX_PCI_DEVICE_ID   0x0750
+#define NPCM7XX_PCI_REVISION    0
+#define NPCM7XX_PCI_CLASS_CODE  0xff
+
+/*
+ * Maximum amount of control registers in PCI Mailbox module. Do not increase
+ * this value without bumping vm version.
+ */
+#define NPCM7XX_PCI_MBOX_NR_REGS 3
+
+/**
+ * struct NPCM7xxPciMboxState - PCI Mailbox Device
+ * @parent: System bus device.
+ * @ram: the mailbox RAM memory space
+ * @iomem: Memory region through which registers are accessed.
+ * @content: The content of the PCI mailbox, initialized to 0.
+ * @regs: The MMIO registers.
+ */
+typedef struct NPCM7xxPCIMBoxState {
+    SysBusDevice parent;
+
+    MemoryRegion ram;
+    MemoryRegion iomem;
+
+    qemu_irq irq;
+    uint8_t content[NPCM7XX_PCI_MBOX_RAM_SIZE];
+    uint32_t regs[NPCM7XX_PCI_MBOX_NR_REGS];
+} NPCM7xxPCIMBoxState;
+
+#define TYPE_NPCM7XX_PCI_MBOX "npcm7xx-pci-mbox"
+#define NPCM7XX_PCI_MBOX(obj) \
+    OBJECT_CHECK(NPCM7xxPCIMBoxState, (obj), TYPE_NPCM7XX_PCI_MBOX)
+
+#endif /* NPCM7XX_PCI_MBOX_H */
-- 
2.42.0.459.ge4e396fd5e-goog

