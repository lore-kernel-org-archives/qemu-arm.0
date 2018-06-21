Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp154612wrq;
        Thu, 21 Jun 2018 15:40:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJPbjJvKwGyDS6+hc9I0oyoUVzR2m4kZLlvw9tb8Mv8CPn4fiH05//KBC6nQq+BIXD763hO
X-Received: by 2002:a37:9007:: with SMTP id s7-v6mr23410142qkd.2.1529620836739;
        Thu, 21 Jun 2018 15:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529620836; cv=none;
        d=google.com; s=arc-20160816;
        b=sgoZ9l4wOPERbTTeLriwBTN0xCwsa6IAsVpI5IRM5H1w07Wtfl9Qg50y8Mq1dIDzCo
         dHm+UW59l7uNnSLzC7f0vVkBEnf4Ex35jENMBVIcMCeXZMa0V1Ut0/4gdZTpDrTv8hpv
         gy2sCYdNudkHlAC8R9/8p9Bid5e0HUpdsuUoVBZLqChUASRMgnzX9LvgpQVdVLu3dZo/
         V7vNawhM9gx8NbDSs8ts1sOfq0+n7Of/njIlKvlcQg7koZWLh9bAv/W6PD5LdAXA0Hw4
         0grffTeSirU8MxrgIVHhvHVDxtkwwfaXpyadcIfs507EUscWzdsyWm/wrne21bA71S6+
         iq+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=h24ocyyWvsQT1itkheWWBe/RZmh7LuKB4W75LnRiRLI=;
        b=rUB/LgNU/YMEpXxjNrY7chsiwxzsxC4fI7z9Jxa7Uay85Ni/EH3zc/MrtRz3FnojmL
         bj2bX+WJP8f7O0kDtGL5cQZvU/+7n2WGA78FQWkWrvg7oXR7Lis4qVcrOdIKjXdllUPO
         1FOHMbNHQO5w7ooDeoIhg4+YQ+GmyEB0AKqFhNgj2TWUk2d2cuj/1CuFC6+t4IdNC6mS
         1qd8ASjv8FNYSNnFmdGrt9aPs+eUkQCr7jYgLyP2/UYFaVwpZ0laMGkCRKXhkEV+38Ve
         3kHrTG4eKbe+g78Ew2jBj7QSUr8tMF4fz/tuPOZ+AZ2vaeryj10yVqK+EQ0y1bSmnzIQ
         Nw6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2-v6si245866qtg.221.2018.06.21.15.40.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 15:40:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW8Fo-0000W2-8u
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 18:40:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fW8FK-0000Vr-WD
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 18:40:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fW8FH-0001ql-Pz
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 18:40:07 -0400
Received: from 16.mo6.mail-out.ovh.net ([87.98.139.208]:33934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fW8FH-0001qT-IC
	for qemu-devel@nongnu.org; Thu, 21 Jun 2018 18:40:03 -0400
Received: from player696.ha.ovh.net (unknown [10.109.122.75])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 5CB9D165A67
	for <qemu-devel@nongnu.org>; Fri, 22 Jun 2018 00:40:01 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: clg@kaod.org)
	by player696.ha.ovh.net (Postfix) with ESMTPSA id 2C75D3C007D;
	Fri, 22 Jun 2018 00:39:51 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-devel@nongnu.org
Date: Fri, 22 Jun 2018 00:39:43 +0200
Message-Id: <20180621223946.20738-1-clg@kaod.org>
X-Mailer: git-send-email 2.13.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2972375754196618048
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtiedrtdehgdduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 87.98.139.208
Subject: [Qemu-devel] [PATCH 0/3] aspeed: introduce the APB clock settings
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
X-TUID: /KFCsKBEIxTC

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

