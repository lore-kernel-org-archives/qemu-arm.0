Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2846640wrt;
        Thu, 18 Oct 2018 13:46:44 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63zmlRn3GlBVQiypRfZuaPpvcBtD3dB7AQUlp1myhOwF9Hr74j/hcIVgwIlc2dyBPsPrcBF
X-Received: by 2002:ac8:2ec9:: with SMTP id i9-v6mr31642090qta.300.1539895604354;
        Thu, 18 Oct 2018 13:46:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539895604; cv=none;
        d=google.com; s=arc-20160816;
        b=IW9i8oyicNr/u2gFAdegvJ0mxaXaeBkjCTyIJWXb8qs2hIp52/zoClk5y8GxBCllhf
         uxSqs2ZD5I53Qs0fgdVPlcNw0K0f8BK8szsiR+jQFPJCyil/FkWGPXkubLASQOupMA/k
         UvgoUdooubH9br8E1kjCSQOxZqrDb9/rece7Gp63eSv2C+AofPhkd147n6kazmWfBGO5
         f1mkNT0dsEk3NkljMzVWNBLcW+NN9djYgPNNxDPwC9i/GzfPlCB44X3PsBwVIHf0ovlG
         bvamkTOHuAZvT9dcwj16JD2i+4gfl39Qg6Mon24PMR7pqFBjnAABMw0qG4rUmb3gWfg9
         2hdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=HWSOmfYoguinbHf/yectCW1oD2ID1SmR3U40yH2lkmI=;
        b=hQ18uYFb0ewcO6iGPo+fTrqZ0j8P5ZJkS4+T8wtR27ma3xGwKfRUD+8B7KPBA2YZR9
         0Ib2h6yRGXmrGmSWnO1JxjpEfrPGDQmDR2oD/7ddmbJXiLbW3cT5b4UC584qO02QmBWU
         Y8ODbR3fHco3KO3/vBgLjqHWoOJwm7IiE/UnMULukrJi3S6n0r0MNLFdTbkXmtSyLd7i
         ApGicmgWpmGaOukcDWKXmakIMwz36NwimMGClbEvXQqgg5y87wVD5MrFE20kb6zYIVRC
         /67sd941g5G/1MrJzLyefIe2bWun1IzOrw3UwUZtbhFixKwGZAcEULXPERF/iDNpH6be
         uMrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j26-v6si2242172qkk.250.2018.10.18.13.46.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:46:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44571 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDFBr-000211-Fr
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:46:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEc9-0003rD-CT
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:09:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEc8-0004RQ-IJ
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:09:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46816)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEc2-0004P4-Ig; Thu, 18 Oct 2018 16:09:44 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C95D307D858;
	Thu, 18 Oct 2018 20:09:41 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09B8A19940;
	Thu, 18 Oct 2018 20:09:40 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:18 -0300
Message-Id: <20181018200422.4358-42-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 18 Oct 2018 20:09:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 41/45] net: smc91c111: convert SysBus init
 method to a realize method
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e9zlIGDV6PxQ

From: C=C3=A9dric Le Goater <clg@kaod.org>

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20181001063803.22330-9-clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/smc91c111.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index d2fd2040e8..99da2d9297 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -766,9 +766,9 @@ static NetClientInfo net_smc91c111_info =3D {
     .receive =3D smc91c111_receive,
 };
=20
-static int smc91c111_init1(SysBusDevice *sbd)
+static void smc91c111_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev =3D DEVICE(sbd);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     smc91c111_state *s =3D SMC91C111(dev);
=20
     memory_region_init_io(&s->mmio, OBJECT(s), &smc91c111_mem_ops, s,
@@ -780,7 +780,6 @@ static int smc91c111_init1(SysBusDevice *sbd)
                           object_get_typename(OBJECT(dev)), dev->id, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
     /* ??? Save/restore.  */
-    return 0;
 }
=20
 static Property smc91c111_properties[] =3D {
@@ -791,9 +790,8 @@ static Property smc91c111_properties[] =3D {
 static void smc91c111_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
=20
-    k->init =3D smc91c111_init1;
+    dc->realize =3D smc91c111_realize;
     dc->reset =3D smc91c111_reset;
     dc->vmsd =3D &vmstate_smc91c111;
     dc->props =3D smc91c111_properties;
--=20
2.18.0.rc1.1.g3f1ff2140

