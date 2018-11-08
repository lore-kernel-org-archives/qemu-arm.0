Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q11-v6sm3566287wrj.7.2018.11.08.08.33.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Nov 2018 08:33:30 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id DE94F3E03FE;
	Thu,  8 Nov 2018 16:33:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 0/6] KVM Guest Debug fixes (plus TCG EL2 debug tweaks)
Date: Thu,  8 Nov 2018 16:33:23 +0000
Message-Id: <20181108163329.19940-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QFXRHkOONlm2

Hi,

These are fixes for guest debug when running under KVM. While
re-spinning these I came across an anomaly which pointed to a kernel
bug that caused the 1st single-step to fail. This is being discussed
on the kvm-arm list:

  Subject: [RFC PATCH] KVM: arm64: don't single-step for non-emulated faults
  Date: Wed, 7 Nov 2018 17:10:31 +0000
  Message-Id: <20181107171031.22573-1-alex.bennee@linaro.org>

As debugging HYP mode code is next to impossible on real hardware I
tried re-creating the single-step bug under TCG. As a result I ran into
some debug and EL2 cases that failed. The final two patches are some
fixes but I'm still seeing some weird behaviour although it is currently
obscured by timer interrupts constantly firing as I enter the to be
single-stepped guest EL1 instruction so they can probably be skipped for
3.1.

Alex Bennée (6):
  target/arm64: properly handle DBGVR RESS bits
  target/arm64: hold BQL when calling do_interrupt()
  target/arm64: kvm debug set target_el when passing exception to guest
  tests/guest-debug: fix scoping of failcount
  arm: use symbolic MDCR_TDE in arm_debug_target_el
  arm: fix aa64_generate_debug_exceptions to work with EL2

 target/arm/cpu.h                  | 29 ++++++++++++++++++-----------
 target/arm/kvm64.c                | 20 ++++++++++++++++++--
 tests/guest-debug/test-gdbstub.py |  1 +
 3 files changed, 37 insertions(+), 13 deletions(-)

-- 
2.17.1
