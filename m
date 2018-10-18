Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2839658wrt;
        Thu, 18 Oct 2018 13:39:56 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cVUvS99fb/czpvpFnGKRzhdFlG7Pqp2S0pu72rTmbASBoKGsL+j+M+y+srpIpML18rq/c0
X-Received: by 2002:aed:2b22:: with SMTP id p31-v6mr3071742qtd.118.1539895196198;
        Thu, 18 Oct 2018 13:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539895196; cv=none;
        d=google.com; s=arc-20160816;
        b=HNxaO8a52hh/kA3/h+NYjVb5t4zXSELp7R7srqQ/fgHpoaBUOeyyr2LEBFay+DQyxA
         /ZZU8LXImY1KtEXTvbtxRiocQvoaNWeV0W4KFIBrEnFhqdcYKEr8Gsg5i62wA6p4p9Bb
         xAalHECC6CgsrGXMytSFo+Z0VIe1Oyb93f7Xp67bVsOAOaZrxsFQRSmX+HUfWKfyz0+/
         MPSfkijH7d1CefTevQ7O4BnUzJHFXxcYlbZJasv4yfHqfteMGf0/99MKLXulW/qH3O3f
         qpEKzIXiO5m8Hqb2rWJLp1hNSNFzvHaSywHvdDuCKGYUtAT1RoNrq4wNuEa3w/R5j4e3
         l6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=zdbeDkF2PRoB3FEFkXWJvalcZ4l6VHlbFb8obWcfBYM=;
        b=WQ6xk7+v+0eMmyynOd8Ghn0ap/1ldpmgDyqEYYcDaF1hazozeUjhVp3tRDRetvNQSv
         7+al6hnCB6tlu2EQ4BlaXwLz6BnCv8H0UR5y2WWEcSQ1nOIsj0NXY9qSWP4nkd3rmoMy
         mRG3fK7ZsK/DhXic05CTY2TXx2YJ9ohRTq9FWTXNbrsFdLyfGGeSsR3ZooRs0FKluOHj
         nTbwXLIMsPFF3so6fiQCSx9sc/PxjECAaEP+bn/5ls0lraeuJ7zFJuChIhMdw98ss1PO
         StUE2fizgjrh7HhniD+tSc9V27+lKz6Zvjh61xPtKzY28LPAqVitzLmeZ2YeRTjhvdFE
         ECDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38-v6si15934074qte.18.2018.10.18.13.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDF5H-00054R-MD
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:39:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEcL-00041Q-Am
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:10:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEcK-0004UD-H7
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:10:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41518)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEcK-0004Tv-BL; Thu, 18 Oct 2018 16:10:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 726A481DE1;
	Thu, 18 Oct 2018 20:09:59 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B50F60BE1;
	Thu, 18 Oct 2018 20:09:54 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:21 -0300
Message-Id: <20181018200422.4358-45-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 18 Oct 2018 20:09:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 44/45] net: xgmac: convert SysBus init method to a
 realize method
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Eric Blake <eblake@redhat.com>, Rob Herring <robh@kernel.org>,
	Alexander Graf <agraf@suse.de>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HA5z7PGoGWTO

From: C=C3=A9dric Le Goater <clg@kaod.org>

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20181001063803.22330-12-clg@kaod.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/xgmac.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
index fa001563d3..63f5a62ebf 100644
--- a/hw/net/xgmac.c
+++ b/hw/net/xgmac.c
@@ -374,9 +374,9 @@ static NetClientInfo net_xgmac_enet_info =3D {
     .receive =3D eth_rx,
 };
=20
-static int xgmac_enet_init(SysBusDevice *sbd)
+static void xgmac_enet_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev =3D DEVICE(sbd);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     XgmacState *s =3D XGMAC(dev);
=20
     memory_region_init_io(&s->iomem, OBJECT(s), &enet_mem_ops, s,
@@ -397,8 +397,6 @@ static int xgmac_enet_init(SysBusDevice *sbd)
                                  (s->conf.macaddr.a[2] << 16) |
                                  (s->conf.macaddr.a[1] << 8) |
                                   s->conf.macaddr.a[0];
-
-    return 0;
 }
=20
 static Property xgmac_properties[] =3D {
@@ -408,10 +406,9 @@ static Property xgmac_properties[] =3D {
=20
 static void xgmac_enet_class_init(ObjectClass *klass, void *data)
 {
-    SysBusDeviceClass *sbc =3D SYS_BUS_DEVICE_CLASS(klass);
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
-    sbc->init =3D xgmac_enet_init;
+    dc->realize =3D xgmac_enet_realize;
     dc->vmsd =3D &vmstate_xgmac;
     dc->props =3D xgmac_properties;
 }
--=20
2.18.0.rc1.1.g3f1ff2140

