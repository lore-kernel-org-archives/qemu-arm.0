Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986377njb;
        Mon, 5 Aug 2024 13:17:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgdPqz662IosGIXyFcm1kQzqa20d8Pm1jzLBXIbAjw9rVpHVQzdXoHgVBgcXkPhu79L39A67rer0vIWE5AYkW+rwpVU8kW
X-Received: by 2002:a05:6358:9492:b0:1aa:d6fe:f422 with SMTP id e5c5f4694b2df-1af3ba614f9mr1018173855d.18.1722889052023;
        Mon, 05 Aug 2024 13:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889052; cv=none;
        d=google.com; s=arc-20160816;
        b=iE4o15m3g3jyFtZljSYGgV7gEQPILoPdJ6FavKZW6Kak5MqyzmVSpOcxwSL3MrrVWL
         hGq5DC0DGmeDII36u4d+i5YggYSe6xaHEGE//DTNtvi+9zbf4rKoEswyraN2WtiR4Po0
         1Pu7HzeCGeyMzrzN4Ce8IZ4MLvn/XAH8prim5kEHJHBmaxVH51Y0XV0pV1sUBWpn6jeG
         drChS2eO28qX6Zju/XDKrDfDOBb9QPJnB4bcVolZcEYt93q+AwL74V56kOWon53/Gn45
         I5HAsXUL/4sa9Taubikz3hmnPSIJqojPOYa/ukt9YomQLy0c28LwrWHOjO6EhkGhTT7Y
         1kLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=wDO4e3UKSsj6tL7DUtVF1WgZwVGK3Elc+5u76pV26W8=;
        fh=CjB7sKNJxxXhNWnlEkz0y96uWidcjaUJAHGuId7Qnw4=;
        b=b2PT4jzNZjPm2WfM84U2bI1ye6QFzpIo4ZgEyUp6LAZGgIckodua2FpIceYkUhzfsg
         KrVHTFzLzGCj76bXQucheBcVl+9zdlXMMXtU8TWZsXfdZ++FMAe+QoZFAODqaAoa9sJ/
         bGIkpWJopVYz38VSWFogQ8dMW2ppXi++dxF9WBi8VZTAAeshngQAWyiDdf+bctTSnxVC
         KztnOWAZpyPfJzQrtEI7h2st0oAnuYc/Ud2Gs6rN/B8hNGgmX4BfqIJA00gX9H45sx2a
         HKecQOC0w9zINA41Ct+nsmHEwvWjCnZrt45XZbpP9Pcbh2e/P4voTQxWy5ojx8NABO6o
         C8Tg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bZkhbF3T;
       spf=pass (google.com: domain of 3wzoxzgukc8i1i3qxowwotm.kwuitm5.jmvvmmtqvizw.wzo@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3WzOxZgUKC8I1i3qxowwotm.kwuitm5.jmvvmmtqvizw.wzo@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3WzOxZgUKC8I1i3qxowwotm.kwuitm5.jmvvmmtqvizw.wzo@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 00721157ae682-68a1074ee1asor59262267b3.8.2024.08.05.13.17.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3wzoxzgukc8i1i3qxowwotm.kwuitm5.jmvvmmtqvizw.wzo@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=bZkhbF3T;
       spf=pass (google.com: domain of 3wzoxzgukc8i1i3qxowwotm.kwuitm5.jmvvmmtqvizw.wzo@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3WzOxZgUKC8I1i3qxowwotm.kwuitm5.jmvvmmtqvizw.wzo@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889051; x=1723493851; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wDO4e3UKSsj6tL7DUtVF1WgZwVGK3Elc+5u76pV26W8=;
        b=bZkhbF3T3NIeX9VK5qyYeczN+HAVI8487BGb7WHBNlINuWrbxEiA0zVeJBm5Wst+l+
         o66L7WUkYye6rQl0Wpbs+zNhvS6s9w0WAt2e/5dzjhL9MCvwMXmpHXwxeTXBZ5lvl3rH
         xGY1GmCOYybdfy+SJEnIP5g/yotuoIvf21R/A5WirRhcKjvDwTinZ0F1zyzG+2mXlxMI
         +SXigwIUNgjTlNU07NkkWiqsD2vTtote4lsV2aqidiNfQ2hRQb9PeOD73pWvd0Z+Tay/
         WezSkHwjGs9e+BSRXVCB3u8g8+vxX7DF9zrXLTcg5W7v/akXyXDNtcltC5pPJwFsz0L3
         y/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889051; x=1723493851;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDO4e3UKSsj6tL7DUtVF1WgZwVGK3Elc+5u76pV26W8=;
        b=vzuu7zKwB1+qOt446GT3jbsdPOocpNYF1aRdzt0S0zx+2oYtv3Fdxxh3wK8b0RtMdM
         TU6bnMRMpkIL91IVW/7e0KQOBwpZIqNqbUu86+XZCivt/PJa8qn2jZrUcsROXWVD9HDO
         3d5gso9uP8rD1suF5HPQKeUmVt3NN+0SoonwQnH1/wNbAVWE62Y21ZJtexapf89LFkTy
         7x6IyWM9lPep0oOYDZc8RsbOYpVxSLRI7V2Zp5DD+QHom8RebwZB4RYStDRNRbBuqK1R
         rgz6l2Xfa7jx7mKez1lTXHgBG7ZZx1PEQi48tGJXqvzVMy3zxDkH1qt2OU+K3oxlzLMb
         LqRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbHfgnf0TCYxTQAoZGJWvEneK9dDlnwqr2VB8SYwk63jGKfjHaE8ffo5luy4u9bo7vxH6asIH3QxDGZpVnM9U3OBcdBo4O
X-Gm-Message-State: AOJu0YyItutXmMxyN6d+61xPtICgVA1+Y+Th6QB13YiZBTz6xgMMkA5l
	lt4LSclqNE1wF1Mf2D1dRx8rNh4efD1J2E0dwAS0mZU5IBLX3Evlco/i0dnY995iZJPFqBwbOg=
	=
X-Google-Smtp-Source: AGHT+IFhMaT7TM7CDKtYxkauXcy3SIIDxPG+x/C5CZqATVbeb3Vqn2DL3Vy0CU3eXiOiF2Rw4xAxnfEN6A==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:690c:f12:b0:648:3f93:68e0 with SMTP id
 00721157ae682-6896313e32emr4155107b3.6.1722889051653; Mon, 05 Aug 2024
 13:17:31 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:01 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-7-tavip@google.com>
Subject: [RFC PATCH 06/23] hw/misc: add basic flexcomm device model
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: ea8SUoWm5OYP

Add support for NXP's FLEXCOMM device model. It uses the NXP RT595 SVD
file to generate the register structure.

FLEXCOMM is a generic serial communication module which support
multiple functions: UART, SPI and I2C. These are configurable at runtime.

This patch adds the infrastructure to support adding the above
mentioned hardware functions in a modular fashion in subsequent
patches as well as switching between functions.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 hw/arm/meson.build         |   2 +
 hw/arm/svd/meson.build     |   4 +
 hw/misc/Kconfig            |   3 +
 hw/misc/flexcomm.c         | 283 +++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build        |   2 +
 hw/misc/trace-events       |   6 +
 include/hw/misc/flexcomm.h |  74 ++++++++++
 7 files changed, 374 insertions(+)
 create mode 100644 hw/arm/svd/meson.build
 create mode 100644 hw/misc/flexcomm.c
 create mode 100644 include/hw/misc/flexcomm.h

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index aefde0c69a..eb604d00cf 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -78,3 +78,5 @@ system_ss.add(when: 'CONFIG_VEXPRESS', if_true: files('vexpress.c'))
 system_ss.add(when: 'CONFIG_Z2', if_true: files('z2.c'))
 
 hw_arch += {'arm': arm_ss}
+
+subdir('svd')
diff --git a/hw/arm/svd/meson.build b/hw/arm/svd/meson.build
new file mode 100644
index 0000000000..9ce6c1d838
--- /dev/null
+++ b/hw/arm/svd/meson.build
@@ -0,0 +1,4 @@
+genh += custom_target('flexcomm.h',
+                      output: 'flexcomm.h',
+                      input: 'MIMXRT595S_cm33.xml',
+                      command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'FLEXCOMM0', '-t', 'FLEXCOMM'])
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 1e08785b83..14167ae9e8 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -213,4 +213,7 @@ config IOSB
 config XLNX_VERSAL_TRNG
     bool
 
+config FLEXCOMM
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/flexcomm.c b/hw/misc/flexcomm.c
new file mode 100644
index 0000000000..6ec3773910
--- /dev/null
+++ b/hw/misc/flexcomm.c
@@ -0,0 +1,283 @@
+/*
+ * QEMU model for NXP's FLEXCOMM
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
+#include "qemu/mmap-alloc.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/qdev-properties-system.h"
+#include "migration/vmstate.h"
+#include "exec/address-spaces.h"
+#include "qapi/error.h"
+#include "trace.h"
+#include "hw/regs.h"
+#include "hw/misc/flexcomm.h"
+
+#define reg(field) offsetof(FLEXCOMM_Type, field)
+#define regi(x) (reg(x) / sizeof(uint32_t))
+#define REG_NO (sizeof(FLEXCOMM_Type) / sizeof(uint32_t))
+
+static FLEXCOMM_REGISTER_NAMES_ARRAY(reg_names);
+
+#define modname "flexcomm: "
+
+static const FlexcommFunctionOps *flexcomm_fops[FLEXCOMM_FUNCTIONS];
+static void *flexcomm_farg[FLEXCOMM_FUNCTIONS];
+
+static inline bool has_function(FlexcommState *s, int function)
+{
+    return s->functions & (1 << function);
+}
+
+static inline int persel_to_function(FlexcommState *s)
+{
+    switch (s->regs.flex.PSELID_b.PERSEL) {
+    case FLEXCOMM_PERSEL_USART:
+        return FLEXCOMM_FUNC_USART;
+    case FLEXCOMM_PERSEL_SPI:
+        return FLEXCOMM_FUNC_SPI;
+    case FLEXCOMM_PERSEL_I2C:
+        return FLEXCOMM_FUNC_I2C;
+    case FLEXCOMM_PERSEL_I2S_TX:
+    case FLEXCOMM_PERSEL_I2S_RX:
+        return FLEXCOMM_FUNC_I2S;
+    default:
+        return -1;
+    }
+}
+
+static void flexcomm_func_select(FlexcommState *s, bool selected)
+{
+    int f = persel_to_function(s);
+
+    if (f < 0 || !flexcomm_fops[f] || !flexcomm_fops[f]->select) {
+        return;
+    }
+
+    flexcomm_fops[f]->select(flexcomm_farg[f], s, f, selected);
+}
+
+static MemTxResult flexcomm_func_reg_read(FlexcommState *s, hwaddr addr,
+                                         uint64_t *data, unsigned size)
+{
+    int f = persel_to_function(s);
+
+    if (f < 0 || !flexcomm_fops[f] || !flexcomm_fops[f]->reg_read) {
+        return MEMTX_ERROR;
+    }
+
+    return flexcomm_fops[f]->reg_read(flexcomm_farg[f], s, f, addr, data, size);
+}
+
+static MemTxResult flexcomm_func_reg_write(FlexcommState *s, hwaddr addr,
+                                          uint64_t data, unsigned size)
+{
+    int f = persel_to_function(s);
+
+    if (f < 0 || !flexcomm_fops[f] || !flexcomm_fops[f]->reg_write) {
+        return MEMTX_ERROR;
+    }
+
+    return flexcomm_fops[f]->reg_write(flexcomm_farg[f], s, f, addr, data,
+                                       size);
+}
+
+static void flexcomm_reset(DeviceState *dev)
+{
+    FlexcommState *s = FLEXCOMM(dev);
+
+    trace_flexcomm_reset();
+
+    flexcomm_func_select(s, false);
+
+    flexcomm_reset_registers(&s->regs.flex);
+
+    s->regs.flex.PSELID_b.USARTPRESENT = has_function(s, FLEXCOMM_FUNC_USART);
+    s->regs.flex.PSELID_b.SPIPRESENT = has_function(s, FLEXCOMM_FUNC_SPI);
+    s->regs.flex.PSELID_b.I2CPRESENT = has_function(s, FLEXCOMM_FUNC_I2C);
+    s->regs.flex.PSELID_b.I2SPRESENT = has_function(s, FLEXCOMM_FUNC_I2S);
+
+    s->irq_state = false;
+    qemu_set_irq(s->irq, s->irq_state);
+}
+
+static MemTxResult flexcomm_reg_read(void *opaque, hwaddr addr,
+                                    uint64_t *data, unsigned size,
+                                    MemTxAttrs attrs)
+{
+    FlexcommState *s = opaque;
+    MemTxResult ret = MEMTX_OK;
+
+    switch (addr) {
+    case reg(PSELID):
+    case reg(PID):
+    {
+        if (!reg32_aligned_access(addr, size)) {
+            ret = MEMTX_ERROR;
+        } else {
+            *data = reg32_read(&s->regs, addr);
+        }
+        break;
+    }
+    default:
+        return flexcomm_func_reg_read(s, addr, data, size);
+    }
+
+    trace_flexcomm_reg_read(DEVICE(s)->id, reg_names[addr], addr, *data);
+    return ret;
+}
+
+static int flexcomm_check_function(FlexcommState *s)
+{
+    int f = persel_to_function(s);
+
+    if (f < 0 || !has_function(s, f)) {
+        return -1;
+    }
+
+    return f;
+}
+
+static MemTxResult flexcomm_reg_write(void *opaque, hwaddr addr,
+                                     uint64_t value, unsigned size,
+                                     MemTxAttrs attrs)
+{
+    FlexcommState *s = opaque;
+    MemTxResult ret = MEMTX_OK;
+    static uint32_t mask[] = {
+        [regi(PSELID)] = BITS(3, 0),
+    };
+
+    trace_flexcomm_reg_write(DEVICE(s)->id, reg_names[addr], addr, value);
+    switch (addr) {
+    case reg(PID):
+        /* RO register, nothing do to */
+        break;
+    case reg(PSELID):
+    {
+        if (!reg32_aligned_access(addr, size)) {
+            ret = MEMTX_ERROR;
+            break;
+        }
+
+        if (s->regs.flex.PSELID_b.LOCK) {
+            break;
+        }
+
+        flexcomm_func_select(s, false);
+
+        reg32_write(&s->regs, addr, value, mask);
+
+        if (flexcomm_check_function(s) < 0) {
+            s->regs.flex.PSELID_b.PERSEL = 0;
+        }
+        s->regs.flex.PID_b.ID = s->regs.flex.PSELID_b.PERSEL;
+
+        flexcomm_func_select(s, true);
+        break;
+    }
+    default:
+        return flexcomm_func_reg_write(s, addr, value, size);
+    }
+
+    return ret;
+}
+
+
+static const MemoryRegionOps flexcomm_ops = {
+    .read_with_attrs = flexcomm_reg_read,
+    .write_with_attrs = flexcomm_reg_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static Property flexcomm_properties[] = {
+    DEFINE_PROP_UINT32("functions", FlexcommState, functions,
+                       FLEXCOMM_FULL),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void flexcomm_init(Object *obj)
+{
+    FlexcommState *s = FLEXCOMM(obj);
+    DeviceState *dev = DEVICE(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+    memory_region_init_io(&s->mmio, obj, &flexcomm_ops, s,
+                          TYPE_FLEXCOMM, sizeof(FLEXCOMM_Type));
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void flexcomm_realize(DeviceState *dev, Error **errp)
+{
+}
+
+static void flexcomm_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = flexcomm_reset;
+    device_class_set_props(dc, flexcomm_properties);
+    dc->realize = flexcomm_realize;
+}
+
+static const TypeInfo flexcomm_info = {
+    .name          = TYPE_FLEXCOMM,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(FlexcommState),
+    .instance_init = flexcomm_init,
+    .class_init    = flexcomm_class_init,
+};
+
+static void flexcomm_register_types(void)
+{
+    type_register_static(&flexcomm_info);
+}
+
+type_init(flexcomm_register_types)
+
+void flexcomm_irq(FlexcommState *s, bool irq)
+{
+    if (s->irq_state != irq) {
+        trace_flexcomm_irq(DEVICE(s)->id, irq);
+        qemu_set_irq(s->irq, irq);
+        s->irq_state = irq;
+    }
+}
+
+bool flexcomm_register_ops(int f, void *arg, const FlexcommFunctionOps *ops,
+                          Error **errp)
+{
+    if (f < 0 || f >= FLEXCOMM_FUNCTIONS) {
+        error_setg(errp, modname "invalid function %d", f);
+        return false;
+    }
+
+    if (flexcomm_fops[f]) {
+        error_setg(errp, modname "function %d already registered", f);
+        return false;
+    }
+
+    flexcomm_fops[f] = ops;
+    flexcomm_farg[f] = arg;
+
+    return true;
+}
+
+/* for unit tests */
+void flexcomm_unregister_ops(int f)
+{
+    flexcomm_fops[f] = NULL;
+    flexcomm_farg[f] = NULL;
+}
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 86596a3888..8414767ae3 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -156,3 +156,5 @@ system_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa_ec.c'))
 
 # HPPA devices
 system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
+
+system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm.c'))
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 5d241cb40a..71ec77de29 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -351,3 +351,9 @@ djmemc_write(int reg, uint64_t value, unsigned int size) "reg=0x%x value=0x%"PRI
 # iosb.c
 iosb_read(int reg, uint64_t value, unsigned int size) "reg=0x%x value=0x%"PRIx64" size=%u"
 iosb_write(int reg, uint64_t value, unsigned int size) "reg=0x%x value=0x%"PRIx64" size=%u"
+
+# flexcomm
+flexcomm_reset(void) ""
+flexcomm_irq(const char *id, uint8_t irq) "%s %d"
+flexcomm_reg_read(const char *devname, const char *regname, uint32_t addr, uint32_t val) "%s: %s[0x%04x] -> 0x%08x"
+flexcomm_reg_write(const char *dename, const char *regname, uint32_t addr, uint32_t val) "%s: %s[0x%04x] <- 0x%08x"
diff --git a/include/hw/misc/flexcomm.h b/include/hw/misc/flexcomm.h
new file mode 100644
index 0000000000..422452bd96
--- /dev/null
+++ b/include/hw/misc/flexcomm.h
@@ -0,0 +1,74 @@
+/*
+ * QEMU model for NXP's FLEXCOMM
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_FLEXCOMM_H
+#define HW_FLEXCOMM_H
+
+#include "hw/sysbus.h"
+#include "hw/arm/svd/flexcomm.h"
+#include "qemu/fifo32.h"
+
+#define TYPE_FLEXCOMM "flexcomm"
+#define FLEXCOMM(obj) OBJECT_CHECK(FlexcommState, (obj), TYPE_FLEXCOMM)
+
+#define FLEXCOMM_FUNC_USART     0
+#define FLEXCOMM_FUNC_SPI       1
+#define FLEXCOMM_FUNC_I2C       2
+#define FLEXCOMM_FUNC_I2S       3
+#define FLEXCOMM_FUNCTIONS 4
+
+#define FLEXCOMM_FULL    0xF
+#define FLEXCOMM_HSSPI   (1 << FLEXCOMM_FUNC_SPI)
+#define FLEXCOMM_PMICI2C (1 << FLEXCOMM_FUNC_I2C)
+
+#define FLEXCOMM_PERSEL_USART  1
+#define FLEXCOMM_PERSEL_SPI    2
+#define FLEXCOMM_PERSEL_I2C    3
+#define FLEXCOMM_PERSEL_I2S_TX 4
+#define FLEXCOMM_PERSEL_I2S_RX 5
+
+typedef struct {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion mmio;
+    union {
+        FLEXCOMM_Type flex;
+    } regs;
+    uint32_t functions;
+    qemu_irq irq;
+    bool irq_state;
+} FlexcommState;
+
+typedef struct {
+    /* argument to pass to functions */
+    void *arg;
+
+    /* function / submodule has been  selected / deselected. */
+    void (*select)(void *o, FlexcommState *s, int f, bool selected);
+
+    /* read register */
+    MemTxResult (*reg_read)(void *o, FlexcommState *s, int f, hwaddr addr,
+                            uint64_t *data, unsigned size);
+
+    /* write register */
+    MemTxResult (*reg_write)(void *o, FlexcommState *s, int f, hwaddr addr,
+                             uint64_t data, unsigned size);
+} FlexcommFunctionOps;
+
+
+void flexcomm_irq(FlexcommState *s, bool irq);
+bool flexcomm_register_ops(int f, void *arg, const FlexcommFunctionOps *ops,
+                          Error **errp);
+void flexcomm_unregister_ops(int f);
+
+#endif /* HW_FLEXCOMM_H */
-- 
2.46.0.rc2.264.g509ed76dc8-goog
