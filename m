Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d14sm11969644wmd.19.2017.01.19.09.12.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Jan 2017 09:12:42 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 8382F3E29F7;
	Thu, 19 Jan 2017 17:05:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: mttcg@listserver.greensocs.com,
	qemu-devel@nongnu.org,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	cota@braap.org,
	bobby.prani@gmail.com,
	nikunj@linux.vnet.ibm.com
Cc: mark.burton@greensocs.com,
	pbonzini@redhat.com,
	jan.kiszka@siemens.com,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	bamvor.zhangjian@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [PATCH v7 24/27] target-arm: introduce ARM_CP_EXIT_PC
Date: Thu, 19 Jan 2017 17:05:04 +0000
Message-Id: <20170119170507.16185-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170119170507.16185-1-alex.bennee@linaro.org>
References: <20170119170507.16185-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lzyMZNHKGjd+

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
index 366b619b8a..29d15fc522 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1402,7 +1402,8 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
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
index 7e7131fe2f..98d4fac070 100644
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
index 4301562527..e9f46eb757 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7510,6 +7510,10 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
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
