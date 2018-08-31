Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp446055wrd;
        Fri, 31 Aug 2018 03:44:59 -0700 (PDT)
X-Google-Smtp-Source: ANB0Vdazjb5Yt2gcCrCeh+h3GLZC1hKje4jGGQK9sHWh5575XuHnvlCDPl402yWQsGLcs+qUNDcg
X-Received: by 2002:a0c:da0c:: with SMTP id x12-v6mr14815843qvj.123.1535712299565;
        Fri, 31 Aug 2018 03:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535712299; cv=none;
        d=google.com; s=arc-20160816;
        b=z1r0RB/4cYhr/MFv3Pc6fAYnvCI8whFd0X38FNG5ZJoPP019972669EhKonls/h214
         dHIJcjG2ZIrmKPgN5XWEbSUV7S7D/8bPmFcmEp9Zb7Zum0H9CEH1HGN55/PSqdrSBIA5
         ChLvCnrJplAEVnAQVAUdvEugeAEzDBGPqOdvH92rSvIVghojdUhCC5o6Tp9tphil3kLJ
         HMrGfhi8FzbDJCOY5LrpkJ6DYjg90B2i5bd4rXuXyL/MRLdhLL5YlG14Gf+uVHxuEYxV
         0sFBsKP/tzXpNl1YWVIHpZ8P4ASLVE8mgBOGPGm6KfOBrJgaTtkrpvO7/8H54QgezVPa
         W6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=GxOX0UDmX+AlpEvrCito8qKFkZMPEyS3L2qM3KEBITs=;
        b=nj4ZjHc2+i9zY5qCBIZ+PMrAatwVJAjBcVSPyf4cS9O0/f92JNaR+/Bt5ESF82pc0u
         XD5VibjirvCUYwd5Qqxa8LDMgj+TSrBvpPPmlcgJO/UYSqsYmohSijP9f3Jr1l3DcfYr
         Hgor9XMdaJOZ8viCICTA9fDdp0gVojCnv/8OFvU4TOfd8P3/jst4bwFWKAKrOxFfzpsO
         VBsLhgOlZ/sPVWlrp++vDdD9CnNbxyeB/o9TnGUJO/SLLiR848D5eVrDRNbcdaRqHYUy
         qrBd6lSZfN6f9/d4pD2lZhZqj0rbLRD3A0IR1C8NlKtYmmk1ZHnPHnOLb5nBGCOFkqs6
         HwSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a67-v6si6922283qkj.35.2018.08.31.03.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 03:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52984 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvgvD-0000pK-3f
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 06:44:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgpw-0003G7-65
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 06:39:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fvgps-0002Em-Sr
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 06:39:32 -0400
Received: from 7.mo2.mail-out.ovh.net ([188.165.48.182]:40876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fvgps-0002DZ-LD
	for qemu-devel@nongnu.org; Fri, 31 Aug 2018 06:39:28 -0400
Received: from player168.ha.ovh.net (unknown [10.109.159.68])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 327EB156B23
	for <qemu-devel@nongnu.org>; Fri, 31 Aug 2018 12:39:27 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id CD73142008C;
	Fri, 31 Aug 2018 12:39:18 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 31 Aug 2018 12:38:14 +0200
Message-Id: <20180831103816.13479-8-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831103816.13479-1-clg@kaod.org>
References: <20180831103816.13479-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1936266368223120192
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrhedtgdeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.48.182
Subject: [Qemu-devel] [PATCH 07/11] aspeed/smc: add a 'sdram_base' and
 'max-ram-size' properties
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jqAbY/I9xotk

The setting of the DRAM address of the DMA transaction depends on the
DRAM base address and the maximun DRAM size of the SoC. Let's add a
couple of properties to give this information to the SMC controller
model.

Also, move the SDRAM Memory controller realization before the other
controllers which need it.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  4 ++++
 hw/arm/aspeed_soc.c         | 28 +++++++++++++++++++---------
 hw/ssi/aspeed_smc.c         |  2 ++
 3 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 1f557313fa93..d7090bb5e9b7 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -97,6 +97,10 @@ typedef struct AspeedSMCState {
     uint8_t r_timings;
     uint8_t conf_enable_w0;
=20
+    /* for DMA support */
+    uint64_t sdram_base;
+    uint64_t max_ram_size;
+
     AspeedSMCFlash *flashes;
 } AspeedSMCState;
=20
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 2cbacb4430bb..bbc05d172fe1 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -209,6 +209,14 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     }
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->scu), 0, ASPEED_SOC_SCU_BASE);
=20
+    /* SDMC - SDRAM Memory Controller */
+    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
+
     /* VIC */
     object_property_set_bool(OBJECT(&s->vic), true, "realized", &err);
     if (err) {
@@ -252,7 +260,17 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
                        qdev_get_gpio_in(DEVICE(&s->vic), 12));
=20
     /* FMC, The number of CS is set at the board level */
-    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &err);
+    object_property_set_int(OBJECT(&s->fmc), sc->info->sdram_base, "sdra=
m-base",
+                            &err);
+    object_property_set_int(OBJECT(&s->fmc), s->sdmc.max_ram_size,
+                            "max-ram-size", &local_err);
+    error_propagate(&err, local_err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+    object_property_set_bool(OBJECT(&s->fmc), true, "realized", &local_e=
rr);
+    error_propagate(&err, local_err);
     if (err) {
         error_propagate(errp, err);
         return;
@@ -278,14 +296,6 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
                         s->spi[i].ctrl->flash_window_base);
     }
=20
-    /* SDMC - SDRAM Memory Controller */
-    object_property_set_bool(OBJECT(&s->sdmc), true, "realized", &err);
-    if (err) {
-        error_propagate(errp, err);
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
-
     /* Watch dog */
     for (i =3D 0; i < sc->info->wdts_num; i++) {
         object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &=
err);
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 6045ca11b969..500de6d16d09 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -800,6 +800,8 @@ static const VMStateDescription vmstate_aspeed_smc =3D=
 {
=20
 static Property aspeed_smc_properties[] =3D {
     DEFINE_PROP_UINT32("num-cs", AspeedSMCState, num_cs, 1),
+    DEFINE_PROP_UINT64("sdram-base", AspeedSMCState, sdram_base, 0),
+    DEFINE_PROP_UINT64("max-ram-size", AspeedSMCState, max_ram_size, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
--=20
2.17.1

