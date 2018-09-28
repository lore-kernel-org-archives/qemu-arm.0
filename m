Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp744916wrt;
        Fri, 28 Sep 2018 06:56:30 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62uyy7XwAbXOmizaqelJek9nysq48wJy8WOAJGdVkwz3SycVzmNxxASUmaihuVqcYIVqezZ
X-Received: by 2002:a37:8dc2:: with SMTP id p185-v6mr11424459qkd.53.1538142990735;
        Fri, 28 Sep 2018 06:56:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538142990; cv=none;
        d=google.com; s=arc-20160816;
        b=AF2YNfSrUhyg8uiaHyiOUPhCEhPI9GVrZF2bjMyVi++KvFSisDsgOC5TH73zto2DUA
         LowkZNlb2bebXsa1B7xddUuQjjd1RYhTmNuJwiG/5Y3NbJddWSnQo8QFY/nsMCUa1Q8Z
         mmQgUtiYZAN4HGEC6pY+ftnzMdDAqJBxx68dYs8Dt+Qp94aD6UKxFdwM2519HAyiYNx4
         WnMwojSMIRKlvrDA1jDbSAfyLQ2R7minpAZ8Ddr31+Zy0EvOp7iRxea1PtSBZMw34hIi
         hMop8K8Amk8dEevatENAFtbFCod5mTlc09rEzFfMyQ+eAR7vTl+ko9gV0cnsJSYjC2RY
         wNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=bh1Ygx+owgmziv0IoDjtg2i75r1Bwn2VeAkzLmr9eSc=;
        b=0iVwPeiBKG6G6CK17aUxlYlMKr5R7p1U5PneKmBUUTyZ/8L5rorkxdVTf2qXiyIkSt
         DyCxCFiRzk0UchrdAWjFwMTnSvsAcgcTN1DOKTu0Lic7lhAjZORxcQSMd4fEH5LiA0gh
         d2mn9WK1in+C8a//YlNSCg51KZJY3kzwbl+i/7DUqTayT7rDHUCd9iroqc1vFM17uD6G
         Ivli5ATrbmFFWVXLioktZUDRLlXJRSnlzwnJGk0poNvOiALYe3fhlLYvZb40/vd9194v
         yG/t/5IxWPPA8hDRL+bbjZ6WPzHAueMm+hFMWPNa9C1atOwDO2c5fowI3TLg60Hj99nM
         sjwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h7-v6si3421882qtr.327.2018.09.28.06.56.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Sep 2018 06:56:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43530 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5tFu-0001LO-5t
	for alex.bennee@linaro.org; Fri, 28 Sep 2018 09:56:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g5tAb-0004qT-QE
	for qemu-arm@nongnu.org; Fri, 28 Sep 2018 09:51:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g5tAX-00078T-NC
	for qemu-arm@nongnu.org; Fri, 28 Sep 2018 09:51:01 -0400
Received: from 7.mo177.mail-out.ovh.net ([46.105.61.149]:32835)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g5tAX-000784-Ga
	for qemu-arm@nongnu.org; Fri, 28 Sep 2018 09:50:57 -0400
Received: from player691.ha.ovh.net (unknown [10.109.159.7])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 44CFD921DC
	for <qemu-arm@nongnu.org>; Fri, 28 Sep 2018 15:50:56 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player691.ha.ovh.net (Postfix) with ESMTPSA id 0B4ED26008E;
	Fri, 28 Sep 2018 15:50:51 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 28 Sep 2018 15:50:01 +0200
Message-Id: <20180928135003.8650-10-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180928135003.8650-1-clg@kaod.org>
References: <20180928135003.8650-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 3584865303964847103
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedruddtledgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.61.149
Subject: [Qemu-arm] [PATCH 09/11] net: stellaris_enet: convert SysBus init
 method to a realize method
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OW2hwi/pW5Ny

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/net/stellaris_enet.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 165562d7886a..3ee1e0f8a43f 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -473,9 +473,9 @@ static NetClientInfo net_stellaris_enet_info =3D {
     .receive =3D stellaris_enet_receive,
 };
=20
-static int stellaris_enet_init(SysBusDevice *sbd)
+static void stellaris_enet_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev =3D DEVICE(sbd);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     stellaris_enet_state *s =3D STELLARIS_ENET(dev);
=20
     memory_region_init_io(&s->mmio, OBJECT(s), &stellaris_enet_ops, s,
@@ -489,7 +489,6 @@ static int stellaris_enet_init(SysBusDevice *sbd)
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
=20
     stellaris_enet_reset(s);
-    return 0;
 }
=20
 static Property stellaris_enet_properties[] =3D {
@@ -500,9 +499,8 @@ static Property stellaris_enet_properties[] =3D {
 static void stellaris_enet_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
=20
-    k->init =3D stellaris_enet_init;
+    dc->realize =3D stellaris_enet_realize;
     dc->props =3D stellaris_enet_properties;
     dc->vmsd =3D &vmstate_stellaris_enet;
 }
--=20
2.17.1

