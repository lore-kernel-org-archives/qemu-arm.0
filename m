Received: by 10.28.173.206 with SMTP id w197csp3377052wme;
        Mon, 15 Jan 2018 17:38:22 -0800 (PST)
X-Google-Smtp-Source: ACJfBotUlNu9L1tKSIoGeeHbYbPHxTxjSAx2AUNTN+4Em3mPcmVaeqtMFAqnhRNcq7ga4fdlizTU
X-Received: by 10.37.163.165 with SMTP id e34mr32347869ybi.196.1516066701909;
        Mon, 15 Jan 2018 17:38:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516066701; cv=none;
        d=google.com; s=arc-20160816;
        b=PnvY/WSvy5BbSM1Z4OMkphrqC2ISI1QJpvgOWlzBwcw0bA97AAGGX+yFutUAmTsumI
         4Rvoi0TRbQ+Mc8OLWOQJSaNCSH8jYpbHaGko79/LBk85trWPywm3iySHvVYVYPsbhOr+
         0XmmH0BDtS9u4OWiHBoTbI2+WI6P/xu75IAMG09QA4GbAraRc0Hl7iVk38hgvaGXi9Nc
         uiVOlmEjhiRPV3L9chS1B8GavT1yPY3KIKwMuHQHye0/RHDnfPbSynGzLFY2t3xWmd+M
         hjJ5CRUxMhwP4N+SG+q5sNhJPk3d3wpYcBnIyZf5+XguwRDbWI62fO05Q/HM+m483rBg
         vDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=FUh3IfU7bUAJyUqTBRNbRrB0gdz4K8f71go3DP9Dags=;
        b=gL9BDr2Ut6GtwBvh+aehg+3JP/MmGSKAyCMWm9245hZBLOVsJibnTeoL27M4vKCaMA
         ty7JDftTAN+0YhbPIXWWcoX8mlIdU1qt9K7bZFzoH8QJkxzStOpf+NUYbx3Dn6yrXeHA
         pRJ2LFZgJXOu79onVTocE9qZN2LFo+9HtQpNCJAY/6YDLy4YNjDWBoKK7xVFXxFKeJcU
         oC/z//ceb3N21cp8FFP8/ToIJKz1g09kjD0HxaI3pigMZqttgVFDwCRquHQQ6Gk5Ars/
         QvVnzOZogd6JSE6b17mT66pRyBg229IRhojwSFm8oTvzW6vU+Ihi5kEp8dRBGsgslDwY
         6xFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fLyuCqry;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3si225219ybc.68.2018.01.15.17.38.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 17:38:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fLyuCqry;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebGCj-0006Wy-Aa
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 20:38:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGC1-0005zQ-RI
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGBz-0005E4-Vc
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:37 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:39101)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebGBz-0005DD-NO; Mon, 15 Jan 2018 20:37:35 -0500
Received: by mail-pg0-x241.google.com with SMTP id w17so2895040pgv.6;
	Mon, 15 Jan 2018 17:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FUh3IfU7bUAJyUqTBRNbRrB0gdz4K8f71go3DP9Dags=;
	b=fLyuCqryISHnAP3u/eB9wVJoWtbD82QN4Favb10SWOF4ZdSAqal4Hls4C5/ygQ5k7/
	zMwW0u1G6F/cbfs5JahyZD3J4BzNOVDVrmrht1HJlIi4B+KQVsNAzKZHvNbOteyYiwpx
	7olCOhNCM4/wRf5VzurTP0++gIW2Ga3TwfN8TJcKxhCPbpspf5jraXj2PoaAcMz5JAK5
	B7oRWCisfggW+tIrrDaAZiU0hO2EU+mOLyAWhAY3MmJFxFJZlse1E14lzBkD1lLWTtX6
	xZ60ysLokNhu8wUDwo7VpObpIB9LKQ+/peCxbPX5W/GU7pfmrecZuicwXwlzBtOIeIkx
	MGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FUh3IfU7bUAJyUqTBRNbRrB0gdz4K8f71go3DP9Dags=;
	b=Ba72+weY3wS3lN0AwwFCZ+oEV5S19vZhj6VMkJ5z5mdfBvuzfl7W3SQiJNH2s0DP/v
	VCkwBAVZO+A9TdD3NkgJy5H71xHgJc9G4/TmzExgDVZMqK8et99IUbpurtJjs+X5XFpl
	038MlbQL/kRkGPd++sV9v/zUvmN7fr525bHQRuA/CkLEFFcJLmKiBWYavnDoR8CmpVNO
	54gM4SVcveFwtGpRUxTQXQZlBqh4vn+l+1NtivTv6pqyBzoMy9eB3QjpqJdutvqxdked
	IXtrMqig/gdkjaIHjzDdbrz7cFo7aGVI8jdaCIj3Ox8PNztq5Vpc/fuNSbz1SrN1UvHl
	xO3Q==
X-Gm-Message-State: AKwxytcnatJxMjn+cvJCxxP56Aq9oNwPkm9N9pWhEXqphHjBnVurwwSg
	VvhHeOKStw1hUV4yeUphkaSGrn6e
X-Received: by 10.98.7.73 with SMTP id b70mr5483698pfd.39.1516066654437;
	Mon, 15 Jan 2018 17:37:34 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id s65sm1023795pfk.7.2018.01.15.17.37.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 17:37:33 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 17:36:58 -0800
Message-Id: <20180116013709.13830-4-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180116013709.13830-1-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v4 03/14] i.MX: Add code to emulate i.MX7 CCM,
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
X-TUID: kHlEKPjsgFhg

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
 hw/misc/imx7_ccm.c         | 277 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx7_ccm.h | 139 +++++++++++++++++++++++
 3 files changed, 417 insertions(+)
 create mode 100644 hw/misc/imx7_ccm.c
 create mode 100644 include/hw/misc/imx7_ccm.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index d517f83e81..a28e5e49b0 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -33,6 +33,7 @@ obj-$(CONFIG_IMX) += imx31_ccm.o
 obj-$(CONFIG_IMX) += imx25_ccm.o
 obj-$(CONFIG_IMX) += imx6_ccm.o
 obj-$(CONFIG_IMX) += imx6_src.o
+obj-$(CONFIG_IMX) += imx7_ccm.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c
new file mode 100644
index 0000000000..23855df02a
--- /dev/null
+++ b/hw/misc/imx7_ccm.c
@@ -0,0 +1,277 @@
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
+static void imx7_analog_reset(DeviceState *dev)
+{
+    IMX7AnalogState *s = IMX7_ANALOG(dev);
+
+    memset(s->pmu, 0, sizeof(s->pmu));
+    memset(s->analog, 0, sizeof(s->analog));
+
+    s->analog[ANALOG_PLL_ARM]         = 0x00002042;
+    s->analog[ANALOG_PLL_DDR]         = 0x0060302c;
+    s->analog[ANALOG_PLL_DDR_SS]      = 0x00000000;
+    s->analog[ANALOG_PLL_DDR_NUM]     = 0x06aaac4d;
+    s->analog[ANALOG_PLL_DDR_DENOM]   = 0x100003ec;
+    s->analog[ANALOG_PLL_480]         = 0x00002000;
+    s->analog[ANALOG_PLL_480A]        = 0x52605a56;
+    s->analog[ANALOG_PLL_480B]        = 0x52525216;
+    s->analog[ANALOG_PLL_ENET]        = 0x00001fc0;
+    s->analog[ANALOG_PLL_AUDIO]       = 0x0001301b;
+    s->analog[ANALOG_PLL_AUDIO_SS]    = 0x00000000;
+    s->analog[ANALOG_PLL_AUDIO_NUM]   = 0x05f5e100;
+    s->analog[ANALOG_PLL_AUDIO_DENOM] = 0x2964619c;
+    s->analog[ANALOG_PLL_VIDEO]       = 0x0008201b;
+    s->analog[ANALOG_PLL_VIDEO_SS]    = 0x00000000;
+    s->analog[ANALOG_PLL_VIDEO_NUM]   = 0x0000f699;
+    s->analog[ANALOG_PLL_VIDEO_DENOM] = 0x000f4240;
+    s->analog[ANALOG_PLL_MISC0]       = 0x00000000;
+
+    /* all PLLs need to be locked */
+    s->analog[ANALOG_PLL_ARM]   |= ANALOG_PLL_LOCK;
+    s->analog[ANALOG_PLL_DDR]   |= ANALOG_PLL_LOCK;
+    s->analog[ANALOG_PLL_480]   |= ANALOG_PLL_LOCK;
+    s->analog[ANALOG_PLL_480A]  |= ANALOG_PLL_LOCK;
+    s->analog[ANALOG_PLL_480B]  |= ANALOG_PLL_LOCK;
+    s->analog[ANALOG_PLL_ENET]  |= ANALOG_PLL_LOCK;
+    s->analog[ANALOG_PLL_AUDIO] |= ANALOG_PLL_LOCK;
+    s->analog[ANALOG_PLL_VIDEO] |= ANALOG_PLL_LOCK;
+    s->analog[ANALOG_PLL_MISC0] |= ANALOG_PLL_LOCK;
+
+    /*
+     * Since I couldn't find any info about this in the reference
+     * manual the value of this register is based strictly on matching
+     * what Linux kernel expects it to be.
+     */
+    s->analog[ANALOG_DIGPROG]  = 0x720000;
+    /*
+     * Set revision to be 1.0 (Arbitrary choice, no particular
+     * reason).
+     */
+    s->analog[ANALOG_DIGPROG] |= 0x000010;
+}
+
+static void imx7_ccm_reset(DeviceState *dev)
+{
+    IMX7CCMState *s = IMX7_CCM(dev);
+
+    memset(s->ccm, 0, sizeof(s->ccm));
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
+    memory_region_init_io(&s->iomem,
+                          obj,
+                          &imx7_set_clr_tog_ops,
+                          s->ccm,
+                          TYPE_IMX7_CCM ".ccm",
+                          sizeof(s->ccm));
+
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static void imx7_analog_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMX7AnalogState *s = IMX7_ANALOG(obj);
+
+    memory_region_init(&s->mmio.container, obj, TYPE_IMX7_ANALOG,
+                       0x10000);
+
+    memory_region_init_io(&s->mmio.analog,
+                          obj,
+                          &imx7_set_clr_tog_ops,
+                          s->analog,
+                          TYPE_IMX7_ANALOG,
+                          sizeof(s->analog));
+
+    memory_region_add_subregion(&s->mmio.container,
+                                0x60, &s->mmio.analog);
+
+    memory_region_init_io(&s->mmio.pmu,
+                          obj,
+                          &imx7_set_clr_tog_ops,
+                          s->pmu,
+                          TYPE_IMX7_ANALOG ".pmu",
+                          sizeof(s->pmu));
+
+    memory_region_add_subregion(&s->mmio.container,
+                                0x200, &s->mmio.pmu);
+
+    memory_region_init_io(&s->mmio.digprog,
+                          obj,
+                          &imx7_digprog_ops,
+                          &s->analog[ANALOG_DIGPROG],
+                          TYPE_IMX7_ANALOG ".digprog",
+                          sizeof(uint32_t));
+
+    memory_region_add_subregion_overlap(&s->mmio.container,
+                                        0x800, &s->mmio.digprog, 10);
+
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
+        VMSTATE_END_OF_LIST()
+    },
+};
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
+static const VMStateDescription vmstate_imx7_analog = {
+    .name = TYPE_IMX7_ANALOG,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(analog, IMX7AnalogState, ANALOG_MAX),
+        VMSTATE_UINT32_ARRAY(pmu,    IMX7AnalogState, PMU_MAX),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void imx7_analog_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = imx7_analog_reset;
+    dc->vmsd  = &vmstate_imx7_analog;
+    dc->desc  = "i.MX7 Analog Module";
+}
+
+static const TypeInfo imx7_analog_info = {
+    .name          = TYPE_IMX7_ANALOG,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMX7AnalogState),
+    .instance_init = imx7_analog_init,
+    .class_init    = imx7_analog_class_init,
+};
+
+static void imx7_ccm_register_type(void)
+{
+    type_register_static(&imx7_ccm_info);
+    type_register_static(&imx7_analog_info);
+}
+type_init(imx7_ccm_register_type)
diff --git a/include/hw/misc/imx7_ccm.h b/include/hw/misc/imx7_ccm.h
new file mode 100644
index 0000000000..9538f37d98
--- /dev/null
+++ b/include/hw/misc/imx7_ccm.h
@@ -0,0 +1,139 @@
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
+    ANALOG_PLL_ARM,
+    ANALOG_PLL_ARM_SET,
+    ANALOG_PLL_ARM_CLR,
+    ANALOG_PLL_ARM_TOG,
+    ANALOG_PLL_DDR,
+    ANALOG_PLL_DDR_SET,
+    ANALOG_PLL_DDR_CLR,
+    ANALOG_PLL_DDR_TOG,
+    ANALOG_PLL_DDR_SS,
+    ANALOG_PLL_DDR_SS_SET,
+    ANALOG_PLL_DDR_SS_CLR,
+    ANALOG_PLL_DDR_SS_TOG,
+    ANALOG_PLL_DDR_NUM,
+    ANALOG_PLL_DDR_NUM_SET,
+    ANALOG_PLL_DDR_NUM_CLR,
+    ANALOG_PLL_DDR_NUM_TOG,
+    ANALOG_PLL_DDR_DENOM,
+    ANALOG_PLL_DDR_DENOM_SET,
+    ANALOG_PLL_DDR_DENOM_CLR,
+    ANALOG_PLL_DDR_DENOM_TOG,
+    ANALOG_PLL_480,
+    ANALOG_PLL_480_SET,
+    ANALOG_PLL_480_CLR,
+    ANALOG_PLL_480_TOG,
+    ANALOG_PLL_480A,
+    ANALOG_PLL_480A_SET,
+    ANALOG_PLL_480A_CLR,
+    ANALOG_PLL_480A_TOG,
+    ANALOG_PLL_480B,
+    ANALOG_PLL_480B_SET,
+    ANALOG_PLL_480B_CLR,
+    ANALOG_PLL_480B_TOG,
+    ANALOG_PLL_ENET,
+    ANALOG_PLL_ENET_SET,
+    ANALOG_PLL_ENET_CLR,
+    ANALOG_PLL_ENET_TOG,
+    ANALOG_PLL_AUDIO,
+    ANALOG_PLL_AUDIO_SET,
+    ANALOG_PLL_AUDIO_CLR,
+    ANALOG_PLL_AUDIO_TOG,
+    ANALOG_PLL_AUDIO_SS,
+    ANALOG_PLL_AUDIO_SS_SET,
+    ANALOG_PLL_AUDIO_SS_CLR,
+    ANALOG_PLL_AUDIO_SS_TOG,
+    ANALOG_PLL_AUDIO_NUM,
+    ANALOG_PLL_AUDIO_NUM_SET,
+    ANALOG_PLL_AUDIO_NUM_CLR,
+    ANALOG_PLL_AUDIO_NUM_TOG,
+    ANALOG_PLL_AUDIO_DENOM,
+    ANALOG_PLL_AUDIO_DENOM_SET,
+    ANALOG_PLL_AUDIO_DENOM_CLR,
+    ANALOG_PLL_AUDIO_DENOM_TOG,
+    ANALOG_PLL_VIDEO,
+    ANALOG_PLL_VIDEO_SET,
+    ANALOG_PLL_VIDEO_CLR,
+    ANALOG_PLL_VIDEO_TOG,
+    ANALOG_PLL_VIDEO_SS,
+    ANALOG_PLL_VIDEO_SS_SET,
+    ANALOG_PLL_VIDEO_SS_CLR,
+    ANALOG_PLL_VIDEO_SS_TOG,
+    ANALOG_PLL_VIDEO_NUM,
+    ANALOG_PLL_VIDEO_NUM_SET,
+    ANALOG_PLL_VIDEO_NUM_CLR,
+    ANALOG_PLL_VIDEO_NUM_TOG,
+    ANALOG_PLL_VIDEO_DENOM,
+    ANALOG_PLL_VIDEO_DENOM_SET,
+    ANALOG_PLL_VIDEO_DENOM_CLR,
+    ANALOG_PLL_VIDEO_DENOM_TOG,
+    ANALOG_PLL_MISC0,
+    ANALOG_PLL_MISC0_SET,
+    ANALOG_PLL_MISC0_CLR,
+    ANALOG_PLL_MISC0_TOG,
+
+    ANALOG_DIGPROG = 0x800 / sizeof(uint32_t),
+    ANALOG_MAX,
+
+    ANALOG_PLL_LOCK = BIT(31)
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
+#define TYPE_IMX7_CCM "imx7.ccm"
+#define IMX7_CCM(obj) OBJECT_CHECK(IMX7CCMState, (obj), TYPE_IMX7_CCM)
+
+typedef struct IMX7CCMState {
+    /* <private> */
+    IMXCCMState parent_obj;
+
+    /* <public> */
+    MemoryRegion iomem;
+
+    uint32_t ccm[CCM_MAX];
+} IMX7CCMState;
+
+
+#define TYPE_IMX7_ANALOG "imx7.analog"
+#define IMX7_ANALOG(obj) OBJECT_CHECK(IMX7AnalogState, (obj), TYPE_IMX7_ANALOG)
+
+typedef struct IMX7AnalogState {
+    /* <private> */
+    IMXCCMState parent_obj;
+
+    /* <public> */
+    struct {
+        MemoryRegion container;
+        MemoryRegion analog;
+        MemoryRegion digprog;
+        MemoryRegion pmu;
+    } mmio;
+
+    uint32_t analog[ANALOG_MAX];
+    uint32_t pmu[PMU_MAX];
+} IMX7AnalogState;
+
+#endif /* IMX7_CCM_H */
-- 
2.14.3

