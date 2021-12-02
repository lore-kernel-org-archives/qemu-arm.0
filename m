Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f15sm2448073wmg.30.2021.12.02.03.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:53:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 72A0C1FF96;
	Thu,  2 Dec 2021 11:53:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: pbonzini@redhat.com,
	drjones@redhat.com,
	thuth@redhat.com
Cc: kvm@vger.kernel.org,
	qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v9 0/9] MTTCG sanity tests for ARM
Date: Thu,  2 Dec 2021 11:53:43 +0000
Message-Id: <20211202115352.951548-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: J4evJZW+ztDa

Hi,

Not a great deal has changed from the last posting although I have
dropped the additional unittests.cfg in favour of setting "nodefault"
for the tests. Otherwise the clean-ups are mainly textual (removing
printfs, random newlines and cleaning up comments). As usual the
details are in the commits bellow the ---.

I've also tweaked .git/config so get_maintainer.pl should ensure
direct delivery of the patches ;-)

Alex Bennée (9):
  docs: mention checkpatch in the README
  arm/flat.lds: don't drop debug during link
  Makefile: add GNU global tags support
  lib: add isaac prng library from CCAN
  arm/tlbflush-code: TLB flush during code execution
  arm/locking-tests: add comprehensive locking test
  arm/barrier-litmus-tests: add simple mp and sal litmus tests
  arm/run: use separate --accel form
  arm/tcg-test: some basic TCG exercising tests

 arm/run                   |   4 +-
 Makefile                  |   5 +-
 arm/Makefile.arm          |   2 +
 arm/Makefile.arm64        |   2 +
 arm/Makefile.common       |   6 +-
 lib/arm/asm/barrier.h     |  19 ++
 lib/arm64/asm/barrier.h   |  50 +++++
 lib/prng.h                |  82 +++++++
 lib/prng.c                | 162 ++++++++++++++
 arm/flat.lds              |   1 -
 arm/tcg-test-asm.S        | 171 +++++++++++++++
 arm/tcg-test-asm64.S      | 170 ++++++++++++++
 arm/barrier-litmus-test.c | 450 ++++++++++++++++++++++++++++++++++++++
 arm/locking-test.c        | 322 +++++++++++++++++++++++++++
 arm/spinlock-test.c       |  87 --------
 arm/tcg-test.c            | 338 ++++++++++++++++++++++++++++
 arm/tlbflush-code.c       | 209 ++++++++++++++++++
 arm/unittests.cfg         | 170 ++++++++++++++
 README.md                 |   3 +
 19 files changed, 2161 insertions(+), 92 deletions(-)
 create mode 100644 lib/prng.h
 create mode 100644 lib/prng.c
 create mode 100644 arm/tcg-test-asm.S
 create mode 100644 arm/tcg-test-asm64.S
 create mode 100644 arm/barrier-litmus-test.c
 create mode 100644 arm/locking-test.c
 delete mode 100644 arm/spinlock-test.c
 create mode 100644 arm/tcg-test.c
 create mode 100644 arm/tlbflush-code.c

-- 
2.30.2
