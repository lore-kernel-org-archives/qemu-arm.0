Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2836665wrt;
        Thu, 18 Oct 2018 13:36:56 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63QThNxFym4g5CTjOXJg3u694+FLIRS1Q8Lm4JCOGR9Z3rLBQnLD7klgD9OPas2c//RJcLe
X-Received: by 2002:ad4:4086:: with SMTP id l6mr7432663qvp.169.1539895016379;
        Thu, 18 Oct 2018 13:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539895016; cv=none;
        d=google.com; s=arc-20160816;
        b=zuJpuNZucDhMaXUmB/xA6AgFzQymZJPVcexLHOKlkn8/mzk2zOQjo1X+IXe9u00aKs
         KyC083bz3sFIzV3ZYo0NGYmvQR7vswO5u+m7mm/o4Tle1b4wNuu6UXb8Gdvkswp73CC7
         6A+ue97k3YTqno8t8no6gmcNN2Kh6DyjnBgbnFVXysxgKa6iehtKcy/b8wbZqAQsIBOK
         hLDGinB42TFY9hSuZLIAZZNwuOvZFFV8JGDEYIuaEr34TwZbDgQs5HG0wFBhnSTjXVqm
         TAxvU02Lmxzfx65/G5DKXBasg1YYw/AfwXoEQECZLmXUXEyrEnP43+wWvqUagXRj5YX+
         xYWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=pzC9C6MAs9BjU76R/zsTj6dn5uSrsiAcpv4FKdUI3i0=;
        b=nlt0kTcCqvWm1ClG0U1pZwGCAfuBfqU1PRPSvyMOdNQ1TWC0hat0YSQHF08qjQrWcc
         pCU0wNSlPDkEkEiUPAFi48uBh0gVDvUSw31lePgZhWqKPpy+GfCjw+U1hdCfLp05yS3E
         xrhW9jwR1T0r+J5LjcEUubj/pZUbfdqNRsGVgn6fLMcxSFvO1dls2yTwSL0dwg8B7PAs
         nsb+nyzbjtkMl+YM3bFJgyAl1u2OUk9heeh00K3EM0fjBbVHDCQv5t2HbMC5rcmwGu7U
         X0JmGqU05glkA1tmLwBWVgsCgdhJuWM722S+wuWbsoqqdZX/oAFCeVt/T50sPeD1h+02
         UbNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o18-v6si5713048qtq.7.2018.10.18.13.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:36:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDF2N-00022D-MI
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:36:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEc0-0003hm-1u
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:09:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEbv-0004FY-Up
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:09:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44222)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEbn-000414-DV; Thu, 18 Oct 2018 16:09:29 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B3F83091751;
	Thu, 18 Oct 2018 20:09:25 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7F84611C7;
	Thu, 18 Oct 2018 20:09:20 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:15 -0300
Message-Id: <20181018200422.4358-39-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 18 Oct 2018 20:09:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 38/45] net: milkymist_minimac2: convert SysBus
 init method to a realize method
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
X-TUID: 9/63pgIb8f9Q

From: C=C3=A9dric Le Goater <clg@kaod.org>

Cc: Michael Walle <michael@walle.cc>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20181001063803.22330-6-clg@kaod.org>
Acked-by: Michael Walle <michael@walle.cc>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/milkymist-minimac2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 3eaa19dfde..7ef1daee41 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -452,9 +452,9 @@ static NetClientInfo net_milkymist_minimac2_info =3D =
{
     .receive =3D minimac2_rx,
 };
=20
-static int milkymist_minimac2_init(SysBusDevice *sbd)
+static void milkymist_minimac2_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev =3D DEVICE(sbd);
+    SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
     MilkymistMinimac2State *s =3D MILKYMIST_MINIMAC2(dev);
     size_t buffers_size =3D TARGET_PAGE_ALIGN(3 * MINIMAC2_BUFFER_SIZE);
=20
@@ -479,8 +479,6 @@ static int milkymist_minimac2_init(SysBusDevice *sbd)
     s->nic =3D qemu_new_nic(&net_milkymist_minimac2_info, &s->conf,
                           object_get_typename(OBJECT(dev)), dev->id, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
-
-    return 0;
 }
=20
 static const VMStateDescription vmstate_milkymist_minimac2_mdio =3D {
@@ -521,9 +519,8 @@ static Property milkymist_minimac2_properties[] =3D {
 static void milkymist_minimac2_class_init(ObjectClass *klass, void *data=
)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
-    SysBusDeviceClass *k =3D SYS_BUS_DEVICE_CLASS(klass);
=20
-    k->init =3D milkymist_minimac2_init;
+    dc->realize =3D milkymist_minimac2_realize;
     dc->reset =3D milkymist_minimac2_reset;
     dc->vmsd =3D &vmstate_milkymist_minimac2;
     dc->props =3D milkymist_minimac2_properties;
--=20
2.18.0.rc1.1.g3f1ff2140

