Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z192sm2080752wmz.44.2017.07.20.08.04.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jul 2017 08:04:41 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 610773E09EC;
	Thu, 20 Jul 2017 16:04:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: rth@twiddle.net,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH for 2.11 13/23] target/arm/translate-a64.c: add FP16 FADD to AdvSIMD 3 Same
Date: Thu, 20 Jul 2017 16:04:16 +0100
Message-Id: <20170720150426.12393-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170720150426.12393-1-alex.bennee@linaro.org>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: GBXg039cnjVV

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper-a64.h    | 1 +
 target/arm/translate-a64.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
index 48b400ca8e..f4992e7b36 100644
--- a/target/arm/helper-a64.h
+++ b/target/arm/helper-a64.h
@@ -47,3 +47,4 @@ DEF_HELPER_FLAGS_4(paired_cmpxchg64_be, TCG_CALL_NO_WG, i64, env, i64, i64, i64)
 
 /* helper_advsimd.c */
 DEF_HELPER_3(advsimd_acgt_f16, i32, i32, i32, ptr)
+DEF_HELPER_3(advsimd_addh, f32, f32, f32, ptr)
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 06da8408f6..f6aca395bd 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -9764,6 +9764,9 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
         read_vec_element_i32(s, tcg_op2, rm, pass, MO_16);
 
         switch (fpopcode) {
+        case 0x2: /* FADD */
+            gen_helper_advsimd_addh(tcg_res, tcg_op1, tcg_op2, fpst);
+            break;
         case 0x35: /* FACGT */
             gen_helper_advsimd_acgt_f16(tcg_res, tcg_op1, tcg_op2, fpst);
             break;
-- 
2.13.0
