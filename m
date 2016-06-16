Received: by 10.25.21.96 with SMTP id l93csp181894lfi;
        Thu, 16 Jun 2016 00:48:31 -0700 (PDT)
X-Received: by 10.55.21.65 with SMTP id f62mr3216187qkh.109.1466063311194;
        Thu, 16 Jun 2016 00:48:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 35si25406848qtg.8.2016.06.16.00.48.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Jun 2016 00:48:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail (test mode) header.i=@aj.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDS2Q-0002gZ-Kv
	for alex.bennee@linaro.org; Thu, 16 Jun 2016 03:48:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bDS2M-0002gB-K0
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 03:48:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bDS2H-0006rV-Ng
	for qemu-arm@nongnu.org; Thu, 16 Jun 2016 03:48:26 -0400
Received: from sub3.mail.dreamhost.com ([69.163.253.7]:59882
	helo=homiemail-a19.g.dreamhost.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bDS2H-0006rB-EB; Thu, 16 Jun 2016 03:48:21 -0400
Received: from homiemail-a19.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a19.g.dreamhost.com (Postfix) with ESMTP id 24147604076;
	Thu, 16 Jun 2016 00:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
	:subject:date:message-id:mime-version:content-type:
	content-transfer-encoding; s=aj.id.au; bh=/WKlZDRh7LT4zCJFF5vN87
	bB/lE=; b=singgZp9IiVuksd6oMikXGeSthTmNc+PW/Vdvv++9jiNVzes3k4Rym
	jzYCureCuf7lMsLqCVOag/b5klHkHxhwuE1SOzJ8M6cPub1BGUOa4B8x0JdSxeWZ
	sAjMBgv1tY6TfH0P3CpNBdNcmdR/bUNzN+gTyg5Igz3UNCUGR8SRI=
Received: from keelia.au.ibm.com (orion.jms.id.au [119.9.53.35])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: andrew@aj.id.au)
	by homiemail-a19.g.dreamhost.com (Postfix) with ESMTPSA id 552C7604069; 
	Thu, 16 Jun 2016 00:48:16 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jun 2016 17:48:05 +1000
Message-Id: <1466063287-19350-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 69.163.253.7
Subject: [Qemu-arm] [PATCH 0/2] Add ASPEED SCU device
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
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
	qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VgILwv1ABFH7

Hi all,

These are two patches implementing minimal functionality for the ASPEED S=
ystem
Control Unit device and integrating it into the AST2400 SoC model. The de=
vice is
critical for initialisation of u-boot and the kernel as it provides chip =
level
control registers, influencing the configuration of the software and the
software's configuration of the SoC.

Cheers,

Andrew

Andrew Jeffery (2):
  hw/misc: Add a model for the ASPEED System Control Unit
  ast2400: Integrate the SCU model and configure reset values

 hw/arm/ast2400.c             |  57 +++++++++++++++++
 hw/misc/Makefile.objs        |   1 +
 hw/misc/aspeed_scu.c         | 147 +++++++++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/ast2400.h     |   2 +
 include/hw/misc/aspeed_scu.h | 108 +++++++++++++++++++++++++++++++
 trace-events                 |   3 +
 6 files changed, 318 insertions(+)
 create mode 100644 hw/misc/aspeed_scu.c
 create mode 100644 include/hw/misc/aspeed_scu.h

--=20
2.7.4

