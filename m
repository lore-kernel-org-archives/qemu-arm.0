Received: by 10.25.159.131 with SMTP id i125csp2196168lfe;
        Tue, 6 Dec 2016 09:46:52 -0800 (PST)
X-Received: by 10.237.61.98 with SMTP id h31mr61895050qtf.243.1481046412413;
        Tue, 06 Dec 2016 09:46:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id e2si12212583qta.253.2016.12.06.09.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Dec 2016 09:46:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEJp0-00038h-Jk
	for alex.bennee@linaro.org; Tue, 06 Dec 2016 12:46:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cEJou-000386-K5
	for qemu-arm@nongnu.org; Tue, 06 Dec 2016 12:46:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cEJot-00071n-ST
	for qemu-arm@nongnu.org; Tue, 06 Dec 2016 12:46:24 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47642)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cEJot-00071K-Le; Tue, 06 Dec 2016 12:46:23 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cEJoq-0005sk-VD; Tue, 06 Dec 2016 17:46:20 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  6 Dec 2016 17:46:16 +0000
Message-Id: <1481046379-32632-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/3] GICv3 bugfixes (preliminary for virt)
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c21RlWkhVyGf

This patchset has a couple of fixes for bugs in the GICv3
emulation. I only noticed these in the course of adding the
virtualizations support, but they're bugs in the existing
non-virtualized code.

Patch 1 is strictly speaking not a GIC patch, but it's
an improvement to the debug logging that I found helpful
while trying to track down the bugs fixed in patches
2 and 3...

(I do now have the virtualization support to a point
where it will boot a nested Linux guest. Still a bunch
of loose ends to clean up but I hope to get that patchset
out to the list before the holidays...)

Peter Maydell (3):
  target-arm: Log AArch64 exception returns
  hw/intc/arm_gicv3: Remove incorrect usage of fieldoffset
  hw/intc/arm_gicv3: Don't signal Pending+Active interrupts to CPU

 hw/intc/arm_gicv3.c       |  5 +++++
 hw/intc/arm_gicv3_cpuif.c | 13 ++++++-------
 target-arm/op_helper.c    |  9 +++++++++
 3 files changed, 20 insertions(+), 7 deletions(-)

-- 
2.7.4

