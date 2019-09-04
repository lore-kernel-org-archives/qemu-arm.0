Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp353506wrp;
        Wed, 4 Sep 2019 00:06:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyoHtK8rbAH9Bfy0mJe+0ZhQSdetwYIjVxmXJSP6D+IvHxA+xJys0gt3ypOw3gp5KvF7udG
X-Received: by 2002:ac8:6919:: with SMTP id e25mr36538610qtr.317.1567580764315;
        Wed, 04 Sep 2019 00:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567580764; cv=none;
        d=google.com; s=arc-20160816;
        b=07mm6g/63Iotyc4iN54bJs1J4pquONRcgbVT2PZ8k5Gl2Oq4cJx8HXtHUjRd3mfU0t
         D4jH0bY8lsbSlK3JDWIeia4WO8yOz8Glr2OAjmV2MFQwDeDZvzWdpHrmrKXGm3nEJ0j+
         37+/w5WQtBSXwOxGN/V2SUuRzq4f+hAYyrjzubV/rioGYOSM/WVghiLNTak3lDSlwYwl
         Z7s4lyFJrCwxydKvsq8kDyoqeHOeaVizdxzqMYKgzi+gIAIUumTyvozWaGfBG1wUGY80
         EdipFKn/JQGuAfDfQSjk1lyKTGhaDh6SwOp46CvONwBCY1oiD3kUCdZf3lgO/wcPWzUS
         zoZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=wTAmP9hQ4rJVdXcwWi5mwsGPom7V77wNp9mkeQMjIak=;
        b=MdOkTsErHSJA7XIR9zZGLrGLUGJdF0b2Yn+vLtk/0YAXxpO6GewcLOQ6U2bMmNpewb
         kIfFdjSIomxWsBxFB2xxdjd0wA0SM/qwi01ih+hf8kGEciQ+BLDeYmb0YdiHPg4PA8Jf
         LXOwWr68o4IE8Cxmtckj2lADf8ZARujSc1uO+/0JEpGyVqL3Y3mZMnlaSgM98pxFZERN
         xbC97Tg0wHCEsprOJ9dhgXVeyd8lImw3nMf1tOT4QMJXwtascOFEoyiyCxR2T5FjK31p
         JVwIVuUAkoaeJnJG5q48et5CMamvGmwC/Oz09cLUkD7CS4t2qndB9F0KHlp3UGh6Ud5i
         /rtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m56si14957700qtk.70.2019.09.04.00.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 00:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5PMg-0001VD-Qv
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 03:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47792)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1i5PMP-0001Rm-Mp
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:05:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1i5PMO-0006Ix-NL
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:05:45 -0400
Received: from 8.mo69.mail-out.ovh.net ([46.105.56.233]:50199)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1i5PMO-0006I2-Ht
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 03:05:44 -0400
Received: from player690.ha.ovh.net (unknown [10.108.35.197])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 1380A6845A
 for <qemu-arm@nongnu.org>; Wed,  4 Sep 2019 09:05:42 +0200 (CEST)
Received: from kaod.org (lfbn-1-2240-157.w90-76.abo.wanadoo.fr [90.76.60.157])
 (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 3FFCA94DC7FB;
 Wed,  4 Sep 2019 07:05:36 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Wed,  4 Sep 2019 09:04:59 +0200
Message-Id: <20190904070506.1052-4-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190904070506.1052-1-clg@kaod.org>
References: <20190904070506.1052-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7081347465658206993
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgedgudduvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.233
Subject: [Qemu-arm] [PATCH 03/10] aspeed: Remove unused SoC definitions
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
X-TUID: tupJeWoJPzjn

There are no QEMU Aspeed machines using the SoCs "ast2400-a0" or
"ast2400".

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed_soc.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 04480875d0d8..3aa73d2438ef 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -118,19 +118,6 @@ static const char *aspeed_soc_ast2500_typenames[] =3D=
 {
=20
 static const AspeedSoCInfo aspeed_socs[] =3D {
     {
-        .name         =3D "ast2400-a0",
-        .cpu_type     =3D ARM_CPU_TYPE_NAME("arm926"),
-        .silicon_rev  =3D AST2400_A0_SILICON_REV,
-        .sram_size    =3D 0x8000,
-        .spis_num     =3D 1,
-        .fmc_typename =3D "aspeed.smc.fmc",
-        .spi_typename =3D aspeed_soc_ast2400_typenames,
-        .gpio_typename =3D "aspeed.gpio-ast2400",
-        .wdts_num     =3D 2,
-        .irqmap       =3D aspeed_soc_ast2400_irqmap,
-        .memmap       =3D aspeed_soc_ast2400_memmap,
-        .num_cpus     =3D 1,
-    }, {
         .name         =3D "ast2400-a1",
         .cpu_type     =3D ARM_CPU_TYPE_NAME("arm926"),
         .silicon_rev  =3D AST2400_A1_SILICON_REV,
@@ -143,19 +130,6 @@ static const AspeedSoCInfo aspeed_socs[] =3D {
         .irqmap       =3D aspeed_soc_ast2400_irqmap,
         .memmap       =3D aspeed_soc_ast2400_memmap,
         .num_cpus     =3D 1,
-    }, {
-        .name         =3D "ast2400",
-        .cpu_type     =3D ARM_CPU_TYPE_NAME("arm926"),
-        .silicon_rev  =3D AST2400_A0_SILICON_REV,
-        .sram_size    =3D 0x8000,
-        .spis_num     =3D 1,
-        .fmc_typename =3D "aspeed.smc.fmc",
-        .spi_typename =3D aspeed_soc_ast2400_typenames,
-        .gpio_typename =3D "aspeed.gpio-ast2400",
-        .wdts_num     =3D 2,
-        .irqmap       =3D aspeed_soc_ast2400_irqmap,
-        .memmap       =3D aspeed_soc_ast2400_memmap,
-        .num_cpus     =3D 1,
     }, {
         .name         =3D "ast2500-a1",
         .cpu_type     =3D ARM_CPU_TYPE_NAME("arm1176"),
--=20
2.21.0

