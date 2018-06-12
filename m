Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4976811wrq;
        Tue, 12 Jun 2018 00:21:34 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLXK/eI4inQ37pMQCunpHdrbWXDBnhDH+66G/H6ajFrKGeo21/m3sAWCiuACWVhZXYsQe/I
X-Received: by 2002:ac8:2b46:: with SMTP id 6-v6mr2354094qtv.302.1528788094180;
        Tue, 12 Jun 2018 00:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528788094; cv=none;
        d=google.com; s=arc-20160816;
        b=nTsjYTAx+SGhHg6ZRPhThU4y46NygcTYJcvW+c7X+RNx3pz/MhIs0m7dls4syAeVtQ
         LNbo13eHmcB6EQ8pLSPylvaMNbDLKkEGeJ8EpNWy7qSWiR+z0jHoZSYHorot4yt5OTDR
         Ww6WZLA5nrYvRKDVOUXDep76yTkWGuLcxVQhJYmFXzRFg8gLArEiUJtSvjN6APSNcg68
         58YI9TvNBT/vo+904HqX3HcxtYyt3rRmEIx2Xsiw9hIo2xaggegqmcMT8bBu9x7QnqMV
         tfP66Rji5kwTnMisHAphb2GzpnhCjNKl/dwZiEH6N8v3LjotWQIc/lv81oqU3DjUUm8d
         XTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=s4hPYWgWxoCw8hgOSRNGn/5Y2lXpWmmyVdwsNfbB/n4=;
        b=VOf1W38kzqWMYnxXIge9jBR281lZoaFY9GBJXyDGW8Pm+Xo+xVejS666wi7rZbGlpK
         fndAq72wIclKgH7WVMrFaR7zPF87+NoPkC1pM830Jloi/mo/Q1wc/dsIUFgwC+pG4Gzt
         4I91I5lA3C6MqpWM4AsYCaAqVrolYpFBs8iBOlInugj2jeSD5sqohWzGatCDvgaUAGH2
         USduYz7Rxp4x2nYJRJM2myTsW3H38HlU03OiYlDK4pUAug34A6ah45SjAIJiP1U2vblU
         816oTVhNgGofVxzBf8fMKn+v2YhQceLuKXswNLJzFt+e8mUX0pCCO1pOrs8o1CIBE8Fj
         C1SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n22-v6si241982qka.142.2018.06.12.00.21.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 00:21:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53441 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSdcT-00006X-LY
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 03:21:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fSdFH-0004V4-B9
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 02:57:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fSdFE-0001XY-7i
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 02:57:35 -0400
Received: from 4.mo69.mail-out.ovh.net ([46.105.42.102]:58643)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fSdFE-0001Wq-1b
	for qemu-arm@nongnu.org; Tue, 12 Jun 2018 02:57:32 -0400
Received: from player797.ha.ovh.net (unknown [10.109.120.110])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id 415E417A49
	for <qemu-arm@nongnu.org>; Tue, 12 Jun 2018 08:57:30 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player797.ha.ovh.net (Postfix) with ESMTPSA id A96B12E00BB;
	Tue, 12 Jun 2018 08:57:23 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Tue, 12 Jun 2018 08:57:13 +0200
Message-Id: <20180612065716.10587-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 7987415415893822272
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedthedrkeeigdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.42.102
Subject: [Qemu-arm] [PATCH 0/3] aspeed/smc: small fixes
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v8KyIa+3l9G0

Hello,

Here is a short series of cleanups and fixes for issues in the Aspeed
SMC controller model discovered when experimenting with the MMIO exec
feature and also from tests under a QEMU PowerNV machine.

Indeed, the OPAL/skiboot firmware accesses the Aspeed SoC address
space using the iLPC->AHB bridge of the SuperIO controller and drives
the SPI controller to access the PNOR.

Thanks,

C.

C=C3=A9dric Le Goater (3):
  aspeed/smc: fix dummy cycles count when in dual IO mode
  aspeed/smc: fix HW strapping
  aspeed/smc: rename aspeed_smc_flash_send_addr() to aspeed_smc_flash_set=
up()

 hw/ssi/aspeed_smc.c | 48 +++++++++++++++++++++++++----------------------=
-
 1 file changed, 25 insertions(+), 23 deletions(-)

--=20
2.13.6

