Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp254611lfi;
        Mon, 18 Nov 2019 08:18:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwvcByOr2p+NZDCrCZOO4V4pfDNMDD/Qn6jE5ktUadWpSFuGpeRbHUvF9xcTz3nivhOKTiK
X-Received: by 2002:a37:bd41:: with SMTP id n62mr25617021qkf.379.1574093880505;
        Mon, 18 Nov 2019 08:18:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574093880; cv=none;
        d=google.com; s=arc-20160816;
        b=Ml4Khzue6mePmYdp3vzElY+dlfFs2PjnY+ZDHDMEiYMIXBn0cPY90cPvkQyKVaN+3d
         tYpYri5OsqApanVUAUzmvsxy64Edn0ah8CY7QZpEtrqy0Wajhb+OV3A30uURU6G0NK3s
         58ex4JLTw4gXVTtpo528LEaZEQiYMc+GBU8GNQeBI9Q3NcTsTq5YJOyWdU+kHmVtKdHV
         O3diXLwgKkh3P0bF6yMZdqiUr3PbJe7PLtOFbXrXplkAQJfiylohBDyybuJ+Jb6in2zj
         Z0IMqQOrftliseccdWf6gW9j3M2iijjzr1066tS8MoTyw/IFMw6cRjAvsM4cyWlfA10u
         o08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=aPzx1fgxd1xStHLSQ/aOQxQCX8+WTZiXV7xFnQ4aU0Y=;
        b=k0H/Tek7BbapdTgBkqANFhJcZj8rRbchPyYLKhg7ZVn1Jg7WMFwFZF6G463xCnZ+jq
         YX/ysnOWc0eVMc0RgJYsOnpo7lQ0rXzgKNJOcVRTD4pkBidYQrOgxQUUGT1UV0s7SWc2
         P/46FTsNtAf3yIuZv3CNou1cehNI3sOQeRRkvuN7uCeEs7rDRfzTLq2PO05H9T4hRY0K
         kSBaf2ey03MwPUzzkrz4OgdOX+0E8GIbSlStP+5D9w3aGx2xCNLgAFyaAWNRB6g/Xv/u
         fpOHh54FRI5KuWwBTcly/NHUxi9yij7olnN7FFWWX0lT9wNAhxadZMCzOu+QjP8wa4kV
         +VUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si11942005qte.263.2019.11.18.08.18.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 08:18:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWjix-0001J7-F5
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 11:17:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iWjih-0001DV-T8
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 11:17:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iWjig-00069X-Ms
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 11:17:43 -0500
Received: from 4.mo4.mail-out.ovh.net ([178.32.98.131]:35337)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iWjig-000693-Gc
 for qemu-arm@nongnu.org; Mon, 18 Nov 2019 11:17:42 -0500
Received: from player796.ha.ovh.net (unknown [10.109.143.220])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id D5034212833
 for <qemu-arm@nongnu.org>; Mon, 18 Nov 2019 17:17:40 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player796.ha.ovh.net (Postfix) with ESMTPSA id 701CBC1CB3EA;
 Mon, 18 Nov 2019 16:17:32 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.0 2/2] aspeed: change the "nic" property definition
Date: Mon, 18 Nov 2019 17:17:12 +0100
Message-Id: <20191118161712.6712-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191118161712.6712-1-clg@kaod.org>
References: <20191118161712.6712-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 14133421532880866065
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegiedgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedu
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.32.98.131
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t5fUQoMoHo5S

The Aspeed MII model has a link pointing to its associated FTGMAC100
NIC in the machine.

Change the "nic" property definition so that it explicitly sets the
pointer. The property isn't optional : not being able to set the link
is a bug and QEMU should rather abort than exit in this case.

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

