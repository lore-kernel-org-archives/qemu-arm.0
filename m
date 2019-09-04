Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp19120wrp;
        Wed, 4 Sep 2019 14:31:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7UPBFV8af5Wmh6D56IOjWi9tBxvmOszssplvXmTJXaEFneaZFkbym/peWMCJ+dZTTM5B3
X-Received: by 2002:a05:620a:166b:: with SMTP id d11mr5434956qko.437.1567632692871;
        Wed, 04 Sep 2019 14:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567632692; cv=none;
        d=google.com; s=arc-20160816;
        b=gQWw6N6O1AMBYsrtZ1w9Ofco4kw1dckilIL578/q5tYG2XPBJbgjJHqjzmmAbXmJei
         zvM8xJYUwKvcD0xV3yokue9FxnU87EM+6Gj6IJYprAcaQA7wzgUoRJ1df9yf+LHVbJo2
         d3KKoaWyU4nH9p/01jY/78E6GggLfA2zp88+JXLz1TmFTfusKUARTUm4oXA5nAM1dqfu
         QNwqhC0ExnZcrVAVHF/pQ9TMHJX+6rJLnAtI9Zrq8O6PDmyuLlLW2WtX89BwKEeCFWTk
         6/Kij92qGvrvokwD39Kf4+fmz2jYw1KgCZdky8nkuUzSjP/F8QvSA3o2qNHNCyKk4/xV
         chEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dBASQ8pq6Y0dk1ibQvTzKgWM71NWA3vrPlV4KeVAP0E=;
        b=kiUnylK10bxaHOvLGnB6bgYPP98ycnbpm5ULTK/653cbi/atwzD0YmWLUJG2gtznXr
         rINT0Cstc4gn70mLb/Zi19J50f3azWwNrFVSaqAFujlnWFGJqBqf5hUuMutYluMc4dtH
         WV/EmlOSnRRxmv2X3HjVZo08IirAlV28p2yDAtmcbnLafyMEhm7ZWfD5FhwRYQjb2e8a
         6gFO0CO/kAO/WHHgEb8u/wmAivvsXioWKjFlv7CPB2JyvjEoKKoJowTEltAc/C0SFm4K
         ay/fPx/wEfOuc2DzYwmJgrgtK0Hqga0SPCjV0AUsFrnKTVAYppXmnTWTGwAFfeIn/R9c
         dUQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f24si122321qve.127.2019.09.04.14.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 14:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5csE-0005m5-D3
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 17:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53566)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5cCO-0000kN-8c
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 16:48:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5cCM-0001j3-Rf
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 16:48:16 -0400
Received: from 17.mo1.mail-out.ovh.net ([87.98.179.142]:47516)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5cCM-0001iJ-L3
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 16:48:14 -0400
Received: from player691.ha.ovh.net (unknown [10.109.146.106])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 4781818D83C
 for <qemu-arm@nongnu.org>; Wed,  4 Sep 2019 22:48:13 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id A2E0998B289E;
 Wed,  4 Sep 2019 20:48:06 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 22:46:53 +0200
Message-Id: <20190904204659.13878-10-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904204659.13878-1-clg@kaod.org>
References: <20190904204659.13878-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2525674966197504785
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejhedgudehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.179.142
Subject: [Qemu-arm] [RFC PATCH 09/15] hw: wdt_aspeed: Add AST2600 support
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fvzJ44TmfCu0

From: Joel Stanley <joel@jms.id.au>

The AST2600 has four watchdogs, and they each have a 0x40 of registers.

When running as part of an ast2600 system we must check a different
offset for the system reset control register in the SCU.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[clg: - reworked mode integration into new objet class ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h      |  2 +-
 include/hw/watchdog/wdt_aspeed.h |  1 +
 hw/watchdog/wdt_aspeed.c         | 29 +++++++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index ba5bbb53e1a1..b427f2668a8a 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -27,7 +27,7 @@
 #include "hw/sd/aspeed_sdhci.h"
=20
 #define ASPEED_SPIS_NUM  2
-#define ASPEED_WDTS_NUM  3
+#define ASPEED_WDTS_NUM  4
 #define ASPEED_CPUS_NUM  2
 #define ASPEED_MACS_NUM  2
=20
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_a=
speed.h
index 796342764e2e..dfedd7662dd1 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -18,6 +18,7 @@
     OBJECT_CHECK(AspeedWDTState, (obj), TYPE_ASPEED_WDT)
 #define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
 #define TYPE_ASPEED_2500_WDT TYPE_ASPEED_WDT "-ast2500"
+#define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
=20
 #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
=20
diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 9e241b7c8da4..6870dcf0c107 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -40,12 +40,14 @@
 #define     WDT_DRIVE_TYPE_MASK         (0xFF << 24)
 #define     WDT_PUSH_PULL_MAGIC         (0xA8 << 24)
 #define     WDT_OPEN_DRAIN_MAGIC        (0x8A << 24)
+#define WDT_RESET_MASK1                 (0x1c / 4)
=20
 #define WDT_TIMEOUT_STATUS              (0x10 / 4)
 #define WDT_TIMEOUT_CLEAR               (0x14 / 4)
=20
 #define WDT_RESTART_MAGIC               0x4755
=20
+#define AST2600_SCU_RESET_CONTROL1      (0x40 / 4)
 #define SCU_RESET_CONTROL1              (0x04 / 4)
 #define    SCU_RESET_SDRAM              BIT(0)
=20
@@ -74,6 +76,8 @@ static uint64_t aspeed_wdt_read(void *opaque, hwaddr of=
fset, unsigned size)
         return s->regs[WDT_CTRL];
     case WDT_RESET_WIDTH:
         return s->regs[WDT_RESET_WIDTH];
+    case WDT_RESET_MASK1:
+        return s->regs[WDT_RESET_MASK1];
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
         qemu_log_mask(LOG_UNIMP,
@@ -146,6 +150,11 @@ static void aspeed_wdt_write(void *opaque, hwaddr of=
fset, uint64_t data,
         s->regs[WDT_RESET_WIDTH] |=3D data & awc->ext_pulse_width_mask;
         break;
=20
+    case WDT_RESET_MASK1:
+        /* TODO: implement */
+        s->regs[WDT_RESET_MASK1] =3D data;
+        break;
+
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
         qemu_log_mask(LOG_UNIMP,
@@ -316,12 +325,32 @@ static const TypeInfo aspeed_2500_wdt_info =3D {
     .class_init =3D aspeed_2500_wdt_class_init,
 };
=20
+static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    AspeedWDTClass *awc =3D ASPEED_WDT_CLASS(klass);
+
+    dc->desc =3D "ASPEED 2600 Watchdog Controller";
+    awc->offset =3D 0x40;
+    awc->ext_pulse_width_mask =3D 0xfffff; /* TODO */
+    awc->reset_ctrl_reg =3D AST2600_SCU_RESET_CONTROL1;
+    awc->reset_pulse =3D aspeed_2500_wdt_reset_pulse;
+}
+
+static const TypeInfo aspeed_2600_wdt_info =3D {
+    .name =3D TYPE_ASPEED_2600_WDT,
+    .parent =3D TYPE_ASPEED_WDT,
+    .instance_size =3D sizeof(AspeedWDTState),
+    .class_init =3D aspeed_2600_wdt_class_init,
+};
+
 static void wdt_aspeed_register_types(void)
 {
     watchdog_add_model(&model);
     type_register_static(&aspeed_wdt_info);
     type_register_static(&aspeed_2400_wdt_info);
     type_register_static(&aspeed_2500_wdt_info);
+    type_register_static(&aspeed_2600_wdt_info);
 }
=20
 type_init(wdt_aspeed_register_types)
--=20
2.21.0

