Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986450njb;
        Mon, 5 Aug 2024 13:17:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVRuxq8i/XmZ9jP9b+BYWBLZExzCcxrUqWo+9lsca2f6Nv82mLxHQWAPv+S+L+GYhmo65wQW3x9vnAy5H2R7vPx9tzy5IUs
X-Received: by 2002:a17:90a:ca15:b0:2cf:28c1:4cc2 with SMTP id 98e67ed59e1d1-2cff93c6196mr15428688a91.3.1722889062721;
        Mon, 05 Aug 2024 13:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889062; cv=none;
        d=google.com; s=arc-20160816;
        b=otQSUv7JEbuMNz317UWemA92LG1IeS1t6urtZUDE8IPwceztpgXz6f21K1WqF9Qu0c
         BDr35GMr9xLbGv5zqdPqtHph/VEV15iNndkN9OXBvJi40j6adQ89lmSzorqibSyEPZ6X
         /DEXblm4yTto8x6W31BINRzJjCh3nPfgxZBlW0esGFIsqGv/CHHXaHQfK2GzQ3w4LRgP
         NcwaIza0wRt7uxPOqmMDBoBdXzZS8h37BPGHSOZUy8bQz7/w0/OWNBZERTPdn4XCg+fy
         WkWv/hoQaqGG6B0XJhGKQhO4UbE4wkBMFQ8uEOBRFABLhhsC/eTf3sJ4l5OeTwWtxUv2
         RM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=JJx2zYTysuPPGq4jl/CUtBvGg4dYG4R93ytcuWg1fhs=;
        fh=5IB5qhPhXEne0JZY95es6WPAJCmzMEe/NwCNauS7uCc=;
        b=scdJnVNHxNL8ASZJD+FWsAvmhJbFkQu5ZGwuET6E8fXt9Ttv2m/hd2UhYPKQxSUXiu
         MUIqicYbCEYIOFJ7ye2qnJi4OSxFVaWcqFJb+yJ5/oezIITpLSESWNYXC6TrZA+vHKp0
         +Vmd8WIQrp9+MYnbrQhdsS63j7hSfn6KvkTnCyadqKNdI1FG06SXVU+FCU6Nyk3iKuXZ
         5C+Vj5HEakKpTvQqH/m3TMlyTsKXqk473ebmNcL78pQnIkDWHYKwKhcDrDHsxmi1Jhvo
         yiaIymM2a33ml6Ux84vEiuh4+ykDSfC+i1XdEXNHZp0kLmfkzh23tawrQM5K9ZmdjnaW
         XDyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=lQPWCqUZ;
       spf=pass (google.com: domain of 3ztoxzgukc8wbsd07y66y3w.u64s3wf.tw55ww305s96.69y@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ZTOxZgUKC8wBsD07y66y3w.u64s3wF.tw55ww305s96.69y@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3ZTOxZgUKC8wBsD07y66y3w.u64s3wF.tw55ww305s96.69y@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2cffbcb9dd1sor6621526a91.6.2024.08.05.13.17.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ztoxzgukc8wbsd07y66y3w.u64s3wf.tw55ww305s96.69y@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=lQPWCqUZ;
       spf=pass (google.com: domain of 3ztoxzgukc8wbsd07y66y3w.u64s3wf.tw55ww305s96.69y@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ZTOxZgUKC8wBsD07y66y3w.u64s3wF.tw55ww305s96.69y@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889062; x=1723493862; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JJx2zYTysuPPGq4jl/CUtBvGg4dYG4R93ytcuWg1fhs=;
        b=lQPWCqUZc9E8cWQ4CuUiAho741wFuzrAwc3uIEJ09hxbEZz9dKEUEgOzR9Ywp5etLM
         sZc0sIvzn+yHrb9eFijG9yPz5TkApFKEkc/OcqEKFu2rJSt00/Uwusmw2c5omkaASmoE
         ZO9H62WsmPilmCjDMV2uayacDWTlt4NA/YIb4DtAoEQ+WF+X+9oUzlFtfvm7TZknFies
         7IMEnNrxPlAbn6RP+7kwnpPBZF6Bjb814o5sFFW7br7lOEpE6AemRyKuv53zzsvxg8g0
         hY1WdW1IbKUGXKYX1C57ZXX2CXZKcjTVkbqbTGLxMm5v7iLWIrmpclAGBbKURKh06SYV
         ZXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889062; x=1723493862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JJx2zYTysuPPGq4jl/CUtBvGg4dYG4R93ytcuWg1fhs=;
        b=H3HxO+unFa7PzZjv2j4pmncYU/+TLmfi7ZkXu0pyCK/ZU/kFbUZZABR5H3s+JbvVBh
         soxyKLi6fFGsnk5vxHfE+OwYJNS3E40/FXhFrm7MLShvOgdXp0RnOrg7+ZzkuZljdF/R
         oRT1sRFBRRrLWX8PWXkfdZw5EHYNIB9lWsRgCqXcxLjnkedh20k5sVXENz9187uxK/w6
         y61Ms+JZIvDcPZxvYerkN479D1TmWLdbEf5iLvBaRXkMb0EC9cPEu2bYla5MqKCpBwOl
         J8qaDwhEjJkzqKdvlbBYhWYO6Pmlo00szlNM0gMe1Z8+fvkei/mTg6YwY3nf7kiGFxG+
         IDRw==
X-Forwarded-Encrypted: i=1; AJvYcCUcS6IDzgduH83Mxrg7JoHk2M9ehryJDwciFUlOrxR2zFLVAPNSINkMr1SlRb+IOvyqxX9j29FF+xaKTNfhRLnsAfLjNser
X-Gm-Message-State: AOJu0Yzk81SFtuOhz15EFtv4u6Ardn6P9711U7Muf3C62hMkK5IP95wB
	iAqVbksYH7fo9h5IKVZGul2Px6kDWir8c9aoUj8sGEh+klwvci8Q2maZdvrSFLGF/8O+I4jD6w=
	=
X-Google-Smtp-Source: AGHT+IFJ6HmLYx+llIq607FEkRA2hqMCqRAGPVf+vAAKgX7jthaVgxS/Ia/9f+16jdToHqdzT0ceAn1c4g==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:90b:3e8c:b0:2c9:9208:ee66 with SMTP id
 98e67ed59e1d1-2cff956d6f7mr34756a91.7.1722889061818; Mon, 05 Aug 2024
 13:17:41 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:07 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-13-tavip@google.com>
Subject: [RFC PATCH 12/23] hw/i2c: add support for flexcomm i2c
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: mGp0LgojUPkH

Add support for NXP's flexcomm i2c. It does not support slave mode or
DMA.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 hw/arm/svd/meson.build        |   4 +
 hw/i2c/flexcomm_i2c.c         | 224 ++++++++++++++++++++++++++++++++++
 hw/i2c/meson.build            |   1 +
 hw/i2c/trace-events           |  10 ++
 hw/misc/flexcomm.c            |   6 +
 include/hw/i2c/flexcomm_i2c.h |  27 ++++
 include/hw/misc/flexcomm.h    |   4 +
 tests/unit/meson.build        |   4 +
 8 files changed, 280 insertions(+)
 create mode 100644 hw/i2c/flexcomm_i2c.c
 create mode 100644 include/hw/i2c/flexcomm_i2c.h

diff --git a/hw/arm/svd/meson.build b/hw/arm/svd/meson.build
index ed0f69f437..fa0d3da829 100644
--- a/hw/arm/svd/meson.build
+++ b/hw/arm/svd/meson.build
@@ -6,3 +6,7 @@ genh += custom_target('flexcomm_usart.h',
                       output: 'flexcomm_usart.h',
                       input: 'MIMXRT595S_cm33.xml',
                       command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'USART0', '-t', 'FLEXCOMM_USART'])
+genh += custom_target('flexcomm_i2c_regs.h',
+                      output: 'flexcomm_i2c.h',
+                      input: 'MIMXRT595S_cm33.xml',
+                      command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'I2C0', '-t', 'FLEXCOMM_I2C'])
diff --git a/hw/i2c/flexcomm_i2c.c b/hw/i2c/flexcomm_i2c.c
new file mode 100644
index 0000000000..7e74f858ce
--- /dev/null
+++ b/hw/i2c/flexcomm_i2c.c
@@ -0,0 +1,224 @@
+/*
+ * QEMU model for NXP's FLEXCOMM I2C
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
+#include "hw/i2c/flexcomm_i2c.h"
+
+#define reg(field) offsetof(FLEXCOMM_I2C_Type, field)
+#define regi(x) (reg(x) / sizeof(uint32_t))
+#define REG_NO (sizeof(FLEXCOMM_I2C_Type) / sizeof(uint32_t))
+
+static FLEXCOMM_I2C_REGISTER_NAMES_ARRAY(reg_names);
+
+static void flexcomm_i2c_reset(FlexcommState *s)
+{
+    flexcomm_i2c_reset_registers(&s->regs.i2c);
+}
+
+static void flexcomm_i2c_irq_update(FlexcommState *s)
+{
+    bool enabled = s->regs.i2c.CFG_b.MSTEN;
+    bool irq, per_irqs;
+
+    s->regs.i2c.INTSTAT = s->regs.i2c.STAT & s->regs.i2c.INTENSET;
+    per_irqs = s->regs.i2c.INTSTAT != 0;
+
+    irq = enabled && per_irqs;
+
+    trace_flexcomm_i2c_irq(DEVICE(s)->id, irq, per_irqs, enabled);
+    flexcomm_irq(s, irq);
+}
+
+static MemTxResult flexcomm_i2c_reg_read(void *opaque, FlexcommState *s,
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
+    *data = reg32_read(&s->regs, addr);
+
+    flexcomm_i2c_irq_update(s);
+
+out:
+    trace_flexcomm_i2c_reg_read(DEVICE(s)->id, reg_names[addr], addr, *data);
+    return ret;
+}
+
+static MemTxResult flexcomm_i2c_reg_write(void *opaque, FlexcommState *s,
+                                           int f, hwaddr addr, uint64_t value,
+                                           unsigned size)
+{
+    MemTxResult ret = MEMTX_OK;
+    static uint32_t mask[REG_NO] = {
+        [regi(CFG)] = BITS(5, 0),
+        [regi(STAT)] = BITS(25, 24) | BIT(19) | BIT(17) | BIT(15) | BIT(6),
+        [regi(INTENSET)] = BITS(25, 24) | BIT(19) | BITS(17, 15) | BIT(11) |
+                           BIT(8) |  BIT(6) | BIT(4) | BIT(0),
+        [regi(INTENCLR)] = BITS(25, 24) | BIT(19) | BITS(17, 15) | BIT(11) |
+                           BIT(8) |  BIT(6) | BIT(4) | BIT(0),
+        [regi(TIMEOUT)] = BITS(15, 0),
+        [regi(CLKDIV)] = BITS(15, 0),
+        [regi(MSTCTL)] = BITS(3, 0),
+        [regi(MSTTIME)] = BITS(6, 4) | BITS(2, 0),
+        [regi(MSTDAT)] = BITS(7, 0),
+        [regi(SLVCTL)] = BITS(9, 8) | BIT(3) | BITS(1, 0),
+        [regi(SLVDAT)] = BITS(7, 0),
+        [regi(SLVADR0)] = BIT(15) | BITS(7, 0),
+        [regi(SLVADR1)] = BIT(15) | BITS(7, 0),
+        [regi(SLVADR2)] = BIT(15) | BITS(7, 0),
+        [regi(SLVADR3)] = BIT(15) | BITS(7, 0),
+        [regi(SLVQUAL0)] = BITS(7, 0),
+    };
+
+    if (!reg32_aligned_access(addr, size)) {
+        ret = MEMTX_ERROR;
+        goto out;
+    }
+
+    switch (addr) {
+    case reg(CFG):
+    {
+        reg32_write(&s->regs, addr, value, mask);
+        if (s->regs.i2c.CFG_b.SLVEN) {
+            qemu_log_mask(LOG_GUEST_ERROR, "I2C slave not supported");
+        }
+        if (s->regs.i2c.CFG_b.MONEN) {
+            qemu_log_mask(LOG_GUEST_ERROR, "I2C monitoring not supported");
+        }
+        break;
+    }
+    case reg(INTENCLR):
+    {
+        s->regs.i2c.INTENSET &= ~(value & mask[addr / 4]);
+        break;
+    }
+    case reg(TIMEOUT):
+    {
+        reg32_write(&s->regs, addr, value, mask);
+        /* The bottom 4 bits are hard-wired to 0xF */
+        s->regs.i2c.TIMEOUT_b.TOMIN = 0xf;
+        break;
+    }
+    case reg(MSTCTL):
+    {
+        reg32_write(&s->regs, addr, value, mask);
+        if (s->regs.i2c.MSTCTL_b.MSTSTART) {
+            uint8_t i2c_addr = s->regs.i2c.MSTDAT_b.DATA;
+            bool recv = i2c_addr & 1;
+
+            trace_flexcomm_i2c_start(DEVICE(s)->id, i2c_addr, recv);
+            if (i2c_start_transfer(s->i2c, i2c_addr, recv)) {
+                s->regs.i2c.STAT_b.MSTSTATE = MSTSTATE_NAKADR;
+                trace_flexcomm_i2c_nak(DEVICE(s)->id);
+            } else {
+                if (recv) {
+                    uint8_t data = i2c_recv(s->i2c);
+
+                    s->regs.i2c.MSTDAT_b.DATA = data;
+                    trace_flexcomm_i2c_rx(DEVICE(s)->id, data);
+                    s->regs.i2c.STAT_b.MSTSTATE = MSTSTATE_RXRDY;
+                } else {
+                    s->regs.i2c.STAT_b.MSTSTATE = MSTSTATE_TXRDY;
+                }
+            }
+        }
+        if (s->regs.i2c.MSTCTL_b.MSTSTOP) {
+            s->regs.i2c.STAT_b.MSTSTATE = MSTSTATE_IDLE;
+            i2c_end_transfer(s->i2c);
+        }
+        if (s->regs.i2c.MSTCTL_b.MSTCONTINUE) {
+            if (s->regs.i2c.STAT_b.MSTSTATE == MSTSTATE_TXRDY) {
+                uint8_t data = s->regs.i2c.MSTDAT_b.DATA;
+
+                trace_flexcomm_i2c_tx(DEVICE(s)->id, data);
+                if (i2c_send(s->i2c, data)) {
+                    s->regs.i2c.STAT_b.MSTSTATE = MSTSTATE_NAKDAT;
+                }
+            } else if (s->regs.i2c.STAT_b.MSTSTATE == MSTSTATE_RXRDY) {
+                uint8_t data = i2c_recv(s->i2c);
+
+                s->regs.i2c.MSTDAT_b.DATA = data;
+                trace_flexcomm_i2c_rx(DEVICE(s)->id, data);
+            }
+        }
+        break;
+    }
+    case reg(STAT):
+    {
+        /* write 1 to clear bits */
+        s->regs.i2c.STAT &= ~(value & mask[addr / 4]);
+        break;
+    }
+    case reg(SLVCTL):
+    case reg(SLVDAT):
+    case reg(SLVADR0):
+    case reg(SLVADR1):
+    case reg(SLVADR2):
+    case reg(SLVADR3):
+    case reg(SLVQUAL0):
+    {
+        qemu_log_mask(LOG_GUEST_ERROR, "I2C slave not supported\n");
+        break;
+    }
+    default:
+        reg32_write(&s->regs, addr, value, mask);
+        break;
+    }
+
+    flexcomm_i2c_irq_update(s);
+
+out:
+    trace_flexcomm_i2c_reg_write(DEVICE(s)->id, reg_names[addr], addr, value);
+    return ret;
+}
+
+static void flexcomm_i2c_select(void *opaque, FlexcommState *s, int f,
+                                 bool set)
+{
+    if (set) {
+        flexcomm_i2c_reset(s);
+    }
+}
+
+static const FlexcommFunctionOps flexcomm_i2c_ops = {
+    .select = flexcomm_i2c_select,
+    .reg_read = flexcomm_i2c_reg_read,
+    .reg_write = flexcomm_i2c_reg_write,
+};
+
+void flexcomm_i2c_init(FlexcommState *s)
+{
+    s->i2c = i2c_init_bus(DEVICE(s), "i2c");
+}
+
+void flexcomm_i2c_register(void)
+{
+    Error *err = NULL;
+
+    if (!flexcomm_register_ops(FLEXCOMM_FUNC_I2C, NULL,
+                               &flexcomm_i2c_ops, &err)) {
+        error_report_err(err);
+    }
+}
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index c459adcb59..e7d79e6938 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -18,4 +18,5 @@ i2c_ss.add(when: 'CONFIG_PPC4XX', if_true: files('ppc4xx_i2c.c'))
 i2c_ss.add(when: 'CONFIG_PCA954X', if_true: files('i2c_mux_pca954x.c'))
 i2c_ss.add(when: 'CONFIG_PMBUS', if_true: files('pmbus_device.c'))
 i2c_ss.add(when: 'CONFIG_BCM2835_I2C', if_true: files('bcm2835_i2c.c'))
+i2c_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm_i2c.c'))
 system_ss.add_all(when: 'CONFIG_I2C', if_true: i2c_ss)
diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
index 6900e06eda..9f0175fab7 100644
--- a/hw/i2c/trace-events
+++ b/hw/i2c/trace-events
@@ -51,3 +51,13 @@ npcm7xx_smbus_recv_fifo(const char *id, uint8_t received, uint8_t expected) "%s
 
 pca954x_write_bytes(uint8_t value) "PCA954X write data: 0x%02x"
 pca954x_read_data(uint8_t value) "PCA954X read data: 0x%02x"
+
+# flexcomm_i2c.c
+
+flexcomm_i2c_reg_read(const char *id, const char *reg_name, uint32_t addr, uint32_t val) " %s: %s[0x%04x] -> 0x%08x"
+flexcomm_i2c_reg_write(const char *id, const char *reg_name, uint32_t addr, uint32_t val) "%s: %s[0x%04x] <- 0x%08x"
+flexcomm_i2c_start(const char *id, uint8_t addr, uint8_t recv) "%s: 0x%02x %d"
+flexcomm_i2c_rx(const char *id, uint8_t data) "%s: <- 0x%02x"
+flexcomm_i2c_tx(const char *id, uint8_t data) "%s: -> 0x%02x"
+flexcomm_i2c_nak(const char *id) "%s: <- nak"
+flexcomm_i2c_irq(const char *id, bool irq, bool perirqs, bool enabled) "%s: %d %d %d"
diff --git a/hw/misc/flexcomm.c b/hw/misc/flexcomm.c
index 0c94928aa2..2722c1d6a9 100644
--- a/hw/misc/flexcomm.c
+++ b/hw/misc/flexcomm.c
@@ -23,6 +23,7 @@
 #include "hw/regs.h"
 #include "hw/misc/flexcomm.h"
 #include "hw/char/flexcomm_usart.h"
+#include "hw/i2c/flexcomm_i2c.h"
 
 #define reg(field) offsetof(FLEXCOMM_Type, field)
 #define regi(x) (reg(x) / sizeof(uint32_t))
@@ -228,6 +229,10 @@ static void flexcomm_realize(DeviceState *dev, Error **errp)
     if (has_function(s, FLEXCOMM_FUNC_USART)) {
         flexcomm_usart_init(s);
     }
+
+    if (has_function(s, FLEXCOMM_FUNC_I2C)) {
+        flexcomm_i2c_init(s);
+    }
 }
 
 static void flexcomm_class_init(ObjectClass *klass, void *data)
@@ -239,6 +244,7 @@ static void flexcomm_class_init(ObjectClass *klass, void *data)
     dc->realize = flexcomm_realize;
 
     flexcomm_usart_register();
+    flexcomm_i2c_register();
 }
 
 static const TypeInfo flexcomm_info = {
diff --git a/include/hw/i2c/flexcomm_i2c.h b/include/hw/i2c/flexcomm_i2c.h
new file mode 100644
index 0000000000..aea01f13bd
--- /dev/null
+++ b/include/hw/i2c/flexcomm_i2c.h
@@ -0,0 +1,27 @@
+/*
+ * QEMU model for NXP's FLEXCOMM I2C
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_CHAR_FLEXCOMM_I2C_H
+#define HW_CHAR_FLEXCOMM_I2C_H
+
+#include "hw/misc/flexcomm.h"
+
+void flexcomm_i2c_init(FlexcommState *s);
+void flexcomm_i2c_register(void);
+
+#define MSTSTATE_IDLE 0
+#define MSTSTATE_RXRDY 1
+#define MSTSTATE_TXRDY 2
+#define MSTSTATE_NAKADR 3
+#define MSTSTATE_NAKDAT 4
+
+
+#endif /* HW_CHAR_FLEXCOMM_I2C_H */
diff --git a/include/hw/misc/flexcomm.h b/include/hw/misc/flexcomm.h
index db76e32c6d..3d042a3511 100644
--- a/include/hw/misc/flexcomm.h
+++ b/include/hw/misc/flexcomm.h
@@ -14,8 +14,10 @@
 
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
+#include "hw/i2c/i2c.h"
 #include "hw/arm/svd/flexcomm.h"
 #include "hw/arm/svd/flexcomm_usart.h"
+#include "hw/arm/svd/flexcomm_i2c.h"
 #include "qemu/fifo32.h"
 
 #define TYPE_FLEXCOMM "flexcomm"
@@ -46,6 +48,7 @@ typedef struct {
     union {
         FLEXCOMM_Type flex;
         FLEXCOMM_USART_Type usart;
+        FLEXCOMM_I2C_Type i2c;
     } regs;
     uint32_t functions;
     qemu_irq irq;
@@ -53,6 +56,7 @@ typedef struct {
     CharBackend chr;
     Fifo32 tx_fifo;
     Fifo32 rx_fifo;
+    I2CBus *i2c;
 } FlexcommState;
 
 typedef struct {
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index dcfd2e661c..4c22cb3ccc 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -148,6 +148,8 @@ if have_system
       meson.project_source_root() / 'tests/unit/sysbus-mock.c',
       meson.project_source_root() / 'hw/misc/flexcomm.c',
       meson.project_source_root() / 'hw/char/flexcomm_usart.c',
+      meson.project_source_root() / 'hw/i2c/flexcomm_i2c.c',
+      meson.project_source_root() / 'hw/i2c/core.c',
      ],
     'test-flexcomm-usart': [
       hwcore, chardev, qom, migration,
@@ -155,6 +157,8 @@ if have_system
       meson.project_source_root() / 'tests/unit/sysbus-mock.c',
       meson.project_source_root() / 'hw/misc/flexcomm.c',
       meson.project_source_root() / 'hw/char/flexcomm_usart.c',
+      meson.project_source_root() / 'hw/i2c/flexcomm_i2c.c',
+      meson.project_source_root() / 'hw/i2c/core.c',
     ],
   }
   if config_host_data.get('CONFIG_INOTIFY1')
-- 
2.46.0.rc2.264.g509ed76dc8-goog
