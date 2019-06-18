Received: by 2002:a17:90a:ad8a:0:0:0:0 with SMTP id s10csp4213140pjq;
        Tue, 18 Jun 2019 10:08:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzi2cICKRX/F7wUn6xqB1gJbT2eaoMng/kPlk144zN28ShCUgGCPmyo2htnJNfs9uvfqXz2
X-Received: by 2002:a37:8002:: with SMTP id b2mr96835451qkd.289.1560877688081;
        Tue, 18 Jun 2019 10:08:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560877688; cv=none;
        d=google.com; s=arc-20160816;
        b=j3lnI6oLAxRdbz5IqL09UxgWi64mrW18l2O+fvvqobmbvzvCOx4JfwJh2erLE95gb8
         l1QPOviGnQyoLEI9wkIemMPJPNF8nEJMPgmxn3v0BCwvzQ5sW/Bilt18sd9MMOE+Qfll
         wbaFWYW0xVcH865mukM5khqKGpRc8jNP0wojUK4A2efLJQP9lX8cFAYumdOeYw/9TGuA
         dk60ZA0gZq5mqbNwS3+sNZ6R0D5Op1YGtXc9X9SNj4CRHcTezkkGt2Kufw3LwDgSFq/E
         3z5gGQTWTfa9dnFw9nRbcMagY04//bjeq3B45vpFKuTqaXG5ByZYWBpZ7p+lwe3AEKlo
         ZxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=gX8+7MWV+OYcYOCPeCD6tuOtLzUfQ7At93ryWUJ/rJ0=;
        b=nxgTSu9gshWATL0MbXrHrTZrLeVA6ohxtHk5Rhl1WP67jyYq+DMMEI8Ct66nl/Pfv4
         9NDHGcsaoXwwqwNy6xV2yAVtKK3FR50k1O3E6wKmu3hfndaJ4tN2t8k2jJp+Zp9/UCDV
         K/ohhIRrZiZn4fyFOehzXXSgb41KCpI6rvyQRfs0+kLb8b8TndTOQ0T852RshZrmDwwb
         VqWGz0mbcNUp4iYab9WYzBNO5CCcTTgpoy7IQFiKTMZPRKZ1HzbyQuYWRfJaC+vk4JvQ
         YI3fPsKRYN0U/FA/U75HXiC+dkHB6nteZdtk7XbtIxkgVGeqWGMS16SRnfAG3LsQNhT8
         fFUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q53si10205600qvh.110.2019.06.18.10.08.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 10:08:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdHaZ-0003Rk-LG
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 13:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60311)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHMr-0007wr-7r
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:53:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHMp-0003rX-Bk
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:53:57 -0400
Received: from 14.mo4.mail-out.ovh.net ([46.105.40.29]:43672)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHMp-0003oK-26
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:53:55 -0400
Received: from player157.ha.ovh.net (unknown [10.109.159.132])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 6E69D1F809B
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 18:53:53 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 07F456EB5154;
 Tue, 18 Jun 2019 16:53:48 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:52:54 +0200
Message-Id: <20190618165311.27066-5-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1666613338521832209
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.40.29
Subject: [Qemu-arm] [PATCH v2 04/21] hw/arm/aspeed: Add RTC to SoC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qv4iz0HPJsSB

From: Joel Stanley <joel@jms.id.au>

All systems have an RTC.

The IRQ is hooked up but the model does not use it at this stage. There
is no guest code that uses it, so this limitation is acceptable.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index 1cc98b9f4045..5faa78d81fd6 100644
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
2.21.0

