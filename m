Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3471585wrt;
        Sun, 30 Sep 2018 23:46:53 -0700 (PDT)
X-Google-Smtp-Source: ACcGV638keAEPioc4HodtqYJb+7W03J4JQoOqm2NxI4kk3wxmfT6LKbFFS5++vxOG52DEO2Bla07
X-Received: by 2002:ac8:19ea:: with SMTP id s39-v6mr7538718qtk.215.1538376413280;
        Sun, 30 Sep 2018 23:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538376413; cv=none;
        d=google.com; s=arc-20160816;
        b=VhINJOQyjtJaPsBD1Bm6mmcsW2DG1Yq38DLB6g3I30+uoo6ahZQr1aoHya8ILJZJhs
         JMUNFQ+d57WrCaROhcCFY08+Ek3PcLTn4IcmO2m4sc7w/ao0uA3FBJkW10vqAFK4EnGR
         7S+pa81eBJw/Rj7qOqxc5CICSmMnmhtJSedYK0pPDlOkO9DORJjkgtckjvLLly1WSrzF
         v8ZbbxeDSZIdDYQ6S21fHEk6cZxtKIVM1aKLB87o7Z0oGC/DxeCGFTHiKizQsXE2484W
         qybF0Q9CKqOedIdcxMoEYn38M1rSR07IB4PHD/egxRVq0m9HezjwFY9fpUoPP1dTgoeR
         j7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=1JRUkXbpDHpphV2z92N5UktN0kcefky64TR7PIFrrew=;
        b=EykfXhsVY9PP5KX4mJXHUMiyGxdVRHunvE3leCp77B40g+O7hNZpBIf7kLviLTZEd3
         w9gGqjjV7lIOQWvDOGtZL/rHwNsPgd+gAECiJpYpIZkNtw2tl07YvACRa5gb8l3Ujgdj
         X7y13p+o42GadSr+CxM07uzzQ4/RDqlOJbmDQVR3wOKYPIGcXGxomv6UI/HNouT8Nv5Y
         vessM5WsCt5FRp7T89XchntFQopPjD8/MO68n/V0XMPr/pXXbYPRtavSgKRIJU0arwwG
         lSfjZPSN+IbL+Q04it+Nwcq9fjlCcEz6F15IZ4zpwVQD6tJGZslR3ZpqY2UsDBseJxt4
         II8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n70-v6si8618331qkn.316.2018.09.30.23.46.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 30 Sep 2018 23:46:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59711 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6rym-0007a8-OO
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 02:46:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g6rrM-0001LU-KU
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 02:39:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g6rrH-0006Rn-OG
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 02:39:12 -0400
Received: from 18.mo1.mail-out.ovh.net ([46.105.35.72]:41663)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g6rrH-0006QE-GZ
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 02:39:07 -0400
Received: from player699.ha.ovh.net (unknown [10.109.160.239])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 685C2138DD8
	for <qemu-devel@nongnu.org>; Mon,  1 Oct 2018 08:39:06 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 1DDD7240092;
	Mon,  1 Oct 2018 08:39:00 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 08:38:01 +0200
Message-Id: <20181001063803.22330-10-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181001063803.22330-1-clg@kaod.org>
References: <20181001063803.22330-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13909930401194413055
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedruddugedgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.35.72
Subject: [Qemu-devel] [PATCH v2 09/11] net: stellaris_enet: convert SysBus
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hg0Bp09H19c1

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
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

