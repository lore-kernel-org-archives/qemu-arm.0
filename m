Received: by 10.25.77.65 with SMTP id a62csp1918324lfb;
        Tue, 24 Jan 2017 11:16:26 -0800 (PST)
X-Received: by 10.98.65.15 with SMTP id o15mr38601786pfa.42.1485285386641;
        Tue, 24 Jan 2017 11:16:26 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id x5si20328203pgf.20.2017.01.24.11.16.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Jan 2017 11:16:26 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cW6Zp-0000Ng-4f; Tue, 24 Jan 2017 19:16:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Liviu Ionescu <ilg@livius.net>
Subject: [PATCH 00/10] More M profile bugfixes
Date: Tue, 24 Jan 2017 19:16:10 +0000
Message-Id: <1485285380-10565-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: R2bGrkyxBRqq

More easy bugfixes pulled out from (or inspired by,
or noticed during the course of working on) Michael's
NVIC patchset.

These patches expect to sit on top of my previous set.
You can find a git tree with the whole stack here:
 https://git.linaro.org/people/peter.maydell/qemu-arm.git m-profile-fixes

(I think the next part of this is going to be actually
digging into the NVIC rewrite proper.)

thanks
-- PMM

Michael Davidsaver (6):
  armv7m_nvic: keep a pointer to the CPU
  armv7m: implement CCR, CFSR, HFSR, DFSR, BFAR, and MMFAR
  armv7m: honour CCR.STACKALIGN on exception entry
  armv7m: set CFSR.UNDEFINSTR on undefined instructions
  armv7m: Honour CCR.USERSETMPEND
  armv7m: FAULTMASK should be 0 on reset

Peter Maydell (4):
  target/arm: Drop IS_M() macro
  armv7m: add state for v7M CCR, CFSR, HFSR, DFSR, MMFAR, BFAR
  armv7m: Report no-coprocessor faults correctly
  armv7m: R14 should reset to 0xffffffff

 target/arm/cpu.h       | 61 +++++++++++++++++++++++++++++++++++++++++++++-----
 hw/intc/armv7m_nvic.c  | 58 +++++++++++++++++++++++++++++++++--------------
 linux-user/main.c      |  1 +
 target/arm/cpu.c       | 22 +++++++++++++-----
 target/arm/helper.c    | 13 ++++++-----
 target/arm/machine.c   | 10 +++++++--
 target/arm/translate.c |  8 +++++++
 7 files changed, 138 insertions(+), 35 deletions(-)

-- 
2.7.4
