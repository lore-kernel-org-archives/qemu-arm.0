Received: by 10.28.71.27 with SMTP id u27csp4678564wma;
        Tue, 27 Feb 2018 02:49:56 -0800 (PST)
X-Google-Smtp-Source: AG47ELtFgJ5ujAsFSqWEnkflvD66LbEk0Ipro6W3j0dGbBHFPkSuKfZKwQZxVGwkSp372nRF277C
X-Received: by 2002:a25:8b91:: with SMTP id j17-v6mr9208261ybl.252.1519728596750;
        Tue, 27 Feb 2018 02:49:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519728596; cv=none;
        d=google.com; s=arc-20160816;
        b=bigVLWokys/bJRkHb+FlAdJ9K/BF20i5i35kxwqGIWyVgsK3qQzqc01ns+a41uV92m
         r+tLcc+ULGy9ZCO6F5yrybOP1uXZc5I8YofL4XS1o4I6eorCFQsbxC1WX3A2wOXmIDTq
         bNf4ZtEjzh96qb7gGwAlfEotqgMUGckNFI0o9vWutmq5ZtjsolZ46mmtNV5QeKMk2s/8
         ikQS6rpoOCSwtBwp7weaSUSPQyk777oksw8MTuDtUwJ3bgvQCFxaPg2s3AnyJSdhjn8i
         Rj4O7C84EVUC9ACoKf+lOeC9eOgcjSawtrqptB2aDwmx0hDhPWWr6aj7a05/tjV0Y8Y9
         oA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=zj13AenJ6oUb9CSbGAylVOy8XTzH/fVL67zcJq0NUxg=;
        b=dvW82x7lNaH0OnNmU3Or+qkU+R7JBjQjkh/yALTvuqh8oUojyLmCWmeIuYA6bXpvVd
         UUZbm68LrcmxLrRPsJaEJ3WWG/USA444/HjC9kdNmOmFpgV0naaWdSIimgWtoLf/ynMY
         pnXXXsqR4S4PaurPYPpCDMUBMRoCKmadT04RPabm7wI0NPPxjdshWlXBywGMR1VGSgIF
         MhxVwrsb1kH3KT9BvmE2KUUTWe4anWa58rJJh4YrHZI28FmVL2pGbD53QK/m13Tcamt1
         eMUDVO/Kwda77b+qGghjuGEYVYdYxkzJ+g1MNrvRw2XRhFOieqAKoTZDrV2KwsP4oIvE
         SlXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ql296rb+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p66si1810820ywf.613.2018.02.27.02.49.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 02:49:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ql296rb+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36165 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqcpY-0006Ri-5s
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 05:49:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcow-0006MO-H9
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 05:49:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcov-0004DW-81
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 05:49:18 -0500
Received: from mail-lf0-x234.google.com ([2a00:1450:4010:c07::234]:33090)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1eqcou-0004Cw-Sf
	for qemu-devel@nongnu.org; Tue, 27 Feb 2018 05:49:17 -0500
Received: by mail-lf0-x234.google.com with SMTP id o145so23588954lff.0
	for <qemu-devel@nongnu.org>; Tue, 27 Feb 2018 02:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zj13AenJ6oUb9CSbGAylVOy8XTzH/fVL67zcJq0NUxg=;
	b=Ql296rb+EuV/P1JhqDrKkfDVNKDJ1o++THP9/0rFbU+X/hwQi244cNukzaymcZtv+K
	kBZv3gGOHi5JIr6EWS8L/7dLrE5OGVDlmSs2Fupa2b+9XYIRxrXmqo1laua+QkyE9WoP
	Ej3Ro1bIJvjiK5cUIaDQ309yiPUbq7YLuF2Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zj13AenJ6oUb9CSbGAylVOy8XTzH/fVL67zcJq0NUxg=;
	b=eCP4AWKj4iRLZu1Z2Zn/AmlwcHllBJ7kDNTvP6q0HEII++5Hpyq05kb/Hm01xjPYpO
	+B/l/+kwxjBN2LK6jXnao2YC+b8XpGKUbu6pJD5WJcHVLRWpNn5MXX+Wy0pCcWduYqma
	5EPpGn3eKeSwwLmjruPWTA4Md5f9EknLFlBFH1ebPLKfwA5hXxo/z8U+tjfLzgtoCx1w
	EJdGzG86M73m0X3zYdkxEYzdMFAW80uxP0AK2hb5sbHgj6jGv4ueaX1UWH47zNBACM1i
	ySSz9pSN0hCjSXPunqZO2tUq/9COx3HMbz1Bh1N2mx4SwIpgDHXkTgFMLm8YCQ5ImwmH
	7/Cw==
X-Gm-Message-State: APf1xPD/in7HZ4b7wfyRkm3pxcje4jRmVRnytAlM1x2jx2PbHmqGsBRj
	pjTn0uhk7j14UHiKR+R9/V1Q62EXKGI=
X-Received: by 10.25.206.143 with SMTP id e137mr10463329lfg.95.1519728555086; 
	Tue, 27 Feb 2018 02:49:15 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
	by smtp.gmail.com with ESMTPSA id 74sm2484148ljq.32.2018.02.27.02.49.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Feb 2018 02:49:14 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 11:49:02 +0100
Message-Id: <20180227104903.21353-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180227104903.21353-1-linus.walleij@linaro.org>
References: <20180227104903.21353-1-linus.walleij@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::234
Subject: [Qemu-devel] [PATCH 4/5] hw/sii9022: Add support for Silicon Image
 SII9022
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
Cc: Corey Minyard <cminyard@mvista.com>,
	Linus Walleij <linus.walleij@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aaKbOj6u8nPl

This adds support for emulating the Silicon Image SII9022 DVI/HDMI
bridge. It's not very clever right now, it just acknowledges
the switch into DDC I2C mode and back. Combining this with the
existing DDC I2C emulation gives the right behavior on the Versatile
Express emulation passing through the QEMU EDID to the emulated
platform.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Update license to GPLv2 or later + SPDX identifier
- Instantiate the DDC I2C as part of the class realization so
  we do not need to add the DDC "on the side" in machines
  using SII9022.
- Switch to using trace events instead of debug prints.
---
 hw/display/Makefile.objs |   1 +
 hw/display/sii9022.c     | 188 +++++++++++++++++++++++++++++++++++++++++++++++
 hw/display/trace-events  |   5 ++
 3 files changed, 194 insertions(+)
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
index 000000000000..b019ac0ca880
--- /dev/null
+++ b/hw/display/sii9022.c
@@ -0,0 +1,188 @@
+/*
+ * Silicon Image SiI9022
+ *
+ * This is a pretty hollow emulation: all we do is acknowledge that we
+ * exist (chip ID) and confirm that we get switched over into DDC mode
+ * so the emulated host can proceed to read out EDID data. All subsequent
+ * set-up of connectors etc will be acknowledged and ignored.
+ *
+ * Copyright (C) 2018 Linus Walleij
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "hw/i2c/i2c.h"
+#include "hw/i2c/i2c-ddc.h"
+#include "trace.h"
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
+
+    trace_sii9022_read_reg(s->ptr, res);
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
+                trace_sii9022_switch_mode("DDC");
+            }
+        } else {
+            s->ddc_req = false;
+            s->ddc = false;
+            trace_sii9022_switch_mode("normal");
+        }
+        break;
+    default:
+        break;
+    }
+
+    trace_sii9022_write_reg(s->ptr, data);
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
+static void sii9022_realize(DeviceState *dev, Error **errp)
+{
+    I2CBus *bus;
+
+    bus = I2C_BUS(qdev_get_parent_bus(dev));
+    i2c_create_slave(bus, TYPE_I2CDDC, 0x50);
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
+    dc->realize = sii9022_realize;
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
diff --git a/hw/display/trace-events b/hw/display/trace-events
index da498c1def45..5a48c6cb6a6d 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -132,3 +132,8 @@ vga_cirrus_read_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_cirrus_write_io(uint32_t addr, uint32_t val) "addr 0x%x, val 0x%x"
 vga_cirrus_read_blt(uint32_t offset, uint32_t val) "offset 0x%x, val 0x%x"
 vga_cirrus_write_blt(uint32_t offset, uint32_t val) "offset 0x%x, val 0x%x"
+
+# hw/display/sii9022.c
+sii9022_read_reg(uint8_t addr, uint8_t val) "addr 0x%02x, val 0x%02x"
+sii9022_write_reg(uint8_t addr, uint8_t val) "addr 0x%02x, val 0x%02x"
+sii9022_switch_mode(const char *mode) "mode: %s"
-- 
2.14.3

