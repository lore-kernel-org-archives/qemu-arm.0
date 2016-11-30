Received: by 10.25.159.131 with SMTP id i125csp113990lfe;
        Tue, 29 Nov 2016 21:37:31 -0800 (PST)
X-Received: by 10.55.64.69 with SMTP id n66mr26408008qka.20.1480484251482;
        Tue, 29 Nov 2016 21:37:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o22si29403118qta.236.2016.11.29.21.37.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 21:37:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBxaE-0000gg-Rq
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 00:37:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cBxZx-0000RY-Bd
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cBxZu-0005MT-9k
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:13 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33590)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cBxZt-0005Ln-Ue
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:10 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uAU5Y4ro051573
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 00:37:08 -0500
Received: from e23smtp03.au.ibm.com (e23smtp03.au.ibm.com [202.81.31.145])
	by mx0a-001b2d01.pphosted.com with ESMTP id 271qjedw6u-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 00:37:08 -0500
Received: from localhost
	by e23smtp03.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Wed, 30 Nov 2016 15:37:06 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp03.au.ibm.com (202.81.31.209) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 30 Nov 2016 15:37:03 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id C768D2CE8054;
	Wed, 30 Nov 2016 16:37:02 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
	by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uAU5b2ts6685068; Wed, 30 Nov 2016 16:37:02 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uAU5b1i6003430; Wed, 30 Nov 2016 16:37:02 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uAU5b14L003427; Wed, 30 Nov 2016 16:37:01 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2AC4EA038A;
	Wed, 30 Nov 2016 16:37:01 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Wed, 30 Nov 2016 16:36:29 +1100
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161130053629.23340-1-alastair@au1.ibm.com>
References: <20161130053629.23340-1-alastair@au1.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16113005-0008-0000-0000-000000EB8EFC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16113005-0009-0000-0000-0000089C4FD4
Message-Id: <20161130053629.23340-7-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611300092
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-arm] [PATCH v2 6/6] arm: Add an RX8900 RTC to the ASpeed board
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b9zdx3xH8okH

From: Alastair D'Silva <alastair@d-silva.org>

Connect an RX8900 RTC to i2c12 of the AST2500 SOC at address 0x32

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 hw/arm/aspeed.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c7206fd..8de95f2 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -166,7 +166,19 @@ static const TypeInfo palmetto_bmc_type = {
 
 static void ast2500_evb_init(MachineState *machine)
 {
+    AspeedSoCState *soc;
+    I2CBus *i2c12;
+    DeviceState *rx8900;
+
     aspeed_board_init(machine, &aspeed_boards[AST2500_EVB]);
+
+    soc = ASPEED_SOC(object_resolve_path_component(OBJECT(machine), "soc"));
+
+    i2c12 = aspeed_i2c_get_bus((DeviceState *)&soc->i2c, 11);
+    rx8900 = i2c_create_slave(i2c12, "rx8900", 0x32);
+
+    qdev_connect_gpio_out_named(rx8900, "rx8900-interrupt-out", 0,
+            qdev_get_gpio_in(DEVICE(&soc->vic), 22));
 }
 
 static void ast2500_evb_class_init(ObjectClass *oc, void *data)
-- 
2.9.3

