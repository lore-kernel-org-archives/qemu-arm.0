Received: by 10.223.172.38 with SMTP id v35csp4140011wrc;
        Mon, 18 Sep 2017 12:54:45 -0700 (PDT)
X-Received: by 10.200.55.83 with SMTP id p19mr48140014qtb.21.1505764485262;
        Mon, 18 Sep 2017 12:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505764485; cv=none;
        d=google.com; s=arc-20160816;
        b=Y1ysfNC6wZCfxHYKHWSC5sN8AT1dXdjqZ40AuQsg5xouhgPp1r9Etq2B/qmr+c//RZ
         mMYlQovHya17AF1aSIsk7dk0A77XV4NrIW4H3BJ/NZVQqYgjdhBT0XBctmWUZJm5El2e
         1zVijzqJt6Rp3Y/cBt3Sf5lq2x+1gem41xVwik49KyY6n4nHG5F7Ydw+lgmjbiN3uORZ
         p/NG6MvBVIA1mgxkydU/Y7XFL/3ec2c3gOAZrNHtlAgYczKMoQHs8xvSrqjotZ/Xvgcx
         bjvzpcBEs8sTJdf6YP2rVKGuczyktmGH9LKqzoaElEueVkqLEIyzYrYRWwOKTqz9mE/V
         j2Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=QhtaYY3IAj/wi38PN5UxKQmd5+8uMVor8M8aRivDBIc=;
        b=Ia6Nh7AXkerlGbbUKdZWtI1xCl9wXa3lWUszbKvk22Tq16RV4lacHLf4RutgG07t2I
         o2eb+zftgohNxh6BcPG3fs4NOLGqR3Fp2pDlR4ULhoCjB+0tKxSw95bxXMAL9PlOFqd9
         uJ4J0nmIO/BJDWigwX1qybHxgPBI6xf8AEIKyA3eJlGUemEeT96FpBlChBTbRW1uHV1r
         cAFLT/xd2YFOsqjGBDWmSVLDKLBeQ7A2Xk0EpRG/a1xTZWXrWjFdhwcJXaxkPgnuoluw
         CnrodXGMS/D8XFMXNoMF4CaX31OCizrj0CjJIIxnKH5g4s/KkyaRz8jGqwxR27Fwksfp
         iEPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j4ZujcVs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2si7958930qta.173.2017.09.18.12.54.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Sep 2017 12:54:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j4ZujcVs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1du27v-00013s-0u
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 15:54:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24x-0006u5-Ua
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1du24w-0006Li-RM
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 15:51:40 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:38194)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1du24w-0006LA-Jn; Mon, 18 Sep 2017 15:51:38 -0400
Received: by mail-pg0-x242.google.com with SMTP id m30so769473pgn.5;
	Mon, 18 Sep 2017 12:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QhtaYY3IAj/wi38PN5UxKQmd5+8uMVor8M8aRivDBIc=;
	b=j4ZujcVsqg36Mo0BLs4KoVtLeh1xWkYP2JQlb/VZ5auMDbHLArbR0m/laL862V6ze+
	fBQf5EdpxaZ3LdLd7JjiHiaCu+HKpAJkrISIQU7BLxomKRQu7Darhs3avequ/Td+1G+j
	r1OIfOUMOIupJjkkUWQjSc1pCNOrvFovMsmY+4s97WGyI9672utz2tKFqHJqBjSBlPTw
	056ijsZypITqZzBDLas7HFVEWexzHRf2D7ScJlOIG6V1TvFUM9RAzRgkLyv9+ShfYMeu
	OOymdYwes0zL4bgdiFsi+VrOviCZKzpKsDRZEhzVmL+J7rmhR105+I241hDP7ysDPAkl
	c0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QhtaYY3IAj/wi38PN5UxKQmd5+8uMVor8M8aRivDBIc=;
	b=gjz4QvCQ+A13A5ATHKBTDmiYu5x7OQi9ePkhu1wcFOPNJLGefXdnAI56P2oxJKdd27
	joY9uVeViTwbpLnRDnLB8Wrx8O3wPewTMN7b2BF8laBO1zhwJIDf/tGmTzpwhKxkNgsE
	1ETVQa/e3cRdaBQ4UlAWcm0AeWmpbOy9LbFjgUxEWX1rfLw57uqPXPI1A3YgAJOxuL9P
	DgdAJdcfEdzNCjBXDgfkVBtHR4XEUPxcbIpqbPla1bZEjzFMkoCRXsMoI3aFVlljF1gD
	F50TXHmrD4xWyOo/L8JKXbX2byONhveW4kXd7D28rc0GhtXS4pv3dKRTGC5YEHP0YGWS
	UrKw==
X-Gm-Message-State: AHPjjUgjwPuxln+z6V85192ajxC8p0PTCRCln2YHAKkbdtkW3rrbjslM
	qQ/3A3HsHlsLJI9HW7Q=
X-Google-Smtp-Source: ADKCNb6LqGq8BfyYC8r/Di+MwWt8oZOtxdF/0uYdHLH/q/8rthmEu++InFw4HTcIcutSCR0WmhkgKA==
X-Received: by 10.84.129.103 with SMTP id 94mr37610267plb.151.1505764297432;
	Mon, 18 Sep 2017 12:51:37 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	d186sm200791pfd.117.2017.09.18.12.51.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Sep 2017 12:51:36 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 18 Sep 2017 12:50:56 -0700
Message-Id: <20170918195100.17593-14-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170918195100.17593-1-andrew.smirnov@gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH 13/17] i.MX: Add code to emulate i.MX2 watchdog
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +1dLpJD6RJk/

Add enough code to emulate i.MX2 watchdog IP block so it would be
possible to reboot the machine running Linux Guest.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/misc/Makefile.objs      |   1 +
 hw/misc/imx2_wdt.c         | 117 +++++++++++++++++++++++++++++++++++++++++++++
 include/hw/misc/imx2_wdt.h |  36 ++++++++++++++
 3 files changed, 154 insertions(+)
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
index 0000000000..9d97a19511
--- /dev/null
+++ b/hw/misc/imx2_wdt.c
@@ -0,0 +1,117 @@
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
+#include "qapi/error.h"
+#include "qemu-common.h"
+#include "hw/hw.h"
+#include "exec/memory.h"
+#include "exec/address-spaces.h"
+#include "hw/sysbus.h"
+#include "qemu/log.h"
+#include "qemu/timer.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/watchdog.h"
+#include "qemu/error-report.h"
+#include "qemu/sizes.h"
+
+#include "hw/misc/imx2_wdt.h"
+
+
+#define IMX2_WDT_WCR_WDA	BIT(5)		/* -> External Reset WDOG_B */
+#define IMX2_WDT_WCR_SRS	BIT(4)		/* -> Software Reset Signal */
+
+static uint64_t imx2_wdt_read(void *opaque, hwaddr addr,
+                              unsigned int size)
+{
+    IMX2WdtState *s = opaque;
+    const size_t index = addr / sizeof(s->reg[0]);
+
+    if (index < ARRAY_SIZE(s->reg))
+        return s->reg[index];
+    else
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
+
+    return 0xDEADBEEF;
+}
+
+static void imx2_wdt_write(void *opaque, hwaddr addr,
+                           uint64_t val64, unsigned int size)
+{
+    uint16_t value  = val64;
+    IMX2WdtState *s = opaque;
+    const size_t index = addr / sizeof(s->reg[0]);
+
+    switch (index) {
+    case IMX2_WDT_WCR:
+        if (value & (IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS))
+            watchdog_perform_action();
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Bad offset 0x%"HWADDR_PRIx"\n", __func__, addr);
+    }
+}
+
+static const MemoryRegionOps imx2_wdt_ops = {
+    .read  = imx2_wdt_read,
+    .write = imx2_wdt_write,
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
+static void imx2_wdt_realize(DeviceState *dev, Error **errp)
+{
+    IMX2WdtState *s = IMX2_WDT(dev);
+
+    memory_region_init_io(&s->mmio, OBJECT(dev),
+                          &imx2_wdt_ops, s,
+                          TYPE_IMX2_WDT".mmio", SZ_64K);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->mmio);
+}
+
+static void imx2_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = imx2_wdt_realize;
+
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
index 0000000000..3a30ed1ef8
--- /dev/null
+++ b/include/hw/misc/imx2_wdt.h
@@ -0,0 +1,36 @@
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
+    IMX2_WDT_WCR,
+    IMX2_WDT_REG_NUM
+};
+
+
+typedef struct IMX2WdtState {
+    /* <private> */
+    SysBusDevice parent_obj;
+
+    MemoryRegion mmio;
+
+    uint16_t reg[IMX2_WDT_REG_NUM];
+} IMX2WdtState;
+
+#endif /* IMX7_SNVS_H */
-- 
2.13.5

