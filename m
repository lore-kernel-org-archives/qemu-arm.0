Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id j9-v6sm318223wri.55.2018.05.10.02.42.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 May 2018 02:42:07 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id E44A63E00CB;
	Thu, 10 May 2018 10:42:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 0/5] refactor float-to-float and fix AHP
Date: Thu, 10 May 2018 10:42:01 +0100
Message-Id: <20180510094206.15354-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MS5Y19jAoH6q

Hi,

Hi,

I've not included the test case in the series but you can find it in
my TCG fixup branch:

  https://github.com/stsquad/qemu/blob/testing/tcg-tests-revival-v4/tests/tcg/arm/fcvt.c

Some of the ARMv7 versions are commented out as they where not
supported until later revs. I do have a build that includes that but
unfortunately the Debian compiler it too old to build it.

: patch 0001/fpu softfloat int_to_float ensure r fully initial.patch needs review
: patch 0004/target arm convert conversion helpers to fpst ahp.patch needs review
: patch 0005/target arm squash FZ16 behaviour for conversions.patch needs review

Alex Bennée (5):
  fpu/softfloat: int_to_float ensure r fully initialised
  fpu/softfloat: re-factor float to float conversions
  fpu/softfloat: support ARM Alternative half-precision
  target/arm: convert conversion helpers to fpst/ahp_flag
  target/arm: squash FZ16 behaviour for conversions

 fpu/softfloat-specialize.h |  40 ---
 fpu/softfloat.c            | 546 +++++++++++--------------------------
 include/fpu/softfloat.h    |   8 +-
 target/arm/helper.c        |  66 ++---
 target/arm/helper.h        |  12 +-
 target/arm/translate-a64.c |  38 ++-
 target/arm/translate.c     |  70 +++--
 target/arm/translate.h     |  15 +
 8 files changed, 306 insertions(+), 489 deletions(-)

-- 
2.17.0
