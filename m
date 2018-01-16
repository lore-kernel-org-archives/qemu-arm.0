Received: by 10.28.173.206 with SMTP id w197csp3376816wme;
        Mon, 15 Jan 2018 17:38:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBotvzfAgz5yOsoTlKqCwfTrAqHqWLA04mroVzUlBMbpd0xAIO/XOAwVE6FGQr9kuWkxywv3x
X-Received: by 10.129.133.198 with SMTP id v189mr24265275ywf.130.1516066681663;
        Mon, 15 Jan 2018 17:38:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516066681; cv=none;
        d=google.com; s=arc-20160816;
        b=jHWl0qjtqpMG65awUU+X4GqQO6xykJCVfHfMcg3ALNqOkKp5ON1Mv9Pbqtb658FKRI
         aGLGMntffTv9lQnu0xhrq6JeDUvSveHYCUj5iARQYP8+LVqYB6KauWlL5mzRdIxQqV86
         uIvDdqAUzOPOjyScQhPuq50myHNa3vPOQZziLQio8Q0VGNQzrc4bsTlOcrX0vgDXejgp
         sJm59vnDrjgP2HpkWsPgMhWI7ASLYUS15r+npSY4SfEGkH7MuI5TIPZ5jmggaZJMapVO
         5gpbdfJi8bhfEoU0jL+sMkvD062PER7OU0T8pTAeSEc7Xb25q9G7GxTA9AD4PjwBqKA4
         YLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=P0JYT3RWrVbaRh8Csb7FnBSfzzAKpFeEANlIc7iDDbs=;
        b=qD2v0nDt28MFmov5v+ANHZXiU+3vItlTeu7KBtsK8f5oR2zUhuvtjQndIatpDCLjCw
         54qAICcMM4UkyTdC1kRPxzoE1DGxcjQaZWR3TPAqWgNPx3PcYjeY7xn78TNni9v6uute
         Yv28gDAHoTY1EfFEsUh8gbigsNWVv6QfdEd7DVY97FgnprEDG6VaUjp0PBv4KIeiz5uM
         x9Nb2gL3Exer2GrTRS8XOEbyGCEgnvIwuguv0jlKz8awxxxlq0g0ZBeAHeG6gs4NenkY
         TstEws+/RAzYWVv/6ChztDRczcKC1RncnQD42AIGWZBpSBmeh5FvAn9dk3Q/Z+GT4Vca
         ApEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FO2r1/W1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w126si219020ywg.410.2018.01.15.17.38.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 17:38:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FO2r1/W1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51997 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebGCP-0006CS-1u
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 20:38:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGC2-000607-KR
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGC1-0005F8-Em
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:38 -0500
Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d]:43218)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebGC1-0005EY-6l; Mon, 15 Jan 2018 20:37:37 -0500
Received: by mail-pg0-x22d.google.com with SMTP id n17so1151076pgf.10;
	Mon, 15 Jan 2018 17:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=P0JYT3RWrVbaRh8Csb7FnBSfzzAKpFeEANlIc7iDDbs=;
	b=FO2r1/W104rUeiSlGyF/6Avr6jcXz6A4IjCwC1/TJKXdFZKVajwuplyAvD95RmEAve
	yyDuMZOCc+jdiSruAQExTTN3EdfiR+FjK/xLJIA16CCQZqAg+nwMdzraDhWIZ/xXaEVB
	Te8mEwD5Loy5DBKQI0+FCAeV1hKVHa3qDvaYv04gQbmR5wN9zOd3Ax0yB7oEj2BQTaZ3
	hDLl/bc2WA71FUBfcYcShQw3zx0crnCP8ikNyf8Hfo9ztsDCfMSgZugPLz/ahCTIZtyw
	uSfyXEIXM/ZSfMM4GKFYLdO59QVvjbkYtBBLWB9PF6hgrU1JGc9eauqr//fVtb9Iq6i7
	nC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=P0JYT3RWrVbaRh8Csb7FnBSfzzAKpFeEANlIc7iDDbs=;
	b=WLWHmWeoQ//icV5EWUnKkztPHJRFfadGnx9fBZuH41G4PuT5PSyBeUuRSVm8TWIFJN
	7NRQHdOxtAA69utmYHHBNapT2e6iiYI5cP4q85xEaTVXwXy00fv4+AfnZ7rTUn7mFnQU
	PPGojr0ZBiUPtiO0Fu9F3DFRVwutD0asahG5/NiSbHenRFu4on/NxeZvWtOCWj5vrvIt
	nZeZpgnZdq2tz4cZM2DE6bqaRC9ZXtZCrmfsEu6UafvKP5dUuHIa6NRit26bwqr7bE/f
	KgH4shK7j+J5oKDQop2DsRbunvXprVDQaLs3gcAAaKiCXIs037OOZKT6NJnlfLDDSd4+
	hbqg==
X-Gm-Message-State: AKGB3mLVeH2XttDZJxesxY/Oghu6Xtz7QLgLfP//hN8G0bfPuQY9Dtmv
	TDvor4y97JgQYLCiGtiwmkf+jg61
X-Received: by 10.98.153.210 with SMTP id t79mr32774932pfk.43.1516066655940;
	Mon, 15 Jan 2018 17:37:35 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id s65sm1023795pfk.7.2018.01.15.17.37.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 17:37:35 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 17:36:59 -0800
Message-Id: <20180116013709.13830-5-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180116013709.13830-1-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22d
Subject: [Qemu-arm] [PATCH v4 04/14] i.MX: Add code to emulate i.MX2
 watchdog IP block
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
X-TUID: gzFYWYP2CZ+O

Add enough code to emulate i.MX2 watchdog IP block so it would be
possible to reboot the machine running Linux Guest.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs      |  1 +
 hw/misc/imx2_wdt.c         | 89 ++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx2_wdt.h | 33 +++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 hw/misc/imx2_wdt.c
 create mode 100644 include/hw/misc/imx2_wdt.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index a28e5e49b0..4b2b705a6c 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -34,6 +34,7 @@ obj-$(CONFIG_IMX) += imx25_ccm.o
 obj-$(CONFIG_IMX) += imx6_ccm.o
 obj-$(CONFIG_IMX) += imx6_src.o
 obj-$(CONFIG_IMX) += imx7_ccm.o
+obj-$(CONFIG_IMX) += imx2_wdt.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx2_wdt.c b/hw/misc/imx2_wdt.c
new file mode 100644
index 0000000000..76bb98a525
--- /dev/null
+++ b/hw/misc/imx2_wdt.c
@@ -0,0 +1,89 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX2 Watchdog IP block
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/bitops.h"
+#include "qemu/osdep.h"
+#include "sysemu/watchdog.h"
+
+#include "hw/misc/imx2_wdt.h"
+
+#define IMX2_WDT_WCR_WDA    BIT(5)      /* -> External Reset WDOG_B */
+#define IMX2_WDT_WCR_SRS    BIT(4)      /* -> Software Reset Signal */
+
+static uint64_t imx2_wdt_read(void *opaque, hwaddr addr,
+                              unsigned int size)
+{
+    return 0;
+}
+
+static void imx2_wdt_write(void *opaque, hwaddr addr,
+                           uint64_t value, unsigned int size)
+{
+    if (addr == IMX2_WDT_WCR &&
+        (value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS))) {
+        watchdog_perform_action();
+    }
+}
+
+static const MemoryRegionOps imx2_wdt_ops = {
+    .read  = imx2_wdt_read,
+    .write = imx2_wdt_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl = {
+        /*
+         * Our device would not work correctly if the guest was doing
+         * unaligned access. This might not be a limitation on the
+         * real device but in practice there is no reason for a guest
+         * to access this device unaligned.
+         */
+        .min_access_size = 4,
+        .max_access_size = 4,
+        .unaligned = false,
+    },
+};
+
+static void imx2_wdt_realize(DeviceState *dev, Error **errp)
+{
+    IMX2WdtState *s = IMX2_WDT(dev);
+
+    memory_region_init_io(&s->mmio, OBJECT(dev),
+                          &imx2_wdt_ops, s,
+                          TYPE_IMX2_WDT".mmio",
+                          IMX2_WDT_REG_NUM * sizeof(uint16_t));
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+}
+
+static void imx2_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = imx2_wdt_realize;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+}
+
+static const TypeInfo imx2_wdt_info = {
+    .name          = TYPE_IMX2_WDT,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(IMX2WdtState),
+    .class_init    = imx2_wdt_class_init,
+};
+
+static WatchdogTimerModel model = {
+    .wdt_name = "imx2-watchdog",
+    .wdt_description = "i.MX2 Watchdog",
+};
+
+static void imx2_wdt_register_type(void)
+{
+    watchdog_add_model(&model);
+    type_register_static(&imx2_wdt_info);
+}
+type_init(imx2_wdt_register_type)
diff --git a/include/hw/misc/imx2_wdt.h b/include/hw/misc/imx2_wdt.h
new file mode 100644
index 0000000000..8afc99a10e
--- /dev/null
+++ b/include/hw/misc/imx2_wdt.h
@@ -0,0 +1,33 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * i.MX2 Watchdog IP block
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef IMX2_WDT_H
+#define IMX2_WDT_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_IMX2_WDT "imx2.wdt"
+#define IMX2_WDT(obj) OBJECT_CHECK(IMX2WdtState, (obj), TYPE_IMX2_WDT)
+
+enum IMX2WdtRegisters {
+    IMX2_WDT_WCR     = 0x0000,
+    IMX2_WDT_REG_NUM = 0x0008 / sizeof(uint16_t) + 1,
+};
+
+
+typedef struct IMX2WdtState {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+} IMX2WdtState;
+
+#endif /* IMX7_SNVS_H */
-- 
2.14.3

