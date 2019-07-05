Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d9sm13335588wrb.71.2019.07.05.09.04.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 09:04:21 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 75FCB1FF87;
	Fri,  5 Jul 2019 17:04:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 4.1 0/5] tcg tests and gdbstub fixes
Date: Fri,  5 Jul 2019 17:04:16 +0100
Message-Id: <20190705160421.19015-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KZKcMV7OjP7o

Hi,

A small selection of clean-up patches covering failing tests and
gdbstub.

The following patches need review
 patch 0002/tests tcg fix up test i386 fprem.ref generation.patch
 patch 0003/tests tcg fix diff out pass to properly report fa.patch
 patch 0004/gdbstub add some notes to the header comment.patch

Alex Bennée (4):
  tests/tcg: fix up test-i386-fprem.ref generation
  tests/tcg: fix diff-out pass to properly report failure
  gdbstub: add some notes to the header comment
  gdbstub: revert to previous set_reg behaviour

Philippe Mathieu-Daudé (1):
  target/arm/vfp_helper: Call set_fpscr_to_host before updating FPSCR
    reg

 gdbstub.c                      | 24 ++++++++++++++++++------
 target/arm/vfp_helper.c        |  4 ++--
 tests/tcg/Makefile             |  6 +++++-
 tests/tcg/i386/Makefile.target |  4 ++--
 4 files changed, 27 insertions(+), 11 deletions(-)

-- 
2.20.1
