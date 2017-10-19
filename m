Received: by 10.223.197.9 with SMTP id q9csp6919443wrf;
        Thu, 19 Oct 2017 08:14:11 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+Tz20aXxhNxGSVFk5xHx0pJ0GEewWtNhO/enIjf2JRTk8onwossXBmYXRFtQtIjQrn+N6cD
X-Received: by 10.200.54.144 with SMTP id a16mr2653124qtc.291.1508426051591;
        Thu, 19 Oct 2017 08:14:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508426051; cv=none;
        d=google.com; s=arc-20160816;
        b=CImbydZikuL3VnDskbDHlDe//irxvBriE/nnSgI1AuA43uFjJVvAcj3ZSGhFeUc5Yq
         9txu4dHTAO2khzA1JfUS9KDY3wOQLC+W8YT0w24IXSrIEW36U+4+XRdQXO1ZIOpFz1+9
         xM8zDnw/4EK7aHIHWW06kjwujzP7ARnrsTQ/PTB0WrWeXfhcqDSgpy7+2DyJQHrVAIcc
         ipWRCYGT+8uNIkEy9XSSUe5HkqlnJFBQ/Ty+lcLmTSTP5BpcVGzVul9or7dWKJvYDuyb
         MGdyl/Cx0CYC0F2sCwvYQuzs2NMLZGCOsZ1gNMSRm9kjJdbuiVZ9n7cbo+XTJHxtavcr
         AwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=fCsDhiSwUn8oAcLioCc8ZwUojEiAHIT3c1H0IVAJz1s=;
        b=wL2lJBXAWLAPn5vHhzSbCfymsd0l+jd/B9EowlmHC+u1CxuoKduVUaWTxhNeXumRe2
         Rqn+7iW29ZcN0HwvySSIZgYqLyNqZV0S3Xp4RUHfj+uHNxTezgeHFZfplAOWykcEhDur
         rO49VZN1JWkBXPFc3s5nrg2KW/Nn6jtZk5Y+LVxA9Hes2Jyt35IHnWPs3kkUxnfCZ7Ip
         TRq9APRBD7BiK08a4j4b4oEFrAeQouOwIHlfeN4Z4TSG0tQysrwrSgGoeSmffy754z7w
         17B1nWO/MKgVgHc+cRin2gpqDQQhtShK8iuveWk0L6u1Ymfgpmoa9YRd1OhWO5hIJoxv
         /eCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g42si601583qta.275.2017.10.19.08.14.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 08:14:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5CWP-0001cO-Bm
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 11:14:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CW7-0001ZK-6K
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5CW1-0001dJ-Dd
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:51 -0400
Received: from 8.mo5.mail-out.ovh.net ([178.32.116.78]:48440)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5CW1-0001cL-7R
	for qemu-arm@nongnu.org; Thu, 19 Oct 2017 11:13:45 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id EF4C2146170
	for <qemu-arm@nongnu.org>; Thu, 19 Oct 2017 17:13:43 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id B88FD80087;
	Thu, 19 Oct 2017 17:13:36 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 17:12:47 +0200
Message-Id: <20171019151249.13663-7-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019151249.13663-1-clg@kaod.org>
References: <20171019151249.13663-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13918093174983265041
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.116.78
Subject: [Qemu-arm] [PATCH v5 6/8] aspeed: Add EEPROM I2C devices
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oe4MbIUeh/DS

The Aspeed boards have at least one EEPROM to hold the Vital Product
Data (VPD).

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index f0a440f81fd6..246bf3ff67e6 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -17,6 +17,7 @@
 #include "hw/arm/arm.h"
 #include "hw/arm/aspeed_soc.h"
 #include "hw/boards.h"
+#include "hw/i2c/smbus.h"
 #include "qemu/log.h"
 #include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
@@ -273,11 +274,15 @@ static void palmetto_bmc_i2c_init(AspeedBoardState =
*bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
     DeviceState *dev;
+    uint8_t *eeprom_buf =3D g_malloc0(32 * 1024);
=20
     /* The palmetto platform expects a ds3231 RTC but a ds1338 is
      * enough to provide basic RTC features. Alarms will be missing */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), "ds1338",=
 0x68);
=20
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), 0x50=
,
+                          eeprom_buf);
+
     /* add a TMP423 temperature sensor */
     dev =3D i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2),
                            "tmp423", 0x4c);
@@ -314,6 +319,10 @@ static const TypeInfo palmetto_bmc_type =3D {
 static void ast2500_evb_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
+    uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
+
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), 0x50=
,
+                          eeprom_buf);
=20
     /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105",=
 0x4d);
@@ -383,6 +392,7 @@ static const TypeInfo romulus_bmc_type =3D {
 static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
+    uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
=20
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423",=
 0x4c);
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
@@ -393,6 +403,9 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
     /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 i=
s
      * good enough */
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
+
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x5=
1,
+                          eeprom_buf);
 }
=20
 static void witherspoon_bmc_init(MachineState *machine)
--=20
2.13.6

