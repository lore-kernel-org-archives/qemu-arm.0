Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3326827wrd;
        Fri, 21 Sep 2018 09:20:44 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYbeD6WH0h1tWSdwTIqPQUPtGHbydyMHi75k/RTPjkdZu+upUIM1hHW4JO1x8FOSD/xD1Up
X-Received: by 2002:aed:3f22:: with SMTP id p31-v6mr31696412qtf.185.1537546843979;
        Fri, 21 Sep 2018 09:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537546843; cv=none;
        d=google.com; s=arc-20160816;
        b=PXaoa5jPYJvGKYr9uDtjQ+red1/aP78JNIx8H/tVT17+UwPWBZtw4NQ/AvyHvRFLa/
         bLR1aeR7X/CFZ4MqnQaPLfyAySgphfUpGMu1fYU+1UctBXyCJSK3/Woob6aJYyuD2Bep
         vVpnUczU63qsehF8GMRFdYrZRL1agDnV27MQLpvgJxYDEhAyj4bGhF5LOxGaN5sAuelL
         AxgDGuzvROCjyR3MR53McNCReh/+BSue8X2ot3gFcAY0jFXLPFgMUbi5UmxiRDW3Aglt
         sqFMMoW5Y/wRaSDybJrUINbZX20iZ10yOQdCClY0Yh1f7k5pSUIUngoqvlNTicO+S1RQ
         f2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=DUuTjZ+y1RO0hrdwvn6+kKI7ACRumD3qAtXlL+aq32U=;
        b=QSEHuArI4e2f4c5UNalWkG3Mptnq/rmVP5gcS/Dlatlj1HETX4jdLq7ezDFHCxFNli
         aEyrOkJ17WXMHgV2nEcj2UQLB/8X6hMwchl94JvUQQWfvlLXATXrv38MMYcu/uSMldVX
         pPOIGnJW+Pwh0x6krf6iVSWDlIjUS2mebvZXd226J6e8JLGhOgq2XxxnHkS4Ix9qAtGR
         ltpMNyBEjdMGmGRJlUedmzL0yW5RK6LSh71u5ND7JNraZUcxyzlP//5iTHljdWqqySvE
         NoB+2gtzCwctAJzxkAl5gATtEzh6qvTUxq5QP3EiEGydj7pELDEUGGZWQV3tYtwUi1um
         Wzhw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u18-v6si2244628qvo.57.2018.09.21.09.20.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 09:20:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3OAd-00044y-Cm
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 12:20:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OAL-00043d-15
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:20:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OAH-0003sw-Mb
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:20:25 -0400
Received: from 13.mo7.mail-out.ovh.net ([87.98.150.175]:55574)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g3OAG-0003pB-21
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:20:20 -0400
Received: from player799.ha.ovh.net (unknown [10.109.159.152])
	by mo7.mail-out.ovh.net (Postfix) with ESMTP id 3F47BDDCA0
	for <qemu-arm@nongnu.org>; Fri, 21 Sep 2018 18:20:16 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id C9DA65200AE;
	Fri, 21 Sep 2018 18:20:06 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Sep 2018 18:19:30 +0200
Message-Id: <20180921161939.822-3-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180921161939.822-1-clg@kaod.org>
References: <20180921161939.822-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1891511844664216384
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledvgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.150.175
Subject: [Qemu-arm] [PATCH v2 02/11] hw/arm/aspeed: change the FMC flash
 model of the AST2500 evb
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DTvQknB+FroM

The AST2500 evb is shipped with a W25Q256 which has a non volatile bit
to make the chip operate in 4 Byte address mode at power up. This
should be an interesting feature to model as it will exercise a bit
more the SMC controllers and MMIO execution at boot time.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bb9590f1aed1..f2d64e45511a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -105,7 +105,7 @@ static const AspeedBoardConfig aspeed_boards[] =3D {
     [AST2500_EVB]  =3D {
         .soc_name  =3D "ast2500-a1",
         .hw_strap1 =3D AST2500_EVB_HW_STRAP1,
-        .fmc_model =3D "n25q256a",
+        .fmc_model =3D "w25q256",
         .spi_model =3D "mx25l25635e",
         .num_cs    =3D 1,
         .i2c_init  =3D ast2500_evb_i2c_init,
--=20
2.17.1

