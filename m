Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 75sm19531824wmw.37.2018.05.02.08.43.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 May 2018 08:43:44 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 3756B3E01C9;
	Wed,  2 May 2018 16:43:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 0/3] refactor float-to-float conversions and fix AHP
Date: Wed,  2 May 2018 16:43:41 +0100
Message-Id: <20180502154344.10585-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lHR0mw8/CHZ2

Hi,

This is a more polished version of the re-factoring of the softfloat
fcvt code. I've split apart the fixes for ARM alternative
half-precision format for easier review. Rather than rely on some
questionable hacks it introduces a new FloatFmt to allow cleaner
handling of the differences in the common code. If there are other
alternative floating point formats they can follow a similar approach.

I've included the test case for reference although I expect it to be
merged with my tcg-testing revival code which has the rest of the
build and test machinery for the test case.

checkpatch dumps a bunch of false-positives as it doesn't like
scientific notation for floats or inline assembler used in the test
case.

Cheers,

Alex Bennée (3):
  fpu/softfloat: re-factor float to float conversions
  fpu/softfloat: support ARM Alternative half-precision
  tests/tcg/aarch64: add fcvt test cases for AArch64 (!UPSTREAM)

 fpu/softfloat-specialize.h |   40 -
 fpu/softfloat.c            |  524 +++------
 include/fpu/softfloat.h    |    8 +-
 tests/tcg/aarch64/fcvt.c   |  296 +++++
 tests/tcg/aarch64/fcvt.ref | 2138 ++++++++++++++++++++++++++++++++++++
 5 files changed, 2588 insertions(+), 418 deletions(-)
 create mode 100644 tests/tcg/aarch64/fcvt.c
 create mode 100644 tests/tcg/aarch64/fcvt.ref

-- 
2.17.0
