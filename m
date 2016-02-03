Received: by 10.25.159.19 with SMTP id i19csp1234063lfe;
        Wed, 3 Feb 2016 05:53:12 -0800 (PST)
X-Received: by 10.55.73.199 with SMTP id w190mr1590668qka.77.1454507588017;
        Wed, 03 Feb 2016 05:53:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k11si5597054qhc.14.2016.02.03.05.53.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Feb 2016 05:53:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQxrn-0000JR-JR
	for alex.bennee@linaro.org; Wed, 03 Feb 2016 08:53:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxrl-0000FP-2O
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 08:53:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aQxrh-0006hI-5O
	for qemu-arm@nongnu.org; Wed, 03 Feb 2016 08:53:04 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:57186)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxre-0006eA-Ro; Wed, 03 Feb 2016 08:52:59 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aQxdq-00035Z-00; Wed, 03 Feb 2016 13:38:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  3 Feb 2016 13:38:34 +0000
Message-Id: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: [Qemu-arm] [PATCH 0/7] Fix some more EL3 things and enable EL3 for
	AArch64
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CqfpkCx6EUXE

This series fixes a couple more minor EL3 related missing parts,
and then turns on EL3 for AArch64 CPUs. The minor fixed things are:
 * implement MDCR_EL3 and SDCR
 * trap Secure EL1 accesses to SCR and MVBAR to EL3
 * add EL3 support to the code that decides whether to generate
   debug exceptions
 * fix corner cases in our NSACR handling

To do the NSACR fix I had to change the CPAccessFn API to take
an extra bool to tell the function if the access is a read or write.

The only major thing I know of that we're missing for 64-bit EL3
is that we need to go through the "EL3 configurable controls" section
of the ARM ARM to make sure we trap on the right things. But
(a) I expect we're missing some for 32-bit as well and (b) this
is enough to run some real-world EL3 code (ARM Trusted Firmware
and OP-TEE), so it makes sense to me to turn on EL3 now.


thanks
-- PMM

Peter Maydell (7):
  target-arm: Fix typo in comment in arm_is_secure_below_el3()
  target-arm: Implement MDCR_EL3 and SDCR
  target-arm: Use access_trap_aa32s_el1() for SCR and MVBAR
  target-arm: Update arm_generate_debug_exceptions() to handle EL2/EL3
  target-arm: Add isread parameter to CPAccessFns
  target-arm: Implement NSACR trapping behaviour
  target-arm: Enable EL3 for Cortex-A53 and Cortex-A57

 target-arm/cpu.h           |  55 +++++++++++++--
 target-arm/cpu64.c         |   2 +
 target-arm/helper.c        | 171 ++++++++++++++++++++++++++++++++++++---------
 target-arm/helper.h        |   2 +-
 target-arm/op_helper.c     |   5 +-
 target-arm/translate-a64.c |   6 +-
 target-arm/translate.c     |   7 +-
 7 files changed, 200 insertions(+), 48 deletions(-)

-- 
1.9.1

