Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w18sm7054926wru.15.2019.05.14.08.53.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 08:53:05 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A38941FF96;
	Tue, 14 May 2019 16:53:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH  07/11] target/arm: add LOG_UNIMP messages to arm-semi
Date: Tue, 14 May 2019 16:52:57 +0100
Message-Id: <20190514155301.16123-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514155301.16123-1-alex.bennee@linaro.org>
References: <20190514155301.16123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rWPQnxdhwgGi

Clean-up our unimplemented bits with a proper message.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/arm-semi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index 253c66b172a..a3bbef18ef7 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -28,6 +28,7 @@
 #include "cpu.h"
 #include "hw/semihosting/semihost.h"
 #include "hw/semihosting/console.h"
+#include "qemu/log.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 
@@ -366,7 +367,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return len - ret;
         }
     case TARGET_SYS_READC:
-       /* XXX: Read from debug console. Not implemented.  */
+        qemu_log_mask(LOG_UNIMP, "%s: SYS_READC not implemented", __func__);
         return 0;
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
@@ -400,7 +401,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             return buf.st_size;
         }
     case TARGET_SYS_TMPNAM:
-        /* XXX: Not implemented.  */
+        qemu_log_mask(LOG_UNIMP, "%s: SYS_TMPNAM not implemented", __func__);
         return -1;
     case TARGET_SYS_REMOVE:
         GET_ARG(0);
-- 
2.20.1
