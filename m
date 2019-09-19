Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a18sm21374021wrh.25.2019.09.19.10.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 10:10:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3354F1FF93;
	Thu, 19 Sep 2019 18:10:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH  v2 06/16] target/ppc: fix signal delivery for ppc64abi32
Date: Thu, 19 Sep 2019 18:10:05 +0100
Message-Id: <20190919171015.12681-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919171015.12681-1-alex.bennee@linaro.org>
References: <20190919171015.12681-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GDSU/AoqM5e6

We were incorrectly using the 64-bit AIX ABI instead of the 32-bit
SYSV ABI for setting NIP for the signal handler.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---
v2
  - change to wording
---
 linux-user/ppc/signal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index 619a56950df..5b82af6cb62 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -501,7 +501,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     int i, err = 0;
 #if defined(TARGET_PPC64)
     struct target_sigcontext *sc = 0;
+#if !defined(TARGET_ABI32)
     struct image_info *image = ((TaskState *)thread_cpu->opaque)->info;
+#endif
 #endif
 
     rt_sf_addr = get_sigframe(ka, env, sizeof(*rt_sf));
@@ -557,7 +559,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->gpr[5] = (target_ulong) h2g(&rt_sf->uc);
     env->gpr[6] = (target_ulong) h2g(rt_sf);
 
-#if defined(TARGET_PPC64)
+#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
     if (get_ppc64_abi(image) < 2) {
         /* ELFv1 PPC64 function pointers are pointers to OPD entries. */
         struct target_func_ptr *handler =
-- 
2.20.1
