Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp740322wrt;
        Fri, 28 Sep 2018 06:51:56 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62+5GXQ6sWPO65VzsnKKX1l1rKVT6IFnS7/FIw4vkuoWy8YciyEgvLWECcr65/TKyX1lq2n
X-Received: by 2002:a37:5f03:: with SMTP id t3-v6mr11588953qkb.193.1538142716416;
        Fri, 28 Sep 2018 06:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538142716; cv=none;
        d=google.com; s=arc-20160816;
        b=RW6Dd/cV2YclmSU6QdM6vCqd3OSI27jJOFF9CUagtYcE48B1H50JWEMCNovj6EPxbQ
         cHnX51izklRc/lb9Man9xVKvbWIu6dYsYqBkvNYP83wCV7PUa6QbbEc8X+KR35XKfgaw
         H/LDN+1RneshUydbYXj+cl0ks0CaRVxDqEHJ2yvuARDhPXOf6tVPhuPOE9OljVWfwJxN
         QrxGHVoWieWlY57UD6lj2VgHFcK0DLCzZrVDlfO3vRi+SgndMmy6YzJY5CkVLsCXNIVe
         ookJr79+yEmfzf9uzxNi/6YTXXjLV3ctfVhFkDtvKDSs5tukM0cMFSaNoNv+uxxYuQXx
         AchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UHSR1qx37yRdDFIoAOpRBBTo0AS9YvqafOnAbw83mnY=;
        b=LIqSmqiuOaFAomdv8TIhpTjX8097Xw2AQLg49xh+RqPLtNkHlXDpDqN4pbl7XSNT8V
         zwkoZknyti0s1exQ0t5lTjNLbYUni5MnRp2CYhYRBiZmqd9dQZ5RzpZntNtrqcjYdmD2
         NRA1aAsILus9JW2o2sYHssaxhG9xNxnLVKyX4CpjajFXVOAmq0//RKpH5U9awj4LBsSQ
         hpPLrz45h8LXyBnZLEJ2p4hy8Ll44n6OaawhbQt631ghPhOqiNmtZ0oMEfr7/lQK+M8j
         3jXrgXeTbA8JdIA8sLY1GYXuV8dwxF6WsDTGZyJbpeHDMkKEF4dtl7Om3+AvPU8kQbeL
         y42A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g1-v6si304743qkd.118.2018.09.28.06.51.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Sep 2018 06:51:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43502 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5tBT-000550-E3
	for alex.bennee@linaro.org; Fri, 28 Sep 2018 09:51:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g5tAq-00051X-AC
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 09:51:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g5tAj-0007Dp-5p
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 09:51:14 -0400
Received: from 1.mo68.mail-out.ovh.net ([46.105.41.146]:42447)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g5tAi-0007DJ-U8
	for qemu-devel@nongnu.org; Fri, 28 Sep 2018 09:51:09 -0400
Received: from player691.ha.ovh.net (unknown [10.109.160.253])
	by mo68.mail-out.ovh.net (Postfix) with ESMTP id CDCF1FDCE2
	for <qemu-devel@nongnu.org>; Fri, 28 Sep 2018 15:51:07 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player691.ha.ovh.net (Postfix) with ESMTPSA id 803B626009C;
	Fri, 28 Sep 2018 15:51:01 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 28 Sep 2018 15:50:03 +0200
Message-Id: <20180928135003.8650-12-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180928135003.8650-1-clg@kaod.org>
References: <20180928135003.8650-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 3587961528183655423
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedruddtledgjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.41.146
Subject: [Qemu-devel] [PATCH 11/11] net: xgmac: convert SysBus init method
 to a realize method
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
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Rob Herring <robh@kernel.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yZwmGhaYg1f6

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/net/xgmac.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
index fa001563d3de..63f5a62ebf1b 100644
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
2.17.1

