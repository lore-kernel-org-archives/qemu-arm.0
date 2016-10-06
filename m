Received: by 10.80.163.71 with SMTP id 65csp3223022edn;
        Thu, 6 Oct 2016 06:38:44 -0700 (PDT)
X-Received: by 10.55.214.27 with SMTP id t27mr13504846qki.272.1475761124530;
        Thu, 06 Oct 2016 06:38:44 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 47si1139161qtz.106.2016.10.06.06.38.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 06:38:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bs8sl-0003Ce-CR
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 09:38:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bs8c6-0004lW-Mv
	for qemu-devel@nongnu.org; Thu, 06 Oct 2016 09:21:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bs8bz-0006XF-QY
	for qemu-devel@nongnu.org; Thu, 06 Oct 2016 09:21:29 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47223)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bs8bs-0006TD-2m; Thu, 06 Oct 2016 09:21:16 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bs8bk-0006Rr-1U; Thu, 06 Oct 2016 14:21:08 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Oct 2016 14:21:04 +0100
Message-Id: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 0/3] preliminaries for GICv3 virt support
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cs32zWloA1Rk

This set of three straightforward patches is a preliminary
for adding virtualization support to the GICv3 emulation:
 * add a (nop implementation of) MDCCINT_EL1, since KVM
   will read/write it on worldswitch
 * fix some bugs in the GICv3 trace events
 * add trace events for the generic timers
   (which I have been using for debugging)

I actually have almost all of the GICv3 virt code written,
but it currently has bugs which mean that a guest kernel
under KVM won't boot. Debugging in progress...

thanks
-- PMM

Peter Maydell (3):
  target-arm: Implement dummy MDCCINT_EL1
  target-arm: Add trace events for the generic timers
  hw/intc/arm_gicv3: Fix ICC register tracepoints

 Makefile.objs             |  1 +
 hw/intc/arm_gicv3_cpuif.c | 23 +++++++++++++++--------
 hw/intc/trace-events      | 14 +++++++-------
 target-arm/helper.c       | 28 ++++++++++++++++++++++++----
 4 files changed, 47 insertions(+), 19 deletions(-)

-- 
2.7.4

