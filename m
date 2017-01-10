Received: by 10.25.205.13 with SMTP id d13csp367270lfg;
        Tue, 10 Jan 2017 10:44:27 -0800 (PST)
X-Received: by 10.200.50.238 with SMTP id a43mr4035616qtb.23.1484073867046;
        Tue, 10 Jan 2017 10:44:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f1si1924883qte.269.2017.01.10.10.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jan 2017 10:44:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cR1PG-0005rA-Ft
	for alex.bennee@linaro.org; Tue, 10 Jan 2017 13:44:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cR1PB-0005ok-BS
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 13:44:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cR1P7-0002Jo-FD
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 13:44:21 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48128)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cR1P7-0002Gi-8d; Tue, 10 Jan 2017 13:44:17 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cR1Oz-0002yD-K1; Tue, 10 Jan 2017 18:44:09 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 10 Jan 2017 18:44:06 +0000
Message-Id: <1484073849-32666-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/3] target/arm: Support EL1 AArch32 guest under
 AArch64 EL2
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
X-TUID: BO5c5TPov2Ly

The GICv3 virt patchset is sufficient to run a 64-bit guest under
a 64-bit host kernel. To run 32-bit guests under the 64-bit host
you need a few more things:
 * data aborts from AArch32 need to provide instruction syndrome info
   to the hypervisor
 * the AArch32 interrupt code needs to handle VIRQ and VFIQ
 * we need a DBGVCR32_EL2 register, because Linux's EL2 code uses
   it to context-switch AArch32 DBGVCR between guests

This patchset sits on top of the gicv3-virt patchset and is
sufficient to run a Linux 32-bit guest under 64-bit Linux host.

Git branch with the whole lot:
 https://git.linaro.org/people/peter.maydell/qemu-arm.git aarch32-guest


Peter Maydell (3):
  target/arm: A32, T32: Create Instruction Syndromes for Data Aborts
  target/arm: Handle VIRQ and VFIQ in arm_cpu_do_interrupt_aarch32()
  target/arm: Implement DBGVCR32_EL2 system register

 target/arm/helper.c    |  21 +++++
 target/arm/translate.c | 213 ++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 178 insertions(+), 56 deletions(-)

-- 
2.7.4

