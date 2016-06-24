Received: by 10.25.21.96 with SMTP id l93csp858303lfi;
        Thu, 23 Jun 2016 21:59:39 -0700 (PDT)
X-Received: by 10.237.35.92 with SMTP id i28mr2280185qtc.85.1466744379404;
        Thu, 23 Jun 2016 21:59:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q29si3575089qkl.95.2016.06.23.21.59.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 21:59:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGJDO-0003vA-TP
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 00:59:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43308)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bGJDJ-0003rm-M4
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 00:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bGJDD-0001RV-Nm
	for qemu-arm@nongnu.org; Fri, 24 Jun 2016 00:59:32 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:45218)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bGJDB-0001Nl-C2; Fri, 24 Jun 2016 00:59:27 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 9C9BAB0E;
	Fri, 24 Jun 2016 00:59:12 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Fri, 24 Jun 2016 00:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=CaP
	cena624ZDYW7ERt2vRMZFnjg=; b=NW4Nw/eiwCTnFGRhea3h/ibzDxU/H25u9bH
	xk/TJjTCOp3etgCLd2FVusYWfGn3vdkwg80B10/Iu3wvntcw+t70UdLMDUaLvvpa
	+quWggVm9SB0//sKmQ6yF47W1Lhzj6Ix8Kgw/jG7j2CNQu9QiPJXz5zFwyA6F6T1
	fPqxb6kk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=CaPcena624ZDYW7ERt2vRMZFnjg=; b=mp8vQ
	qj1sOECTLTQC2R5EOcT0Whrw03PvuUo8xQ6OnGXS3Rtg3i6GweVvH0eFBdHN6uDl
	Jdkq9zJhz33AR830AsKSvmEYNBKOG+5gW4pT4r40XmbTe74lxKtj5KZHwG9MNrPh
	ZtwpVbpGA0EgutLRGqDsghz5zlx14sjOxXh0Dw=
X-Sasl-enc: 5gXjmHgMXhghzGoje1b1+B5KAd0e1alDkmQrzcF1yY+P 1466744350
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id DC07FF29F7;
	Fri, 24 Jun 2016 00:59:07 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 14:28:22 +0930
Message-Id: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: [Qemu-arm] [PATCH v3 0/3] Add ASPEED SCU device
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
X-TUID: bXr3Xh0vdISX

Hi all,

These are three patches implementing minimal functionality for the ASPEED System
Control Unit device and integrating it into the AST2400 SoC model/palmetto-bmc
machine. The device is critical for initialisation of u-boot and the kernel as
it provides chip level control registers, influencing the configuration of the
software and the software's configuration of the SoC.

Since v2:

* Fix mixing of offsets and register indexes
* Sanity check device property values
* SoC actually initialises the silicon revision

Since v1:

* Select reset values based on silicon revision
* Expose hardware strapping values via properties

Andrew Jeffery (3):
  hw/misc: Add a model for the ASPEED System Control Unit
  ast2400: Integrate the SCU model and set silicon revision
  palmetto-bmc: Configure the SCU's hardware strapping register

 hw/arm/ast2400.c             |  21 ++++
 hw/arm/palmetto-bmc.c        |   2 +
 hw/misc/Makefile.objs        |   1 +
 hw/misc/aspeed_scu.c         | 284 +++++++++++++++++++++++++++++++++++++++++++
 hw/misc/trace-events         |   3 +
 include/hw/arm/ast2400.h     |   2 +
 include/hw/misc/aspeed_scu.h |  34 ++++++
 7 files changed, 347 insertions(+)
 create mode 100644 hw/misc/aspeed_scu.c
 create mode 100644 include/hw/misc/aspeed_scu.h

-- 
2.7.4

