Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp595986lfc;
        Tue, 19 Nov 2019 06:21:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqyw7nIF4iyPZI6aGMnGN1tAhpLvbWW1ChFSKOnHdmoYygsExurncXorV8OI8RuH3tN1I4Vm
X-Received: by 2002:a37:a2d8:: with SMTP id l207mr28994339qke.375.1574173293443;
        Tue, 19 Nov 2019 06:21:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574173293; cv=none;
        d=google.com; s=arc-20160816;
        b=zEOOrejOgJIici3UAyY9/x6Tol52Dye/u31FKJAAxdrxZnkSXvijJqa/BfdGuxgMpZ
         oozJhWMQZ7q596GGIQCAZNN4dO6X73KXKHHo932hU42966YQxk8h3rWeMxpG2dzL7JI5
         XtcHZ4k0ocBrz166caMGoGM0/wf1/aQcDLyqNBFk5S4Tcq0VIzqOsO/KNLXuq1LLtleJ
         dKHh2dpNrcF8Rx9gL7C+js4DHapB0wKnyw5v3hu3CrGAYJAoSeD5kz2v2dQab3ETt57v
         zuXtRVgaLRI5tvVezeZvXqJFmX+I0mUimfABddYRUCHMoHL/7XtDuQ8vMZ9QuNnxq8Fq
         IKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=XHiUX7su+z1bJQXV/NIJGFRg2bwUBYNeq0RVCK1Sik8=;
        b=0PazL2F5twR92DDlhV4R69jMISQjyncKaVsHgTOOhuyJX10GRpPVp27d4JulvrBUvn
         Vo0iadivT91fxnUaSon89fWfJgQHU4xD1Zdf/l4e+O3T7rE465+dKrGOdPPN1ZyeuG4O
         +jdkwv16rDwZR3IrJRK1df7pfASM1mwyoe4g/nKdK9RCOjlUumAik+DaRNc1sOroAJvl
         N3nEsOLvRhSdP9ZgCuDTy4GUgAmVcMZVkbEUDPl6zt0FTTrBs450irHe4D/HUbfQrKo5
         zNmbnN2lG9KTUEJ/xpBAlorqbW1J4xsWC9N+r/ZGMzWwacsaAXDZ45OJII0r3D6LlGed
         9i5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si13110917qtj.232.2019.11.19.06.21.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 06:21:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iX4No-0006LX-Az
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 09:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42359)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iX4HD-00085p-LL
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 09:14:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iX4HC-00068H-3p
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 09:14:43 -0500
Received: from 9.mo5.mail-out.ovh.net ([178.32.96.204]:37906)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iX4HB-00067P-DD
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 09:14:41 -0500
Received: from player795.ha.ovh.net (unknown [10.108.54.119])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 1F09E25ABEE
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 15:14:40 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 4A546C18B22A;
 Tue, 19 Nov 2019 14:14:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 17/17] aspeed: Change the "nic" property definition
Date: Tue, 19 Nov 2019 15:12:11 +0100
Message-Id: <20191119141211.25716-18-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
References: <20191119141211.25716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17928830118870682385
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpeej
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.32.96.204
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qcrduRZruv5z

The Aspeed MII model has a link pointing to its associated FTGMAC100
NIC in the machine.

Change the "nic" property definition so that it explicitly sets the
pointer. The property isn't optional : not being able to set the link
is a bug and QEMU should rather abort than exit in this case.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_ast2600.c |  5 ++---
 hw/net/ftgmac100.c      | 19 +++++++++----------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 810fd7de0c06..be88005dab8f 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -183,9 +183,6 @@ static void aspeed_soc_ast2600_init(Object *obj)
=20
         sysbus_init_child_obj(obj, "mii[*]", &s->mii[i], sizeof(s->mii[i=
]),
                               TYPE_ASPEED_MII);
-        object_property_add_const_link(OBJECT(&s->mii[i]), "nic",
-                                       OBJECT(&s->ftgmac100[i]),
-                                       &error_abort);
     }
=20
     sysbus_init_child_obj(obj, "xdma", OBJECT(&s->xdma), sizeof(s->xdma)=
,
@@ -441,6 +438,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *d=
ev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->ftgmac100[i]), 0,
                            aspeed_soc_get_irq(s, ASPEED_ETH1 + i));
=20
+        object_property_set_link(OBJECT(&s->mii[i]), OBJECT(&s->ftgmac10=
0[i]),
+                                 "nic", &error_abort);
         object_property_set_bool(OBJECT(&s->mii[i]), true, "realized",
                                  &err);
         if (err) {
diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index eb8b441461a1..86ac25894a89 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -1204,17 +1204,8 @@ static void aspeed_mii_realize(DeviceState *dev, E=
rror **errp)
 {
     AspeedMiiState *s =3D ASPEED_MII(dev);
     SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
-    Object *obj;
-    Error *local_err =3D NULL;
=20
-    obj =3D object_property_get_link(OBJECT(dev), "nic", &local_err);
-    if (!obj) {
-        error_propagate(errp, local_err);
-        error_prepend(errp, "required link 'nic' not found: ");
-        return;
-    }
-
-    s->nic =3D FTGMAC100(obj);
+    assert(s->nic);
=20
     memory_region_init_io(&s->iomem, OBJECT(dev), &aspeed_mii_ops, s,
                           TYPE_ASPEED_MII, 0x8);
@@ -1231,6 +1222,13 @@ static const VMStateDescription vmstate_aspeed_mii=
 =3D {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static Property aspeed_mii_properties[] =3D {
+    DEFINE_PROP_LINK("nic", AspeedMiiState, nic, TYPE_FTGMAC100,
+                     FTGMAC100State *),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void aspeed_mii_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -1239,6 +1237,7 @@ static void aspeed_mii_class_init(ObjectClass *klas=
s, void *data)
     dc->reset =3D aspeed_mii_reset;
     dc->realize =3D aspeed_mii_realize;
     dc->desc =3D "Aspeed MII controller";
+    dc->props =3D aspeed_mii_properties;
 }
=20
 static const TypeInfo aspeed_mii_info =3D {
--=20
2.21.0

