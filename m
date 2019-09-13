Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 189sm5765440wma.6.2019.09.13.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 08:18:46 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6C9291FF87;
	Fri, 13 Sep 2019 16:18:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v6 0/6] semihosting cleanups (plus minor tests/tcg tweak)
Date: Fri, 13 Sep 2019 16:18:39 +0100
Message-Id: <20190913151845.12582-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XzkzgqfdcdSG

Hi Peter,

I've restored the #ifndef CONFIG_USER_ONLY check to M-profile as well
and split the linux-user semihosting smoke check into a new commit.

Alex Bennée (6):
  tests/tcg: clean-up some comments after the de-tangling
  target/arm: handle M-profile semihosting at translate time
  target/arm: handle A-profile semihosting at translate time
  target/arm: remove run time semihosting checks
  target/arm: remove run-time semihosting checks for linux-user
  tests/tcg: add linux-user semihosting smoke test for ARM

 linux-user/arm/cpu_loop.c         |  3 -
 linux-user/arm/target_syscall.h   |  3 -
 target/arm/helper.c               | 96 +++++++------------------------
 target/arm/m_helper.c             | 18 ++----
 target/arm/translate.c            | 30 ++++++++--
 tests/tcg/Makefile.target         |  7 ++-
 tests/tcg/aarch64/Makefile.target |  8 ++-
 tests/tcg/arm/Makefile.target     | 20 ++++---
 tests/tcg/arm/semihosting.c       | 45 +++++++++++++++
 9 files changed, 123 insertions(+), 107 deletions(-)
 create mode 100644 tests/tcg/arm/semihosting.c

-- 
2.20.1
