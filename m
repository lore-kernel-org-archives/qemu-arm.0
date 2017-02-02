Received: by 10.25.77.65 with SMTP id a62csp303190lfb;
        Thu, 2 Feb 2017 12:02:30 -0800 (PST)
X-Received: by 10.98.15.143 with SMTP id 15mr13044572pfp.100.1486065750104;
        Thu, 02 Feb 2017 12:02:30 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id m32si23265390pld.31.2017.02.02.12.02.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Feb 2017 12:02:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cZNaJ-0001uW-LA; Thu, 02 Feb 2017 20:02:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Davidsaver <mdavidsaver@gmail.com>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 0/9] Rewrite NVIC to not depend on the GIC
Date: Thu,  2 Feb 2017 20:02:13 +0000
Message-Id: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: Rx2V5f03KVmC

This patchset is the revamp of the NVIC code from Michael
Davidsaver's patchset of a year ago.

Despite some superficial similarities of register layout, the
M-profile NVIC is really very different from the A-profile GIC.  Our
current attempt to reuse the GIC code means that we have significant
bugs in our NVIC.  The series pulls the NVIC apart from the GIC code
(fixing a few accidental bugs in the process), and then once it has a
place to stand, implements a few minor cleanups, a key bugfix
(getting priority calculations and masking right) and a missing
feature (escalation to HardFault).

I've tried to separate things out into their own patches where I
could, but the core 'rewrite NVIC' patch itself is still 592
insertions(+), 144 deletions(-), and there's not much to be done
about that since we don't want to break functionality in the process.

This patch series doesn't include the "check exception return
consistency" changes that Michael's original patch set had, because I
need to do more work on those and there's no need to make this series
any bigger.

I want to pull SysTick out into its own device object, so there are
some foundations for that here (mostly that we leave the container
memory object in place even though it only has one thing inside it
now).

For testing, I have used the Stellaris image I have to hand:
http://people.linaro.org/~peter.maydell/stellaris.tgz
and also a set of bare-metal test programs also written by
Michael. You can find my slightly tweaked and cleand up
version of those here (a README explains how to run them):
https://git.linaro.org/people/peter.maydell/m-profile-tests.git

Further testing welcome.

thanks
-- PMM

Michael Davidsaver (5):
  armv7m: Rewrite NVIC to not use any GIC code
  arm: gic: Remove references to NVIC
  armv7m: Escalate exceptions to HardFault if necessary
  armv7m: Simpler and faster exception start
  armv7m: VECTCLRACTIVE and VECTRESET are UNPREDICTABLE

Peter Maydell (4):
  armv7m: Rename nvic_state to NVICState
  armv7m: Implement reading and writing of PRIGROUP
  armv7m: Fix condition check for taking exceptions
  armv7m: Remove unused armv7m_nvic_acknowledge_irq() return value

 hw/intc/gic_internal.h   |   7 +-
 target/arm/cpu.h         |  10 +-
 hw/intc/arm_gic.c        |  31 +-
 hw/intc/arm_gic_common.c |  23 +-
 hw/intc/armv7m_nvic.c    | 843 +++++++++++++++++++++++++++++++++++++----------
 target/arm/cpu.c         |  16 +-
 target/arm/helper.c      |  17 +-
 hw/intc/trace-events     |  15 +
 8 files changed, 726 insertions(+), 236 deletions(-)

-- 
2.7.4
