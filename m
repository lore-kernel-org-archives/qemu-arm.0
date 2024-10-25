Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086239njx;
        Fri, 25 Oct 2024 07:13:15 -0700 (PDT)
X-Received: by 2002:a05:600c:6002:b0:431:52cc:877a with SMTP id 5b1f17b1804b1-4318424f1b0mr105105445e9.34.1729865595063;
        Fri, 25 Oct 2024 07:13:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865595; cv=none;
        d=google.com; s=arc-20240605;
        b=FBRPr6Sv5XvXPj1VCJyZ71t66KLT6UU99wWOFdkz2NkDGIYqlkGt0uAPa5wPqu5OHR
         I3wpHVoch44SbaZbcVMG8j7go3Xz2KTDwIqJEQmBewCgeFEgEWU1cEs0Rk09dsTW5B38
         YM3xEpbbFpmEM62GJZhfF5HebV9r0qJhRfgzCXjHn/HI4DucrfkQFbg6TYg1CVtDSQMt
         A4gyZi1GbU9ma7kKSoSH40wjE0oF2bID7fFsNkKowB+YHqcUNx9saOaB4lx85gKKbJbE
         ABw2Lo2hC0ZExtXZBIZlB6rMpS9p3geE0Z9ajncHSaC/v5i3BgMPcy8m4Y742Wm4Cgug
         e/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3a+J6mOz6+tgsx1AS0v8GOVI5VoZBPQJco52huASzlo=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=bonlgXv2DG3/dSm5I516xl8YW6jXR9PC7acARN6zfcryd0mlZRFRb3mCVcl9dVV5xY
         9w8crG9eXPo2QyzqvqoiSd/cLCefYKRaxtKpZXzqcStffS+yYHfr0lX+pA83qSFfwGaQ
         GhDIdHWlGemkJelsR4wRzPnUZq1UARKvc0WFNzYXlGFryNVVSLmGRVmKXeLGJ7MrYWOI
         DsTQo9E2rL43ukfPw7cD4wpcxU8lSuVx7GIpsZzbZhQXw54M3FPGWjpWKlfddwNzTom8
         yOAElNX8KYvrYJC80PEso/3CbXyq/IFTdm8DoixHOd9SYolyhvUZnJ+KFGxyOiolIT5F
         CxjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WWZY6nf5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4319397e210sor5715205e9.13.2024.10.25.07.13.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WWZY6nf5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865594; x=1730470394; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3a+J6mOz6+tgsx1AS0v8GOVI5VoZBPQJco52huASzlo=;
        b=WWZY6nf5oHdmUPTWu37l0YIzwt0nVg3HUaHKHWusATIkVrjtpfvCOK8B87ey+Jn+Nl
         g43mQlPM04L7UPmaG64IOSGuemCeffC4KebenvZJ7Ah6h/qNAl+HbJONnZXdjrlgTYgo
         VjBrXklZJoTvq37SqGZzxzZlzv0ZPrd+XU8WaTjBVl5et7jZG5JY3kjGyLWV4Cljiy4U
         z386TYzRwJ7fKpYsWsh3kmuff4E5czjqsOOLKpXzzfzBXt9YSU86+xITENMnT7IeD/Iq
         piNo6Zv3AX1LDp9VcbpkrRICqedftAle1HRyIH7Xky7PmYgCGELMgnpkCAO681wtgwrP
         q9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865594; x=1730470394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3a+J6mOz6+tgsx1AS0v8GOVI5VoZBPQJco52huASzlo=;
        b=Rk5Hufvaj1oGiA/EGaP4w25Z3Hin3WvIxydpnZA6WBtj4i7bMcpgfSpGuCxKpQsoqg
         60TfqNQjTDLWQwxCdcuEzy64Egr8wshOY1s/pX/D7QYhH27wBTIphxX1SFmqTrRyCA2l
         bn+wFqf7jTdiiQErlkamEIwLg0wDJHpbpvaZEQ3yga1Ij2/5s8uLo8KaQnSOacPyqWMk
         VU889LxPD8lCMUKmGVUUhBJNOjmH3/Nd+1altkREVfdceqZqxQhXfIZ/yrjVcwLo7nty
         NyjoCFBZqaoxguHhDKEmOlPaXRonoTt4XaZaNGWWWZrZ8FYKZJ20DNjhnHX9F3/4Ggdc
         Q1Sw==
X-Gm-Message-State: AOJu0YxAdYbC9dmvgPoB2DxXFe2Q2kyo+ZhiXDnpwcghmEfCluXF+atV
	9C27NITo6zVTn7oG1Rw6y+/y6bC4swd0Eyl2aWBBEHjyt85rj0oyLEqnQiPI78mc0g==
X-Google-Smtp-Source: AGHT+IEYMdsaWi/TEfmIcbi85fBTUZ7J91UQRDnMyPxYqnX5zLsKoYqJjNy9q5lZ3k4JbpehHV50wA==
X-Received: by 2002:a05:600c:1d82:b0:431:5ba1:a520 with SMTP id 5b1f17b1804b1-431841eb454mr112345445e9.3.1729865594517;
        Fri, 25 Oct 2024 07:13:14 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:14 -0700 (PDT)
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
Subject: [PATCH 21/21] softfloat: Remove fallback rule from pickNaN()
Date: Fri, 25 Oct 2024 15:12:54 +0100
Message-Id: <20241025141254.2141506-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: X0naUbQ04v3U

Now that all targets have been converted to explicitly set a NaN
propagation rule, we can remove the set of target ifdefs (which now
list every target) and clean up the references to fallback behaviour
for float_2nan_prop_none.

The "default" case in the switch will catch any remaining places
where status->float_2nan_prop_rule was not set by the target.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/fpu/softfloat-types.h  | 10 +++-------
 fpu/softfloat-specialize.c.inc | 23 +++--------------------
 2 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index 5cd5a0d0ae1..8f39691dfd0 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -178,13 +178,9 @@ typedef enum __attribute__((__packed__)) {
  * If default_nan_mode is enabled then it is valid not to set a
  * NaN propagation rule, because the softfloat code guarantees
  * not to try to pick a NaN to propagate in default NaN mode.
- *
- * For transition, currently the 'none' rule will cause us to
- * fall back to picking the propagation rule based on the existing
- * ifdef ladder. When all targets are converted it will be an error
- * not to set the rule in float_status unless in default_nan_mode,
- * and we will assert if we need to handle an input NaN and no
- * rule was selected.
+ * When not in default-NaN mode, it is an error for the target
+ * not to set the rule in float_status, and we will assert if
+ * we need to handle an input NaN and no rule was selected.
  */
 typedef enum __attribute__((__packed__)) {
     /* No propagation rule specified */
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 254bbd67168..b5a32080505 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -390,32 +390,15 @@ bool float32_is_signaling_nan(float32 a_, float_status *status)
 static int pickNaN(FloatClass a_cls, FloatClass b_cls,
                    bool aIsLargerSignificand, float_status *status)
 {
-    Float2NaNPropRule rule = status->float_2nan_prop_rule;
-
     /*
      * We guarantee not to require the target to tell us how to
      * pick a NaN if we're always returning the default NaN.
+     * But if we're not in default-NaN mode then the target must
+     * specify via set_float_2nan_prop_rule().
      */
     assert(!status->default_nan_mode);
 
-    if (rule == float_2nan_prop_none) {
-        /* target didn't set the rule: fall back to old ifdef choices */
-#if defined(TARGET_AVR) || defined(TARGET_HEXAGON) \
-    || defined(TARGET_RISCV) || defined(TARGET_SH4) \
-    || defined(TARGET_TRICORE) || defined(TARGET_ARM) || defined(TARGET_MIPS) \
-    || defined(TARGET_LOONGARCH64) || defined(TARGET_HPPA) \
-    || defined(TARGET_S390X) || defined(TARGET_PPC) || defined(TARGET_M68K) \
-    || defined(TARGET_SPARC) || defined(TARGET_XTENSA) \
-    || defined(TARGET_I386) || defined(TARGET_ALPHA) \
-    || defined(TARGET_MICROBLAZE) || defined(TARGET_OPENRISC) \
-    || defined(TARGET_RX)
-        g_assert_not_reached();
-#else
-        rule = float_2nan_prop_x87;
-#endif
-    }
-
-    switch (rule) {
+    switch (status->float_2nan_prop_rule) {
     case float_2nan_prop_s_ab:
         if (is_snan(a_cls)) {
             return 0;
-- 
2.34.1
