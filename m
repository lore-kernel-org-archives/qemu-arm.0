Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2849678wrt;
        Thu, 18 Oct 2018 13:49:45 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62nGP0mph6KHcXC0zO020UuxJdMwo8FZfGCIZtVKZVR/Ixl7H+4UCwzrKdfby0ghpJBsaH4
X-Received: by 2002:ac8:2cb5:: with SMTP id 50-v6mr31378664qtw.338.1539895785749;
        Thu, 18 Oct 2018 13:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539895785; cv=none;
        d=google.com; s=arc-20160816;
        b=Y6NuI9ZcqD1OR5nXY2v3+7ygTKtK145YLPLwMLhoKy9sW2KxwAvyTuhFnEh5T4iyUx
         1IqKZ+hyybmiNwghDrc9I4n4EJylBXzMwBA6ViQFItEzH9xc2uYHOXXe6PX7t+r9vjwc
         Ace7E9pyiHR+b/0bpZcFbAeGUnK8Vp09OPDeDEaSgW3ENHoRszodN9oFZ2phYBXO59mO
         y/LVAi2f/xmizwDrEPF44pTLAgxnx9FreqmRQmqKs92w+hW2TtapyvHSjWJ7AAseHgw6
         iH0MN2BvbJFxpPwNWy/WYlBXzQe//MG/VW/nEl2ThOpqAPzvOXTtYX2nwF2lgGEZ0g6d
         gduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=WoS8uV+Sd4oVuD4b/UR6vx06AUg3AVZztikywsalSCY=;
        b=dOJAwUMYvmy9TmQEhCm/ocjjBkQ5eOi6AAZbYXwq5+3TTKMYtlo7d1Ip/y9JTwBUlB
         etIxBef40ZevRB380+Z462fSpcIdZzd5TYPc9aSzZr2evd3jimY6W014r4JCkvtdp4We
         aLePxm1ILNWE1VHMtzFLscBki0wU8nZ9w+hkZF62N0uEJaym3wOcJCjo6+iVQM4X6ldo
         XVfzxA5xFFYIkVms9y5DDhk157xRCyUjau50zrjHyscEY91MFva9RU0vBUZ7Cz9nfQdV
         Apu/r03chVUssZ3209cVx0I/dQmeLVb5I2ggQLuSIjvzjYj4Kq/5pCOV17xKcvntWGJg
         MeOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m77-v6si1195669qkh.35.2018.10.18.13.49.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:49:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDFEn-0005Hv-6x
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:49:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40720)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbn-0003Th-Ad
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbl-00040Q-Af
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 16:09:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48780)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEbh-0003g4-GN; Thu, 18 Oct 2018 16:09:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7D9D230F8BE5;
	Thu, 18 Oct 2018 20:09:12 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CA86105704F;
	Thu, 18 Oct 2018 20:09:05 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:13 -0300
Message-Id: <20181018200422.4358-37-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 18 Oct 2018 20:09:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 36/45] net: lan9118: convert SysBus init method to
 a realize method
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
X-TUID: L+GWeIhXtmkW

From: C=C3=A9dric Le Goater <clg@kaod.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20181001063803.22330-4-clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/lan9118.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index b9032dac59..a6269d9463 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -1320,9 +1320,9 @@ static NetClientInfo net_lan9118_info =3D {
     .link_status_changed =3D lan9118_set_link,
 };
=20
-static int lan9118_init1(SysBusDevice *sbd)
+static void lan9118_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev =3D DEVICE(sbd);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     lan9118_state *s =3D LAN9118(dev);
     QEMUBH *bh;
     int i;
@@ -1349,8 +1349,6 @@ static int lan9118_init1(SysBusDevice *sbd)
     s->timer =3D ptimer_init(bh, PTIMER_POLICY_DEFAULT);
     ptimer_set_freq(s->timer, 10000);
     ptimer_set_limit(s->timer, 0xffff, 1);
-
-    return 0;
 }
=20
 static Property lan9118_properties[] =3D {
@@ -1362,12 +1360,11 @@ static Property lan9118_properties[] =3D {
 static void lan9118_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
=20
-    k->init =3D lan9118_init1;
     dc->reset =3D lan9118_reset;
     dc->props =3D lan9118_properties;
     dc->vmsd =3D &vmstate_lan9118;
+    dc->realize =3D lan9118_realize;
 }
=20
 static const TypeInfo lan9118_info =3D {
--=20
2.18.0.rc1.1.g3f1ff2140

