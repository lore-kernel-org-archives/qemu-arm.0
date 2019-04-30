Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id u17sm2063472wmj.1.2019.04.30.09.52.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2019 09:52:35 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AFE0E1FF91;
	Tue, 30 Apr 2019 17:52:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	mark.cave-ayland@ilande.co.uk,
	cota@braap.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v5 04/15] tests/tcg/multiarch: move the system memory test
Date: Tue, 30 Apr 2019 17:52:23 +0100
Message-Id: <20190430165234.32272-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430165234.32272-1-alex.bennee@linaro.org>
References: <20190430165234.32272-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: P2Szy4r0haE4

There is nothing inherently architecture specific about the memory
test although we may have to manage different restrictions of
unaligned access across architectures.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/{i386 => multiarch}/system/memory.c | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename tests/tcg/{i386 => multiarch}/system/memory.c (100%)

diff --git a/tests/tcg/i386/system/memory.c b/tests/tcg/multiarch/system/memory.c
similarity index 100%
rename from tests/tcg/i386/system/memory.c
rename to tests/tcg/multiarch/system/memory.c
-- 
2.20.1
