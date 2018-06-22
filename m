Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b186-v6sm2028443wmh.4.2018.06.22.07.12.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jun 2018 07:12:08 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 9CDB03E0930;
	Fri, 22 Jun 2018 15:12:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v4 06/22] Makefile: include risu_reginfo_$(ARCH) in HDRS
Date: Fri, 22 Jun 2018 15:11:49 +0100
Message-Id: <20180622141205.16306-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180622141205.16306-1-alex.bennee@linaro.org>
References: <20180622141205.16306-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ixGG4j0wCCld

Otherwise changes to reginfo don't cause the whole thing to be
re-built causing much confusion when bisecting.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
