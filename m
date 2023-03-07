Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bi25-20020a05600c3d9900b003e89e3284fasm16533357wmb.36.2023.03.07.03.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 03:28:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 88A981FFB7;
	Tue,  7 Mar 2023 11:28:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvmarm@lists.cs.columbia.edu
Cc: kvm@vger.kernel.org,
	qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvmarm@lists.linux.dev,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v10 0/7] MTTCG sanity tests for ARM
Date: Tue,  7 Mar 2023 11:28:38 +0000
Message-Id: <20230307112845.452053-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TUID: 4Yw3RlgzjUan

I last had a go at getting these up-streamed at the end of 2021 so
its probably worth having another go. From the last iteration a
number of the groundwork patches did get merged:

  Subject: [kvm-unit-tests PATCH v9 0/9] MTTCG sanity tests for ARM
  Date: Thu,  2 Dec 2021 11:53:43 +0000
  Message-Id: <20211202115352.951548-1-alex.bennee@linaro.org>

So this leaves a minor gtags patch, adding the isaac RNG library which
would also be useful for other users, see:

  Subject: [kvm-unit-tests PATCH v3 11/27] lib: Add random number generator
  Date: Tue, 22 Nov 2022 18:11:36 +0200
  Message-Id: <20221122161152.293072-12-mlevitsk@redhat.com>

Otherwise there are a few minor checkpatch tweaks.

I would still like to enable KVM unit tests inside QEMU as things like
the x86 APIC tests are probably a better fit for unit testing TCG
emulation than booting a whole OS with various APICs enabled.

Alex Bennée (7):
  Makefile: add GNU global tags support
  add .gitpublish metadata
  lib: add isaac prng library from CCAN
  arm/tlbflush-code: TLB flush during code execution
  arm/locking-tests: add comprehensive locking test
  arm/barrier-litmus-tests: add simple mp and sal litmus tests
  arm/tcg-test: some basic TCG exercising tests

 Makefile                  |   5 +-
 arm/Makefile.arm          |   2 +
 arm/Makefile.arm64        |   2 +
 arm/Makefile.common       |   6 +-
 lib/arm/asm/barrier.h     |  19 ++
 lib/arm64/asm/barrier.h   |  50 +++++
 lib/prng.h                |  83 +++++++
 lib/prng.c                | 163 ++++++++++++++
 arm/tcg-test-asm.S        | 171 +++++++++++++++
 arm/tcg-test-asm64.S      | 170 ++++++++++++++
 arm/barrier-litmus-test.c | 450 ++++++++++++++++++++++++++++++++++++++
 arm/locking-test.c        | 321 +++++++++++++++++++++++++++
 arm/spinlock-test.c       |  87 --------
 arm/tcg-test.c            | 340 ++++++++++++++++++++++++++++
 arm/tlbflush-code.c       | 209 ++++++++++++++++++
 arm/unittests.cfg         | 170 ++++++++++++++
 .gitignore                |   3 +
 .gitpublish               |  18 ++
 18 files changed, 2180 insertions(+), 89 deletions(-)
 create mode 100644 lib/prng.h
 create mode 100644 lib/prng.c
 create mode 100644 arm/tcg-test-asm.S
 create mode 100644 arm/tcg-test-asm64.S
 create mode 100644 arm/barrier-litmus-test.c
 create mode 100644 arm/locking-test.c
 delete mode 100644 arm/spinlock-test.c
 create mode 100644 arm/tcg-test.c
 create mode 100644 arm/tlbflush-code.c
 create mode 100644 .gitpublish

-- 
2.39.2
