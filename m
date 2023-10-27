Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp378947ejc;
        Fri, 27 Oct 2023 10:57:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJFicQFOeaHluugwFiZfPJfAexMOprVCgi9n0OtegM+MEvJUZjRtmlm6VH2Qv1MLiXSOk1
X-Received: by 2002:a05:6902:18d2:b0:da0:37a6:7899 with SMTP id ck18-20020a05690218d200b00da037a67899mr4205457ybb.7.1698429465396;
        Fri, 27 Oct 2023 10:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698429465; cv=none;
        d=google.com; s=arc-20160816;
        b=J5Sv6pshToEbvz3ih0WRFrX6VPmEWVg1fYOU7zo+Gc0eAGZv02NU/itwBeVnGLrcEW
         BWQFRSwKkv2gcRJyRLPUksSK8HaN/ykE0ZlX/49wMW6JAfZOADrvxx7CBTdVM0FxyVHs
         ktpio2Qh1sxY58UcKZyTj0YSPGkGPpn36FHHscRhWW6heHOx/DfvwQ4/MbFo0nW/B9/R
         AldxgyfmPpyG0ENsuLIqUwyu2JbykufSZ6rTpfmMhLBToWabCgPdBwz+WcSct8VkT1oe
         9qbuEQv8eXJ3bUx3e0HFJJ/ncGCxAkKztKe22Suv4m7ycXnchMqWILsiU38+w9hI0Bk+
         qSjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=Afo7Dme+7VUwv5U7+Pk61iCDUSwZ+ZVgvdWN/QSqHYo=;
        fh=jnbnc+JA8os8BNrWArfY9mDntgDud8nPmN5Do23zP6g=;
        b=ib5uDxZHueku9C39f+Qoj/v9lnEnC8yrPdvFagVYTdZpvTzQnYbO3kokK/F/6ALDkq
         fowjXj33d2YiSqD/Ik2Ii7WG3A/ldnF7IzfAhaRuiRUAsptAYcepAUhZI2vzSGZcBgKn
         1VA8G7xFlONu+GNBMdDQoaQINb6xm/lwfU+tohzODekDRtT9nH1qnwWJgLipTMTfQgXK
         5GYuhn15hRNHYUkKZE6yy18+cHA0WWBfO8aVi5dHBeTEL3wrPNjc8mxkathT4Q2COm24
         iyWAy5crLEsmFYSuuDDu+gRgsKYEKXaCSosQA1Z0QqzSVvAXOorIUhHyui++uwTzvIc6
         rSyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=O+4K1+q2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020a25e012000000b00d9c713040c3si3672244ybg.707.2023.10.27.10.57.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 10:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=O+4K1+q2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwR3g-0006NE-Bp; Fri, 27 Oct 2023 13:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3mvk7ZQwKCK0aNOVURfgRSNaTbbTYR.PbZdRZh-NeZabaTah.beT@flex--nabihestefan.bounces.google.com>)
 id 1qwR3e-0006MQ-FF
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 13:55:42 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3mvk7ZQwKCK0aNOVURfgRSNaTbbTYR.PbZdRZh-NeZabaTah.beT@flex--nabihestefan.bounces.google.com>)
 id 1qwR3b-0007i7-Hq
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 13:55:42 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-da033914f7cso1703332276.0
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 10:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1698429338; x=1699034138; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Afo7Dme+7VUwv5U7+Pk61iCDUSwZ+ZVgvdWN/QSqHYo=;
 b=O+4K1+q2tnc5+Xi6d0eHl4pVCSNBRasuAp6hx29LZgKHRlJn1ZAyK9SPYE59MGLuu5
 kxvZ6ZQQ4K3xQMqbEQ9NN8DUs88m/Ac+EiHxjEW6Aia8+KzXUw50KP0YP5e/TXY6Vx09
 cSyTjKJVbcCIUwPXYQDtgULrwECa426bkiDFX7wnKCpU3PDKH444KdstIGjocAUqLicr
 7ADrLfMjWSyHIPvIpSzaISsPcQjHkfukKuEbSjkRBU3QDqry4GXWUxxkQ3+gK/V09Bs3
 DkKhLFwj0ysAdS+sGRpxRJ4CufKiSNorLAXWyCBFfYOLf/dCeXMRfmLxsLTlG0bQpbxK
 qRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698429338; x=1699034138;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Afo7Dme+7VUwv5U7+Pk61iCDUSwZ+ZVgvdWN/QSqHYo=;
 b=R7cuXVPURceKC5n0+iJJcjba2x2Y2Ocma7zhLWWs4VQ48/dQB87ETVj9+saEG9wAnD
 /mIUXBESjs3ZuDglPQ3wLDGL5nQvm9oxl52Hp+PrnpEh4mRn6NivzbS2+XNpQhYGdfxS
 Hq9D/j5z+NtDFwKnDQj43ZitbwDlsSjww124Hxv2gSJpQEfJOfxeV3JGoxDb+XAyKTGJ
 g9YEDAV1jOK7pULek0DedM8Cc8RkxU/0XsPQf01rfda/mo99og8z257//iZh+DykQ3X5
 C7C9Lk2RaZZ6hhBvwMfvDzMLwwkM1dMFemQytIUKzcTwnz4MXvJrzU99FlQK1BhoRy9P
 48fw==
X-Gm-Message-State: AOJu0Yz7v6quehshJFCya8FZKeCso5iP3dPpDkmjDCK4zNDY50loT9Sd
 E+kdGwe9ZZmFpoZKyfGZiTcOAns8JQUhvcuALtA=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:6902:1083:b0:d9a:c3b8:4274 with
 SMTP id v3-20020a056902108300b00d9ac3b84274mr82546ybu.7.1698429338099; Fri,
 27 Oct 2023 10:55:38 -0700 (PDT)
Date: Fri, 27 Oct 2023 17:55:22 +0000
In-Reply-To: <20231027175532.3601297-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231027175532.3601297-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027175532.3601297-2-nabihestefan@google.com>
Subject: [PATCH v5 01/11] hw/misc: Add Nuvoton's PCI Mailbox Module
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3mvk7ZQwKCK0aNOVURfgRSNaTbbTYR.PbZdRZh-NeZabaTah.beT@flex--nabihestefan.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: DXPDmfZelE3b

From: Hao Wu <wuhaotsh@google.com>

The PCI Mailbox Module is a high-bandwidth communcation module
between a Nuvoton BMC and CPU. It features 16KB RAM that are both
accessible by the BMC and core CPU. and supports interrupt for
both sides.

This patch implements the BMC side of the PCI mailbox module.
Communication with the core CPU is emulated via a chardev and
will be in a follow-up patch.

Change-Id: I1eb823c07a0f84973c8b94b303a130b45c458471
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
---
 hw/arm/npcm7xx.c                   |  16 +-
 hw/misc/meson.build                |   1 +
 hw/misc/npcm7xx_pci_mbox.c         | 324 +++++++++++++++++++++++++++++
 hw/misc/trace-events               |   5 +
 include/hw/arm/npcm7xx.h           |   1 +
 include/hw/misc/npcm7xx_pci_mbox.h |  81 ++++++++
 6 files changed, 427 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/npcm7xx_pci_mbox.c
 create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 15ff21d047..c69e936669 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -53,6 +53,9 @@
 /* ADC Module */
 #define NPCM7XX_ADC_BA          (0xf000c000)
 
+/* PCI Mailbox Module */
+#define NPCM7XX_PCI_MBOX_BA     (0xf0848000)
+
 /* Internal AHB SRAM */
 #define NPCM7XX_RAM3_BA         (0xc0008000)
 #define NPCM7XX_RAM3_SZ         (4 * KiB)
@@ -83,6 +86,10 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
+    NPCM7XX_PECI_IRQ            = 6,
+    NPCM7XX_PCI_MBOX_IRQ        = 8,
+    NPCM7XX_KCS_HIB_IRQ         = 9,
+    NPCM7XX_GMAC1_IRQ           = 14,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
     NPCM7XX_MMC_IRQ             = 26,
@@ -706,6 +713,14 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    /* PCI Mailbox. Cannot fail */
+    sysbus_realize(SYS_BUS_DEVICE(&s->pci_mbox), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->pci_mbox), 0, NPCM7XX_PCI_MBOX_BA);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->pci_mbox), 1,
+        NPCM7XX_PCI_MBOX_BA + NPCM7XX_PCI_MBOX_RAM_SIZE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->pci_mbox), 0,
+                       npcm7xx_irq(s, NPCM7XX_PCI_MBOX_IRQ));
+
     /* RAM2 (SRAM) */
     memory_region_init_ram(&s->sram, OBJECT(dev), "ram2",
                            NPCM7XX_RAM2_SZ, &error_abort);
@@ -765,7 +780,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.usbd[8]",      0xf0838000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[9]",      0xf0839000,   4 * KiB);
     create_unimplemented_device("npcm7xx.sd",           0xf0840000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.pcimbx",       0xf0848000, 512 * KiB);
     create_unimplemented_device("npcm7xx.aes",          0xf0858000,   4 * KiB);
     create_unimplemented_device("npcm7xx.des",          0xf0859000,   4 * KiB);
     create_unimplemented_device("npcm7xx.sha",          0xf085a000,   4 * KiB);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index f60de33f9a..3ee3f2226f 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -73,6 +73,7 @@ system_ss.add(when: 'CONFIG_NPCM7XX', if_true: files(
   'npcm7xx_clk.c',
   'npcm7xx_gcr.c',
   'npcm7xx_mft.c',
+  'npcm7xx_pci_mbox.c',
   'npcm7xx_pwm.c',
   'npcm7xx_rng.c',
 ))
diff --git a/hw/misc/npcm7xx_pci_mbox.c b/hw/misc/npcm7xx_pci_mbox.c
new file mode 100644
index 0000000000..c770ad6fcf
--- /dev/null
+++ b/hw/misc/npcm7xx_pci_mbox.c
@@ -0,0 +1,324 @@
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
+#include "chardev/char-fe.h"
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
+enum NPCM7xxPCIMBoxOperation {
+    NPCM7XX_PCI_MBOX_OP_READ = 1,
+    NPCM7XX_PCI_MBOX_OP_WRITE,
+};
+
+#define NPCM7XX_PCI_MBOX_OFFSET_BYTES 8
+
+/* Response code */
+#define NPCM7XX_PCI_MBOX_OK 0
+#define NPCM7XX_PCI_MBOX_INVALID_OP 0xa0
+#define NPCM7XX_PCI_MBOX_INVALID_SIZE 0xa1
+#define NPCM7XX_PCI_MBOX_UNSPECIFIED_ERROR 0xff
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
+static void npcm7xx_pci_mbox_send_response(NPCM7xxPCIMBoxState *s, uint8_t code)
+{
+    qemu_chr_fe_write(&s->chr, &code, 1);
+    if (code == NPCM7XX_PCI_MBOX_OK && s->op == NPCM7XX_PCI_MBOX_OP_READ) {
+        qemu_chr_fe_write(&s->chr, (uint8_t *)(&s->data), s->size);
+    }
+}
+
+static void npcm7xx_pci_mbox_handle_read(NPCM7xxPCIMBoxState *s)
+{
+    MemTxResult r = memory_region_dispatch_read(
+        &s->ram, s->offset, &s->data, MO_LE | size_memop(s->size),
+        MEMTXATTRS_UNSPECIFIED);
+
+    npcm7xx_pci_mbox_send_response(s, (uint8_t)r);
+}
+
+static void npcm7xx_pci_mbox_handle_write(NPCM7xxPCIMBoxState *s)
+{
+    MemTxResult r = memory_region_dispatch_write(
+        &s->ram, s->offset, s->data, MO_LE | size_memop(s->size),
+        MEMTXATTRS_UNSPECIFIED);
+
+    npcm7xx_pci_mbox_send_response(s, (uint8_t)r);
+}
+
+static void npcm7xx_pci_mbox_receive_char(NPCM7xxPCIMBoxState *s, uint8_t byte)
+{
+    switch (s->state) {
+    case NPCM7XX_PCI_MBOX_STATE_IDLE:
+        switch (byte) {
+        case NPCM7XX_PCI_MBOX_OP_READ:
+        case NPCM7XX_PCI_MBOX_OP_WRITE:
+            s->op = byte;
+            s->state = NPCM7XX_PCI_MBOX_STATE_OFFSET;
+            s->offset = 0;
+            s->receive_count = 0;
+            break;
+
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "received invalid op type: 0x%" PRIx8, byte);
+            npcm7xx_pci_mbox_send_response(s, NPCM7XX_PCI_MBOX_INVALID_OP);
+            break;
+        }
+        break;
+
+    case NPCM7XX_PCI_MBOX_STATE_OFFSET:
+        s->offset += (uint64_t)byte << (s->receive_count * BITS_PER_BYTE);
+        if (++s->receive_count >= NPCM7XX_PCI_MBOX_OFFSET_BYTES) {
+            s->state = NPCM7XX_PCI_MBOX_STATE_SIZE;
+        }
+        break;
+
+    case NPCM7XX_PCI_MBOX_STATE_SIZE:
+        s->size = byte;
+        if (s->size < 1 || s->size > sizeof(uint64_t)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "received invalid size: %u", byte);
+            npcm7xx_pci_mbox_send_response(s, NPCM7XX_PCI_MBOX_INVALID_SIZE);
+            s->state = NPCM7XX_PCI_MBOX_STATE_IDLE;
+            break;
+        }
+        if (s->op == NPCM7XX_PCI_MBOX_OP_READ) {
+            npcm7xx_pci_mbox_handle_read(s);
+            s->state = NPCM7XX_PCI_MBOX_STATE_IDLE;
+        } else {
+            s->receive_count = 0;
+            s->data = 0;
+            s->state = NPCM7XX_PCI_MBOX_STATE_DATA;
+        }
+        break;
+
+    case NPCM7XX_PCI_MBOX_STATE_DATA:
+        g_assert(s->op == NPCM7XX_PCI_MBOX_OP_WRITE);
+        s->data += (uint64_t)byte << (s->receive_count * BITS_PER_BYTE);
+        if (++s->receive_count >= s->size) {
+            npcm7xx_pci_mbox_handle_write(s);
+            s->state = NPCM7XX_PCI_MBOX_STATE_IDLE;
+        }
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static uint64_t npcm7xx_pci_mbox_read(void *opaque, hwaddr offset,
+                                      unsigned size)
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
+    s->state = NPCM7XX_PCI_MBOX_STATE_IDLE;
+    s->receive_count = 0;
+}
+
+static void npcm7xx_pci_mbox_hold_reset(Object *obj)
+{
+    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(obj);
+
+    qemu_irq_lower(s->irq);
+}
+
+static int can_receive(void *opaque)
+{
+    return 1;
+}
+
+static void receive(void *opaque, const uint8_t *buf, int size)
+{
+    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(opaque);
+    int i;
+
+    for (i = 0; i < size; ++i) {
+        npcm7xx_pci_mbox_receive_char(s, buf[i]);
+    }
+}
+
+static void chr_event(void *opaque, QEMUChrEvent event)
+{
+    switch (event) {
+    case CHR_EVENT_OPENED:
+    case CHR_EVENT_CLOSED:
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+
+    default:
+        g_assert_not_reached();
+    }
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
+static void npcm7xx_pci_mbox_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxPCIMBoxState *s = NPCM7XX_PCI_MBOX(dev);
+
+    qemu_chr_fe_set_handlers(&s->chr, can_receive, receive,
+                             chr_event, NULL, OBJECT(dev), NULL, true);
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
+static Property npcm7xx_pci_mbox_properties[] = {
+    DEFINE_PROP_CHR("chardev", NPCM7xxPCIMBoxState, chr),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void npcm7xx_pci_mbox_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "NPCM7xx PCI Mailbox Controller";
+    dc->vmsd = &vmstate_npcm7xx_pci_mbox;
+    dc->realize = npcm7xx_pci_mbox_realize;
+    rc->phases.enter = npcm7xx_pci_mbox_enter_reset;
+    rc->phases.hold = npcm7xx_pci_mbox_hold_reset;
+    device_class_set_props(dc, npcm7xx_pci_mbox_properties);
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
index 24ba7cc4d0..36c7840143 100644
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
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 72c7722096..273090ac60 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -26,6 +26,7 @@
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
 #include "hw/misc/npcm7xx_mft.h"
+#include "hw/misc/npcm7xx_pci_mbox.h"
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/net/npcm7xx_emc.h"
diff --git a/include/hw/misc/npcm7xx_pci_mbox.h b/include/hw/misc/npcm7xx_pci_mbox.h
new file mode 100644
index 0000000000..e595fbcc70
--- /dev/null
+++ b/include/hw/misc/npcm7xx_pci_mbox.h
@@ -0,0 +1,81 @@
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
+typedef enum NPCM7xxPCIMBoxHostState {
+    NPCM7XX_PCI_MBOX_STATE_IDLE,
+    NPCM7XX_PCI_MBOX_STATE_OFFSET,
+    NPCM7XX_PCI_MBOX_STATE_SIZE,
+    NPCM7XX_PCI_MBOX_STATE_DATA,
+} NPCM7xxPCIMBoxHostState ;
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
+ * @chr: The chardev backend used to communicate with core CPU.
+ * @offset: The offset to start transfer.
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
+    CharBackend chr;
+
+    /* aux data for receiving host commands. */
+    NPCM7xxPCIMBoxHostState state;
+    uint8_t op;
+    hwaddr offset;
+    uint8_t size;
+    uint64_t data;
+    int receive_count;
+} NPCM7xxPCIMBoxState;
+
+#define TYPE_NPCM7XX_PCI_MBOX "npcm7xx-pci-mbox"
+#define NPCM7XX_PCI_MBOX(obj) \
+    OBJECT_CHECK(NPCM7xxPCIMBoxState, (obj), TYPE_NPCM7XX_PCI_MBOX)
+
+#endif /* NPCM7XX_PCI_MBOX_H */
-- 
2.42.0.820.g83a721a137-goog

