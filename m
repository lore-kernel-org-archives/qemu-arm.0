Received: by 10.25.208.211 with SMTP id h202csp393154lfg;
        Fri, 4 Mar 2016 20:30:07 -0800 (PST)
X-Received: by 10.140.176.7 with SMTP id w7mr15523524qhw.59.1457152207845;
        Fri, 04 Mar 2016 20:30:07 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d90si6552877qge.118.2016.03.04.20.30.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Mar 2016 20:30:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:44656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ac3qw-00088N-AW
	for alex.bennee@linaro.org; Fri, 04 Mar 2016 23:30:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1ac3qu-000883-1J
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 23:30:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1ac3qs-0007yk-HG
	for qemu-arm@nongnu.org; Fri, 04 Mar 2016 23:30:03 -0500
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:33925
	helo=homiemail-a12.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1ac3qq-0007xi-Ey; Fri, 04 Mar 2016 23:30:02 -0500
Received: from homiemail-a12.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a12.g.dreamhost.com (Postfix) with ESMTP id 253361030063; 
	Fri,  4 Mar 2016 20:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
	:subject:date:message-id:mime-version:content-type:
	content-transfer-encoding; s=aj.id.au; bh=Z50ey2kDOMpm8+L4v0eXYt
	etN3E=; b=QBcEJDxiuSx37TyTSCEGVBt5hoR1cCZfWSPzeLy2OvbpQyOICL0QgG
	AnmfLnS6nXXSXHrrEX2y5aAm1PXj+TExHaoKbTKE8AsxvHwnftJ87VeL7ZhRe1/4
	rA+upkNtRj59/e9tr9bcPB3boMk/n3RRIczkMu82GG0DfvJ1fGLxs=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a12.g.dreamhost.com (Postfix) with ESMTPSA id A303E1030062;
	Fri,  4 Mar 2016 20:29:54 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  5 Mar 2016 14:59:34 +1030
Message-Id: <1457152177-19550-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 69.163.253.7
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Subject: [Qemu-arm] [PATCH v3 0/3] Add ASPEED AST2400 machine model
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
X-TUID: yPU4yCHIZpg8

This patch series models enough of the ASPEED AST2400 ARM9 SoC[0] to boot=
 an
aspeed_defconfig Linux kernel[1]. Specifically, the series implements the=
 timer
and VIC devices and integrates them into a new ast2400 machine through a
AST2400SOC model. The device model patches only partially implement the
hardware features of the timer and VIC, again mostly just enough to boot =
Linux.

Unfortunately the datasheet describing the devices is not generally avail=
able,
but I'll try to add comments to any unclear areas.

The addition of the AST2400 to QEMU is motivated by use of the SoC as a B=
MC in
OpenPOWER[2][3] machines and the ongoing development of OpenBMC[4]. The
presence of a machine model for the AST2400 will help with development an=
d
testing of the OpenBMC stack.

Cheers,

Andrew

[0] http://www.aspeedtech.com/products.php?fPath=3D20&rId=3D376
[1] git fetch git@github.com:openbmc/linux.git dev-4.3
[2] http://openpowerfoundation.org/
[3] https://github.com/open-power/
[4] https://github.com/openbmc/openbmc

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

Andrew Jeffery (3):
  hw/timer: Add ASPEED timer device model
  hw/intc: Add (new) ASPEED VIC device model
  hw/arm: Add ASPEED AST2400 machine model

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/ast2400.c                | 208 ++++++++++++++++++
 hw/intc/Makefile.objs           |   1 +
 hw/intc/aspeed_vic.c            | 335 +++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   1 +
 hw/timer/aspeed_timer.c         | 452 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/intc/aspeed_vic.h    |  48 +++++
 include/hw/timer/aspeed_timer.h |  59 ++++++
 trace-events                    |  16 ++
 10 files changed, 1122 insertions(+)
 create mode 100644 hw/arm/ast2400.c
 create mode 100644 hw/intc/aspeed_vic.c
 create mode 100644 hw/timer/aspeed_timer.c
 create mode 100644 include/hw/intc/aspeed_vic.h
 create mode 100644 include/hw/timer/aspeed_timer.h

--=20
2.5.0

