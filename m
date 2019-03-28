Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp256650wrx;
        Wed, 27 Mar 2019 23:27:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyDTZvsXCV7eCXqRwM5cprbm8pFr9hYj2GbfUEvogh/VcvlAB5gX7QxwITXlFEHLiwBYOFd
X-Received: by 2002:a24:7542:: with SMTP id y63mr2118683itc.70.1553754447235;
        Wed, 27 Mar 2019 23:27:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553754447; cv=none;
        d=google.com; s=arc-20160816;
        b=ARood8TY7rDK4NnxI8XiB8zNQDws4YaKgKxHrCPtjD7CpIFXyPnrle33jYR9Nng85j
         r+4gOR0nBvx20NeuI3HAEo53Y3B9G/5H8hjYOauxniqZQg7+jpFVGzTFsH9YV+B4t3np
         5mD6JSFeM49wVTdg+8idj0nCeTKZ5rK3/utoCJPS6vL0XHRs5pQ3LEdqpbwQOrAeZsXq
         IArWEsbH98YI5TRF5lS3nZ5WVLx8mhroFNsE5olbOSBtl7dE+AURvpzo53cm0AeN7llo
         vX79+El870936+FPGVKPjbZTCteqSFfHMEV93rUAqpE0bmkUrlnuDxepYc170K3NlSeK
         pmTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=T2OKv2m/G6Ac9dhT4+Z47k07pb4CVTwyvO34O6COeYw=;
        b=FHHExVgEMhXldZR+EcJE0Fhn7yjqsU9O75/43yOrxXh7soHhJ2PVPLJH5ryetdkaL6
         mMORY9eBNsyDbJ28bZgMgsSvsdxx/p7iVB9B89O9vgWV35tegjReIBDpLvk6jcko7TBE
         ead+ZXYwXhEm6DxOXTO74oV+ceYN0wwS7oygDX4jqN179teHCGVO2lMYUyMheae7rJmU
         2rVvSE5BzHn3FmxVbvO9SxdFQaHlTFc8/0zLSS/QqjW1Xq2c9Ivr0EXGx65tiIzY0G9m
         r9ucQU+ulDKSiziyROmB7+EJN5P/XCMXtCnNbPpXvNbJ5uf41BLxBMrNKsbNCfVNviq4
         jfXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oPwWZ7T8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si10751553ioh.24.2019.03.27.23.27.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Mar 2019 23:27:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oPwWZ7T8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:59902 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9OVa-0003ML-Dy
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 02:27:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1h9OVE-0003Hx-Bl
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 02:27:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1h9ORD-00018X-MV
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 02:22:56 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:36903)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1h9ORD-00017F-Fl; Thu, 28 Mar 2019 02:22:55 -0400
Received: by mail-pl1-x642.google.com with SMTP id q6so4488091pll.4;
	Wed, 27 Mar 2019 23:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=T2OKv2m/G6Ac9dhT4+Z47k07pb4CVTwyvO34O6COeYw=;
	b=oPwWZ7T8NdrkR/EmICIfVNzWPankJCntayBQY2EbkVAceSIjP7WuKb1APqgoBcF/F+
	cEsrk9CydV+XUVGnousHxNtm0t7Uvh6TYiwrarkfNq+KvSw0c+RSfzehRkbE6IS2vdJE
	gbU1+wKglm453SrEPtiwlVrc78BQcxoNXuhAnd7ZMkH3ZCU8kuK0ouZ8sEHCP2mH/VLb
	+vMNQCmVPqWH1JiKGDWnwppt415pCpvR75/T3J8q16wc0IN7wMpXB3SGBDimUl/QzCS6
	eeNicFzjMEQ5/2XuGCJ1k77e3OEsYkrBSHJG5Z/491KVfY7Xb2ZmS56r7xbqr3BG/nfg
	AVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=T2OKv2m/G6Ac9dhT4+Z47k07pb4CVTwyvO34O6COeYw=;
	b=PqYvBMOfgli5vcEFKnQlqXLIE5Gxq6ZEgECSBS2MAwWGnVH2ny5q5BBRR0m6JR3roS
	4SPG9bCg5VwIRjVsMwRS4WzShwY8TsAZtq1RV5FA6LbcyWTT+hdXKDFdAHhFeyM7vvK8
	XjkzcMkqRip6O9w+jlQ+/cVdDMYkqkEjuXF/SSbyyRd0pZ+YkZGrIyRg0E8ZCySy4aeB
	ZZ6kSd5jkFg31IFUkYiZ3fZJDvRMNyg96PugYP+ioPZeb0xkuus2BD05n51Wz3ni/Ixc
	CTB8E10sCwMSaii2BNA6bWQ7Pp6+oM31dnucARRpgDKWjETStTEPs8DTpteB5SOFGNSg
	4KCQ==
X-Gm-Message-State: APjAAAUG4aFk0TpO89sm7iYrgy7PbjtpBqegXolarkBv3e4cxO4WwSeB
	nzeJ7iZpXcL6P/H45p8qVC4=
X-Received: by 2002:a17:902:7892:: with SMTP id
	q18mr31016373pll.163.1553754174488; 
	Wed, 27 Mar 2019 23:22:54 -0700 (PDT)
Received: from voyager.jms.id.au ([36.255.48.244])
	by smtp.gmail.com with ESMTPSA id
	a8sm11035145pfo.144.2019.03.27.23.22.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 23:22:53 -0700 (PDT)
Received: by voyager.jms.id.au (sSMTP sendmail emulation);
	Thu, 28 Mar 2019 16:52:48 +1030
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrew Jeffery <andrew@aj.id.au>
Date: Thu, 28 Mar 2019 16:52:22 +1030
Message-Id: <20190328062222.8409-3-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190328062222.8409-1-joel@jms.id.au>
References: <20190328062222.8409-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH 2/2] hw/arm/aspeed: Add RTC to SoC
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
X-TUID: P4l9Aafs0g1r

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c         | 15 +++++++++++++++
 include/hw/arm/aspeed_soc.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index a27233d4876b..628ec633c91a 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -32,6 +32,7 @@
 #define ASPEED_SOC_SDMC_BASE        0x1E6E0000
 #define ASPEED_SOC_SCU_BASE         0x1E6E2000
 #define ASPEED_SOC_SRAM_BASE        0x1E720000
+#define ASPEED_SOC_RTC_BASE         0x1E781000
 #define ASPEED_SOC_TIMER_BASE       0x1E782000
 #define ASPEED_SOC_WDT_BASE         0x1E785000
 #define ASPEED_SOC_I2C_BASE         0x1E78A000
@@ -135,6 +136,10 @@ static void aspeed_soc_init(Object *obj)
     object_property_add_child(obj, "i2c", OBJECT(&s->i2c), NULL);
     qdev_set_parent_bus(DEVICE(&s->i2c), sysbus_get_default());
 
+    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_ASPEED_RTC);
+    object_property_add_child(obj, "rtc", OBJECT(&s->rtc), NULL);
+    qdev_set_parent_bus(DEVICE(&s->rtc), sysbus_get_default());
+
     object_initialize(&s->fmc, sizeof(s->fmc), sc->info->fmc_typename);
     object_property_add_child(obj, "fmc", OBJECT(&s->fmc), NULL);
     qdev_set_parent_bus(DEVICE(&s->fmc), sysbus_get_default());
@@ -231,6 +236,16 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->timerctrl), i, irq);
     }
 
+    /* RTC */
+    object_property_set_bool(OBJECT(&s->rtc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, ASPEED_SOC_RTC_BASE);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0,
+            qdev_get_gpio_in(DEVICE(&s->vic), 22));
+
     /* UART - attach an 8250 to the IO space as our UART5 */
     if (serial_hd(0)) {
         qemu_irq uart5 = qdev_get_gpio_in(DEVICE(&s->vic), uart_irqs[4]);
diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 11ec0179db50..a5f8f219e404 100644
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

