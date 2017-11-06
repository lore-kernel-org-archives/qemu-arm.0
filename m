Received: by 10.223.150.237 with SMTP id u100csp2793265wrb;
        Mon, 6 Nov 2017 07:59:55 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QOYiKzQpx6hBuPo71/XASwpZ1Hk4CJ8TVAsIBdBfIcXz3ltJK8yNqKD/hyhlnftESsuq33
X-Received: by 10.129.81.129 with SMTP id f123mr10532536ywb.104.1509983995360;
        Mon, 06 Nov 2017 07:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983995; cv=none;
        d=google.com; s=arc-20160816;
        b=GsO+sBmJGVz8vAdZE6dR+5GRlq3/1MGBVLz7Bb70HBr+jXs+T09hw5t3q8tu240OoC
         KnBw1oEViaDd08Aa+NLU9lLoQ5PHc9jnBT5rYzR5vWE1c5lhtEPH/Z6dz/Bw32aGKAOg
         99RTa5zxpVAYXHvu5uqEWdYv6u7woxFA86usaAzp78YtqSvqnNKnvUlav56A4GhStwMw
         Z/vsySKvDqarhfDrDQH0JrkFnL2YgntEIARnZf/03o90phPKXIlCYUwNVsmfCPDdm20Z
         HhfTXoDolguEeKF/x1ShzhvC2U/xpLP/288d3tiF9E7IxLv7GxebOsQsflKmkZ1n7xU+
         slnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=tCoZscldDeT4cokJmERb6oJtFhwN19RNB+aTeh/AeVo=;
        b=RCnyXU5tn5MfGvjtY25DCa0EEP7QXu+tk/Z9ktyZ1GR98tPDQbcdcLuaa16xiOcOFH
         WcXAQ88ZpXWMGcI2snwb2tamD+5OvpcxpmKRaCLOijjvsFIWBMKZGTJdTetKIyftoeja
         BAfyWNxFSlUHwsNVmzJfCr+qfd6INSTnJrE9+egoFnK5xf6hO4xC+g8pLpIUieySLFPg
         4difsCt8K8YuRgoxWWtOyGIDDRmiYZS+GXiYgkVSpLBK6cAtet2AMcGCLoeqXcKvI8Ys
         DXJAJi4IWor9AgGCi6hxYX4lh4lZYLyxt9mG2MLtEx/yXWGFnd9CC59k6eLJky3/rAan
         pbjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cYzFG0Fs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19si2716961ybg.641.2017.11.06.07.59.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:59:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cYzFG0Fs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjoY-0008Sv-PX
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:59:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdr-0007Ii-9L
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdo-0000Zg-RC
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:51 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:43233)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdo-0000ZO-Jz; Mon, 06 Nov 2017 10:48:48 -0500
Received: by mail-pf0-x243.google.com with SMTP id a8so8026093pfc.0;
	Mon, 06 Nov 2017 07:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tCoZscldDeT4cokJmERb6oJtFhwN19RNB+aTeh/AeVo=;
	b=cYzFG0FsPtwqSwOeC2ddXW+9wSfHvNnroIonTzrnKhsnBzBcDvkEbxMK/76O3vV5GQ
	vCIsO0WkEenf6oY8BHftZWy+GP+1HVLJifklQfDw2T9XtW9u85K2edX1WiLxP4whGwvJ
	fHF/WeRah8u0EHXJpxgwaPXs3a3lR9KE5qLte7q9Kmv7fSrOsQ7RyX9Sw3XlxHWag/1i
	eqD4RZ3t1yOnrjqNbkAu6tYHj1babzKq6P0oAPs7O3ijc2XNQ3rFqWREvBQLKTx9Bwso
	PntirsDKQNwGFOfwRj0lYr+YwFUUSE3PxK1jhVDBpWwM/n2FZRJav+LdKum6m0khYM6M
	rl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tCoZscldDeT4cokJmERb6oJtFhwN19RNB+aTeh/AeVo=;
	b=Rg5s5qCam78tOcJcxUnYWE8CRszDZks3dQqZLvCqdqZHT5GOYha6UjwHbTNKKPJ55i
	Oe3ogrSOu7JqlpEQRyrjuA8yNqbZDEGsf6SKT+DDnDhKwJ2nA6l4tdzKQbr2ME8FWTfa
	Bmyfgljuy9rTwYTGCugFq3yxsWywfbp2BVTjdkArFDmGWP2OpmsnjfpUoHmza9HrV4Jk
	n032oKxc5lLqeKQMfJXUO8WEOgO6SHVBDtZT/5/9ctb4ElVJsVoNBeoEuqvGnFnFtXu8
	XxzNie5QIN6tEjXc5hKIT8vKSsFSLMyhskEhAm/wmaHXOafI0WJd4zjbAJdOQJfje4+A
	Vo3w==
X-Gm-Message-State: AMCzsaV2o/WXlPja9FlTVOwUzSFVOUomYg5MWs1mcxdfsaDRJttV4uDs
	PJnNlnDaBq8Odkq2CQ/6bLb3mxElGyc=
X-Received: by 10.84.168.129 with SMTP id f1mr14954352plb.71.1509983327381;
	Mon, 06 Nov 2017 07:48:47 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:46 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:48:00 -0800
Message-Id: <20171106154813.19936-18-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v3 17/30] i.MX: Add code to emulate i.MX7 IOMUXC
 IP block
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
X-TUID: G/yxVpGwcAh9

Add minimal code needed to allow upstream Linux guest to boot.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs         |  1 +
 hw/misc/imx7_iomuxc.c         | 99 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx7_iomuxc.h | 22 ++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 hw/misc/imx7_iomuxc.c
 create mode 100644 include/hw/misc/imx7_iomuxc.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 16cee88e0f..492c535330 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -37,6 +37,7 @@ obj-$(CONFIG_IMX) += imx6_src.o
 obj-$(CONFIG_IMX) += imx7_ccm.o
 obj-$(CONFIG_IMX) += imx2_wdt.o
 obj-$(CONFIG_IMX) += imx7_snvs.o
+obj-$(CONFIG_IMX) += imx7_iomuxc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx7_iomuxc.c b/hw/misc/imx7_iomuxc.c
new file mode 100644
index 0000000000..aa26a7485f
--- /dev/null
+++ b/hw/misc/imx7_iomuxc.c
@@ -0,0 +1,99 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX7 IOMUXC block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/misc/imx7_iomuxc.h"
+#include "qemu/log.h"
+
+static void imx7_iomuxc_reset(DeviceState *dev)
+{
+    IMX7IOMUXCState *s = IMX7_IOMUXC(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static uint64_t imx7_iomuxc_read(void *opaque, hwaddr offset,
+                               unsigned size)
+{
+    IMX7IOMUXCState *s = opaque;
+    return s->regs[offset / sizeof(uint32_t)];
+}
+
+static void imx7_iomuxc_write(void *opaque, hwaddr offset,
+                            uint64_t value, unsigned size)
+{
+    IMX7IOMUXCState *s = opaque;
+    s->regs[offset / sizeof(uint32_t)] = value;
+}
+
+static const struct MemoryRegionOps imx7_iomuxc_ops = {
+    .read = imx7_iomuxc_read,
+    .write = imx7_iomuxc_write,
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
+static void imx7_iomuxc_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMX7IOMUXCState *s = IMX7_IOMUXC(obj);
+
+    memory_region_init_io(&s->iomem,
+                          obj,
+                          &imx7_iomuxc_ops,
+                          s,
+                          TYPE_IMX7_IOMUXC ".iomem",
+                          sizeof(s->regs));
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_imx7_iomuxc = {
+    .name = TYPE_IMX7_IOMUXC,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, IMX7IOMUXCState, IOMUXC_NUM),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void imx7_iomuxc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = imx7_iomuxc_reset;
+    dc->vmsd  = &vmstate_imx7_iomuxc;
+    dc->desc  = "i.MX IOMUXC Module";
+}
+
+static const TypeInfo imx7_iomuxc_info = {
+    .name          = TYPE_IMX7_IOMUXC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMX7IOMUXCState),
+    .instance_init = imx7_iomuxc_init,
+    .class_init    = imx7_iomuxc_class_init,
+};
+
+static void imx7_iomuxc_register_type(void)
+{
+    type_register_static(&imx7_iomuxc_info);
+}
+type_init(imx7_iomuxc_register_type)
diff --git a/include/hw/misc/imx7_iomuxc.h b/include/hw/misc/imx7_iomuxc.h
new file mode 100644
index 0000000000..7041a1ff42
--- /dev/null
+++ b/include/hw/misc/imx7_iomuxc.h
@@ -0,0 +1,22 @@
+#ifndef IMX7_IOMUXC_H
+#define IMX7_IOMUXC_H
+
+#include "hw/sysbus.h"
+
+enum IMX7IOMUXCRegisters {
+    IOMUXC_NUM = 0x740 / sizeof(uint32_t),
+};
+
+typedef struct IMX7IOMUXCState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    uint32_t     regs[IOMUXC_NUM];
+} IMX7IOMUXCState;
+
+#define TYPE_IMX7_IOMUXC "imx7-iomuxc"
+#define IMX7_IOMUXC(obj) OBJECT_CHECK(IMX7IOMUXCState, (obj), TYPE_IMX7_IOMUXC)
+
+#endif /* IMX7_IOMUXC_H */
-- 
2.13.6

