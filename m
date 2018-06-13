Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b80-v6sm4407729wmf.2.2018.06.13.05.56.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 05:56:03 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 7ABF53E116B;
	Wed, 13 Jun 2018 13:56:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 06/22] Makefile: include risu_reginfo_$(ARCH) in HDRS
Date: Wed, 13 Jun 2018 13:55:45 +0100
Message-Id: <20180613125601.14371-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613125601.14371-1-alex.bennee@linaro.org>
References: <20180613125601.14371-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: w4RFjA5xVNVn

Otherwise changes to reginfo don't cause the whole thing to be
re-built causing much confusion when bisecting.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 16e48a0..4aad448 100644
--- a/Makefile
+++ b/Makefile
@@ -21,7 +21,7 @@ ALL_CFLAGS = -Wall -D_GNU_SOURCE -DARCH=$(ARCH) $(BUILD_INC) $(CFLAGS) $(EXTRA_C
 
 PROG=risu
 SRCS=risu.c comms.c reginfo.c risu_$(ARCH).c risu_reginfo_$(ARCH).c
-HDRS=risu.h
+HDRS=risu.h risu_reginfo_$(ARCH).h
 BINS=test_$(ARCH).bin
 
 # For dumping test patterns
-- 
2.17.1
