Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id v5sm579911wra.94.2018.02.08.09.40.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Feb 2018 09:40:32 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id CF9893E0FA3;
	Thu,  8 Feb 2018 17:31:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 28/32] arm/translate-a64: add FP16 FRSQRTE to simd_two_reg_misc_fp16
Date: Thu,  8 Feb 2018 17:31:53 +0000
Message-Id: <20180208173157.24705-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180208173157.24705-1-alex.bennee@linaro.org>
References: <20180208173157.24705-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: E40ogOqIJMhl

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate-a64.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 587d072d27..fa21299061 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -10925,6 +10925,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x6f: /* FNEG */
         need_fpst = false;
         break;
+    case 0x7d: /* FRSQRTE */
     case 0x7f: /* FSQRT (vector) */
         break;
     default:
@@ -10989,6 +10990,9 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
         case 0x6f: /* FNEG */
             tcg_gen_xori_i32(tcg_res, tcg_op, 0x8000);
             break;
+        case 0x7d: /* FRSQRTE */
+            gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
+            break;
         default:
             g_assert_not_reached();
         }
@@ -11041,6 +11045,9 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
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
