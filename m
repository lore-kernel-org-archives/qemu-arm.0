Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986432njb;
        Mon, 5 Aug 2024 13:17:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcGKorrOf0wIKn2UkX3slSe3Mfupp4efhy+OBViBYIcWTh0AVwJlgCL/8JCJnIk4gdxuPht1JwXuCDBvM9GW8J0KIluh+l
X-Received: by 2002:a05:6a20:2590:b0:1c3:b267:4261 with SMTP id adf61e73a8af0-1c69955a055mr13414334637.12.1722889059097;
        Mon, 05 Aug 2024 13:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889059; cv=none;
        d=google.com; s=arc-20160816;
        b=w4Mrj4T54y4m17oL6B/uL5Ot38gVR7kMcu9/oVQ9vpWn2Ha5kZhahBfxvCvAhuL4lq
         TyXpET0oHbx3ZRWfbmyiElztupawEBxAdJid10jpir9IOIjltRjlG+ZmUSnvP28/fTl/
         buPgXWORsggnJlOfQ4ASwjp4A2gsSpGTqPim4DGJ+joBrfLB7OY7WmBZgeIVgrx4DPdV
         2Eh2FTvS3XC+Blvk6AKgxdvJ6xRjLKiAg4HcupUO4Tmrv56+BS1YaqTmxqoKIeHAah9W
         DWd9J4N+w3LAImjKER8s9b6vtkMXl3RK+XBie7SuWZLU3i9mZyJzpL4oIerZ7m5h9sw/
         mqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=c49N6GGLSy9opjp4muaxH3Sb0XY//FAQu7ZNOX8Wu58=;
        fh=24nmjMiHnOXR0XCIBcSIUy1HMYD7mwj+0a+/yykUuGw=;
        b=uugSLSZ/KDWo5wFVXwZ02vCzrK5p7JJYvvez7+o0N2vVeYiawoSqo+PZdcxXtJqVVu
         p+t/yBjZgTyl9TCrxxAc1v7US2SN5ZHdOho9wnOzE/EiAmUUsHqAzaHfCqn/Usy6C/yf
         WlGiaCBqs2upU4BDAO+r3eJO+fSjrg1QAVla5YlqKXuLhxHPcEaPnjCjr5LWBIAD0D0J
         hAX131mVJqLeJ61t/IQ3yt0uq6HnICOVIyj8OBN8qPPsubFGieGkg1B/wMmJg4PBmkMX
         9TQoqEuAAb1N6+fSxBv5KXOIeZxetGv2I8RNuRIGbZsmAU/XXO+b11V3JY8dN3kJ0V75
         9crw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="ngbR/otd";
       spf=pass (google.com: domain of 3yjoxzgukc8k8pax4v33v0t.r31p0tc.qt22tt0x2p63.36v@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3YjOxZgUKC8k8pAx4v33v0t.r31p0tC.qt22tt0x2p63.36v@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3YjOxZgUKC8k8pAx4v33v0t.r31p0tC.qt22tt0x2p63.36v@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id d2e1a72fcca58-7106e26c833sor7942118b3a.1.2024.08.05.13.17.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3yjoxzgukc8k8pax4v33v0t.r31p0tc.qt22tt0x2p63.36v@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="ngbR/otd";
       spf=pass (google.com: domain of 3yjoxzgukc8k8pax4v33v0t.r31p0tc.qt22tt0x2p63.36v@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3YjOxZgUKC8k8pAx4v33v0t.r31p0tC.qt22tt0x2p63.36v@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889058; x=1723493858; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c49N6GGLSy9opjp4muaxH3Sb0XY//FAQu7ZNOX8Wu58=;
        b=ngbR/otd/libooc2EmA4yGoVHQKqR6v06cvanWa4Wib4bA+0TO8++Go0141j+P1pWU
         GHh5/x73ZROuwZTkFBW0LPuuf+t4r2sOtJxCv9SWNpOYbAOSmGxrTsjkG0B9d8Mq6Gy9
         qQmNrldW1OSg3+gzLGZKlpRknwzkueT0SzEG0v7QdQ+6Gc2ZKknYODqjk25J6fWr1mk8
         RGssPA/ewsN38GXqD2+1bTpyUstRCxY+tqTR0czNEbmTI5nPJ/fvR6fF8gjJHWHRkpxJ
         jVdAdT0Hfz3F/BjccTfoOq2gUc1ge7dOUlK+F4dtfvqlqQXul7qStUrFGxMb+AQltnhl
         +GUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889058; x=1723493858;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c49N6GGLSy9opjp4muaxH3Sb0XY//FAQu7ZNOX8Wu58=;
        b=Iz1QjZ8ciiz2FRGEAzn8fgQI89smXa/JpZOFT0NrcjjY2R8I7OHE5PSqLW3vYriSLH
         4HzQ7i5wpA6tePm8/eFcelIe1wGPqnH1o0IAFcNpPYY1jM6ztSEwmg8VN+bCA16WFTMB
         0nM2YnZn4l/KlzAjJtAP3ZLMuc8LgA6+kSXKSBpdPzDB6hjMZ8suIF9hEl5pXm5FT9OM
         wcGjV2gMW4AQb/jlnB3ZCQe0SjMwNgUty3TYmWPtqvvXwbu5uDbw7YCXzW4Z24aCg3QQ
         LF6Yp9x07M14DD0ckDDaTDvlKk/O9aq61/ThwEBGKS8ltEqG5tZIc1HWakYgi5rvjSca
         RDgw==
X-Forwarded-Encrypted: i=1; AJvYcCW+X25GoNMxsSTYU/MlSXQLIn6m3Yb3bjKveygb5J2MXV6/9IUZBUY4+iGJb8hP8ZNiaxMb/LxBNafX/yyz2gN8GUSUe7oL
X-Gm-Message-State: AOJu0Yx1aniP2iF9mkFFX8mX6GaIj8PiNlvIGNd/cuQ4WZ6aPtEWAN02
	lj69nghes3jZpG0iUtv2Ng1zYWuPyT3+C4gjqigL0F33Dccb/rLVbNGwnTfEsToucQexuS29pA=
	=
X-Google-Smtp-Source: AGHT+IHUhdCBb2qP/Rfk7DkSllCc8S8AqxUyTM4uvF8QUbFgLoRBTH1nTm66VqdJDI0OhIag0/X4LPzILQ==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6a00:85a1:b0:70d:1b0d:a15d with SMTP id
 d2e1a72fcca58-71065f30ddfmr146221b3a.3.1722889058476; Mon, 05 Aug 2024
 13:17:38 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:05 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-11-tavip@google.com>
Subject: [RFC PATCH 10/23] hw/char: add support for flexcomm usart
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: 4Zq8jWSzaGBy

Add support for NXP's flexcomm usart. It supports interupts and FIFO
access but no DMA.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 hw/arm/svd/meson.build           |   4 +
 hw/char/flexcomm_usart.c         | 302 +++++++++++++++++++++++++++++++
 hw/char/meson.build              |   1 +
 hw/char/trace-events             |   9 +
 hw/misc/flexcomm.c               |   9 +
 include/hw/char/flexcomm_usart.h |  20 ++
 include/hw/misc/flexcomm.h       |   6 +
 tests/unit/meson.build           |   3 +-
 8 files changed, 353 insertions(+), 1 deletion(-)
 create mode 100644 hw/char/flexcomm_usart.c
 create mode 100644 include/hw/char/flexcomm_usart.h

diff --git a/hw/arm/svd/meson.build b/hw/arm/svd/meson.build
index 9ce6c1d838..ed0f69f437 100644
--- a/hw/arm/svd/meson.build
+++ b/hw/arm/svd/meson.build
@@ -2,3 +2,7 @@ genh += custom_target('flexcomm.h',
                       output: 'flexcomm.h',
                       input: 'MIMXRT595S_cm33.xml',
                       command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'FLEXCOMM0', '-t', 'FLEXCOMM'])
+genh += custom_target('flexcomm_usart.h',
+                      output: 'flexcomm_usart.h',
+                      input: 'MIMXRT595S_cm33.xml',
+                      command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'USART0', '-t', 'FLEXCOMM_USART'])
diff --git a/hw/char/flexcomm_usart.c b/hw/char/flexcomm_usart.c
new file mode 100644
index 0000000000..c00106eee6
--- /dev/null
+++ b/hw/char/flexcomm_usart.c
@@ -0,0 +1,302 @@
+/*
+ * QEMU model for NXP's FLEXCOMM USART
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/cutils.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "exec/address-spaces.h"
+#include "qapi/error.h"
+#include "trace.h"
+#include "hw/regs.h"
+#include "hw/char/flexcomm_usart.h"
+
+#define reg(field) offsetof(FLEXCOMM_USART_Type, field)
+#define regi(x) (reg(x) / sizeof(uint32_t))
+#define REG_NO (sizeof(FLEXCOMM_USART_Type) / sizeof(uint32_t))
+
+static FLEXCOMM_USART_REGISTER_NAMES_ARRAY(reg_names);
+
+static void flexcomm_usart_reset(FlexcommState *s)
+{
+    flexcomm_usart_reset_registers(&s->regs.usart);
+}
+
+static void update_fifo_stat(FlexcommState *s)
+{
+    int rxlvl = fifo32_num_used(&s->rx_fifo);
+    int txlvl = fifo32_num_used(&s->tx_fifo);
+
+    s->regs.usart.FIFOSTAT_b.RXLVL = fifo32_num_used(&s->rx_fifo);
+    s->regs.usart.FIFOSTAT_b.TXLVL = fifo32_num_used(&s->tx_fifo);
+    s->regs.usart.FIFOSTAT_b.RXFULL = fifo32_is_full(&s->rx_fifo) ? 1 : 0;
+    s->regs.usart.FIFOSTAT_b.RXNOTEMPTY = !fifo32_is_empty(&s->rx_fifo) ? 1 : 0;
+    s->regs.usart.FIFOSTAT_b.TXNOTFULL = !fifo32_is_full(&s->tx_fifo) ? 1 : 0;
+    s->regs.usart.FIFOSTAT_b.TXEMPTY = fifo32_is_empty(&s->tx_fifo) ? 1 : 0;
+
+    if (s->regs.usart.FIFOTRIG_b.RXLVLENA &&
+        (rxlvl > s->regs.usart.FIFOTRIG_b.RXLVL)) {
+        s->regs.usart.FIFOINTSTAT_b.RXLVL = 1;
+    } else {
+        s->regs.usart.FIFOINTSTAT_b.RXLVL = 0;
+    }
+
+    if (s->regs.usart.FIFOTRIG_b.TXLVLENA &&
+        (txlvl <= s->regs.usart.FIFOTRIG_b.TXLVL)) {
+        s->regs.usart.FIFOINTSTAT_b.TXLVL = 1;
+    } else {
+        s->regs.usart.FIFOINTSTAT_b.TXLVL = 0;
+    }
+
+    trace_flexcomm_usart_fifostat(DEVICE(s)->id, s->regs.usart.FIFOSTAT,
+                                 s->regs.usart.FIFOINTSTAT);
+}
+
+static void flexcomm_usart_irq_update(FlexcommState *s)
+{
+    bool irq, per_irqs, fifo_irqs, enabled = s->regs.usart.CFG_b.ENABLE;
+
+    update_fifo_stat(s);
+    fifo_irqs = s->regs.usart.FIFOINTSTAT & s->regs.usart.FIFOINTENSET;
+
+    s->regs.usart.INTSTAT = s->regs.usart.STAT & s->regs.usart.INTENSET;
+    per_irqs = s->regs.usart.INTSTAT != 0;
+
+    irq = enabled && (fifo_irqs || per_irqs);
+
+    trace_flexcomm_usart_irq(DEVICE(s)->id, irq, fifo_irqs, per_irqs, enabled);
+    flexcomm_irq(s, irq);
+}
+
+static int flexcomm_usart_rx_space(void *opaque)
+{
+    FlexcommState *s = opaque;
+    uint32_t ret = fifo32_num_free(&s->rx_fifo);
+
+    if (!s->regs.usart.CFG_b.ENABLE || !s->regs.usart.FIFOCFG_b.ENABLERX) {
+        ret = 0;
+    }
+
+    trace_flexcomm_usart_rx_space(DEVICE(s)->id, ret);
+
+    return ret;
+}
+
+static void flexcomm_usart_rx(void *opaque, const uint8_t *buf, int size)
+{
+    FlexcommState *s = opaque;
+
+    if (!s->regs.usart.CFG_b.ENABLE || !s->regs.usart.FIFOCFG_b.ENABLERX) {
+        return;
+    }
+
+    trace_flexcomm_usart_rx(DEVICE(s)->id);
+
+    while (!fifo32_is_full(&s->rx_fifo) && size) {
+        fifo32_push(&s->rx_fifo, *buf++);
+        size--;
+    }
+
+    flexcomm_usart_irq_update(s);
+}
+
+static MemTxResult flexcomm_usart_reg_read(void *opaque, FlexcommState *s,
+                                          int f, hwaddr addr, uint64_t *data,
+                                          unsigned size)
+{
+    MemTxResult ret = MEMTX_OK;
+
+    if (!reg32_aligned_access(addr, size)) {
+        ret = MEMTX_ERROR;
+        goto out;
+    }
+
+    switch (addr) {
+    case reg(FIFORD):
+    {
+        if (!fifo32_is_empty(&s->rx_fifo)) {
+            *data = fifo32_pop(&s->rx_fifo);
+            qemu_chr_fe_accept_input(&s->chr);
+        }
+        break;
+    }
+    case reg(FIFORDNOPOP):
+    {
+        if (!fifo32_is_empty(&s->rx_fifo)) {
+            *data = fifo32_peek(&s->rx_fifo);
+        }
+        break;
+    }
+    default:
+        *data = reg32_read(&s->regs, addr);
+        break;
+    }
+
+    flexcomm_usart_irq_update(s);
+
+out:
+    trace_flexcomm_usart_reg_read(DEVICE(s)->id, reg_names[addr], addr, *data);
+    return ret;
+}
+
+static MemTxResult flexcomm_usart_reg_write(void *opaque, FlexcommState *s,
+                                           int f, hwaddr addr, uint64_t value,
+                                           unsigned size)
+{
+    MemTxResult ret = MEMTX_OK;
+    static uint32_t mask[REG_NO] = {
+        [regi(CFG)] = BITS(23, 18) | BITS(15, 14) | BITS(12, 11) | BITS(9, 2) |
+                      BIT(0),
+        [regi(CTL)] = BIT(16) | BITS(9, 8) | BIT(6) | BITS(2, 1),
+        [regi(STAT)] = BITS(16, 11) | BIT(5),
+        [regi(INTENSET)] = BITS(16, 11) | BITS(6, 5) | BIT(3),
+        [regi(INTENCLR)] = BITS(16, 11) | BITS(6, 5) | BIT(3),
+        [regi(BRG)] = BITS(15, 0),
+        [regi(OSR)] = BITS(3, 0),
+        [regi(ADDR)] = BITS(7, 0),
+        [regi(FIFOCFG)] = BITS(16, 12) | BITS(5, 4) | BITS(1, 0),
+        [regi(FIFOSTAT)] = BITS(1, 0),
+        [regi(FIFOTRIG)] = BITS(19, 16) | BITS(11, 8) | BITS(1, 0),
+        [regi(FIFOINTENSET)] = BITS(3, 0),
+        [regi(FIFOINTENCLR)] = BITS(3, 0),
+        [regi(FIFOWR)] = BITS(8, 0),
+    };
+
+    if (!reg32_aligned_access(addr, size)) {
+        ret = MEMTX_ERROR;
+        goto out;
+    }
+
+    switch (addr) {
+    case reg(INTENCLR):
+    {
+        reg32_write(&s->regs, addr, value, mask);
+        s->regs.usart.INTENSET &= ~s->regs.usart.INTENCLR;
+        break;
+    }
+    case reg(FIFOCFG):
+    {
+        reg32_write(&s->regs, addr, value, mask);
+        if (s->regs.usart.FIFOCFG_b.EMPTYRX) {
+            s->regs.usart.FIFOCFG_b.EMPTYRX = 0;
+            fifo32_reset(&s->rx_fifo);
+        }
+        if (s->regs.usart.FIFOCFG_b.EMPTYTX) {
+            s->regs.usart.FIFOCFG_b.EMPTYTX = 0;
+            fifo32_reset(&s->tx_fifo);
+        }
+        break;
+    }
+    case reg(FIFOSTAT):
+    {
+        bool rxerr = s->regs.usart.FIFOSTAT_b.RXERR;
+        bool txerr = s->regs.usart.FIFOSTAT_b.TXERR;
+
+        reg32_write(&s->regs, addr, value, mask);
+
+        if (rxerr && s->regs.usart.FIFOSTAT_b.RXERR) {
+            rxerr = false;
+        }
+        if (txerr && s->regs.usart.FIFOSTAT_b.TXERR) {
+            txerr = false;
+        }
+
+        s->regs.usart.FIFOSTAT_b.RXERR = rxerr;
+        s->regs.usart.FIFOSTAT_b.TXERR = txerr;
+        break;
+    }
+    case reg(FIFOINTENSET):
+    {
+        s->regs.usart.FIFOINTENSET |= value & mask[addr / 4];
+        break;
+    }
+    case reg(FIFOINTENCLR):
+    {
+        reg32_write(&s->regs, addr, value, mask);
+        s->regs.usart.FIFOINTENSET &= ~s->regs.usart.FIFOINTENCLR;
+        break;
+    }
+    case reg(FIFOWR):
+    {
+        reg32_write(&s->regs, addr, value, mask);
+        if (!fifo32_is_full(&s->tx_fifo)) {
+            fifo32_push(&s->tx_fifo, s->regs.usart.FIFOWR);
+        }
+
+        if (!s->regs.usart.CFG_b.ENABLE || !s->regs.usart.FIFOCFG_b.ENABLETX) {
+            break;
+        }
+
+        while (!fifo32_is_empty(&s->tx_fifo)) {
+            uint32_t val32 = fifo32_pop(&s->tx_fifo);
+            uint8_t val8 = val32 & 0xff;
+
+            trace_flexcomm_usart_tx(DEVICE(s)->id);
+            qemu_chr_fe_write_all(&s->chr, &val8, sizeof(val8));
+        }
+        break;
+    }
+    case reg(CFG):
+    {
+        reg32_write(&s->regs, addr, value, mask);
+        break;
+    }
+    default:
+        reg32_write(&s->regs, addr, value, mask);
+        break;
+    }
+
+    flexcomm_usart_irq_update(s);
+
+out:
+    trace_flexcomm_usart_reg_write(DEVICE(s)->id, reg_names[addr], addr, value);
+    return ret;
+}
+
+static void flexcomm_usart_select(void *opaque, FlexcommState *s, int f,
+                                 bool set)
+{
+    if (set) {
+        qemu_chr_fe_set_handlers(&s->chr, flexcomm_usart_rx_space,
+                             flexcomm_usart_rx, NULL, NULL,
+                             s, NULL, true);
+        flexcomm_usart_reset(s);
+        fifo32_create(&s->rx_fifo, s->regs.usart.FIFOSIZE_b.FIFOSIZE);
+        fifo32_create(&s->tx_fifo, s->regs.usart.FIFOSIZE_b.FIFOSIZE);
+    } else {
+        qemu_chr_fe_set_handlers(&s->chr, NULL, NULL, NULL, NULL, NULL, NULL,
+                                 false);
+        fifo32_destroy(&s->rx_fifo);
+        fifo32_destroy(&s->tx_fifo);
+    }
+}
+
+static const FlexcommFunctionOps flexcomm_usart_ops = {
+    .select = flexcomm_usart_select,
+    .reg_read = flexcomm_usart_reg_read,
+    .reg_write = flexcomm_usart_reg_write,
+};
+
+void flexcomm_usart_init(FlexcommState *s)
+{
+}
+
+void flexcomm_usart_register(void)
+{
+    Error *err = NULL;
+
+    if (!flexcomm_register_ops(FLEXCOMM_FUNC_USART, NULL,
+                               &flexcomm_usart_ops, &err)) {
+        error_report_err(err);
+    }
+}
diff --git a/hw/char/meson.build b/hw/char/meson.build
index e5b13b6958..8f8c17ae66 100644
--- a/hw/char/meson.build
+++ b/hw/char/meson.build
@@ -39,3 +39,4 @@ system_ss.add(when: 'CONFIG_GOLDFISH_TTY', if_true: files('goldfish_tty.c'))
 specific_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('terminal3270.c'))
 specific_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-serial-bus.c'))
 specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('spapr_vty.c'))
+system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm_usart.c'))
diff --git a/hw/char/trace-events b/hw/char/trace-events
index 8875758076..19fcf1f832 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -125,3 +125,12 @@ xen_console_unrealize(unsigned int idx) "idx %u"
 xen_console_realize(unsigned int idx, const char *chrdev) "idx %u chrdev %s"
 xen_console_device_create(unsigned int idx) "idx %u"
 xen_console_device_destroy(unsigned int idx) "idx %u"
+
+# flexcomm_usart.c
+flexcomm_usart_reg_read(const char *id, const char *reg_name, uint32_t addr, uint32_t val) " %s: %s[0x%04x] -> 0x%08x"
+flexcomm_usart_reg_write(const char *id, const char *reg_name, uint32_t addr, uint32_t val) "%s: %s[0x%04x] <- 0x%08x"
+flexcomm_usart_rx_space(const char *id, uint32_t rx) "%s: %d"
+flexcomm_usart_rx(const char *id) "%s"
+flexcomm_usart_tx(const char *id) "%s"
+flexcomm_usart_fifostat(const char *id, uint32_t fifostat, uint32_t fifoinstat) "%s: %08x %08x"
+flexcomm_usart_irq(const char *id, bool irq, bool fifoirqs, bool perirqs, bool enabled) "%s: %d %d %d %d"
diff --git a/hw/misc/flexcomm.c b/hw/misc/flexcomm.c
index 6ec3773910..0c94928aa2 100644
--- a/hw/misc/flexcomm.c
+++ b/hw/misc/flexcomm.c
@@ -22,6 +22,7 @@
 #include "trace.h"
 #include "hw/regs.h"
 #include "hw/misc/flexcomm.h"
+#include "hw/char/flexcomm_usart.h"
 
 #define reg(field) offsetof(FLEXCOMM_Type, field)
 #define regi(x) (reg(x) / sizeof(uint32_t))
@@ -203,6 +204,7 @@ static const MemoryRegionOps flexcomm_ops = {
 static Property flexcomm_properties[] = {
     DEFINE_PROP_UINT32("functions", FlexcommState, functions,
                        FLEXCOMM_FULL),
+    DEFINE_PROP_CHR("chardev", FlexcommState, chr),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -221,6 +223,11 @@ static void flexcomm_init(Object *obj)
 
 static void flexcomm_realize(DeviceState *dev, Error **errp)
 {
+    FlexcommState *s = FLEXCOMM(dev);
+
+    if (has_function(s, FLEXCOMM_FUNC_USART)) {
+        flexcomm_usart_init(s);
+    }
 }
 
 static void flexcomm_class_init(ObjectClass *klass, void *data)
@@ -230,6 +237,8 @@ static void flexcomm_class_init(ObjectClass *klass, void *data)
     dc->reset = flexcomm_reset;
     device_class_set_props(dc, flexcomm_properties);
     dc->realize = flexcomm_realize;
+
+    flexcomm_usart_register();
 }
 
 static const TypeInfo flexcomm_info = {
diff --git a/include/hw/char/flexcomm_usart.h b/include/hw/char/flexcomm_usart.h
new file mode 100644
index 0000000000..07d14cb330
--- /dev/null
+++ b/include/hw/char/flexcomm_usart.h
@@ -0,0 +1,20 @@
+/*
+ * QEMU model for NXP's FLEXCOMM USART
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_CHAR_FLEXCOMM_USART_H
+#define HW_CHAR_FLEXCOMM_USART_H
+
+#include "hw/misc/flexcomm.h"
+
+void flexcomm_usart_init(FlexcommState *s);
+void flexcomm_usart_register(void);
+
+#endif /* HW_CHAR_RT500_FLEXCOMM_USART_H */
diff --git a/include/hw/misc/flexcomm.h b/include/hw/misc/flexcomm.h
index 422452bd96..db76e32c6d 100644
--- a/include/hw/misc/flexcomm.h
+++ b/include/hw/misc/flexcomm.h
@@ -13,7 +13,9 @@
 #define HW_FLEXCOMM_H
 
 #include "hw/sysbus.h"
+#include "chardev/char-fe.h"
 #include "hw/arm/svd/flexcomm.h"
+#include "hw/arm/svd/flexcomm_usart.h"
 #include "qemu/fifo32.h"
 
 #define TYPE_FLEXCOMM "flexcomm"
@@ -43,10 +45,14 @@ typedef struct {
     MemoryRegion mmio;
     union {
         FLEXCOMM_Type flex;
+        FLEXCOMM_USART_Type usart;
     } regs;
     uint32_t functions;
     qemu_irq irq;
     bool irq_state;
+    CharBackend chr;
+    Fifo32 tx_fifo;
+    Fifo32 rx_fifo;
 } FlexcommState;
 
 typedef struct {
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 4ccb15404d..70e816c034 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -143,10 +143,11 @@ if have_system
     'test-vmstate': [migration, io],
     'test-yank': ['socket-helpers.c', qom, io, chardev],
     'test-flexcomm': [
-      hwcore,
+      hwcore, chardev, qom, migration,
       meson.project_source_root() / 'hw/core/gpio.c',
       meson.project_source_root() / 'tests/unit/sysbus-mock.c',
       meson.project_source_root() / 'hw/misc/flexcomm.c',
+      meson.project_source_root() / 'hw/char/flexcomm_usart.c',
      ],
   }
   if config_host_data.get('CONFIG_INOTIFY1')
-- 
2.46.0.rc2.264.g509ed76dc8-goog
