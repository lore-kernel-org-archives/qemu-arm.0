Received: by 10.25.208.211 with SMTP id h202csp2182776lfg;
        Sun, 13 Mar 2016 21:14:15 -0700 (PDT)
X-Received: by 10.140.18.163 with SMTP id 32mr27144158qgf.11.1457928855915;
        Sun, 13 Mar 2016 21:14:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m10si1842695qge.114.2016.03.13.21.14.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 Mar 2016 21:14:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:38925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1afJtW-0002B2-9m
	for alex.bennee@linaro.org; Mon, 14 Mar 2016 00:14:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afJtT-0002Ap-DQ
	for qemu-arm@nongnu.org; Mon, 14 Mar 2016 00:14:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1afJtO-0000Ui-M7
	for qemu-arm@nongnu.org; Mon, 14 Mar 2016 00:14:11 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:35488
	helo=homiemail-a17.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1afJtO-0000UY-Bp; Mon, 14 Mar 2016 00:14:06 -0400
Received: from homiemail-a17.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTP id 0EC252B206A;
	Sun, 13 Mar 2016 21:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
	:subject:date:message-id:mime-version:content-type:
	content-transfer-encoding; s=aj.id.au; bh=fRAagVJcaG4fW+YTEto3N2
	ThAfU=; b=umjE3EnclhR6IDYz+m0GbM1kBhZQ1SJIuQZxWhPotX8G10ffLdlDW6
	SPzmziq/RpZy0giWb1FoZtVwc07h/LW7He8s8P0UHYFX3MDwswjHwU9cOwzvfiO8
	m8ZPDY+CTFPfgOoa6Ftj+lKxCK/m5/uRc5fxZzTWxQG66viJS2TUc=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a17.g.dreamhost.com (Postfix) with ESMTPSA id 3656D2B2065; 
	Sun, 13 Mar 2016 21:14:01 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Mar 2016 14:43:48 +1030
Message-Id: <1457928832-31026-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jeremy Kerr <jk@ozlabs.org>
Subject: [Qemu-arm] [PATCH v4 0/4] Add ASPEED AST2400 SoC and OpenPower BMC
	machine
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aH5Y7pVLXSno

This patch series models enough of the ASPEED AST2400 ARM9 SoC[0] to boot=
 an
aspeed_defconfig Linux kernel[1][2]. Specifically, the series implements =
the
ASPEED timer and VIC devices, integrates them into an AST2400 SoC and exp=
oses
it all through a new opbmc2400 machine. The device model patches only par=
tially
implement the hardware features of the timer and VIC, again mostly just e=
nough
to boot Linux.

Unfortunately the datasheet describing the devices is not generally avail=
able,
but I'll try to add comments to any unclear areas.

The addition of the AST2400 to QEMU is motivated by use of the SoC as a B=
MC in
OpenPOWER[2][3] machines and the ongoing development of OpenBMC[4]. The
presence of a machine model utilising the AST2400 will help with developm=
ent
and testing of the OpenBMC stack.

Cheers,

Andrew

[0] http://www.aspeedtech.com/products.php?fPath=3D20&rId=3D376
[1] https://github.com/openbmc/linux/tree/dev-4.3
[2] git fetch git@github.com:openbmc/linux.git dev-4.3
[3] http://openpowerfoundation.org/
[4] https://github.com/open-power/
[5] https://github.com/openbmc/openbmc

Changes since v3:

  Address comments from Peter Maydell, splitting the machine model from
  hw/arm/ast2400.c into hw/arm/opbmc2400.c amongst other minor cleanups t=
o the
  timer and VIC.

Changes since v2:

  This re-roll is a reasonable rework of the patches in the series, which=
 may
  make it difficult to compare v1 to v2.

  Addressed reviews/comments from:
  * Peter Maydell
  * Alexey Kardashevskiy
  * Joel Stanley

Changes since v1:

  Addressed reviews/comments from:
  * C=C3=A9dric Le Goater

Andrew Jeffery (4):
  hw/timer: Add ASPEED timer device model
  hw/intc: Add (new) ASPEED VIC device model
  hw/arm: Add an ASPEED AST2400 SoC
  hw/arm: Add opbmc2400, an AST2400-based OpenPOWER BMC machine

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/ast2400.c                | 137 ++++++++++++
 hw/arm/opbmc2400.c              |  66 ++++++
 hw/intc/Makefile.objs           |   1 +
 hw/intc/aspeed_vic.c            | 339 ++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   1 +
 hw/timer/aspeed_timer.c         | 451 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/ast2400.h        |  35 ++++
 include/hw/intc/aspeed_vic.h    |  48 +++++
 include/hw/timer/aspeed_timer.h |  59 ++++++
 trace-events                    |  16 ++
 12 files changed, 1155 insertions(+)
 create mode 100644 hw/arm/ast2400.c
 create mode 100644 hw/arm/opbmc2400.c
 create mode 100644 hw/intc/aspeed_vic.c
 create mode 100644 hw/timer/aspeed_timer.c
 create mode 100644 include/hw/arm/ast2400.h
 create mode 100644 include/hw/intc/aspeed_vic.h
 create mode 100644 include/hw/timer/aspeed_timer.h

--=20
2.5.0

