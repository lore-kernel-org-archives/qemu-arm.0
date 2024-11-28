Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp1413080njb;
        Thu, 28 Nov 2024 02:43:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVdSEc7xWSWn0n0mlgxnnk4DKqXqqT5FBwspzpJL8K1EgO8mqsSnYsQoEk3/m8X88RTZpmhWDU1vW2F+g==@linaro.org
X-Received: by 2002:a05:600c:19cc:b0:42c:bb10:7292 with SMTP id 5b1f17b1804b1-434a9dbaee2mr52434285e9.1.1732790600805;
        Thu, 28 Nov 2024 02:43:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732790600; cv=none;
        d=google.com; s=arc-20240605;
        b=XZGdBW6fas8hzk5FgARWw4wGayzF/tXfygxyx3trDpxVbnf4S9KshwBq6NDqZT05tF
         LpkACe8u8gwt/JbE9/s+w4Dl7KmXAJCUmiCDkEUQPgYVpWvgQ0+Meae8jYFcXJvN/Riz
         9zKivEZ8ko0uIpgjAflgYr3HBazNbalwXVhTGglYopwMiN0kmXPKt+eJW8KyBvukwnp4
         Zv8EW0F0TFnkzGmDnPgEh+R6RWFtdZkV3xttYmledJxQtWsKXokcAEZRdSlFHXFluSL3
         R45Vb+4ixSbZedQGKO4szE73jK3L+l/4PGtkOmxU+N/QRnzi9W4IUeWBtn/Ul5zVXTfo
         uqMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YwvjGP9nM6OJvLHzJNmFilwr8r1rRnLYpGXxx9aO2ss=;
        fh=A7OlmQcYAJlBZyUEIASuB1CX9m+ickDQHbfV22hJ8N8=;
        b=NlZG7lFv9dXH0AoLCbImtT8xPbhp6NXmg6AFvoU3KSOrL6uzcqnnSP6J2Yxxx3HwpG
         BJ6b5OFzGb/EpkxppoB93HO55o6TgnpXAZwgMrnKneGCmf3s3W0lKumGwcioq9kplYXz
         Q1saSwbpXjjPJknXBtV7sMzpI+Bf3wTLDZdD5xqG7L5EUFlIUIT+MfoanX+8SV0FfGiG
         nzxBYNDEZ7NTYSqPbvMP6Wl1QWxdDCWI08TATLZoIExcl4ZlBsJKCTnl9dOhJJBbJgUQ
         VuqS7P4UhezYqPxrg+hwE1hvxnOv/YvzW3oc8lMQn1pkmTOkVDcU0fsnZZQJitt/Bx06
         2KAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U7Pzy0CM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b1056788sor4945095e9.5.2024.11.28.02.43.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 28 Nov 2024 02:43:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U7Pzy0CM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732790600; x=1733395400; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YwvjGP9nM6OJvLHzJNmFilwr8r1rRnLYpGXxx9aO2ss=;
        b=U7Pzy0CM0MmGUyN843PQweUThnOFax3smCWwb329lTBQFg+2U/ZY1KHaM8nmlUmWFX
         yY5pIwV9qtSrRVD/xQpVHnloUcQQSXbB84F/7CIxdz2TR7EHJvEUy+O+aj0ofssIuAsA
         VjNM8TDyP/ULc1zcNbgUHdLQzKxHpeTd70r9Niz2eHv7YRV5QHzDNOFZcoQyUoungytq
         SI7vzt0PGI7tRGmATxWPZbMUczw/iE9iH0fg/kYRSstDG2nCHbRXjJVaGMWxsFkSli4g
         m3wMfku2vzOtlONNx90ta56RSjI3VaDjifCLplCKPIANFAoxN1DBzVvABhvjtdDCa+0e
         5Atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732790600; x=1733395400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwvjGP9nM6OJvLHzJNmFilwr8r1rRnLYpGXxx9aO2ss=;
        b=N5mKnLrbad3jth8TuzJjzfpLwKeSOY1OZUNnUK805nt8kFksmZNwZ99mrV6ZfIsQOF
         9n2Gam/Yx+KLYxA2b2mlLccL6iJ/lBpKRfyv+hX0UNJwmZDMSMpP/MQj3SlINhdWxyZG
         PnHEqkqPItfK9CSRBCOIpjuRKh/VYEwSqHNlA3GGJb8Z/+1QjpawkH6t/ncekyJwVwFN
         pjgy8ynFGtltycGipeEbH2fGq+ZyNmpuQWUqFBRkISCuc30uPbeJlFh+Nthxog8H1dMM
         THx+coK1r/DyT6b3lN5uz3x1NcGlkdoxpaq9eIt8f12K7mC63WpYhm7CCK895zbi90Hn
         f4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUNuveHZlFXGUyeyzN6OUp/UVvUxITZSt6COK45VbQkn2bH60zCxaaVbsOMA0lrF0J0Qzy+kV5nwCxCyg==@linaro.org
X-Gm-Message-State: AOJu0YwHG2uGmabkgHoFLfWFktn8D+uvuEzD9hXyT++5hBU5KNGOGbdL
	9JObH7/hW77BRPLf0Bfd3QtSlOvstVY3YMB57FcLjCOcfE9QsVuYKtu5oBGR/njM/Q==
X-Gm-Gg: ASbGnctVkXJsJKJoxw549ZfP78ftfE4hS07BnRRk3owXV2Q3HbnDRuTo3iLiv15a2cr
	EiHrayZGXujdoPmWWqTmEdT8nfs5iArM6hyRg6/0OoZeCaT5w46lxyVLoqkPlmLvzJ7Bmd8AhZo
	WE4wlM8POQ6/faMQQ8GsyEQjuJKH1v9nQrVHpQzlKg5uVoe5y1hld/4Sh30v68dHP5Uiv4nV08O
	K2JsWWfq+OZwEbXXTtz7zXcCzxNSMPYUDqoZzXg9zgDmIpZNYXYUcQ=
X-Google-Smtp-Source: AGHT+IF8avi9FU8kPgaxxBYqDyIzAMA/ClbqF7FGpSE026N6UfXClh07JepyogBPwI7n2/nj2x37LA==
X-Received: by 2002:a05:600c:474c:b0:431:1868:417f with SMTP id 5b1f17b1804b1-434a9dce659mr70149485e9.17.1732790600234;
        Thu, 28 Nov 2024 02:43:20 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68958sm1292959f8f.67.2024.11.28.02.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:43:19 -0800 (PST)
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
Subject: [PATCH for-10.0 08/25] target/mips: Set FloatInfZeroNaNRule explicitly
Date: Thu, 28 Nov 2024 10:42:53 +0000
Message-Id: <20241128104310.3452934-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241128104310.3452934-1-peter.maydell@linaro.org>
References: <20241128104310.3452934-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 73QL/rOUNoQP

Set the FloatInfZeroNaNRule explicitly for the MIPS target,
so we can remove the ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/mips/fpu_helper.h       |  9 +++++++++
 target/mips/msa.c              |  4 ++++
 fpu/softfloat-specialize.c.inc | 16 +---------------
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/target/mips/fpu_helper.h b/target/mips/fpu_helper.h
index 7c3c7897b45..be66f2f813a 100644
--- a/target/mips/fpu_helper.h
+++ b/target/mips/fpu_helper.h
@@ -28,6 +28,7 @@ static inline void restore_flush_mode(CPUMIPSState *env)
 static inline void restore_snan_bit_mode(CPUMIPSState *env)
 {
     bool nan2008 = env->active_fpu.fcr31 & (1 << FCR31_NAN2008);
+    FloatInfZeroNaNRule izn_rule;
 
     /*
      * With nan2008, SNaNs are silenced in the usual way.
@@ -35,6 +36,14 @@ static inline void restore_snan_bit_mode(CPUMIPSState *env)
      */
     set_snan_bit_is_one(!nan2008, &env->active_fpu.fp_status);
     set_default_nan_mode(!nan2008, &env->active_fpu.fp_status);
+    /*
+     * For MIPS systems that conform to IEEE754-1985, the (inf,zero,nan)
+     * case sets InvalidOp and returns the default NaN.
+     * For MIPS systems that conform to IEEE754-2008, the (inf,zero,nan)
+     * case sets InvalidOp and returns the input value 'c'.
+     */
+    izn_rule = nan2008 ? float_infzeronan_dnan_never : float_infzeronan_dnan_always;
+    set_float_infzeronan_rule(izn_rule, &env->active_fpu.fp_status);
 }
 
 static inline void restore_fp_status(CPUMIPSState *env)
diff --git a/target/mips/msa.c b/target/mips/msa.c
index 9dffc428f5c..cc152db27f9 100644
--- a/target/mips/msa.c
+++ b/target/mips/msa.c
@@ -74,4 +74,8 @@ void msa_reset(CPUMIPSState *env)
 
     /* set proper signanling bit meaning ("1" means "quiet") */
     set_snan_bit_is_one(0, &env->active_tc.msa_fp_status);
+
+    /* Inf * 0 + NaN returns the input NaN */
+    set_float_infzeronan_rule(float_infzeronan_dnan_never,
+                              &env->active_tc.msa_fp_status);
 }
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 2023b2bd632..db9a466e05b 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -489,21 +489,7 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         /*
          * Temporarily fall back to ifdef ladder
          */
-#if defined(TARGET_MIPS)
-        if (snan_bit_is_one(status)) {
-            /*
-             * For MIPS systems that conform to IEEE754-1985, the (inf,zero,nan)
-             * case sets InvalidOp and returns the default NaN
-             */
-            rule = float_infzeronan_dnan_always;
-        } else {
-            /*
-             * For MIPS systems that conform to IEEE754-2008, the (inf,zero,nan)
-             * case sets InvalidOp and returns the input value 'c'
-             */
-            rule = float_infzeronan_dnan_never;
-        }
-#elif defined(TARGET_SPARC) || \
+#if defined(TARGET_SPARC) || \
     defined(TARGET_XTENSA) || defined(TARGET_HPPA) || \
     defined(TARGET_I386) || defined(TARGET_LOONGARCH)
         /*
-- 
2.34.1
