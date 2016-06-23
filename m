Received: by 10.25.21.96 with SMTP id l93csp289384lfi;
        Wed, 22 Jun 2016 19:16:41 -0700 (PDT)
X-Received: by 10.55.103.84 with SMTP id b81mr18307115qkc.177.1466648201643;
        Wed, 22 Jun 2016 19:16:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n17si3319824qke.27.2016.06.22.19.16.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 19:16:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33909 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFuC9-0003Hl-35
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 22:16:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bFuC5-0003HV-ST
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 22:16:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bFuBz-00072o-SL
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 22:16:36 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:53240)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bFuBx-000708-De; Wed, 22 Jun 2016 22:16:31 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.nyi.internal (Postfix) with ESMTP id 42874A9B;
	Wed, 22 Jun 2016 22:16:11 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 22 Jun 2016 22:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:message-id:subject:to:x-sasl-enc:x-sasl-enc; s=
	mesmtp; bh=D4z+hWMtJ1qS1ZNuYn1jzpFvvoQ=; b=RPyXT7Tl7BvKKh9RFLruy
	3BHtR6jjdsCZZR5N4EPgMnpRiDG8QjJv0e4RdiT2Q2iFNR06VLF7xd+5pezDT/uJ
	rENd1GjlyC3tFuX0RSkRWGMFYOkydhY/YwpCbhht0aHOcwoXlWqOg5u0PIfYC+mN
	mUNEs5GXehVWy1BVSl2wGg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=D4z+hWMtJ1qS1ZNuYn1jzpFvvo
	Q=; b=G5HluEpCBjf6XQMptckNNXj7tf7i2TV2zhBgVN+zygPE1Lqh9qLYbHu7Xq
	XSeDxCKlQhBSsfM2SfhcQ6s8KS6nRkbOeKgOwsDmfHTRlaVeIv6zA92GuEYWMWxn
	CBghwwKvdtH2/8eUG37vgXGv1qf6RFH0c7qmdkmvt8NSFlYmA=
X-Sasl-enc: b8IA7nH42Nill/hp0TH+cOHPddXB7qZa6XJHlWZd9CxO 1466648170
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id 07D8CF29FA;
	Wed, 22 Jun 2016 22:16:07 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 11:45:12 +0930
Message-Id: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: [Qemu-arm] [PATCH v2 0/3] Add ASPEED SCU device
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
X-TUID: i93Vpjh1Uazb

Hi all,

These are three patches implementing minimal functionality for the ASPEED System
Control Unit device and integrating it into the AST2400 SoC model/palmetto-bmc
machine. The device is critical for initialisation of u-boot and the kernel as
it provides chip level control registers, influencing the configuration of the
software and the software's configuration of the SoC.

Since v1:

* Select reset values based on silicon ID
* Expose hardware strapping values via properties

Cheers,

Andrew

Andrew Jeffery (3):
  hw/misc: Add a model for the ASPEED System Control Unit
  ast2400: Integrate the SCU model and set silicon revision
  palmetto-bmc: Configure the SCU's hardware strapping register

 hw/arm/ast2400.c             |  17 +++
 hw/arm/palmetto-bmc.c        |   2 +
 hw/misc/Makefile.objs        |   1 +
 hw/misc/aspeed_scu.c         | 258 +++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/ast2400.h     |   2 +
 include/hw/misc/aspeed_scu.h |  34 ++++++
 trace-events                 |   3 +
 7 files changed, 317 insertions(+)
 create mode 100644 hw/misc/aspeed_scu.c
 create mode 100644 include/hw/misc/aspeed_scu.h

-- 
2.7.4

