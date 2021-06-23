Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j17sm143492wrx.0.2021.06.23.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 06:47:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 01CB91FF7E;
	Wed, 23 Jun 2021 14:47:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v4 0/2] semihosting/next (SYS_HEAPINFO)
Date: Wed, 23 Jun 2021 14:47:54 +0100
Message-Id: <20210623134756.30930-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UZH/jJRCpWXn

Hi Peter,

This is v4 of the semihosting changes with your proposed algorithm for
finding the largest gap in the various loaded ROMS. The included test
is fairly simple but I also did a bit of manual testing with
guest-loader and loader stanzas and it seemed to do the right thing. I
think this is ready if you are happy with it.

Currently all patches need fresh review and testing given the change
from the originally very simple implementation I proposed on v1 ;-)

Alex Bennée (2):
  semihosting/arm-compat: replace heuristic for softmmu SYS_HEAPINFO
  tests/tcg: port SYS_HEAPINFO to a system test

 include/hw/loader.h                 |  16 ++++
 hw/core/loader.c                    |  74 ++++++++++++++++
 semihosting/arm-compat-semi.c       | 129 +++++++++++++++-------------
 tests/tcg/aarch64/system/semiheap.c |  74 ++++++++++++++++
 4 files changed, 232 insertions(+), 61 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c

-- 
2.20.1
