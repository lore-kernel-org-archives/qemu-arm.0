Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp256798wrx;
        Wed, 27 Mar 2019 23:27:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5Pac4CWR25993J0SUzsiIEMVaRrNG+XDF+v1kv9N2Sq4q+fA99zr0Ow9+PjD0R4xcNWZW
X-Received: by 2002:a24:ccc5:: with SMTP id x188mr6672988itf.123.1553754463077;
        Wed, 27 Mar 2019 23:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553754463; cv=none;
        d=google.com; s=arc-20160816;
        b=bG+FkC60Hnuro2ewbhzsbQujA9Uhs/xEx8AU+TYs8bLw5G2ocjFjkKux05VJOla4hv
         vIQNCLyd3fZzJQ68mTMx8XpVB7BwN37kozCYMTRvSDXiR4u6x2A+aD5iwkj7v26B5qb3
         EWvoYs2/5/Hq9GTfzfOfdOPEPqAXJ2gl4JmvY+CnxXb3AflPJygDoS0pghJkgoNGMGfI
         xwMKCXEyzH52rNTTV3Ci8pnfkZ9cSshiMoQ7vQo5LvTl5lqJ5Hv11ZPOPGOBM0MQfTgA
         BQzeDcvuCEKo4tCBkgzuvpVsy3S9k30RtdOYOrWsaFeQIuAW4rsiEVcX5A3G4xyG+f3q
         iaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=4FxN9V/BT41CZKahL7Uifpdg4DmO88QVnNaG9tmDErY=;
        b=Ik68w3J4c9FwN8eZptC4Hzgk+U6D8wJR5nBpviItFPT8ij/eCNKCqHqTT5qHgi30Ku
         5kBk5C7bL6Oi38gLkBBwaEnRgZAbTcT1jUmOshDeGk1gz22yZPC/oyMi7wFz8BaHXgx4
         FAJ+s2bI01ziTfOyH0rZqKXBxupjxPs5BcsMeMgj3eWzUxBy9qCMEV9Sw03HxrjM0uts
         fOPBfH98/SJ/TymrrJXfY1i5GZrJzWeWN/G0MQ2q8deTfKBGwDs9hFWcIkegfii+ByGJ
         gwXRo13NqgBdxjmz+RG+byOoxy98WaEWrOOgLvfDUJGl4K1VfH4fly9JeAGQZi70c4a/
         ig4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OJIKvzzm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si11573502jal.7.2019.03.27.23.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Mar 2019 23:27:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OJIKvzzm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9OVq-0003af-6u
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 02:27:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1h9OVH-0003L6-Ci
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 02:27:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1h9OR7-00013A-1P
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 02:22:50 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:35393)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1h9OR6-00012k-OD; Thu, 28 Mar 2019 02:22:48 -0400
Received: by mail-pl1-x644.google.com with SMTP id p19so4488014plo.2;
	Wed, 27 Mar 2019 23:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4FxN9V/BT41CZKahL7Uifpdg4DmO88QVnNaG9tmDErY=;
	b=OJIKvzzmJhwlOL+C+WB5fsur6hHOEpTXJd4uR4diauBKA4nwqJm6QorON4KO7BK2I4
	GyJv251CB8SSp3uaI2I79NjNfko/zrZtCTnAiRVPVVDHQFu92dK04+7PVEFoPDELlYdG
	zHAMo6u0kvhI9eoi83vhpJiOr8vu0HqyMJ8AM56EI8MjKlMuV5Gsydh4ilLumygJPofH
	JAQ1OADMI5jdQ38wOUprvdIzcphz2d+4uqQvolP2yxlSv6aihV3ND1EwuNULyB4AODqs
	YLiO0h+qxhjVNCqz+0VUiZ6lRUJ4EAaAHugMDUHR87v+Cj5OOUhEacwvEJlFKivXKHvr
	uXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=4FxN9V/BT41CZKahL7Uifpdg4DmO88QVnNaG9tmDErY=;
	b=pt4dK5H/P8D8tWmhrTww/VPtDUU5xB1wPHoJR5jsWV+xMoVUzK23pELf+TQpMvyTU5
	S9PlEei4Mh3OCJ5AHTUj1aay5dJLLydvj/og6o8VO2Ugr3WKe6s2cUu0JGBVoJ8qdJa/
	mIiJy4dqC2Gm25rSgCEGCzCBT+8msZXrDlWWuvZ0g3RPMc6hOnOwOnylSZ48crsMDe0N
	xodS9scDNK0DCeWOlZWT5Kl4uclobIIJ4wF9V6kwyPkxFx8YOhTYo4vpetD18oJ70hpN
	t9Fpej8KVT+qDedQhaIOzFrf1PoASWqrGa/mClALikoMmMdFG6W9DoRdygISeH336JUO
	Dx8w==
X-Gm-Message-State: APjAAAXDhrWU9A5LluAufTzzZT89D6N+RxeXcgjo6ehrmKNqP1H32AOS
	OCXlzBdNWi7FlRETkf4EvR24PH+lK18=
X-Received: by 2002:a17:902:b48c:: with SMTP id
	y12mr41776255plr.280.1553754167684; 
	Wed, 27 Mar 2019 23:22:47 -0700 (PDT)
Received: from voyager.jms.id.au ([36.255.48.244])
	by smtp.gmail.com with ESMTPSA id
	z128sm51679264pfz.107.2019.03.27.23.22.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 23:22:47 -0700 (PDT)
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
	Thu, 28 Mar 2019 16:52:41 +1030
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>
Date: Thu, 28 Mar 2019 16:52:21 +1030
Message-Id: <20190328062222.8409-2-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190328062222.8409-1-joel@jms.id.au>
References: <20190328062222.8409-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-arm] [PATCH 1/2] hw: timer: Add ASPEED RTC device
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 24lwbfBDQfkz

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/timer/Makefile.objs        |   2 +-
 hw/timer/aspeed_rtc.c         | 157 ++++++++++++++++++++++++++++++++++
 hw/timer/trace-events         |   4 +
 include/hw/timer/aspeed_rtc.h |  31 +++++++
 4 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 hw/timer/aspeed_rtc.c
 create mode 100644 include/hw/timer/aspeed_rtc.h

diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 0e9a4530f848..123d92c9692c 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -41,7 +41,7 @@ obj-$(CONFIG_MC146818RTC) += mc146818rtc.o
 obj-$(CONFIG_ALLWINNER_A10_PIT) += allwinner-a10-pit.o
 
 common-obj-$(CONFIG_STM32F2XX_TIMER) += stm32f2xx_timer.o
-common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o
+common-obj-$(CONFIG_ASPEED_SOC) += aspeed_timer.o aspeed_rtc.o
 
 common-obj-$(CONFIG_SUN4V_RTC) += sun4v-rtc.o
 common-obj-$(CONFIG_CMSDK_APB_TIMER) += cmsdk-apb-timer.o
diff --git a/hw/timer/aspeed_rtc.c b/hw/timer/aspeed_rtc.c
new file mode 100644
index 000000000000..daccf00eccdc
--- /dev/null
+++ b/hw/timer/aspeed_rtc.c
@@ -0,0 +1,157 @@
+/*
+ * ASPEED Real Time Clock
+ * Joel Stanley <joel@jms.id.au>
+ *
+ * Copyright 2019 IBM Corp
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "hw/timer/aspeed_rtc.h"
+#include "qemu/log.h"
+#include "qemu/timer.h"
+
+#include "trace.h"
+
+#define COUNTER1        (0x00 / 4)
+#define COUNTER2        (0x04 / 4)
+#define ALARM           (0x08 / 4)
+#define CONTROL         (0x10 / 4)
+#define ALARM_STATUS    (0x14 / 4)
+
+#define RTC_UNLOCKED    BIT(1)
+#define RTC_ENABLED     BIT(0)
+
+static void aspeed_rtc_calc_offset(AspeedRtcState *rtc)
+{
+    struct tm tm;
+    uint32_t year, cent;
+    uint32_t reg1 = rtc->reg[COUNTER1];
+    uint32_t reg2 = rtc->reg[COUNTER2];
+
+    tm.tm_mday = (reg1 >> 24) & 0x1f;
+    tm.tm_hour = (reg1 >> 16) & 0x1f;
+    tm.tm_min = (reg1 >> 8) & 0x3f;
+    tm.tm_sec = (reg1 >> 0) & 0x3f;
+
+    cent = (reg2 >> 16) & 0x1f;
+    year = (reg2 >> 8) & 0x7f;
+    tm.tm_mon = ((reg2 >>  0) & 0x0f) - 1;
+    tm.tm_year = year + (cent * 100) - 1900;
+
+    rtc->offset = qemu_timedate_diff(&tm);
+}
+
+static uint32_t aspeed_rtc_get_counter(AspeedRtcState *rtc, int r)
+{
+    uint32_t year, cent;
+    struct tm now;
+
+    qemu_get_timedate(&now, rtc->offset);
+
+    switch (r) {
+    case COUNTER1:
+        return (now.tm_mday << 24) | (now.tm_hour << 16) |
+            (now.tm_min << 8) | now.tm_sec;
+    case COUNTER2:
+        cent = (now.tm_year + 1900) / 100;
+        year = now.tm_year % 100;
+        return ((cent & 0x1f) << 16) | ((year & 0x7f) << 8) |
+            ((now.tm_mon + 1) & 0xf);
+    default:
+        abort();
+    }
+}
+
+static uint64_t aspeed_rtc_read(void *opaque, hwaddr addr,
+                                unsigned size)
+{
+    AspeedRtcState *rtc = opaque;
+    uint64_t val;
+    uint32_t r = addr >> 2;
+
+    switch (r) {
+    case COUNTER1:
+    case COUNTER2:
+        if (rtc->reg[CONTROL] & RTC_ENABLED) {
+            rtc->reg[r] = aspeed_rtc_get_counter(rtc, r);
+        }
+    case ALARM:
+    case CONTROL:
+    case ALARM_STATUS:
+        val = rtc->reg[r];
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx "\n", __func__, addr);
+        return 0;
+    }
+
+    trace_aspeed_rtc_read(addr, val);
+
+    return val;
+}
+
+static void aspeed_rtc_write(void *opaque, hwaddr addr,
+                             uint64_t val, unsigned size)
+{
+    AspeedRtcState *rtc = opaque;
+    uint32_t r = addr >> 2;
+
+    switch (r) {
+    case COUNTER1:
+    case COUNTER2:
+        if (!(rtc->reg[CONTROL] & RTC_UNLOCKED)) {
+            break;
+        }
+    case CONTROL:
+        rtc->reg[r] = val;
+        aspeed_rtc_calc_offset(rtc);
+        break;
+    case ALARM:
+    case ALARM_STATUS:
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx "\n", __func__, addr);
+        break;
+    }
+    trace_aspeed_rtc_write(addr, val);
+}
+
+static const MemoryRegionOps aspeed_rtc_ops = {
+    .read = aspeed_rtc_read,
+    .write = aspeed_rtc_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void aspeed_rtc_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    AspeedRtcState *s = ASPEED_RTC(dev);
+
+    sysbus_init_irq(sbd, &s->irq);
+
+    memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_rtc_ops, s,
+                          "aspeed-rtc", 0x18ULL);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static void aspeed_rtc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = aspeed_rtc_realize;
+}
+
+static const TypeInfo aspeed_rtc_info = {
+    .name          = TYPE_ASPEED_RTC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(AspeedRtcState),
+    .class_init    = aspeed_rtc_class_init,
+};
+
+static void aspeed_rtc_register_types(void)
+{
+    type_register_static(&aspeed_rtc_info);
+}
+
+type_init(aspeed_rtc_register_types)
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index dcaf3d6da6c8..db02a9142cda 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -66,6 +66,10 @@ cmsdk_apb_dualtimer_read(uint64_t offset, uint64_t data, unsigned size) "CMSDK A
 cmsdk_apb_dualtimer_write(uint64_t offset, uint64_t data, unsigned size) "CMSDK APB dualtimer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: reset"
 
+# hw/timer/aspeed-rtc.c
+aspeed_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
+aspeed_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " value 0x%08" PRIx64
+
 # sun4v-rtc.c
 sun4v_rtc_read(uint64_t addr, uint64_t value) "read: addr 0x%" PRIx64 " value 0x%" PRIx64
 sun4v_rtc_write(uint64_t addr, uint64_t value) "write: addr 0x%" PRIx64 " value 0x%" PRIx64
diff --git a/include/hw/timer/aspeed_rtc.h b/include/hw/timer/aspeed_rtc.h
new file mode 100644
index 000000000000..1f1155a676c1
--- /dev/null
+++ b/include/hw/timer/aspeed_rtc.h
@@ -0,0 +1,31 @@
+/*
+ * ASPEED Real Time Clock
+ * Joel Stanley <joel@jms.id.au>
+ *
+ * Copyright 2019 IBM Corp
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef ASPEED_RTC_H
+#define ASPEED_RTC_H
+
+#include <stdint.h>
+
+#include "hw/hw.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+
+typedef struct AspeedRtcState {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    qemu_irq irq;
+
+    uint32_t reg[0x18];
+    int offset;
+
+} AspeedRtcState;
+
+#define TYPE_ASPEED_RTC "aspeed.rtc"
+#define ASPEED_RTC(obj) OBJECT_CHECK(AspeedRtcState, (obj), TYPE_ASPEED_RTC)
+
+#endif /* ASPEED_RTC_H */
-- 
2.20.1

