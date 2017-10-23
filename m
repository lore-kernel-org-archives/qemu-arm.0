Received: by 10.223.161.27 with SMTP id o27csp237115wro;
        Mon, 23 Oct 2017 13:21:33 -0700 (PDT)
X-Received: by 10.37.50.135 with SMTP id y129mr8893472yby.167.1508790093536;
        Mon, 23 Oct 2017 13:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508790093; cv=none;
        d=google.com; s=arc-20160816;
        b=DCtETDRX0luUtc4QQTjy9QljxnErBGrwgpIUjojXeGZjomjjuaWUxVxm5pnN8hV7f1
         MS3iMkwanvjlSn4SY0bVAXRQnNN1KZB7O41Rqx/TDCgw9jpXGyFdiqgh0399PM0ZPl74
         YXoiuzMJa9V+EvGoN2xblpQengOkG/plhqHKWTkZsYJhbNVZQ8t17CsqiuABMCELIGwo
         3WQHm0xRjnTmIjo5aCaAkvo1uxiwzB2ptVSA6JNh3KRHOAY7jhO2NQ2Gwcrcv6+HSvqx
         gLdjdSLi/KEdhPF0eswT/VwfhmcILKCVBS2/hVGFmd1AdE7WDfyVbFHhkiWxBqQZeqNJ
         UTcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=bef/jTyGiBcNYUKCa1tKbZQ8d/m1ixmPZagOecvBo8E=;
        b=YRTFpTJA4lRtOZEat8Fguttx+1V6NUHWqLgVYk9epXLVTCCqyCuZI28KJdU+yq0i/a
         4qSibmWvwFe575sqa12NFSYaLdiT8TULUFnDmawBg8hzBZaQGWW/yYoaQhVRc4F3IysS
         Ye8hhkXvXI+EIsTJp/kAuSJnBnOgFXYre2WLyGPHnDu1wgmcEBHAuU5KKWGKZ65iTt0r
         J5EnS7XkGVAiBNG8K5fFKUxnB07HlUmwruyw5wsWfpu3GbhkajLcW/U5HJszLDjykW38
         He5Z4yq8qHxsf7pdPHTZwWlyUMoT50Jmbb2Eqm3FqD17QFIfTF7tU/giAqrlSgpt6bPs
         Gh5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UncHKzxS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c65si1356880ywd.700.2017.10.23.13.21.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:21:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UncHKzxS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jE4-0000CD-Ri
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:21:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4O-0000Jn-LA
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4M-0002XC-RB
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:32 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:52103)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4M-0002Wj-GJ; Mon, 23 Oct 2017 16:11:30 -0400
Received: by mail-pg0-x243.google.com with SMTP id p9so12623711pgc.8;
	Mon, 23 Oct 2017 13:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bef/jTyGiBcNYUKCa1tKbZQ8d/m1ixmPZagOecvBo8E=;
	b=UncHKzxS5qtzMLvNM1ry0MiEFj2d4ISThviBBtzw6iSX+IazvpY6QHH9ZqGvyJybhZ
	EC22QepdZFxf2dP2h6uENnVl39B4Q6o7dxeXSMXna6ugfv5iDp367W7+TElCSl/Qrpnc
	0BToQBcJGYBoDW4xfXpz2OgwF1Y+h2eiRlyswekrMIndGg59Ina9GvuI4Rh5gNxX+zZu
	dkIDDw1RnnJTtMjOGppbgxU2tcLryLfDUYgDncMtfWECmJf+NnQutdMLK0KAdh1sEBbk
	K/SZcQ/PObzyC2BfntRAhzal8XopLpROYlUUQjL264HDaKE+Ty9K9P9A3KNbR+IbgZBC
	T5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bef/jTyGiBcNYUKCa1tKbZQ8d/m1ixmPZagOecvBo8E=;
	b=YVUWl9wiE1hcO9c+hS5KarRq+dJMEvhvgSmQ4oZ6O+0ZsQ/Cy0DKj1zBCiWGTKM6gU
	UosA7NDhCarbuErFgCTrfUauMVW2sPiocTuLu2TOFZ5wD+RaX6mucRZitpIaE3YukTLD
	om6kkzYszIutG39GxL0lyzJl3oT7H+vMTaPC7fCF2qpjdKMZOq5R+Oi0Dcp2+/kMJKKe
	QZYfeqBhPZs9wZHArOkCj5R1h9SuKwwHrvHvlJmJOYG/GNWtWPvNfjZYWJbw0YoPtvsm
	DgQoilqiexorGNLaWYUoKckb2b6U951e4gACRMQX+cLOvTPF9OHkVSWq0icZ5Aq6SyyG
	XAFA==
X-Gm-Message-State: AMCzsaW+7wWgNiMQabCeOo+feQ133DDTQsdo9KGjE2SHyVmWANluYiy9
	CL/UxB1ZpOPfl5ODQYFqaL/LMayq
X-Google-Smtp-Source: ABhQp+QHfJv4Qg8jxtJOTvEyNSQ60zGEYbXK0q6B9d4QJxv//WautCVyF4gypJ/P0kEWu69ONvwnYg==
X-Received: by 10.84.176.131 with SMTP id v3mr11142947plb.208.1508789489262;
	Mon, 23 Oct 2017 13:11:29 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:28 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:41 -0700
Message-Id: <20171023201055.21973-14-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH v2 13/27] i.MX: Add code to emulate i.MX7 CCM,
 PMU and ANALOG IP blocks
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wtyT9LEfq2RP

Add minimal code needed to allow upstream Linux guest to boot.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs      |   1 +
 hw/misc/imx7_ccm.c         | 233 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx7_ccm.h | 130 +++++++++++++++++++++++++
 3 files changed, 364 insertions(+)
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
index 0000000000..2876164cfa
--- /dev/null
+++ b/hw/misc/imx7_ccm.c
@@ -0,0 +1,233 @@
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
+#include "qemu/log.h"
+
+#include "hw/misc/imx7_ccm.h"
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
+
+    /*
+     * Since I couldn't find any info about this in the reference
+     * manual the value of this register is based strictly on matching
+     * what Linux kernel expects it to be.
+     */
+    s->analog[CCM_ANALOG_DIGPROG]  = 0x720000;
+    /*
+     * Set revision to be 1.0 (Arbitrary choice, no particular
+     * reason).
+     */
+    s->analog[CCM_ANALOG_DIGPROG] |= 0x000010;
+}
+
+#define CCM_INDEX(offset)   (((offset) & ~(hwaddr)0xF) / sizeof(uint32_t))
+#define CCM_BITOP(offset)   ((offset) & (hwaddr)0xF)
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
+    return mmio[CCM_INDEX(offset)];
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
+    .impl = {
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
+static const struct MemoryRegionOps imx7_digprog_ops = {
+    .read = imx7_set_clr_tog_read,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
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
+    memory_region_init_io(&s->mmio.digprog,
+                          obj,
+                          &imx7_digprog_ops,
+                          &s->analog[CCM_ANALOG_DIGPROG],
+                          TYPE_IMX7_CCM ".digprog",
+                          sizeof(uint32_t));
+
+    memory_region_add_subregion_overlap(&s->mmio.container,
+                                        0x800, &s->mmio.digprog, 10);
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
index 0000000000..0cd6750343
--- /dev/null
+++ b/include/hw/misc/imx7_ccm.h
@@ -0,0 +1,130 @@
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
+enum IMX7AnalogRegisters {
+    CCM_ANALOG_PLL_ARM,
+    CCM_ANALOG_PLL_ARM_SET,
+    CCM_ANALOG_PLL_ARM_CLR,
+    CCM_ANALOG_PLL_ARM_TOG,
+    CCM_ANALOG_PLL_DDR,
+    CCM_ANALOG_PLL_DDR_SET,
+    CCM_ANALOG_PLL_DDR_CLR,
+    CCM_ANALOG_PLL_DDR_TOG,
+    CCM_ANALOG_PLL_DDR_SS,
+    CCM_ANALOG_PLL_DDR_SS_SET,
+    CCM_ANALOG_PLL_DDR_SS_CLR,
+    CCM_ANALOG_PLL_DDR_SS_TOG,
+    CCM_ANALOG_PLL_DDR_NUM,
+    CCM_ANALOG_PLL_DDR_NUM_SET,
+    CCM_ANALOG_PLL_DDR_NUM_CLR,
+    CCM_ANALOG_PLL_DDR_NUM_TOG,
+    CCM_ANALOG_PLL_DDR_DENOM,
+    CCM_ANALOG_PLL_DDR_DENOM_SET,
+    CCM_ANALOG_PLL_DDR_DENOM_CLR,
+    CCM_ANALOG_PLL_DDR_DENOM_TOG,
+    CCM_ANALOG_PLL_480,
+    CCM_ANALOG_PLL_480_SET,
+    CCM_ANALOG_PLL_480_CLR,
+    CCM_ANALOG_PLL_480_TOG,
+    CCM_ANALOG_PLL_480A,
+    CCM_ANALOG_PLL_480A_SET,
+    CCM_ANALOG_PLL_480A_CLR,
+    CCM_ANALOG_PLL_480A_TOG,
+    CCM_ANALOG_PLL_480B,
+    CCM_ANALOG_PLL_480B_SET,
+    CCM_ANALOG_PLL_480B_CLR,
+    CCM_ANALOG_PLL_480B_TOG,
+    CCM_ANALOG_PLL_ENET,
+    CCM_ANALOG_PLL_ENET_SET,
+    CCM_ANALOG_PLL_ENET_CLR,
+    CCM_ANALOG_PLL_ENET_TOG,
+    CCM_ANALOG_PLL_AUDIO,
+    CCM_ANALOG_PLL_AUDIO_SET,
+    CCM_ANALOG_PLL_AUDIO_CLR,
+    CCM_ANALOG_PLL_AUDIO_TOG,
+    CCM_ANALOG_PLL_AUDIO_SS,
+    CCM_ANALOG_PLL_AUDIO_SS_SET,
+    CCM_ANALOG_PLL_AUDIO_SS_CLR,
+    CCM_ANALOG_PLL_AUDIO_SS_TOG,
+    CCM_ANALOG_PLL_AUDIO_NUM,
+    CCM_ANALOG_PLL_AUDIO_NUM_SET,
+    CCM_ANALOG_PLL_AUDIO_NUM_CLR,
+    CCM_ANALOG_PLL_AUDIO_NUM_TOG,
+    CCM_ANALOG_PLL_AUDIO_DENOM,
+    CCM_ANALOG_PLL_AUDIO_DENOM_SET,
+    CCM_ANALOG_PLL_AUDIO_DENOM_CLR,
+    CCM_ANALOG_PLL_AUDIO_DENOM_TOG,
+    CCM_ANALOG_PLL_VIDEO,
+    CCM_ANALOG_PLL_VIDEO_SET,
+    CCM_ANALOG_PLL_VIDEO_CLR,
+    CCM_ANALOG_PLL_VIDEO_TOG,
+    CCM_ANALOG_PLL_VIDEO_SS,
+    CCM_ANALOG_PLL_VIDEO_SS_SET,
+    CCM_ANALOG_PLL_VIDEO_SS_CLR,
+    CCM_ANALOG_PLL_VIDEO_SS_TOG,
+    CCM_ANALOG_PLL_VIDEO_NUM,
+    CCM_ANALOG_PLL_VIDEO_NUM_SET,
+    CCM_ANALOG_PLL_VIDEO_NUM_CLR,
+    CCM_ANALOG_PLL_VIDEO_NUM_TOG,
+    CCM_ANALOG_PLL_VIDEO_DENOM,
+    CCM_ANALOG_PLL_VIDEO_DENOM_SET,
+    CCM_ANALOG_PLL_VIDEO_DENOM_CLR,
+    CCM_ANALOG_PLL_VIDEO_DENOM_TOG,
+    CCM_ANALOG_PLL_MISC0,
+    CCM_ANALOG_PLL_MISC0_SET,
+    CCM_ANALOG_PLL_MISC0_CLR,
+    CCM_ANALOG_PLL_MISC0_TOG,
+
+    CCM_ANALOG_DIGPROG = 0x800 / sizeof(uint32_t),
+    CCM_ANALOG_MAX,
+
+    CCM_ANALOG_PLL_LOCK = BIT(31)
+};
+
+enum IMX7CCMRegisters {
+    CCM_MAX = 0xBE00 / sizeof(uint32_t) + 1,
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
+typedef struct IMX7CCMState {
+    /* <private> */
+    IMXCCMState parent_obj;
+
+    /* <public> */
+    struct {
+        MemoryRegion container;
+        MemoryRegion ccm;
+        MemoryRegion pmu;
+        MemoryRegion analog;
+        MemoryRegion digprog;
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

