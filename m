Received: by 10.223.159.74 with SMTP id f10csp6437761wrg;
        Thu, 14 Dec 2017 07:20:04 -0800 (PST)
X-Google-Smtp-Source: ACJfBouSGXlFbrYUWvHzIjT0e7XC/pWuVi1BezUFMkCElPfMOMZ8yRM+7hG6CUQXLc3Rj8W5iBry
X-Received: by 10.37.162.135 with SMTP id c7mr4543114ybi.25.1513264803939;
        Thu, 14 Dec 2017 07:20:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513264803; cv=none;
        d=google.com; s=arc-20160816;
        b=tVjtMdIJ/E+mX+LSbK6YlVrgcHYKWxSczdjfgXszzUeoTMurQau3TaqPl793cD+lzs
         ajExabMj57plY5/SjFfR4UNj1CfNlYApnjuRsyansBbbBFc/0xpIGM/rPmS0N0lFIqGc
         AIDrJM39wCclGdpk1VRy/oO3+nyEsbyp+AyZNhjSHUDd+UksUG4wTMUY9qQ49i0RaPeX
         rjqvsJalWg3dGvm9wAhxHW9R9sCHyB7gFtbxqI7pErTlMldZoj4tJjfYeqZM+Rjd2z9a
         yJRIudBDOPWD9c+4MJM8YIMCKGP106FXOhXHPDT6TrpWDbeLV580PzYcG3WgTsJJzFMe
         B2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=vRykh/JV35aiOBbn6Tp1ZdoMgudnPT5Ch7EtGRdCGuQ=;
        b=LZ5urdQiN1Ku8zimDNlg7lCRy6C+GSmQ/OJHliNmaa+Ps51bLqMo62hzyS1XJDNEa2
         BINBPPedHRW5+ISkD9F3OzgP6xVTMbiG3T0XBRZ3ADUpnLicSRmvnpF/7oXGQXmY5s/K
         MGnE1YTwAHoQW7AHO8aTTDRqbBMmhrbBTcdyWAEPhvdujmlaUoWQKv1iUC0iCvaOJwAt
         /AdnBWzki8mkIXxhscXOOKuiMgNgzXm9cVObQV/3poSwP9xNFLGaPN7qyEmJFdQlp/Yi
         Ou0kK9WZN5CKw4Hn9ugCZqeoO80LDHDgT7yRT8UtFXAJgq3NLDeeVRJHPv6+6hZoeP3A
         q9dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i+5kWkYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w14si847042ybl.335.2017.12.14.07.20.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 07:20:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i+5kWkYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41526 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePVIp-0000to-Bn
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 10:20:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePVIe-0000sY-2K
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 10:19:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePVIc-0008Nd-Iw
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 10:19:52 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:41222)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePVIW-0008GZ-By; Thu, 14 Dec 2017 10:19:44 -0500
Received: by mail-pg0-x243.google.com with SMTP id o2so3597854pgc.8;
	Thu, 14 Dec 2017 07:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vRykh/JV35aiOBbn6Tp1ZdoMgudnPT5Ch7EtGRdCGuQ=;
	b=i+5kWkYtMDwBSNR7u10NugIfF0wq2cKmFwsvKnJV9CMf9/xQBe8mKuzGjAQ+jGe+u+
	LDjiE5swdJBKmjWk1TKywXzHfCRJoOpwSyYpEukwh0HlMtkNsPfX3mwxjHYGfl0rSGAh
	+fOnayOM67aendRJGcK4Hm7Px5bwzqCMpJrQWKr3FhveGmSC2JinS3jxyLESrbVKVzgp
	hEedLwUBtPngNUs6qCdx8rIPyAd3YIS+/b+/pLwRYLvkWhiRb98v17uBDE2h1Srk/Smn
	S7PSirrs7yDeBgNz2lk12I/Sem2KogNAd8Zmz0RAdLeZoX7/vcpcWN0eQjvIIbw4LHzx
	6btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vRykh/JV35aiOBbn6Tp1ZdoMgudnPT5Ch7EtGRdCGuQ=;
	b=H7qiNVf2C3YsDqoW0Ywp8RKZ4YE5qDHL+OwGLnyTrGsPN3K7rpYdc1W9JhPCu998o/
	YAEtmMdHJrVA+YBcGSEoIIEBM+COfW5UFBX5p8x9rFycR7N5VxNlXgKiFfeSuQQoWPzW
	fAKrd1jklHyNbwQuJ/0EBB31p26df4yUI85JwlPdwEo9UgbgMVirldbz0hOD5Yao9WfF
	M2KFBt1/sJqf1Bo+rRD5hTn7W8yfAM9UeASoaojT4pSp/gdAZcswKMb8jWjClFOyvx8t
	nDzJeREy6neSnndjn5Xg8w9RpIVTptVnYNKN6eLhEHVmxp2y18RUJzciBpPUWgWWdkZO
	Oydw==
X-Gm-Message-State: AKGB3mLjwU5Kw0Uyevq9jZ4ZwaX/HVjg74Dz7dC560tGL8otpqugYmvq
	M/Jeuvlo6jchXVqYUX5ZKKQXQ/zQ
X-Received: by 10.99.133.200 with SMTP id u191mr8878375pgd.327.1513264783119; 
	Thu, 14 Dec 2017 07:19:43 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	l80sm8680911pfk.67.2017.12.14.07.19.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 07:19:41 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 14 Dec 2017 07:19:34 -0800
Message-Id: <20171214151934.3647-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH] hw/misc: Add code to emulate Xilinx Slave Serial
 port
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
	yurovsky@gmail.com, Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x4xJ/qIng4AV

Add code to emulate Xilinx Slave Serial FPGA configuration port.

Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Integrating this into a build system via "obj-y" might not be the best
way. Does this code need a dedicated CONFIG_ symbol?

Thanks,
Andrey Smirnov


 hw/misc/Makefile.objs                 |   1 +
 hw/misc/xilinx_slave_serial.c         | 105 ++++++++++++++++++++++++++++++++++
 include/hw/misc/xilinx_slave_serial.h |  21 +++++++
 3 files changed, 127 insertions(+)
 create mode 100644 hw/misc/xilinx_slave_serial.c
 create mode 100644 include/hw/misc/xilinx_slave_serial.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index a68a201083..4599288e55 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -38,6 +38,7 @@ obj-$(CONFIG_IMX) += imx7_ccm.o
 obj-$(CONFIG_IMX) += imx2_wdt.o
 obj-$(CONFIG_IMX) += imx7_snvs.o
 obj-$(CONFIG_IMX) += imx7_gpr.o
+obj-y += xilinx_slave_serial.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/xilinx_slave_serial.c b/hw/misc/xilinx_slave_serial.c
new file mode 100644
index 0000000000..607674fb60
--- /dev/null
+++ b/hw/misc/xilinx_slave_serial.c
@@ -0,0 +1,105 @@
+/*
+ * Copyright (c) 2017, Impinj, Inc.
+ *
+ * Code to emulate programming "port" of Xilinx FPGA in Slave Serial
+ * configuration connected via SPI, for more deatils see (p. 27):
+ *
+ * See https://www.xilinx.com/support/documentation/user_guides/ug380.pdf
+ *
+ * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/misc/xilinx_slave_serial.h"
+#include "qemu/log.h"
+
+enum {
+    XILINX_SLAVE_SERIAL_STATE_RESET,
+    XILINX_SLAVE_SERIAL_STATE_RECONFIGURATION,
+    XILINX_SLAVE_SERIAL_STATE_DONE,
+};
+
+static void xilinx_slave_serial_update_outputs(XilinxSlaveSerialState *xlnxss)
+{
+    qemu_set_irq(xlnxss->done,
+                 xlnxss->state == XILINX_SLAVE_SERIAL_STATE_DONE);
+}
+
+static void xilinx_slave_serial_reset(DeviceState *dev)
+{
+    XilinxSlaveSerialState *xlnxss = XILINX_SLAVE_SERIAL(dev);
+
+    xlnxss->state = XILINX_SLAVE_SERIAL_STATE_RESET;
+
+    xilinx_slave_serial_update_outputs(xlnxss);
+}
+
+static void xilinx_slave_serial_prog_b(void *opaque, int n, int level)
+{
+    XilinxSlaveSerialState *xlnxss = XILINX_SLAVE_SERIAL(opaque);
+    assert(n == 0);
+
+    if (level) {
+        xlnxss->state = XILINX_SLAVE_SERIAL_STATE_RECONFIGURATION;
+    }
+
+    xilinx_slave_serial_update_outputs(xlnxss);
+}
+
+static void xilinx_slave_serial_realize(SSISlave *ss, Error **errp)
+{
+    DeviceState *dev = DEVICE(ss);
+    XilinxSlaveSerialState *xlnxss = XILINX_SLAVE_SERIAL(ss);
+
+    qdev_init_gpio_in_named(dev,
+                            xilinx_slave_serial_prog_b,
+                            XILINX_SLAVE_SERIAL_GPIO_PROG_B,
+                            1);
+    qdev_init_gpio_out_named(dev, &xlnxss->done,
+                             XILINX_SLAVE_SERIAL_GPIO_DONE, 1);
+}
+
+static uint32_t xilinx_slave_serial_transfer(SSISlave *ss, uint32_t tx)
+{
+    XilinxSlaveSerialState *xlnxss = XILINX_SLAVE_SERIAL(ss);
+
+    if (xlnxss->state == XILINX_SLAVE_SERIAL_STATE_RECONFIGURATION) {
+        xlnxss->state = XILINX_SLAVE_SERIAL_STATE_DONE;
+    }
+
+    xilinx_slave_serial_update_outputs(xlnxss);
+    return 0;
+}
+
+static void xilinx_slave_serial_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass   *dc = DEVICE_CLASS(klass);
+    SSISlaveClass *k  = SSI_SLAVE_CLASS(klass);
+
+    dc->reset      = xilinx_slave_serial_reset;
+    dc->desc       = "Xilinx Slave Serial";
+    k->realize     = xilinx_slave_serial_realize;
+    k->transfer    = xilinx_slave_serial_transfer;
+    /*
+     * Slave Serial configuration is not technically SPI and there's
+     * no CS signal
+     */
+    k->set_cs      = NULL;
+    k->cs_polarity = SSI_CS_NONE;
+}
+
+static const TypeInfo xilinx_slave_serial_info = {
+    .name          = TYPE_XILINX_SLAVE_SERIAL,
+    .parent        = TYPE_SSI_SLAVE,
+    .instance_size = sizeof(XilinxSlaveSerialState),
+    .class_init    = xilinx_slave_serial_class_init,
+};
+
+static void xilinx_slave_serial_register_type(void)
+{
+    type_register_static(&xilinx_slave_serial_info);
+}
+type_init(xilinx_slave_serial_register_type)
diff --git a/include/hw/misc/xilinx_slave_serial.h b/include/hw/misc/xilinx_slave_serial.h
new file mode 100644
index 0000000000..f7b2e22be3
--- /dev/null
+++ b/include/hw/misc/xilinx_slave_serial.h
@@ -0,0 +1,21 @@
+#ifndef XILINX_SLAVE_SERIAL_H
+#define XILINX_SLAVE_SERIAL_H
+
+#include "hw/ssi/ssi.h"
+
+typedef struct XilinxSlaveSerialState {
+    /*< private >*/
+    SSISlave parent_obj;
+
+    qemu_irq done;
+    int state;
+} XilinxSlaveSerialState;
+
+#define TYPE_XILINX_SLAVE_SERIAL "xilinx:slave-serial"
+#define XILINX_SLAVE_SERIAL(obj) \
+    OBJECT_CHECK(XilinxSlaveSerialState, (obj), TYPE_XILINX_SLAVE_SERIAL)
+
+#define XILINX_SLAVE_SERIAL_GPIO_DONE   "xilinx:slave-serial:done"
+#define XILINX_SLAVE_SERIAL_GPIO_PROG_B "xilinx:slave-serial:prog-b"
+
+#endif /* XILINX_SLAVE_SERIAL_H */
-- 
2.14.3

