Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3466657wrt;
        Sun, 30 Sep 2018 23:39:58 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61nXZL1KDEAJU+76weh0eLrXkbo79pYphm8Glbi9U71MWLBuqCjqHTd70xER6yNdqvwz2nz
X-Received: by 2002:a37:4dc5:: with SMTP id a188-v6mr6958613qkb.326.1538375998238;
        Sun, 30 Sep 2018 23:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538375998; cv=none;
        d=google.com; s=arc-20160816;
        b=RN4NSY5bbYl6suAmCU+lWsB8KmumHwjVjXZXDsWhnnp+nwHFrlSUhGuhdGR/d86+vU
         gkr4xFhWMN+XklEQhmVt1Zns1W8YXRSnzp5DMLOxuHpBgjGqb7bw7UH7Yx6Qzdk89K1A
         UE8FUmI+a6NRj3k9Vx8AHMjASGXoEPqdNKuPZsuFtSz7vzYIESrOyrADuOjOkabR/Ikc
         BCOV21kj9uPRF1GIPsfXDIOMvswbc9s5lPrKTa3oNltxOqT4BANLD5oGhLbNG7PCk31s
         YzhumzYlkzRInDNFAAiBUYCr/YL4EC0RkAV7nVtgnrT3ai7HBa0YDjFISbTFIdkbySgL
         oGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=fBmmdENnKt3HGPvAuvUmWlwbuWpI5F8Osquh1BMNEt4=;
        b=xksH3wO6rm/k0EzM5hvMDSv3GC/GFp2cbpESBDAuswN2HNXl5Q7Fa3Emaao2w/pWzD
         J65LGcn5YJ/8RapnByA6vttYBWfqtARVFXoFUteCYUas8XOKw/D9Eh8T2ACyVzC3a5vJ
         gVcrAATVeiKPDxXCJIJztZRhcbin49eCrLAjmtJEvdi3eMWAm4JCKb9BpvvcJociTGNa
         Vb3cs7WdMRvL6VL15Wx24cC1EP0yYloyo/ccnrRHDRWUTzrxBq36R8q5Y8wha9Wv2d3x
         fHYzllPUmyUgr6cHDh5a8UWIrCVKGJU6xp71Oq2E3t5KMuZqfRhKfsIpW5gIq2Tkb66R
         T/SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f96-v6si932993qtb.199.2018.09.30.23.39.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 30 Sep 2018 23:39:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g6rs5-0001Sx-Mv
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 02:39:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g6rrS-0001Qb-DO
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 02:39:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g6rrO-0006Yb-40
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 02:39:18 -0400
Received: from 2.mo6.mail-out.ovh.net ([46.105.76.65]:51269)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g6rrN-0006XT-SG
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 02:39:13 -0400
Received: from player699.ha.ovh.net (unknown [10.109.160.62])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id B7EE61843CB
	for <qemu-devel@nongnu.org>; Mon,  1 Oct 2018 08:39:12 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player699.ha.ovh.net (Postfix) with ESMTPSA id 6AB2B240097;
	Mon,  1 Oct 2018 08:39:06 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon,  1 Oct 2018 08:38:02 +0200
Message-Id: <20181001063803.22330-11-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181001063803.22330-1-clg@kaod.org>
References: <20181001063803.22330-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 13911619252160859135
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedruddugedgjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.76.65
Subject: [Qemu-devel] [PATCH v2 10/11] net: stellaris_enet: add a reset
 method
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
X-TUID: foXecavEv/Gw

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
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

