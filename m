Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id w19sm10714852wmc.22.2020.01.31.07.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2020 07:34:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 0987A1FF87;
	Fri, 31 Jan 2020 15:34:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] target/arm: fix TCG leak for fcvt half->double
Date: Fri, 31 Jan 2020 15:34:39 +0000
Message-Id: <20200131153439.26027-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vn0/jI/Z6oSl

When support for the AHP flag was added we inexplicably only freed the
new temps in one of the two legs. Move those tcg_temp_free to the same
level as the allocation to fix that leak.

Fixes: 486624fcd3eac
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 96a5be2b372..766a03335bf 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5778,8 +5778,6 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
             TCGv_i32 tcg_rd = tcg_temp_new_i32();
             gen_helper_vfp_fcvt_f16_to_f32(tcg_rd, tcg_rn, tcg_fpst, tcg_ahp);
             write_fp_sreg(s, rd, tcg_rd);
-            tcg_temp_free_ptr(tcg_fpst);
-            tcg_temp_free_i32(tcg_ahp);
             tcg_temp_free_i32(tcg_rd);
         } else {
             /* Half to double */
@@ -5789,6 +5787,8 @@ static void handle_fp_fcvt(DisasContext *s, int opcode,
             tcg_temp_free_i64(tcg_rd);
         }
         tcg_temp_free_i32(tcg_rn);
+        tcg_temp_free_ptr(tcg_fpst);
+        tcg_temp_free_i32(tcg_ahp);
         break;
     }
     default:
-- 
2.20.1
