Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802140njk;
        Mon, 2 Dec 2024 05:14:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXlcWhQCM7af9YLKvUrdvqSRWp4vQEjcGn3f6SebLf0mP6rjwh7Ck9L7Bxw9t2sLdsO4zMQzn+1k/olfA==@linaro.org
X-Received: by 2002:a05:6000:3cf:b0:385:f47b:1508 with SMTP id ffacd0b85a97d-385f47b1910mr2665622f8f.35.1733145267324;
        Mon, 02 Dec 2024 05:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145267; cv=none;
        d=google.com; s=arc-20240605;
        b=LYv8nRRLiiLUd3aCAlRJ0DP2aPfuo9yJEBP+aOsrCHDUWRCbzLwBnfUwEY+56R6S/g
         9MigtgjUkipop67lpQi6rXSwDiowynRB3Cc03FTnBzf+gpC1gs7pxN8a6bP79QCYd6q/
         Hy1sHQ6ouEUSvUOOiTiy26TBzo5Sav8y+flTw2yXlv3W/pJmAep83zqvFGVnypbvUPCi
         RKVmYN6Bs5ZY8htc++mFhST8+lIcSXxz1TNmFRMaQSLTUtxVMjB16t4ZrWd+qB2TT6gU
         QXpHT9wZq/ekctSXFSTMr8QU2Bdqcj1O3dinAqm4TxVMc9otIGKRL5HKRoPaVHB4uCOJ
         fDcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=buw3vsQorwZwaR50k4S9PXYAF2rd+6sbEuYUjFK5KVQ=;
        fh=oxGT/tF4IAQoUVZnKSojxoy70YHJNNtq6qM/lMeJdu0=;
        b=L4Sdl6Uz7l50gkvowmILrB5TIO9eSAy59dutdGMyFdEWe0P56f7XAngRagW2DDQElD
         6RN598KlDV8QCdxam9KSGdUE+8IS/HRxCaIhWN7Xhb16l+JmFAd84H67HCwUpBFSR15E
         L+yEnMplPeUHaKcbQUGwvNCZYqOC7lNV9YsdVxg8I95ytMsnSTorp5+JhxHJzLU/dO2L
         sxBpQSrAECqRzUeVy2TQeNUjYHuyMs9jbajXw59iAlpDoLYzofwP6trTlWe+88n1gRUk
         cM5Cg2VFd5xYfJcI913E4mnnorwN8g5hPWyBH7fTjNWkC/Sp3AOZW8LPRTtKfYJ+Oh6H
         dUmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TqdUeGYq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b1056789sor15048475e9.5.2024.12.02.05.14.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TqdUeGYq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145267; x=1733750067; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buw3vsQorwZwaR50k4S9PXYAF2rd+6sbEuYUjFK5KVQ=;
        b=TqdUeGYq/twqdAhM5gLAcTHEGmimw9YRMqWB9mOOxsx1/FOKwmRDYhmFk8ueIYWTKn
         D4sCsAhJ6K2aib3n5l/4qVZxXNtwXm+syYsGOboj46S8cu+CdrVpNGCANumscm5oCvQ1
         4YK4ZT0XiviF+WPwAU6g5e7ILsxtBe8Vzqdlsyf5NCg5otCtVJ7jjO6hdBm3eYcw9nXv
         PTQ2hcapsP+WAxBx14+33lFLTI70FeS13jo48IIGYyFUkN3woIVea++IYCncz5PVPrmZ
         jngEbWoluOFuqNFObTNL3rzlmws3KXKgpZjScL5rP4qiXnTyc8nW3HurdVDwJWzm9xb1
         MrXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145267; x=1733750067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buw3vsQorwZwaR50k4S9PXYAF2rd+6sbEuYUjFK5KVQ=;
        b=kyawIQrJf/WEqSYDpkSwpgdNo+zcaXQB6WLlzoIXLQBEVc1baDgidFhyjx6FEPj+bh
         nDqTpOYFwlVYRuzjw2+7kY9JNzBGa6ld88rhKC28O4uCPtgoZE4U49rzc7/xr0Fflyg2
         S+GA8NE8Oh4B/saIScQUwwxw69MK9Kx6nWYMqMeDAX7sw32SonL/AjZXFy4uzkwSceKE
         qhk0mVMgUrwWYtpiYafOBTFwt6MAN0U8JrkdjYE6LO5HuOalsxQXpwclnsqItMaJCcqu
         ywXn+Q36LLouzlhhCY9VR5g9k2OBj4fjoHqqvAR6vM87fIsFLnK1l4oAutnjDRhRffE8
         2TNw==
X-Forwarded-Encrypted: i=1; AJvYcCVlegfC54JVkA6/MoT1/gJ9XeMGfNM+78di2EKpA0ae2qNPltGtXEPp6RTE8paCIhgtdNeeAhOXKjSSgw==@linaro.org
X-Gm-Message-State: AOJu0YyacrRNufMFgNLkzCz/zhewn/5zYXY27mG5p8+bPDmiwzRAVLTN
	sQVNwcyejvSG9l3Lf9twNqa3wvo3DHbP2LtSUz2+OlRN7ZZUBmMju/I6bWBAlMdMMw==
X-Gm-Gg: ASbGncvUnc1lf9uSWokoieRWDChslrKq8RsDQByCUSeBAtASmJGkSRnYVFc/gLFRb0k
	BLitIR/YrT7bnXhWQvHYhFFYKfJoexUgUmlwck73C+Jo8JqMtENRMwVSQPiZ6HdUPPKLiULtVkv
	bWwTB99a/KaG8CaFi5BAQbCCnZ/SNjCYz1mukA0LDuNVxrfBRjvJd5t0CpTFgy/CVhEYcN96FAE
	a4ZZJxDxgXWKqlcx275q3IKeTu5mReA2uRXjb9LjpBeUvlA8QnRhdc=
X-Google-Smtp-Source: AGHT+IHx8PwM6AIzlpEzsxr8J+LyWnE7HUOX8ZkDkwcjSfEuU/Kwyf4EVLl7tEc4KnIW1/2mwf+TIw==
X-Received: by 2002:a5d:47cb:0:b0:382:22c6:7bcb with SMTP id ffacd0b85a97d-385c6eb4c32mr20727841f8f.3.1733145266761;
        Mon, 02 Dec 2024 05:14:26 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:26 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 21/54] target/sparc: Set Float3NaNPropRule explicitly
Date: Mon,  2 Dec 2024 13:13:14 +0000
Message-Id: <20241202131347.498124-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +K9pYq27UaDb

Set the Float3NaNPropRule explicitly for SPARC, and remove the
ifdef from pickNaNMulAdd().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/cpu.c             | 2 ++
 fpu/softfloat-specialize.c.inc | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 61f2d3fbf23..0f2997a85e6 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -814,6 +814,8 @@ static void sparc_cpu_realizefn(DeviceState *dev, Error **errp)
      * the CPU state struct so it won't get zeroed on reset.
      */
     set_float_2nan_prop_rule(float_2nan_prop_s_ba, &env->fp_status);
+    /* For fused-multiply add, prefer SNaN over QNaN, then C->B->A */
+    set_float_3nan_prop_rule(float_3nan_prop_s_cba, &env->fp_status);
     /* For inf * 0 + NaN, return the input NaN */
     set_float_infzeronan_rule(float_infzeronan_dnan_never, &env->fp_status);
 
diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 8a36280df1a..c4d8d085a98 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -511,8 +511,6 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
         } else {
             rule = float_3nan_prop_s_cab;
         }
-#elif defined(TARGET_SPARC)
-        rule = float_3nan_prop_s_cba;
 #elif defined(TARGET_XTENSA)
         if (status->use_first_nan) {
             rule = float_3nan_prop_abc;
-- 
2.34.1
