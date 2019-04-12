Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp118728wrx;
        Thu, 11 Apr 2019 21:54:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxh4FazQygIuwJsPp8T/hMV2MlgRXNAAOJW5R5WLVN+kct4RvQcTpnrAwEnYRekGG/MMIbi
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr9537575wmj.41.1555044899491;
        Thu, 11 Apr 2019 21:54:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555044899; cv=none;
        d=google.com; s=arc-20160816;
        b=X8EYlVGeG7d2kb2saR5seMNkyjLKXzj2yhld0NaMBYWqHGlaOGWl4VmH2lukrMEiaB
         kfwF6hjDUqq3EkR8xwnm35Awgwt6mj79v5mzCjV9ktWpMSTFBhROdiBnNK6SPEihYfj/
         2+taCk7C7irAoen11Myx/Sqtg324iY7G91jSZuJJScIShSGZwQ3lVtsSUDoWCv9+Ugc7
         4yoYbyIvxjjZPfH7y4Rg22R+ROtjKevXoDSCkTMHJ2fn0Ebm1frnF5wnX8Qzq39CWgJa
         WoUOCxrRcgSBgeteYXq2lAgCs0Ez/b7KZYR1QqLd5r3q4vjtSazPIcWY57ImaILBJjtc
         3C6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=UtwwdswuQTVY78rOrnx+cZ0SUKEyn0jmcL9H2uyrBe0=;
        b=CTuiqz/iy3CVjzh7J7tyDt5intSvesoKyvPUAa2h1O5F7qF+G9jcphUuSFYcIfQer6
         XeVCfPQZD8Y7ZuAt6pAqLqJ1VN1GB54cw2T8rzVdhSgJVujHztaCjZ16Kki3eugKW4uB
         ARva+WfdeJ8fjOtr069hE28QDMzt7JYsXDWgQ3FWty2jJhU2YRLPtSSGTul5Img7ZD6A
         misLsarE1i3b0+hNC+/j9w/QpMQJzEn2CTd82XEeAMsVfyeXYUWs3B8VUxxDWdOi/ZVK
         tu8IpxM4U5+N5c4Cbsk12iMq3If9le8gBClI8mkrPQNZda3IQrHleuxAh+a8PeBfTCAl
         H2Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iIUMATIj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r193si4362846wmf.61.2019.04.11.21.54.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Apr 2019 21:54:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iIUMATIj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:58945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEoDK-0007Bw-Fi
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 00:54:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hEoD9-0007Bf-Ja
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 00:54:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hEoD8-00008f-3y
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 00:54:47 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:43400)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hEoD7-000080-R6; Fri, 12 Apr 2019 00:54:46 -0400
Received: by mail-pl1-x642.google.com with SMTP id n8so4470830plp.10;
	Thu, 11 Apr 2019 21:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UtwwdswuQTVY78rOrnx+cZ0SUKEyn0jmcL9H2uyrBe0=;
	b=iIUMATIjtGtpNcaWt1ZGv3S1QwmliPMi1ZUNNqyONLB53oBjUdDA5yqOAXnzp5kvAB
	8MsZ4UfSzxcNjwsrgTAf6J2QihSc2tEnNJUvRdNk3eG0f/uLtv56f19iTEorC0uVMth/
	/QroRXOjYbo5kV17hMunTaMsbP3BeYVp9K078d2zwF7vov9nTT4A3c0j3a7JaK82aGNM
	Y9P08okE5Rypy/SQfLUktyEHF5CQNmW7fKguXaZs7y45W3qjGXlVkFP4jIRI7Y1ZgxmQ
	fMWJuqMsqxA7rqtSBv8zRWP/OpF7vtorMsrUj6zIMmGFY1S68QtnfIGGJFdvo0VaqztO
	thsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=UtwwdswuQTVY78rOrnx+cZ0SUKEyn0jmcL9H2uyrBe0=;
	b=b4/2kNe/w6oMsA7y+36rh3b2SSlT2bNJj4helnv79S5KWWdUbyBOBvAINIkwo5f3BW
	FuaA/in2eKOx5mUhl/w7yBjWUnHze/NiZTTFIKXo/CKCJxkU/Y4yIOEu6eVMNkvP8ViK
	1WKq1pKXZZwOHE8LToF4GzbIduyEcBhUMk13QlT6wzJxnhmmlVh41/b2Bc4+2yujSFYO
	I1W03CCbANpApyw0D3NflRPFZw+vXeloeIlAwsh7mLD02by6bG0ZXytwxlK9Pfzl8oFg
	lfBsCHbH/rp3Spnd3FQG/DDtG8HVhtVyrc7s/QgwK01PnlyJoGt0EIUQEzejZEDcbV+6
	chkg==
X-Gm-Message-State: APjAAAXeoSwC7KpD0vbO3p5iM1yIlUGhq4z4Ilxu81EaDoyVLxvsBIcx
	nFNp1PlnCtY3NQ59YOkA1Q0=
X-Received: by 2002:a17:902:2c01:: with SMTP id
	m1mr44834140plb.186.1555044884176; 
	Thu, 11 Apr 2019 21:54:44 -0700 (PDT)
Received: from voyager.jms.id.au ([36.255.48.244])
	by smtp.gmail.com with ESMTPSA id
	x16sm88515747pge.27.2019.04.11.21.54.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Apr 2019 21:54:43 -0700 (PDT)
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
	Fri, 12 Apr 2019 14:24:37 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>
Date: Fri, 12 Apr 2019 13:49:32 +0930
Message-Id: <20190412041933.12264-2-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412041933.12264-1-joel@jms.id.au>
References: <20190412041933.12264-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v2 1/2] hw: timer: Add ASPEED RTC device
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
X-TUID: vcuXcTwCHCS0

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
v2:
 Use g_assert_not_reached
 Add vmstate
 Add reset callback
 Annotate fall through cases

 hw/timer/Makefile.objs        |   2 +-
 hw/timer/aspeed_rtc.c         | 180 ++++++++++++++++++++++++++++++++++
 hw/timer/trace-events         |   4 +
 include/hw/timer/aspeed_rtc.h |  31 ++++++
 4 files changed, 216 insertions(+), 1 deletion(-)
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
index 000000000000..19f061c846e8
--- /dev/null
+++ b/hw/timer/aspeed_rtc.c
@@ -0,0 +1,180 @@
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
+        g_assert_not_reached();
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
+        /* fall through */
+    case CONTROL:
+        val = rtc->reg[r];
+        break;
+    case ALARM:
+    case ALARM_STATUS:
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
+        /* fall through */
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
+static void aspeed_rtc_reset(DeviceState *d)
+{
+    AspeedRtcState *rtc = ASPEED_RTC(d);
+
+    rtc->offset = 0;
+    memset(rtc->reg, 0, sizeof(rtc->reg));
+}
+
+static const MemoryRegionOps aspeed_rtc_ops = {
+    .read = aspeed_rtc_read,
+    .write = aspeed_rtc_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_aspeed_rtc = {
+    .name = TYPE_ASPEED_RTC,
+    .version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(reg, AspeedRtcState, 0x18),
+        VMSTATE_INT32(offset, AspeedRtcState),
+        VMSTATE_INT32(offset, AspeedRtcState),
+        VMSTATE_END_OF_LIST()
+    }
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
+    dc->vmsd = &vmstate_aspeed_rtc;
+    dc->reset = aspeed_rtc_reset;
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

