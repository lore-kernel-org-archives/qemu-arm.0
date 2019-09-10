Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id l5sm491162wmj.4.2019.09.10.12.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 12:34:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id BC91C1FF8C;
	Tue, 10 Sep 2019 20:34:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH  v1 1/4] target/ppc: fix signal delivery for ppc64abi32
Date: Tue, 10 Sep 2019 20:34:05 +0100
Message-Id: <20190910193408.28917-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910193408.28917-1-alex.bennee@linaro.org>
References: <20190910193408.28917-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XanWBz+TQgud

We were incorrectly setting NIP resulting in a segfault. This fixes
linux-test for this ABI.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/ppc/signal.c             | 4 +++-
 tests/tcg/configure.sh              | 1 +
 tests/tcg/multiarch/Makefile.target | 5 -----
 3 files changed, 4 insertions(+), 6 deletions(-)

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
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 6c4a471aeae..e8a1a1495fc 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -54,6 +54,7 @@ fi
 : ${cross_cc_cflags_ppc="-m32"}
 : ${cross_cc_ppc64="powerpc-linux-gnu-gcc"}
 : ${cross_cc_cflags_ppc64="-m64"}
+: ${cross_cc_cflags_ppc64abi32="-mcpu=power8"}
 : ${cross_cc_ppc64le="powerpc64le-linux-gnu-gcc"}
 : ${cross_cc_cflags_s390x="-m64"}
 : ${cross_cc_cflags_sparc="-m32 -mv8plus -mcpu=ultrasparc"}
diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 6b1e30e2fec..e6893b2e283 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -12,11 +12,6 @@ VPATH 		+= $(MULTIARCH_SRC)
 MULTIARCH_SRCS   =$(notdir $(wildcard $(MULTIARCH_SRC)/*.c))
 MULTIARCH_TESTS  =$(MULTIARCH_SRCS:.c=)
 
-# FIXME: ppc64abi32 linux-test seems to have issues but the other basic tests work
-ifeq ($(TARGET_NAME),ppc64abi32)
-BROKEN_TESTS = linux-test
-endif
-
 # Update TESTS
 TESTS		+= $(filter-out $(BROKEN_TESTS), $(MULTIARCH_TESTS))
 
-- 
2.20.1
