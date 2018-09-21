Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3326423wrd;
        Fri, 21 Sep 2018 09:20:23 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdbSRFo1NgDvKWU+MjwT6J64jYRkKwvyWSqOtKQiNB1gcldPVoeN7T4wWgUBePLYMZ/FMD1v
X-Received: by 2002:a37:5e82:: with SMTP id s124-v6mr31803069qkb.313.1537546823638;
        Fri, 21 Sep 2018 09:20:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537546823; cv=none;
        d=google.com; s=arc-20160816;
        b=I5fyG9deULb03XaCKRIY3wuzR3pgCNV2qNCV6318fe92DhnxNui/+UxpY7AdUI/bOw
         k9dHe++qJwbUeqprSF2XKbKe8s+5+lgSOuhuAkrSG+q3jV0Cg8FwC+vW0/lONz4z/ibh
         u5OqM7SEawCJLn9BLyGVrlAZXJC16sYkpv8RKJljv7bDwtAEZ8p/3tUd0TUkQ2pv6kiY
         Fm4OOAEZXZr10HMxLPXgwsjpqJzTWzMvsycFY4i4I5Ud6eDVkdp+nZANsZEtFKG51weZ
         1KbK+SqpptKfjrXxINIwROCKlmbyu4J4hqQhQwQeCY64UMp7QVhghClpmx71VydzlnYu
         4Qmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=UQ3y3uNIUn1I8mn4iACgaWduFkgTy4+KkG0nE3/0ZDk=;
        b=JhVKdX/ZLBahAunkJ/XzxUba12JTGxmnMXk06XUTzrKd3dZa+T+0pG20fIvgVg23BF
         Oy/WkYzuAaxpX4gnIWTDAIQQvoKyHn14lRKGsvKn9AYuwBxcA4nMcVqrYIj2Ul07JhVm
         ZPfZIT06TzfJY3MU1uqGhWgHWwYcjv4qouQYucnZIMWG4Qs99tLvBO2he8z0yyU+AfSe
         v2QP7GoLMRhIVykrDSmaR/aDUrZu0Evq1cx+03G3/6ACbKDEzfVwR63vB0Bxir0JTaM1
         S16OrOpI9OpRf2maLVy3X3VHIm5SNHSyrk37shJCyvLjm9G/c6ycDdrtAojx6IfX3FwP
         EjAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y64-v6si763453qky.359.2018.09.21.09.20.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 09:20:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3OAJ-0003wz-4w
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 12:20:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OAA-0003wQ-Jo
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:20:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1g3OA6-0003ke-1H
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:20:14 -0400
Received: from 9.mo69.mail-out.ovh.net ([46.105.56.78]:37562)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1g3OA5-0003bc-MU
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 12:20:09 -0400
Received: from player799.ha.ovh.net (unknown [10.109.143.189])
	by mo69.mail-out.ovh.net (Postfix) with ESMTP id BFD1D2D85B
	for <qemu-arm@nongnu.org>; Fri, 21 Sep 2018 18:19:57 +0200 (CEST)
Received: from zorba.kaod.org.com (LFbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: clg@kaod.org)
	by player799.ha.ovh.net (Postfix) with ESMTPSA id 14DB4520095;
	Fri, 21 Sep 2018 18:19:43 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 21 Sep 2018 18:19:28 +0200
Message-Id: <20180921161939.822-1-clg@kaod.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 1886163819471276864
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtjedrledvgddutdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.78
Subject: [Qemu-arm] [PATCH v2 00/11] aspeed: misc fixes and enhancements
 (SMC)
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
X-TUID: +39rByCu+Gje

Hello,

This series adds a couple of cleanups and two main features to the
SMC controller of the Aspeed machines :

 - a 'execute-in-place' property to boot directly from a memory region
   alias of the FMC flash module using MMIO execution. This is not
   activated by default because boot time needs to be improved on
   recent firmwares. It also breaks migration compatibility.

 - support for DMA to access the flash modules. Our primary need is
   the checksum calculation which is used to evaluate the best clock
   settings for reads.

Thanks,

C.

Changes since v1:

 - fixed #ifdef leading underscore
 - changed the name of the property from 'mmio-exec' to 'execute-in-place=
'
 - improved changelogs
 - introduced a DMA address space for the SMC controller

C=C3=A9dric Le Goater (11):
  aspeed/timer: fix compile breakage with clang 3.4.2
  hw/arm/aspeed: change the FMC flash model of the AST2500 evb
  hw/arm/aspeed: Add an Aspeed machine class
  hw/arm/aspeed: add a 'execute-in-place' property to boot directly from
    CE0
  aspeed/smc: fix some alignment issues
  aspeed/smc: fix default read value
  aspeed/smc: add a 'sdram_base' and 'max-ram-size' properties
  aspeed/smc: add support for DMAs
  aspeed/smc: add DMA calibration settings
  aspeed/smc: inject errors in DMA checksum
  aspeed/smc: Add dummy data register

 include/hw/arm/aspeed.h         |  48 +++++
 include/hw/ssi/aspeed_smc.h     |   6 +
 include/hw/timer/aspeed_timer.h |   3 +-
 hw/arm/aspeed.c                 | 256 ++++++++++--------------
 hw/arm/aspeed_soc.c             |  28 ++-
 hw/ssi/aspeed_smc.c             | 341 ++++++++++++++++++++++++++++++--
 hw/timer/aspeed_timer.c         |   1 -
 7 files changed, 509 insertions(+), 174 deletions(-)
 create mode 100644 include/hw/arm/aspeed.h

--=20
2.17.1

