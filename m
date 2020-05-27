Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l17sm2331662wmi.16.2020.05.27.03.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 03:05:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B47851FF7E;
	Wed, 27 May 2020 11:05:46 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/3] some linux-user guest_base fixes
Date: Wed, 27 May 2020 11:05:43 +0100
Message-Id: <20200527100546.29297-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LhV2o0ZZYlFo

Hi,

Here are a couple of patches to clean-up guest_base handling for
linux-user guests. There are two cases we hadn't accounted for/tested
enough in the original clean-up:

  - chroots without /proc access
  - 32 bit hosts and the 32 bit ARM COMMPAGE

The solution to the first problem is a simple fall-back to mmap
probing but without the ugliness of the first approach.

The second is a bit of a hack but works. Given we only ever expose one
value from the COMMPAGE it does make me wonder if we could rip out the
special casing and come up with a cleaner ARM only approach by hooking
exceptions? Anyway I've included a test case for the COMMPAGE as well.

Please review

Alex Bennée (3):
  linux-user: provide fallback pgd_find_hole for bare chroots
  linux-user: deal with address wrap for ARM_COMMPAGE on 32 bit
  tests/tcg: add simple commpage test case

 linux-user/elfload.c          | 66 ++++++++++++++++++++++++++++++-----
 tests/tcg/arm/commpage.c      | 61 ++++++++++++++++++++++++++++++++
 tests/tcg/arm/Makefile.target |  2 ++
 3 files changed, 121 insertions(+), 8 deletions(-)
 create mode 100644 tests/tcg/arm/commpage.c

-- 
2.20.1
