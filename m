Received: by 10.223.161.27 with SMTP id o27csp236935wro;
        Mon, 23 Oct 2017 13:21:21 -0700 (PDT)
X-Received: by 10.129.4.206 with SMTP id 197mr9744647ywe.45.1508790081118;
        Mon, 23 Oct 2017 13:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508790081; cv=none;
        d=google.com; s=arc-20160816;
        b=OSP+Zv+OdWc8J+5KAmquYMXhcaYm8Dmfju9nPWe3QEPuCzLQNMi1RAdJHyVtU2Q8J7
         0U83Y/GEVrTqmRk1WicVljzxp+oilE9yyEuDGPDJT42pghdzcuUyzEQYGP5e3wGlBw4l
         +60h9HnJ+dGcha07p86Taymbf4UCZeudkxnvKuji4z0qEJ+oKHOOCoZYIDeeuQf7pPrn
         HwBqSiBppRZui8CmqkNveHR6q4ruVqDg8PVsrsT1oSq6HR6BG3gY5LFNK0kaqONA06jc
         pWHgyg3m+rGH9qFGctb36TCVbae8qO7nK0+zs0aGbz+Dadd0H+XCk/TuU5dZU48OjBxI
         D2Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=lU8Rq8f7qGXcPVY8e0sGYWSZgo1vm4fgQF74UvW6GNE=;
        b=xoG4odr7HQ18WvbO7MR2ZSOX2Y3pwRZ9jgqDALlWkoK+A3GDeK1HCCPY/PleuZKK5d
         Lglp0BcNtWaCjiBogqUvk02wSqo5JNz3isHMMoYfF7ZjA2Ps4v1XioBhbqCqtG+bikbx
         2PVI/gaOZdyqtHT9sQzA0A6ewhG77yWAau30MbuBfCIn3fx0jVFXCHW8F2YBVrMF3p6U
         Q4CE+hyWljSKusWmoXgCgcAjIMf4wf9JhBFHvqMKFEfxerVX/2G5YbulMY1QF7yaaUnE
         Ai43aTSEnFdHP9VU/UjGgymjs25Q56N4Bqail8PkJk5wfPq3BWCaTkCZDwxoGkDaJW++
         wtpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=juWp9Hmo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 140si1379756ywg.583.2017.10.23.13.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 13:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=juWp9Hmo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6jDs-0008Qn-GH
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 16:21:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4O-0000KT-Rt
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e6j4N-0002XX-Mp
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 16:11:32 -0400
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:54019)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e6j4N-0002XM-Ez; Mon, 23 Oct 2017 16:11:31 -0400
Received: by mail-pg0-x241.google.com with SMTP id s2so12622069pge.10;
	Mon, 23 Oct 2017 13:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lU8Rq8f7qGXcPVY8e0sGYWSZgo1vm4fgQF74UvW6GNE=;
	b=juWp9HmoHYE0E4KPTxDP01CVby2c3HEhk2BSmJd1fiEWPdoX9EfXBs+qwcEhy2ysRW
	FlEwpnNntSS/BqfczeWTv0DRfELdmzoFIJIFY5V60AXjgcRl6heKRWiq59z1Hl8kV6du
	0wngcXheGJkWE2XeFZef4CKBUhrtmW4fF7ihld2mynsva0wYSzzMdKaGkXYB8KScq4IG
	o1kxK7o5oXVzU0vDUJK+FSn6SSNK7RHFapovBrmoO7c+Qi3A5NJj27Py1pHf4I305Xxc
	cUHeUwPmN8Vj07lCiHN8w3Jx/XJBYFMbt2p5myn0dhGzL5r/Uwj7+Jm02pTHS6L7NWDq
	JxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lU8Rq8f7qGXcPVY8e0sGYWSZgo1vm4fgQF74UvW6GNE=;
	b=kJ/vuXqvJ8JzeCZGN8ZbbiQJHr4fWU+kQ2uihs0NimVYHISh2tDFKlYo5f+EOIV8Nm
	/2MmtB7CdkiM4836IHS7/rYkE707MHZylY2UQiwo7O2xgvcyUDuGKipEs7aRi0Y9/M2r
	mgfusMOQ/TJDG3Gh4Z/6HV6eOkJW2tEZ8AGo7GDSKOAQI8QcXvoRCK6j6xZRYRzvGezb
	UKiNyMhrKMuNSedyk4R1r1cSI/synsHoz9ABto4o3VMjZCvGVSEL0lf8KTpjkk0X2EUn
	JfmXXXYxlHwx2ubZ56bmQAelqdZ6lDVWBvgj4AmmhqpAlcJSFJxHhDFndLV2LFu9p7Xm
	+UtQ==
X-Gm-Message-State: AMCzsaVH/FPTv1wwF7pFC/ekq6+OwXRzZllb3e0AxJGieVRnzuplSPwL
	Xw7Zw+vGA5WbMl+3SyE6yLzSjM+i
X-Google-Smtp-Source: ABhQp+QluQDv/jLG8m4L8Z0eb8zHkgN3Cahv7XxAMlAfe2SDEd6qQ84vf3diMaZ5o+CYefsgmruFqw==
X-Received: by 10.84.132.42 with SMTP id 39mr10981220ple.382.1508789490397;
	Mon, 23 Oct 2017 13:11:30 -0700 (PDT)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	j1sm15181623pfj.108.2017.10.23.13.11.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 23 Oct 2017 13:11:29 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 23 Oct 2017 13:10:42 -0700
Message-Id: <20171023201055.21973-15-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20171023201055.21973-1-andrew.smirnov@gmail.com>
References: <20171023201055.21973-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-arm] [PATCH v2 14/27] i.MX: Add code to emulate i.MX2
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
X-TUID: FAPlvF00At2A

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
2.13.5

