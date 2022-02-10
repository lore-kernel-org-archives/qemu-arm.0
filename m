Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id eg11sm8146530edb.17.2022.02.10.03.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 03:30:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8612C1FFB7;
	Thu, 10 Feb 2022 11:30:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v5 0/2] semihosting/next (SYS_HEAPINFO)
Date: Thu, 10 Feb 2022 11:30:19 +0000
Message-Id: <20220210113021.3799514-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KvppArMWZTYi

Hi,

I'm working through the backlog of stalled patches in my queue so here
is the latest version of the semihosting info fixes with Peter's
comments addressed. Both patches are still missing their elusive r-b
tags ;-)

Alex Bennée (2):
  semihosting/arm-compat: replace heuristic for softmmu SYS_HEAPINFO
  tests/tcg: port SYS_HEAPINFO to a system test

 include/hw/loader.h                 |  14 +++
 hw/core/loader.c                    |  86 +++++++++++++++++++
 semihosting/arm-compat-semi.c       | 129 +++++++++++++++-------------
 tests/tcg/aarch64/system/semiheap.c |  93 ++++++++++++++++++++
 MAINTAINERS                         |   1 +
 5 files changed, 262 insertions(+), 61 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c

-- 
2.30.2
