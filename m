Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id b77sm299733wmb.0.2016.10.14.08.13.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Oct 2016 08:13:44 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 211AC3E00B3;
	Fri, 14 Oct 2016 16:13:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] target-arm/translate.c: fix movs pc,lr exception return on ARMv7
Date: Fri, 14 Oct 2016 16:13:36 +0100
Message-Id: <20161014151336.31418-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 70TvAi7APg2X

This was broken by the fix for 9b6a3ea7a699594162ed3d11e4e04b98568dc5c0.
Specifically a movs pc,lr in the kernels ret_fast_syscall returning to
some thumb mode user space code but store_reg unconditionally aligned
the return PC instead of treating the return as an "interworking"
branch.

I suspect we need to audit all calls to store_reg that might involve the
PC to ensure "interworking" branches are correctly handled. Also I'm not
quite sure how the code worked before 9b6a3e as the store_reg path
wouldn't have triggered the store_cpu_field(var, thumb) to set the
processor mode back to thumb.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target-arm/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index 5e21b52..373d68a 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -4318,7 +4318,7 @@ static void gen_mrs_banked(DisasContext *s, int r, int sysm, int rn)
 static void gen_exception_return(DisasContext *s, TCGv_i32 pc)
 {
     TCGv_i32 tmp;
-    store_reg(s, 15, pc);
+    store_reg_bx(s, 15, pc);
     tmp = load_cpu_field(spsr);
     gen_helper_cpsr_write_eret(cpu_env, tmp);
     tcg_temp_free_i32(tmp);
-- 
2.9.3
