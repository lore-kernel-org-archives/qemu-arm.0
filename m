Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id m26sm19363033wrm.4.2017.07.10.08.47.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 08:47:54 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id C76333E0A57;
	Mon, 10 Jul 2017 16:47:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v1 5/6] target/arm: use DISAS_JUMP for ISB handling
Date: Mon, 10 Jul 2017 16:47:48 +0100
Message-Id: <20170710154749.13624-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170710154749.13624-1-alex.bennee@linaro.org>
References: <20170710154749.13624-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kk5A9KjJYLb3

While an ISB will ensure any raised IRQs happen on the next
instruction it doesn't cause any to get raised by itself. We can
therefor use DISAS_JUMP for ISB instructions and rely on the
exit_request check at the top of each TB to deal with exiting if
needed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate-a64.c |  2 +-
 target/arm/translate.c     | 13 +++++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index bde6ca934e..fd9724b890 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1394,7 +1394,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * any pending interrupts immediately.
          */
         gen_a64_set_pc_im(s->pc);
-        s->is_jmp = DISAS_UPDATE;
+        s->is_jmp = DISAS_JUMP;
         return;
     default:
         unallocated_encoding(s);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index e840499c6f..f7f5f917c7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1203,6 +1203,15 @@ static inline void gen_lookup_tb(DisasContext *s)
     s->is_jmp = DISAS_UPDATE;
 }
 
+/* End the current block and force a TB lookup. We may chain to the
+ * next TB but exit_req will be immediately checked so we will exit to
+ * the main loop if we need to */
+static inline void gen_jump_tb(DisasContext *s)
+{
+    tcg_gen_movi_i32(cpu_R[15], s->pc & ~1);
+    s->is_jmp = DISAS_JUMP;
+}
+
 static inline void gen_hlt(DisasContext *s, int imm)
 {
     /* HLT. This has two purposes.
@@ -8171,7 +8180,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                  * self-modifying code correctly and also to take
                  * any pending interrupts immediately.
                  */
-                gen_lookup_tb(s);
+                gen_jump_tb(s);
                 return;
             default:
                 goto illegal_op;
@@ -10564,7 +10573,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                              * and also to take any pending interrupts
                              * immediately.
                              */
-                            gen_lookup_tb(s);
+                            gen_jump_tb(s);
                             break;
                         default:
                             goto illegal_op;
-- 
2.13.0
