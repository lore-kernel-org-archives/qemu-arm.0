Received: by 10.25.159.19 with SMTP id i19csp39218lfe;
        Fri, 5 Feb 2016 08:55:39 -0800 (PST)
X-Received: by 10.55.82.2 with SMTP id g2mr17746861qkb.53.1454691339898;
        Fri, 05 Feb 2016 08:55:39 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z81si2931760qhc.87.2016.02.05.08.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 08:55:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRjfX-0006XV-HE
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 11:55:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjcy-0002SE-EI
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 11:53:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aRjcx-00076o-Bp
	for qemu-devel@nongnu.org; Fri, 05 Feb 2016 11:53:00 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjcx-00076J-4o; Fri, 05 Feb 2016 11:52:59 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aRjVI-0004EN-0j; Fri, 05 Feb 2016 16:45:04 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  5 Feb 2016 16:44:58 +0000
Message-Id: <1454690704-16233-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: [Qemu-devel] [PATCH 0/6] target-arm: Implement various EL3 traps
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FgKEMCX6EavJ

This patchset fixes or implements a lot of traps to EL3 as
listed in the ARM ARM section D1.15.4 "EL3 configurable controls".
Most of the rest we already had implemented.

NB: where the trap I was implementing for EL3 had an
obvious equivalent in EL2 I included the EL2 check in this
series, but I haven't attempted to implement traps which are
only EL2 and not EL3.

The remaining traps I haven't done yet are:

 * MDCR_EL3.TPM -- easy (similar to TDOSA/TDRA/TDA) but will
     conflict with the perf monitor fixes currently on list,
     so I haven't done it yet
 * SRS using R13_mon
 * changing to monitor via CPS/MSR/exc return
   -- both of these require us to tighten up our handling of
      bogus mode specifications in various places in 32-bit
      code translation. I'll do this next, but it isn't really
      very similar to these patches which are mostly sysreg
      access traps, so different patchset.

The patchset assumes you've already applied the ones I have
on list at the moment (notably including the patch that adds
the isread parameter to system register access functions).

You can see the whole lot in context at
 https://git.linaro.org/people/peter.maydell/qemu-arm.git v8-tz


Peter Maydell (6):
  target-arm: correct CNTFRQ access rights
  target-arm: Fix handling of SCR.SMD
  target-arm: Implement MDCR_EL3.TDOSA and MDCR_EL2.TDOSA traps
  target-arm: Implement MDCR_EL2.TDRA traps
  target-arm: Implement MDCR_EL2.TDA and MDCR_EL2.TDA traps
  target-arm: Report correct syndrome for FPEXC32_EL2 traps

 target-arm/cpu.h       |  17 +++++++
 target-arm/helper.c    | 124 ++++++++++++++++++++++++++++++++++++++++++-------
 target-arm/op_helper.c |  25 ++++++++--
 3 files changed, 143 insertions(+), 23 deletions(-)

-- 
1.9.1

