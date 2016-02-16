Received: by 10.25.208.211 with SMTP id h202csp1271767lfg;
        Tue, 16 Feb 2016 04:20:34 -0800 (PST)
X-Received: by 10.140.222.18 with SMTP id s18mr27940704qhb.21.1455625209525;
        Tue, 16 Feb 2016 04:20:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si40271934qhd.49.2016.02.16.04.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Feb 2016 04:20:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail (test mode) header.i=@aj.id.au
Received: from localhost ([::1]:45041 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aVebw-00056j-Ud
	for alex.bennee@linaro.org; Tue, 16 Feb 2016 07:20:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1aVduR-0002Au-S9
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 06:35:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1aVduO-0004Ge-LL
	for qemu-arm@nongnu.org; Tue, 16 Feb 2016 06:35:11 -0500
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:40260
	helo=homiemail-a20.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1aVduO-0004Fm-DD; Tue, 16 Feb 2016 06:35:08 -0500
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id 8D7897EC078;
	Tue, 16 Feb 2016 03:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
	:subject:date:message-id:mime-version:content-type:
	content-transfer-encoding; s=aj.id.au; bh=/uCdNw8FLFoqz51bIAaXL4
	oVG+8=; b=cieRhMY4NsommbKRp8DBFOTOOdZ98Y4crrRjwIEur/HH8F/yku9n93
	PMZGdmMGKZR8BHEqKE9WVbsdWBdp2Pr+zjs9BzCFQRLwPYR62YWztbd3oRJg5jCa
	C7aZz6APWf7zBMXxT8H/z1CWzSNvHXn2tvOpnTOLaaFDLJFwBxOMA=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id 917257EC060; 
	Tue, 16 Feb 2016 03:35:05 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Date: Tue, 16 Feb 2016 22:04:54 +1030
Message-Id: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.163.253.7
X-Mailman-Approved-At: Tue, 16 Feb 2016 07:19:56 -0500
Cc: openbmc@lists.ozlabs.org, qemu-arm@nongnu.org
Subject: [Qemu-arm] [PATCH v2 0/3] Add ASPEED AST2400 machine model
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
X-TUID: qqKrm78aRGSl

Hi all,

This is the first time I've implemented QEMU device models so no doubt th=
e
patches contain misunderstandings and/or oversights - happy to hear any
feedback!=20

This patch series implements enough of the ASPEED AST2400 (ARMv5 SoC) mac=
hine
model to boot an aspeed_defconfig Linux kernel[1]. The device model patch=
es in
turn only partially implement the hardware features of the timer and AVIC=
,
again mostly just enough to boot Linux.

The addition of the AST2400 to QEMU is motivated by use of the SoC as a B=
MC in
OpenPOWER[2][3] machines and the ongoing development of OpenBMC[4]. The
presence of a machine model for the AST2400 will help with development an=
d
testing of the OpenBMC stack.

I posted an initial revision to the OpenBMC mailing list (CC'ed) for revi=
ew,
hence the v2.

Cheers,

Andrew

[1] git fetch git@github.com:openbmc/linux.git dev-4.3
[2] http://openpowerfoundation.org/
[3] https://github.com/open-power/
[4] https://github.com/openbmc/openbmc

=3D=3D=3D

Since v1:

  Address comments from C=C3=A9dric Le Goater:

  General:
  * Use tracing infrastructure instead of internal DPRINTF
  * Enforce access size constraints and alignment in MemoryRegionOps

  hw/timer/aspeed_timer.c:
  * Refactor initialisation of and respect requested clock rates (APB/Ext=
ernal)
  * Simplify some index calculations

=3D=3D=3D

Andrew Jeffery (3):
  hw/timer: Add ASPEED AST2400 timer device model
  hw/intc: Add (new) ASPEED AST2400 AVIC device model
  hw/arm: Add ASPEED AST2400 machine type

 default-configs/arm-softmmu.mak |   2 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/ast2400.c                | 139 ++++++++++++++++++
 hw/intc/Makefile.objs           |   1 +
 hw/intc/aspeed_vic.c            | 256 +++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   2 +
 hw/timer/aspeed_timer.c         | 308 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/intc/aspeed_vic.h    |  40 ++++++
 include/hw/timer/aspeed_timer.h |  55 +++++++
 trace-events                    |  22 +++
 10 files changed, 826 insertions(+)
 create mode 100644 hw/arm/ast2400.c
 create mode 100644 hw/intc/aspeed_vic.c
 create mode 100644 hw/timer/aspeed_timer.c
 create mode 100644 include/hw/intc/aspeed_vic.h
 create mode 100644 include/hw/timer/aspeed_timer.h

--=20
2.5.0

