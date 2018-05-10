Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f10-v6sm476056wmc.0.2018.05.10.02.42.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 May 2018 02:42:08 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 59C1C3E04F4;
	Thu, 10 May 2018 10:42:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 5/5] target/arm: squash FZ16 behaviour for conversions
Date: Thu, 10 May 2018 10:42:06 +0100
Message-Id: <20180510094206.15354-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180510094206.15354-1-alex.bennee@linaro.org>
References: <20180510094206.15354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: n1in02zm2QuE

The ARM ARM specifies FZ16 is suppressed for conversions. Rather than
pushing this logic into the softfloat code we can simply save the FZ
state and temporarily disable it for the softfloat call.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 4dd28bb70c..17147be58b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11459,12 +11459,20 @@ uint32_t HELPER(set_neon_rmode)(uint32_t rmode, CPUARMState *env)
 /* Half precision conversions.  */
 static float32 do_fcvt_f16_to_f32(float16 a, float_status *s, bool ahp)
 {
-    return float16_to_float32(a, !ahp, s);
+    flag save_flush_to_zero = s->flush_to_zero;
+    set_flush_to_zero(false, s);
+    float32 r = float16_to_float32(a, !ahp, s);
+    set_flush_to_zero(save_flush_to_zero, s);
+    return r;
 }
 
 static float16 do_fcvt_f32_to_f16(float32 a, float_status *s, bool ahp)
 {
-    return float32_to_float16(a, !ahp, s);
+    flag save_flush_to_zero = s->flush_to_zero;
+    set_flush_to_zero(false, s);
+    float16 r = float32_to_float16(a, !ahp, s);
+    set_flush_to_zero(save_flush_to_zero, s);
+    return float16_val(r);
 }
 
 float32 HELPER(neon_fcvt_f16_to_f32)(float16 a, void *fpstp, uint32_t ahp_mode)
@@ -11494,13 +11502,21 @@ float16 HELPER(vfp_fcvt_f32_to_f16)(float32 a, void *fpstp, uint32_t ahp_mode)
 float64 HELPER(vfp_fcvt_f16_to_f64)(float16 a, void *fpstp, uint32_t ahp_mode)
 {
     float_status *fpst = fpstp;
-    return float16_to_float64(a, !ahp_mode, fpst);
+    flag save_flush_to_zero = fpst->flush_to_zero;
+    set_flush_to_zero(false, fpst);
+    float64 r = float16_to_float64(a, !ahp_mode, fpst);
+    set_flush_to_zero(save_flush_to_zero, fpst);
+    return r;
 }
 
 float16 HELPER(vfp_fcvt_f64_to_f16)(float64 a, void *fpstp, uint32_t ahp_mode)
 {
     float_status *fpst = fpstp;
-    return float64_to_float16(a, !ahp_mode, fpst);
+    flag save_flush_to_zero = fpst->flush_to_zero;
+    set_flush_to_zero(false, fpst);
+    float16 r = float64_to_float16(a, !ahp_mode, fpst);
+    set_flush_to_zero(save_flush_to_zero, fpst);
+    return float16_val(r);
 }
 
 #define float32_two make_float32(0x40000000)
-- 
2.17.0
