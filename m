Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4314313wrg;
        Sat, 25 May 2019 08:18:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzb/o5mdjqCUuo0S1y6au3BbdkaiC3s27D94VXpGaT83KIYM0AU820qIMlKZlFfZ4nt68VG
X-Received: by 2002:ab0:6193:: with SMTP id h19mr20253784uan.13.1558797508993;
        Sat, 25 May 2019 08:18:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558797508; cv=none;
        d=google.com; s=arc-20160816;
        b=A42Wz8O3DRCTQ95w7qDeC3/a4hEAKYSe4eDsAKmpvH8pArqcC+ziDZfdoKFiptKbhq
         E6YEb7UrCEA1PgDBsFeC2kvQCcUCpHGJ+NxUJfp+AyePTP8cNL800EwB4QkUIKNEBN/a
         Ccd+bQSVOKFyuA1Yiwk5BHO/zzSqzbFmp3kismfKfWlGTUkSoEcOl3UpPRJLQ1XquBSj
         9axOm6stcdextSDah4e1uiNWn1zPFoLahay4/aRKsbAUqJ6spolLlPo1hvnJlJV9/j9w
         g8D0tgcEqlGnbWqbjJdDXP/Tm2Cv84Rw0Yu9abttoNA0N9mnKPgJyXLNB4cqYSRISbSU
         Pc1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=gkHKQOl9Piw+J9fLp0nAdM99S3uIYNTsgDRJHxccht4=;
        b=PsLtv11ws4jUjbgO3IEqbOs/hjSXqgphCYwYZ5wO5Ng8B0g0SsjEC3vuULVn5w28Uf
         J9DO/9eT2ihKPC3ZRISHmkt+z83SH6TQ8Y7zxAAunQfiAZ/X8G/kXYg6LnV7twtarbkJ
         EIM12UlzDMyg0jb2khgFqkz6q3RaThXoSGRwFEiZoG3JK7OvqxaVjj4Xn4oZltCoegIm
         EEW0cXc5pXiQv4n3Y1yFc5EbBIdyjhiIkvpUzd+rQDFZc8CcojHAXmTOu6p2NZZMjssD
         b5ERBtP9mPQMb99vz0jZsSiJl7qP2mL9vZnFW2kWggEotZDPEGbylf2lKA4a0qbYTA8c
         e+Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19si2228637uap.148.2019.05.25.08.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 May 2019 08:18:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:43238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hUYRI-000168-Fi
	for alex.bennee@linaro.org; Sat, 25 May 2019 11:18:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32894)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYMa-0005fc-0W
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:13:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hUYMY-0001bJ-Q5
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:13:35 -0400
Received: from 15.mo7.mail-out.ovh.net ([87.98.180.21]:43256)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hUYMY-0001ZQ-JY
	for qemu-arm@nongnu.org; Sat, 25 May 2019 11:13:34 -0400
Received: from player698.ha.ovh.net (unknown [10.108.42.75])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id A62EB11BB2B
	for <qemu-arm@nongnu.org>; Sat, 25 May 2019 17:13:31 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player698.ha.ovh.net (Postfix) with ESMTPSA id BE434625A77F;
	Sat, 25 May 2019 15:13:24 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 May 2019 17:12:27 +0200
Message-Id: <20190525151241.5017-6-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
References: <20190525151241.5017-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 6600869682718346001
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddukedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.180.21
Subject: [Qemu-arm] [PATCH 05/19] hw/arm/aspeed: Add RTC to SoC
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
X-TUID: xXI7J1aLJEjy

From: Joel Stanley <joel@jms.id.au>

All systems have an RTC.

The IRQ is hooked up but the model does not use it at this stage. There
is no guest code that uses it, so this limitation is acceptable.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h |  2 ++
 hw/arm/aspeed_soc.c         | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 88b901d5dfa9..fa0ba957a611 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -16,6 +16,7 @@
 #include "hw/misc/aspeed_scu.h"
 #include "hw/misc/aspeed_sdmc.h"
 #include "hw/timer/aspeed_timer.h"
+#include "hw/timer/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/watchdog/wdt_aspeed.h"
@@ -32,6 +33,7 @@ typedef struct AspeedSoCState {
     ARMCPU cpu;
     MemoryRegion sram;
     AspeedVICState vic;
+    AspeedRtcState rtc;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
     AspeedSCUState scu;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 4b705afd096a..d1dc8f03f35c 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -189,6 +189,9 @@ static void aspeed_soc_init(Object *obj)
     sysbus_init_child_obj(obj, "vic", OBJECT(&s->vic), sizeof(s->vic),
                           TYPE_ASPEED_VIC);
=20
+    sysbus_init_child_obj(obj, "rtc", OBJECT(&s->rtc), sizeof(s->rtc),
+                          TYPE_ASPEED_RTC);
+
     sysbus_init_child_obj(obj, "timerctrl", OBJECT(&s->timerctrl),
                           sizeof(s->timerctrl), TYPE_ASPEED_TIMER);
     object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
@@ -275,6 +278,16 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 1,
                        qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
=20
+    /* RTC */
+    object_property_set_bool(OBJECT(&s->rtc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, sc->info->memmap[ASPEED_=
RTC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_RTC));
+
     /* Timer */
     object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", &e=
rr);
     if (err) {
--=20
2.20.1

