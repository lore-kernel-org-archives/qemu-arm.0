Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id n71sm10820242wrb.62.2017.07.10.08.47.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 08:47:52 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 8B83C3E0641;
	Mon, 10 Jul 2017 16:47:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v1 3/6] target/arm/translate-a64: make DISAS_UPDATE match declared semantics
Date: Mon, 10 Jul 2017 16:47:46 +0100
Message-Id: <20170710154749.13624-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170710154749.13624-1-alex.bennee@linaro.org>
References: <20170710154749.13624-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fh9MCvQrIgVb

DISAS_UPDATE should be used when the wider CPU state other than just
the PC has been updated and we should therefor exit the TCG runtime
and return to the main execution loop rather assuming DISAS_JUMP would
do that.

As some DISAS_UPDATE users may update the PC dynamically via a helper
we also push the updating to the PC to the call sites which set
->is_jmp to DISAS_UPDATE.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate-a64.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e55547d95d..fe1c49b565 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1393,6 +1393,7 @@ static void handle_sync(DisasContext *s, uint32_t insn,
          * a self-modified code correctly and also to take
          * any pending interrupts immediately.
          */
+        gen_a64_set_pc_im(s->pc);
         s->is_jmp = DISAS_UPDATE;
         return;
     default:
@@ -1593,12 +1594,14 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     if ((s->tb->cflags & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
         /* I/O operations must end the TB here (whether read or write) */
         gen_io_end();
+        gen_a64_set_pc_im(s->pc);
         s->is_jmp = DISAS_UPDATE;
     } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
         /* We default to ending the TB on a coprocessor register write,
          * but allow this to be suppressed by the register definition
          * (usually only necessary to work around guest bugs).
          */
+        gen_a64_set_pc_im(s->pc);
         s->is_jmp = DISAS_UPDATE;
     }
 }
@@ -11364,16 +11367,9 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
         case DISAS_NEXT:
             gen_goto_tb(dc, 1, dc->pc);
             break;
-        default:
-        case DISAS_UPDATE:
-            gen_a64_set_pc_im(dc->pc);
-            /* fall through */
         case DISAS_JUMP:
             tcg_gen_lookup_and_goto_ptr(cpu_pc);
             break;
-        case DISAS_EXIT:
-            tcg_gen_exit_tb(0);
-            break;
         case DISAS_TB_JUMP:
         case DISAS_EXC:
         case DISAS_SWI:
@@ -11397,6 +11393,11 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
              */
             tcg_gen_exit_tb(0);
             break;
+        case DISAS_UPDATE:
+        case DISAS_EXIT:
+        default:
+            tcg_gen_exit_tb(0);
+            break;
         }
     }
 
-- 
2.13.0
