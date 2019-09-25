Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp913691wrp;
        Wed, 25 Sep 2019 08:07:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxSlDFllalAYv2d6+4Qmkp3dTqwc0hHpYsDyPICCIV7sC+gsdqOww8J+9uXsdq6R90GnA8u
X-Received: by 2002:a37:5a06:: with SMTP id o6mr4032802qkb.279.1569424030023;
        Wed, 25 Sep 2019 08:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569424030; cv=none;
        d=google.com; s=arc-20160816;
        b=pL/D6oH4KjYYtH4NXNb8tt9giuvCqJ9OSST2EQ5cmKADP/V4Cjoa8S2dBibCBOLQsC
         Xwiop77DryxwNMDYDJXfJHzPriFj+Plyi9FOUUIsWNIPH0NuMkEB9rk+ULzXP47MgUwf
         30+gEUT5K1g91klQ0/zG6eQzpqz6JZ+4TQgF4hOvtVRgtE7mSs8/Q8LWau/w9L+8Pzpb
         G4cnuuGpqRYDg1ZRZeU5k84IQlx8O01vNO3xGrKDDOeGIzoy0C64Wq0s6BdwNhygoGni
         O6t6xlmVvqI8kYd+5XGxKJ+bo52mrqYaXHob7oUYMV/WKbEknPnnNxANj+D9a4fFnrES
         f+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=nI3q3Jl4ZNeBzEPEHSUvUNjr5LUURUPZyn2IJAGEqg4=;
        b=LRJz3UgkjbmdmhhiFy5YMctoFKLD343xsu7Fwr6aoAerUGOmz3JDuBjzxXKH58cWI4
         xSfipkGewI5GdRG8TA637jrqCoTC87bgL9rNN7YWqo7ySSeSRZl/Ts6qX2SicgwmdZXC
         0CtIH9nRvlgcHuMTZKO3ZCSEq6/euTq7vfq+c75TVzLANS5h48PfgvrrbW57JTOqwi/z
         QBIJ80+zHkI4jICnf/ylv++ututk1STjvTj5v7+Kkxl/evyra6CjZGSrY48nCHqArc3e
         bRe4i1mIqZEQvtAeW35bXRjZr1aFULbQNEseT0DU9eV+Upff+KZK9nMoUyauZMM/bmUp
         XChg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c52si3895200qvd.9.2019.09.25.08.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 08:07:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD8sn-00062X-3J
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 11:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iD8O5-0005HQ-AR
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:35:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iD8O3-0001gY-EK
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:35:24 -0400
Received: from 10.mo178.mail-out.ovh.net ([46.105.76.150]:58797)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iD8O3-0001fC-7t
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 10:35:23 -0400
Received: from player786.ha.ovh.net (unknown [10.109.146.50])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 880877A48A
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 16:35:20 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player786.ha.ovh.net (Postfix) with ESMTPSA id 08B9AA4D428A;
 Wed, 25 Sep 2019 14:35:14 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 20/23] aspeed: Add an AST2600 eval board
Date: Wed, 25 Sep 2019 16:32:45 +0200
Message-Id: <20190925143248.10000-21-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925143248.10000-1-clg@kaod.org>
References: <20190925143248.10000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 8874343066435488529
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdejlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.76.150
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
X-TUID: vcEIQPixf4rm

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 include/hw/arm/aspeed.h |  1 +
 hw/arm/aspeed.c         | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 02073a6b4d61..f49bc7081e4d 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -18,6 +18,7 @@ typedef struct AspeedBoardConfig {
     const char *desc;
     const char *soc_name;
     uint32_t hw_strap1;
+    uint32_t hw_strap2;
     const char *fmc_model;
     const char *spi_model;
     uint32_t num_cs;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 52993f84b461..65453278a757 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -88,6 +88,10 @@ struct AspeedBoardState {
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) *=
/
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
=20
+/* AST2600 evb hardware value */
+#define AST2600_EVB_HW_STRAP1 0x000000C0
+#define AST2600_EVB_HW_STRAP2 0x00000003
+
 /*
  * The max ram region is for firmwares that scan the address space
  * with load/store to guess how much RAM the SoC has.
@@ -187,6 +191,8 @@ static void aspeed_board_init(MachineState *machine,
                              &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), cfg->hw_strap1, "hw-strap=
1",
                             &error_abort);
+    object_property_set_int(OBJECT(&bmc->soc), cfg->hw_strap2, "hw-strap=
2",
+                            &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), cfg->num_cs, "num-cs",
                             &error_abort);
     object_property_set_int(OBJECT(&bmc->soc), machine->smp.cpus, "num-c=
pus",
@@ -308,6 +314,12 @@ static void ast2500_evb_i2c_init(AspeedBoardState *b=
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
@@ -455,6 +467,17 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
         .num_cs    =3D 2,
         .i2c_init  =3D witherspoon_bmc_i2c_init,
         .ram       =3D 512 * MiB,
+    }, {
+        .name      =3D MACHINE_TYPE_NAME("ast2600-evb"),
+        .desc      =3D "Aspeed AST2600 EVB (Cortex A7)",
+        .soc_name  =3D "ast2600-a0",
+        .hw_strap1 =3D AST2600_EVB_HW_STRAP1,
+        .hw_strap2 =3D AST2600_EVB_HW_STRAP2,
+        .fmc_model =3D "w25q512jv",
+        .spi_model =3D "mx66u51235f",
+        .num_cs    =3D 1,
+        .i2c_init  =3D ast2600_evb_i2c_init,
+        .ram       =3D 2 * GiB,
     },
 };
=20
--=20
2.21.0

