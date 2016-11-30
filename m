Received: by 10.25.159.131 with SMTP id i125csp113923lfe;
        Tue, 29 Nov 2016 21:37:18 -0800 (PST)
X-Received: by 10.55.77.134 with SMTP id a128mr31581261qkb.157.1480484237959;
        Tue, 29 Nov 2016 21:37:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e92si29337510qtd.141.2016.11.29.21.37.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 21:37:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBxa1-0000QU-7b
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 00:37:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cBxZt-0000QD-38
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cBxZp-0005JK-VP
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:09 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54921)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cBxZp-0005IV-M8
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:05 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uAU5Y6wd032926
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 00:37:03 -0500
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
	by mx0a-001b2d01.pphosted.com with ESMTP id 271r8j2h4h-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 00:37:03 -0500
Received: from localhost
	by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Wed, 30 Nov 2016 15:37:01 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
	by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 30 Nov 2016 15:36:59 +1000
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
	by d23dlp01.au.ibm.com (Postfix) with ESMTP id F019A2CE8046;
	Wed, 30 Nov 2016 16:36:58 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
	by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uAU5aw3U26280168; Wed, 30 Nov 2016 16:36:58 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
	by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uAU5awnq022484; Wed, 30 Nov 2016 16:36:58 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uAU5awSh022479; Wed, 30 Nov 2016 16:36:58 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A672FA0105;
	Wed, 30 Nov 2016 16:36:57 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Wed, 30 Nov 2016 16:36:23 +1100
X-Mailer: git-send-email 2.9.3
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16113005-0048-0000-0000-000001E58F02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16113005-0049-0000-0000-000047154EB5
Message-Id: <20161130053629.23340-1-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611300092
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: [Qemu-arm] [PATCH v2 0/6] Add support for the Epson RX8900 RTC to
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
X-TUID: fYJufS7BToZ0

From: Alastair D'Silva <alastair@d-silva.org>

This patch series adds support for the Epson RX8900 RTC to the
Aspeed board.

The tests use the existing imx25 infrastructure, and some minor
changes have been made to uniquely identify the I2C buses.

A NULL check have been added to eliminate empty i2cslave init
functions.

Support for named interrupts has been implemented in qtest to
facilitate testing.

Alastair D'Silva (6):
  arm: Uniquely name imx25 I2C buses.
  hw/i2c: Add a NULL check for i2c slave init callbacks
  qtest: Support named interrupts
  hw/timer: Add Epson RX8900 RTC support
  tests: Test all implemented RX8900 functionality
  arm: Add an RX8900 RTC to the ASpeed board

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/aspeed.c                 |  12 +
 hw/arm/imx25_pdk.c              |   4 +-
 hw/arm/pxa2xx.c                 |   9 +-
 hw/arm/tosa.c                   |   7 -
 hw/arm/z2.c                     |   7 -
 hw/core/irq.c                   |  17 +-
 hw/i2c/core.c                   |   6 +-
 hw/i2c/imx_i2c.c                |   6 +-
 hw/timer/Makefile.objs          |   2 +
 hw/timer/ds1338.c               |   6 -
 hw/timer/rx8900.c               | 890 ++++++++++++++++++++++++++++++++++++++++
 hw/timer/rx8900_regs.h          | 139 +++++++
 hw/timer/trace-events           |  31 ++
 include/hw/irq.h                |  12 +-
 qtest.c                         | 102 +++--
 tests/Makefile.include          |   2 +
 tests/libqtest.c                |  87 +++-
 tests/libqtest.h                |  59 +++
 tests/rx8900-test.c             | 881 +++++++++++++++++++++++++++++++++++++++
 20 files changed, 2208 insertions(+), 72 deletions(-)
 create mode 100644 hw/timer/rx8900.c
 create mode 100644 hw/timer/rx8900_regs.h
 create mode 100644 tests/rx8900-test.c

-- 
2.9.3

