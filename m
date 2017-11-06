Received: by 10.223.150.237 with SMTP id u100csp2791571wrb;
        Mon, 6 Nov 2017 07:57:59 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Q7Kk7vhA6s/Pt+YH6bEQ56ykvOHdPcGnIPlYOZgE36h9TKBy9VgQa031QqWIT2kMR3bM4x
X-Received: by 10.37.70.195 with SMTP id t186mr8877979yba.407.1509983879442;
        Mon, 06 Nov 2017 07:57:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983879; cv=none;
        d=google.com; s=arc-20160816;
        b=RoUPRgCJZaLnZNSrZ3qjMnCyfxSdxXag14MUDz6byL9BGTNbvP5F+rnLuEV4FbARFu
         4ePVijIKsnCYi2+RYcTKDb5lQXYqpABKbe5ZqJIWu+zYNHuFMrqQiloDQ458SnYr6zEq
         9PxwCAaC/W1pyK+dCM/ir5Fp9E8NWznpDjdZ8YTuO/qD5ZmjazkSLe5cJ/70k3nailjG
         h5kqwISpjdo8Eoa9Yk2z2OO8hbPF1TFYX+NKWDEXDbyvir1OufaqPvGMHyfjj1hXxTpH
         dqcpFXFoaErtqUUjIQxOjoTl0sGrlYFVkaumEE6vtNWNANnRVzL6dhoXFCeRd60X+M2p
         ilzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rsMVyPJUtI8oymIlYkW5SpJ7ZuWF6SM2y9b3ocv3upo=;
        b=gxRqtV89TLaQ3pBfYRJ7mRAoWBDM5BhCj2wxbRt75fJPKWwxjKOewb/QtseafazP/v
         tEIQzc8RvTXe6KeU17HL754zxEtuAhm0SGPfa2A2BjkMcCjm+L8tO0Be5drA5D8CnkAc
         Xc7ZN4YiFgVFQ8WYfmI5tEH2v22gufhmgndkVonkqJ7C0PVcXK8jRq6anm8oKecmrXDy
         zJk6/6InwzU74FscGBvImuDXFNLwkh6jv2lg0r+lP2lcXwaqQziIoiI45Y13DhksUjVO
         6Zmw1eZ0GgBqZRcIhKrgC8CfevV/NMRwyv5KGbSoP+B+meFX3EhUPmmvQA9Lq5oJhVzQ
         cxsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uAdQVDor;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4si2634209ybm.180.2017.11.06.07.57.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:57:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uAdQVDor;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjmg-0006P1-Pz
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:57:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdr-0007Ik-A8
	for qemu-devel@nongnu.org; Mon, 06 Nov 2017 10:48:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdo-0000ZT-G6
	for qemu-devel@nongnu.org; Mon, 06 Nov 2017 10:48:51 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:43186)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdl-0000Wa-44; Mon, 06 Nov 2017 10:48:45 -0500
Received: by mail-pg0-x241.google.com with SMTP id s75so8526974pgs.0;
	Mon, 06 Nov 2017 07:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rsMVyPJUtI8oymIlYkW5SpJ7ZuWF6SM2y9b3ocv3upo=;
	b=uAdQVDorO5n2hFfZxmry24mMVZJ57pAcI6nAow8lYvMOlf3bZMrUgaTntRxUXZjCm5
	L5Fao3Om1VzQXwE3FL/qrTftZBB9EyZso07D3K/PXtcCFhvtGdWD2Kl6HU3UAJrQgzFJ
	2iEHE8MDgGhftf/vlSPverJ1oS7HZRX0AZ3GFqCGVF+QL+eufvNEifkQF5wT7z7FTgfF
	0mCpR6OEWOkOn7POARE+z4EG4zjnul8dRRgvSgJkclH1I6dFc6o39tjLGU8eHclIb+Jg
	0U62OtWZpVIYcSCTGOOZX8cL30n2FI8QFi5THu/djis2fcXFEd2batDkLzPwep15BMqT
	mlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rsMVyPJUtI8oymIlYkW5SpJ7ZuWF6SM2y9b3ocv3upo=;
	b=qv8e7r6tqypl4tg4xIX5O4smGvhh3cKFgwWr+lxWio/QsreA4H97jt+UC2K0OpQDzo
	JIguHrE0vNSxsLToBoNsgGt8boJbCtj7FHHMXASsooWZo4bd29dHz1oXWghARbzBnQUs
	zDO8xCDzRSoE12B/MLHMz0/TK3y829ElxLetVL+mFSXXCc+e15KAqKYdlg4zLhUkMAvR
	QTAL2XxAK4RtVe+CtM9K6w83UaeGx4qyGIsErO1tphn8/HqvUiu/C/OX240TcHcjSiU2
	H3CpbU3ufkEngKk0rXk4Chck7LNCBPlODlekCKcjcF+ni20pQBL8mMI2P+sBoU4seg85
	bh4Q==
X-Gm-Message-State: AMCzsaX8lGAOPtaRiHp9ZsbZJULeEWdI2VGDyYbBTXlrNKxpn7DZhfW9
	DzL9dRJtYrPFgg0q8v9KwJp8eLGbsQk=
X-Received: by 10.98.223.131 with SMTP id d3mr17344928pfl.38.1509983323869;
	Mon, 06 Nov 2017 07:48:43 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:43 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:57 -0800
Message-Id: <20171106154813.19936-15-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-devel] [PATCH v3 14/30] i.MX: Add code to emulate i.MX2
 watchdog IP block
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qCaZrHDiAxMT

Add enough code to emulate i.MX2 watchdog IP block so it would be
possible to reboot the machine running Linux Guest.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs      |  1 +
 hw/misc/imx2_wdt.c         | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx2_wdt.h | 34 ++++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 hw/misc/imx2_wdt.c
 create mode 100644 include/hw/misc/imx2_wdt.h

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index ac1be05a03..c393a93456 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -35,6 +35,7 @@ obj-$(CONFIG_IMX) += imx25_ccm.o
 obj-$(CONFIG_IMX) += imx6_ccm.o
 obj-$(CONFIG_IMX) += imx6_src.o
 obj-$(CONFIG_IMX) += imx7_ccm.o
+obj-$(CONFIG_IMX) += imx2_wdt.o
 obj-$(CONFIG_MILKYMIST) += milkymist-hpdmc.o
 obj-$(CONFIG_MILKYMIST) += milkymist-pfpu.o
 obj-$(CONFIG_MAINSTONE) += mst_fpga.o
diff --git a/hw/misc/imx2_wdt.c b/hw/misc/imx2_wdt.c
new file mode 100644
index 0000000000..3a1c33aa51
--- /dev/null
+++ b/hw/misc/imx2_wdt.c
@@ -0,0 +1,88 @@
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
index 0000000000..e67ac6939d
--- /dev/null
+++ b/include/hw/misc/imx2_wdt.h
@@ -0,0 +1,34 @@
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
+#include "qemu/bitops.h"
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
2.13.6

