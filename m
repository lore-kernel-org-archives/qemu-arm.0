Received: by 10.25.150.194 with SMTP id y185csp727310lfd;
        Thu, 17 Nov 2016 06:38:35 -0800 (PST)
X-Received: by 10.28.141.143 with SMTP id p137mr4385010wmd.5.1479393515514;
        Thu, 17 Nov 2016 06:38:35 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f1si3064329wjl.229.2016.11.17.06.38.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Nov 2016 06:38:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c7Npi-0007iZ-EA
	for alex.bennee@linaro.org; Thu, 17 Nov 2016 09:38:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46468)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1c7ERy-0003pQ-2S
	for qemu-devel@nongnu.org; Wed, 16 Nov 2016 23:37:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1c7ERv-0003ae-05
	for qemu-devel@nongnu.org; Wed, 16 Nov 2016 23:37:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50138
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1c7ERu-0003Zu-Rq
	for qemu-devel@nongnu.org; Wed, 16 Nov 2016 23:37:22 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uAH4Zi9U009911
	for <qemu-devel@nongnu.org>; Wed, 16 Nov 2016 23:37:21 -0500
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
	by mx0a-001b2d01.pphosted.com with ESMTP id 26s39gn817-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Wed, 16 Nov 2016 23:37:21 -0500
Received: from localhost
	by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <alastair@au1.ibm.com>;
	Thu, 17 Nov 2016 14:37:18 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
	by e23smtp01.au.ibm.com (202.81.31.207) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 17 Nov 2016 14:37:15 +1000
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
	by d23dlp03.au.ibm.com (Postfix) with ESMTP id 2605B3578058;
	Thu, 17 Nov 2016 15:37:15 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uAH4bERC54329528; Thu, 17 Nov 2016 15:37:14 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uAH4bECQ028227; Thu, 17 Nov 2016 15:37:14 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uAH4bEuq028224; Thu, 17 Nov 2016 15:37:14 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C830CA010A;
	Thu, 17 Nov 2016 15:37:13 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Thu, 17 Nov 2016 15:36:36 +1100
X-Mailer: git-send-email 2.7.4
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16111704-1617-0000-0000-0000017E2254
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16111704-1618-0000-0000-000047288125
Message-Id: <1479357400-17441-1-git-send-email-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-17_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611170085
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
X-Mailman-Approved-At: Thu, 17 Nov 2016 09:36:32 -0500
Subject: [Qemu-devel] [PATCH 0/4] Add support for the Epson RX8900 RTC to
 the aspeed board
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /FsHMMVW/yPc

From: Alastair D'Silva <alastair@d-silva.org>

This patch series adds support for the Epson RX8900 RTC to the
Aspeed board.

The tests use the existing imx25 infrastructure, and some minor
changes have been made to uniquely identify the I2C buses.

Support for named interrupts has been implemented in qtest to
facilitate testing.

Alastair D'Silva (4):
  arm: Uniquely name imx25 I2C buses.
  qtest: Support named interrupts
  hw/timer: Add Epson RX8900 RTC support
  arm: Add an RX8900 RTC to the ASpeed board

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 |   8 +
 hw/arm/imx25_pdk.c              |   2 +-
 hw/i2c/imx_i2c.c                |   6 +-
 hw/timer/Makefile.objs          |   2 +
 hw/timer/rx8900.c               | 891 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/rx8900_regs.h          | 125 ++++++
 qtest.c                         |  98 +++--
 tests/Makefile.include          |   2 +
 tests/libqtest.c                |  87 +++-
 tests/libqtest.h                |  59 +++
 tests/rx8900-test.c             | 800 ++++++++++++++++++++++++++++++++++++
 12 files changed, 2051 insertions(+), 30 deletions(-)
 create mode 100644 hw/timer/rx8900.c
 create mode 100644 hw/timer/rx8900_regs.h
 create mode 100644 tests/rx8900-test.c

-- 
2.7.4

