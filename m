Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2835724wrt;
        Thu, 18 Oct 2018 13:35:59 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63+3BiM/RA4HvyVK2E8O0LmmtahmTMqPlmTq28zZXVO1IUWO0xgsmtPkAq/Amjt88n/tMtT
X-Received: by 2002:a37:26d2:: with SMTP id m79-v6mr30884351qkm.167.1539894959690;
        Thu, 18 Oct 2018 13:35:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539894959; cv=none;
        d=google.com; s=arc-20160816;
        b=zSNnVl82tZQD+QE9eHkXPLOfdBL4RmMimRYhM72y46fXxbjtJ8uVr8Dr+HMJGMOc8N
         lEQjvpZUQbqKtrfAmVuGszz5sS65loQJ0YMC79UvgIROGUwPrbafKImGHPWjNeurdH2G
         GvCN+rhn1YKRdTPP1M5OUHB4fNvOeRBzvUajIc/L5h9OBgPg5vo7OVR76yX0RLZAukbV
         +kVW8Wdw6oCOKs4FPcZc89OEzt2va0ImfDjAPIdcKE9q9FBgKlDeb/Tk/BKsuZhIjgHg
         E9u9Es5CFRWoImPbUfz04kPZD7jCi6oOZz5rgrmGNBdnqnHx1S+pg0l0E7CCItRJ+DgO
         ZvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ZLe0yFZtStoS7M/zedaHOKNTJRuYVoS35ukH+2driys=;
        b=CzGBsMT71eA3Gt29pIpIPPOUUT3kLjn+N19GLH73tKgEFpvMSgtDSMhzYscXD5SZio
         k4CSM87nrDVVoRM/aPgoFGvvIT5tcXj2UCtIFATbo2EDa17pOJFUNO27ha4XIDo+IeuJ
         Z5ya7hR6gNz+tq+R/sRzPKiM0Zk01FIXEtjD0/voqwE+tXBJgFKpk97MRDYX9/hU7BWL
         9NMqBFfNNwlDggESNfN5m1Bm2wAaLg8CNqDjUFZ1aRC1c3Lsngd1GIdguQ22m5d7g6gG
         wzbP1IALwiHpzl9gW/15sK3elc6BztY0hYLOj8dTMM0YVSqfb9VUY6VjcQtXLcT613ck
         VZNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c1-v6si1549803qkb.227.2018.10.18.13.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:35:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDF1T-0001cu-52
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:35:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEc7-0003p6-B4
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEc5-0004QI-2Q
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36446)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEc4-0004Pp-Rf; Thu, 18 Oct 2018 16:09:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B784815552;
	Thu, 18 Oct 2018 20:09:43 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 399AE19489;
	Thu, 18 Oct 2018 20:09:43 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:19 -0300
Message-Id: <20181018200422.4358-43-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 18 Oct 2018 20:09:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 42/45] net: stellaris_enet: convert SysBus init
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
X-TUID: cRTHvsA1hO4p

From: C=C3=A9dric Le Goater <clg@kaod.org>

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20181001063803.22330-10-clg@kaod.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/stellaris_enet.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 165562d788..3ee1e0f8a4 100644
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
2.18.0.rc1.1.g3f1ff2140

