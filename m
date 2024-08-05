Received: by 2002:a17:505:1e8b:b0:1be9:327d:8ee3 with SMTP id mw11csp986566njb;
        Mon, 5 Aug 2024 13:17:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVmISiHWs1Osbj0W6ULrzuMrLfBr9tTPY8cVWbV1Um9Q7W7W9CbKnnBzLXhCkZC0A75JIG4F5PX+TQQHhWg/XUrXCDRBzxc
X-Received: by 2002:a17:90a:c38a:b0:2cd:b938:770b with SMTP id 98e67ed59e1d1-2cff93c8c07mr10867855a91.5.1722889079082;
        Mon, 05 Aug 2024 13:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722889079; cv=none;
        d=google.com; s=arc-20160816;
        b=RBW0+nTJu4d0UsXjf6JufA83ozCKhd55l8qyeI6e8jg1BjXrF1KyPrX38fxCqIOKyI
         Gm0NaPg0yW/0rXlT2hLrqRfd6VFQIY1VB41z++jGGkl6CbKjZC6FBW+lxeE1/WUhiOWV
         DC/fzgsGn8HC4KLtSNgmUH15g9zoYZEJZGRG9+iqZanDP3I1ImQ2JZGTSox1dM02Mff9
         H0eiClthaYBgHbv6/7e94qRqMgmNZl0dRvlT39ULV1Hyokb2wZdMUYjS0vPujiN6wKrn
         MfsSaMBrFVsAFYbxRLUY1Dav/B+1CsKT976C8KdD57TZnov9OIH+5L3TfCcxrcXLia25
         XI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=u4G3+QfEQuPGYkcQf8AOgE2UDxpBxkJrxB1kWGdX9cU=;
        fh=zXZxe0qi4Tqd5K8gnXwQ6mmIQYKIZuxTYOpe6aNif0w=;
        b=NI+XQOoy1Udo6jKCxbAeVzW72ttXK5gO2qp1DlQFudJRFMbZXUzPB+EWSmVkFYTUVq
         ZjOzNo4cWXJovjheza8R+mG+sMa9mQywDj8BM9/3WNjU+SmsM/5uVgXR2RZYuUcA+gQQ
         /VDPbnkyNnQgeabvCMNyDU80K89hsAN3aScCvm7WWElBwtPz+Dgc0aKsgYcQVAAkuaWy
         MqviCAmzqDU6XzrGtj7NvWyXoRR/yekVq5JCH/sC9O2I8CkQmV4a/WC1+ajvxXe6b0sf
         FD4LG8oIGQhRHO7spQGbYrKrnBQkHVzb03lvWiT3E+EBmnrGNqUPukycW/P9L2ciTMiI
         pmag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="MkvC+/QF";
       spf=pass (google.com: domain of 3djoxzgukc90s9uhofnnfkd.bnl9kdw.admmddkhm9qn.nqf@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3djOxZgUKC90S9UHOFNNFKD.BNL9KDW.ADMMDDKHM9QN.NQF@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <3djOxZgUKC90S9UHOFNNFKD.BNL9KDW.ADMMDDKHM9QN.NQF@flex--tavip.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2cffbc8adafsor6626040a91.3.2024.08.05.13.17.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2024 13:17:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3djoxzgukc90s9uhofnnfkd.bnl9kdw.admmddkhm9qn.nqf@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="MkvC+/QF";
       spf=pass (google.com: domain of 3djoxzgukc90s9uhofnnfkd.bnl9kdw.admmddkhm9qn.nqf@flex--tavip.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3djOxZgUKC90S9UHOFNNFKD.BNL9KDW.ADMMDDKHM9QN.NQF@flex--tavip.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722889078; x=1723493878; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u4G3+QfEQuPGYkcQf8AOgE2UDxpBxkJrxB1kWGdX9cU=;
        b=MkvC+/QFhURt1i/Kg5Rp3Wkr5mRb0URdOrDqnM7HEcaKCxXSS7Qap2DEcmAXMTAm7S
         ax3m3Bx+wfR8ML4sYVAexruIYYFmF+CTmI1Xr8X4/Q2fHPa4BItQSyD9cM0TXOhaNr4l
         isPcZuAxLozVLPr1Qx9f85RC99HvimJ6ZymGkmI4a9Q/Z/yZGiHG24eXYbML0OL7qb4+
         wtztf47zv2DGL9JGj+6mOrcEiIdYp0ixm2ixlNmUSCmdKHuSNKTX+z3F3NvBCnHcSXQ7
         +Fra9HtslEGAXwb7tMrLlQPUXL9BYHCicEYXYTQNHInyOQxf7uuxgPshDjaoKZagZeCg
         RsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722889078; x=1723493878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u4G3+QfEQuPGYkcQf8AOgE2UDxpBxkJrxB1kWGdX9cU=;
        b=sVNyRHQhWt39x7XQyms/hEkyPbleNJ66W7S/Qr7y2rfnS1GknCrwzd3gjAhcztLUt5
         8Sh5VYGYNR8ZIiW0YGaJ2Ip7+/lRVniv9yC5g0jcQ3jVL0VPnrwul8qwR9vJFUwebJhd
         lxq5nSi8m5MisGYuK/omqztzJo0LLi47IP/mFoMI8zK6HMOVv3BOqqnw7XYozHY/Xj3Y
         85CQNKmgouvdz8phSpKUgKJJJSV/AuX76a52XCn3b/qrLXiACQ+Pc1MOY24DKHCJYZB0
         CR4/v629K/0y6ZdJODf/TlnEpm5jj5iZyRbD81jBdEgyAzgMBkiTDPxOZBgIKFtkXstd
         s5tA==
X-Forwarded-Encrypted: i=1; AJvYcCVDCL3egmwaCjUDS92QRFz0ndGG40TaVl61DuH+cWWv/vxYdz1yRkrTIUPtw8fbvCkEl1osiLNq+oqnA7rLpJDXcGeUT0N/
X-Gm-Message-State: AOJu0YySzYG9UJiVVQ5e0IgO/ATdELZi1glEtJ2kBQVbeAIujliARMGS
	iWICinXXSDYjWq6I4ZW75q0TMdVB/6C0NHs4IYU+wrXDUq+Fs/v1c2GmvO3lBwghI5riEUZHdA=
	=
X-Google-Smtp-Source: AGHT+IFou9H80QB90t2SGEHQlrSm6cRFXg4Q/BYZGtoq36SYjaPwpS566HoPuRH/kcQrZnxxlae98b/Ryw==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a17:90a:6042:b0:2c3:1985:e9c3 with SMTP id
 98e67ed59e1d1-2cff95243c6mr34825a91.3.1722889078446; Mon, 05 Aug 2024
 13:17:58 -0700 (PDT)
Date: Mon,  5 Aug 2024 13:17:16 -0700
In-Reply-To: <20240805201719.2345596-1-tavip@google.com>
Mime-Version: 1.0
References: <20240805201719.2345596-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Message-ID: <20240805201719.2345596-22-tavip@google.com>
Subject: [RFC PATCH 21/23] hw/misc: add support for RT500 reset controller
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
	alex.bennee@linaro.org, thuth@redhat.com, peter.maydell@linaro.org, 
	marcandre.lureau@redhat.com, alistair@alistair23.me, berrange@redhat.com, 
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: MOTwRFTsnpyZ

The RT500 reset controller has two instances that have the same
register layout but with different fields for some registers.

The model only provides set and clear functionality for the various
reset lines which is common for both instances. Because of that only
one type is implemented for both controllers.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 hw/arm/svd/meson.build         |   8 ++
 hw/misc/Kconfig                |   3 +
 hw/misc/meson.build            |   1 +
 hw/misc/rt500_rstctl.c         | 219 +++++++++++++++++++++++++++++++++
 hw/misc/trace-events           |   4 +
 include/hw/misc/rt500_rstctl.h |  38 ++++++
 6 files changed, 273 insertions(+)
 create mode 100644 hw/misc/rt500_rstctl.c
 create mode 100644 include/hw/misc/rt500_rstctl.h

diff --git a/hw/arm/svd/meson.build b/hw/arm/svd/meson.build
index 22f75880f5..72a7421c6f 100644
--- a/hw/arm/svd/meson.build
+++ b/hw/arm/svd/meson.build
@@ -26,3 +26,11 @@ genh += custom_target('flexspi.h',
                       output: 'flexspi.h',
                       input: 'MIMXRT595S_cm33.xml',
                       command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'FLEXSPI0', '-t', 'FLEXSPI'])
+genh += custom_target('rt500_rstctl0.h',
+                      output: 'rt500_rstctl0.h',
+                      input: 'MIMXRT595S_cm33.xml',
+                      command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'RSTCTL0', '-t', 'RT500_RSTCTL0'])
+genh += custom_target('rt500_rstctl1.h',
+                      output: 'rt500_rstctl1.h',
+                      input: 'MIMXRT595S_cm33.xml',
+                      command: [ svd_gen_header, '-i', '@INPUT@', '-o', '@OUTPUT@', '-p', 'RSTCTL1', '-t', 'RT500_RSTCTL1'])
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 392ae9e84f..70a2a269ac 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -222,4 +222,7 @@ config RT500_CLKCTL0
 config RT500_CLKCTL1
     bool
 
+config RT500_RSTCTL
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 68929949a6..5e2728e982 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -160,3 +160,4 @@ system_ss.add(when: 'CONFIG_LASI', if_true: files('lasi.c'))
 system_ss.add(when: 'CONFIG_FLEXCOMM', if_true: files('flexcomm.c'))
 system_ss.add(when: 'CONFIG_RT500_CLKCTL0', if_true: files('rt500_clkctl0.c'))
 system_ss.add(when: 'CONFIG_RT500_CLKCTL1', if_true: files('rt500_clkctl1.c'))
+system_ss.add(when: 'CONFIG_RT500_RSTCTL', if_true: files('rt500_rstctl.c'))
diff --git a/hw/misc/rt500_rstctl.c b/hw/misc/rt500_rstctl.c
new file mode 100644
index 0000000000..2806a94150
--- /dev/null
+++ b/hw/misc/rt500_rstctl.c
@@ -0,0 +1,219 @@
+/*
+ * QEMU model for RT500 Reset Controller
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
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "exec/address-spaces.h"
+#include "hw/regs.h"
+#include "hw/misc/rt500_rstctl.h"
+
+#include "trace.h"
+
+/*
+ * There are two intances for RSTCTL with the same register names but
+ * with different fields.
+ */
+#define reg(field) offsetof(RT500_RSTCTL0_Type, field)
+#define regi(x) (reg(x) / sizeof(uint32_t))
+#define REG_NO (sizeof(RT500_RSTCTL0_Type) / sizeof(uint32_t))
+
+#define RSTCTL_SYSRSTSTAT_WMASK (BITS(7, 4) | BIT(0))
+#define RSTCL0_PRSCTL0_WMASK (BITS(30, 26) | BITS(24, 20) | BIT(18) | \
+                              BIT(16) | BITS(12, 8) | BIT(3) | BIT(1))
+#define RSTCL0_PRSCTL1_WMASK (BIT(24) | BITS(16, 15) | BITS(3, 2))
+#define RSTCL0_PRSCTL2_WMASK (BITS(1, 0))
+#define RSTCL1_PRSCTL0_WMASK (BIT(29) | BIT(27) |  BITS(25, 8))
+#define RSTCL1_PRSCTL1_WMASK (BIT(31) | BITS(29, 28) | BITS(24, 23) | \
+                              BIT(16) | BITS(7, 0))
+#define RSTCL1_PRSCTL2_WMASK (BITS(31, 30) | BITS(17, 16) | BIT(10) | \
+                              BIT(8) | BITS(4, 0))
+
+static RT500_RSTCTL0_REGISTER_NAMES_ARRAY(reg_names);
+
+static MemTxResult rt500_rstctl_read(void *opaque, hwaddr addr,
+                                     uint64_t *data, unsigned size,
+                                     MemTxAttrs attrs)
+{
+    RT500RstCtlState *s = opaque;
+    MemTxResult ret = MEMTX_OK;
+
+    if (s->num > 1 || !reg32_aligned_access(addr, size)) {
+        ret = MEMTX_ERROR;
+        goto out;
+    }
+
+    switch (addr) {
+    case reg(SYSRSTSTAT):
+    case reg(PRSTCTL0):
+    case reg(PRSTCTL1):
+    case reg(PRSTCTL2):
+        *data = reg32_read(&s->regs.ctl0, addr);
+        break;
+    default:
+        ret = MEMTX_ERROR;
+    }
+
+out:
+    trace_rt500_rstctl_reg_read(DEVICE(s)->id, reg_names[addr], addr, *data);
+    return ret;
+}
+
+static MemTxResult rt500_rstctl_write(void *opaque, hwaddr addr,
+                                      uint64_t value, unsigned size,
+                                      MemTxAttrs attrs)
+{
+    RT500RstCtlState *s = opaque;
+    static uint32_t mask0[REG_NO] = {
+        [regi(SYSRSTSTAT)] = RSTCTL_SYSRSTSTAT_WMASK,
+        [regi(PRSTCTL0)] = RSTCL0_PRSCTL0_WMASK,
+        [regi(PRSTCTL1)] = RSTCL0_PRSCTL1_WMASK,
+        [regi(PRSTCTL2)] = RSTCL0_PRSCTL2_WMASK,
+        [regi(PRSTCTL0_SET)] = RSTCL0_PRSCTL0_WMASK,
+        [regi(PRSTCTL1_SET)] = RSTCL0_PRSCTL1_WMASK,
+        [regi(PRSTCTL2_SET)] = RSTCL0_PRSCTL2_WMASK,
+        [regi(PRSTCTL0_CLR)] = RSTCL0_PRSCTL0_WMASK,
+        [regi(PRSTCTL1_CLR)] = RSTCL0_PRSCTL1_WMASK,
+        [regi(PRSTCTL2_CLR)] = RSTCL0_PRSCTL2_WMASK,
+    };
+    static uint32_t mask1[REG_NO] = {
+        [regi(SYSRSTSTAT)] = RSTCTL_SYSRSTSTAT_WMASK,
+        [regi(PRSTCTL0)] = RSTCL1_PRSCTL0_WMASK,
+        [regi(PRSTCTL1)] = RSTCL1_PRSCTL1_WMASK,
+        [regi(PRSTCTL2)] = RSTCL1_PRSCTL2_WMASK,
+        [regi(PRSTCTL0_SET)] = RSTCL1_PRSCTL0_WMASK,
+        [regi(PRSTCTL1_SET)] = RSTCL1_PRSCTL1_WMASK,
+        [regi(PRSTCTL2_SET)] = RSTCL1_PRSCTL2_WMASK,
+        [regi(PRSTCTL0_CLR)] = RSTCL1_PRSCTL0_WMASK,
+        [regi(PRSTCTL1_CLR)] = RSTCL1_PRSCTL1_WMASK,
+        [regi(PRSTCTL2_CLR)] = RSTCL1_PRSCTL2_WMASK,
+    };
+    uint32_t mask;
+
+    trace_rt500_rstctl_reg_write(DEVICE(s)->id, reg_names[addr], addr, value);
+
+    if (s->num > 1 || !reg32_aligned_access(addr, size)) {
+        return MEMTX_ERROR;
+    }
+
+    if (s->num == 0) {
+        mask = mask0[addr / sizeof(uint32_t)];
+    } else {
+        mask = mask1[addr / sizeof(uint32_t)];
+    }
+
+    switch (addr) {
+    case reg(SYSRSTSTAT):
+    {
+        /* write 1 to clear bits */
+        s->regs.ctl0.SYSRSTSTAT &= ~(value & mask);
+        break;
+    }
+    case reg(PRSTCTL0):
+    case reg(PRSTCTL1):
+    case reg(PRSTCTL2):
+    {
+        uint32_t idx = addr / sizeof(uint32_t);
+
+        s->regs.raw[idx] = (value & mask);
+        break;
+    }
+    case reg(PRSTCTL0_SET):
+    case reg(PRSTCTL1_SET):
+    case reg(PRSTCTL2_SET):
+    {
+        uint32_t idx;
+
+        idx = (reg(PRSTCTL0) + (addr - reg(PRSTCTL0_SET))) / sizeof(uint32_t);
+        s->regs.raw[idx] |= (value & mask);
+        break;
+    }
+    case reg(PRSTCTL0_CLR):
+    case reg(PRSTCTL1_CLR):
+    case reg(PRSTCTL2_CLR):
+    {
+        uint32_t idx;
+
+        idx = (reg(PRSTCTL0) + (addr - reg(PRSTCTL0_CLR))) / sizeof(uint32_t);
+        s->regs.raw[idx] &= ~(value & mask);
+        break;
+    }
+    }
+
+    return MEMTX_OK;
+}
+
+
+static const MemoryRegionOps rt500_rstctl_ops = {
+    .read_with_attrs = rt500_rstctl_read,
+    .write_with_attrs = rt500_rstctl_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static Property rt500_rstctl_properties[] = {
+    DEFINE_PROP_UINT32("num", RT500RstCtlState, num, 0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void rt500_rstctl_reset(DeviceState *dev)
+{
+    RT500RstCtlState *s = RT500_RSTCTL(dev);
+
+    memset(&s->regs, 0, sizeof(s->regs));
+
+    switch (s->num) {
+    case 0:
+        rt500_rstctl0_reset_registers(&s->regs.ctl0);
+        break;
+    case 1:
+        rt500_rstctl1_reset_registers(&s->regs.ctl1);
+        break;
+    }
+}
+
+static void rt500_rstctl_init(Object *obj)
+{
+    RT500RstCtlState *s = RT500_RSTCTL(obj);
+
+    memory_region_init_io(&s->mmio, obj, &rt500_rstctl_ops, s,
+                          TYPE_RT500_RSTCTL, sizeof(s->regs));
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->mmio);
+}
+
+static void rt500_rstctl_realize(DeviceState *dev, Error **errp)
+{
+}
+
+static void rt500_rstctl_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = rt500_rstctl_reset;
+    device_class_set_props(dc, rt500_rstctl_properties);
+    dc->realize = rt500_rstctl_realize;
+}
+
+static const TypeInfo rt500_rstctl_info = {
+    .name          = TYPE_RT500_RSTCTL,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(RT500RstCtlState),
+    .instance_init = rt500_rstctl_init,
+    .class_init    = rt500_rstctl_class_init,
+};
+
+static void rt500_rstctl_register_types(void)
+{
+    type_register_static(&rt500_rstctl_info);
+}
+
+type_init(rt500_rstctl_register_types)
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index e65fcfa613..41a94d5ef6 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -365,3 +365,7 @@ rt500_clkctl0_reg_write(const char *regname, uint32_t addr, uint32_t val) "%s[0x
 # rt500_clkctl1.c
 rt500_clkctl1_reg_read(const char *regname, uint32_t addr, uint32_t val) "%s[0x%04x] -> 0x%08x"
 rt500_clkctl1_reg_write(const char *regname, uint32_t addr, uint32_t val) "%s[0x%04x] <- 0x%08x"
+
+# rt500_rstctl.c
+rt500_rstctl_reg_read(const char *id, const char *regname, uint32_t addr, uint32_t val) "%s: %s[0x%04x] -> 0x%08x"
+rt500_rstctl_reg_write(const char *id, const char *regname, uint32_t addr, uint32_t val) "%s: %s[0x%04x] <- 0x%08x"
diff --git a/include/hw/misc/rt500_rstctl.h b/include/hw/misc/rt500_rstctl.h
new file mode 100644
index 0000000000..d9726df5f6
--- /dev/null
+++ b/include/hw/misc/rt500_rstctl.h
@@ -0,0 +1,38 @@
+/*
+ * QEMU model for RT500 Reset Controller
+ *
+ * Copyright (c) 2024 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_MISC_RT500_RSTCTL_H
+#define HW_MISC_RT500_RSTCTL_H
+
+#include "hw/arm/svd/rt500_rstctl0.h"
+#include "hw/arm/svd/rt500_rstctl1.h"
+#include "hw/sysbus.h"
+
+#define RSTCTL_Type RSTCTL0_Type
+
+#define TYPE_RT500_RSTCTL "rt500-rstctl"
+#define RT500_RSTCTL(o) OBJECT_CHECK(RT500RstCtlState, o, TYPE_RT500_RSTCTL)
+
+typedef struct {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    /* <public> */
+    MemoryRegion mmio;
+    uint32_t num;
+    union {
+        RT500_RSTCTL0_Type ctl0;
+        RT500_RSTCTL1_Type ctl1;
+        uint32_t raw[sizeof(RT500_RSTCTL0_Type) / sizeof(uint32_t)];
+    } regs;
+} RT500RstCtlState;
+
+#endif /* HW_MISC_RT500_RSTCTL_H */
-- 
2.46.0.rc2.264.g509ed76dc8-goog
