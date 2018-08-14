Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4029865wru;
        Tue, 14 Aug 2018 05:43:22 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPz/h0F2z1MlVQG5R1OcSzZUUqTpsz4Zdjo6r7fPhrwP0hoLflc63B6Ef0tMnB6q6of8Lqqs
X-Received: by 2002:a37:d49b:: with SMTP id s27-v6mr19629848qks.220.1534250602663;
        Tue, 14 Aug 2018 05:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534250602; cv=none;
        d=google.com; s=arc-20160816;
        b=GT7nxjeqc2kH2tqhlKgvj9MUHZ85B9wq21wwpUdWiwjDh399Dkzdpz4AmiiwxIRYuy
         WNB2Rz4mjMnBiI1PTWSkdh/cnX6H6PxcAfVoyeAT0LK1v2KTJqv//4qJz/XIYIheUHdZ
         rwVTGaytliujHfWCcEGtFVHuvAAdeEw1szII4D0LNDQoLoZFdmUSoDdfTl7JaUZ2byGO
         ZT855lfc9jWw9GaIAm+G4ZnbY53e07uJnlIHcNZzn5K0uY42yR3OP/+KE5o562WCxYfp
         FoJwubswOgALx3PrwHGyR8KQIOGoA0+ViRKK2zQHZTeWT3zXU6HatxxEJiy4pkPHQCpj
         4UXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=Z9CtM/zj2xh46OiafkreluYoWpJLz4isYU0Xs7MBgOM=;
        b=wjRuDaQ0LsDyLZA++Qq+FpbBiiOPbXS3mmcX40CtVLs650W8auXod/mesvxqfCExYM
         40AX5hgyBG6Wo+IXkUpKfCVpskIQ4ZieyROWR4nW4D0Gla5kVm/ZTv+Q9gXXt/T2DvgF
         knfd+fWroKOGFvvnoawLE1yJ0YGKLWFUjABGK+rQB9Pnoto9tFPZx8D3nc9/rrFovuUW
         aW+/SLeCi7lonYg3zgI3THbw5AEzQKgfk3NjTE0By4PxbMQdh8h1HaatpBF3S3DAKUeW
         UE6aNsCcmvyk4xdsHdEeUoBp4a5iJnERE2K+e9KYUI1uvrA5Dj1apVJAOgVNnkgJlppS
         CpmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o126-v6si1918201qke.291.2018.08.14.05.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Aug 2018 05:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpYfS-0005Uw-40
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 08:43:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfE-0005US-L7
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fpYfD-0002DC-Rm
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 08:43:08 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44302)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fpYfD-0001z2-J8; Tue, 14 Aug 2018 08:43:07 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fpYf5-0006nM-6B; Tue, 14 Aug 2018 13:42:59 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 14 Aug 2018 13:42:44 +0100
Message-Id: <20180814124254.5229-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 00/10] target/arm: Some pieces of support for
 32-bit Hyp mode
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
Cc: edgari@xilinx.com, Luc Michel <luc.michel@greensocs.com>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XDFfFY9151jP

Now we have virtualization support in the GICv2 emulation,
I thought I'd have a look at how much we were still missing
for being able to enable EL2 support for AArch32.
This set of patches fixes some minor missing pieces:
 * various small bugs in cp15 registers or places where
   we were missing the 32-bit version of a 64-bit register
 * a bugfix for MSR/MRS (banked), which were not allowing
   Hyp mode to access ELR_Hyp
 * implementation of the ERET instruction for A32/T32
 * support for taking exceptions to Hyp mode (the largest
   of these missing bits)

This isn't complete, but I thought I'd push these patches
out for review. My test setup is that I have another
couple of patches, one which fixes up hw/arm/boot.c to
boot AArch32 kernels in Hyp mode if it exists, and one
which sets ARM_FEATURE_EL2 on our A15 model. With those I
can get an outer kernel to boot with KVM support and try
to run an inner guest kernel. The inner kernel boots OK
but gets random segfaults in its userspace -- I haven't
tracked down why this is yet...

Some bits that are definitely missing:
 * ATS1HR, ATS1HW address translation ops
 * I need to check that the trap semantics for AArch32
   regs line up with their AArch64 counterparts

I also noticed that we fail to implement really quite a lot
of the HCR_EL2 trap semantics for either AArch64 or AArch32,
to the extent that I'm surprised that nested guests work
under AArch64 :-)

This patchset is based on top of my target-arm.for-3.1
branch.

thanks
-- PMM

Peter Maydell (10):
  target/arm: Correct typo in HAMAIR1 regdef name
  target/arm: Add missing .cp = 15 to HMAIR1 and HAMAIR1 regdefs
  target/arm: Implement RAZ/WI HACTLR2
  target/arm: Implement AArch32 HVBAR
  target/arm: Implement AArch32 HCR and HCR2
  target/arm: Implement AArch32 Hyp FARs
  target/arm: Implement ESR_EL2/HSR for AArch32 and no-EL2
  target/arm: Permit accesses to ELR_Hyp from Hyp mode via MSR/MRS
    (banked)
  target/arm: Implement AArch32 ERET instruction
  target/arm: Implement support for taking exceptions to Hyp mode

 target/arm/helper.c    | 226 ++++++++++++++++++++++++++++++++++-------
 target/arm/op_helper.c |  22 ++--
 target/arm/translate.c |  41 +++++++-
 3 files changed, 236 insertions(+), 53 deletions(-)

-- 
2.18.0

