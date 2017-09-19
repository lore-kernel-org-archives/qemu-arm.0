Received: by 10.223.172.38 with SMTP id v35csp4813866wrc;
        Tue, 19 Sep 2017 04:27:13 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCI7Hdg5zo/7Hdtwq+OdlgP/qjNuJsTJPAdx6jUhfiP7WT6M7pwgnoHAG+XqgQeFN22ayln
X-Received: by 10.55.161.4 with SMTP id k4mr1404133qke.161.1505820433626;
        Tue, 19 Sep 2017 04:27:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505820433; cv=none;
        d=google.com; s=arc-20160816;
        b=x5g309nbGFX+IMKqM8zZ8IlzDvMiB52bKlvaBQSr4uIg+TDHcL1Ehxh8hzthV5Y5ie
         pWNU1BHCjjY3DLFa1HaLTOt5xooOlTADY05S/dvJpWf2dTGRbdKAo3GtG6eHNgH2ji9r
         jbZm3GDmfp3qIsf+4VzvkIXpRHiH4gB1TD8LLu3v3HyEC/e9jhb4dglLkbIt3I9T1GsV
         COrv6uVv3w7AJkBQuFnWUElh6B1KKv3Dywx6zEyBUaFmLq2sJ8ZeE68JRkd4wPGLwAc2
         FDRsPwc1WZN+Y5+vVkoWLRImijUZq4FKRhWH+EcdIT+vIagn/tOfyix7seOWV/FaySt2
         HOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=wiGrtoNxcA7U+oriCwqFSTowN/ZW7mLMSHlca9TNbO4=;
        b=hfgWe14PlgK75MUZW8cOoNY0ix4qALpb54PF5s1QZADUSR1qHfdDKhG3boUXz2SsoN
         f2Dr19D9Z/YCN1UOwlKk5p5pgu4lDX4n8I7WeBAfyroKG9Glf8kRtJcOTSKjG88185WT
         JeyHELntJzTwkoK1xcM05nQydSmeWnox8bu4G4QydvvLkT0hCcuJVMUoAsM/wJVZkhAH
         hW/59c23DkN0k4nXFJbjvVgQFjIRAndlV9ZIbNFE0dVb+oJi6kyWfSSWJ7KaALDc70Pj
         JHH5n2grNW1TsI3stU3gtVA34q7fQ5TRITlD9iNQnjgKlPvdJD1fhFGmjjLwqNQ5LZVC
         gtKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a39si9398437qtb.367.2017.09.19.04.27.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Sep 2017 04:27:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41678 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1duGgJ-0001yS-Fw
	for alex.bennee@linaro.org; Tue, 19 Sep 2017 07:27:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duGgA-0001yA-I5
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 07:27:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1duGg7-0006BL-Es
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 07:27:02 -0400
Received: from 3.mo179.mail-out.ovh.net ([178.33.251.175]:57612)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1duGg7-0006Aa-8H
	for qemu-arm@nongnu.org; Tue, 19 Sep 2017 07:26:59 -0400
Received: from player716.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id E24EA623FA
	for <qemu-arm@nongnu.org>; Tue, 19 Sep 2017 13:26:57 +0200 (CEST)
Received: from zorba.kaod.org.com (deibp9eh1--blueice1n2.emea.ibm.com
	[195.212.29.164]) (Authenticated sender: clg@kaod.org)
	by player716.ha.ovh.net (Postfix) with ESMTPSA id C4BE656009C;
	Tue, 19 Sep 2017 13:26:50 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Sep 2017 13:26:40 +0200
Message-Id: <20170919112645.8574-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 18374686482044783377
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrheejgdegudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.251.175
Subject: [Qemu-arm] [PATCH 0/5] aspeed: add a witherspoon-bmc machine
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
X-TUID: xumVLHBNCjPg

Hello,

This series adds a new Aspeed machine to emulate the BMC of a
Witherspoon system. It also extends the other Aspeed machines with I2C
devices and adds a simple model for the pca9552 LED blinker present on
the witherspoon board.

Thanks,

C.

C=C3=A9dric Le Goater (5):
  aspeed: add support for the witherspoon-bmc board
  aspeed: add an I2C RTC device to all machines
  aspeed: Add EEPROM I2C devices
  misc: add pca9552 LED blinker model
  aspeed: add the pc9552 chips to the witherspoon machine

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 |  92 +++++++++++++++++
 hw/misc/Makefile.objs           |   1 +
 hw/misc/pca9552.c               | 212 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/misc/pca9552.h       |  32 ++++++
 5 files changed, 338 insertions(+)
 create mode 100644 hw/misc/pca9552.c
 create mode 100644 include/hw/misc/pca9552.h

--=20
2.13.5

