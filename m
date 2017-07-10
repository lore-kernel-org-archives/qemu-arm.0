Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 24sm16248217wrw.0.2017.07.10.12.21.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 12:21:28 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 922493E03FE;
	Mon, 10 Jul 2017 20:21:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	rth@twiddle.net,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v2 2/5] target/arm/translate: make DISAS_UPDATE match declared semantics
Date: Mon, 10 Jul 2017 20:21:25 +0100
Message-Id: <20170710192128.9048-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170710192128.9048-1-alex.bennee@linaro.org>
References: <20170710192128.9048-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oWqLSmgcIyFJ

DISAS_UPDATE should be used when the wider CPU state other than just
the PC has been updated and we should therefor exit the TCG runtime
and return to the main execution loop rather assuming DISAS_JUMP would
do that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate-a64.c | 14 +++++++-------
 target/arm/translate.c     |  5 ++---
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e55547d95d..66139b6046 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11364,16 +11364,9 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
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
@@ -11397,6 +11390,13 @@ void gen_intermediate_code_a64(ARMCPU *cpu, TranslationBlock *tb)
              */
             tcg_gen_exit_tb(0);
             break;
+        case DISAS_UPDATE:
+            gen_a64_set_pc_im(dc->pc);
+            /* fall through */
+        case DISAS_EXIT:
+        default:
+            tcg_gen_exit_tb(0);
+            break;
         }
     }
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 0862f9e4aa..ccc4768b2e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -12095,12 +12095,11 @@ void gen_intermediate_code(CPUARMState *env, TranslationBlock *tb)
         case DISAS_NEXT:
             gen_goto_tb(dc, 1, dc->pc);
             break;
-        case DISAS_UPDATE:
-            gen_set_pc_im(dc, dc->pc);
-            /* fall through */
         case DISAS_JUMP:
             gen_goto_ptr();
             break;
+        case DISAS_UPDATE:
+            gen_set_pc_im(dc, dc->pc);
         default:
             /* indicate that the hash table must be used to find the next TB */
             tcg_gen_exit_tb(0);
-- 
2.13.0
