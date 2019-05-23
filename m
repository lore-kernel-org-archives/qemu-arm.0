Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b136sm9875486wmg.1.2019.05.23.03.25.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 03:25:35 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 4A35B1FF98;
	Thu, 23 May 2019 11:25:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Aleksandar Rikalo <arikalo@wavecomp.com>
Subject: [PATCH  v2 09/28] target/mips: only build mips-semi for softmmu
Date: Thu, 23 May 2019 11:25:13 +0100
Message-Id: <20190523102532.10486-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523102532.10486-1-alex.bennee@linaro.org>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: SkVO4L1//dTX

The is_uhi gates all semihosting calls and always returns false for
CONFIG_USER_ONLY builds. There is no reason to build and link
mips-semi for these builds so lets fix that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/Makefile.objs | 3 ++-
 target/mips/helper.h      | 2 ++
 target/mips/translate.c   | 8 ++++++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/mips/Makefile.objs b/target/mips/Makefile.objs
index 651f36f5176..3448ad5e193 100644
--- a/target/mips/Makefile.objs
+++ b/target/mips/Makefile.objs
@@ -1,4 +1,5 @@
 obj-y += translate.o dsp_helper.o op_helper.o lmi_helper.o helper.o cpu.o
-obj-y += gdbstub.o msa_helper.o mips-semi.o
+obj-y += gdbstub.o msa_helper.o
+obj-$(CONFIG_SOFTMMU) += mips-semi.o
 obj-$(CONFIG_SOFTMMU) += machine.o cp0_timer.o
 obj-$(CONFIG_KVM) += kvm.o
diff --git a/target/mips/helper.h b/target/mips/helper.h
index a6d687e3405..90ab03b76e3 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -2,7 +2,9 @@ DEF_HELPER_3(raise_exception_err, noreturn, env, i32, int)
 DEF_HELPER_2(raise_exception, noreturn, env, i32)
 DEF_HELPER_1(raise_exception_debug, noreturn, env)
 
+#ifndef CONFIG_USER_ONLY
 DEF_HELPER_1(do_semihosting, void, env)
+#endif
 
 #ifdef TARGET_MIPS64
 DEF_HELPER_4(sdl, void, env, tl, tl, int)
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 3cd5b11b16b..fb905c88b57 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -13726,6 +13726,14 @@ static inline bool is_uhi(int sdbbp_code)
 #endif
 }
 
+#ifdef CONFIG_USER_ONLY
+/* The above should dead-code away any calls to this..*/
+static inline void gen_helper_do_semihosting(void *env)
+{
+    g_assert_not_reached();
+}
+#endif
+
 static int decode_mips16_opc (CPUMIPSState *env, DisasContext *ctx)
 {
     int rx, ry;
-- 
2.20.1
