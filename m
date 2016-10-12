Received: by 10.80.166.35 with SMTP id d32csp659329edc;
        Wed, 12 Oct 2016 10:54:50 -0700 (PDT)
X-Received: by 10.200.58.135 with SMTP id x7mr2538418qte.93.1476294890756;
        Wed, 12 Oct 2016 10:54:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y189si4445621qkd.28.2016.10.12.10.54.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Oct 2016 10:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1buNju-00070P-Ag
	for alex.bennee@linaro.org; Wed, 12 Oct 2016 13:54:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1buNjr-00070I-OT
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 13:54:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1buNjq-00032q-Rs
	for qemu-arm@nongnu.org; Wed, 12 Oct 2016 13:54:47 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1buNjq-00030L-L1; Wed, 12 Oct 2016 13:54:46 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1buNji-0001sX-7O; Wed, 12 Oct 2016 18:54:38 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 12 Oct 2016 18:54:32 +0100
Message-Id: <1476294876-12340-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 0/4] preliminaries for GICv3 virt support
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1BEz9l7rfNPH

This set of straightforward patches is a preliminary
for adding virtualization support to the GICv3 emulation:
 * add a (nop implementation of) MDCCINT_EL1, since KVM
   will read/write it on worldswitch
 * fix some bugs in the GICv3 trace events
 * add trace events for the generic timers
   (which I have been using for debugging)
 * add trace events for the serial port (again, debug use)

Changes v1->v2:
 * added the missing target-arm/trace-events file to
   patch 2
 * new patch 4 with pl011 trace events

Peter Maydell (4):
  target-arm: Implement dummy MDCCINT_EL1
  target-arm: Add trace events for the generic timers
  hw/intc/arm_gicv3: Fix ICC register tracepoints
  hw/char/pl011: Add trace events

 Makefile.objs             |  1 +
 hw/char/pl011.c           | 71 +++++++++++++++++++++++++++++++++--------------
 hw/char/trace-events      |  9 ++++++
 hw/intc/arm_gicv3_cpuif.c | 23 +++++++++------
 hw/intc/trace-events      | 14 +++++-----
 target-arm/helper.c       | 28 ++++++++++++++++---
 target-arm/trace-events   | 10 +++++++
 7 files changed, 116 insertions(+), 40 deletions(-)
 create mode 100644 target-arm/trace-events

-- 
2.7.4

