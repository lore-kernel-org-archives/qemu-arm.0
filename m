Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986527njb;
        Mon, 5 Aug 2024 13:17:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU63ndYm+YkEPV6/LjJRf21TgBx90smxbPtFmXp5xce3sd12OT9ycUBDcGkrmGBcLHI7J2qC3lP3s9P190vZ0gPs5FTcrVd
X-Received: by 2002:a17:903:228e:b0:200:668f:bfd5 with SMTP id d9443c01a7336-200668fc11cmr65961325ad.21.1722889073624;
        Mon, 05 Aug 2024 13:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889073; cv=none;
        d=google.com; s=arc-20160816;
        b=gwz1pFHjNpzQ7JcQvqYYKDvtTdsLzaEM3O87iBnSAA2aMRT0f6OGqfWTtWh20LQhjZ
         fn2XQUq6zlGGlcR4ndBpsP6KHhM/ISrNfHFapU/sN0u85+D1f16oX4ou+ZKiLe0meiqK
         5gLEZfwYxguiZa9+7QI+Is+RHs2DjQoCn7Ta4rwHLyWd3XVLQJYB+35N+zXsnCFdSLuT
         DCBiZm404rjhM9LWiCHeQr7ZlY4DtUTngNWgi684OTIcTWTSCTGquvbuYrN+kzXjCOPN
         fvK9q8aa64FyXVg7tk0SordmTuRkqXM2G03HmbKGxamXmaerx3UKt7w5e26f8+Q6Nu0u
         df1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=v2jh5tjCtlI1RmgfNYjqVuuv8CQQZbs99DRkNkD9UB4=;
        fh=O8bBdeEIX/cyr+JMtqSXeN63boYA9VdoUyoRfRnUXqY=;
        b=kORB9ZscUK+oszFwh4EzIsrDvKqdQuUedNxZlTJlZTQu1GsxgMPmnAxsNdTpeuXQlr
         0mntZq1bqy7SsHVJem28ptx3x088o/AQaSp5TK0wYYJvM9+65ukG0q9F/rOTvkW03raB
         JCP1rDSYWqu24Ts9T/6cdr7sMnmhbIyJtC1YZLENlf3sOakW2FlUMHiopR3b0eQbfNh4
         3RglIopUeVq+SJbZXxpATTR5N4k0bz2TdbL5y+h2kb4t4pZHgGn1SGH9To5kOgHY+LtC
         EI25zPsOWVsPgesQHXwK8wly+yR/w/GVlRglaxlgeMtag3CBtnlSrVKa8sqlxv/Fb+8q
         k0wA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="IL6fFsm/";
       spf=pass (google.com: domain of 3ctoxzgukc9gn4pcjaiiaf8.6ig4f8r.58hh88fch4li.ila@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3cTOxZgUKC9gN4PCJAIIAF8.6IG4F8R.58HH88FCH4LI.ILA@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3cTOxZgUKC9gN4PCJAIIAF8.6IG4F8R.58HH88FCH4LI.ILA@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id d9443c01a7336-1ff5905f110sor58747445ad.13.2024.08.05.13.17.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3ctoxzgukc9gn4pcjaiiaf8.6ig4f8r.58hh88fch4li.ila@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="IL6fFsm/";
       spf=pass (google.com: domain of 3ctoxzgukc9gn4pcjaiiaf8.6ig4f8r.58hh88fch4li.ila@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3cTOxZgUKC9gN4PCJAIIAF8.6IG4F8R.58HH88FCH4LI.ILA@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889073; x=1723493873; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v2jh5tjCtlI1RmgfNYjqVuuv8CQQZbs99DRkNkD9UB4=;
        b=IL6fFsm/38vLUMtRzX3rqNeQn1+QFqBya6LsKF6WiMiY0PGniFKTV98FdH8iAfZ155
         CJ/hAGJUMUH8muoA6oEUMtRgrWJM/MqLwpKNgcZNFi8wPCVNPlIBbXdldEfbrGcqa4Ci
         n2itukNTREUd1wH338Abz7i7eOJfbF8vO9tLnBCP8B0kj5/thUVSLIUNdJhcJRdL1JFj
         Eo5/GMBPlYnJNq74hdAQoSB3Hn2W70znnidvLI505YBe0bVE9DrH61MDOI1cEIh7C8al
         cuTAIoWckEWsjcBhd60j/7kH7x4199/+ffQ8Fi+DPtvBQ02MNyNzfJwlbMNYcAmG+q3R
         hg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889073; x=1723493873;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2jh5tjCtlI1RmgfNYjqVuuv8CQQZbs99DRkNkD9UB4=;
        b=oUut7OhMtSO8mZxE/A7UGeWoAWx0cWnhbs9zsW2RVfwlTuKsQqDK9xRQ3m4yrxOBD0
         Skyh4OElGPlEHgrro6YiTHhzDOMdjtyjrBNljxkAFhhUDBiqNOtJtlEYScjGOfH8TleE
         z+7e6crAaQNPvDBNvLbF1jdtAAUG8PdvlgEfDzbZulaI8syRn4K9OKWSxlHXSofyF8H+
         qVkhEw2AYux/gi1cFtwrWBXG4aOAeBjTXZYEY0SncRzPlAenKd988o5TEoX4YribGmfQ
         NtMJ8uNDeN62x4f3UWG2v8krkJAiVsMw//br3hAXWIhon6tnYHlKjAXw43dHFcdLXMJU
         VLMw==
X-Forwarded-Encrypted: i=1; AJvYcCUzgLM+rJeES5ocs/3dAWRfIHSFATQTlCVC6ELIIKoFUmLrwtidJDWlZckP4WVhYyIzBRaYfGp0oiG9R9vUhwuyC1VRso9+
X-Gm-Message-State: AOJu0YwKCvuAXp7fRmJN6icxPvxp7woZa2Nbas2bpUKh9njNSitABnNR
	WXZDnA50IocCPbimNSqxE0OUFHmx7amiF1cVw+FpcbObTVq4VvgPmU4tpUVIlkeNZ3oiUo2vFg=
	=
X-Google-Smtp-Source: AGHT+IEZdX2+oV28BPB0L7VYVGqFiktD6Oe29pv7sN7eBnPkvt3mVBy2Us8eoLe88yTqNmo0HP3uxSkHfQ==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:902:dac4:b0:1fc:57b7:9959 with SMTP id
 d9443c01a7336-1ff5732e3b0mr3746995ad.6.1722889073028; Mon, 05 Aug 2024
 13:17:53 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:13 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-19-tavip@google.com>
Subject: [RFC PATCH 18/23] hw/misc: add support for RT500's clock controller
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: HVCmLn1nA2pC

It supports system and audio PLL initialization and SYSTICK and
OSTIMER clock source selection.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 hw/arm/svd/meson.build            |   8 +
 hw/misc/Kconfig                   |   6 +
 hw/misc/meson.build               |   2 +
 hw/misc/rt500_clkctl0.c           | 243 ++++++++++++++++++++++++++++++
 hw/misc/rt500_clkctl1.c           | 224 +++++++++++++++++++++++++++
 hw/misc/trace-events              |   8 +
 include/hw/misc/rt500_clk_freqs.h |  18 +++
 include/hw/misc/rt500_clkctl0.h   |  37 +++++
 include/hw/misc/rt500_clkctl1.h   |  38 +++++
 9 files changed, 584 insertions(+)
 create mode 100644 hw/misc/rt500_clkctl0.c
 create mode 100644 hw/misc/rt500_clkctl1.c
 create mode 100644 include/hw/misc/rt500_clk_freqs.h
 create mode 100644 include/hw/misc/rt500_clkctl0.h
 create mode 100644 include/hw/misc/rt500_clkctl1.h

diff --git a/hw/arm/svd/meson.build b/hw/arm/svd/meson.build
index 8b3b045137..6ab13f8757 100644
--- a/hw/arm/svd/meson.build
+++ b/hw/arm/svd/meson.build
@@ -14,3 +14,11 @@ genh += custom_target('flexcomm_spi.h',
                       output: 'flexcomm_spi.h',
                       input: 'MIMXRT595S_cm33.xml',
                       command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'SPI0', '-t', 'FLEXCOMM_SPI'])
+genh += custom_target('rt500_clkctl0.h',
+                      output: 'rt500_clkctl0.h',
+                      input: 'MIMXRT595S_cm33.xml',
+                      command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'CLKCTL0', '-t', 'RT500_CLKCTL0'])
+genh += custom_target('rt500_clkctl1.h',
+                      output: 'rt500_clkctl1.h',
+                      input: 'MIMXRT595S_cm33.xml',
+                      command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'CLKCTL1', '-t', 'RT500_CLKCTL1'])
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 14167ae9e8..392ae9e84f 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -216,4 +216,10 @@ config XLNX_VERSAL_TRNG
 config FLEXCOMM
     bool
 
+config RT500_CLKCTL0
+    bool
+
+config RT500_CLKCTL1
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 8414767ae3..68929949a6 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -158,3 +158,5 @@ system_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
 system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
 
 system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm.c'))
+system_ss.add(when: 'CONFIG_RT500_CLKCTL0', if_true: files('rt500_clkctl0.c'))
+system_ss.add(when: 'CONFIG_RT500_CLKCTL1', if_true: files('rt500_clkctl1.c'))
diff --git a/hw/misc/rt500_clkctl0.c b/hw/misc/rt500_clkctl0.c
new file mode 100644
index 0000000000..84b5631924
--- /dev/null
+++ b/hw/misc/rt500_clkctl0.c
@@ -0,0 +1,243 @@
+/*
+ * QEMU model for RT500 Clock Controller
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
+#include "hw/clock.h"
+#include "hw/irq.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "exec/address-spaces.h"
+#include "hw/regs.h"
+#include "hw/misc/rt500_clkctl0.h"
+#include "hw/misc/rt500_clk_freqs.h"
+
+#include "trace.h"
+
+#define reg(field) offsetof(RT500_CLKCTL0_Type, field)
+#define REG_NO (sizeof(RT500_CLKCTL0_Type) / sizeof(uint32_t))
+#define regi(x) (reg(x) / sizeof(uint32_t))
+
+static RT500_CLKCTL0_REGISTER_NAMES_ARRAY(reg_names);
+
+static MemTxResult rt500_clkctl0_read(void *opaque, hwaddr addr,
+                                      uint64_t *data, unsigned size,
+                                      MemTxAttrs attrs)
+{
+    RT500ClkCtl0State *s = opaque;
+    MemTxResult ret = MEMTX_OK;
+
+    if (!reg32_aligned_access(addr, size)) {
+        ret = MEMTX_ERROR;
+        goto out;
+    }
+
+    switch (addr) {
+    case reg(PSCCTL0_SET):
+    case reg(PSCCTL1_SET):
+    case reg(PSCCTL2_SET):
+    case reg(PSCCTL0_CLR):
+    case reg(PSCCTL1_CLR):
+    case reg(PSCCTL2_CLR):
+        /* write only registers */
+        ret = MEMTX_ERROR;
+        break;
+    default:
+        *data = reg32_read(&s->regs, addr);
+        break;
+    }
+
+out:
+    trace_rt500_clkctl0_reg_read(reg_names[addr], addr, *data);
+    return ret;
+}
+
+static inline void set_systick_clk_from_div(RT500ClkCtl0State *s)
+{
+    uint32_t div = s->regs.SYSTICKFCLKDIV_b.DIV + 1;
+    uint32_t rate = clock_get_hz(s->sysclk);
+
+    clock_set_hz(s->systick_clk, rate / div);
+}
+
+static MemTxResult rt500_clkctl0_write(void *opaque, hwaddr addr,
+                                       uint64_t value, unsigned size,
+                                       MemTxAttrs attrs)
+{
+    RT500ClkCtl0State *s = opaque;
+    MemTxResult ret = MEMTX_OK;
+    static uint32_t wr_mask[REG_NO] = {
+        [0 ... REG_NO - 1] = BITS(31, 0),
+        [regi(FRO_CAPVAL)] = 0,
+        [regi(FROCLKSTATUS)] = 0,
+    };
+
+    if (!reg32_aligned_access(addr, size)) {
+        ret = MEMTX_ERROR;
+        goto out;
+    }
+
+    switch (addr) {
+    case reg(PSCCTL0):
+    case reg(PSCCTL1):
+    case reg(PSCCTL2):
+    {
+        reg32_write(&s->regs, addr, value, wr_mask);
+        break;
+    }
+    case reg(PSCCTL0_SET):
+    case reg(PSCCTL1_SET):
+    case reg(PSCCTL2_SET):
+    {
+        uint32_t update_addr = reg(PSCCTL0) + (addr - reg(PSCCTL0_SET));
+        reg32_write(&s->regs, update_addr,
+                    reg32_read(&s->regs, update_addr) | value, wr_mask);
+        break;
+    }
+    case reg(PSCCTL0_CLR):
+    case reg(PSCCTL1_CLR):
+    case reg(PSCCTL2_CLR):
+    {
+        uint32_t update_addr = reg(PSCCTL0) + (addr - reg(PSCCTL0_CLR));
+        reg32_write(&s->regs, update_addr,
+                    reg32_read(&s->regs, update_addr) & ~value, wr_mask);
+        break;
+    }
+    default:
+        reg32_write(&s->regs, addr, value, wr_mask);
+    }
+
+    switch (addr) {
+    case reg(SYSPLL0PFD):
+    {
+        if (!s->regs.SYSPLL0PFD_b.PFD0_CLKGATE) {
+            s->regs.SYSPLL0PFD_b.PFD0_CLKRDY = 1;
+        } else {
+            s->regs.SYSPLL0PFD_b.PFD0_CLKRDY = 0;
+        }
+        if (!s->regs.SYSPLL0PFD_b.PFD1_CLKGATE) {
+            s->regs.SYSPLL0PFD_b.PFD1_CLKRDY = 1;
+        } else {
+            s->regs.SYSPLL0PFD_b.PFD1_CLKRDY = 0;
+        }
+        if (!s->regs.SYSPLL0PFD_b.PFD2_CLKGATE) {
+            s->regs.SYSPLL0PFD_b.PFD2_CLKRDY = 1;
+        } else {
+            s->regs.SYSPLL0PFD_b.PFD2_CLKRDY = 0;
+        }
+        if (!s->regs.SYSPLL0PFD_b.PFD3_CLKGATE) {
+            s->regs.SYSPLL0PFD_b.PFD3_CLKRDY = 1;
+        } else {
+            s->regs.SYSPLL0PFD_b.PFD3_CLKRDY = 0;
+        }
+        break;
+    }
+    case reg(SYSTICKFCLKSEL):
+    {
+        switch (s->regs.SYSTICKFCLKSEL_b.SEL) {
+        case SYSTICKFCLKSEL_DIVOUT:
+        {
+            set_systick_clk_from_div(s);
+            break;
+        }
+        case SYSTICKFCLKSEL_LPOSC:
+        {
+            clock_set_hz(s->systick_clk, LPOSC_CLK_HZ);
+            break;
+        }
+        case SYSTICKFCLKSEL_32KHZRTC:
+        {
+            clock_set_hz(s->systick_clk, RTC32KHZ_CLK_HZ);
+            break;
+        }
+        case SYSTICKFCLKSEL_NONE:
+        {
+            clock_set_hz(s->systick_clk, 0);
+            break;
+        }
+        }
+        clock_propagate(s->systick_clk);
+        break;
+    }
+    case reg(SYSTICKFCLKDIV):
+    {
+        if (s->regs.SYSTICKFCLKSEL_b.SEL == SYSTICKFCLKSEL_DIVOUT) {
+            set_systick_clk_from_div(s);
+            clock_propagate(s->systick_clk);
+        }
+        break;
+    }
+    }
+
+out:
+    trace_rt500_clkctl0_reg_write(reg_names[addr], addr, value);
+    return ret;
+
+    return MEMTX_OK;
+}
+
+static const MemoryRegionOps rt500_clkctl0_ops = {
+    .read_with_attrs = rt500_clkctl0_read,
+    .write_with_attrs = rt500_clkctl0_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void rt500_clkctl0_reset(DeviceState *dev)
+{
+    RT500ClkCtl0State *s = RT500_CLKCTL0(dev);
+
+    memset(&s->regs, 0, sizeof(s->regs));
+
+    rt500_clkctl0_reset_registers(&s->regs);
+
+    /* clock OK immediately after reset */
+    s->regs.FROCLKSTATUS = 0x00000001;
+}
+
+static void rt500_clkctl0_init(Object *obj)
+{
+    RT500ClkCtl0State *s = RT500_CLKCTL0(obj);
+
+    memory_region_init_io(&s->mmio, obj, &rt500_clkctl0_ops, s,
+                          TYPE_RT500_CLKCTL0, sizeof(s->regs));
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
+    s->systick_clk = qdev_init_clock_out(DEVICE(s), "systick_clk");
+}
+
+static void rt500_clkctl0_realize(DeviceState *dev, Error **errp)
+{
+}
+
+static void rt500_clkctl0_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = rt500_clkctl0_reset;
+    dc->realize = rt500_clkctl0_realize;
+}
+
+static const TypeInfo rt500_clkctl0_info = {
+    .name          = TYPE_RT500_CLKCTL0,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(RT500ClkCtl0State),
+    .instance_init = rt500_clkctl0_init,
+    .class_init    = rt500_clkctl0_class_init,
+};
+
+static void rt500_clkctl0_register_types(void)
+{
+    type_register_static(&rt500_clkctl0_info);
+}
+
+type_init(rt500_clkctl0_register_types)
+
diff --git a/hw/misc/rt500_clkctl1.c b/hw/misc/rt500_clkctl1.c
new file mode 100644
index 0000000000..a5a8cf6564
--- /dev/null
+++ b/hw/misc/rt500_clkctl1.c
@@ -0,0 +1,224 @@
+/*
+ * QEMU model for RT500 Clock Controller
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
+#include "hw/clock.h"
+#include "hw/irq.h"
+#include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "exec/address-spaces.h"
+#include "hw/regs.h"
+#include "hw/misc/rt500_clkctl1.h"
+#include "hw/misc/rt500_clk_freqs.h"
+
+#include "trace.h"
+
+#define reg(field) offsetof(RT500_CLKCTL1_Type, field)
+#define REG_NO (sizeof(RT500_CLKCTL1_Type) / sizeof(uint32_t))
+#define regi(x) (reg(x) / sizeof(uint32_t))
+
+static RT500_CLKCTL1_REGISTER_NAMES_ARRAY(reg_names);
+
+static MemTxResult rt500_clkctl1_read(void *opaque, hwaddr addr,
+                                      uint64_t *data, unsigned size,
+                                      MemTxAttrs attrs)
+{
+    RT500ClkCtl1State *s = opaque;
+    MemTxResult ret = MEMTX_OK;
+
+    if (!reg32_aligned_access(addr, size)) {
+        ret = MEMTX_ERROR;
+        goto out;
+    }
+
+    switch (addr) {
+    case reg(PSCCTL0_SET):
+    case reg(PSCCTL1_SET):
+    case reg(PSCCTL2_SET):
+    case reg(PSCCTL0_CLR):
+    case reg(PSCCTL1_CLR):
+    case reg(PSCCTL2_CLR):
+        /* write only registers */
+        ret = MEMTX_ERROR;
+        break;
+    default:
+        *data = reg32_read(&s->regs, addr);
+        break;
+    }
+
+out:
+    trace_rt500_clkctl1_reg_read(reg_names[addr], addr, *data);
+    return ret;
+}
+
+static MemTxResult rt500_clkctl1_write(void *opaque, hwaddr addr,
+                                       uint64_t value, unsigned size,
+                                       MemTxAttrs attrs)
+{
+    RT500ClkCtl1State *s = opaque;
+    MemTxResult ret = MEMTX_OK;
+    static uint32_t wr_mask[REG_NO] = {
+        [0 ... REG_NO - 1] = BITS(31, 0),
+    };
+
+    if (!reg32_aligned_access(addr, size)) {
+        ret = MEMTX_ERROR;
+        goto out;
+    }
+
+    switch (addr) {
+    case reg(PSCCTL0):
+    case reg(PSCCTL1):
+    case reg(PSCCTL2):
+    {
+        reg32_write(&s->regs, addr, value, wr_mask);
+        break;
+    }
+    case reg(PSCCTL0_SET):
+    case reg(PSCCTL1_SET):
+    case reg(PSCCTL2_SET):
+    {
+        uint32_t update_addr = reg(PSCCTL0) + (addr - reg(PSCCTL0_SET));
+        reg32_write(&s->regs, update_addr,
+                    reg32_read(&s->regs, update_addr) | value, wr_mask);
+        break;
+    }
+    case reg(PSCCTL0_CLR):
+    case reg(PSCCTL1_CLR):
+    case reg(PSCCTL2_CLR):
+    {
+        uint32_t update_addr = reg(PSCCTL0) + (addr - reg(PSCCTL0_CLR));
+        reg32_write(&s->regs, update_addr,
+                    reg32_read(&s->regs, update_addr) & ~value, wr_mask);
+        break;
+    }
+    default:
+        reg32_write(&s->regs, addr, value, wr_mask);
+    }
+
+    switch (addr) {
+    case reg(AUDIOPLL0PFD):
+    {
+        if (!s->regs.AUDIOPLL0PFD_b.PFD0_CLKGATE) {
+            s->regs.AUDIOPLL0PFD_b.PFD0_CLKRDY = 1;
+        } else {
+            s->regs.AUDIOPLL0PFD_b.PFD0_CLKRDY = 0;
+        }
+        if (!s->regs.AUDIOPLL0PFD_b.PFD1_CLKGATE) {
+            s->regs.AUDIOPLL0PFD_b.PFD1_CLKRDY = 1;
+        } else {
+            s->regs.AUDIOPLL0PFD_b.PFD1_CLKRDY = 0;
+        }
+        if (!s->regs.AUDIOPLL0PFD_b.PFD2_CLKGATE) {
+            s->regs.AUDIOPLL0PFD_b.PFD2_CLKRDY = 1;
+        } else {
+            s->regs.AUDIOPLL0PFD_b.PFD2_CLKRDY = 0;
+        }
+        if (!s->regs.AUDIOPLL0PFD_b.PFD3_CLKGATE) {
+            s->regs.AUDIOPLL0PFD_b.PFD3_CLKRDY = 1;
+        } else {
+            s->regs.AUDIOPLL0PFD_b.PFD3_CLKRDY = 0;
+        }
+        break;
+    }
+    case reg(OSEVENTTFCLKSEL):
+    {
+        switch (s->regs.OSEVENTTFCLKSEL_b.SEL) {
+        case OSEVENTTFCLKSEL_LPOSC:
+        {
+            clock_set_hz(s->ostimer_clk, LPOSC_CLK_HZ);
+            break;
+        }
+        case OSEVENTTFCLKSEL_32KHZRTC:
+        {
+            clock_set_hz(s->ostimer_clk, RTC32KHZ_CLK_HZ);
+            break;
+        }
+        case OSEVENTTFCLKSEL_HCLK:
+        {
+            clock_set_hz(s->ostimer_clk, clock_get_hz(s->sysclk));
+            break;
+        }
+        case OSEVENTTFCLKSEL_NONE:
+        {
+            clock_set_hz(s->ostimer_clk, 0);
+            break;
+        }
+        }
+
+        clock_propagate(s->ostimer_clk);
+        break;
+    }
+    }
+
+out:
+    trace_rt500_clkctl1_reg_write(reg_names[addr], addr, value);
+    return ret;
+
+    return MEMTX_OK;
+}
+
+
+static const MemoryRegionOps rt500_clkctl1_ops = {
+    .read_with_attrs = rt500_clkctl1_read,
+    .write_with_attrs = rt500_clkctl1_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void rt500_clkctl1_reset(DeviceState *dev)
+{
+    RT500ClkCtl1State *s = RT500_CLKCTL1(dev);
+
+    memset(&s->regs, 0, sizeof(s->regs));
+
+    rt500_clkctl1_reset_registers(&s->regs);
+}
+
+static void rt500_clkctl1_init(Object *obj)
+{
+    RT500ClkCtl1State *s = RT500_CLKCTL1(obj);
+
+    memory_region_init_io(&s->mmio, obj, &rt500_clkctl1_ops, s,
+                          TYPE_RT500_CLKCTL1, sizeof(s->regs));
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
+    s->ostimer_clk = qdev_init_clock_out(DEVICE(s), "ostimer_clk");
+}
+
+static void rt500_clkctl1_realize(DeviceState *dev, Error **errp)
+{
+}
+
+static void rt500_clkctl1_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = rt500_clkctl1_reset;
+    dc->realize = rt500_clkctl1_realize;
+}
+
+static const TypeInfo rt500_clkctl1_info = {
+    .name          = TYPE_RT500_CLKCTL1,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(RT500ClkCtl1State),
+    .instance_init = rt500_clkctl1_init,
+    .class_init    = rt500_clkctl1_class_init,
+};
+
+static void rt500_clkctl1_register_types(void)
+{
+    type_register_static(&rt500_clkctl1_info);
+}
+
+type_init(rt500_clkctl1_register_types)
+
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 71ec77de29..e65fcfa613 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -357,3 +357,11 @@ flexcomm_reset(void) ""
 flexcomm_irq(const char *id, uint8_t irq) "%s %d"
 flexcomm_reg_read(const char *devname, const char *regname, uint32_t addr, uint32_t val) "%s: %s[0x%04x] -> 0x%08x"
 flexcomm_reg_write(const char *dename, const char *regname, uint32_t addr, uint32_t val) "%s: %s[0x%04x] <- 0x%08x"
+
+# rt500_clkctl0.c
+rt500_clkctl0_reg_read(const char *regname, uint32_t addr, uint32_t val) "%s[0x%04x] -> 0x%08x"
+rt500_clkctl0_reg_write(const char *regname, uint32_t addr, uint32_t val) "%s[0x%04x] <- 0x%08x"
+
+# rt500_clkctl1.c
+rt500_clkctl1_reg_read(const char *regname, uint32_t addr, uint32_t val) "%s[0x%04x] -> 0x%08x"
+rt500_clkctl1_reg_write(const char *regname, uint32_t addr, uint32_t val) "%s[0x%04x] <- 0x%08x"
diff --git a/include/hw/misc/rt500_clk_freqs.h b/include/hw/misc/rt500_clk_freqs.h
new file mode 100644
index 0000000000..1e366d4967
--- /dev/null
+++ b/include/hw/misc/rt500_clk_freqs.h
@@ -0,0 +1,18 @@
+/*
+ * QEMU model for RT500 Clock Controller
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_MISC_RT500_CLK_FREQS_H
+#define HW_MISC_RT500_CLK_FREQS_H
+
+#define RTC32KHZ_CLK_HZ 32000
+#define LPOSC_CLK_HZ 1000000
+
+#endif /* HW_MISC_RT500_CLK_FREQS_H */
diff --git a/include/hw/misc/rt500_clkctl0.h b/include/hw/misc/rt500_clkctl0.h
new file mode 100644
index 0000000000..798ded96e3
--- /dev/null
+++ b/include/hw/misc/rt500_clkctl0.h
@@ -0,0 +1,37 @@
+/*
+ * QEMU model for RT500 Clock Controller
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_MISC_RT500_CLKCTL0_H
+#define HW_MISC_RT500_CLKCTL0_H
+
+#include "hw/arm/svd/rt500_clkctl0.h"
+#include "hw/sysbus.h"
+
+#define TYPE_RT500_CLKCTL0 "rt500-clkctl0"
+#define RT500_CLKCTL0(o) OBJECT_CHECK(RT500ClkCtl0State, o, TYPE_RT500_CLKCTL0)
+
+#define SYSTICKFCLKSEL_DIVOUT 0
+#define SYSTICKFCLKSEL_LPOSC 1
+#define SYSTICKFCLKSEL_32KHZRTC 2
+#define SYSTICKFCLKSEL_NONE 7
+
+typedef struct {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion mmio;
+    RT500_CLKCTL0_Type regs;
+    Clock *systick_clk;
+    Clock *sysclk;
+} RT500ClkCtl0State;
+
+#endif /* HW_MISC_RT500_CLKCTL0_H */
diff --git a/include/hw/misc/rt500_clkctl1.h b/include/hw/misc/rt500_clkctl1.h
new file mode 100644
index 0000000000..7b6e56e294
--- /dev/null
+++ b/include/hw/misc/rt500_clkctl1.h
@@ -0,0 +1,38 @@
+/*
+ * QEMU model for RT500 Clock Controller
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+
+#ifndef HW_MISC_RT500_CLKCTL1_H
+#define HW_MISC_RT500_CLKCTL1_H
+
+#include "hw/arm/svd/rt500_clkctl1.h"
+#include "hw/sysbus.h"
+
+#define TYPE_RT500_CLKCTL1 "rt500-clkctl1"
+#define RT500_CLKCTL1(o) OBJECT_CHECK(RT500ClkCtl1State, o, TYPE_RT500_CLKCTL1)
+
+#define OSEVENTTFCLKSEL_LPOSC 0
+#define OSEVENTTFCLKSEL_32KHZRTC 1
+#define OSEVENTTFCLKSEL_HCLK 2
+#define OSEVENTTFCLKSEL_NONE 7
+
+typedef struct {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion mmio;
+    RT500_CLKCTL1_Type regs;
+    Clock *sysclk;
+    Clock *ostimer_clk;
+} RT500ClkCtl1State;
+
+#endif /* HW_MISC_RT500_CLKCTL1_H */
-- 
2.46.0.rc2.264.g509ed76dc8-goog
