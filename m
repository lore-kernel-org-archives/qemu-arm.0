Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3469230wrt;
        Sun, 30 Sep 2018 23:43:30 -0700 (PDT)
X-Google-Smtp-Source: ACcGV6327a9NQUn10T1jakQf9pDRBGnN1nLOiQBCzYUVYqP1JOXB4pWb9nUFEg0srDo0/y7nZ0x9
X-Received: by 2002:a37:ef08:: with SMTP id j8-v6mr7253908qkk.26.1538376210180;
        Sun, 30 Sep 2018 23:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538376210; cv=none;
        d=google.com; s=arc-20160816;
        b=i83iV792VpA9IASbaiiAlG+zSePMA4W8ruulKOmr9M+0DVwTr6ztDHD8hgovK1DaKP
         2tG5DCBhbypvv9ramdgrjqO6jrMVdDF/h2APXP2CvkrlYN70hhW/Zf2XUj0rp3N7fOUn
         LMNI6BqUqXsq/V0VQLEPth1DB9Qh/i1/EwTKLEx+qmSjPAuhAetY5KXH9TpQzMMC7tkC
         vMASKpVmjFpvmd0aRn19OVrU9Mj2cWCPekwtI7MhnooEL2gfVfGuf7EzGC5uHisjojDR
         IHx7s2LOCyrlOBE8lx7/zMm2kjZZx2bXxdOTIap8osoT+KzgZtCjIbWt7sUBJPUxSa+j
         Ws6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=1kdTAVQBH8SPRgogkFP826wmbKQjffzJPvBkLc1EC5I=;
        b=pPsnmOpCZXVhj4vAx4V+y2W+aIgGrUO2YVMM3yYADMjgSGFwyim1K78pq/aAlBG56x
         CEXwL739OFi+aHWyeDzeWfnBso3sWnouvVU0RG+7LKJaUmPkXi8la+s+Xu+AOhZp+ceP
         Ji+Oe4xfdINAN6vKc6NnYCgek7M7YszoYKypIXhIZlm57rAASoXRqsWV5+GvRyzQ6IJQ
         uhAIDPWXdJSiwMxn+sfcbePCeoxtzJVi+7Ms5/ebAnminyejp9lugVoeK+7Z0IdBgNAh
         a78veRHYSfqBJrIbXIXJTgUrPUC9nQxJWd3HDPpCYlssASH5cu82WdtJDI3dOYLY6GI9
         hwEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q21-v6si3562714qta.261.2018.09.30.23.43.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 30 Sep 2018 23:43:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6rvV-0004U6-Lb
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 02:43:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g6rrg-0001b8-BO
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 02:39:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g6rra-0006nw-Gf
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 02:39:32 -0400
Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75]:57869)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g6rrX-0006gF-DR
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 02:39:24 -0400
Received: from player699.ha.ovh.net (unknown [10.109.146.19])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 1645016323C
	for <qemu-devel@nongnu.org>; Mon,  1 Oct 2018 08:39:19 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id AA077240097;
	Mon,  1 Oct 2018 08:39:12 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 08:38:03 +0200
Message-Id: <20181001063803.22330-12-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181001063803.22330-1-clg@kaod.org>
References: <20181001063803.22330-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13913589577721482239
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedruddugedgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.172.75
Subject: [Qemu-devel] [PATCH v2 11/11] net: xgmac: convert SysBus init
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
Cc: Rob Herring <robh@kernel.org>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zvv/YIHC+VGI

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
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

