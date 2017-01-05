Received: by 10.25.205.13 with SMTP id d13csp9580970lfg;
        Wed, 4 Jan 2017 20:37:02 -0800 (PST)
X-Received: by 10.55.39.10 with SMTP id n10mr66937705qkn.103.1483591021961;
        Wed, 04 Jan 2017 20:37:01 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v35si2601855qtc.203.2017.01.04.20.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Jan 2017 20:37:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cOznP-0001ji-Dk
	for alex.bennee@linaro.org; Wed, 04 Jan 2017 23:36:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cOzmH-0001gb-Kr
	for qemu-devel@nongnu.org; Wed, 04 Jan 2017 23:35:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cOzmE-0001PX-44
	for qemu-devel@nongnu.org; Wed, 04 Jan 2017 23:35:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59644)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cOzmD-0001O9-QZ
	for qemu-devel@nongnu.org; Wed, 04 Jan 2017 23:35:46 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	v054Xi59016473
	for <qemu-devel@nongnu.org>; Wed, 4 Jan 2017 23:35:44 -0500
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
	by mx0a-001b2d01.pphosted.com with ESMTP id 27sa7ramgw-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Wed, 04 Jan 2017 23:35:44 -0500
Received: from localhost
	by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <alastair@au1.ibm.com>;
	Thu, 5 Jan 2017 14:35:41 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 5 Jan 2017 14:35:39 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 9257E2BB005F;
	Thu,  5 Jan 2017 15:35:38 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	v054Zcmw27131992; Thu, 5 Jan 2017 15:35:38 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	v054Zbe9030982; Thu, 5 Jan 2017 15:35:38 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	v054Zb4X030979; Thu, 5 Jan 2017 15:35:37 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4ED3DA01AB;
	Thu,  5 Jan 2017 15:35:37 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Date: Thu,  5 Jan 2017 15:34:23 +1100
X-Mailer: git-send-email 2.9.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17010504-0044-0000-0000-000002194707
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17010504-0045-0000-0000-0000064C781A
Message-Id: <20170105043430.3176-1-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-01-05_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1701050074
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-devel] [PATCH v5 0/7] Add support for the Epson RX8900 RTC to
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aMag3510qTLy

From: Alastair D'Silva <alastair@d-silva.org>

This patch series adds support for the Epson RX8900 RTC to the
Aspeed board.

The tests use the existing imx25 infrastructure, and some minor
changes have been made to uniquely identify the I2C buses.

Support for named interrupts has been implemented in qtest to
facilitate testing.

Changelog:
v5:
 - Use time functions for time manipulation (note: check-patch
   incorrectly reports an error on timercmp())
 - Refactor weekday validation
 - Defer time offset calculation until the I2C transaction is
   complete as partial updates can result in incorrect offsets
 - Cosmetic changes as requested by Adrew Jeffery
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

Alastair D'Silva (7):
  arm: Uniquely name imx25 I2C buses.
  qtest: Support named interrupts
  qtest: Support setting named GPIOs
  qtest: Fix whitespace
  hw/timer: Add Epson RX8900 RTC support
  tests: Test all implemented RX8900 functionality
  arm: Add an RX8900 RTC to the ASpeed board

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 |  29 ++
 hw/arm/imx25_pdk.c              |   2 +-
 hw/core/irq.c                   |  18 +-
 hw/i2c/imx_i2c.c                |   2 +-
 hw/timer/Makefile.objs          |   2 +
 hw/timer/rx8900.c               | 914 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/rx8900_regs.h          | 141 +++++++
 hw/timer/trace-events           |  31 ++
 include/hw/irq.h                |  13 +-
 qtest.c                         | 103 +++--
 tests/Makefile.include          |   2 +
 tests/libqtest.c                |  85 +++-
 tests/libqtest.h                |  59 +++
 tests/rx8900-test.c             | 880 ++++++++++++++++++++++++++++++++++++++
 15 files changed, 2241 insertions(+), 41 deletions(-)
 create mode 100644 hw/timer/rx8900.c
 create mode 100644 hw/timer/rx8900_regs.h
 create mode 100644 tests/rx8900-test.c

-- 
2.9.3

