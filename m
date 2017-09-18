Received: by 10.223.172.38 with SMTP id v35csp4142779wrc;
        Mon, 18 Sep 2017 12:58:05 -0700 (PDT)
X-Received: by 10.200.47.173 with SMTP id l42mr52997711qta.298.1505764685246;
        Mon, 18 Sep 2017 12:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764685; cv=none;
        d=google.com; s=arc-20160816;
        b=FBRoxMK2JnH9p1qKwyOwc+98DGeZKoXrKg6FnMBmzKf/8dfRcFtCNhe6h+fPLDOl3R
         qrAezuq0Jc21nW8vNsvkYWrUQ2T1l0iM3CUO2Gj3d3p/WxvJs1IfUywB+6E85CObdfc/
         P1ROvJ8OiizZ5I5QwUrSCEjrKMvi3VBm+cKyNdHjg1+PSCL1yVoBOqCRuMs5aEVHpIwp
         UYTFOKVGlkcHIcQTLfafMsAFzEOTK/4clNIuFIpcHGHifjrqL45CJ/mooC9ytHz0WpmT
         HZP7ma3D4HerQ3swesWQIa6+/r6k1FV5DY4o1/WrtLC4kd0QyxOVUPPy9+9HHacWvpHc
         8EcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rNTOyGdpqrp69xWDEXneM3b6FC7W3sCUr5/OAM9bt5w=;
        b=I6mXbSjeuWhJLpowH5s7XOG4uwF/3FIdEgwK3llOY1BkP6r/GvU2e4oZYygNEv+7Yk
         OE3YHhh2vCH0T9rU5FTLjcXIK36FQY6pIa6wtV7XdrkeCi51uP51Urv0Wya0QGF0hs/D
         qHmIGsQnuZ2mLWzE88pI0BQ5dLMKgykEODu+rOCIw1e+cvTIh5wpUgTPEOWLaZ1e80c8
         1ML1eax7Xk7cZuF5r6VoOOTRAActUVGHPH9er5Mt83YTC+nxGHqgE6HFj6ykh0hj+oQC
         O54stJrs40WFaBPwyJlN5QmB7pgRJQZYQsoOmSQ3+ttKsVqG3bhZRYCNkyOn9qNcKPdn
         R/Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MB6wIWye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c31si7890358qtc.497.2017.09.18.12.58.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MB6wIWye;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du2B8-000473-V2
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:58:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24x-0006ta-HQ
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24w-0006L6-2P
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:39 -0400
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:34993)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24v-0006K6-Qe; Mon, 18 Sep 2017 15:51:37 -0400
Received: by mail-pg0-x244.google.com with SMTP id j16so775300pga.2;
	Mon, 18 Sep 2017 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rNTOyGdpqrp69xWDEXneM3b6FC7W3sCUr5/OAM9bt5w=;
	b=MB6wIWyec9YzaGm66O4ZIXnhb6rdC6vsSG8tetUh3dtqlI2KKf2zlDE2ZkgWPGsB37
	Y1I8jzHbhD8KWRHDCXH5OZh17e8NudnU0FgwHGd4+ZpKLNzJyNw6eiyCE6lZ9WDKMH8n
	zIZgMBHgu8SuuBhEHdv+UuOUiZLqGHy8t/L0aTykON5bTPuZJ0pYx7/mWj+7qJ3TqB4P
	HIrg5IJ4iq0+TqvKSTd9HVjc2TJONpQoHGLYYU87K2l39nCj4gjLLBMr066XYh+WDPn0
	K4x7q4LB5HqUknoEo9pqNUpZg4knHhDp6JaSKuiMsV8tbit9YUuUduhoBrEIDZlJj0FL
	614Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rNTOyGdpqrp69xWDEXneM3b6FC7W3sCUr5/OAM9bt5w=;
	b=fBn4sayhQdAIfWEvx9rgjzZ/7S4XgAV9xnS7cGx6xGvqRj5RviB6DXPw+Ap2q8mIO+
	cLSjhVWe+9jiNiKOtqmKg8sWs9uyoipboe0QJasp8v7BbmGUooKBFizNH4wgp0qt8I1U
	+luPqflzh38nWEy9Wn30z17IdrDR5azIGXLSm0nbOP9Gk7EC/aUBmNlC3IjdqWU28zhM
	rsfTJRQFkYdbe7826xcZoSxGQVt82nfnCksgMV0ur0kiDA0iCyiKrwy+hW3vyvPzcNXH
	3h3gUmrrdW4YR5wLwbfpBJPPwA2eN6klTEFtTdJmBEzbFYNmuFRM+O0QIwGzbnk03Gj1
	44fQ==
X-Gm-Message-State: AHPjjUhq5mkZL3kv6NnztvtBUAehzrQnbNXzyr7eUH+KoBqQCxD6vjt9
	1yAaURg+mzIvJs6ByDc=
X-Google-Smtp-Source: ADKCNb50nJG30hganSkCBTk70wfbySr+rDyPxy6sDC+aB3NwrLM9+VwWEfQOTNn87BlMV4R7Tp/R8A==
X-Received: by 10.84.252.130 with SMTP id y2mr35757465pll.68.1505764296589;
	Mon, 18 Sep 2017 12:51:36 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:35 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:55 -0700
Message-Id: <20170918195100.17593-13-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH 12/17] i.MX: Add i.MX7 CCM, PMU and ANALOG device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jk8IpsTzw1jt

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs      |   1 +
 hw/misc/imx7_ccm.c         | 201 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx7_ccm.h |  76 +++++++++++++++++
 3 files changed, 278 insertions(+)
 create mode 100644 hw/misc/imx7_ccm.c
 create mode 100644 include/hw/misc/imx7_ccm.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 29fb922cef..ac1be05a03 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -34,6 +34,7 @@ obj-$(CONFIG_IMX) += imx31_ccm.o
 obj-$(CONFIG_IMX) += imx25_ccm.o
 obj-$(CONFIG_IMX) += imx6_ccm.o
 obj-$(CONFIG_IMX) += imx6_src.o
+obj-$(CONFIG_IMX) += imx7_ccm.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c
new file mode 100644
index 0000000000..418aafe7cc
--- /dev/null
+++ b/hw/misc/imx7_ccm.c
@@ -0,0 +1,201 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 CCM, PMU and ANALOG IP blocks emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/sizes.h"
+#include "hw/misc/imx7_ccm.h"
+#include "qemu/log.h"
+
+static uint32_t imx7_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
+{
+    /*
+     * This function is "consumed" by GPT emulation code, however on
+     * i.MX7 each GPT block can have their own clock root. This means
+     * that this functions needs somehow to know requester's identity
+     * and the way to pass it: be it via additional IMXClk constants
+     * or by adding another argument to this method needs to be
+     * figured out
+     */
+    qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Not implemented\n",
+                  TYPE_IMX7_CCM, __func__);
+    return 0;
+}
+
+static void imx7_ccm_reset(DeviceState *dev)
+{
+    IMX7CCMState *s = IMX7_CCM(dev);
+
+    s->analog[CCM_ANALOG_PLL_ARM]         = 0x00002042;
+    s->analog[CCM_ANALOG_PLL_DDR]         = 0x0060302c;
+    s->analog[CCM_ANALOG_PLL_DDR_SS]      = 0x00000000;
+    s->analog[CCM_ANALOG_PLL_DDR_NUM]     = 0x06aaac4d;
+    s->analog[CCM_ANALOG_PLL_DDR_DENOM]   = 0x100003ec;
+    s->analog[CCM_ANALOG_PLL_480]         = 0x00002000;    
+    s->analog[CCM_ANALOG_PLL_480A]        = 0x52605a56;
+    s->analog[CCM_ANALOG_PLL_480B]        = 0x52525216;
+    s->analog[CCM_ANALOG_PLL_ENET]        = 0x00001fc0;
+    s->analog[CCM_ANALOG_PLL_AUDIO]       = 0x0001301b;
+    s->analog[CCM_ANALOG_PLL_AUDIO_SS]    = 0x00000000;
+    s->analog[CCM_ANALOG_PLL_AUDIO_NUM]   = 0x05f5e100;
+    s->analog[CCM_ANALOG_PLL_AUDIO_DENOM] = 0x2964619c;
+    s->analog[CCM_ANALOG_PLL_VIDEO]       = 0x0008201b;
+    s->analog[CCM_ANALOG_PLL_VIDEO_SS]    = 0x00000000;
+    s->analog[CCM_ANALOG_PLL_VIDEO_NUM]   = 0x0000f699;
+    s->analog[CCM_ANALOG_PLL_VIDEO_DENOM] = 0x000f4240;
+    s->analog[CCM_ANALOG_PLL_MISC0]       = 0x00000000;
+
+    /* all PLLs need to be locked */
+    s->analog[CCM_ANALOG_PLL_ARM]   |= CCM_ANALOG_PLL_LOCK;
+    s->analog[CCM_ANALOG_PLL_DDR]   |= CCM_ANALOG_PLL_LOCK;
+    s->analog[CCM_ANALOG_PLL_480]   |= CCM_ANALOG_PLL_LOCK;
+    s->analog[CCM_ANALOG_PLL_480A]  |= CCM_ANALOG_PLL_LOCK;
+    s->analog[CCM_ANALOG_PLL_480B]  |= CCM_ANALOG_PLL_LOCK;
+    s->analog[CCM_ANALOG_PLL_ENET]  |= CCM_ANALOG_PLL_LOCK;
+    s->analog[CCM_ANALOG_PLL_AUDIO] |= CCM_ANALOG_PLL_LOCK;
+    s->analog[CCM_ANALOG_PLL_VIDEO] |= CCM_ANALOG_PLL_LOCK;
+    s->analog[CCM_ANALOG_PLL_MISC0] |= CCM_ANALOG_PLL_LOCK;
+}
+
+#define CCM_INDEX(offset)	(((offset) & ~(hwaddr)0xF) / sizeof(uint32_t))
+#define CCM_BITOP(offset)	((offset) & (hwaddr)0xF)
+
+enum {
+    CCM_BITOP_NONE = 0x00,
+    CCM_BITOP_SET  = 0x04,
+    CCM_BITOP_CLR  = 0x08,
+    CCM_BITOP_TOG  = 0x0C,
+};
+
+static uint64_t imx7_set_clr_tog_read(void *opaque, hwaddr offset,
+                                      unsigned size)
+{
+    const uint32_t *mmio = opaque;
+
+    return (uint64_t)mmio[CCM_INDEX(offset)];
+}
+
+static void imx7_set_clr_tog_write(void *opaque, hwaddr offset,
+                                   uint64_t value, unsigned size)
+{
+    const uint8_t  bitop = CCM_BITOP(offset);
+    const uint32_t index = CCM_INDEX(offset);
+    uint32_t *mmio = opaque;
+
+    switch (bitop) {
+    case CCM_BITOP_NONE:
+        mmio[index]  = value;
+        break;
+    case CCM_BITOP_SET:
+        mmio[index] |= value;
+        break;
+    case CCM_BITOP_CLR:
+        mmio[index] &= ~value;
+        break;
+    case CCM_BITOP_TOG:
+        mmio[index] ^= value;
+        break;
+    };
+}
+
+static const struct MemoryRegionOps imx7_set_clr_tog_ops = {
+    .read = imx7_set_clr_tog_read,
+    .write = imx7_set_clr_tog_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        /*
+         * Our device would not work correctly if the guest was doing
+         * unaligned access. This might not be a limitation on the real
+         * device but in practice there is no reason for a guest to access
+         * this device unaligned.
+         */
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+};
+
+static void imx7_ccm_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMX7CCMState *s = IMX7_CCM(obj);
+
+    memory_region_init(&s->mmio.container, obj, TYPE_IMX7_CCM,
+                       0x30000);
+
+    memory_region_init_io(&s->mmio.analog,
+                          obj,
+                          &imx7_set_clr_tog_ops,
+                          s->analog,
+                          TYPE_IMX7_CCM ".analog",
+                          sizeof(s->analog));
+
+    memory_region_add_subregion(&s->mmio.container,
+                                0x60, &s->mmio.analog);
+
+    memory_region_init_io(&s->mmio.pmu,
+                          obj,
+                          &imx7_set_clr_tog_ops,
+                          s->pmu,
+                          TYPE_IMX7_CCM ".pmu",
+                          sizeof(s->pmu));
+
+    memory_region_add_subregion(&s->mmio.container,
+                                0x200, &s->mmio.pmu);
+    
+    memory_region_init_io(&s->mmio.ccm,
+                          obj,
+                          &imx7_set_clr_tog_ops,
+                          s->ccm,
+                          TYPE_IMX7_CCM ".ccm",
+                          sizeof(s->ccm));
+
+    memory_region_add_subregion(&s->mmio.container,
+                                0x20000, &s->mmio.ccm);
+
+    sysbus_init_mmio(sd, &s->mmio.container);
+}
+
+static const VMStateDescription vmstate_imx7_ccm = {
+    .name = TYPE_IMX7_CCM,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(ccm, IMX7CCMState, CCM_MAX),
+        VMSTATE_UINT32_ARRAY(analog, IMX7CCMState, CCM_ANALOG_MAX),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void imx7_ccm_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    IMXCCMClass *ccm = IMX_CCM_CLASS(klass);
+
+    dc->reset = imx7_ccm_reset;
+    dc->vmsd  = &vmstate_imx7_ccm;
+    dc->desc  = "i.MX7 Clock Control Module";
+
+    ccm->get_clock_frequency = imx7_ccm_get_clock_frequency;
+}
+
+static const TypeInfo imx7_ccm_info = {
+    .name          = TYPE_IMX7_CCM,
+    .parent        = TYPE_IMX_CCM,
+    .instance_size = sizeof(IMX7CCMState),
+    .instance_init = imx7_ccm_init,
+    .class_init    = imx7_ccm_class_init,
+};
+
+static void imx7_ccm_register_type(void)
+{
+    type_register_static(&imx7_ccm_info);
+}
+type_init(imx7_ccm_register_type)
diff --git a/include/hw/misc/imx7_ccm.h b/include/hw/misc/imx7_ccm.h
new file mode 100644
index 0000000000..72ca10a04a
--- /dev/null
+++ b/include/hw/misc/imx7_ccm.h
@@ -0,0 +1,76 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 CCM, PMU and ANALOG IP blocks emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef IMX7_CCM_H
+#define IMX7_CCM_H
+
+#include "hw/misc/imx_ccm.h"
+#include "qemu/bitops.h"
+
+#define REG_SET_CLR_TOG(name)  name, name##_SET, name##_CLR, name##_TOG
+
+enum IMX7AnalogRegisters {
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_ARM),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_DDR),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_DDR_SS),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_DDR_NUM),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_DDR_DENOM),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_480),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_480A),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_480B),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_ENET),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_AUDIO),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_AUDIO_SS),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_AUDIO_NUM),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_AUDIO_DENOM),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_VIDEO),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_VIDEO_SS),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_VIDEO_NUM),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_VIDEO_DENOM),
+    REG_SET_CLR_TOG(CCM_ANALOG_PLL_MISC0),
+
+    CCM_ANALOG_MAX,
+
+    CCM_ANALOG_PLL_LOCK = BIT(31)
+};
+
+enum IMX7CCMRegisters {
+    CCM_MAX = 0xBC80 / sizeof(uint32_t),
+};
+
+enum IMX7PMURegisters {
+    PMU_MAX = 0x140 / sizeof(uint32_t),
+};
+
+#undef REG_SET_CLR_TOG
+
+#define TYPE_IMX7_CCM "imx7.ccm"
+#define IMX7_CCM(obj) OBJECT_CHECK(IMX7CCMState, (obj), TYPE_IMX7_CCM)
+
+typedef struct IMX6CCMState {
+    /* <private> */
+    IMXCCMState parent_obj;
+
+    /* <public> */
+    struct {
+        MemoryRegion container;
+        MemoryRegion ccm;
+        MemoryRegion pmu;
+        MemoryRegion analog;
+    } mmio;
+
+    uint32_t ccm[CCM_MAX];
+    uint32_t pmu[PMU_MAX];
+    uint32_t analog[CCM_ANALOG_MAX];
+
+} IMX7CCMState;
+
+#endif /* IMX7_CCM_H */
-- 
2.13.5

