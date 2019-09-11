Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p85sm7632122wme.23.2019.09.11.09.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2019 09:50:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E031C1FF87;
	Wed, 11 Sep 2019 17:49:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v5 0/5] semihosting cleanups (plus minor tests/tcg tweak)
Date: Wed, 11 Sep 2019 17:49:54 +0100
Message-Id: <20190911164959.11003-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lo+68qkiqhYp

Hi Peter,

I've restored the #ifndef CONFIG_USER_ONLY to ensure A-profile
linux-user still works. I've cleaned up the now unused linux-user code
and added a simple smoke test to make sure we don't break it my
accident. There is a tests/tcg patch at the beginning of the series
which was just fixing some obvious errors in the tests/tcg comments
which I couldn't leave untouched while I was adding the smoke test. I
can put it in my next testing PR but I'm happy enough for you to take
it through your tree if you want.

Alex Bennée (5):
  tests/tcg: clean-up some comments after the de-tangling
  target/arm: handle M-profile semihosting at translate time
  target/arm: handle A-profile semihosting at translate time
  target/arm: remove run time semihosting checks
  target/arm: remove run-time semihosting checks for linux-user

 linux-user/arm/cpu_loop.c         |  3 -
 linux-user/arm/target_syscall.h   |  3 -
 target/arm/helper.c               | 96 +++++++------------------------
 target/arm/m_helper.c             | 18 ++----
 target/arm/translate.c            | 27 +++++++--
 tests/tcg/Makefile.target         |  7 ++-
 tests/tcg/aarch64/Makefile.target |  8 ++-
 tests/tcg/arm/Makefile.target     | 20 ++++---
 tests/tcg/arm/semihosting.c       | 45 +++++++++++++++
 9 files changed, 120 insertions(+), 107 deletions(-)
 create mode 100644 tests/tcg/arm/semihosting.c

-- 
2.20.1
