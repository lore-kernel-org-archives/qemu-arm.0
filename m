Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l8sm3153464wmd.15.2017.07.11.10.59.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 10:59:40 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 389B73E0C22;
	Tue, 11 Jul 2017 18:59:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v3 4/6] target/arm/translate: ensure gen_goto_tb sets exit flags
Date: Tue, 11 Jul 2017 18:59:35 +0100
Message-Id: <20170711175937.23140-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170711175937.23140-1-alex.bennee@linaro.org>
References: <20170711175937.23140-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: D1V4TR81ODmH

As the gen_goto_tb function can do both static and dynamic jumps it
should also set the is_jmp field. This matches the behaviour of the
a64 code.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 5f2cea8641..82341ee709 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4158,15 +4158,20 @@ static void gen_goto_ptr(void)
     tcg_temp_free(addr);
 }
 
+/* This will end the TB but doesn't guarantee we'll return to
+ * cpu_loop_exec. Any live exit_requests will be processed as we
+ * enter the next TB. */
 static void gen_goto_tb(DisasContext *s, int n, target_ulong dest)
 {
     if (use_goto_tb(s, dest)) {
         tcg_gen_goto_tb(n);
         gen_set_pc_im(s, dest);
         tcg_gen_exit_tb((uintptr_t)s->tb + n);
+        s->is_jmp = DISAS_TB_JUMP;
     } else {
         gen_set_pc_im(s, dest);
         gen_goto_ptr();
+        s->is_jmp = DISAS_JUMP;
     }
 }
 
@@ -4179,7 +4184,6 @@ static inline void gen_jmp (DisasContext *s, uint32_t dest)
         gen_bx_im(s, dest);
     } else {
         gen_goto_tb(s, 0, dest);
-        s->is_jmp = DISAS_TB_JUMP;
     }
 }
 
-- 
2.13.0
