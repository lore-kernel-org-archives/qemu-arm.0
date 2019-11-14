Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5241886wrr;
        Thu, 14 Nov 2019 01:46:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqxb9NFPAKk+IO0Q/n8kn8I9Jbo9X4pvTVAVScFUkFouL1jT5ACYec5pm5s+0vg2Hzqx1Gfx
X-Received: by 2002:ac8:f30:: with SMTP id e45mr7225539qtk.222.1573724803068;
        Thu, 14 Nov 2019 01:46:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573724803; cv=none;
        d=google.com; s=arc-20160816;
        b=A6BdVK+u4uAPRA3t8XagBvheRmxuOQOP1Rx20MN0tMFJuQQmXIR1E1KUqzRDyhuNdR
         foGXGkc2+0KKiGkzd4xWooRNNcQNZZRkt9xuYC6i9oKm7U+xLeNMpVTCrRy1gwcznecO
         ZRxolIYDnaaBBx8jZMSYx3pE1iQLaWilGzQG+ba1zmHyNgfiSBoI2USNVAIw2yd+k8EX
         kkbiEsEer8S5m7FYri2lvowClrc8H0vMCL48RuaYyeOXf3++AZpYHwWH2QNDyoMhqa1o
         0xhitjIBkksfOjgJvcO9V9yaLa23ku4/t9axJa6b1NcC3GNUsrXUBgfH3R19YJ1ts8uQ
         Xhgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=8YJsp5qVq00RaDtqKMCN5G/Y/SzV8EUooowKOYH7Oog=;
        b=xRNIOgEWLKztn/7Kt3yztGbU1LiWlPebZjbYJaZx/v7bz5pQbeo4gBZqzoXTGLFXeQ
         vJMDzQqbAnoeStYDCUv0SBnoHuGAVTJ/IYM4elekEudC3bx41jfxxsQu29uVwVkiA7O3
         ZVJw7NL5pss/cFaGE6KoXQbLlOV5c54TxhZn2I/gqtopEVWQhYWxexk9szWKwHXKgaIt
         EEYvznxNcUEbh5r0FdRa/cJCeSlFeVgBU96ll30qYeVWtZlDb+LNw/MSZWx5AjMmjoPv
         frbdgGIwbbLUmss9s+4GK8tXDx0LbQKCncFZtk8Zo4ubsZIceiAcybhqxJ+Rd4RByWjo
         lYKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si2745658qvz.128.2019.11.14.01.46.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 01:46:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVBi5-0007j9-Eg
	for alex.bennee@linaro.org; Thu, 14 Nov 2019 04:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iVBhZ-0007gM-Ix
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iVBhY-0004K0-Eo
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:09 -0500
Received: from 17.mo7.mail-out.ovh.net ([188.165.35.227]:50268)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iVBhY-0004GF-9D
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:08 -0500
Received: from player737.ha.ovh.net (unknown [10.108.42.82])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id D0DE913851B
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2019 10:45:58 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id 2EC692A78286;
 Thu, 14 Nov 2019 09:45:51 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 0/5] aspeed: AST2600 SMC fixes and tacoma-bmc machine 
Date: Thu, 14 Nov 2019 10:45:39 +0100
Message-Id: <20191114094544.30114-1-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2474165046772665105
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffogggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.35.227
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
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gdd2KlBTzVYf

Hello,

Here are fixes for the AST2600 SMC controller and the definition of a
new tacoma-bmc board using the AST2600 SoC.

Thanks,

C.

C=C3=A9dric Le Goater (5):
  aspeed/smc: Restore default AHB window mapping at reset
  aspeed/smc: Do not map disabled segment on the AST2600
  aspeed/smc: Add AST2600 timings registers
  aspeed: remove AspeedBoardConfig array and use AspeedMachineClass
  aspeed: Add support for the tacoma-bmc board

 include/hw/arm/aspeed.h     |  24 ++-
 include/hw/ssi/aspeed_smc.h |   1 +
 hw/arm/aspeed.c             | 283 +++++++++++++++++++++++-------------
 hw/ssi/aspeed_smc.c         |  63 +++++---
 4 files changed, 235 insertions(+), 136 deletions(-)

--=20
2.21.0

