Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp585739wrp;
        Wed, 18 Sep 2019 22:55:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5j0eFUwY+tBOQviyShKzSyBNvxAlw+CEf7aY0VJZcV9CbF4IjPdJaV7cK3g9KI8UY8k2v
X-Received: by 2002:a05:6402:17ad:: with SMTP id j13mr14312918edy.212.1568872553737;
        Wed, 18 Sep 2019 22:55:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568872553; cv=none;
        d=google.com; s=arc-20160816;
        b=f8aaD6ogYECpxwzLdfFfenGkUhahxVeu8w9w/5cRPf8mjDuytUVCx65G474M5Y70x6
         qdDEJ4Z3xBmTvQk97RaDobsqUguQQxERe58nY7s9YfZ18uXKVzNtYafcDzxr2Z5AjVmm
         pB/iID6/ftl02oUHk0SJQ+3cvBpltRewZA0YXLxySoMgwLSiVJ+Lr/MTm3S3BNiNWNYV
         EVE9266FPJXh+nYQTCXrr3/q7K6Z1aKJo0tsRFLexk5NMiKs6lssLnYvH5od+8XYTcDP
         IfHeZEQ22B6te6JKQ/hZq+nlz4nE/OeLCYtMkwuXUcq5U/jDZCmBptW1h0n3jRKPsgzi
         Fe1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=QJVogNdGaVI6orM8OgngQ+k30iIjOhxJ2IZf0S8QwcQ=;
        b=vzCNMlc5uyWiaw65a9uj1cYh1KQ5/43TOd3RnFJTccq/1JPVHn6+yNidOgeO89fUUw
         CZlsmRPLLPh4TwA1Br/F9MshcX8KbNYP//7ljj1KDLuSC2mUOmOUUv+x1z5JGRQsjyZG
         Qgk31zJCGT0xWbWyHmSgwngepl+fPGE/x29Cy+eB++lTqjmbKNjmCOG2dpkooYiKrSjc
         gsi+lSxb5HlLeTJV4qEgNE415L/WBaf0PrYRzyUzGIAIM/ZmGJmlWUVwM2plRibz2T0E
         lrp+uP4sAtoGqS1Or1NEomSHQDWdIQfs8mMe0HeRbjxQSr71f/RVbLLUwhMXee3EA4WG
         lY3A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g32si4869396eda.330.2019.09.18.22.55.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 22:55:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iApQ0-00067d-Da
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 01:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43061)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iApMv-0002uz-Q7
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:52:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iApMu-0000fP-IC
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:52:41 -0400
Received: from 7.mo178.mail-out.ovh.net ([46.105.58.91]:46956)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iApMt-0000YW-Gv
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 01:52:40 -0400
Received: from player788.ha.ovh.net (unknown [10.108.57.53])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 5C0B379803
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 07:52:33 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id CC0F59F176B8;
 Thu, 19 Sep 2019 05:52:26 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 07:50:02 +0200
Message-Id: <20190919055002.6729-22-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190919055002.6729-1-clg@kaod.org>
References: <20190919055002.6729-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1702642138188450577
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.58.91
Subject: [Qemu-devel] [PATCH 21/21] aspeed/soc: Add ASPEED Video stub
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
X-TUID: +snrfc2uXfZZ

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 include/hw/arm/aspeed_soc.h | 1 +
 hw/arm/aspeed_ast2600.c     | 5 +++++
 hw/arm/aspeed_soc.c         | 6 ++++++
 3 files changed, 12 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 43478f617879..cccb684a19bb 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -96,6 +96,7 @@ enum {
     ASPEED_SDMC,
     ASPEED_SCU,
     ASPEED_ADC,
+    ASPEED_VIDEO,
     ASPEED_SRAM,
     ASPEED_SDHCI,
     ASPEED_GPIO,
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index 26ad9c3394e2..454d2b4a3d59 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -44,6 +44,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] =3D {
     [ASPEED_SCU]       =3D 0x1E6E2000,
     [ASPEED_XDMA]      =3D 0x1E6E7000,
     [ASPEED_ADC]       =3D 0x1E6E9000,
+    [ASPEED_VIDEO]     =3D 0x1E700000,
     [ASPEED_SDHCI]     =3D 0x1E740000,
     [ASPEED_GPIO]      =3D 0x1E780000,
     [ASPEED_GPIO_1_8V] =3D 0x1E780800,
@@ -235,6 +236,10 @@ static void aspeed_soc_ast2600_realize(DeviceState *=
dev, Error **errp)
     create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_IOMEM=
],
                                 ASPEED_SOC_IOMEM_SIZE);
=20
+    /* Video engine stub */
+    create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_VIDEO]=
,
+                                0x1000);
+
     if (s->num_cpus > sc->num_cpus) {
         warn_report("%s: invalid number of CPUs %d, using default %d",
                     sc->name, s->num_cpus, sc->num_cpus);
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 6defb143acde..f4fe243458fd 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -34,6 +34,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] =3D {
     [ASPEED_SDMC]   =3D 0x1E6E0000,
     [ASPEED_SCU]    =3D 0x1E6E2000,
     [ASPEED_XDMA]   =3D 0x1E6E7000,
+    [ASPEED_VIDEO]  =3D 0x1E700000,
     [ASPEED_ADC]    =3D 0x1E6E9000,
     [ASPEED_SRAM]   =3D 0x1E720000,
     [ASPEED_SDHCI]  =3D 0x1E740000,
@@ -63,6 +64,7 @@ static const hwaddr aspeed_soc_ast2500_memmap[] =3D {
     [ASPEED_SCU]    =3D 0x1E6E2000,
     [ASPEED_XDMA]   =3D 0x1E6E7000,
     [ASPEED_ADC]    =3D 0x1E6E9000,
+    [ASPEED_VIDEO]  =3D 0x1E700000,
     [ASPEED_SRAM]   =3D 0x1E720000,
     [ASPEED_SDHCI]  =3D 0x1E740000,
     [ASPEED_GPIO]   =3D 0x1E780000,
@@ -231,6 +233,10 @@ static void aspeed_soc_realize(DeviceState *dev, Err=
or **errp)
     create_unimplemented_device("aspeed_soc.io", sc->memmap[ASPEED_IOMEM=
],
                                 ASPEED_SOC_IOMEM_SIZE);
=20
+    /* Video engine stub */
+    create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_VIDEO]=
,
+                                0x1000);
+
     if (s->num_cpus > sc->num_cpus) {
         warn_report("%s: invalid number of CPUs %d, using default %d",
                     sc->name, s->num_cpus, sc->num_cpus);
--=20
2.21.0

