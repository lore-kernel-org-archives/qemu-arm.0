Received: by 10.28.71.27 with SMTP id u27csp238360wma;
        Tue, 6 Feb 2018 20:25:41 -0800 (PST)
X-Google-Smtp-Source: AH8x224Ab6UVPfc4b78eiOxoJsXh7L87sXN5aBDxX4a3ZHkZW9tneP53KrGQbulX2N7aPumOeOKo
X-Received: by 10.37.201.194 with SMTP id z185mr2901138ybf.405.1517977541341;
        Tue, 06 Feb 2018 20:25:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517977541; cv=none;
        d=google.com; s=arc-20160816;
        b=XUt3y8aX6jjmUK1bfkZuGigijA9eRNb/rweK5fNcSD1JyhIuleM4pB0bP7p+cucOMK
         GVds8HqhOs6U16DL0uIm5VTZ5kS3hGTiR6qreW00tNSyuoU9zZJ7mOUa3YRUqi9PN75M
         FLc+ECpQA5q8KSDVkKa0reKVVLUWMW9y/2MjrEP8eLY69S1diXOtXPKx7URq8bRA2K1v
         WeLtmdcTqrisz12FCkfBCg4ELYAZ0d0cm7vhDEA8zq4WPF21ViV4brQ5ktPmXTy7YDBh
         Na06hVHt90eVHxeSE8RkUxoAXEbzQvr3KBXvlysY6bQ7EWnH/j8FwHS4hGnKslw4LrXT
         OQsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rTAISKlq9wozuMKw0ocslpN/L1fWT3tMVyprLg4JeT8=;
        b=Ftr4YwazZDcRIwZ97PufWJsC5dw3EDR98+EDjqKy7YSsq7QRqeRD6HlPsbAuKO4cXw
         /y1Kg2scB9K7VLtFywCXJkAYgj7zlXcsx5UrAhgq7FqvNgmCbU6JrheS98qflZSPnAen
         axD9jArhXzLyR4leXZ7mUl+qjnHJIphoSuln6tavcgUep7zlznFpg4f/tRh94TxBEDg1
         rbJnnQKoCqm3PG1taGGtZ5RP5ZqPio2CpmOl7o1oQ/CHWx3SoGQqM9qYrBI97H9NBAbQ
         lo32LAwIvUZBnThPKOzb7vAZbrCgefjBTsdIacZOpfiU5gXEqrRA4Z+wXUGP8LTQydxf
         RsJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K1mMfdfC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e124si108850ywb.424.2018.02.06.20.25.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 20:25:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=K1mMfdfC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejHIi-0000av-Kx
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 23:25:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIG-000096-Ar
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejHIF-00038Z-00
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 23:25:12 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:32850)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejHIE-00038B-Om; Tue, 06 Feb 2018 23:25:10 -0500
Received: by mail-pg0-x242.google.com with SMTP id u1so2047959pgr.0;
	Tue, 06 Feb 2018 20:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rTAISKlq9wozuMKw0ocslpN/L1fWT3tMVyprLg4JeT8=;
	b=K1mMfdfCkdb/0LJd9bn0tv7fsrhZhLMkH2f8KWiuayE7crVFHDQ0B5aD/a84yKG+lG
	L62/9c5e+U0gIK7pYPF4UpekebO5H23ShsZKzD4kJ6ZV94Wl3U/zNo74z4C7a1/KalCk
	8kgGo93G+nBKiSydlbiQKRdTrwb7Qx+hpbiwjLnekaZ5ZxMV7vHaz61IwiDHb43BNEG1
	WL+kfR7FIBRtRCHL2zVKgWS1WoTywfVQey86cyw1R6Kzp9gLuCdHFId1Ja0Ynd+sZToi
	3YK+pimQADhpcQARCPH8J2rPehY5T4aqhhLciWiJRZM6t98MDI4679rLPdVSIUSC/b1K
	miSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rTAISKlq9wozuMKw0ocslpN/L1fWT3tMVyprLg4JeT8=;
	b=oplFldw7Lm9gejgEs63wRX5v+UvXwLYdz8+F9MOEHjTD9w2dXtoQFWxwalx5gDnGjc
	d7db9qkff2MAOhtq5gkyI7MVFzKU85TmpPIMIaY6jNTt2qX3UwjvnN4ykv78//9EfJp1
	NufUEmfObBsz5H8le+MZfHT+suZeE7QmEEaTB0tvkcOxf/F0oE1MfA6SYqCSV1yRxmu7
	QKbaHF1sn5MEgto/TNdntWXVEHh0TVBkyLnXyBBo8jSJrAsaRYV2EdPsf6XtSK+Ntb3E
	FfoV6o7UuhSLyFtpAutJ2PB0CQX1kUQ4Xx5HMu6zBSS3wLcKDJIm49TqKHfum4h+1OXb
	XcSA==
X-Gm-Message-State: APf1xPALcrAFhKHZ3hQqRMxNaFgk53TAC9fpvGV8RJgqT31YPTkqheiO
	O6CHlpEWt4HQxqVzEtzAdV/Q/Bkd
X-Received: by 10.101.81.141 with SMTP id h13mr3817662pgq.241.1517977509477;
	Tue, 06 Feb 2018 20:25:09 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x8sm1076095pfk.123.2018.02.06.20.25.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 20:25:08 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  6 Feb 2018 20:24:28 -0800
Message-Id: <20180207042438.15422-5-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180207042438.15422-1-andrew.smirnov@gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v5 04/14] i.MX: Add code to emulate i.MX2
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R7NvQG4+/Cru

Add enough code to emulate i.MX2 watchdog IP block so it would be
possible to reboot the machine running Linux Guest.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
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
index 0000000000..e47e442592
--- /dev/null
+++ b/hw/misc/imx2_wdt.c
@@ -0,0 +1,89 @@
+/*
+ * Copyright (c) 2018, Impinj, Inc.
+ *
+ * i.MX2 Watchdog IP block
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
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

