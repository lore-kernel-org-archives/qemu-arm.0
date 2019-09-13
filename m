Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v4sm44135003wrg.56.2019.09.13.08.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2019 08:18:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DD40C1FF92;
	Fri, 13 Sep 2019 16:18:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH  v6 5/6] target/arm: remove run-time semihosting checks for linux-user
Date: Fri, 13 Sep 2019 16:18:44 +0100
Message-Id: <20190913151845.12582-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190913151845.12582-1-alex.bennee@linaro.org>
References: <20190913151845.12582-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: a6nnoRJ/VtOp

Now we do all our checking at translate time we can make cpu_loop a
little bit simpler. We also introduce a simple linux-user semihosting
test case to defend the functionality. The out-of-tree softmmu based
semihosting tests are still more comprehensive.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/arm/cpu_loop.c       | 3 ---
 linux-user/arm/target_syscall.h | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index 8d65de5b9f4..e28c45cd4ab 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -325,9 +325,6 @@ void cpu_loop(CPUARMState *env)
 
                 if (n == ARM_NR_cacheflush) {
                     /* nop */
-                } else if (n == ARM_NR_semihosting
-                           || n == ARM_NR_thumb_semihosting) {
-                    env->regs[0] = do_arm_semihosting (env);
                 } else if (n == 0 || n >= ARM_SYSCALL_BASE || env->thumb) {
                     /* linux syscall */
                     if (env->thumb || n == 0) {
diff --git a/linux-user/arm/target_syscall.h b/linux-user/arm/target_syscall.h
index afc0772e194..f85cbdaf56f 100644
--- a/linux-user/arm/target_syscall.h
+++ b/linux-user/arm/target_syscall.h
@@ -18,9 +18,6 @@ struct target_pt_regs {
 #define ARM_NR_set_tls	  (ARM_NR_BASE + 5)
 #define ARM_NR_get_tls    (ARM_NR_BASE + 6)
 
-#define ARM_NR_semihosting	  0x123456
-#define ARM_NR_thumb_semihosting  0xAB
-
 #if defined(TARGET_WORDS_BIGENDIAN)
 #define UNAME_MACHINE "armv5teb"
 #else
-- 
2.20.1
