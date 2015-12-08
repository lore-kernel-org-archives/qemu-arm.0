Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f11sm4617031wmd.7.2015.12.08.10.32.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Dec 2015 10:32:57 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 7B08A3E027E;
	Tue,  8 Dec 2015 18:32:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	christoffer.dall@linaro.org,
	zhichao.huang@linaro.org
Cc: kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	marc.zyngier@arm.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v10 0/6] QEMU support for KVM Guest Debug on arm64
Date: Tue,  8 Dec 2015 18:32:27 +0000
Message-Id: <1449599553-24713-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.6.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TAxV7scOL93w

Hi,

Here is the latest patch set to support debugging of KVM guests on
arm64. The main changes are fixing arm32 compiles (mostly with stubs
for the upcomming arm32 debug) and the usual bunch of minor tweaks and
clarifications following review.

I've kept the GDB Python based test in tests/guest-debug and cleaned
it up so it will work with python2/3 linked GDBs. It still isn't
plumbed it in to the "make check" so can be dropped until we have a
solution for testing against non-host binaries.

So in summary the changes are:

  - Fixed arm32 compile
  - Use results of debug capability checks
  - Whitespace and comment cleanups
  - Py2/3 cleanliness for test script

More detailed changelogs are attached to each patch.

GIT Repo:

The patch series is based off a recent master and can be found at:

https://github.com/stsquad/qemu
branch: kvm/guest-debug-v10

Alex Bennée (6):
  target-arm: kvm64 - introduce kvm_arm_init_debug()
  target-arm: kvm - implement software breakpoints
  target-arm: kvm - support for single step
  target-arm: kvm - add support for HW assisted debug
  target-arm: kvm - re-inject guest debug exceptions
  tests/guest-debug: introduce basic gdbstub tests

 target-arm/helper-a64.c           |  12 +-
 target-arm/kvm.c                  |  65 +++---
 target-arm/kvm32.c                |  47 ++++
 target-arm/kvm64.c                | 464 ++++++++++++++++++++++++++++++++++++++
 target-arm/kvm_arm.h              |  30 +++
 tests/guest-debug/test-gdbstub.py | 176 +++++++++++++++
 6 files changed, 757 insertions(+), 37 deletions(-)
 create mode 100644 tests/guest-debug/test-gdbstub.py

-- 
2.6.3
