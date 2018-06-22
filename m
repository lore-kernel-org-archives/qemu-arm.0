Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp538287wrq;
        Fri, 22 Jun 2018 00:57:45 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfRx7N6Yr8uY1N1NAr/dliKz6NLbT6fkuYdkh7/LJfAW0j5nD1QOaf6Lhjq1KmnWRhuOYfb
X-Received: by 2002:ac8:3617:: with SMTP id m23-v6mr419090qtb.219.1529654265331;
        Fri, 22 Jun 2018 00:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529654265; cv=none;
        d=google.com; s=arc-20160816;
        b=sUs30C1GBas+WjEUoNOrgvbhlQhNYkkZgMRlMSBeY3/9ROcsu+NrceYjH19lupuydb
         vgdw41y0g5jrrOBiotP2cK+dKIp/mN9N6fSLA8j0XalBwRXAUq7C5EDHhpBj3rNGf1nY
         HrrIwMFIhnjlOqkR59JJJD823X9Ts94L17urfP1AuAiIqG/KYTqPehfjk5nELV26XSQu
         bUkdR5Kh0MJ3au+Q/GTzTWWBYp4RmXcBYphnRn7SE7lCDGh3ft7Lfp/u1s+Xsqj+Y+ZU
         ZncS4SzambXB9dmDxR0W5w2tcMI3TBDqwb4IX91pc9ZzpPJuY+OVqGJAhlsQHg59z0SJ
         f0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=cvsXIfEl/9+QPzMAqMmDrU2eaU0rMMlIQ4lmKJp/9bc=;
        b=dCQzfjM3u57A3Gp4f6HciPMOQ5fsb7gpfmUikmEXuX/YrUJsR7PPBz5bVoD0c0oDbp
         BtiwjanlMz7XCHgTNbFe7XSe9BVTbUsHxsALqyUxB9dbJAQ71mYi5Pka/lv7Su+m4fA+
         g40dkswkaES5Sie/d7wXAGUYPQFS7b36DESS5AdcpZzYW/JW7PNIA2TDdgUMUyPkSx10
         XR9qWQM6yC4zpGcKPK75nbP9XPlKHbgpOS5vpB1RA04tgFWls18zQLrvXhR6llZHRf8o
         ys2ryQBs96Ms2/mkb9w94rpR0EqPKDLHokThAPcMj3Sr4LYZHCIMg7aCXN9P6QFIk26/
         UxoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k8-v6si5038928qti.248.2018.06.22.00.57.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 00:57:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWGwy-0006Sg-SA
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 03:57:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fWGwW-0006RN-6g
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 03:57:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fWGwT-0008Ku-4b
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 03:57:16 -0400
Received: from 7.mo6.mail-out.ovh.net ([46.105.59.196]:60212)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fWGwS-0008KK-Tc
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 03:57:13 -0400
Received: from player168.ha.ovh.net (unknown [10.109.105.54])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 0A12B1644D3
	for <qemu-devel@nongnu.org>; Fri, 22 Jun 2018 09:57:10 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player168.ha.ovh.net (Postfix) with ESMTPSA id 18D1A420084;
	Fri, 22 Jun 2018 09:57:03 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jun 2018 09:56:57 +0200
Message-Id: <20180622075700.5923-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 12382084228722494272
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtdehgdduvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.59.196
Subject: [Qemu-devel] [PATCH v2 0/3] aspeed: introduce the APB clock settings
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TXiRWqnrDInn

Hello,

The Aspeed SoC clocks are driven by an input source clock which can
have different frequencies : 24MHz or 25MHz, and also, on the Aspeed
AST2400 SoC, 48MHz. The H-PLL (CPU) clock is defined from a calculation
using parameters in the H-PLL Parameter register or from a predefined
set of frequencies if the setting is strapped by hardware (Aspeed
AST2400 SoC). The other clocks of the SoC are then defined from the
H-PLL using dividers.

We first introduce the APB clock because it drives the timer model.
This fixes a slowdown issue on the palmetto machine (AST2400) when
running Linux. The latest Linux versions take into account more
precisely the SoC settings for the clocks and the APB freq is set to
48MHz but modeled at 24MHz by QEMU.

Thanks,

C.

Changes since v1:

- fixed AST2400 HPLL calculation when CLKIN is 25MHz=20

C=C3=A9dric Le Goater (3):
  aspeed/scu: introduce clock frequencies
  aspeed: initialize the SCU controller first
  aspeed/timer: use the APB frequency from the SCU

 include/hw/misc/aspeed_scu.h    |  70 ++++++++++++++++++++++++--
 include/hw/timer/aspeed_timer.h |   4 ++
 hw/arm/aspeed_soc.c             |  42 ++++++++--------
 hw/misc/aspeed_scu.c            | 106 ++++++++++++++++++++++++++++++++++=
++++++
 hw/timer/aspeed_timer.c         |  19 +++++--
 5 files changed, 213 insertions(+), 28 deletions(-)

--=20
2.13.6

