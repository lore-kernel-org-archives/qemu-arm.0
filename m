Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 15sm3580767wmg.36.2019.05.14.08.53.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 08:53:05 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id B877F1FF98;
	Tue, 14 May 2019 16:53:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH  08/11] target/arm: correct return values for WRITE/READ in arm-semi
Date: Tue, 14 May 2019 16:52:58 +0100
Message-Id: <20190514155301.16123-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190514155301.16123-1-alex.bennee@linaro.org>
References: <20190514155301.16123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: i0Gw3FBvCkll

The documentation says the write should return the number of bytes not
written on an error (0 means everything was written). Read provides a
buffer length and the return value should be the buffer length - bytes
actually read. Remove the incorrect FIXME's and return the correct
values.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/arm-semi.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index a3bbef18ef7..3ae8f05d51b 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -334,13 +334,15 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         } else {
             s = lock_user(VERIFY_READ, arg1, len, 1);
             if (!s) {
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                return (uint32_t)-1;
+                /* Return bytes not written on error */
+                return len;
             }
             ret = set_swi_errno(ts, write(arg0, s, len));
             unlock_user(s, arg1, 0);
-            if (ret == (uint32_t)-1)
-                return -1;
+            if (ret == (uint32_t)-1) {
+                ret = 0;
+            }
+            /* Return bytes not written */
             return len - ret;
         }
     case TARGET_SYS_READ:
@@ -355,15 +357,17 @@ target_ulong do_arm_semihosting(CPUARMState *env)
         } else {
             s = lock_user(VERIFY_WRITE, arg1, len, 0);
             if (!s) {
-                /* FIXME - should this error code be -TARGET_EFAULT ? */
-                return (uint32_t)-1;
+                /* return bytes not read */
+                return len;
             }
             do {
                 ret = set_swi_errno(ts, read(arg0, s, len));
             } while (ret == -1 && errno == EINTR);
             unlock_user(s, arg1, len);
-            if (ret == (uint32_t)-1)
-                return -1;
+            if (ret == (uint32_t)-1) {
+                ret = 0;
+            }
+            /* Return bytes not read */
             return len - ret;
         }
     case TARGET_SYS_READC:
-- 
2.20.1
