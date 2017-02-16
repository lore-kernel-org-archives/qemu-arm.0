Received: by 10.25.77.65 with SMTP id a62csp2552582lfb;
        Thu, 16 Feb 2017 08:36:10 -0800 (PST)
X-Received: by 10.99.113.18 with SMTP id m18mr3950571pgc.115.1487262970476;
        Thu, 16 Feb 2017 08:36:10 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id l28si7412142pgc.81.2017.02.16.08.36.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Feb 2017 08:36:10 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ceP2J-00032b-Ne; Thu, 16 Feb 2017 16:36:03 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 00/13] Rewrite NVIC to not depend on the GIC
Date: Thu, 16 Feb 2017 16:35:50 +0000
Message-Id: <1487262963-11519-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yt0Frn4WJLK5

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

For testing, I have used the Stellaris image I have to hand:
http://people.linaro.org/~peter.maydell/stellaris.tgz
and also a set of bare-metal test programs also written by
Michael. You can find my slightly tweaked and cleand up
version of those here (a README explains how to run them):
https://git.linaro.org/people/peter.maydell/m-profile-tests.git

Changes v1->v2:
 * clarify a few comments
 * rephrase loops in nvic_sysreg_read() and nvic_sysreg_write()
 * checked RETTOBASE semantics vs various docs; the existing
   code seems to best match, but flipped our choice of behaviour
   in the UNKNOWN "no interrupt" case to match the M3's choice,
   and expanded the comment.
New patches in v2:
 * patches 10, 11 implement the exception return integrity check logic
 * patch 12 fixes a minor bug in reporting attempts to run ARM code
 * Patch 13 implements writing of SHCSR active and pending bits
   (mostly useful for test code that puts the CPU in weird states
   like deactivating the current active interrupt)

Patches needing review: 3, 10, 11, 12, 13.

I've also updated the m-profile-tests test code to add
tests for the exception return integrity checks.

(Next after this I have a dozen or so patches which QOMify
the armv7m container and otherwise bring that code up to
date with how we do objects these days.)

thanks
-- PMM

Michael Davidsaver (5):
  armv7m: Rewrite NVIC to not use any GIC code
  arm: gic: Remove references to NVIC
  armv7m: Escalate exceptions to HardFault if necessary
  armv7m: Simpler and faster exception start
  armv7m: VECTCLRACTIVE and VECTRESET are UNPREDICTABLE

Peter Maydell (8):
  armv7m: Rename nvic_state to NVICState
  armv7m: Implement reading and writing of PRIGROUP
  armv7m: Fix condition check for taking exceptions
  armv7m: Remove unused armv7m_nvic_acknowledge_irq() return value
  armv7m: Extract "exception taken" code into functions
  armv7m: Check exception return consistency
  armv7m: Raise correct kind of UsageFault for attempts to execute ARM
    code
  armv7m: Allow SHCSR writes to change pending and active bits

 hw/intc/gic_internal.h   |   7 +-
 target/arm/cpu.h         |  23 +-
 hw/intc/arm_gic.c        |  31 +-
 hw/intc/arm_gic_common.c |  23 +-
 hw/intc/armv7m_nvic.c    | 885 +++++++++++++++++++++++++++++++++++++----------
 linux-user/main.c        |   1 +
 target/arm/cpu.c         |  16 +-
 target/arm/helper.c      | 245 +++++++++----
 target/arm/translate.c   |   8 +-
 hw/intc/trace-events     |  15 +
 10 files changed, 954 insertions(+), 300 deletions(-)

-- 
2.7.4
