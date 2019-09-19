Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp597285wrp;
        Wed, 18 Sep 2019 23:10:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytYm+xNMo+2P5XtDrQAQPd4GSQhG4nL0lxmvR+b5df2uWpd8+t2ELBELLoj5FLe0dq+L3m
X-Received: by 2002:a37:9782:: with SMTP id z124mr1209921qkd.78.1568873404821;
        Wed, 18 Sep 2019 23:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568873404; cv=none;
        d=google.com; s=arc-20160816;
        b=d4ov/WRid/MRyCHz+ci+ODklc7u4QiPoezJES5oaVd5mUTqxnRetkOAt8/xleOEBu6
         KI089OeEO1rSUZf5EaVulvb0xfo0OjvO+ZTtuG2OAXXA1A/RZZJk6Mml5McwCOoJdV5h
         It+INdPKK2etLVYpaYQ893Q2ogIwJ9b4hztnXeafASQRoXdbVd/cNO1rDMJ0HlJ0D3LF
         cgQb7fNNw8gYTV2yS41uan9Wdwv+Ikn6es3pllOMVQNzj0IfYemTfORHaiDb0RNYT8iv
         qJsyDU4L5+QbRoExSpt6rC7dR1Y7iVKM856BahZ4SbgT3lyhD5yQZVimR/bBW7Bk9QGc
         TJRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=81Urx0gC/NIZ08kk6uQGKaopFnAzoLCH4uPxp6CH5ig=;
        b=cEC2Rm+eUgPL19qyufuIsTlEa4o/09aBG86ltfD52XRt2xjGEbv3GjMf0RLs/MjuUE
         eD71inv3IsOQTpIBwgck3pvF+Kp3Lh18x1V3c0EqX7tg8Xfp7F94I9OIYyXWxDyrZk6l
         xS31BnJdG7Q6AT7/Mky+QurSd/bDh3SqupZLad2Ygr+TiG/ql86wxaxi+GDa0/D+z11r
         1czkyKfOrfpwk54iLO9DlGytqfiTx205dcj62G2Baq8zIsYSN7sNznY+Md6cD276juRu
         uXLuvNdXCtYhu6V606uLxgxwHXRUOI0bpmYRZ1mbWELFAC6MCHIZGtLSOu3Grsd63lLn
         0P6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t52si5837581qth.353.2019.09.18.23.10.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 23:10:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iApdk-0003vB-0S
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 02:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iApMY-0002aQ-2S
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:52:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iApMW-0000Ni-S5
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:52:17 -0400
Received: from 2.mo68.mail-out.ovh.net ([46.105.52.162]:35848)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iApMW-0000Lk-4j
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:52:16 -0400
Received: from player788.ha.ovh.net (unknown [10.108.57.18])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id ADB96143E57
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 07:52:13 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 3B1739F1766A;
 Thu, 19 Sep 2019 05:52:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 07:49:59 +0200
Message-Id: <20190919055002.6729-19-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919055002.6729-1-clg@kaod.org>
References: <20190919055002.6729-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1697012636932344593
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.52.162
Subject: [Qemu-devel] [PATCH 18/21] aspeed: Add an AST2600 eval board
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iPP+OyZHwSWA

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 52993f84b461..4450e71e5547 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -88,6 +88,9 @@ struct AspeedBoardState {
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
=20
+/* AST2600 evb hardware value: (QEMU prototype) */
+#define AST2600_EVB_HW_STRAP1 AST2500_EVB_HW_STRAP1
+
 /*
  * The max ram region is for firmwares that scan the address space
  * with load/store to guess how much RAM the SoC has.
@@ -308,6 +311,12 @@ static void ast2500_evb_i2c_init(AspeedBoardState *b=
mc)
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "ds1338"=
, 0x32);
 }
=20
+static void ast2600_evb_i2c_init(AspeedBoardState *bmc)
+{
+    /* Start with some devices on our I2C busses */
+    ast2500_evb_i2c_init(bmc);
+}
+
 static void romulus_bmc_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
@@ -455,6 +464,15 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .num_cs    =3D 2,
         .i2c_init  =3D witherspoon_bmc_i2c_init,
         .ram       =3D 512 * MiB,
+    }, {
+        .name      =3D MACHINE_TYPE_NAME("ast2600-evb"),
+        .desc      =3D "Aspeed AST2600 EVB (Cortex A7)",
+        .soc_name  =3D "ast2600-a0",
+        .hw_strap1 =3D AST2600_EVB_HW_STRAP1,
+        .fmc_model =3D "mx25l25635e",
+        .spi_model =3D "mx25l25635e",
+        .num_cs    =3D 1,
+        .i2c_init  =3D ast2600_evb_i2c_init,
     },
 };
=20
--=20
2.21.0

