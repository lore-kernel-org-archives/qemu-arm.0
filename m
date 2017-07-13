Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z108sm4258811wrb.41.2017.07.13.07.19.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jul 2017 07:19:31 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 2D0503E07A1;
	Thu, 13 Jul 2017 15:19:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v4 4/6] target/arm/translate: ensure gen_goto_tb sets exit flags
Date: Thu, 13 Jul 2017 15:19:26 +0100
Message-Id: <20170713141928.25419-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170713141928.25419-1-alex.bennee@linaro.org>
References: <20170713141928.25419-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fXR5lilKos6A

As the gen_goto_tb function can do both static and dynamic jumps it
should also set the is_jmp field. This matches the behaviour of the
a64 code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>

--
v4
  - set s->is_jmp = DISAS_TB_JUMP in both cases
---
 target/arm/translate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5f2cea8641..493a7b424a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4158,6 +4158,9 @@ static void gen_goto_ptr(void)
     tcg_temp_free(addr);
 }
 
+/* This will end the TB but doesn't guarantee we'll return to
+ * cpu_loop_exec. Any live exit_requests will be processed as we
+ * enter the next TB. */
 static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
 {
     if (use_goto_tb(s, dest)) {
@@ -4168,6 +4171,7 @@ static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
         gen_set_pc_im(s, dest);
         gen_goto_ptr();
     }
+    s->is_jmp = DISAS_TB_JUMP;
 }
 
 static inline void gen_jmp (DisasContext *s, uint32_t dest)
@@ -4179,7 +4183,6 @@ static inline void gen_jmp (DisasContext *s, uint32_t dest)
         gen_bx_im(s, dest);
     } else {
         gen_goto_tb(s, 0, dest);
-        s->is_jmp = DISAS_TB_JUMP;
     }
 }
 
-- 
2.13.0
