Received: by 10.103.124.15 with SMTP id x15csp523222vsc;
        Fri, 19 May 2017 17:27:51 -0700 (PDT)
X-Received: by 10.55.169.193 with SMTP id s184mr11002774qke.118.1495240071008;
        Fri, 19 May 2017 17:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495240071; cv=none;
        d=google.com; s=arc-20160816;
        b=RDxNuaxy1exgDQCUAXf+YwfbZcCaP5IT1nuHBlQ7LCJANHIaItnr+n7Qdpt+uaGMbf
         BV3drL8TTpp0yf5+a3ooyjidoHjQzWCVJgoreTsDviUTWQfxvtnmBgkPtTMpV8jwdlP5
         PVgH/WnWkTHw+0ZCpBvlHz2ge5EJ+G8lLgdLIGGuh51OIJ/f77VJy7UXVUZRR+Ggd7DG
         IYYNnZOpjZbX8g4d8lV6gPyTQceKCjTOl9OhUgLtjqolXenQNw/hOkCpU9T6JDUxu81i
         llp12wq6HGRzf4VN8siy9bGFa6I3zTH+DkN4WglPVozu+wKFDPBBNvu4t+mk8k9zRVM0
         WPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=0ACV8jdnWDm+hHfq7xhTj2kXHbSkwrlTtv1KPUsD/vk=;
        b=fwxECoKB7GLs1+qPvnBi+aFhEvUDhkvCnmSSnYsuL0Klog332l9m1G/Z/5HZ4/HwMQ
         k8m/kpVGTZF0LwgK1VK1SBWakmfyhlm6N0n+EVYxnfyAYHZ6PzIr8YvmtNd/z8UTKAuO
         +vTE4t0L2KtMMu1peqH9MAuE0GIRw1M/4yPn2oukTkKAH7aomML+jjXYQlTqcqrUVlya
         /IkeuDWx9Gs4KyAY6xH1+1NsaQDb+5M7AshFtEQHXQQayyxAR6b9VFjpcCNsRQA84HYt
         DNqwqGkZDzHCm6WV79UXa+jeGYuI9F8ePjr5fbb1kaAXPWZNfGFlubCwoauPzj+N9e1p
         D0XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k65si10098372qte.111.2017.05.19.17.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 May 2017 17:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBsFK-000499-Jl
	for alex.bennee@linaro.org; Fri, 19 May 2017 20:27:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dBsFD-00048r-V1
	for qemu-arm@nongnu.org; Fri, 19 May 2017 20:27:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dBsFA-0001Yf-RP
	for qemu-arm@nongnu.org; Fri, 19 May 2017 20:27:43 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59125)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dBsFA-0001X6-Hz; Fri, 19 May 2017 20:27:40 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 99CBB207D8;
	Fri, 19 May 2017 20:27:38 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Fri, 19 May 2017 20:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc:x-sasl-enc; s=fm1; bh=0ACV8jdnWDm+hHfq7xhTj2kXHbSkwr
	lTtv1KPUsD/vk=; b=blb5GJqWiFrzKRPZ+5WF3EIadg7mKa/Q+UwdVcmv7nGgMg
	N4mBgBwJjOIzKltXsuy0rrKTuDlvxAupqzynmF3LKlishjst1MW4Hr6Q6d69LEbL
	fqTnOV5oHxYZXRN17g3q5rwy8UcVLu+ohAq7EvLvZKeZ3/276cc1uCOWzlubHsUM
	FJfraSru1cMzJKIMIrruRbdjPiO4SUvVV5KwC/HVJRuYlJEVSJkn+KuoJSLvczy3
	0QdeM6L/AO/aO2II0WPW47GlB+QKDE189Ypc2eZcBnIXXxD3ppwlcmPdMD1iwhnX
	6AfTaY84W8/jSqzD9z0XXP0eGEgUdOLKmCdIwq5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=0ACV8j
	dnWDm+hHfq7xhTj2kXHbSkwrlTtv1KPUsD/vk=; b=msKimy4yIBuiS41Gc26b3i
	JBegC2B/1bJy4+vH6S7b2BzjEhwJhAP53U5bz0OLfqQeKl8rOm+gRLjGceKMIJNw
	yvdZiMqn82Kbv9vNoN2ARW9gSnT+tNgzSwbvhGZ+d9po9OC7BrJX1MGa8U+3yiZM
	/fogt9wlJ4sxQvSFAlIvUoLipZoZv4oJyL/IgjxemAKKw+d1zAjqX4/6Xfm3Ew12
	+RYvFLcaqMbriE11es8xblFRbUbeyLL2ib1w2ntUy9feq1Gj2qjyMySXqfmxDNbN
	78qKJMr2B59kN81oeSNoU7vPwIcYVrsF9yzI8vzvgEvu4J7QXKqoTA8WKqdeY12g
	==
X-ME-Sender: <xms:eo0fWXVishbp62t4yr7FlbB0osKuOv0eZpmwDHq7izRHOAGjEFncwg>
X-Sasl-enc: syU65ZysGI2MUTyiPDHi7XtGk3fEad2V6HSnBgmlvpvy 1495240057
Received: from keelia.au.ibm.com (unknown [202.90.207.97])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2A1C9241E3;
	Fri, 19 May 2017 20:27:31 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Date: Sat, 20 May 2017 08:26:51 +0800
Message-Id: <20170520002653.20213-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [PATCH 0/2] hw/adc: Implement a basic Aspeed ADC model
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8NswrbYTsUKN

Hello,

This short series introduces a basic model for the Aspeed ADC and glues it into
the generic Aspeed SoC definition. The register interface is enhanced slightly
from the AST2400 to the AST2500, but in a backwards-compatible way by making
use of reserved bits. As such I haven't made any effort to differentiate the
two.

The addition of a basic ADC model allows the Aspeed SDK kernel to boot under
QEMU's ast2500-evb machine. The upstream kernel driver doesn't test the
initialisation bit before completing its probe(), and thus doesn't get stuck if
the bit is not set. This is in contrast to the SDK kernel which spins on the
initialisation bit, never making forward progress in the absence of the ADC
model.

Tested with both Aspeed's SDK kernel and upstream Linux.

Cheers,

Andrew

Andrew Jeffery (2):
  hw/adc: Add basic Aspeed ADC model
  hw/arm: Integrate ADC model into Aspeed SoC

 hw/adc/Makefile.objs        |   1 +
 hw/adc/aspeed_adc.c         | 246 ++++++++++++++++++++++++++++++++++++++++++++
 hw/arm/aspeed_soc.c         |  15 +++
 include/hw/adc/aspeed_adc.h |  33 ++++++
 include/hw/arm/aspeed_soc.h |   2 +
 5 files changed, 297 insertions(+)
 create mode 100644 hw/adc/aspeed_adc.c
 create mode 100644 include/hw/adc/aspeed_adc.h

-- 
2.9.3

