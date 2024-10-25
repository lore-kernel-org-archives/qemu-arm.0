Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1086174njx;
        Fri, 25 Oct 2024 07:13:11 -0700 (PDT)
X-Received: by 2002:a05:600c:5248:b0:431:5d89:6465 with SMTP id 5b1f17b1804b1-431841a8b0dmr87427925e9.34.1729865590948;
        Fri, 25 Oct 2024 07:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729865590; cv=none;
        d=google.com; s=arc-20240605;
        b=AUW9TrUbs4Qdco8BcGLhqTBriUs/bk64JwmRm54U8KtbX5rOg94NJKjhLDZERv9WDc
         IpWQSqcAQPSQ7QfYe+xzY7SRwNRnO4cS0B8t4RuAAFptfCZaEhAhOLjEq3jIXntzfQT5
         SroKxORayxR7uB4X1VelRDv0TKfeLzTqg0FaeBhzVFfYR+bOb6JVS1oMJNSD5OrDLVCS
         FlcCPe+apf44RGxtCtBmuwWzoByxy3aFLfDvIjPKN68JgV35flgYfMG/O0CjDKz5S0O8
         GJjrG1mmyWi8KkONf4P2chuYCbBxSQymnJ2+xP2gYUwePhiUAcjxmGrtiK6s31A4o9H3
         2ldQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=R0KwrJ+RLRqyfxTos/cR3Np44ABB8RBfSuYyJrILdGI=;
        fh=OXkuXGRQg5TRLr53g9fWXc7teane6SgR+FWCtJ8SKTY=;
        b=E9nigo7bbtqrvxfdqLS8y1Ksn9I69Db8EyUrzB+UneA0rH0V37rCyOAiXfuzDWCT8s
         iK2zKH9/NY+IVDWZxagvSCvoq6GEXqBNGeMQeRblvOY4GwTSHSZ8xGIEBqxw02GdzYnU
         yqmbY3RkVauFFFPgKLC1rAnQLK8eWc+nA7QKwv0R0XZMROGwZOw2gR46vHFsSZEqryEN
         YZperiVQhChfomLIVnTP2b0wu8tfZdTA+P1w7BBbn6QLc6Jx4TM5zLI2iV46WqU491hn
         PhUZk0IWEWHCEzBDaKksxU7rFlzE8Tn5tTqILD/HscWYaf/GvJpYvlZyMqAeZIPtdGLu
         6qLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zaaTC5Bf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-431938f7f6asor4506085e9.5.2024.10.25.07.13.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Oct 2024 07:13:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zaaTC5Bf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865590; x=1730470390; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0KwrJ+RLRqyfxTos/cR3Np44ABB8RBfSuYyJrILdGI=;
        b=zaaTC5BfJ9+2rH8JmZIQ/879JUdLcYyiFgbBq7i3zQ7OTO1kdUgnXFLDOMaJ5zOrXA
         JyAEBP7Q4cc+Tbmb5Mp5GoWNXq/Ckye19wTLfhtMjZnluHRTLdPYnXw+WUVCZg1NQ8ga
         MRm3G9CSLXnWh/tRgXJ4cfyUmd52ya+OQlPkajcYJJmH5FkKKEouHIm9udscMbtrA98Z
         8/g2PhD33ewGHR3TS6BENAerWgo0fytLldVtkQ8u21lErtwjYl+gPpXrazlAQhoS/iNO
         FSdS146Lj3frZou8+NhVQpGHFE0GsBhpGH11kVQWEBRRlGesOp8EScDIBdGEbFoQcaWI
         M0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865590; x=1730470390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0KwrJ+RLRqyfxTos/cR3Np44ABB8RBfSuYyJrILdGI=;
        b=O7qCHEIuL8NnbgnTZk5ljklI5FK08Ph0eDUCUQAwGUV2FAW1qw/EuUigQqcRjStL8T
         miEjXnsOWQe4C5s/I9ezoaK74LIszr3IXz2QZTEQQSNJQEgEz4aMXRAxYoKSJpinrwcV
         wyRAuhKt/3nuyjI97ubLGWlpjtLUwx3IkR06tXsjqxSy8hUhK5xhI/K16jmdLPFsss1+
         LKJhtJx18JsudPpN1gaKvUuyRSfsJTIEZUTcVbA2nUzw5D7E+D7enG0AedH/oKSu84TE
         ALl1KYLVn+qbDUApJ8Hx2kkUCuN9V7KE61NIjihVFfKUeyzyJSJNiNuHKuF3EGteDrXv
         qiFQ==
X-Gm-Message-State: AOJu0Yz3bAnRTLfDp6gkrnVcY3C+WLmJ9Epx9M7WsTfVA2bCPmuCyYAS
	bfuYrFcKokB9ocqlzBVcdCXfAREn/M26zCxrMOicZ6+N+JvD1bJ7nj3bmPWcKTCu6w==
X-Google-Smtp-Source: AGHT+IElscYFzJMkYmD7qnmfjnyWZqUI37VMxIDiiFWHpHvVdX7AL5ahkCq804b4/QejsLD1QmJqwg==
X-Received: by 2002:a05:600c:1e08:b0:431:2b66:44f7 with SMTP id 5b1f17b1804b1-431841a5fe1mr81921395e9.31.1729865590281;
        Fri, 25 Oct 2024 07:13:10 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b051sm50104535e9.42.2024.10.25.07.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:13:10 -0700 (PDT)
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
Subject: [PATCH 16/21] target/alpha: Explicitly set 2-NaN propagation rule
Date: Fri, 25 Oct 2024 15:12:49 +0100
Message-Id: <20241025141254.2141506-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241025141254.2141506-1-peter.maydell@linaro.org>
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: /cisFqMciNJp

Set the NaN propagation rule explicitly for the float_status word
used in this target.

This is a no-behaviour-change commit, so we retain the existing
behaviour of x87-style pick-largest-significand NaN propagation.
This is however not the architecturally correct handling, so we leave
a TODO note to that effect.

We also leave a TODO note pointing out that all this code in the cpu
initfn (including the existing setting up of env->flags and the FPCR)
should be in a currently non-existent CPU reset function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/alpha/cpu.c             | 11 +++++++++++
 fpu/softfloat-specialize.c.inc |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 9db1dffc03e..5d75c941f7a 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -24,6 +24,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
+#include "fpu/softfloat.h"
 
 
 static void alpha_cpu_set_pc(CPUState *cs, vaddr value)
@@ -187,7 +188,17 @@ static void alpha_cpu_initfn(Object *obj)
 {
     CPUAlphaState *env = cpu_env(CPU(obj));
 
+    /* TODO all this should be done in reset, not init */
+
     env->lock_addr = -1;
+
+    /*
+     * TODO: this is incorrect. The Alpha Architecture Handbook version 4
+     * describes NaN propagation in section 4.7.10.4. We should prefer
+     * the operand in Fb (whether it is a QNaN or an SNaN), then the
+     * operand in Fa. That is float_2nan_prop_ba.
+     */
+    set_float_2nan_prop_rule(float_2nan_prop_x87, &env->fp_status);
 #if defined(CONFIG_USER_ONLY)
     env->flags = ENV_FLAG_PS_USER | ENV_FLAG_FEN;
     cpu_alpha_store_fpcr(env, (uint64_t)(FPCR_INVD | FPCR_DZED | FPCR_OVFD
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 77ebc8216f6..a5c3e2b8de5 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -406,7 +406,7 @@ static int pickNaN(FloatClass a_cls, FloatClass b_cls,
     || defined(TARGET_LOONGARCH64) || defined(TARGET_HPPA) \
     || defined(TARGET_S390X) || defined(TARGET_PPC) || defined(TARGET_M68K) \
     || defined(TARGET_SPARC) || defined(TARGET_XTENSA) \
-    || defined(TARGET_I386)
+    || defined(TARGET_I386) || defined(TARGET_ALPHA)
         g_assert_not_reached();
 #else
         rule = float_2nan_prop_x87;
-- 
2.34.1
