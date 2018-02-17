Received: by 10.28.71.27 with SMTP id u27csp1864332wma;
        Sat, 17 Feb 2018 06:05:42 -0800 (PST)
X-Google-Smtp-Source: AH8x2245sGj6XS2JnkT9IXBqallSi+S6nDbGmzpGZt3sOW8jO/pZpuOPbjD6ynasQqIm+acfNiY0
X-Received: by 10.129.228.4 with SMTP id r4mr7114443ywl.301.1518876342509;
        Sat, 17 Feb 2018 06:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518876342; cv=none;
        d=google.com; s=arc-20160816;
        b=pSnLfNTAK4pzZdJVtF4IB+SFy1WOtHIf2ELtKRW6ES7w/5URArsJTzeSivrb3uYYe6
         YQc+pbTyJ69UNN6sD/7RDevPdSH33P9LxK4lIMNRm0myMJbzrfvCZsyXT6gPRjN9ihmQ
         8EoSdXXg4TNvsCDV4kMwl5A9Vt1LQRvCtcUSasNzjBDka85039iobzspjO5DEjBBirCD
         Fa1MkV79t0J8B8XOQFZJfKcqZMRG7ApGW+hH46HOcLUIDD9USybG1INDirJotLxfG+q8
         x6zt38+UR9Qk4RYDuUsK8+6N5pq+B1g99YN9YwJbnWGn16gNJQv1jEMkEm1yB16m7Zqu
         V1yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=KWsTBDfBdhi/iC7vjg9grd1Np8GxFeYjxGwjjAolK6I=;
        b=d0oKDG65gVxEy9yWUjXgY/1doLRfZ18N/NAX/V56g63Cl/QB3LoMRr3+3qhu0MljSt
         i22aMCT4J6CIHsMDJvYLKxj+F4aFI/EChrYGgwLz2h2OUWoD4Ifmuavg3wHMgIlUcgnR
         DaoIhUK4ctayAYEpWIyAThI1sXoMWEg5zjaDg/ziMhPPx9gecsOnMWFt2xnUjyGtFj/Z
         DxmZOzmBoRfueI8FquDi+kTVpF69GJBoYoLuXTBJv/bDsw1tf9METBqxi1j5ZKL061I6
         uwfMVs/+nahScmu1FZGpovN6beFar8hw9tW6Hj8ULr5wUdce33aBQ+Fk3c5jBFWn28v8
         5/1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SC4BoolG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w3si1162957ybi.754.2018.02.17.06.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 06:05:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SC4BoolG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en37V-0007g4-Vd
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 09:05:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1en35w-0006XP-JC
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 09:04:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1en35v-00047r-E6
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 09:04:04 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:35295)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1en35v-00047X-2L
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 09:04:03 -0500
Received: by mail-lf0-x243.google.com with SMTP id 70so1599942lfw.2
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 06:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KWsTBDfBdhi/iC7vjg9grd1Np8GxFeYjxGwjjAolK6I=;
	b=SC4BoolGW0kUQqXv3N56R6MRundntLhypznH4xoXA7IW3MA2j7/2h/AF+pkURR1LWE
	4eWsY5uMwWnoJ+8apDjoxMDhnYPwcCI3N436VP+r9ugZ7fI/9wQyxmHUr+vJCmHx/0W7
	0MGTLykHfURkR9uKTh5hLFuWntG4q7beVzLz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KWsTBDfBdhi/iC7vjg9grd1Np8GxFeYjxGwjjAolK6I=;
	b=cLxHLi7mTKNS4nNnAZ2G32ByoolMgfuVfGQ8BFekWXALFHFtqheMvr3y2h8uuXLLFY
	4/nq5EANN1QAeQOwnNdoiLFqJe6zTDlz29dZk41IhC+eY9PAVy9NUioWVhvYoMYXcPtM
	f/76AABFKZxJws+P4LkPKcn8xYq83C7Ll9vtOyogVZYQgPoZDv3RoZX5rtnb9UViDkEr
	lxwldqBQZtyk66waaF8MQk8xKfVsQUTyZ/Ll4I65fqROAiOpOW9vuKLYHyXSTCvKcTGn
	amYLAEIbp3Fx2YUXqs372DxRsQLa9GL4VELnnwxkCSqJBXJuzreDonWFfJd4eq9/3/Lt
	Ygsg==
X-Gm-Message-State: APf1xPATtlGm58XWQ6OVq8NnvcJ95TtD07UvEZ2rdHWlAmDzXcbBL4KJ
	2jYKC57Y1ImHU8LxnQO9zZxdoA==
X-Received: by 10.46.41.157 with SMTP id p29mr5956160ljp.137.1518876241656;
	Sat, 17 Feb 2018 06:04:01 -0800 (PST)
Received: from localhost.localdomain
	(c-cb7471d5.014-348-6c756e10.cust.bredbandsbolaget.se.
	[213.113.116.203]) by smtp.gmail.com with ESMTPSA id
	w204sm122054lff.29.2018.02.17.06.04.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 06:04:00 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 15:00:50 +0100
Message-Id: <20180217140051.22731-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217140051.22731-1-linus.walleij@linaro.org>
References: <20180217140051.22731-1-linus.walleij@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: [Qemu-arm] [PATCH 2/3] hw/sii9022: Add support for Silicon Image
 SII9022
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
Cc: Linus Walleij <linus.walleij@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hj3JtYaXv8lz

This adds support for emulating the Silicon Image SII9022 DVI/HDMI
bridge. It's not very clever right now, it just acknowledges
the switch into DDC I2C mode and back. Combining this with the
existing DDC I2C emulation gives the right behavior on the Versatile
Express emulation passing through the QEMU EDID to the emulated
platform.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 hw/display/Makefile.objs |   1 +
 hw/display/sii9022.c     | 185 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 186 insertions(+)
 create mode 100644 hw/display/sii9022.c

diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index d3a4cb396eb9..3c7c75b94da5 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -3,6 +3,7 @@ common-obj-$(CONFIG_VGA_CIRRUS) += cirrus_vga.o
 common-obj-$(CONFIG_G364FB) += g364fb.o
 common-obj-$(CONFIG_JAZZ_LED) += jazz_led.o
 common-obj-$(CONFIG_PL110) += pl110.o
+common-obj-$(CONFIG_SII9022) += sii9022.o
 common-obj-$(CONFIG_SSD0303) += ssd0303.o
 common-obj-$(CONFIG_SSD0323) += ssd0323.o
 common-obj-$(CONFIG_XEN) += xenfb.o
diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
new file mode 100644
index 000000000000..d6f3cdc04293
--- /dev/null
+++ b/hw/display/sii9022.c
@@ -0,0 +1,185 @@
+/*
+ * Silicon Image SiI9022
+ *
+ * This is a pretty hollow emulation: all we do is acknowledge that we
+ * exist (chip ID) and confirm that we get switched over into DDC mode
+ * so the emulated host can proceed to read out EDID data. All subsequent
+ * set-up of connectors etc will be acknowledged and ignored.
+ *
+ * Copyright (c) 2018 Linus Walleij
+ *
+ * This code is licensed under the GNU GPL v2.
+ *
+ * Contributions after 2012-01-13 are licensed under the terms of the
+ * GNU GPL, version 2 or (at your option) any later version.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "hw/i2c/i2c.h"
+
+#define DEBUG_SII9022 0
+
+#define DPRINTF(fmt, ...) \
+    do { \
+        if (DEBUG_SII9022) { \
+            printf("sii9022: " fmt, ## __VA_ARGS__); \
+        } \
+    } while (0)
+
+#define SII9022_SYS_CTRL_DATA 0x1a
+#define SII9022_SYS_CTRL_PWR_DWN 0x10
+#define SII9022_SYS_CTRL_AV_MUTE 0x08
+#define SII9022_SYS_CTRL_DDC_BUS_REQ 0x04
+#define SII9022_SYS_CTRL_DDC_BUS_GRTD 0x02
+#define SII9022_SYS_CTRL_OUTPUT_MODE 0x01
+#define SII9022_SYS_CTRL_OUTPUT_HDMI 1
+#define SII9022_SYS_CTRL_OUTPUT_DVI 0
+#define SII9022_REG_CHIPID 0x1b
+#define SII9022_INT_ENABLE 0x3c
+#define SII9022_INT_STATUS 0x3d
+#define SII9022_INT_STATUS_HOTPLUG 0x01;
+#define SII9022_INT_STATUS_PLUGGED 0x04;
+
+#define TYPE_SII9022 "sii9022"
+#define SII9022(obj) OBJECT_CHECK(sii9022_state, (obj), TYPE_SII9022)
+
+typedef struct sii9022_state {
+    I2CSlave parent_obj;
+    uint8_t ptr;
+    bool addr_byte;
+    bool ddc_req;
+    bool ddc_skip_finish;
+    bool ddc;
+} sii9022_state;
+
+static const VMStateDescription vmstate_sii9022 = {
+    .name = "sii9022",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_I2C_SLAVE(parent_obj, sii9022_state),
+        VMSTATE_UINT8(ptr, sii9022_state),
+        VMSTATE_BOOL(addr_byte, sii9022_state),
+        VMSTATE_BOOL(ddc_req, sii9022_state),
+        VMSTATE_BOOL(ddc_skip_finish, sii9022_state),
+        VMSTATE_BOOL(ddc, sii9022_state),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static int sii9022_event(I2CSlave *i2c, enum i2c_event event)
+{
+    sii9022_state *s = SII9022(i2c);
+
+    switch (event) {
+    case I2C_START_SEND:
+        s->addr_byte = true;
+        break;
+    case I2C_START_RECV:
+        break;
+    case I2C_FINISH:
+        break;
+    case I2C_NACK:
+        break;
+    }
+
+    return 0;
+}
+
+static int sii9022_rx(I2CSlave *i2c)
+{
+    sii9022_state *s = SII9022(i2c);
+    uint8_t res = 0x00;
+
+    switch (s->ptr) {
+    case SII9022_SYS_CTRL_DATA:
+        if (s->ddc_req) {
+            /* Acknowledge DDC bus request */
+            res = SII9022_SYS_CTRL_DDC_BUS_GRTD | SII9022_SYS_CTRL_DDC_BUS_REQ;
+        }
+        break;
+    case SII9022_REG_CHIPID:
+        res = 0xb0;
+        break;
+    case SII9022_INT_STATUS:
+        /* Something is cold-plugged in, no interrupts */
+        res = SII9022_INT_STATUS_PLUGGED;
+        break;
+    default:
+        break;
+    }
+    DPRINTF("%02x read from %02x\n", res, s->ptr);
+    s->ptr++;
+
+    return res;
+}
+
+static int sii9022_tx(I2CSlave *i2c, uint8_t data)
+{
+    sii9022_state *s = SII9022(i2c);
+
+    if (s->addr_byte) {
+        s->ptr = data;
+        s->addr_byte = false;
+        return 0;
+    }
+
+    switch (s->ptr) {
+    case SII9022_SYS_CTRL_DATA:
+        if (data & SII9022_SYS_CTRL_DDC_BUS_REQ) {
+            s->ddc_req = true;
+            if (data & SII9022_SYS_CTRL_DDC_BUS_GRTD) {
+                s->ddc = true;
+                /* Skip this finish since we just switched to DDC */
+                s->ddc_skip_finish = true;
+                DPRINTF("switched to DDC mode\n");
+            }
+        } else {
+            s->ddc_req = false;
+            s->ddc = false;
+        }
+        break;
+    default:
+        break;
+    }
+
+    DPRINTF("%02x written to %02x\n", data, s->ptr);
+    s->ptr++;
+
+    return 0;
+}
+
+static void sii9022_reset(DeviceState *dev)
+{
+    sii9022_state *s = SII9022(dev);
+
+    s->ptr = 0;
+    s->addr_byte = false;
+}
+
+static void sii9022_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+
+    k->event = sii9022_event;
+    k->recv = sii9022_rx;
+    k->send = sii9022_tx;
+    dc->reset = sii9022_reset;
+    dc->vmsd = &vmstate_sii9022;
+}
+
+static const TypeInfo sii9022_info = {
+    .name          = TYPE_SII9022,
+    .parent        = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(sii9022_state),
+    .class_init    = sii9022_class_init,
+};
+
+static void sii9022_register_types(void)
+{
+    type_register_static(&sii9022_info);
+}
+
+type_init(sii9022_register_types)
-- 
2.14.3

