Received: by 2002:a17:90a:ad8a:0:0:0:0 with SMTP id s10csp4213355pjq;
        Tue, 18 Jun 2019 10:08:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwP7yJhxKB1B4j//QhN7ayPvgrRHmUEc9wGB7ypeWQFinMPshpyCeGwcZbk++GyQ/e5BEjl
X-Received: by 2002:a37:4b56:: with SMTP id y83mr52266813qka.338.1560877699844;
        Tue, 18 Jun 2019 10:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560877699; cv=none;
        d=google.com; s=arc-20160816;
        b=yBXg4GdLb8nFX2lkKnXjcAPiAujUZdpKCN0q33Ug9ldnczOKhXD6fFQb6TmQj9ucU8
         PM97c80VnLJe0l4TcwBdqeORT0HwsiX4xnUB4a70XE0d8eHbO+6gqt3mZtzBsgMsOraI
         WXQ63mMuj8S5H/Rpgv1Uj9+k33APjOeP6fd38+qqr7Q/Xg1jd4Zz9pcTB/UIbrvwAoFA
         XTVWm6pdGeiwm9cU5oD8OTFXdklPiOaBzr+obuPB3p35QZcAjcBw1pE1Ysl2NUE4PAif
         GUg52DYjlM+XiMReCgVP+bIMqhzN+BuZCEmpTMeC8gHXf8oMRadG+8EhXV+awODgOeKc
         tCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=RDzP0mOr56XuAEifag0/kp1qUPThsJ2FIkaeGc6BrVA=;
        b=OSuyQjZNI/08PsUgxi6YSD2WRtaOayvpcCAJDPqeiDC3sDeAAhOEIF1HZ2GB5NA3Sz
         xHkvildsefKSzK7to2p0BDR89l3o0DSFal/o7wrkMJZN2hKMmNoVSWSiUe4VwDzyeXrQ
         MOTeTofhnfpHxxOyf4HaOXcRgSBed2hJ0CSoTn1YuSzRS5WAb6DX3O2a2yJjuQHhpZY4
         9EHsUQ4rxj27Y9LhiTOX8iDpK+0WKMpb7LxYBGYMAdTyy/7Vy3Q++KV/QFEAqMQfeY3J
         5rqYRxPDejBnxWLl7RkwMIO4fcnPJbKZy6KZsbdZP1sfB7+9tjTBjUphG+6F5ZOyaFSW
         nCCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20si10659861qke.150.2019.06.18.10.08.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 10:08:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60244 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdHal-0004In-E0
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 13:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60850)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hdHNi-0000qW-QW
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hdHNh-00051c-Rt
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:50 -0400
Received: from 2.mo179.mail-out.ovh.net ([178.33.250.45]:53212)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hdHNh-0004yU-Dx
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 12:54:49 -0400
Received: from player157.ha.ovh.net (unknown [10.109.160.25])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 51F8A132ED4
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2019 18:54:47 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id CF2986EB53BB;
 Tue, 18 Jun 2019 16:54:40 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jun 2019 18:53:02 +0200
Message-Id: <20190618165311.27066-13-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
References: <20190618165311.27066-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1681812989851044625
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrtddtgdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.250.45
Subject: [Qemu-arm] [PATCH v2 12/21] aspeed: remove the "ram" link
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m2rejyM/DsYN

It has never been used as far as I can tell from the git history.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/arm/aspeed.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 96de4f5c2a87..5d73267da16f 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -195,8 +195,6 @@ static void aspeed_board_init(MachineState *machine,
     memory_region_allocate_system_memory(&bmc->ram, NULL, "ram", ram_siz=
e);
     memory_region_add_subregion(get_system_memory(),
                                 sc->info->memmap[ASPEED_SDRAM], &bmc->ra=
m);
-    object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc=
->ram),
-                                   &error_abort);
=20
     max_ram_size =3D object_property_get_uint(OBJECT(&bmc->soc), "max-ra=
m-size",
                                             &error_abort);
--=20
2.21.0

