Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id q186sm465361wmb.33.2018.02.08.09.32.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:32:11 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 855E33E0E68;
	Thu,  8 Feb 2018 17:31:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 24/32] arm/translate-a64: add FP16 FRECPE
Date: Thu,  8 Feb 2018 17:31:49 +0000
Message-Id: <20180208173157.24705-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 50MnJVi8Skwj

Now we have added f16 during the re-factoring we can simply call the
helper.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate-a64.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index da3c7bfa85..4ad5e97f56 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10848,6 +10848,8 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         handle_2misc_fcmp_zero(s, fpop, is_scalar, 0, is_q, MO_16, rn, rd);
         return;
         break;
+    case 0x3d: /* FRECPE */
+        break;
     case 0x18: /* FRINTN */
         need_rmode = true;
         only_in_vector = true;
@@ -10968,6 +10970,9 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         case 0x3b: /* FCVTZS */
             gen_helper_advsimd_f16tosinth(tcg_res, tcg_op, tcg_fpstatus);
             break;
+        case 0x3d: /* FRECPE */
+            gen_helper_recpe_f16(tcg_res, tcg_op, tcg_fpstatus);
+            break;
         case 0x5a: /* FCVTNU */
         case 0x5b: /* FCVTMU */
         case 0x5c: /* FCVTAU */
@@ -11003,6 +11008,9 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             case 0x3b: /* FCVTZS */
                 gen_helper_advsimd_f16tosinth(tcg_res, tcg_op, tcg_fpstatus);
                 break;
+            case 0x3d: /* FRECPE */
+                gen_helper_recpe_f16(tcg_res, tcg_op, tcg_fpstatus);
+                break;
             case 0x5a: /* FCVTNU */
             case 0x5b: /* FCVTMU */
             case 0x5c: /* FCVTAU */
-- 
2.15.1
