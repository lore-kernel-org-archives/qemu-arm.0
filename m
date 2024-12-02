Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802262njk;
        Mon, 2 Dec 2024 05:14:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXs6BOCA5UwO1L32HI8CeA2G2i5qJi1C37/G4wT6kqvaLVs+vCVxhgiN6sjdzmVYDbUai/0xtw4f77OOw==@linaro.org
X-Received: by 2002:a05:600c:4f12:b0:432:a36b:d896 with SMTP id 5b1f17b1804b1-434a9de54c6mr180847875e9.26.1733145273883;
        Mon, 02 Dec 2024 05:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145273; cv=none;
        d=google.com; s=arc-20240605;
        b=AjkXnveTRwbCbbFuT1ZYAbhCoPh2ZhDBViRn8UTrLGO+yVEeXL+ktMkH//iiSU9m7A
         L8vysl1aAlN9Bc9Zmd1o0kV368HB9Cw2D9npx82lxxirmu8E5p9hQJGKl1kXqt1w1hUc
         oehCAr6GGpQC2aKeEyfC0lVyyJJWQjoSw5435zP/ea0TJSxFdOFMNmBkUJXbuIcW5dat
         x4R2QHsvyedr+Hkkv+uzo7We95vPpOhe/VvHN//07KkXOUUp+klja2w7km0aTuFxFpkF
         H+antJsf9vyIK5xFxHXFs9MfhKjN96pY1dH8gs26xpNMhgvW9QNvoiLOIeOAPCszHj+Y
         aSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jZmEjYqAtBnicHjPyhH8ft0gcTQribvPLCBufh/En/c=;
        fh=/cEly2vE7QY5JEP7v3dRH2/W4d2ExF1Q7nPfaednY9o=;
        b=OTIQTITVXpXWdTHbI7/kbwZLWDjplWjg/up/24RPlnbC4JtsjWB2bllkV9kepXUD+i
         TBAttfwdDqPDpt9U+eF0BLu7uMX75ldD1K7Gh7DJL7TYqCBN1rKNQcCQfqSDVFAbpvbD
         IhBop4+JfzY02HSHTOOaUX39DN9l2ZXPCJLyVSRV2dzekGA096fPWAmuwpJOgJaUFD7B
         K2BevhX367SiMXAoYDkC3XqhdGi4/rwpOdZOmjDx1fKX1Bgn3/B/QVHBTNKYWMUpofu2
         GQguKoJaFVp42F7ge8sUb2s1B3aVw3SsLdE7LXrLT5RuWjHqgep3iqW8ZkB4+TGSwfc+
         PmUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lz2sp/46";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b1095bf2sor34247065e9.7.2024.12.02.05.14.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="lz2sp/46";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145273; x=1733750073; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZmEjYqAtBnicHjPyhH8ft0gcTQribvPLCBufh/En/c=;
        b=lz2sp/46NRhiWcBJo+jw6THl6FbjydrHZLbC4EMzeOt9OppZ+TGN6r+Pvs/mmNW7jE
         bhH8e+lNbDAmgDupWr0m1f75FnK8kALdvDfpJ484gOQBUMej+qEwZWOBe3uDK1zrVKrS
         zSAei1izmwzsY60UWvaskTejJcSq/dAyFOzh69DwhvuZZmLLfy6W/kIdb2vJT7U2dKyq
         pRHnbgN9cUL4YtWzwiGueLB4vx6nh3qub5Rglx3NO2d225wG97gsooM974mA38RwrNV+
         JDRhg1LnCHVUigw7QMu0uwIF5PlFPYkirVFQxWBmqXWGhRCpTEDdaBjYbadQCsYVHair
         v4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145273; x=1733750073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZmEjYqAtBnicHjPyhH8ft0gcTQribvPLCBufh/En/c=;
        b=dsqGAe/J1Jnlw2zaXwp7FUG5d8E2DYgkbiQ+wITgGuymeNJrTZqjwYllbv1CYE2t+1
         u4UOYKT0rPLAH+saekY9250EHvhJVbxXFUF9G8Tp+tzyn0r27tSTwWHwnR5eoFrBWJ6C
         K885M4xF5k81yF/X4RxM6j21Fi69qsx/u4AWV6H+zHDo9K5je/WUQfhelM3PQsaKDIeX
         VbY4gk0OcRHuCukwPA6pEIE0iKFrxHixlEjh1KiH05aIpBOLj0hTL4b9Eq9KevSg3osp
         j6jtPAjyABp5xfpm1CZ93KZKoVqWrMCM65VWi/OPb6ILm0ubmxBhailY4q40DUUwyGQb
         VraQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV3Z2hx9v0f3XsFp+z8+aSXEXGM8+c+pxC8ATiF7oSdtOVT1WS9GSI/dweUW3yKZIU2sZYrzygM3PLCQ==@linaro.org
X-Gm-Message-State: AOJu0YyVL4ImlcZ6JHgjt6Wgtj6CHcAcVGrhbHlMmpFtC0q8FWT0gbJn
	T9uWlDudWJfNWEnzl5kyoAJlyPskzueLbUcBtUz9FHJMaih+cc4V4bxzdR5yCj09Tg==
X-Gm-Gg: ASbGncshp8XbIK1/X/aEr6XwyD8rToD1WX8q4uhfKo0oEePtyNsU1Tstv+YYxpBv3zL
	JtyL38nHvPeysYMavIL9MiJE0nV68Obco6PZSNFTP4eq8sPxZg5Rzzv9V/r20kE+2gPigdDy3NU
	mEpDbmKMGgd6DihW1ixFA8l7EIChl2yJ7M4IoQGkBsVtpGJUOr10tHZSIrpugvApTbY/khSncqt
	EPQ9qxOULD++J573WYv+DbTwZjr8VBtmVsB4cLqzXdD5NvmFHdbahQ=
X-Google-Smtp-Source: AGHT+IH/PALsVo0VAyGUiocqZee2rofdapY0wf4INzIl5OJmdj81XrthiF1qwqcuydvHdNVegxmu1A==
X-Received: by 2002:a5d:588f:0:b0:382:51d7:39a8 with SMTP id ffacd0b85a97d-385c6ebdbdamr19785353f8f.27.1733145273268;
        Mon, 02 Dec 2024 05:14:33 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH v2 for-10.0 26/54] fpu: Remove use_first_nan field from float_status
Date: Mon,  2 Dec 2024 13:13:19 +0000
Message-Id: <20241202131347.498124-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: W532em6jtk/w

The use_first_nan field in float_status was an xtensa-specific way to
select at runtime from two different NaN propagation rules.  Now that
xtensa is using the target-agnostic NaN propagation rule selection
that we've just added, we can remove use_first_nan, because there is
no longer any code that reads it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat-helpers.h | 5 -----
 include/fpu/softfloat-types.h   | 1 -
 target/xtensa/fpu_helper.c      | 1 -
 3 files changed, 7 deletions(-)

diff --git a/include/fpu/softfloat-helpers.h b/include/fpu/softfloat-helpers.h
index cf06b4e16bf..10a6763532c 100644
--- a/include/fpu/softfloat-helpers.h
+++ b/include/fpu/softfloat-helpers.h
@@ -113,11 +113,6 @@ static inline void set_snan_bit_is_one(bool val, float_status *status)
     status->snan_bit_is_one = val;
 }
 
-static inline void set_use_first_nan(bool val, float_status *status)
-{
-    status->use_first_nan = val;
-}
-
 static inline void set_no_signaling_nans(bool val, float_status *status)
 {
     status->no_signaling_nans = val;
diff --git a/include/fpu/softfloat-types.h b/include/fpu/softfloat-types.h
index d9f0797edaf..84ba4ed20e6 100644
--- a/include/fpu/softfloat-types.h
+++ b/include/fpu/softfloat-types.h
@@ -309,7 +309,6 @@ typedef struct float_status {
      * softfloat-specialize.inc.c)
      */
     bool snan_bit_is_one;
-    bool use_first_nan;
     bool no_signaling_nans;
     /* should overflowed results subtract re_bias to its exponent? */
     bool rebias_overflow;
diff --git a/target/xtensa/fpu_helper.c b/target/xtensa/fpu_helper.c
index 4b1b021d824..53fc7cfd2af 100644
--- a/target/xtensa/fpu_helper.c
+++ b/target/xtensa/fpu_helper.c
@@ -59,7 +59,6 @@ static const struct {
 
 void xtensa_use_first_nan(CPUXtensaState *env, bool use_first)
 {
-    set_use_first_nan(use_first, &env->fp_status);
     set_float_2nan_prop_rule(use_first ? float_2nan_prop_ab : float_2nan_prop_ba,
                              &env->fp_status);
     set_float_3nan_prop_rule(use_first ? float_3nan_prop_abc : float_3nan_prop_cba,
-- 
2.34.1
