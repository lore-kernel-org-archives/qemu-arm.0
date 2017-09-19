Received: by 10.223.172.38 with SMTP id v35csp4817794wrc;
        Tue, 19 Sep 2017 04:31:32 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBw7AoA6t+zp3YeFFyhT+gpEDa7ay9ynnk8RcZghX+Z09huRWEKjb/+GSpdng860sMt79cy
X-Received: by 10.200.39.13 with SMTP id g13mr1493484qtg.234.1505820692791;
        Tue, 19 Sep 2017 04:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505820692; cv=none;
        d=google.com; s=arc-20160816;
        b=QpSdngakPWqj6WPj7Or1oserqDXAc2CIwP6T+6JMRnidmyew7s08Asuya7UuOI75GS
         spg8cDGe7ck1ZsZ/qEI+9xfVCqA5Jl3KaZ3Uvkt3RPwE/g1AOUMHVGuksZU8m9b35YMP
         w7N7ZSj0DdMg/JMnn6QtzAC4G7MGoQ8NPZX/ANNbM5MjDVfS8G9IMzy9/SjL2ztLrPJw
         Jn9Su0AvT+a6cX42Q01DaXNnlzPifN/2xRMukKXBzsUELxsezqG6xlC+V0QMhCRfDrwp
         lNh1cYEi/oIQmAobxvNwDopSmGf0/IgHS30q2Oo7W/5xGXt01jFtUTFuewoVK+TURewW
         fG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1RriaIFfC3oE0aCU2bFChSVBxocIBMO+tMsyHWukmTQ=;
        b=HfU1ojHoN7Dzh4VMcYPdCN6u9sy1RT2VdtnJ+S6zXb6eA6CDPRvF8Fwoilk4jwgpu5
         /XSHOWUFBPPy9qGTxhaWtUylfM7PPTvp/GBee80vgc2A33L0dYco9qwZke/Uxg0yQmTg
         Sv7Uuqwh7/6NRmIFydV0LFE4y+h2+eUwNnT0elDHk57XA+45bAAv/o/AXx7+4cNqL27E
         GA4tGOxMPYpl/kn5XiSo1w+Xwe2q5a2PTKU2RYnT+7cQujEq469FywoDDufw2cZ1lG+7
         s5TyyHQf56aCN1j3Prsj4FNETTsVDx3Eeif1dIvEKtwy+WjwpKU9fZxgG3b0ykEAFgOd
         ymgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a22si9308350qtc.268.2017.09.19.04.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 04:31:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41708 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duGkU-0005KT-Kw
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 07:31:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duGgf-0002MK-OU
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 07:27:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duGgc-0006VT-LE
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 07:27:33 -0400
Received: from 8.mo179.mail-out.ovh.net ([46.105.75.26]:34218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1duGgc-0006Ur-Fo
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 07:27:30 -0400
Received: from player716.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 80F9563493
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 13:27:29 +0200 (CEST)
Received: from zorba.kaod.org.com (deibp9eh1--blueice1n2.emea.ibm.com
	[195.212.29.164]) (Authenticated sender: clg@kaod.org)
	by player716.ha.ovh.net (Postfix) with ESMTPSA id 0A61E56007F;
	Tue, 19 Sep 2017 13:27:22 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Sep 2017 13:26:45 +0200
Message-Id: <20170919112645.8574-6-clg@kaod.org>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <20170919112645.8574-1-clg@kaod.org>
References: <20170919112645.8574-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 18383975157033896721
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheejgdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.75.26
Subject: [Qemu-arm] [PATCH 5/5] aspeed: add the pc9552 chips to the
 witherspoon machine
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U/4ex6W9WuH+

The pca9552 LED blinkers on the Witherspoon machine are used for leds
but also as GPIOs to control fans and GPUs.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 3e74970d7ad2..726cb438a52a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -386,6 +386,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
 {
     AspeedSoCState *soc =3D &bmc->soc;
=20
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3), "pca9552"=
, 0x60);
+
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "tmp423",=
 0x4c);
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 5), "tmp423",=
 0x4c);
=20
@@ -397,6 +399,8 @@ static void witherspoon_bmc_i2c_init(AspeedBoardState=
 *bmc)
=20
     aspeed_i2c_add_eeprom(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), 0x5=
1,
                           8 * 1024);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 11), "pca9552=
",
+                     0x60);
 }
=20
 static void witherspoon_bmc_init(MachineState *machine)
--=20
2.13.5

