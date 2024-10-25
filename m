Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086023njx;
        Fri, 25 Oct 2024 07:13:01 -0700 (PDT)
X-Received: by 2002:a05:6512:4207:b0:53b:1e70:6ad0 with SMTP id 2adb3069b0e04-53b1e706bf6mr5362379e87.27.1729865581402;
        Fri, 25 Oct 2024 07:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865581; cv=none;
        d=google.com; s=arc-20240605;
        b=Qezf2k29zX9MaY5haJgdAZVtkrZyKvbpRCrsQrGHf0lM+6gu8caUAUclcm9yDUuYZt
         g8iogsRE/4rdE7aFdmHwiaUP0Y3Pc2XLHqnJLJBd1KiyJ1T11xJRSPufdpkd8/QpPO3v
         RBBLwokJeEvEZdGiMN5G7gJw+syUVRFDGr7kOjXyosyETbCbLCRkVmBFLz4r+DHcIa4R
         IweYsQ1ECHKZsErYywbEV97RaO79YbNKt5LyFKnd9SgtOFER2D5ZQD8kPtRu1VXJ6xtc
         m5scAUerFOY0XWSHS22gSIYHLovwAXbeEZp12HwFyetl7Jd3IuEXRMl6DtzxlOuBqlma
         YeAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YDlbbvylJyMrU/YJShcxhMfUmai1iRbva+PhQ15qan4=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=Nspocd8hy0gi1BbQ2bozZI4oloMfiON1Yi13AJubeO1YUjUgJf0LZ8vQmFJRjxcjDf
         tqy/DAFRHgumToDR9xW2uda8D5vi1rNUT8bp2Kw6Ha4wiftU+Sik+/kfM93/lUDSS7ge
         h05+g9UeBrUOVxJ4eBDUGhlNVNDALWmASLTOUkv1zE0aW23bv4dofiEwgoF1nkViWgDw
         xJSXE1+T5anwm6SZ1oiaeCixnxnqAXnINaw4fZgT2+Z5z5mnGsuyDh1QTRgEhsQbaBXa
         dpi9hdnq/ruG0ePfBKWRvbp9C3PAaLDfETP/XVhO20f3Mg/ojp59rHmIUeGawTzWogIf
         0q3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOgF0and;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-431939818c9sor4568245e9.12.2024.10.25.07.13.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dOgF0and;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865581; x=1730470381; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YDlbbvylJyMrU/YJShcxhMfUmai1iRbva+PhQ15qan4=;
        b=dOgF0andZL16bprGo1wgIvDRvDMiYOnJcDfWrD6CVrIa00Xa1BaCA2gtPR6esISkMy
         e1p9KUJ4qf3tdW/acE4BQAPib6p6aD2QAonu9JOxeYZqekr+7V8osZqRKI9Qg0OAPicc
         1GJrJoSL6wnHh0I+RAVNdBSBT1pRqD6QxYA+/6ES3knyg6pXOeuraCqHFAnkJFJwbX1q
         t7wB+pDFtVcGX9vCqaEUo4aQtsP0qvnspAkDotUvLWP4DxpkHILdbB3f0phqyv8qGK4p
         4W54TaW+MaTq6zLB/KN9ykRnk6IoSubVq/dVjX9z0EIZVU99PyFO1VY1MmZUvDD5QN/o
         dJjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865581; x=1730470381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDlbbvylJyMrU/YJShcxhMfUmai1iRbva+PhQ15qan4=;
        b=oBsVHInc+iISZeq5vohtQla2V5G4I0VLFjLlhjYZwq3qdqQaY9nD1Pf2GguMtuCSFK
         FnFAX2q49ZEokVoDzW9m/C2WYrAuKsZyrJBlYqO+1tCZ/VvNE4w0E57/RT0mYPwYoE8C
         yM3TjL9sAe2C2IFa/Q/lJrVPCn6uYHEI6TIDOPIJ+lOTebXRsJL8tA4xGVYE11il2Dm/
         cr0xuABGizFTQVu94QMq8mzFFfiPodR5LTJuqontuJm5SOnQrzLkq1fYfLwuc+9dPMzN
         BqbNOzr6cKiyoels2+gClZrC5o037ze50KPCY7A9/0aukyYh+ZqcVXZ8Wks0zu4SWRYA
         +mxA==
X-Gm-Message-State: AOJu0YxWSLroJzEs2hBakSFd/hWQxfxTYt0h37lazUJM6lcNfRDrt5s5
	m8piKJ0jCbTo4m1sIysRRnWMVmZNiBLo30rzKbZrp8bUK3SB2wl76uIDfhpk5leK8LLn3tjo6VF
	3fPk=
X-Google-Smtp-Source: AGHT+IGhrCfW0xMsmU6S61HVoy3sW36vUuPi9HltT0dQ13BCpWIevBn1kVk6idl0Da/qYmgJw0nA8w==
X-Received: by 2002:a05:600c:1c03:b0:42b:af5a:109 with SMTP id 5b1f17b1804b1-4318424eb98mr90790405e9.24.1729865580849;
        Fri, 25 Oct 2024 07:13:00 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:00 -0700 (PDT)
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
Subject: [PATCH 05/21] target/loongarch: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:38 +0100
Message-Id: <20241025141254.2141506-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ZzgII87Kj74x

Set the 2-NaN propagation rule explicitly in the float_status word we
use.

(There are a couple of places in fpu_helper.c where we create a
dummy float_status word with "float_status *s = { };", but these
are only used for calling float*_is_quiet_nan() so it doesn't
matter that we don't set a 2-NaN propagation rule there.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/loongarch/tcg/fpu_helper.c | 1 +
 fpu/softfloat-specialize.c.inc    | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/loongarch/tcg/fpu_helper.c b/target/loongarch/tcg/fpu_helper.c
index f6753c5875b..21bc3b04a96 100644
--- a/target/loongarch/tcg/fpu_helper.c
+++ b/target/loongarch/tcg/fpu_helper.c
@@ -31,6 +31,7 @@ void restore_fp_status(CPULoongArchState *env)
     set_float_rounding_mode(ieee_rm[(env->fcsr0 >> FCSR0_RM) & 0x3],
                             &env->fp_status);
     set_flush_to_zero(0, &env->fp_status);
+    set_float_2nan_prop_rule(float_2nan_prop_s_ab, &env->fp_status);
 }
 
 int ieee_ex_to_loongarch(int xcpt)
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index c60b999aa3d..bbc3b70fa9d 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -402,10 +402,10 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
         /* target didn't set the rule: fall back to old ifdef choices */
 #if defined(TARGET_AVR) || defined(TARGET_HEXAGON) \
     || defined(TARGET_RISCV) || defined(TARGET_SH4) \
-    || defined(TARGET_TRICORE) || defined(TARGET_ARM) || defined(TARGET_MIPS)
+    || defined(TARGET_TRICORE) || defined(TARGET_ARM) || defined(TARGET_MIPS) \
+    || defined(TARGET_LOONGARCH64)
         g_assert_not_reached();
-#elif defined(TARGET_HPPA) || \
-    defined(TARGET_LOONGARCH64) || defined(TARGET_S390X)
+#elif defined(TARGET_HPPA) || defined(TARGET_S390X)
         rule = float_2nan_prop_s_ab;
 #elif defined(TARGET_PPC) || defined(TARGET_M68K)
         /*
-- 
2.34.1
