Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp23756wrp;
        Wed, 4 Sep 2019 14:37:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4HvK3wR9bZiRQWUApv0e/J6MP//chLq5DKp+nBk0F+/hnyv0VQ0fO0dOfRDFEr050G/lA
X-Received: by 2002:a37:9b0e:: with SMTP id d14mr7583691qke.315.1567633044339;
        Wed, 04 Sep 2019 14:37:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567633044; cv=none;
        d=google.com; s=arc-20160816;
        b=0W6B2Jssr4tCAdJoFG/qFJlX8SiNIjfMjl0Ao4vfUurzXEj7sX6V0m1yGzZ5gpD8qG
         /xoh+35o0BGVXBph5dAa8FLxEqAbyVL0go4E5azN60jyRgQmt+F4LW7HgQpmcX7pgO+F
         2pArbRnWJdTX8ZR//qKHVQI49XZ8Rlkr0i4OfwCKPFYSrjVPAzr2+HCYG1mR51c/bfO+
         sQ60AvDL2LRUHiLDlOIOAkes/2h+MYJZ1+/wBRfLxBGlaEk52GEVffU6PQrEQJqakcbp
         4FGAx3iSQJPg3qq3BKTZ9RfR+RGCzbjLi67VcHU2Ab9DY5aJAgcUzpPshlmuZW2ZRJS/
         1KjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=AQ2W/wn5zzSquA+AEb7r6H1Zqtx7Tq0Ndz2XW/gYuWc=;
        b=MUbgctwi8aF2pVfeLhKcAuJiEUoy5nBWVfWO/IVlINllCPnD6EMzgiRzpcv0Fo9n64
         TPNVXTCk7fZEmox4B/0BmUjrjMtQ4F/e+mIlzO72y2sE+uZ9EyQttq/FlyleyheFJffx
         VA+N0HuQAvcyqatsHKXW6ZiI+buZKiI6YAFMkHKucbPh7rqoqilgi0JGGzqYKtRWpaMj
         wtopZQdojvUyhIQeJ3+wcH6m9irHQ1sn/xfmHY5bO7omiZ9+qfhoWk45m7c3kuk5EipQ
         loiJFMOUhPFdPRQLaRhoGKCvTLC3krM73vHbB0Lqu4a21EYVPMQ1SdCWBvFuDTBJV5m8
         58Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n190si190907qke.108.2019.09.04.14.37.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 14:37:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5cxv-00034E-2y
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 17:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5cD4-0001MB-NH
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:48:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5cD3-0002AY-DZ
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:48:58 -0400
Received: from 1.mo173.mail-out.ovh.net ([178.33.111.180]:60614)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5cD3-00029t-7q
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:48:57 -0400
Received: from player691.ha.ovh.net (unknown [10.109.146.53])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 5E4B4117E70
 for <qemu-devel@nongnu.org>; Wed,  4 Sep 2019 22:48:56 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id CCAF698B2A19;
 Wed,  4 Sep 2019 20:48:49 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 22:46:59 +0200
Message-Id: <20190904204659.13878-16-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904204659.13878-1-clg@kaod.org>
References: <20190904204659.13878-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2537778391939910417
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejhedgudehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.111.180
Subject: [Qemu-devel] [RFC PATCH 15/15] aspeed/soc: Add ASPEED Video stub
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H1KWrmLyXn9t

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_soc.c         | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 9e06a6ad4fbd..ef5b93e5e9cf 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -99,6 +99,7 @@ enum {
     ASPEED_SDMC,
     ASPEED_SCU,
     ASPEED_ADC,
+    ASPEED_VIDEO,
     ASPEED_SRAM,
     ASPEED_SDHCI,
     ASPEED_GPIO,
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index c3f99849b7f0..b9da49e16f2d 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -102,6 +102,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_SCU]       =3D 0x1E6E2000,
     [ASPEED_XDMA]      =3D 0x1E6E7000,
     [ASPEED_ADC]       =3D 0x1E6E9000,
+    [ASPEED_VIDEO]     =3D 0x1E700000,
     [ASPEED_SDHCI]     =3D 0x1E740000,
     [ASPEED_GPIO]      =3D 0x1E780000,
     [ASPEED_GPIO_1_8V] =3D 0x1E780800,
@@ -371,6 +372,10 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     create_unimplemented_device("aspeed_soc.io", sc->info->memmap[ASPEED=
_IOMEM],
                                 ASPEED_SOC_IOMEM_SIZE);
=20
+    /* Video engine stub */
+    create_unimplemented_device("aspeed.video", sc->info->memmap[ASPEED_=
VIDEO],
+                                0x1000);
+
     if (s->num_cpus > sc->info->num_cpus) {
         warn_report("%s: invalid number of CPUs %d, using default %d",
                     sc->info->name, s->num_cpus, sc->info->num_cpus);
--=20
2.21.0

