Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q5sm7241288wrd.32.2017.01.27.02.43.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Jan 2017 02:43:38 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 4B4413E3770;
	Fri, 27 Jan 2017 10:35:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: 
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM),
	qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v8 23/25] target-arm: introduce ARM_CP_EXIT_PC
Date: Fri, 27 Jan 2017 10:35:03 +0000
Message-Id: <20170127103505.18606-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170127103505.18606-1-alex.bennee@linaro.org>
References: <20170127103505.18606-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MQgZY7GCLb42

Some helpers may trigger an immediate exit of the cpu_loop. If this
happens the PC need to be rectified to ensure the restart will begin
on the next instruction.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.h           | 3 ++-
 target/arm/translate-a64.c | 4 ++++
 target/arm/translate.c     | 4 ++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f56a96c675..1b0670ae11 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1411,7 +1411,8 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 #define ARM_CP_NZCV            (ARM_CP_SPECIAL | (3 << 8))
 #define ARM_CP_CURRENTEL       (ARM_CP_SPECIAL | (4 << 8))
 #define ARM_CP_DC_ZVA          (ARM_CP_SPECIAL | (5 << 8))
-#define ARM_LAST_SPECIAL       ARM_CP_DC_ZVA
+#define ARM_CP_EXIT_PC         (ARM_CP_SPECIAL | (6 << 8))
+#define ARM_LAST_SPECIAL       ARM_CP_EXIT_PC
 /* Used only as a terminator for ARMCPRegInfo lists */
 #define ARM_CP_SENTINEL 0xffff
 /* Mask of only the flag bits in a type field */
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 05162f335e..a3f37d8bec 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1561,6 +1561,10 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         tcg_rt = cpu_reg(s, rt);
         gen_helper_dc_zva(cpu_env, tcg_rt);
         return;
+    case ARM_CP_EXIT_PC:
+        /* The helper may exit the cpu_loop so ensure PC is correct */
+        gen_a64_set_pc_im(s->pc);
+        break;
     default:
         break;
     }
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 444a24c2b6..7bd18cd25d 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7508,6 +7508,10 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
             gen_set_pc_im(s, s->pc);
             s->is_jmp = DISAS_WFI;
             return 0;
+        case ARM_CP_EXIT_PC:
+            /* The helper may exit the cpu_loop so ensure PC is correct */
+            gen_set_pc_im(s, s->pc);
+            break;
         default:
             break;
         }
-- 
2.11.0
