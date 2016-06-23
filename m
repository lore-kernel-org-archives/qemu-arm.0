Received: by 10.25.21.96 with SMTP id l93csp289405lfi;
        Wed, 22 Jun 2016 19:16:46 -0700 (PDT)
X-Received: by 10.55.140.69 with SMTP id o66mr42885409qkd.143.1466648206022;
        Wed, 22 Jun 2016 19:16:46 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b93si3155411qtd.113.2016.06.22.19.16.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 19:16:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFuCD-0003Js-DJ
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 22:16:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bFuC8-0003Hc-BC
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 22:16:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bFuC1-00073F-Bc
	for qemu-arm@nongnu.org; Wed, 22 Jun 2016 22:16:39 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:60450)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bFuBz-000729-2Q; Wed, 22 Jun 2016 22:16:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id D109FAE3;
	Wed, 22 Jun 2016 22:16:24 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Wed, 22 Jun 2016 22:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:date:from:in-reply-to:message-id:references:subject:to
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=z9cw7IJw5lH2XFUUARCQz7Q9SVI
	=; b=A9Xf+rA8z7XTMxTsK53iBbKMONLC58Tmc9vj2aPyS+26E+pkuPkkD8fSqZz
	K/Cqt2q+pQYMVIDei4gptVpN83RYLnR/DnwAQxVv/egqHddVvDQ3aPFpF6TqiMmp
	4x24QdB9H2sXKgfzxMFoF6jkCdeCerx6WhTu77+D4eTfG624=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=z9cw
	7IJw5lH2XFUUARCQz7Q9SVI=; b=GhZgvq3o+NsBkIdPvBLMqAyauGDqxoTlaM8X
	SM88JKu/yUhUx7Ceu9+fLVtw1HYuAPeT28X4tdv6M04XUERrt/RHEt8lh5gHiLYj
	zfvNI3nnuICCceLvcAbqmOutihbjTrTpXQbeNl42GFV+vIjV96AvBlAbs7rHcaap
	FfuHzAg=
X-Sasl-enc: OEQN+xugO21H15Z9/trBjFF1aJ8A5Dbf/bn5bLun0vgs 1466648183
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id 52868F29FC;
	Wed, 22 Jun 2016 22:16:20 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 11:45:15 +0930
Message-Id: <1466648115-17015-4-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
References: <1466648115-17015-1-git-send-email-andrew@aj.id.au>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: [Qemu-arm] [PATCH v2 3/3] palmetto-bmc: Configure the SCU's
 hardware strapping register
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
X-TUID: Kji0zuHfFTuS

The magic constant configures the following options:

* 28:27: Configure DRAM size as 256MB
* 26:24: DDR3 SDRAM with CL = 6, CWL = 5
* 23: Configure 24/48MHz CLKIN
* 22: Disable GPIOE pass-through mode
* 21: Disable GPIOD pass-through mode
* 20: Enable LPC decode of SuperIO 0x2E/0x4E addresses
* 19: Disable ACPI
* 18: Configure 48MHz CLKIN
* 17: Disable BMC 2nd boot watchdog timer
* 16: Decode SuperIO address 0x2E
* 15: VGA Class Code
* 14: Enable LPC dedicated reset pin
* 13:12: Enable SPI Master and SPI Slave to AHB Bridge
* 11:10: Select CPU:AHB ratio = 2:1
* 9:8: Select 384MHz H-PLL
* 7: Configure MAC#2 for RMII/NCSI
* 6: Configure MAC#1 for RMII/NCSI
* 5: No VGA BIOS ROM
* 4: Boot using 32bit SPI address mode
* 3:2: Select 16MB VGA memory
* 1:0: Boot from SPI flash memory

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/arm/palmetto-bmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
index a51d960510ee..b8eed21348d8 100644
--- a/hw/arm/palmetto-bmc.c
+++ b/hw/arm/palmetto-bmc.c
@@ -44,6 +44,8 @@ static void palmetto_bmc_init(MachineState *machine)
                                 &bmc->ram);
     object_property_add_const_link(OBJECT(&bmc->soc), "ram", OBJECT(&bmc->ram),
                                    &error_abort);
+    object_property_set_int(OBJECT(&bmc->soc), 0x120CE416, "hw-strap1",
+                            &error_abort);
     object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
                              &error_abort);
 
-- 
2.7.4

