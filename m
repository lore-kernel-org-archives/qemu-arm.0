Received: by 10.25.0.144 with SMTP id 138csp389809lfa;
        Wed, 26 Apr 2017 10:13:33 -0700 (PDT)
X-Received: by 10.200.39.100 with SMTP id h33mr847405qth.280.1493226813153;
        Wed, 26 Apr 2017 10:13:33 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6si865680qkg.144.2017.04.26.10.13.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Apr 2017 10:13:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3QVQ-000280-I4
	for alex.bennee@linaro.org; Wed, 26 Apr 2017 13:13:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1d3QVL-00025v-68
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 13:13:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1d3QVK-0000Mz-A6
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 13:13:27 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:36968)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1d3QVK-0000JT-36; Wed, 26 Apr 2017 13:13:26 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1d3QV7-0004fY-OD; Wed, 26 Apr 2017 18:13:13 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Wed, 26 Apr 2017 18:13:09 +0100
Message-Id: <1493226792-3237-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/3] gicv3: Correct mishandling of NS BPR1 values
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
X-TUID: TyblkhXmDneh

I happened to be looking at the GICv3 spec and our implementation,
and I realized that we don't correctly calculate the mask values
to get group priorities based on BPR values if the NS BPR1 is
being used. This BPR, unlike the S BPR1 or the BPR0, has
off-by-one semantics, so instead of "use bits [7:1]" being
bpr == 0, it is bpr == 1, and so on, with an NS BPR1 value of
0 being impossible.

Patch 3 in this set fixes this error, and fixes the comments
so they're actually accurate. Patches 1 and 2 are preliminary
bug fixes which ensure that the NS BPR1 values are actually
constrained to be greater than 0, so that the assert()s added
in patch 3 can't fire.

I'm sending this as the last thing before I head out of the
door, so will respond to review comments in June...

thanks
-- PMM


Peter Maydell (3):
  hw/intc/arm_gicv3_cpuif: Fix reset value for VMCR_EL2.VBPR1
  hw/intc/arm_gicv3_cpuif: Don't let BPR be set below its minimum
  hw/intc/arm_gicv3_cpuif: Fix priority masking for NS BPR1

 hw/intc/arm_gicv3_cpuif.c | 49 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 5 deletions(-)

-- 
2.7.4

