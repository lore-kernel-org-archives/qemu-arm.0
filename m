Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp782055wrx;
        Fri, 12 Apr 2019 09:54:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw2FgVrsGIiaCuyV5BWwbBHZUswkpbV83S9V0w8XktkwJmh8YwXtB6RqkGaJvKe/5U0OWZ0
X-Received: by 2002:adf:f1ce:: with SMTP id z14mr36545323wro.152.1555088090041;
        Fri, 12 Apr 2019 09:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555088090; cv=none;
        d=google.com; s=arc-20160816;
        b=CGXzYZVql6wXHukRhFVUc0MQd1iIsxJ8wlV5htoMWC+YNfQJAcUU5IX4tQM15Mm8Fw
         R4AzmFdrRLJsqN6wjdHBwsQbg6lxUt60nv26WcmpAVl1kmwYLyVZn+y/UQ7h77xClyqi
         noVMLi7K2AwUmU6rcxDa8A1G4I9XaAQtXcmVoJ1We4rCObjG3vBMk2u/TcyeOKL8i0as
         rxCbZfF71/9o/Os2Mh/ydEUeW7YA7K/UrpQYMHmmeT95AwgFTVtBHWQhUqhgcWkwmAy2
         wecbnf8uZDdhc5lb6f5MWsGZRj0a//8v5VvLwaAsfPZaWG+Gd0Pgwk5/y01PsIkcvgqQ
         0ajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=J3xqvqVyrBYDR2YB0F1/LNAE5lLJdb8Lo7eM70Gur6M=;
        b=HWskHeSiUokjzFJfQfyyHA3V7WYQLsDeBhY05GNkhocI8erwIu0eUA5PgMWOGENN3l
         oWhzHDiLvI49UVvfp0kioGrLTyMaOB0XrhBi0VFA/1rllIy/7wcnmqhTAMwSzffimN0N
         IaRB+tN8W+d7y/6qJENjcLAsE2+I3xIgzid7Mcm6Ie/RngHpP1vwBTTK1R/g7QSPjjdr
         LDFxJWevZ8dMZsk3c+hizBaJfHbS+Z/99VYEd4mkOlFOpiX32ZvdveKR1Kcll7cKuRAU
         ScE5k3Xa2ZYG/r7kxcHoGNZdjuBN1bwqoNXYWnp6HVMDGCyzWV0cx60bTVqOdQp7ZQfb
         6dww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si26514911wrt.101.2019.04.12.09.54.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Apr 2019 09:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40019 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hEzRx-0000pD-2d
	for alex.bennee@linaro.org; Fri, 12 Apr 2019 12:54:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRi-0000nI-0C
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:54:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hEzRd-0006NP-T7
	for qemu-arm@nongnu.org; Fri, 12 Apr 2019 12:54:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hEzRb-0006Cf-Sp; Fri, 12 Apr 2019 12:54:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E34D73144D93;
	Fri, 12 Apr 2019 16:54:26 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A708F60BEC;
	Fri, 12 Apr 2019 16:54:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Date: Fri, 12 Apr 2019 18:54:05 +0200
Message-Id: <20190412165416.7977-2-philmd@redhat.com>
In-Reply-To: <20190412165416.7977-1-philmd@redhat.com>
References: <20190412165416.7977-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Fri, 12 Apr 2019 16:54:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 01/12] hw/arm/aspeed: Use
 TYPE_TMP105/TYPE_PCA9552 instead of hardcoded string
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Andrzej Zaborowski <balrogg@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y/y6vrjdF8wh

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/aspeed.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 996812498dc..1c23ebd9925 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -19,6 +19,8 @@
 #include "hw/arm/aspeed_soc.h"
 #include "hw/boards.h"
 #include "hw/i2c/smbus_eeprom.h"
+#include "hw/misc/pca9552.h"
+#include "hw/misc/tmp105.h"
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
 #include "hw/loader.h"
@@ -267,7 +269,8 @@ static void ast2500_evb_i2c_init(AspeedBoardState *bm=
c)
                           eeprom_buf);
=20
     /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105",=
 0x4d);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7),
+                     TYPE_TMP105, 0x4d);
=20
     /* The AST2500 EVB does not have an RTC. Let's pretend that one is
      * plugged on the I2C bus header */
@@ -288,13 +291,15 @@ static void witherspoon_bmc_i2c_init(AspeedBoardSta=
te *bmc)
     AspeedSoCState *soc =3D &bmc->soc;
     uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
=20
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552"=
, 0x60);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), TYPE_PCA9=
552,
+                     0x60);
=20
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423",=
 0x4c);
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
=20
     /* The Witherspoon expects a TMP275 but a TMP105 is compatible */
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), "tmp105",=
 0x4a);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 9), TYPE_TMP1=
05,
+                     0x4a);
=20
     /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 i=
s
      * good enough */
@@ -302,7 +307,7 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
=20
     smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x5=
1,
                           eeprom_buf);
-    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "pca9552=
",
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), TYPE_PCA=
9552,
                      0x60);
 }
=20
--=20
2.20.1

