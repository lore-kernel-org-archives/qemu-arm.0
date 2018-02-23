Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 6sm2370348wrd.57.2018.02.23.07.42.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 07:42:40 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 911B43E165A;
	Fri, 23 Feb 2018 15:36:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 27/31] arm/translate-a64: add FP16 FRSQRTE to simd_two_reg_misc_fp16
Date: Fri, 23 Feb 2018 15:36:32 +0000
Message-Id: <20180223153636.29809-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180223153636.29809-1-alex.bennee@linaro.org>
References: <20180223153636.29809-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9Lg05c7E7fcB

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ba3926262e..faec8084fa 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11388,6 +11388,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x6f: /* FNEG */
         need_fpst = false;
         break;
+    case 0x7d: /* FRSQRTE */
     case 0x7f: /* FSQRT (vector) */
         break;
     default:
@@ -11452,6 +11453,9 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         case 0x6f: /* FNEG */
             tcg_gen_xori_i32(tcg_res, tcg_op, 0x8000);
             break;
+        case 0x7d: /* FRSQRTE */
+            gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
+            break;
         default:
             g_assert_not_reached();
         }
@@ -11504,6 +11508,9 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
             case 0x6f: /* FNEG */
                 tcg_gen_xori_i32(tcg_res, tcg_op, 0x8000);
                 break;
+            case 0x7d: /* FRSQRTE */
+                gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
+                break;
             case 0x7f: /* FSQRT */
                 gen_helper_sqrt_f16(tcg_res, tcg_op, tcg_fpstatus);
                 break;
-- 
2.15.1
