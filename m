Received: by 10.25.159.131 with SMTP id i125csp374758lfe;
        Fri, 9 Dec 2016 08:30:39 -0800 (PST)
X-Received: by 10.55.0.65 with SMTP id 62mr59833407qka.106.1481301039765;
        Fri, 09 Dec 2016 08:30:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id d4si6060981qkg.123.2016.12.09.08.30.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Dec 2016 08:30:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47549 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cFO4F-0003Hv-5K
	for alex.bennee@linaro.org; Fri, 09 Dec 2016 11:30:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cFO4B-0003Ay-CY
	for qemu-arm@nongnu.org; Fri, 09 Dec 2016 11:30:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cFO4A-0007Xi-Bu
	for qemu-arm@nongnu.org; Fri, 09 Dec 2016 11:30:35 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47666)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cFO4A-0007Tx-5I; Fri, 09 Dec 2016 11:30:34 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cFO3x-0007zE-0z; Fri, 09 Dec 2016 16:30:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  9 Dec 2016 16:30:16 +0000
Message-Id: <1481301020-21777-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/4] hw/arm/virt: 2.9 machtype, fix timer dt info
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
Cc: Andrew Jones <drjones@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UgHKg/iay9x7

This patchset fixes an error in how we were reporting the
architectural timers in the device tree for the virt board.
Old KVM host kernels (before 4.4) implemented these timers
as edge-triggered, which led us to decide to report them in
the DT as edge triggered. However in newer kernels this
was fixed and they're level triggered as they're architecturally
supposed to be.

Patch 4 fixes up the DT.
Patch 1 adds the 2.9 machine type so we can make the DT
 change only apply to new virt machine types
Patches 2 and 3 are a cleanup, so that we can have
 convenient access to the VirtMachineClass at the point
 in the code where we want to look at it. We collapse the
 VirtBoardInfo struct into the VirtMachineState, since
 the former mostly exists because at the time there was
 no VirtMachineState.

(Most of the diffstat is the result of s/vbi/vms/ on
the file to update variable names.)

Kernel behaviours as far as I know them:
 * host v4.3 and earlier: implemented timers as weird
   sort-of-edge-triggered semantics
 * host v4.4 and later: timers are level triggered
vs
 * guest pre-4.8: ignore the values in the DT, trust
   whatever the GIC's reset values are
 * guest 4.8 before rc6: write the DT values to the
   GIC config registers
 * guest newer than rc6 ignore the DT, and always write
   'level triggered' to the GIC

This combination means that (assuming that post 4.8
guest kernels work at all on pre 4.4 host kernels) I
don't expect this to break anything. Testing would probably
be a good idea, though: I plan to do some more combinations
but kernel builds on my aarch64 system are slow so I
thought I'd send out the patchset before I went home today...

Peter Maydell (4):
  hw/arm/virt: add 2.9 machine type
  hw/arm/virt: Merge VirtBoardInfo and VirtMachineState
  hw/arm/virt: Rename 'vbi' variables to 'vms'
  hw/arm/virt: Don't incorrectly claim architectural timer to be
    edge-triggered

 include/hw/compat.h |   3 +
 hw/arm/virt.c       | 616 +++++++++++++++++++++++++++-------------------------
 2 files changed, 323 insertions(+), 296 deletions(-)

-- 
2.7.4

