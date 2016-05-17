Received: by 10.25.208.137 with SMTP id h131csp1766437lfg;
        Tue, 17 May 2016 05:25:45 -0700 (PDT)
X-Received: by 10.140.180.132 with SMTP id b126mr1027417qha.32.1463487945550;
        Tue, 17 May 2016 05:25:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n3si2021801qkc.48.2016.05.17.05.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 May 2016 05:25:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50024 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2e4G-00064q-Vw
	for alex.bennee@linaro.org; Tue, 17 May 2016 08:25:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b2e2x-0003PO-Kd
	for qemu-arm@nongnu.org; Tue, 17 May 2016 08:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b2e2r-0005dC-Iw
	for qemu-arm@nongnu.org; Tue, 17 May 2016 08:24:23 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b2e2r-0005cG-Ci; Tue, 17 May 2016 08:24:17 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b2dtD-0007Sr-5m; Tue, 17 May 2016 13:14:19 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 17 May 2016 13:14:16 +0100
Message-Id: <1463487258-27468-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/2] target-arm: ESR IL bit fixes
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Laurent Desnogues <laurent.desnogues@gmail.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HjIloMatcA0T

These patches fix some problems with setting the IL bit in
ESR syndrome register values:
 * we were not setting IL for insn abort, watchpoint or swstep
   (which should all always have IL==1)
 * we were trying to set the IL bit in arm_cpu_do_interrupt_aarch64()
   if doing a 32->64 bit exception entry, which was wrong in
   several ways; instead we should just rely on exception.syndrome
   already having the correct IL bit value

The patches are intended to apply on top of target-arm.next:
 https://git.linaro.org/people/peter.maydell/qemu-arm.git target-arm.next
(which has Edgar's patch which gets us correct IL bit values for
data abort exceptions).

Peter Maydell (2):
  target-arm: Set IL bit in syndromes for insn abort, watchpoint, swstep
  target-arm: Don't try to set ESR IL bit in
    arm_cpu_do_interrupt_aarch64()

 target-arm/helper.c    | 3 ---
 target-arm/internals.h | 6 +++---
 2 files changed, 3 insertions(+), 6 deletions(-)

-- 
1.9.1

