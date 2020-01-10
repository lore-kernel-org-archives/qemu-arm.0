Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id x11sm2703165wmg.46.2020.01.10.08.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 08:16:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 45C221FF87;
	Fri, 10 Jan 2020 16:16:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/2] fix for bug 1859021
Date: Fri, 10 Jan 2020 16:16:24 +0000
Message-Id: <20200110161626.31943-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zAAUL3SOEUn2

Hi,

This is a fairly trivial fix for a uint64_t overflow however I spent
some time making sure I understood why we got stuck in a busy loop and
adding tests to both tcg and kvm-unit-tests.

Alex Bennée (2):
  target/arm: detect 64 bit overflow caused by high cval + voff
  tests/tcg: add a vtimer test for aarch64

 target/arm/helper.c                       |  3 +
 tests/tcg/aarch64/system/vtimer.c         | 80 +++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.softmmu-target |  4 ++
 3 files changed, 87 insertions(+)
 create mode 100644 tests/tcg/aarch64/system/vtimer.c

-- 
2.20.1
