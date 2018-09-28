Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp749554wrt;
        Fri, 28 Sep 2018 07:00:57 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60OpAvC06pdcmXpL6jiapl077V/p0OMqrnYi4mSNMzHF/GZk5tgza9cw9L8wD8gYZiQLXi7
X-Received: by 2002:a37:7704:: with SMTP id s4-v6mr11552579qkc.358.1538143257853;
        Fri, 28 Sep 2018 07:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538143257; cv=none;
        d=google.com; s=arc-20160816;
        b=Aktf6kE1RR7qUUJzPj/EFjQvdYv+iqeiNVKPM0Nu2u3ewJjOg6rnnU8/ekJKluFp8N
         KXhLUGxHMMljkPPrY99301/HzLlvQdOXmcR5nO9GxZw0LJwt3fHCMvBiKoMAHTvfrS5g
         grskcXVhtbvTWIHxrccF7THnPb6IWMOOs6DFVMXAhl1JJ380u8Ky67ScKmFTS4F8VlOY
         IalrXaOZUQ3SKRQRSRcAaut7aUpO2QCYLngO38XqFdGHeXtNLcWhCtFABgI8+Yj7EK0T
         dthhT8MOf1dBOZXShZTnR2AA1FZtR1fycNTwD/djYbGlyYZ6EvWzindQjYojnUSwuUlB
         BJLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Pe0ylE1X5sGP1amphSixwSTuuK8eT23/ENJoqdy8C8Y=;
        b=lgYNC5Z1v722fFJsLA8D2iJGnGf5IMf5krhQshA28tWhOM1e2BijsLpR/efwFbUW+t
         Q7dqe9Gof1J5a2V/1qsOMmXRuNhpFekI+dmvtWXxrRSvqaOG3x2+3lcg6SxEl1w4ctJ8
         cWJAwU2MhwWpDaHN9VAasMjaZ1Lr1jwZRAxMxUvK6wAjev3NlfuVx8T3Y8yE7l+ZwlKM
         D7wAUMpbMWFvCk5DPlBQtInaPYwXn8GWTtkowBaMXw8RCazCR8E23YHBLcFv9sY1t4Bd
         58aQTaC5tIPBntI+zecWomptWytospD440YSYodK5ah5lWYgPtKDqropmQ1GRujLJXPK
         z+6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g21-v6si3777371qte.104.2018.09.28.07.00.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Sep 2018 07:00:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43566 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5tKD-0004yf-Cm
	for alex.bennee@linaro.org; Fri, 28 Sep 2018 10:00:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g5tAh-0004tQ-EP
	for qemu-arm@nongnu.org; Fri, 28 Sep 2018 09:51:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g5tAd-0007BS-At
	for qemu-arm@nongnu.org; Fri, 28 Sep 2018 09:51:07 -0400
Received: from 5.mo5.mail-out.ovh.net ([87.98.173.103]:57172)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g5tAd-00079s-4K
	for qemu-arm@nongnu.org; Fri, 28 Sep 2018 09:51:03 -0400
Received: from player691.ha.ovh.net (unknown [10.109.143.220])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id D831B1F57AE
	for <qemu-arm@nongnu.org>; Fri, 28 Sep 2018 15:51:01 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player691.ha.ovh.net (Postfix) with ESMTPSA id 4795C2600B0;
	Fri, 28 Sep 2018 15:50:56 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 28 Sep 2018 15:50:02 +0200
Message-Id: <20180928135003.8650-11-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180928135003.8650-1-clg@kaod.org>
References: <20180928135003.8650-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 3586272682351823871
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedruddtledgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.173.103
Subject: [Qemu-arm] [PATCH 10/11] net: stellaris_enet: add a reset method
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
X-TUID: X2Q0BUINOnaX

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/net/stellaris_enet.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 3ee1e0f8a43f..b3375ebb459c 100644
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
2.17.1

