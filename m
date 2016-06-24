Received: by 10.25.21.96 with SMTP id l93csp859849lfi;
        Thu, 23 Jun 2016 22:03:46 -0700 (PDT)
X-Received: by 10.200.38.120 with SMTP id v53mr2368091qtv.90.1466744626750;
        Thu, 23 Jun 2016 22:03:46 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d189si3590312qkb.84.2016.06.23.22.03.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 22:03:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au;
       dkim=fail header.i=@messagingengine.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bGJHO-0000mM-5n
	for alex.bennee@linaro.org; Fri, 24 Jun 2016 01:03:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bGJDp-0004db-Is
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 01:00:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1bGJDk-0001ZD-Oy
	for qemu-devel@nongnu.org; Fri, 24 Jun 2016 01:00:05 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:36644)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>)
	id 1bGJDh-0001WX-5b; Fri, 24 Jun 2016 00:59:57 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id DD164C29;
	Fri, 24 Jun 2016 00:59:47 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Fri, 24 Jun 2016 00:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=mesmtp; bh=bBcphXdIkf/4zzLYWu5+qh0w3pE=; b=aWYBUN
	XeBhh+w04y3Y3EQk5Ugl4LFzI03SIwohaf4+k7IpCbL2A3pjI191YVWPcqnxWVUr
	EDBKSQPLFBE4AAwUyIj14hWlX6+3NZjFYOdfBDqfMkl08nnmjxJYrccQGFkEyNoM
	2RU75yRC1k7oUJRS/WNz1xIteuFrhgI0f/1Vk=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=bBcphXdIkf/4zzL
	YWu5+qh0w3pE=; b=a4PrGkI4cu+b8yPm3sf5xsxkWN1HcEn2YqRJczc/taZwxan
	19K6leYHopZFMQk48rgawsku+8Y6nhmjdtsmU+tvNiY/Xfe82EncvCIjS5NNndMt
	MyIMJ7RzPDx7coZ7bNcarYvIevXEZ3I190UNnrBhOoCrTFtyY1DQmkJ4KTZE=
X-Sasl-enc: p7gFju+mBCgoxJ1YzKT0zkzbL/Bc7tJnoSDmR4san6m/ 1466744386
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
	[203.122.213.247])
	by mail.messagingengine.com (Postfix) with ESMTPA id C2C6AF29EE;
	Fri, 24 Jun 2016 00:59:43 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2016 14:28:25 +0930
Message-Id: <1466744305-23163-4-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
References: <1466744305-23163-1-git-send-email-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.221
Subject: [Qemu-devel] [PATCH v3 3/3] palmetto-bmc: Configure the SCU's
 hardware strapping register
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
Cc: qemu-devel@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
	qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 25kJtYmMCnc+

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
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

