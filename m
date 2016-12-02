Received: by 10.25.159.131 with SMTP id i125csp94127lfe;
        Thu, 1 Dec 2016 21:47:14 -0800 (PST)
X-Received: by 10.200.55.69 with SMTP id p5mr42018987qtb.67.1480657632892;
        Thu, 01 Dec 2016 21:47:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 66si2152162qkt.189.2016.12.01.21.47.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Dec 2016 21:47:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60766 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCggh-0006cE-NL
	for alex.bennee@linaro.org; Fri, 02 Dec 2016 00:47:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cCgge-0006c3-3y
	for qemu-arm@nongnu.org; Fri, 02 Dec 2016 00:47:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cCgga-0001K5-Te
	for qemu-arm@nongnu.org; Fri, 02 Dec 2016 00:47:08 -0500
Received: from 001b2d01.pphosted.com ([148.163.156.1]:41102
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cCgga-0001I2-KI
	for qemu-arm@nongnu.org; Fri, 02 Dec 2016 00:47:04 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uB25hElV015182
	for <qemu-arm@nongnu.org>; Fri, 2 Dec 2016 00:47:02 -0500
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
	by mx0a-001b2d01.pphosted.com with ESMTP id 272yvcvhb4-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Fri, 02 Dec 2016 00:47:02 -0500
Received: from localhost
	by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Fri, 2 Dec 2016 15:47:00 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 2 Dec 2016 15:46:58 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 25F552BB0057;
	Fri,  2 Dec 2016 16:46:58 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
	by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uB25kw9631260778; Fri, 2 Dec 2016 16:46:58 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uB25kvLD012334; Fri, 2 Dec 2016 16:46:57 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uB25kvZ2012324; Fri, 2 Dec 2016 16:46:57 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B74F0A01FA;
	Fri,  2 Dec 2016 16:46:56 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Fri,  2 Dec 2016 16:46:10 +1100
X-Mailer: git-send-email 2.9.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16120205-0012-0000-0000-000001F28F9C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16120205-0013-0000-0000-0000068F184B
Message-Id: <20161202054617.6749-1-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-02_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1612020099
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-arm] [PATCH v3 0/7] Add support for the Epson RX8900 RTC to
 the aspeed board
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
X-TUID: fI40Jns4iJgI

From: Alastair D'Silva <alastair@d-silva.org>

This patch series adds support for the Epson RX8900 RTC to the
Aspeed board.

The tests use the existing imx25 infrastructure, and some minor
changes have been made to uniquely identify the I2C buses.

A NULL check have been added to eliminate empty i2cslave init
functions.

Support for named interrupts has been implemented in qtest to
facilitate testing.

Changelog:
v3:
 - Add a table to Aspeed for i2c devices
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
  hw/arm: remove trailing whitespace
  hw/i2c: Add a NULL check for i2c slave init callbacks
  qtest: Support named interrupts
  hw/timer: Add Epson RX8900 RTC support
  tests: Test all implemented RX8900 functionality
  arm: Add an RX8900 RTC to the ASpeed board

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 |  58 ++-
 hw/arm/imx25_pdk.c              |   4 +-
 hw/arm/pxa2xx.c                 |   9 +-
 hw/arm/tosa.c                   |   7 -
 hw/arm/z2.c                     |   7 -
 hw/core/irq.c                   |  18 +-
 hw/i2c/core.c                   |   6 +-
 hw/i2c/imx_i2c.c                |   2 +-
 hw/timer/Makefile.objs          |   2 +
 hw/timer/ds1338.c               |   6 -
 hw/timer/rx8900.c               | 912 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/rx8900_regs.h          | 141 +++++++
 hw/timer/trace-events           |  31 ++
 include/hw/irq.h                |  13 +-
 qtest.c                         | 102 +++--
 tests/Makefile.include          |   2 +
 tests/libqtest.c                |  88 +++-
 tests/libqtest.h                |  59 +++
 tests/rx8900-test.c             | 882 ++++++++++++++++++++++++++++++++++++++
 20 files changed, 2276 insertions(+), 74 deletions(-)
 create mode 100644 hw/timer/rx8900.c
 create mode 100644 hw/timer/rx8900_regs.h
 create mode 100644 tests/rx8900-test.c

-- 
2.9.3

