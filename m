Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t33sm580277wrc.50.2017.07.11.10.59.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 10:59:42 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 49FB73E0C26;
	Tue, 11 Jul 2017 18:59:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v3 5/6] target/arm: use gen_goto_tb for ISB handling
Date: Tue, 11 Jul 2017 18:59:36 +0100
Message-Id: <20170711175937.23140-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170711175937.23140-1-alex.bennee@linaro.org>
References: <20170711175937.23140-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5EmlCFukLQPc

While an ISB will ensure any raised IRQs happen on the next
instruction it doesn't cause any to get raised by itself. We can
therefor use a simple tb exit for ISB instructions and rely on the
exit_request check at the top of each TB to deal with exiting if
needed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate-a64.c | 2 +-
 target/arm/translate.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 66139b6046..2ac565eb10 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1393,7 +1393,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * a self-modified code correctly and also to take
          * any pending interrupts immediately.
          */
-        s->is_jmp = DISAS_UPDATE;
+        gen_goto_tb(s, 0, s->pc);
         return;
     default:
         unallocated_encoding(s);
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 82341ee709..dbf919cce3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8169,7 +8169,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                  * self-modifying code correctly and also to take
                  * any pending interrupts immediately.
                  */
-                gen_lookup_tb(s);
+                gen_goto_tb(s, 0, s->pc & ~1);
                 return;
             default:
                 goto illegal_op;
@@ -10562,7 +10562,7 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                              * and also to take any pending interrupts
                              * immediately.
                              */
-                            gen_lookup_tb(s);
+                            gen_goto_tb(s, 0, s->pc & ~1);
                             break;
                         default:
                             goto illegal_op;
-- 
2.13.0
