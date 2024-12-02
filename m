Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802296njk;
        Mon, 2 Dec 2024 05:14:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUBmqjSWB7Q918x7L8LOijU/2yNGKZocPX9eqtFa0P89kjRp7z13O0s/tUvl1oCMsFk6S+DqHnEPgvr7g==@linaro.org
X-Received: by 2002:a05:6000:1f8b:b0:385:e176:43e8 with SMTP id ffacd0b85a97d-385e17644c1mr13410775f8f.33.1733145274798;
        Mon, 02 Dec 2024 05:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145274; cv=none;
        d=google.com; s=arc-20240605;
        b=kFVsrMqhIp0pDVUwbqnJkf2XfjILAZ0MwF+oX/fqNohr3fmDRgtVZlfMGcJcqH2afo
         pJIGEpPFwmATB4C2D3c22ckrmKTwmcnUVDa48Pvd47I1wxaLGdVP0Hf+QXZAb8ZkahFd
         UPGmKjlxdbAwXFadPA3YzxTccK4Tjk3wt1YS21UITKJXaa5I8D5HVDwLUutM5JpndU9m
         dLYdKwxoze/eZnI0GAnZaGFWGcHefn1NINg7Sz/o8BHdpK1XQT//UJM6RftKnA9PvG80
         ihdiwkyPIXrf3zHqsdAeO3NOUbdegpH0QdyygdEq7s57voZz+RYYnWrqb+C9DN7Krypw
         Mafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=MX9sc7FmhfylUuxW0cA+BWl3jSlP2Yj9aquR2jby44k=;
        fh=TzDpWFvznK+HRjRTVch7K0ldo5nzXE8VIy2T9c+onng=;
        b=TC5iFYS8jC5l3i67NhuGXzAsvhti1nXPiUFYMYJAW3K6IKrhNSH/iT/iT8rjT3ZTy+
         d3ZhFpoxH6gBi90BiMYIk6i6ry5haBBacqcmkow7ceifp59H6ZNR0SSGbfp4ydLHONPn
         8n6onUShEwfAQM3vMhpNjCzxXnT4W9kS2CbBq8HbAJOFDo7RHn/rWHxubshXfJH+uBxm
         IBCo4uv2u9Hydqi4yr/tgNBIGYMSMo8NP/Y/ACRgNoYQMOwEhcXNT1f8r2jyUt6078gX
         bj3+6QcQYjowsV1X8dGzT80CJZgrQCSzRMZSirVaEW1JlHnII9p9mNDj0L3RukbVsHlV
         2WKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hjv+QSrf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e2dba5c3sor1870908f8f.2.2024.12.02.05.14.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:14:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hjv+QSrf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145274; x=1733750074; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MX9sc7FmhfylUuxW0cA+BWl3jSlP2Yj9aquR2jby44k=;
        b=hjv+QSrfUdoXCAJ2mRFDqQGa3DaxF+zilp/nFfCKfOYcjlLboUKMdZ/e7GuyWLEOJY
         njPGN2t/xosK0bLqyV1lnYgfiPW8pgA0NBte+9e3oK4q9dANZxDCO5ujoXELZYFm0mB0
         1Lh8KA3U1hhBUGU3DLAYseE4Gx8er+VDu/SZZJntRrXAFsuJO/6rNxVzuzMUgW/CedrJ
         rTJdv1vdul4qVb0HtfzyjlVoWjgnRxLnywyQqSoXLvYkLzxlylfw6nua9B+KGK7BKskz
         JSJH7nqpzWMEORIo1eENY2fcP5PVm4a7pI8YSOlvmXiUJ+r1GOegTAlxkz0eJIDZvKxV
         bNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145274; x=1733750074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MX9sc7FmhfylUuxW0cA+BWl3jSlP2Yj9aquR2jby44k=;
        b=B5u+g0AJ5MYjnAikP3HgO4MvFaozF37xe5Xni3icli3+1djffnA0xQKAroBnYuUMol
         zqWFYR8ddpfLctrl9n+rPgK3uhCn/Y3G5CajrCoU37qcetJYRGMkyHyJT5mSIrsHYlma
         qyT3FkZZeQzR1qmGbF5HOnkRktM+hLvvSyTx9DaGLWg9sbcIlBXS9aE1D1Fu1XUXbuAN
         mQo5qyu44eEJmmpHj/W5SnRRqhisVKbAmzVM9HzC7BqkO17f4hBwrl9Zb+uD9zvxcJ/9
         m9zKl5TySSGrupQSeWe8oDRdt/OudyywRmlv3cPgGLZZXY7Aiezke4cQV2Luzj50tuFK
         MUTw==
X-Forwarded-Encrypted: i=1; AJvYcCVVFu6O2+4sYDLMG5/PDg9pMC1cEFlyRcWrib4szcAEE2KVDmBedN0CpvdWAH5ygYzxn/mWWLptktX6ww==@linaro.org
X-Gm-Message-State: AOJu0YzVv7S5sLVndWI2WJt8RVz7BodlXTKcXzruq2Ws7wf4nwO4oXmq
	qJsLWiMhTfVCMWzyVMwxq0TKhwHsnxwfeXUWDC/7cnrYYWqOXAqpPXmMajwRqHHDSA==
X-Gm-Gg: ASbGncutlKzRGoQXUBfAwAXpmH+kLnHmEXm/Vr8+biphu0eeHyPD9iBOjoZ09ZKDcqX
	Wf/if2Jbed8TGRDMSIFq9dz0/iiEX1PNzt056OCwht59WsKqrttq/73fxOMaPSgc3YKq24xY+6w
	tIC9KLFiIKo9dZOXVscK7qkGqV6tGPYLtn9G1mEJ2Q4E31Z6qteLhtHm5wAzGvSArXWlii7MlsQ
	xWqeN+OdTKzBwOBUL1eXxiH8laq6Z158ED60NxL8+vZbYUyO28xf3Y=
X-Google-Smtp-Source: AGHT+IHeY93QBLGrs0ffOfRyNKPIrpV6GdKIJfYknW2MMO399IIrOc891AWxF9xi3vFXcrfgQfo1EQ==
X-Received: by 2002:a05:6000:4020:b0:382:40ad:44b2 with SMTP id ffacd0b85a97d-385c6ebba51mr25311409f8f.34.1733145274134;
        Mon, 02 Dec 2024 05:14:34 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:33 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 27/54] target/m68k: Don't pass NULL float_status to floatx80_default_nan()
Date: Mon,  2 Dec 2024 13:13:20 +0000
Message-Id: <20241202131347.498124-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Zo9ts7YjclSV

Currently m68k_cpu_reset_hold() calls floatx80_default_nan(NULL)
to get the NaN bit pattern to reset the FPU registers. This
works because it happens that our implementation of
floatx80_default_nan() doesn't actually look at the float_status
pointer except for TARGET_MIPS. However, this isn't guaranteed,
and to be able to remove the ifdef in floatx80_default_nan()
we're going to need a real float_status here.

Rearrange m68k_cpu_reset_hold() so that we initialize env->fp_status
earlier, and thus can pass it to floatx80_default_nan().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/m68k/cpu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 5fe335558aa..13b76e22488 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -76,7 +76,7 @@ static void m68k_cpu_reset_hold(Object *obj, ResetType type)
     CPUState *cs = CPU(obj);
     M68kCPUClass *mcc = M68K_CPU_GET_CLASS(obj);
     CPUM68KState *env = cpu_env(cs);
-    floatx80 nan = floatx80_default_nan(NULL);
+    floatx80 nan;
     int i;
 
     if (mcc->parent_phases.hold) {
@@ -89,10 +89,6 @@ static void m68k_cpu_reset_hold(Object *obj, ResetType type)
 #else
     cpu_m68k_set_sr(env, SR_S | SR_I);
 #endif
-    for (i = 0; i < 8; i++) {
-        env->fregs[i].d = nan;
-    }
-    cpu_m68k_set_fpcr(env, 0);
     /*
      * M68000 FAMILY PROGRAMMER'S REFERENCE MANUAL
      * 3.4 FLOATING-POINT INSTRUCTION DETAILS
@@ -109,6 +105,12 @@ static void m68k_cpu_reset_hold(Object *obj, ResetType type)
      * preceding paragraph for nonsignaling NaNs.
      */
     set_float_2nan_prop_rule(float_2nan_prop_ab, &env->fp_status);
+
+    nan = floatx80_default_nan(&env->fp_status);
+    for (i = 0; i < 8; i++) {
+        env->fregs[i].d = nan;
+    }
+    cpu_m68k_set_fpcr(env, 0);
     env->fpsr = 0;
 
     /* TODO: We should set PC from the interrupt vector.  */
-- 
2.34.1
