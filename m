Received: by 10.103.86.15 with SMTP id k15csp535731vsb;
        Wed, 14 Dec 2016 21:51:08 -0800 (PST)
X-Received: by 10.55.148.70 with SMTP id w67mr460765qkd.27.1481781068817;
        Wed, 14 Dec 2016 21:51:08 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q64si242767qtd.99.2016.12.14.21.51.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Dec 2016 21:51:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cHOwc-0001hU-AS
	for alex.bennee@linaro.org; Thu, 15 Dec 2016 00:51:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cHOuj-0006rL-NE
	for qemu-devel@nongnu.org; Thu, 15 Dec 2016 00:49:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cHOug-0003FC-6p
	for qemu-devel@nongnu.org; Thu, 15 Dec 2016 00:49:09 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60369
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cHOug-0003Ef-0s
	for qemu-devel@nongnu.org; Thu, 15 Dec 2016 00:49:06 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uBF5mimH073713
	for <qemu-devel@nongnu.org>; Thu, 15 Dec 2016 00:49:05 -0500
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
	by mx0b-001b2d01.pphosted.com with ESMTP id 27bdmesvrm-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Thu, 15 Dec 2016 00:49:05 -0500
Received: from localhost
	by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <alastair@au1.ibm.com>;
	Thu, 15 Dec 2016 15:49:02 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 15 Dec 2016 15:48:59 +1000
Received: from d23relay08.au.ibm.com (d23relay08.au.ibm.com [9.185.71.33])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id BFE3B2BB0062;
	Thu, 15 Dec 2016 16:48:58 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
	by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uBF5mxZg29294766; Thu, 15 Dec 2016 16:48:59 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uBF5mvIN011202; Thu, 15 Dec 2016 16:48:58 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uBF5mvuj011195; Thu, 15 Dec 2016 16:48:57 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8067CA0138;
	Thu, 15 Dec 2016 16:48:57 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Thu, 15 Dec 2016 16:48:04 +1100
X-Mailer: git-send-email 2.9.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16121505-0012-0000-0000-000001F79E9F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16121505-0013-0000-0000-000006A30738
Message-Id: <20161215054812.12602-1-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-15_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1612150093
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-devel] [PATCH v4 0/8] Add support for the Epson RX8900 RTC to
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
X-TUID: XU1Li9q8AcNG

From: Alastair D'Silva <alastair@d-silva.org>

This patch series adds support for the Epson RX8900 RTC to the
Aspeed board.

The tests use the existing imx25 infrastructure, and some minor
changes have been made to uniquely identify the I2C buses.

Support for named interrupts has been implemented in qtest to
facilitate testing.

Changelog:
v4:
 - Split overloaded patches
 - Fix spelling of Celsius
 - Remove degrees sign from messages
 - Don't force float precision
 - Reformat named interrupt qtest protocol for consistency
 - Minor formatting changes
 - Don't connect the RX8900 INT line to NVIC:22, it should be
   connected to GPIOJ10 on the ASPEED SOC
v3:
 - Add range checks for time components
 - Shorten trace messages
 - Use qemu generated i2c bus names
 - Address style comments from Alexey for rx8900 driver
 - Fix long lines in qtest harness
 - Remove trailing whitespace in hw/arm/pxa
 - Remove stray headers from rx8900 driver
 - Support low voltage detection in rx8900 driver
v2:
 - Avoid using error_report
 - Fix TIE behaviour
 - Move temperature init out of reset, it should not change
   on a soft reset
 - Fix IRQ in test failures
 - Add a NULL check for i2c slave init callbacks, so that we
   no longer need to implement empty init functions.
 - Refactor to use the existing qemu trace infrastructure
 - Move the RX8900 definition into the aspeed machine init
 - It it possible for check_update_interrupt_seconds in the
   rx8900 test to return 6, depending on the alignment with
   the wall clock.
 - Support low voltage detection

Alastair D'Silva (8):
  arm: Uniquely name imx25 I2C buses.
  qtest: Support named interrupts
  qtest: Support setting named GPIOs
  qtest: Fix whitespace
  hw/i2c: Tidy up NULL check for i2c slave init callbacks
  hw/timer: Add Epson RX8900 RTC support
  tests: Test all implemented RX8900 functionality
  arm: Add an RX8900 RTC to the ASpeed board

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 |  29 ++
 hw/arm/imx25_pdk.c              |   2 +-
 hw/core/irq.c                   |  18 +-
 hw/i2c/core.c                   |   4 +-
 hw/i2c/imx_i2c.c                |   2 +-
 hw/timer/Makefile.objs          |   2 +
 hw/timer/rx8900.c               | 912 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/rx8900_regs.h          | 141 +++++++
 hw/timer/trace-events           |  31 ++
 include/hw/irq.h                |  13 +-
 qtest.c                         | 103 +++--
 tests/Makefile.include          |   2 +
 tests/libqtest.c                |  85 +++-
 tests/libqtest.h                |  59 +++
 tests/rx8900-test.c             | 882 ++++++++++++++++++++++++++++++++++++++
 16 files changed, 2243 insertions(+), 43 deletions(-)
 create mode 100644 hw/timer/rx8900.c
 create mode 100644 hw/timer/rx8900_regs.h
 create mode 100644 tests/rx8900-test.c

-- 
2.9.3

