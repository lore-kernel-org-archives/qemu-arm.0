Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id d17sm3272847wmb.36.2020.02.28.11.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 11:24:15 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4F87B1FF87;
	Fri, 28 Feb 2020 19:24:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v2 0/4] Clean-up codegen cache size
Date: Fri, 28 Feb 2020 19:24:11 +0000
Message-Id: <20200228192415.19867-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Zy2VzUnoFbwG

Hi,

A few tweaks to the final commit so we are a little less greedy for
translation buffer, especially for the CONFIG_USER case. Otherwise
I've applied the review tags.

Alex Bennée (4):
  accel/tcg: use units.h for defining code gen buffer sizes
  accel/tcg: remove link between guest ram and TCG cache size
  accel/tcg: only USE_STATIC_CODE_GEN_BUFFER on 32 bit hosts
  accel/tcg: increase default code gen buffer size for 64 bit

 accel/tcg/translate-all.c | 61 +++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 25 deletions(-)

-- 
2.20.1
