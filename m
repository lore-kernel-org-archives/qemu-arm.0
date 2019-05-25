Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4310218wrg;
        Sat, 25 May 2019 08:14:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzn2cOqd9wH49bt4bID8h5rRBeHiwYqit7X0eZ13LIYAtIrX3RBQYFtH7TbGsNx0jo0D7HU
X-Received: by 2002:a1f:f80f:: with SMTP id w15mr11618070vkh.47.1558797257263;
        Sat, 25 May 2019 08:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558797257; cv=none;
        d=google.com; s=arc-20160816;
        b=xWupqRUOY/eC7b4uUGWaIpOrKl+/amr3OFZTp5r0z/TKxzNrkAxYbbVG/jHrnuB2PA
         HXlzTPPUXQi7pMi0/LXQLHiDCr0BiadGf43CfpiW3KYK5Of3qa1ZVkuP52dEJaUU+9AM
         qHxmUaMA35GRRCjU/ZvBFELfECW3oD35lkFRa2C03pDzadkWKy0V6EPt99nzyUt+w3tE
         8kKfpsu7cMl8A063ssCyLnpdtr8M9SaLd89iq7NcaTNU0qxK5r9ird9CxnSHOy8CFmEX
         ok2z90Vifl0YagN9rwDIuXhZd1zTvAzNRxHMJFWs/QqMFyKGoaK9N0OtbDbLgFrqQAjy
         aUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dm/3y+dZVVdkJ84ERjsyR9SrO74fiqlc7RmbvSyv+lQ=;
        b=gB4dvLtj1KdcRWTczJxhG0AW94vtSmH4J+cvdhizv0rFk7Ty+/kXA+BVuFKhhiYykW
         zQ06u3eLGGh1lFksERbWihZocMotMehnfFqtT+YYO5C0EBd85ExufvGGmR8E9f5P0jUR
         kPaH89sCG5jrSDgPejrsGeBh/3YCCFSU6PY6yBJtJa49IMe5Qi38acu398BAOj2bHRcQ
         YqGYd6X0JzCkLIM7Rr125g+2E/H7TgLsxxdhNBM6mnLb7bXGy5J6Rg+YCYwN5LJ7r8z6
         cfNkCpTsy1WZGLmNdQm6FRTX6wDqqXJhsPbgEd/JUsrFgiBi3vuFSb1SyBQ39QXc9oQl
         P7RA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z1si2289031uae.93.2019.05.25.08.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 08:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43159 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUYNE-00063F-JK
	for alex.bennee@linaro.org; Sat, 25 May 2019 11:14:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYMY-0005eL-J9
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:13:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYMW-0001Zf-Vc
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:13:34 -0400
Received: from 8.mo173.mail-out.ovh.net ([46.105.46.122]:47996)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYMW-0001YT-NO
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:13:32 -0400
Received: from player698.ha.ovh.net (unknown [10.108.35.103])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id D003F104B3E
	for <qemu-arm@nongnu.org>; Sat, 25 May 2019 17:13:24 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id 80FB2625A777;
	Sat, 25 May 2019 15:13:18 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:26 +0200
Message-Id: <20190525151241.5017-5-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6598899356394883857
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.46.122
Subject: [Qemu-arm] [PATCH 04/19] hw: timer: Add ASPEED RTC device
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HJ3kdD/c8z98

From: Joel Stanley <joel@jms.id.au>

The RTC is modeled to provide time and date functionality. It is
initialised at zero to match the hardware.

There is no modelling of the alarm functionality, which includes the IRQ
line. As there is no guest code to exercise this function that is
acceptable for now.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/timer/aspeed_rtc.h |  31 ++++++
 hw/timer/aspeed_rtc.c         | 180 ++++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs        |   2 +-
 hw/timer/trace-events         |   4 +
 4 files changed, 216 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/timer/aspeed_rtc.h
 create mode 100644 hw/timer/aspeed_rtc.c

diff --git a/include/hw/timer/aspeed_rtc.h b/include/hw/timer/aspeed_rtc.=
h
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
+#define ASPEED_RTC(obj) OBJECT_CHECK(AspeedRtcState, (obj), TYPE_ASPEED_=
RTC)
+
+#endif /* ASPEED_RTC_H */
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
+    uint32_t reg1 =3D rtc->reg[COUNTER1];
+    uint32_t reg2 =3D rtc->reg[COUNTER2];
+
+    tm.tm_mday =3D (reg1 >> 24) & 0x1f;
+    tm.tm_hour =3D (reg1 >> 16) & 0x1f;
+    tm.tm_min =3D (reg1 >> 8) & 0x3f;
+    tm.tm_sec =3D (reg1 >> 0) & 0x3f;
+
+    cent =3D (reg2 >> 16) & 0x1f;
+    year =3D (reg2 >> 8) & 0x7f;
+    tm.tm_mon =3D ((reg2 >>  0) & 0x0f) - 1;
+    tm.tm_year =3D year + (cent * 100) - 1900;
+
+    rtc->offset =3D qemu_timedate_diff(&tm);
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
+        cent =3D (now.tm_year + 1900) / 100;
+        year =3D now.tm_year % 100;
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
+    AspeedRtcState *rtc =3D opaque;
+    uint64_t val;
+    uint32_t r =3D addr >> 2;
+
+    switch (r) {
+    case COUNTER1:
+    case COUNTER2:
+        if (rtc->reg[CONTROL] & RTC_ENABLED) {
+            rtc->reg[r] =3D aspeed_rtc_get_counter(rtc, r);
+        }
+        /* fall through */
+    case CONTROL:
+        val =3D rtc->reg[r];
+        break;
+    case ALARM:
+    case ALARM_STATUS:
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx "\n", __func__, a=
ddr);
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
+    AspeedRtcState *rtc =3D opaque;
+    uint32_t r =3D addr >> 2;
+
+    switch (r) {
+    case COUNTER1:
+    case COUNTER2:
+        if (!(rtc->reg[CONTROL] & RTC_UNLOCKED)) {
+            break;
+        }
+        /* fall through */
+    case CONTROL:
+        rtc->reg[r] =3D val;
+        aspeed_rtc_calc_offset(rtc);
+        break;
+    case ALARM:
+    case ALARM_STATUS:
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx "\n", __func__, a=
ddr);
+        break;
+    }
+    trace_aspeed_rtc_write(addr, val);
+}
+
+static void aspeed_rtc_reset(DeviceState *d)
+{
+    AspeedRtcState *rtc =3D ASPEED_RTC(d);
+
+    rtc->offset =3D 0;
+    memset(rtc->reg, 0, sizeof(rtc->reg));
+}
+
+static const MemoryRegionOps aspeed_rtc_ops =3D {
+    .read =3D aspeed_rtc_read,
+    .write =3D aspeed_rtc_write,
+    .endianness =3D DEVICE_NATIVE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_aspeed_rtc =3D {
+    .name =3D TYPE_ASPEED_RTC,
+    .version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(reg, AspeedRtcState, 0x18),
+        VMSTATE_INT32(offset, AspeedRtcState),
+        VMSTATE_INT32(offset, AspeedRtcState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void aspeed_rtc_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
+    AspeedRtcState *s =3D ASPEED_RTC(dev);
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
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->realize =3D aspeed_rtc_realize;
+    dc->vmsd =3D &vmstate_aspeed_rtc;
+    dc->reset =3D aspeed_rtc_reset;
+}
+
+static const TypeInfo aspeed_rtc_info =3D {
+    .name          =3D TYPE_ASPEED_RTC,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(AspeedRtcState),
+    .class_init    =3D aspeed_rtc_class_init,
+};
+
+static void aspeed_rtc_register_types(void)
+{
+    type_register_static(&aspeed_rtc_info);
+}
+
+type_init(aspeed_rtc_register_types)
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 0e9a4530f848..123d92c9692c 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -41,7 +41,7 @@ obj-$(CONFIG_MC146818RTC) +=3D mc146818rtc.o
 obj-$(CONFIG_ALLWINNER_A10_PIT) +=3D allwinner-a10-pit.o
=20
 common-obj-$(CONFIG_STM32F2XX_TIMER) +=3D stm32f2xx_timer.o
-common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o
+common-obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_timer.o aspeed_rtc.o
=20
 common-obj-$(CONFIG_SUN4V_RTC) +=3D sun4v-rtc.o
 common-obj-$(CONFIG_CMSDK_APB_TIMER) +=3D cmsdk-apb-timer.o
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index dcaf3d6da6c8..db02a9142cda 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -66,6 +66,10 @@ cmsdk_apb_dualtimer_read(uint64_t offset, uint64_t dat=
a, unsigned size) "CMSDK A
 cmsdk_apb_dualtimer_write(uint64_t offset, uint64_t data, unsigned size)=
 "CMSDK APB dualtimer write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size=
 %u"
 cmsdk_apb_dualtimer_reset(void) "CMSDK APB dualtimer: reset"
=20
+# hw/timer/aspeed-rtc.c
+aspeed_rtc_read(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " val=
ue 0x%08" PRIx64
+aspeed_rtc_write(uint64_t addr, uint64_t value) "addr 0x%02" PRIx64 " va=
lue 0x%08" PRIx64
+
 # sun4v-rtc.c
 sun4v_rtc_read(uint64_t addr, uint64_t value) "read: addr 0x%" PRIx64 " =
value 0x%" PRIx64
 sun4v_rtc_write(uint64_t addr, uint64_t value) "write: addr 0x%" PRIx64 =
" value 0x%" PRIx64
--=20
2.20.1

