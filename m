Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m35-v6sm7451910wrm.51.2018.05.18.04.44.24
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 May 2018 04:44:24 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 260D73E01EF;
	Fri, 18 May 2018 12:44:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 0/2] support reading of CNT[VCT|FRQ]_EL0 from user-space
Date: Fri, 18 May 2018 12:44:22 +0100
Message-Id: <20180518114424.18054-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: h7KHN5zqUA0z

Hi,

The second patch won't build on master until the tcg testing revival
is merged but I've included it for reference.

Alex.

Alex Bennée (2):
  target/arm: support reading of CNT[VCT|FRQ]_EL0 from user-space
  tests/tcg/aarch64: userspace system register test

 target/arm/helper.c               | 27 ++++++++++++++++++++++++---
 tests/tcg/aarch64/Makefile.target |  2 +-
 tests/tcg/aarch64/sysregs.c       | 14 ++++++++++++++
 3 files changed, 39 insertions(+), 4 deletions(-)
 create mode 100644 tests/tcg/aarch64/sysregs.c

-- 
2.17.0
