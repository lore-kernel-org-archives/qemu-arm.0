Received: by 10.223.197.9 with SMTP id q9csp7030908wrf;
        Thu, 19 Oct 2017 10:07:57 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+TBSNcL/yi3qxFXfug/MhoubDdJfyy8CutjCd1yB5dHKXV+qLdfb1+Oxyz/dNWvCHZTBfox
X-Received: by 10.237.35.178 with SMTP id j47mr3181750qtc.327.1508432877717;
        Thu, 19 Oct 2017 10:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508432877; cv=none;
        d=google.com; s=arc-20160816;
        b=TH6bbPZb6UhbfA++SrHT9Jsw9QPwbQGVvNTJPnTbGgMOTYmvSUNgR0qAFdzwOTXnQr
         nGIrqy9BRM0RRbVKtbKFHhC1Vobzv7+IJNkzRdqt7Dn4DNRTi+B3ZbZ/CWNJcXo/OpX3
         /weEE7SoiefEYIrLriH1Pw2OrW4xWWSbyxeCk/qOCsv95SmJq757S2zsC4l8LOrSsLSF
         Ej9DG4VI7CEjDDA2DJruOsf7+1rco+yeILiied6XIh8Z9LEjJSmnY8ANoOPuYYkAhnry
         481MFyj2xaFHfQdV3JEPmJHg1mkw34yMgXabSWxUmDcCpUBPS2dipilsKtekLo8x5RO5
         O18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=erWFusTA5TuKPwE3Nt8OPxx8hA6GPOD2hXnGgEY4r50=;
        b=wyrqVmsXiPsvry83Kwj7f5kHwcuZyHMwEuZU9FVTXC9Ct8CdXxdFaGwqQ9XUeUhu4I
         6HjXA/XeRwOOQCUi4yh+oFZKY/0pOVpXrFZHsdpvxfMw9PzrFDpjNttFcqpKd/G5WIY7
         Wsw1gkenddM4+s0Eyfajz0iNyA5S61p8Pd/UOsa1ov2I/0vBu1iLSwATCvou6znDfrcw
         S1owIu0NwtxV76BzuSNG9V6BlypknCK5J/S5zzy4XSCJQ3CmsE8kwaOKYtWLM96b4Eql
         v6lgqJkeWW9YpvKutb41Tm2pY2VZuv5m2eQBo9CW5YVd12dcs78blENHbTih+ZcZPJzS
         r3Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u8si2844082qku.139.2017.10.19.10.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 Oct 2017 10:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50313 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e5EIV-0002dl-7A
	for alex.bennee@linaro.org; Thu, 19 Oct 2017 13:07:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5DoK-0001at-RE
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 12:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1e5DoG-0003lA-Lv
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 12:36:44 -0400
Received: from 9.mo5.mail-out.ovh.net ([178.32.96.204]:58891)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1e5DoG-0003kM-FN
	for qemu-devel@nongnu.org; Thu, 19 Oct 2017 12:36:40 -0400
Received: from player786.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id 3F3B81461FC
	for <qemu-devel@nongnu.org>; Thu, 19 Oct 2017 18:36:39 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
	[90.76.52.173]) (Authenticated sender: clg@kaod.org)
	by player786.ha.ovh.net (Postfix) with ESMTPSA id 0BBE480072;
	Thu, 19 Oct 2017 18:36:32 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Oct 2017 18:35:44 +0200
Message-Id: <20171019163546.2039-7-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171019163546.2039-1-clg@kaod.org>
References: <20171019163546.2039-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 15318712660860046097
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedttddrudekgddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.32.96.204
Subject: [Qemu-devel] [PATCH v6 6/8] aspeed: Add EEPROM I2C devices
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SzBCXWH5wfWf

The Aspeed boards have at least one EEPROM to hold the Vital Product
Data (VPD).

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/aspeed.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 124a0e5240b5..df7f266800ba 100644
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
@@ -276,11 +277,15 @@ static void palmetto_bmc_i2c_init(AspeedBoardState =
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
@@ -317,6 +322,10 @@ static const TypeInfo palmetto_bmc_type =3D {
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
@@ -386,6 +395,7 @@ static const TypeInfo romulus_bmc_type =3D {
 static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
+    uint8_t *eeprom_buf =3D g_malloc0(8 * 1024);
=20
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423",=
 0x4c);
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
@@ -396,6 +406,9 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
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

