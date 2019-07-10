Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v65sm2378601wme.31.2019.07.10.06.13.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 06:13:36 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DCCB21FF87;
	Wed, 10 Jul 2019 14:13:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for semihosting-tests 1/2] semihosting_tests: include a32 and t32 hlt variants in all target
Date: Wed, 10 Jul 2019 14:13:24 +0100
Message-Id: <20190710131325.21442-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qQ5hB5ZxMy4b

While this would likely be triggered by "make run" we should also
include them in the default "make (all)" build target.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1fea97e..7ad2512 100644
--- a/Makefile
+++ b/Makefile
@@ -60,7 +60,9 @@ QEMU_SYSTEM_ARM = $(QEMU_BUILDDIR)/arm-softmmu/qemu-system-arm $(SYSGDB)
 QEMU_SYSTEM_AARCH64 = $(QEMU_BUILDDIR)/aarch64-softmmu/qemu-system-aarch64 $(SYSGDB)
 
 all: usertest-a32 usertest-a64 usertest-t32 \
-	systest-a32.axf systest-t32.axf systest-a64.axf
+	systest-a32.axf systest-t32.axf \
+	systest-a32-hlt.axf systest-t32-hlt.axf \
+	systest-a64.axf
 
 usertest-srcs = usertest.c semihosting.c semicall.S printf/printf.c
 
-- 
2.20.1
