Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2836863wrt;
        Thu, 18 Oct 2018 13:37:07 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62AidBuWw3jmq7WZmsYYvMWxcjIFNZLvGA3Di2UZ5rm1UsFqLkkfxZlwNMwou6Z87gYNF1N
X-Received: by 2002:ac8:2b2d:: with SMTP id 42-v6mr30457433qtu.119.1539895027071;
        Thu, 18 Oct 2018 13:37:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539895027; cv=none;
        d=google.com; s=arc-20160816;
        b=mrNAVa45QN0qsgFDgvHuooUx72KSodtNj/6RNWAp8jHsClEUgNZiz4PLVCqYfSqSOi
         POtZvCRkRL+6radFgDN/EMfZM663O8boXfgBhXQOpvwcb0Q7giVgfX5cZ+ijV1ybNdia
         DgKhUEPk3gPGJerQQJCMPtSncSn5gn3tw8I0YDJs/ZvYMTNCRO/35/vrc0fUvEp0b+nH
         6X2LVpPUDE3VPVnxlwpr+QC3WKpLcnwldT3NJEPLmYsMEXqaiGKSray+jGdBzY+YkQGw
         OJDy4CbFevv3KfZbDtrLobnrmRkU3uiXT6T2Dl6j3JGylWtRNdffV+E0pAo6B334z4WI
         D6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=IKg33+gJHKuUrdnuLoThQ6+QYnF7xYOVFdAvRr/96Mk=;
        b=XQux358czhpdWX1/XTXze9YWg4cnP4itSmD0BIARr46t7/lR7RREz/37ZOytPlHots
         zaRlFIwFYPtxhlEi8QYSuFO0dTYxhc6J8ArWdm0/Egaci+Vw3cmIdnxypcAcojd8kE0Z
         SnxPADquKmH8DIMtNqG71tW5XeJldNWcZpXW8tx0Tf/zd58VsV/GkGXXFOQbcc2yNRII
         y49DPHpMwJ5bzaMEAcdgfZuLvcfI/roVLMqHStzqo/Fh8fyMTaNK2tOkk7IJYFKwWJou
         tnh/XyIBHHTBLkLtNEiJ57hP9kCYcb+4E+Ht6IX7HcLLOqrcxciaMCyugyZP+Tk3CtHE
         Lgqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c34si2208021qvc.76.2018.10.18.13.37.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 13:37:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44499 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDF2Y-0002A7-FI
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 16:37:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEcK-00040u-PS
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:10:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gDEcK-0004U5-38
	for qemu-devel@nongnu.org; Thu, 18 Oct 2018 16:10:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44196)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gDEcD-0004T4-Hq; Thu, 18 Oct 2018 16:09:53 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A366030C9EED;
	Thu, 18 Oct 2018 20:09:52 +0000 (UTC)
Received: from localhost (ovpn-117-52.phx2.redhat.com [10.3.117.52])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D46F100034B;
	Thu, 18 Oct 2018 20:09:45 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 17:04:20 -0300
Message-Id: <20181018200422.4358-44-ehabkost@redhat.com>
In-Reply-To: <20181018200422.4358-1-ehabkost@redhat.com>
References: <20181018200422.4358-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 18 Oct 2018 20:09:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 43/45] net: stellaris_enet: add a reset method
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
X-TUID: +BYEFiYzsj06

From: C=C3=A9dric Le Goater <clg@kaod.org>

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20181001063803.22330-11-clg@kaod.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/net/stellaris_enet.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 3ee1e0f8a4..b3375ebb45 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -457,8 +457,10 @@ static const MemoryRegionOps stellaris_enet_ops =3D =
{
     .endianness =3D DEVICE_NATIVE_ENDIAN,
 };
=20
-static void stellaris_enet_reset(stellaris_enet_state *s)
+static void stellaris_enet_reset(DeviceState *dev)
 {
+    stellaris_enet_state *s =3D  STELLARIS_ENET(dev);
+
     s->mdv =3D 0x80;
     s->rctl =3D SE_RCTL_BADCRC;
     s->im =3D SE_INT_PHY | SE_INT_MD | SE_INT_RXER | SE_INT_FOV | SE_INT=
_TXEMP
@@ -487,8 +489,6 @@ static void stellaris_enet_realize(DeviceState *dev, =
Error **errp)
     s->nic =3D qemu_new_nic(&net_stellaris_enet_info, &s->conf,
                           object_get_typename(OBJECT(dev)), dev->id, s);
     qemu_format_nic_info_str(qemu_get_queue(s->nic), s->conf.macaddr.a);
-
-    stellaris_enet_reset(s);
 }
=20
 static Property stellaris_enet_properties[] =3D {
@@ -501,6 +501,7 @@ static void stellaris_enet_class_init(ObjectClass *kl=
ass, void *data)
     DeviceClass *dc =3D DEVICE_CLASS(klass);
=20
     dc->realize =3D stellaris_enet_realize;
+    dc->reset =3D stellaris_enet_reset;
     dc->props =3D stellaris_enet_properties;
     dc->vmsd =3D &vmstate_stellaris_enet;
 }
--=20
2.18.0.rc1.1.g3f1ff2140

