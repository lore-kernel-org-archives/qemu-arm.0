Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986477njb;
        Mon, 5 Aug 2024 13:17:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxYVpd90v+w2HlDF3Cn3XGHCsY7iyaVIM9ULpPZcBARMvRA/P82frp7+ULiXONfMFdoWzymzJj+Fw18Q==@linaro.org
X-Received: by 2002:a17:903:184:b0:1fd:7b2c:9879 with SMTP id d9443c01a7336-1ff5742fc11mr161537615ad.51.1722889068295;
        Mon, 05 Aug 2024 13:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889068; cv=none;
        d=google.com; s=arc-20160816;
        b=hzsbdpl4T2sawJtEUZYFpKPHhoaFTB4Nmapg6mtTfCJxmp+ALMm+HGeRaPE7IhwARc
         g8CR1Zepx93yb9pzrjFumzKdGCSYh3z7IrR1m9MHbxzNCVMq0Ai9twN5+zkHHj9OGh1w
         CEGmR7eh3bZICih/U8GU8NXy4Vu2EKC/Yf/V0EItLG48RCHd8YYIO84yyhkrJgGel8dB
         ZQnKp4vWirNpujqKc+rD2pakeUZyNb7+Qy8nvsvJz+dgbGLIOHxOtARK210yEZjHx2uQ
         wPfNQaiE1Lcia69y4f9VTDRZQGfMrnGsXxofhWv1ZdZq0In8cOYIbDQK3Il6Afiss0RC
         uAZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=tlHjF4vRKeBL3TO5oBeur+r2v3G8z+HC6VUlJGVX4fk=;
        fh=TCheRQwYBGE9szgXBfejepgflyP3AiL2E+TWmZFqrC8=;
        b=aSPVAx0r6ZbYlX2kFW+3l6yjTcwTl19WDb7wNZO37GcNDfcbuCclEFlHQkNliFW1dk
         csRKVYRSxYHrdxfulyjFstSpdrnehw6kdJb+/O3diWKhQI0LtP+sTaaP4ya+TuDBZUoV
         fBMHgAqupuRSYT8ptO50AnicwIDN2ssQg2ICjNxAeyhGIDTUXZTp6i1KOhGVGfajPen+
         VsXRt2IIlbwDH09Kklco3DW9ma7z/usGG1gR+XWtwIYD1JP3ihl/TzPh6rKIRK8IuZBa
         fkG/YzMXk6QpSbXDPWjJ9Cqar1WKeWQYIq1vDd7tvbxsoRNvTKKSbs0/k1UVf25MFOUY
         nueQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Y1j1clYi;
       spf=pass (google.com: domain of 3azoxzgukc9ihyj6d4cc492.0cay92l.z2bb2296byfc.cf4@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3azOxZgUKC9IHyJ6D4CC492.0CAy92L.z2BB2296ByFC.CF4@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3azOxZgUKC9IHyJ6D4CC492.0CAy92L.z2BB2296ByFC.CF4@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id d9443c01a7336-1ff590700c3sor110468055ad.15.2024.08.05.13.17.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3azoxzgukc9ihyj6d4cc492.0cay92l.z2bb2296byfc.cf4@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Y1j1clYi;
       spf=pass (google.com: domain of 3azoxzgukc9ihyj6d4cc492.0cay92l.z2bb2296byfc.cf4@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3azOxZgUKC9IHyJ6D4CC492.0CAy92L.z2BB2296ByFC.CF4@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889068; x=1723493868; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tlHjF4vRKeBL3TO5oBeur+r2v3G8z+HC6VUlJGVX4fk=;
        b=Y1j1clYiwzgjT9TsXT5qEfh5ELmReWy5bxcQepLJ2KbYkcpKM7aOqHOUSXe57j0mGM
         L1a2BmMfuqOmDt3XnLSyaJnaKxRhZjs5tHU1xbE3ymE0cie/Uug6FhGFn+RmaKZJR+6r
         lblkfx/1rGaQBiqExASGaSV4YcQsDnce67GDTKzK624ZrBAyc2zHq2GAPnQUPoBeRf3t
         GQpvVcPNKwwDcdeM20bzXTrej8WvJm7gfTSP1FPHxKSSwqApGEy8UDMcKfWuK8QD0CzD
         jtsr0hMJRenHxMUK7+w1I/sEC6tA49fwpWi+b4+BOR/xareVvQyKJejmo8GMRFo6xkkH
         /gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889068; x=1723493868;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tlHjF4vRKeBL3TO5oBeur+r2v3G8z+HC6VUlJGVX4fk=;
        b=pj7DKrZOo9Wdo2SkDV4I8AlDAKFJTTJ+krs0sd+f6V0d+VURy//BALT3tuCZ0wPDnp
         OLaszxL3yovXBzFsmO+KIVqDb8DtsknWzEbJQHQTkfd1Xwa5lR6dZt0fuv/rO2WP+fET
         91SiR+yWlVk6J93L/snGkbx2nSBigh8QQ2u4F7qp6LF4zAolUgJkEf/+lwXXgG3xLxgF
         l6ZNPyVNwpuWlN+InNgty/lfftGdaVH8aPjWUcpqdpBGE7gRRH1FC+HQ8ym1HT78bj3C
         Ph0/wnJfniOJxb7BSYyX4jrDTz01ZlM1bBjPxhJRyd0s7vSWyudFn+J7SFHUjKT9vc17
         9RzA==
X-Forwarded-Encrypted: i=1; AJvYcCVb7i8XuXGuYgL9/MU17fT7zvoxUsV072bVG53ZqksNLnv50/7GIVrEfbB73NJqoRQmkwszTht7/uOgew==@linaro.org
X-Gm-Message-State: AOJu0Yx7wDOO8ocLmdkX5jZyKnjqzOVwz9vLDt5VaCUxPGTHBE9q+zCu
	yP3AngdqnRql3kcK9e7hQsfRLVabKNF8DMIfEQKYhHCvUPq4IHxq+6gdi81m8NphAIEa403ZqQ=
	=
X-Google-Smtp-Source: AGHT+IFPemp2sc6tjT2XKanRsS0vFFuKY6C/1QzGpCElqtmWwxiPKcpufHzMF5kfVgvwLX0f1fXpqgpNLw==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:902:dac4:b0:1fd:d6d8:134e with SMTP id
 d9443c01a7336-1ff573a358bmr8377605ad.8.1722889067793; Mon, 05 Aug 2024
 13:17:47 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:10 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-16-tavip@google.com>
Subject: [RFC PATCH 15/23] hw/ssi: add support for flexcomm spi
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: sGlDyAv3x350

From: Sebastian Ene <sebastianene@google.com>

From: Sebastian Ene <sebastianene@google.com>

Add support for NXP's flexcomm spi. It supports FIFO access,
interrupts and master mode only. It does not support DMA.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
Signed-off-by: Octavian Purdila <tavip@google.com>
---
 hw/arm/svd/meson.build        |   4 +
 hw/misc/flexcomm.c            |   6 +
 hw/ssi/flexcomm_spi.c         | 443 ++++++++++++++++++++++++++++++++++
 hw/ssi/meson.build            |   1 +
 hw/ssi/trace-events           |   8 +
 include/hw/misc/flexcomm.h    |   8 +
 include/hw/ssi/flexcomm_spi.h |  20 ++
 tests/unit/meson.build        |   7 +
 8 files changed, 497 insertions(+)
 create mode 100644 hw/ssi/flexcomm_spi.c
 create mode 100644 include/hw/ssi/flexcomm_spi.h

diff --git a/hw/arm/svd/meson.build b/hw/arm/svd/meson.build
index fa0d3da829..8b3b045137 100644
--- a/hw/arm/svd/meson.build
+++ b/hw/arm/svd/meson.build
@@ -10,3 +10,7 @@ genh += custom_target('flexcomm_i2c_regs.h',
                       output: 'flexcomm_i2c.h',
                       input: 'MIMXRT595S_cm33.xml',
                       command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'I2C0', '-t', 'FLEXCOMM_I2C'])
+genh += custom_target('flexcomm_spi.h',
+                      output: 'flexcomm_spi.h',
+                      input: 'MIMXRT595S_cm33.xml',
+                      command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'SPI0', '-t', 'FLEXCOMM_SPI'])
diff --git a/hw/misc/flexcomm.c b/hw/misc/flexcomm.c
index 2722c1d6a9..6f3ce62448 100644
--- a/hw/misc/flexcomm.c
+++ b/hw/misc/flexcomm.c
@@ -24,6 +24,7 @@
 #include "hw/misc/flexcomm.h"
 #include "hw/char/flexcomm_usart.h"
 #include "hw/i2c/flexcomm_i2c.h"
+#include "hw/ssi/flexcomm_spi.h"
 
 #define reg(field) offsetof(FLEXCOMM_Type, field)
 #define regi(x) (reg(x) / sizeof(uint32_t))
@@ -233,6 +234,10 @@ static void flexcomm_realize(DeviceState *dev, Error **errp)
     if (has_function(s, FLEXCOMM_FUNC_I2C)) {
         flexcomm_i2c_init(s);
     }
+
+    if (has_function(s, FLEXCOMM_FUNC_SPI)) {
+        flexcomm_spi_init(s);
+    }
 }
 
 static void flexcomm_class_init(ObjectClass *klass, void *data)
@@ -245,6 +250,7 @@ static void flexcomm_class_init(ObjectClass *klass, void *data)
 
     flexcomm_usart_register();
     flexcomm_i2c_register();
+    flexcomm_spi_register();
 }
 
 static const TypeInfo flexcomm_info = {
diff --git a/hw/ssi/flexcomm_spi.c b/hw/ssi/flexcomm_spi.c
new file mode 100644
index 0000000000..7b649ba17e
--- /dev/null
+++ b/hw/ssi/flexcomm_spi.c
@@ -0,0 +1,443 @@
+/*
+ * QEMU model for NXP's FLEXCOMM SPI
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
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "qemu/cutils.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "exec/address-spaces.h"
+#include "qapi/error.h"
+#include "trace.h"
+#include "hw/regs.h"
+#include "hw/ssi/flexcomm_spi.h"
+
+#define reg(field) offsetof(FLEXCOMM_SPI_Type, field)
+#define regi(x) (reg(x) / sizeof(uint32_t))
+#define REG_NO (sizeof(FLEXCOMM_SPI_Type) / sizeof(uint32_t))
+
+#define FLEXCOMM_SSEL_ASSERTED             (0)
+#define FLEXCOMM_SSEL_DEASSERTED           (1)
+
+#define FLEXCOMM_SPI_FIFOWR_LEN_MIN        (3)
+#define FLEXCOMM_SPI_FIFOWR_LEN_MAX        (15)
+
+static FLEXCOMM_SPI_REGISTER_NAMES_ARRAY(reg_names);
+
+static void flexcomm_spi_reset(FlexcommState *s)
+{
+    flexcomm_spi_reset_registers(&s->regs.spi);
+    s->regs.spi.FIFOSIZE_b.FIFOSIZE = 0x8;
+}
+
+static void update_fifo_stat(FlexcommState *s)
+{
+    int rxlvl = fifo32_num_used(&s->rx_fifo);
+    int txlvl = fifo32_num_used(&s->tx_fifo);
+
+    s->regs.spi.FIFOSTAT_b.RXLVL = fifo32_num_used(&s->rx_fifo);
+    s->regs.spi.FIFOSTAT_b.TXLVL = fifo32_num_used(&s->tx_fifo);
+    s->regs.spi.FIFOSTAT_b.RXFULL = fifo32_is_full(&s->rx_fifo) ? 1 : 0;
+    s->regs.spi.FIFOSTAT_b.RXNOTEMPTY = !fifo32_is_empty(&s->rx_fifo) ? 1 : 0;
+    s->regs.spi.FIFOSTAT_b.TXNOTFULL = !fifo32_is_full(&s->tx_fifo) ? 1 : 0;
+    s->regs.spi.FIFOSTAT_b.TXEMPTY = fifo32_is_empty(&s->tx_fifo) ? 1 : 0;
+
+    if (s->regs.spi.FIFOTRIG_b.RXLVLENA &&
+        (rxlvl > s->regs.spi.FIFOTRIG_b.RXLVL)) {
+        s->regs.spi.FIFOINTSTAT_b.RXLVL = 1;
+    } else {
+        s->regs.spi.FIFOINTSTAT_b.RXLVL = 0;
+    }
+
+    if (s->regs.spi.FIFOTRIG_b.TXLVLENA &&
+        (txlvl <= s->regs.spi.FIFOTRIG_b.TXLVL)) {
+        s->regs.spi.FIFOINTSTAT_b.TXLVL = 1;
+    } else {
+        s->regs.spi.FIFOINTSTAT_b.TXLVL = 0;
+    }
+
+    trace_flexcomm_spi_fifostat(DEVICE(s)->id, s->regs.spi.FIFOSTAT,
+                               s->regs.spi.FIFOINTSTAT);
+}
+
+static void flexcomm_spi_irq_update(FlexcommState *s)
+{
+    bool irq, per_irqs, fifo_irqs, enabled = s->regs.spi.CFG_b.ENABLE;
+
+    update_fifo_stat(s);
+    fifo_irqs = s->regs.spi.FIFOINTSTAT & s->regs.spi.FIFOINTENSET;
+
+    s->regs.spi.INTSTAT = s->regs.spi.STAT & s->regs.spi.INTENSET;
+    per_irqs = s->regs.spi.INTSTAT != 0;
+
+    irq = enabled && (fifo_irqs || per_irqs);
+
+    trace_flexcomm_spi_irq(DEVICE(s)->id, irq, fifo_irqs, per_irqs, enabled);
+    flexcomm_irq(s, irq);
+}
+
+static void flexcomm_spi_select(void *opaque, FlexcommState *s, int f,
+                               bool set)
+{
+    if (set) {
+        int i;
+
+        flexcomm_spi_reset(s);
+        fifo32_create(&s->rx_fifo, s->regs.spi.FIFOSIZE_b.FIFOSIZE);
+        fifo32_create(&s->tx_fifo, s->regs.spi.FIFOSIZE_b.FIFOSIZE);
+        for (i = 0; i < ARRAY_SIZE(s->cs); i++) {
+            bool spol = s->regs.spi.CFG & (FLEXCOMM_SPI_CFG_SPOL0_Msk << i);
+
+            s->cs_asserted[i] = false;
+            qemu_set_irq(s->cs[i], !spol);
+        }
+    } else {
+        fifo32_destroy(&s->rx_fifo);
+        fifo32_destroy(&s->tx_fifo);
+    }
+}
+
+static MemTxResult flexcomm_spi_reg_read(void *opaque, FlexcommState *s,
+                                        int f, hwaddr addr, uint64_t *data,
+                                        unsigned size)
+{
+    MemTxResult ret = MEMTX_OK;
+
+    /*
+     * Allow 8/16 bits access to the FIFORD LSB half-word. This is supported by
+     * hardware and required for 1/2 byte(s) width DMA transfers.
+     */
+    if (!reg32_aligned_access(addr, size) && addr != reg(FIFORD)) {
+        ret = MEMTX_ERROR;
+        goto out;
+    }
+
+    switch (addr) {
+    case reg(FIFORD):
+    {
+        /* If we are running in loopback mode get the data from TX FIFO */
+        if (s->regs.spi.CFG_b.LOOP &&
+            s->regs.spi.CFG_b.MASTER)
+        {
+            if (!fifo32_is_empty(&s->tx_fifo)) {
+                *data = fifo32_pop(&s->tx_fifo);
+            }
+            break;
+        }
+
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
+    flexcomm_spi_irq_update(s);
+
+out:
+    trace_flexcomm_spi_reg_read(DEVICE(s)->id, reg_names[addr], addr, *data);
+    return ret;
+}
+
+static uint32_t fifowr_len_bits(uint32_t val)
+{
+    int len = (val & FLEXCOMM_SPI_FIFOWR_LEN_Msk) >>
+        FLEXCOMM_SPI_FIFOWR_LEN_Pos;
+
+    if (len < FLEXCOMM_SPI_FIFOWR_LEN_MIN ||
+        len > FLEXCOMM_SPI_FIFOWR_LEN_MAX) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid spi xfer len %d\n",
+                      __func__, val);
+        return 0;
+    }
+
+    return len + 1;
+}
+
+static inline uint32_t fifowr_len_mask(uint32_t val)
+{
+    return (1 << fifowr_len_bits(val)) - 1;
+}
+
+static inline uint32_t fifowr_len_bytes(uint32_t val)
+{
+    return fifowr_len_bits(val) > 8 ? 2 : 1;
+}
+
+static uint32_t flexcomm_spi_xfer_word(FlexcommState *s,
+                                      uint32_t out_data,
+                                      int bytes,
+                                      bool be)
+{
+    uint32_t word = 0;
+    int i;
+    int out = 0;
+
+    for (i = 0; i < bytes; i++) {
+        if (be) {
+            int byte_offset = bytes - i - 1;
+            out = (out_data & (0xFF << byte_offset * 8)) >> byte_offset * 8;
+            word |= ssi_transfer(s->spi, out) << byte_offset * 8;
+        } else {
+            out = (out_data & (0xFF << i * 8)) >> i * 8;
+            word |= ssi_transfer(s->spi, out) << i * 8;
+        }
+    }
+
+    return word;
+}
+
+static uint32_t flexcomm_spi_get_ss_mask(FlexcommState *s,
+                                        uint32_t txfifo_val)
+{
+    uint32_t slave_select_mask = 0;
+    for (int i = 0; i < ARRAY_SIZE(s->cs); i++) {
+        int tx_ss_pos = FLEXCOMM_SPI_FIFOWR_TXSSEL0_N_Pos + i;
+        uint32_t state = (txfifo_val & (1 << tx_ss_pos)) >> tx_ss_pos;
+        bool spol = s->regs.spi.CFG & (FLEXCOMM_SPI_CFG_SPOL0_Msk << i);
+        int irq_level = state ? spol : !spol;
+
+        slave_select_mask |= (state << i);
+        s->cs_asserted[i] = state;
+        qemu_set_irq(s->cs[i], irq_level);
+    }
+
+    return slave_select_mask;
+}
+
+static MemTxResult flexcomm_spi_reg_write(void *opaque, FlexcommState *s,
+                                         int f, hwaddr addr, uint64_t value,
+                                         unsigned size)
+{
+    MemTxResult ret = MEMTX_OK;
+    static uint32_t mask[REG_NO] = {
+        [regi(CFG)] = BITS(11, 7) | BITS(5, 2) | BIT(0),
+        [regi(DLY)] = BITS(15, 0),
+        [regi(STAT)] = BIT(7) | BIT(5) | BIT(4),
+        [regi(INTENSET)] = BIT(8) | BITS(5, 4),
+        [regi(INTENCLR)] = BIT(8) | BITS(5, 4),
+        [regi(DIV)] = BITS(15, 0),
+        [regi(FIFOCFG)] = BITS(18, 12) | BITS(1, 0),
+        [regi(FIFOSTAT)] = BITS(1, 0),
+        [regi(FIFOTRIG)] = BITS(19, 16) | BITS(11, 8) | BITS(1, 0),
+        [regi(FIFOINTENSET)] = BITS(3, 0),
+        [regi(FIFOINTENCLR)] = BITS(3, 0),
+        [regi(FIFOWR)] = BITS(27, 0),
+    };
+
+    /*
+     * Allow 8/16 bits access to both the FIFOWR MSB and LSB half-words. The
+     * former is required for updating the control bits while the latter for DMA
+     * transfers of 1/2 byte(s) width.
+     */
+    if (!reg32_aligned_access(addr, size) && (addr / 4 * 4 != reg(FIFOWR))) {
+        ret = MEMTX_ERROR;
+        goto out;
+    }
+
+    switch (addr) {
+    case reg(CFG):
+    {
+        reg32_write(&s->regs, addr, value, mask);
+
+        if (s->regs.spi.CFG_b.ENABLE) {
+            qemu_chr_fe_accept_input(&s->chr);
+        }
+
+        break;
+    }
+    case reg(INTENCLR):
+    {
+        reg32_write(&s->regs, addr, value, mask);
+        s->regs.spi.INTENSET &= ~s->regs.spi.INTENCLR;
+        break;
+    }
+    case reg(FIFOCFG):
+    {
+        reg32_write(&s->regs, addr, value, mask);
+        if (s->regs.spi.FIFOCFG_b.EMPTYRX) {
+            s->regs.spi.FIFOCFG_b.EMPTYRX = 0;
+            fifo32_reset(&s->rx_fifo);
+        }
+        if (s->regs.spi.FIFOCFG_b.EMPTYTX) {
+            s->regs.spi.FIFOCFG_b.EMPTYTX = 0;
+            fifo32_reset(&s->tx_fifo);
+        }
+        if (s->regs.spi.FIFOCFG_b.ENABLERX) {
+            qemu_chr_fe_accept_input(&s->chr);
+        }
+        break;
+    }
+    case reg(FIFOSTAT):
+    {
+        bool rxerr = s->regs.spi.FIFOSTAT_b.RXERR;
+        bool txerr = s->regs.spi.FIFOSTAT_b.TXERR;
+
+        reg32_write(&s->regs, addr, value, mask);
+
+        if (rxerr && s->regs.spi.FIFOSTAT_b.RXERR) {
+            rxerr = false;
+        }
+        if (txerr && s->regs.spi.FIFOSTAT_b.TXERR) {
+            txerr = false;
+        }
+
+        s->regs.spi.FIFOSTAT_b.RXERR = rxerr;
+        s->regs.spi.FIFOSTAT_b.TXERR = txerr;
+        break;
+    }
+    case reg(FIFOINTENSET):
+    {
+        s->regs.spi.FIFOINTENSET |= value & mask[addr / 4];
+        break;
+    }
+    case reg(FIFOINTENCLR):
+    {
+        reg32_write(&s->regs, addr, value, mask);
+        s->regs.spi.FIFOINTENSET &= ~s->regs.spi.FIFOINTENCLR;
+        break;
+    }
+    /* update control bits but don't push into the FIFO */
+    case reg(FIFOWR) + 2:
+    {
+        if (size > 2) {
+            ret = MEMTX_ERROR;
+            break;
+        }
+        if (value != 0) {
+            s->spi_tx_ctrl = value << 16;
+        }
+        break;
+    }
+    /* update control bits but don't push into the FIFO */
+    case reg(FIFOWR) + 3:
+    {
+        if (size > 1) {
+            ret = MEMTX_ERROR;
+            break;
+        }
+        if (value != 0) {
+            s->spi_tx_ctrl = value << 24;
+        }
+        break;
+    }
+    case reg(FIFOWR):
+    {
+        /* fifo value contains both data and control bits */
+        uint32_t txfifo_val;
+
+        if (size > 2 && (value & ~FLEXCOMM_SPI_FIFOWR_TXDATA_Msk) != 0) {
+            /* non-zero writes to control bits updates them */
+            s->spi_tx_ctrl = value & ~FLEXCOMM_SPI_FIFOWR_TXDATA_Msk;
+            txfifo_val = value;
+        } else {
+            /* otherwise reuse previous control bits */
+            txfifo_val = value | s->spi_tx_ctrl;
+        }
+
+        if (!fifo32_is_full(&s->tx_fifo)) {
+            fifo32_push(&s->tx_fifo, txfifo_val);
+        }
+
+        if (!s->regs.spi.CFG_b.ENABLE || !s->regs.spi.FIFOCFG_b.ENABLETX) {
+            break;
+        }
+
+        /*
+         * On loopback mode we just insert the values in the TX FIFO. On slave
+         * mode master needs to initiate the SPI transfer.
+         */
+        if (s->regs.spi.CFG_b.LOOP || !s->regs.spi.CFG_b.MASTER) {
+            break;
+        }
+
+        while (!fifo32_is_empty(&s->tx_fifo)) {
+            txfifo_val = fifo32_pop(&s->tx_fifo);
+
+            uint32_t ss_mask = flexcomm_spi_get_ss_mask(s, txfifo_val);
+            uint32_t data = txfifo_val & fifowr_len_mask(txfifo_val);
+            uint8_t bytes = fifowr_len_bytes(txfifo_val);
+            bool msb = !s->regs.spi.CFG_b.LSBF;
+            uint32_t val32;
+
+            val32 = flexcomm_spi_xfer_word(s, data, bytes, msb);
+
+            if (!fifo32_is_full(&s->rx_fifo)) {
+                /* Append the mask that informs which client is active */
+                val32 |= (ss_mask << FLEXCOMM_SPI_FIFORD_RXSSEL0_N_Pos);
+                fifo32_push(&s->rx_fifo, val32);
+            }
+
+            /* If this is the end of the transfer raise the CS line */
+            if (txfifo_val & FLEXCOMM_SPI_FIFOWR_EOT_Msk) {
+                bool spol[ARRAY_SIZE(s->cs)] = {
+                    s->regs.spi.CFG_b.SPOL0,
+                    s->regs.spi.CFG_b.SPOL1,
+                    s->regs.spi.CFG_b.SPOL2,
+                    s->regs.spi.CFG_b.SPOL3,
+                };
+
+                for (int i = 0; i < ARRAY_SIZE(s->cs); i++) {
+                    if (s->cs_asserted[i]) {
+                        s->cs_asserted[i] = false;
+                        qemu_set_irq(s->cs[i], !spol[i]);
+                    }
+                }
+            }
+        }
+        break;
+    }
+    default:
+        reg32_write(&s->regs, addr, value, mask);
+        break;
+    }
+
+    flexcomm_spi_irq_update(s);
+
+out:
+    trace_flexcomm_spi_reg_write(DEVICE(s)->id, reg_names[addr], addr, value);
+    return ret;
+}
+
+static const FlexcommFunctionOps flexcomm_spi_ops = {
+    .select = flexcomm_spi_select,
+    .reg_read = flexcomm_spi_reg_read,
+    .reg_write = flexcomm_spi_reg_write,
+};
+
+void flexcomm_spi_init(FlexcommState *s)
+{
+    s->spi = ssi_create_bus(DEVICE(s), "spi");
+    qdev_init_gpio_out_named(DEVICE(s), &s->cs[0], "cs", ARRAY_SIZE(s->cs));
+}
+
+/* Register the SPI operations with the flexcomm upper layer */
+void flexcomm_spi_register(void)
+{
+    Error *err = NULL;
+
+    if (!flexcomm_register_ops(FLEXCOMM_FUNC_SPI, NULL,
+                               &flexcomm_spi_ops, &err)) {
+        error_report_err(err);
+    }
+}
diff --git a/hw/ssi/meson.build b/hw/ssi/meson.build
index b999aeb027..57d3e14727 100644
--- a/hw/ssi/meson.build
+++ b/hw/ssi/meson.build
@@ -12,3 +12,4 @@ system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_spi.c'))
 system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_spi.c'))
 system_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_spi_host.c'))
 system_ss.add(when: 'CONFIG_BCM2835_SPI', if_true: files('bcm2835_spi.c'))
+system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm_spi.c'))
diff --git a/hw/ssi/trace-events b/hw/ssi/trace-events
index 2d5bd2b83d..5caa1c17ac 100644
--- a/hw/ssi/trace-events
+++ b/hw/ssi/trace-events
@@ -32,3 +32,11 @@ ibex_spi_host_reset(const char *msg) "%s"
 ibex_spi_host_transfer(uint32_t tx_data, uint32_t rx_data) "tx_data: 0x%" PRIx32 " rx_data: @0x%" PRIx32
 ibex_spi_host_write(uint64_t addr, uint32_t size, uint64_t data) "@0x%" PRIx64 " size %u: 0x%" PRIx64
 ibex_spi_host_read(uint64_t addr, uint32_t size) "@0x%" PRIx64 " size %u:"
+
+# flexcomm_spi.c
+flexcomm_spi_reg_read(const char *id, const char *reg_name, uint32_t addr, uint32_t val) " %s: %s[0x%04x] -> 0x%08x"
+flexcomm_spi_reg_write(const char *id, const char *reg_name, uint32_t addr, uint32_t val) "%s: %s[0x%04x] <- 0x%08x"
+flexcomm_spi_fifostat(const char *id, uint32_t fifostat, uint32_t fifoinstat) "%s: %08x %08x"
+flexcomm_spi_irq(const char *id, bool irq, bool fifoirqs, bool perirqs, bool enabled) "%s: %d %d %d %d"
+flexcomm_spi_chr_rx_space(const char *id, uint32_t rx) "%s: %d"
+flexcomm_spi_chr_rx(const char *id) "%s"
diff --git a/include/hw/misc/flexcomm.h b/include/hw/misc/flexcomm.h
index 3d042a3511..62f327925d 100644
--- a/include/hw/misc/flexcomm.h
+++ b/include/hw/misc/flexcomm.h
@@ -15,9 +15,12 @@
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
 #include "hw/i2c/i2c.h"
+#include "hw/ssi/ssi.h"
 #include "hw/arm/svd/flexcomm.h"
 #include "hw/arm/svd/flexcomm_usart.h"
 #include "hw/arm/svd/flexcomm_i2c.h"
+#undef EOF
+#include "hw/arm/svd/flexcomm_spi.h"
 #include "qemu/fifo32.h"
 
 #define TYPE_FLEXCOMM "flexcomm"
@@ -49,6 +52,7 @@ typedef struct {
         FLEXCOMM_Type flex;
         FLEXCOMM_USART_Type usart;
         FLEXCOMM_I2C_Type i2c;
+        FLEXCOMM_SPI_Type spi;
     } regs;
     uint32_t functions;
     qemu_irq irq;
@@ -57,6 +61,10 @@ typedef struct {
     Fifo32 tx_fifo;
     Fifo32 rx_fifo;
     I2CBus *i2c;
+    SSIBus *spi;
+    qemu_irq cs[4];
+    bool cs_asserted[4];
+    uint32_t spi_tx_ctrl;
 } FlexcommState;
 
 typedef struct {
diff --git a/include/hw/ssi/flexcomm_spi.h b/include/hw/ssi/flexcomm_spi.h
new file mode 100644
index 0000000000..d5567aa1e6
--- /dev/null
+++ b/include/hw/ssi/flexcomm_spi.h
@@ -0,0 +1,20 @@
+/*
+ * QEMU model for NXP's FLEXCOMM SPI
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_CHAR_FLEXCOMM_SPI_H
+#define HW_CHAR_FLEXCOMM_SPI_H
+
+#include "hw/misc/flexcomm.h"
+
+void flexcomm_spi_init(FlexcommState *s);
+void flexcomm_spi_register(void);
+
+#endif /* HW_CHAR_FLEXCOMM_SPI_H */
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 3491e2003b..1ddd174576 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -150,6 +150,8 @@ if have_system
       meson.project_source_root() / 'hw/char/flexcomm_usart.c',
       meson.project_source_root() / 'hw/i2c/flexcomm_i2c.c',
       meson.project_source_root() / 'hw/i2c/core.c',
+      meson.project_source_root() / 'hw/ssi/flexcomm_spi.c',
+      meson.project_source_root() / 'hw/ssi/ssi.c',
      ],
     'test-flexcomm-usart': [
       hwcore, chardev, qom, migration,
@@ -159,6 +161,8 @@ if have_system
       meson.project_source_root() / 'hw/char/flexcomm_usart.c',
       meson.project_source_root() / 'hw/i2c/flexcomm_i2c.c',
       meson.project_source_root() / 'hw/i2c/core.c',
+      meson.project_source_root() / 'hw/ssi/flexcomm_spi.c',
+      meson.project_source_root() / 'hw/ssi/ssi.c',
     ],
     'test-flexcomm-i2c': [
       hwcore, chardev, qom, migration,
@@ -169,6 +173,9 @@ if have_system
       meson.project_source_root() / 'hw/i2c/flexcomm_i2c.c',
       meson.project_source_root() / 'hw/i2c/core.c',
       'i2c_tester.c',
+      meson.project_source_root() / 'hw/ssi/flexcomm_spi.c',
+      meson.project_source_root() / 'hw/ssi/ssi.c',
+    ],
     ],
   }
   if config_host_data.get('CONFIG_INOTIFY1')
-- 
2.46.0.rc2.264.g509ed76dc8-goog
