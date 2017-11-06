Received: by 10.223.150.237 with SMTP id u100csp2795727wrb;
        Mon, 6 Nov 2017 08:01:51 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RiYFBUC7w3e4XSYOwgwf7CJJl+VKuM9eGBD/PBzWZAixX8ETE7qON2g/o45A2gv56hI707
X-Received: by 10.13.208.197 with SMTP id s188mr10719650ywd.87.1509984111305;
        Mon, 06 Nov 2017 08:01:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509984111; cv=none;
        d=google.com; s=arc-20160816;
        b=X4AtX3F7PYE8PH6RTmdKG0r++qO5Iag6dKesjSnYiwz7Ysj1cxej5mseaH06BryOsd
         e8Hf4U7hNEW4MIbYi0UXMbQmwKSECIpsU0WrQR7VyyrTyAp7lfMHU3u9JINcGmbINg8k
         fL+7bgvG3/FM6navE4qzOKS0BUzF9cZCCxKZ+3TKv5pIoiRVwMJZOKMcZxp7ZJflK25/
         rROYjmx3kSyFMJUgzK1Z2+CBBtNCusxyf/CU47bPllUgIrckhniFfB+yuGaZzxrKdHLL
         RUUSikJZTKTV1wYgxASNiNCldscqftBt2GlbE/SnwgWlC0fcZFVrQ9X0mBdQOuw0+2DW
         Jvcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=jetC9k6voG8at+W2Q+cB1itPOh+JTK0BFpU+SvxVtEY=;
        b=gh9azHX/YUCheDQIThSF8KcOHqz6uoKuVCoqip7ux9JHv2I1V5HDukGOQZjDf6xyF0
         OMH2arH247X6OVtMgvRQVGMxqlyNRPcmk8og9xTCWwePlduqNTAliKbgPSzdGj9rKt5g
         PpSjj+6FWK7bdEIxjpJ5R7Ole1TycRiHvl4IOG7An56lfFVed0KBbSQwZqsYR3WFeyMK
         OHf3sSPwxX4JZHvdMMbSltvcfAF/1PlLnUD5ftldFsnPTP3bh1MGvFINUaxTJ2AjknM4
         m0hWfLmTfaKTXJ8+qeImbesGDvdcRQHcLSeiJkAOUR9Y2D+kf2Dh/CO/TU3JDPrYxykT
         S8xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XskIzSnm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u139si2743698ywc.433.2017.11.06.08.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 08:01:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XskIzSnm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjqQ-0001ig-Ka
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 11:01:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdt-0007Le-PC
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjds-0000cN-Dt
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:53 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:54343)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjds-0000bx-5A; Mon, 06 Nov 2017 10:48:52 -0500
Received: by mail-pf0-x241.google.com with SMTP id n89so8008793pfk.11;
	Mon, 06 Nov 2017 07:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jetC9k6voG8at+W2Q+cB1itPOh+JTK0BFpU+SvxVtEY=;
	b=XskIzSnmFYEszP436Ggnynrl73I/IBWN3CF+9kp0J57uToJnpSZTZNXDooVw2roC0W
	e+D+HMnr4AdezaPOo9B3M5kv4e0CKEY49LUUDRN/oY6Bca+eom9T8CWFHBVIo2du2JJy
	U0vmvu4bKssQ3kULaVFtC2n+WJcrm64OF/1+S138TyvNRsAynpiwKn4lkMHsTuTd2Lhf
	iwlcsaz3decBF8Ud8YfAhVroUq3wyaF3OtD4/5x9MVv3eBkNOLVs4k3Xzn9OwTb594qJ
	rUhfkn2ye1kFl0aNLQQndRaHji11XPQWV13RYzCz/QMxTQaKCQUuzLKnVigRncMdMO+O
	5X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jetC9k6voG8at+W2Q+cB1itPOh+JTK0BFpU+SvxVtEY=;
	b=fiUWxfoJJwfrZwcdiuUi9Yc6GlKb5IWtjDeL39HZfaFVKUaUqxmDH/lbbU0OsSRsuy
	QAobg81/YaxFOMUwX0NlAcK6jbdNh2x/+syj+/vJO6UKyEOb3YMUMIvYKOxAPiEXH3K5
	m7Os3PEP0o7EFeGkl0uYfh6N4IT9jqJe3bFhxbICpducBvXEMnEV2CnCg/4WJI11sKSO
	1pWiVNfaYybL/Ooxd1HYnnEsDwm9TFoIL5Zk6z26GB0siaRD193hMzMaw88sZh8QzT+I
	HHpNd/N1PEBFc4Ls8LFR/hPR+LiiqmIvoErwNKMrbZY1bQhnXrPD+xl1Vo4BZ6l+E/pK
	PzEA==
X-Gm-Message-State: AMCzsaWR+FyrF8CGORxcA3raVDKwpqvUWmwuPfiOeUvC9sotmNC5iQfP
	Rjpav+Exvgr6bNz8ACHbQ3+t7gSaYnc=
X-Received: by 10.101.82.1 with SMTP id o1mr15302003pgp.261.1509983330903;
	Mon, 06 Nov 2017 07:48:50 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:50 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:48:03 -0800
Message-Id: <20171106154813.19936-21-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH v3 20/30] i.MX: Add code to emulate FlexCAN IP
 block
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
X-TUID: fpOAUnsdBuPW

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
 hw/misc/imx_flexcan.c         | 99 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx_flexcan.h | 22 ++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 hw/misc/imx_flexcan.c
 create mode 100644 include/hw/misc/imx_flexcan.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 492c535330..943b22af40 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -38,6 +38,7 @@ obj-$(CONFIG_IMX) += imx7_ccm.o
 obj-$(CONFIG_IMX) += imx2_wdt.o
 obj-$(CONFIG_IMX) += imx7_snvs.o
 obj-$(CONFIG_IMX) += imx7_iomuxc.o
+obj-$(CONFIG_IMX) += imx_flexcan.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx_flexcan.c b/hw/misc/imx_flexcan.c
new file mode 100644
index 0000000000..dd4d3d6dc1
--- /dev/null
+++ b/hw/misc/imx_flexcan.c
@@ -0,0 +1,99 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX FlexCAN block emulation code
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/misc/imx_flexcan.h"
+#include "qemu/log.h"
+
+static void imx_flexcan_reset(DeviceState *dev)
+{
+    IMXFlexCANState *s = IMX_FLEXCAN(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+}
+
+static uint64_t imx_flexcan_read(void *opaque, hwaddr offset,
+                               unsigned size)
+{
+    IMXFlexCANState *s = opaque;
+    return s->regs[offset / sizeof(uint32_t)];
+}
+
+static void imx_flexcan_write(void *opaque, hwaddr offset,
+                            uint64_t value, unsigned size)
+{
+    IMXFlexCANState *s = opaque;
+    s->regs[offset / sizeof(uint32_t)] = value;
+}
+
+static const struct MemoryRegionOps imx_flexcan_ops = {
+    .read = imx_flexcan_read,
+    .write = imx_flexcan_write,
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
+static void imx_flexcan_init(Object *obj)
+{
+    SysBusDevice *sd = SYS_BUS_DEVICE(obj);
+    IMXFlexCANState *s = IMX_FLEXCAN(obj);
+
+    memory_region_init_io(&s->iomem,
+                          obj,
+                          &imx_flexcan_ops,
+                          s,
+                          TYPE_IMX_FLEXCAN ".iomem",
+                          sizeof(s->regs));
+    sysbus_init_mmio(sd, &s->iomem);
+}
+
+static const VMStateDescription vmstate_imx_flexcan = {
+    .name = TYPE_IMX_FLEXCAN,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, IMXFlexCANState, FLEXCAN_NUM),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void imx_flexcan_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = imx_flexcan_reset;
+    dc->vmsd  = &vmstate_imx_flexcan;
+    dc->desc  = "i.MX FlexCAN Module";
+}
+
+static const TypeInfo imx_flexcan_info = {
+    .name          = TYPE_IMX_FLEXCAN,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMXFlexCANState),
+    .instance_init = imx_flexcan_init,
+    .class_init    = imx_flexcan_class_init,
+};
+
+static void imx_flexcan_register_type(void)
+{
+    type_register_static(&imx_flexcan_info);
+}
+type_init(imx_flexcan_register_type)
diff --git a/include/hw/misc/imx_flexcan.h b/include/hw/misc/imx_flexcan.h
new file mode 100644
index 0000000000..da9980cf86
--- /dev/null
+++ b/include/hw/misc/imx_flexcan.h
@@ -0,0 +1,22 @@
+#ifndef IMX_FLEXCAN_H
+#define IMX_FLEXCAN_H
+
+#include "hw/sysbus.h"
+
+enum IMXFlexCANRegisters {
+    FLEXCAN_NUM = 0x9E0 / sizeof(uint32_t) + 1,
+};
+
+typedef struct IMXFlexCANState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    MemoryRegion iomem;
+    uint32_t     regs[FLEXCAN_NUM];
+} IMXFlexCANState;
+
+#define TYPE_IMX_FLEXCAN "imx-flexcan"
+#define IMX_FLEXCAN(obj) OBJECT_CHECK(IMXFlexCANState, (obj), TYPE_IMX_FLEXCAN)
+
+#endif /* IMX_FLEXCAN_H */
-- 
2.13.6

