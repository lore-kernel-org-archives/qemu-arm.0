Received: by 10.25.0.147 with SMTP id 141csp59037lfa;
        Mon, 20 Feb 2017 07:36:08 -0800 (PST)
X-Received: by 10.46.83.15 with SMTP id h15mr5549869ljb.72.1487604968802;
        Mon, 20 Feb 2017 07:36:08 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by mx.google.com with ESMTPS id u10si9659142lfe.103.2017.02.20.07.36.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Feb 2017 07:36:08 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) client-ip=2001:8b0:1d0::2;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::2 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cfq0U-0005g1-5Z; Mon, 20 Feb 2017 15:36:06 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>
Subject: [PATCH 00/11] ARMv7M: QOMify
Date: Mon, 20 Feb 2017 15:35:54 +0000
Message-Id: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-TUID: 6XSIGDNhixKq

This patch series attempts to bring the v7M code
up to something resembling modern practice for
QEMU devices:
 * proper QOM object for the armv7m "container"
   which holds the CPU, NVIC, etc cpu-internal devices"
 * split the systick out into its own device
 * use memory region links rather than having the
   NVIC and bitband map themselves directly into the
   system memory space
 * have stm32f205 create the armv7m container via the
   QOM APIs rather than armv7m_init(), since that fits better
   with the rest of that SoC's code

These patches sit on top of the NVIC rewrite patchset;
you can find a git branch with the whole lot at:

  https://git.linaro.org/people/peter.maydell/qemu-arm.git v7m-qomify

thanks
-- PMM

Peter Maydell (11):
  armv7m: Abstract out the "load kernel" code
  armv7m: Move NVICState struct definition into header
  armv7m: QOMify the armv7m container
  armv7m: Use QOMified armv7m object in armv7m_init()
  armv7m: Make ARMv7M object take memory region link
  armv7m: Make NVIC expose a memory region rather than mapping itself
  armv7m: Make bitband device take the address space to access
  armv7m: Don't put core v7M devices under CONFIG_STELLARIS
  armv7m: Split systick out from NVIC
  stm32f205: Create armv7m object without using armv7m_init()
  stm32f205: Rename 'nvic' local to 'armv7m'

 hw/intc/Makefile.objs             |   2 +-
 hw/timer/Makefile.objs            |   1 +
 include/hw/arm/arm.h              |  12 ++
 include/hw/arm/armv7m.h           |  63 +++++++
 include/hw/arm/armv7m_nvic.h      |  62 +++++++
 include/hw/arm/stm32f205_soc.h    |   4 +-
 include/hw/timer/armv7m_systick.h |  34 ++++
 hw/arm/armv7m.c                   | 380 +++++++++++++++++++++++++-------------
 hw/arm/netduino2.c                |   7 +-
 hw/arm/stm32f205_soc.c            |  28 ++-
 hw/intc/armv7m_nvic.c             | 214 ++++-----------------
 hw/timer/armv7m_systick.c         | 239 ++++++++++++++++++++++++
 default-configs/arm-softmmu.mak   |   2 +
 hw/timer/trace-events             |   6 +
 14 files changed, 733 insertions(+), 321 deletions(-)
 create mode 100644 include/hw/arm/armv7m.h
 create mode 100644 include/hw/arm/armv7m_nvic.h
 create mode 100644 include/hw/timer/armv7m_systick.h
 create mode 100644 hw/timer/armv7m_systick.c

-- 
2.7.4
