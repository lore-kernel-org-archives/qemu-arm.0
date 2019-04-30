Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4296831wrh;
        Mon, 29 Apr 2019 21:43:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx/RdOIhU5Rmw4FxAV+xkz41T3ZXmDOidBnBhC5oI4jkbyImD5eHwqmejBUVMPZSnqr++h8
X-Received: by 2002:a1c:2b41:: with SMTP id r62mr1498406wmr.94.1556599393973;
        Mon, 29 Apr 2019 21:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556599393; cv=none;
        d=google.com; s=arc-20160816;
        b=qOQDJuj/KGGqCS2g5v/GfILptniVeXGaMTTW3Ul0Yt5KDS4hhQhi/rkft6ge6CY8IX
         Hjh6XSr5/6hYksoFaMAI5O0S+b9CvOysz556rjyV+bOm6FZD1mSI+DLmWxooIxZnmz0P
         Zm6z4O5hdFMISbOvdqbFZH00i1InG5Fp3inp5ApbNVxFhFUJIDrExGP2rGWGbGhkN7+q
         m6LJo+lcIKqfYldqVfLXhTcgM0b2W9RKfL+GQzLPOuZ6CI6Y9+6vOogS6WO18CfaJOsg
         URt1DyzBFQXKxJO310kRS7aX04jsGq88XGe+DkmOHfLvjx24TmVMt3UQBxSLjI16+5SW
         5ccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=MI5nCh4/5B0Sz0tu7042172x5DdKFcjyfCPFDvMLqR4=;
        b=ovnTurPBBFil3jrj+nMYfhioTp6AucB/rm87vTskCYyVaPT+jgVORnYae3PlWwp0rD
         C+G543J19WaVphueAiHKBydKaCab2PfPO+sFFAWdk+ijF9Nse66dOtZ9PuDyK8I54aKY
         EHo6uktNAEKLl+Fzv30fDRE8BwYebKCVwX2OoIQjoRUVtKww1NMHQTYSZWbLIkkXvN8y
         kNgmKI8Xp2xdRbvXs+35Lv6JfHJOhT3GfRm16QYWW4hVrwpXuENSHfXRGpROpXNqiNSL
         4nI5bK7/ZdJ3C0UMLgf7TzP9LmTM9cwcy0G62hAI2DwusMALhsJmMPSX/jXO/AQW9aJ6
         zfJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FMNy+O1q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si24811917wrw.367.2019.04.29.21.43.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Apr 2019 21:43:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FMNy+O1q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:39025 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLKbp-00089N-5K
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 00:43:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hLKZr-0006oo-RK
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 00:41:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1hLKZp-0002i5-UT
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 00:41:11 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37703)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1hLKZo-0002fr-38; Tue, 30 Apr 2019 00:41:08 -0400
Received: by mail-pl1-x641.google.com with SMTP id z8so6152932pln.4;
	Mon, 29 Apr 2019 21:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MI5nCh4/5B0Sz0tu7042172x5DdKFcjyfCPFDvMLqR4=;
	b=FMNy+O1qySsuJAVz3CQRoGWAKXFpdv1X6ytiDGe1oy245bXcMChEys5ecET2cQ6eTp
	GHDtrUhncGDOBvC6sVtmueEh5oM05SrWB1qcMH1/2e/vFJDyTnwx/9iBYWZhCQ+X3GJS
	1rJ0o8iR8gcSenxcUNpUgUxUy60nbQLJ75yOleCBfLjOB5e71lf708wN4nOvCXttLrTv
	XW9LHhe493v+6wgOBinKa4HPv4HU/D4bSqofOcK154suuqNcdYZgYWp/xt8hnLb5Qor+
	PsU1SOyv0S0xFyUzaO/cw9Y6zgy1z8WQd1Q/ldMvk7iP6G4wV9e4X+eMCKil1TJpXb1T
	TSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=MI5nCh4/5B0Sz0tu7042172x5DdKFcjyfCPFDvMLqR4=;
	b=B5AA3kfI3+GIvyWpk056m49+izV28gft6Bz0iARdfwN/TAWkFC/BFObQ6uzU9TzSKX
	2EvR6YHelqxuACXJ76lvLXOLpnmVHIgOykEVVhb33n3luOpYnaKT3+C1HUxpKSOMOdpA
	9ARdzb+v2VUGsjISNAIeQITtJmRA4/VkaBEaGywitbUuOPanFkEifIhEOoDrJmjknFua
	CypyLK1jIftSlE8Tah8EYlJXhb4ty54bYk6n8hwqOn3QnaJ6+QsEBc25G6AOUhw4aDXj
	uIN8yKB+gJNJsJ7O2JVU2g/1DFT7thpqqQ+wpzUI9Ux8w++j/049zaCCg9NXAJwK/thj
	pj3Q==
X-Gm-Message-State: APjAAAVqtcb4fAwr9rQZudLOxKA9daGNh1Nv86Evvc0FCYz30b4ABMG5
	u831VaV5zkW2UFo3kza6rgo=
X-Received: by 2002:a17:902:822:: with SMTP id
	31mr65976607plk.41.1556599266736; 
	Mon, 29 Apr 2019 21:41:06 -0700 (PDT)
Received: from voyager.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	d5sm14411227pgb.33.2019.04.29.21.41.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Apr 2019 21:41:06 -0700 (PDT)
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
	Tue, 30 Apr 2019 14:10:59 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue, 30 Apr 2019 14:10:35 +0930
Message-Id: <20190430044036.1144-3-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430044036.1144-1-joel@jms.id.au>
References: <20190430044036.1144-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-arm] [PATCH v3 2/2] hw/arm/aspeed: Add RTC to SoC
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 48p10BEKoXXH

All systems have an RTC.

The IRQ is hooked up but the model does not use it at this stage. There
is no guest code that uses it, so this limitation is acceptable.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: Add commit message
v2: Rebase on Cedric's patches (20190411161013.4514-4-clg@kaod.org)
---
 hw/arm/aspeed_soc.c         | 13 +++++++++++++
 include/hw/arm/aspeed_soc.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 110956828c44..ea9700c35bc4 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -229,6 +229,9 @@ static void aspeed_soc_init(Object *obj)
     sysbus_init_child_obj(obj, "vic", OBJECT(&s->vic), sizeof(s->vic),
                           TYPE_ASPEED_VIC);
 
+    sysbus_init_child_obj(obj, "rtc", OBJECT(&s->rtc), sizeof(s->rtc),
+                          TYPE_ASPEED_RTC);
+
     sysbus_init_child_obj(obj, "timerctrl", OBJECT(&s->timerctrl),
                           sizeof(s->timerctrl), TYPE_ASPEED_TIMER);
     object_property_add_const_link(OBJECT(&s->timerctrl), "scu",
@@ -315,6 +318,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->vic), 1,
                        qdev_get_gpio_in(DEVICE(&s->cpu), ARM_CPU_FIQ));
 
+    /* RTC */
+    object_property_set_bool(OBJECT(&s->rtc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, sc->info->memmap[ASPEED_RTC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_RTC));
+
     /* Timer */
     object_property_set_bool(OBJECT(&s->timerctrl), true, "realized", &err);
     if (err) {
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index eda9094660b5..d124674f25d8 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -17,6 +17,7 @@
 #include "hw/misc/aspeed_scu.h"
 #include "hw/misc/aspeed_sdmc.h"
 #include "hw/timer/aspeed_timer.h"
+#include "hw/timer/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/watchdog/wdt_aspeed.h"
@@ -33,6 +34,7 @@ typedef struct AspeedSoCState {
     ARMCPU cpu;
     MemoryRegion sram;
     AspeedVICState vic;
+    AspeedRtcState rtc;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
     AspeedSCUState scu;
-- 
2.20.1

