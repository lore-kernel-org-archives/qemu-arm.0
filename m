Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id j14sm4405876wrn.32.2020.02.26.10.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 10:10:21 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D5CD91FF87;
	Wed, 26 Feb 2020 18:10:20 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/4] Fix codegen translation cache size 
Date: Wed, 26 Feb 2020 18:10:16 +0000
Message-Id: <20200226181020.19592-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pUwKsd2Zzo5I

Hi,

Slightly more cleaned up series based on what I sent earlier today to
fix the recent slowdown in emulation caused by an overly small
translation cache.

Please review.

Alex Bennée (4):
  accel/tcg: use units.h for defining code gen buffer sizes
  accel/tcg: remove link between guest ram and TCG cache size
  accel/tcg: only USE_STATIC_CODE_GEN_BUFFER on 32 bit hosts
  accel/tcg: increase default code gen buffer size for 64 bit

 accel/tcg/translate-all.c | 42 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

-- 
2.20.1
