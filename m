Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id e17sm21300308wre.79.2021.06.15.09.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 09:58:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4DB071FF7E;
	Tue, 15 Jun 2021 17:58:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v3 0/2] semihosting/next (SYS_HEAPINFO)
Date: Tue, 15 Jun 2021 17:57:58 +0100
Message-Id: <20210615165800.23265-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: P0ZMEfavUOyP

Hi,

Hopefully the 3rd time is a charm for this series. I've removed all
the review and tested tags as it is a full rewrite. The code is
hopefully generic and doesn't have to play tricks with guest registers
to work out where RAM is.

Please review.

Alex Bennée (2):
  semihosting/arm-compat: replace heuristic for softmmu SYS_HEAPINFO
  tests/tcg: port SYS_HEAPINFO to a system test

 include/hw/loader.h                 |  10 +++
 hw/core/loader.c                    |  19 ++++
 semihosting/arm-compat-semi.c       | 131 +++++++++++++++-------------
 tests/tcg/aarch64/system/semiheap.c |  74 ++++++++++++++++
 4 files changed, 173 insertions(+), 61 deletions(-)
 create mode 100644 tests/tcg/aarch64/system/semiheap.c

-- 
2.20.1
