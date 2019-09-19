Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp599335wrp;
        Wed, 18 Sep 2019 23:12:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx2WfIUb6VQvDrMjGXfdAnSiE5Gz+YruQ4rcdvb5XB9UObcIoYg+aCOGS6VbF/dQi520cqi
X-Received: by 2002:ae9:e810:: with SMTP id a16mr1279695qkg.364.1568873562088;
        Wed, 18 Sep 2019 23:12:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568873562; cv=none;
        d=google.com; s=arc-20160816;
        b=JWDMIVkSdj2uMwCuIToumoPBJ2FdjZChB4nOU3UZt34X9reF4cuxHhJtS+1MSMN4aJ
         5YvjCmcTRRPUoTTev3AdQlH51JJ7D/wDs81Ss2O32gIYbGAf68aiijN1zMU8gBq5NLih
         vAGJEYWWNBvXq495hpF/cWFykHiSMQurMscUAL/PnY0mA0pPRGFFGhrIZ7uMlbsShcTM
         isbMMbAhblvjvkn3vfflkcnwPUMRE2/U3rj13FXcLoSDFM7oK9ju11CkkzjopE33KBFI
         35ciHOk5UgS/nBXrV4VDOf5EXtd0cQuQaPq+aG7ZHylFkc077M98oZLZrFubijnQrfPI
         H/yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=DcYkjLOWGBZmrchboQD9IBxnptPjPEIX3LinY58gO3w=;
        b=eQjtn2BgcEE6L7D1O044fUYXhGXnqKtbdo2GHP59TDqevARIozGgjvgZBNcNixM1Fu
         j7vKZISDdj3WHn8FeR7i7txtusaaVQxbNLWi/xfrDA3AHBxFGhbFEPWctEgQebRjLSYF
         NcfyvJum7NiSd7n4Rf1q74ng3agf6ZNMLwF0EXXLSyKaH6LuYicmzXI+U6igH5XNhnR0
         JQQEGdVRaUH4GkGLGSOIah6M7VMBIDCdBNiQxMu03EtE1td8/M1SZOqWCS9tt8ufE6Bz
         fzOshlLCx4inxM/msjCyfjTo4uNaXziTAmLS3KM1hjWnA1xbWdRWhmu1CYi5UI9tvBHk
         Cq8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 58si5494745qvw.130.2019.09.18.23.12.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 23:12:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iApgG-0007dc-UO
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 02:12:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iApMd-0002hI-2W
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 01:52:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iApMb-0000Qv-QV
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 01:52:22 -0400
Received: from 16.mo7.mail-out.ovh.net ([46.105.72.216]:53719)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iApMb-0000QE-Ks
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 01:52:21 -0400
Received: from player788.ha.ovh.net (unknown [10.109.160.217])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 6D6C41336D1
 for <qemu-arm@nongnu.org>; Thu, 19 Sep 2019 07:52:20 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id A7FDD9F17680;
 Thu, 19 Sep 2019 05:52:13 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 07:50:00 +0200
Message-Id: <20190919055002.6729-20-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919055002.6729-1-clg@kaod.org>
References: <20190919055002.6729-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1698982963550718737
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.72.216
Subject: [Qemu-arm] [PATCH 19/21] aspeed: Parameterise number of MACs
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
X-TUID: oxhM9za5qshp

From: Joel Stanley <joel@jms.id.au>

To support the ast2600's four MACs allow SoCs to specify the number
they have, and create that many.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[clg: included a check on sc->macs_num when realizing the macs ]
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 5 ++++-
 hw/arm/aspeed_ast2600.c     | 7 +++++--
 hw/arm/aspeed_soc.c         | 6 ++++--
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 67c59956f835..088a5d108185 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -30,7 +30,7 @@
 #define ASPEED_SPIS_NUM  2
 #define ASPEED_WDTS_NUM  4
 #define ASPEED_CPUS_NUM  2
-#define ASPEED_MACS_NUM  2
+#define ASPEED_MACS_NUM  4
=20
 typedef struct AspeedSoCState {
     /*< private >*/
@@ -69,6 +69,7 @@ typedef struct AspeedSoCClass {
     uint64_t sram_size;
     int spis_num;
     int wdts_num;
+    int macs_num;
     const int *irqmap;
     const hwaddr *memmap;
     uint32_t num_cpus;
@@ -114,6 +115,8 @@ enum {
     ASPEED_I2C,
     ASPEED_ETH1,
     ASPEED_ETH2,
+    ASPEED_ETH3,
+    ASPEED_ETH4,
     ASPEED_SDRAM,
     ASPEED_XDMA,
 };
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index cc50e52c24ca..ec51f9b6e617 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -32,7 +32,9 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_SPI1]      =3D 0x1E630000,
     [ASPEED_SPI2]      =3D 0x1E641000,
     [ASPEED_ETH1]      =3D 0x1E660000,
+    [ASPEED_ETH3]      =3D 0x1E670000,
     [ASPEED_ETH2]      =3D 0x1E680000,
+    [ASPEED_ETH4]      =3D 0x1E690000,
     [ASPEED_VIC]       =3D 0x1E6C0000,
     [ASPEED_SDMC]      =3D 0x1E6E0000,
     [ASPEED_SCU]       =3D 0x1E6E2000,
@@ -175,7 +177,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
                                        OBJECT(&s->scu), &error_abort);
     }
=20
-    for (i =3D 0; i < ASPEED_MACS_NUM; i++) {
+    for (i =3D 0; i < sc->macs_num; i++) {
         sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[=
i]),
                               sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
     }
@@ -399,7 +401,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
     }
=20
     /* Net */
-    for (i =3D 0; i < nb_nics; i++) {
+    for (i =3D 0; i < nb_nics && i < sc->macs_num; i++) {
         qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed=
",
                                  &err);
@@ -472,6 +474,7 @@ static void aspeed_soc_ast2600_class_init(ObjectClass=
 *oc, void *data)
     sc->sram_size    =3D 0x10000;
     sc->spis_num     =3D 2;
     sc->wdts_num     =3D 4;
+    sc->macs_num     =3D 4;
     sc->irqmap       =3D aspeed_soc_ast2600_irqmap;
     sc->memmap       =3D aspeed_soc_ast2600_memmap;
     sc->num_cpus     =3D 2;
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index a063be9fd795..6defb143acde 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -198,7 +198,7 @@ static void aspeed_soc_init(Object *obj)
                                        OBJECT(&s->scu), &error_abort);
     }
=20
-    for (i =3D 0; i < ASPEED_MACS_NUM; i++) {
+    for (i =3D 0; i < sc->macs_num; i++) {
         sysbus_init_child_obj(obj, "ftgmac100[*]", OBJECT(&s->ftgmac100[=
i]),
                               sizeof(s->ftgmac100[i]), TYPE_FTGMAC100);
     }
@@ -372,7 +372,7 @@ static void aspeed_soc_realize(DeviceState *dev, Erro=
r **errp)
     }
=20
     /* Net */
-    for (i =3D 0; i < nb_nics; i++) {
+    for (i =3D 0; i < nb_nics && i < sc->macs_num; i++) {
         qdev_set_nic_properties(DEVICE(&s->ftgmac100[i]), &nd_table[i]);
         object_property_set_bool(OBJECT(&s->ftgmac100[i]), true, "aspeed=
",
                                  &err);
@@ -455,6 +455,7 @@ static void aspeed_soc_ast2400_class_init(ObjectClass=
 *oc, void *data)
     sc->sram_size    =3D 0x8000;
     sc->spis_num     =3D 1;
     sc->wdts_num     =3D 2;
+    sc->macs_num     =3D 2;
     sc->irqmap       =3D aspeed_soc_ast2400_irqmap;
     sc->memmap       =3D aspeed_soc_ast2400_memmap;
     sc->num_cpus     =3D 1;
@@ -478,6 +479,7 @@ static void aspeed_soc_ast2500_class_init(ObjectClass=
 *oc, void *data)
     sc->sram_size    =3D 0x9000;
     sc->spis_num     =3D 2;
     sc->wdts_num     =3D 3;
+    sc->macs_num     =3D 2;
     sc->irqmap       =3D aspeed_soc_ast2500_irqmap;
     sc->memmap       =3D aspeed_soc_ast2500_memmap;
     sc->num_cpus     =3D 1;
--=20
2.21.0

