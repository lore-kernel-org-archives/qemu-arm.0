Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t20-v6sm3460635wmi.24.2018.09.26.04.20.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Sep 2018 04:20:48 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 966ED3E03F8;
	Wed, 26 Sep 2018 12:20:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	omair.javaid@linaro.org,
	ard.biesheuvel@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/4] fixes for kvm/arm64 guest debug
Date: Wed, 26 Sep 2018 12:20:44 +0100
Message-Id: <20180926112048.17778-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /Yjys2Zm/ILp

Hi,

While at Connect I had a go at reproducing a problem that Ard had
reported to me about guest debug not working. I managed to replicate
it and uncovered a few other nits in the process. While upgrading to a
tip-of-tree gdb to get around:

  https://sourceware.org/bugzilla/show_bug.cgi?id=23127

works we certainly can be better at handling the DBGBVR bits in QEMU.
That fixed the additional BQL assertion and target_el assertion
failures are harder to trigger (you need to debug your debug while
debugging debug). However I've included the obvious fixes for that as
well.

Alex Bennée (4):
  target/arm64: properly handle DBGVR RESS bits
  target/arm64: hold BQL when calling do_interrupt()
  target/arm64: kvm debug set target_el when passing exception to guest
  tests/guest-debug: fix scoping of failcount

 target/arm/kvm64.c                | 15 ++++++++++++++-
 tests/guest-debug/test-gdbstub.py |  1 +
 2 files changed, 15 insertions(+), 1 deletion(-)

-- 
2.17.1
