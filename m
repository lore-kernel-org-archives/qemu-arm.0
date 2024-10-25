Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086140njx;
        Fri, 25 Oct 2024 07:13:08 -0700 (PDT)
X-Received: by 2002:a05:6512:1086:b0:539:e776:71f7 with SMTP id 2adb3069b0e04-53b23e85758mr3693424e87.37.1729865588360;
        Fri, 25 Oct 2024 07:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865588; cv=none;
        d=google.com; s=arc-20240605;
        b=V70e1Ol2XIGXEvI14QG+cX3kI3qYFd7dm1sAv0kcjj7CPgVZ7CB4Tm/voX+lIYHRkT
         q0pkariGaOpu+AF7IKTpWf532WdZNh9rnEZkNNDg7xSwYmx7YskDTtbONeLMW3ajFjk7
         snDod3n08zEaiGS3rRzJszAP3mKr+2sWroJMkz/L5qB4I9LPdMj4OnyF6A29iENf75Z1
         x/+JWAcBta3y0C22xl4wEAX9hFBgl2gGU+HBydwaPFvM2xdmSBrzWVn2AFmCyt1Pgrjv
         6GEfwi7HqLDrXTfZmsgboa8Uef7tYWqyXekOq/rGzu3F2/HFUTYDVSpwNetR6xoyQDoc
         BeCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BczarKbZJDxbjH7vD9cLXbmuaONY9kegQ+oAgDMMF9U=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=RKQlaEhJlZlS/Ugjx8tCqv3nXAtlDcXB+7OrEMliPew/NRWUsHHgvpHEFEAnW0Byko
         fl35bW42Z+aMKFmFQ8DEqlQHfTHQOF5w2V7CYBeCRRR9rEbvHE1mhOqWan4hBZbbmWsK
         peAeK5mmBxL/BF8l8beu6Z7pMCZY45hn/YaT66Kq8E1RPri351YiFgVgvCqm/8OUDx9T
         aSD1/CcXNeZtbAFdQ6xdaJWIsN+ubvKJyenn7Pjur1yq/sufGMGXdG5xNpxaD/eUgFWH
         h7t4ErUQkjAv3EguIpK7VCs810pXYEOpXoTL+iqPOYypKIVSpb0tKNw4j44Gze6VumFK
         GV5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bITmWg5G;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319397e027sor4534515e9.11.2024.10.25.07.13.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bITmWg5G;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865588; x=1730470388; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BczarKbZJDxbjH7vD9cLXbmuaONY9kegQ+oAgDMMF9U=;
        b=bITmWg5G/tflOxkejbAK4j3or1jtKoXIIx+3KdQgeMcjBo1U6CS92L1sIHRKLnkEJZ
         LzUSoHQUN1vTndDb+3lE1L+nD02mMPDYUUq/1k1DeTKWXmrSNpTQGsefXxSr7+foBTWd
         e91Qh6Ci9M2KE/6jXEQ6A6281BRd7hUYRZirFf1yuB8wTezifP67IzuzbZRSm1wBNhor
         /biqlkvOnG5u4ej59I0LJBG7LVZ0GIkmG4rApSsXoAP9M3a1MIZGY4RWLJTDDEPCwm3w
         G8zD7pOpBsLvB8xyXBsd3CQx5XB41N2xf/Dscqvc/jGzcN+j9hKLcNMnKpqpQtFeEiFX
         9dEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865588; x=1730470388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BczarKbZJDxbjH7vD9cLXbmuaONY9kegQ+oAgDMMF9U=;
        b=ParY2wPDu827z2YwWyj1swabAuSHtbFaWbZbp1UcbGLm3NGeGayI8cA6nWiIfaWMX9
         6EP8AtcgoC0mUWTLLMEvPhRzvfwutmOK6ggyvMbXF2cVwH15sWq4PUWEeJwqs7JQ9v0D
         pl6K85TDxxvBVTl/eZTiXXys21lNa+3lDqIfK0B1k2JUkL9/1hOy0pwt9ArLh9lRtc9F
         Os4PimQjHJoHhizYA3adZFbaKKwV7Q2yuKbNoYsSnhCrhccGTYUY1lyrpbGIMHtaPxuC
         hjAW75NlCzTCV3fFnHoAu1bB/f/rDhqjkbCJDe/vX2ZFMJgB+dd9QYFjsuNJY3eBceFM
         R/yw==
X-Gm-Message-State: AOJu0YzF9szkz2oEjXOGMC6dj6MFhCDWDKSDQhjCPLsKj11UP33wbu/K
	N6HA7SvoLKjKl3qFCy6IWu5m7xd5upA0U9upSduysZ5RcMsobES/948uZ07YaFnu+w==
X-Google-Smtp-Source: AGHT+IGNNUYTl0oSNkkML3EYVg7ubOEefufl3uJ7Hu9oF+87c+QcxlU+fQ+f2iqHE1/Nl7pGgL9vYA==
X-Received: by 2002:a05:600c:1552:b0:42c:b750:1a1e with SMTP id 5b1f17b1804b1-4318beb62e6mr50079065e9.0.1729865587749;
        Fri, 25 Oct 2024 07:13:07 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 13/21] target/xtensa: Factor out calls to set_use_first_nan()
Date: Fri, 25 Oct 2024 15:12:46 +0100
Message-Id: <20241025141254.2141506-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ADpkUhZDxxzN

In xtensa we currently call set_use_first_nan() in a lot of
places where we want to switch the NaN-propagation handling.
We're about to change the softfloat API we use to do that,
so start by factoring all the calls out into a single
xtensa_use_first_nan() function.

The bulk of this change was done with
 sed -i -e 's/set_use_first_nan(\([^,]*\),[^)]*)/xtensa_use_first_nan(env, \1)/'  target/xtensa/fpu_helper.c

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/xtensa/cpu.h        |  6 ++++++
 target/xtensa/cpu.c        |  2 +-
 target/xtensa/fpu_helper.c | 33 +++++++++++++++++++--------------
 3 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index 9f2341d8563..77e48eef19c 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -802,4 +802,10 @@ static inline void cpu_get_tb_cpu_state(CPUXtensaState *env, vaddr *pc,
 XtensaCPU *xtensa_cpu_create_with_clock(const char *cpu_type,
                                         Clock *cpu_refclk);
 
+/*
+ * Set the NaN propagation rule for future FPU operations:
+ * use_first is true to pick the first NaN as the result if both
+ * inputs are NaNs, false to pick the second.
+ */
+void xtensa_use_first_nan(CPUXtensaState *env, bool use_first);
 #endif
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index a08c7a0b1f2..6f9039abaee 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -134,7 +134,7 @@ static void xtensa_cpu_reset_hold(Object *obj, ResetType type)
     cs->halted = env->runstall;
 #endif
     set_no_signaling_nans(!dfpu, &env->fp_status);
-    set_use_first_nan(!dfpu, &env->fp_status);
+    xtensa_use_first_nan(env, !dfpu);
 }
 
 static ObjectClass *xtensa_cpu_class_by_name(const char *cpu_model)
diff --git a/target/xtensa/fpu_helper.c b/target/xtensa/fpu_helper.c
index 381e83ded83..50a5efa65e2 100644
--- a/target/xtensa/fpu_helper.c
+++ b/target/xtensa/fpu_helper.c
@@ -57,6 +57,11 @@ static const struct {
     { XTENSA_FP_V, float_flag_invalid, },
 };
 
+void xtensa_use_first_nan(CPUXtensaState *env, bool use_first)
+{
+    set_use_first_nan(use_first, &env->fp_status);
+}
+
 void HELPER(wur_fpu2k_fcr)(CPUXtensaState *env, uint32_t v)
 {
     static const int rounding_mode[] = {
@@ -171,87 +176,87 @@ float32 HELPER(fpu2k_msub_s)(CPUXtensaState *env,
 
 float64 HELPER(add_d)(CPUXtensaState *env, float64 a, float64 b)
 {
-    set_use_first_nan(true, &env->fp_status);
+    xtensa_use_first_nan(env, true);
     return float64_add(a, b, &env->fp_status);
 }
 
 float32 HELPER(add_s)(CPUXtensaState *env, float32 a, float32 b)
 {
-    set_use_first_nan(env->config->use_first_nan, &env->fp_status);
+    xtensa_use_first_nan(env, env->config->use_first_nan);
     return float32_add(a, b, &env->fp_status);
 }
 
 float64 HELPER(sub_d)(CPUXtensaState *env, float64 a, float64 b)
 {
-    set_use_first_nan(true, &env->fp_status);
+    xtensa_use_first_nan(env, true);
     return float64_sub(a, b, &env->fp_status);
 }
 
 float32 HELPER(sub_s)(CPUXtensaState *env, float32 a, float32 b)
 {
-    set_use_first_nan(env->config->use_first_nan, &env->fp_status);
+    xtensa_use_first_nan(env, env->config->use_first_nan);
     return float32_sub(a, b, &env->fp_status);
 }
 
 float64 HELPER(mul_d)(CPUXtensaState *env, float64 a, float64 b)
 {
-    set_use_first_nan(true, &env->fp_status);
+    xtensa_use_first_nan(env, true);
     return float64_mul(a, b, &env->fp_status);
 }
 
 float32 HELPER(mul_s)(CPUXtensaState *env, float32 a, float32 b)
 {
-    set_use_first_nan(env->config->use_first_nan, &env->fp_status);
+    xtensa_use_first_nan(env, env->config->use_first_nan);
     return float32_mul(a, b, &env->fp_status);
 }
 
 float64 HELPER(madd_d)(CPUXtensaState *env, float64 a, float64 b, float64 c)
 {
-    set_use_first_nan(env->config->use_first_nan, &env->fp_status);
+    xtensa_use_first_nan(env, env->config->use_first_nan);
     return float64_muladd(b, c, a, 0, &env->fp_status);
 }
 
 float32 HELPER(madd_s)(CPUXtensaState *env, float32 a, float32 b, float32 c)
 {
-    set_use_first_nan(env->config->use_first_nan, &env->fp_status);
+    xtensa_use_first_nan(env, env->config->use_first_nan);
     return float32_muladd(b, c, a, 0, &env->fp_status);
 }
 
 float64 HELPER(msub_d)(CPUXtensaState *env, float64 a, float64 b, float64 c)
 {
-    set_use_first_nan(env->config->use_first_nan, &env->fp_status);
+    xtensa_use_first_nan(env, env->config->use_first_nan);
     return float64_muladd(b, c, a, float_muladd_negate_product,
                           &env->fp_status);
 }
 
 float32 HELPER(msub_s)(CPUXtensaState *env, float32 a, float32 b, float32 c)
 {
-    set_use_first_nan(env->config->use_first_nan, &env->fp_status);
+    xtensa_use_first_nan(env, env->config->use_first_nan);
     return float32_muladd(b, c, a, float_muladd_negate_product,
                           &env->fp_status);
 }
 
 float64 HELPER(mkdadj_d)(CPUXtensaState *env, float64 a, float64 b)
 {
-    set_use_first_nan(true, &env->fp_status);
+    xtensa_use_first_nan(env, true);
     return float64_div(b, a, &env->fp_status);
 }
 
 float32 HELPER(mkdadj_s)(CPUXtensaState *env, float32 a, float32 b)
 {
-    set_use_first_nan(env->config->use_first_nan, &env->fp_status);
+    xtensa_use_first_nan(env, env->config->use_first_nan);
     return float32_div(b, a, &env->fp_status);
 }
 
 float64 HELPER(mksadj_d)(CPUXtensaState *env, float64 v)
 {
-    set_use_first_nan(true, &env->fp_status);
+    xtensa_use_first_nan(env, true);
     return float64_sqrt(v, &env->fp_status);
 }
 
 float32 HELPER(mksadj_s)(CPUXtensaState *env, float32 v)
 {
-    set_use_first_nan(env->config->use_first_nan, &env->fp_status);
+    xtensa_use_first_nan(env, env->config->use_first_nan);
     return float32_sqrt(v, &env->fp_status);
 }
 
-- 
2.34.1
