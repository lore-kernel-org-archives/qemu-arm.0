Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19623njj;
        Wed, 30 Apr 2025 23:24:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVbmg8YQyS4RifhrM+AxiKg3cSNOQShUrEclH6MuJ4RMwbhp/CsWw4oaT38f0xq8YgiuP/DfdtS9dquQ==@linaro.org
X-Received: by 2002:a05:6a21:9187:b0:1fd:f4df:ab67 with SMTP id adf61e73a8af0-20bdd667087mr1877473637.21.1746080649701;
        Wed, 30 Apr 2025 23:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080649; cv=none;
        d=google.com; s=arc-20240605;
        b=Vvgfo3azJCGpYuc/yzhr37jFznA1fbXeWKo/pD7NW7s9OPsA60qF5SeJdPIcgB4gFN
         DVngwDkDRsMtemv7pv7D20s7/V8SRF2besR2rii7QToS5o7HB08oSjEYSTExDYOBJeyT
         ue4y126jE4smrNkUHbnjqsJdmoKCNZzWah0mZ9XZNF/e3s+qH7CWQ8DYHezFmbcHHgUB
         gwN2uJ8GwXYDMyI8mTEjb13o4OVihxhLw2MkmzS7ggoimB2OnSkQ2Au82EpplyQDAdO+
         TPyMugDsHUJVWN48woo7HvNxSXVnJ6WyiPV2o546kAgnp0gJO9FTpJ9MyWl2Vl7qMqM+
         aFOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BaxN1Wnwe73nlXtsILpKd8Zw9LObEA+fWJ9HYaRv6lM=;
        fh=VTIJnmPLrqulGnpbE+vgnzsHOKwdwZ4DGfcbs5jue6c=;
        b=SfKFQYA0C7M8GjPNqcTVBGN9id86arVTtlUg9jvkcH5eU1DLb2VXZ+PeGsgy/j501b
         AIkSjpHDYEj9Q9cKW8FRm1lzDBeyupd4jcMZ1G/6A4iUvQkwzRho/IZz27NLhOXRa/6Z
         EQpVq2tYbMczSZ/tv8iiZ2dQEHhU3AAW+Ic9OYsDy+jLQhp3GhcDrcZloNwrzbhRFpEo
         UvWCtEXAirYZ2p+SndSWRLhS2ps/aULbY42PoFBQ71MMDoOy0xXBAVWOgJ1ZI8hD9du8
         nIlUsSQAW4K1mcrUkSfz23ABGZYMogJgVmo0A/PJ6nXooeVXqLotQ1cgFFEyfHUaJK3f
         vY/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EhuEWpbo;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa16a8dsor60563b3a.5.2025.04.30.23.24.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EhuEWpbo;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080649; x=1746685449; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaxN1Wnwe73nlXtsILpKd8Zw9LObEA+fWJ9HYaRv6lM=;
        b=EhuEWpbolU9cRr3xnkMSY4j8P0uFGle58/H2+G2qFzs3p3hPhN5/grZQIbEtz+QvkS
         El8z7JuUxONmR0mT0bTDtnL9cNKaghp6KwloNKAU1AcsDXdfe2F8jHZ+mqK0D3AegtxO
         7zzyJWQD8FCZTjbBMqCGAsWjRexHl7mToR8gddY1kSwi5/7/xN3IhZQXCAQAf4UZ6Veo
         tuK+a0UurgqEBFghK+9QXZ7OIbWxNL4709OZf9qyrAPL1u+ry5R/ZoIHoGYpFVqoFbRR
         +N8ifBg7UGE0an8QI7g1Z+6L8YtXLhYRaxHyjwQTZgLn2l/Bkq00OAu9/N9XFBeBC/i4
         UQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080649; x=1746685449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaxN1Wnwe73nlXtsILpKd8Zw9LObEA+fWJ9HYaRv6lM=;
        b=MYuxCtafYFWh6AwrDlCIyRzESTD1IB01kNiAhlWQPWhClDJGohVEWvOoS+uCVcbgeW
         THhGBWkv+nmls6kTT2Qqob07fZFW6yPlBUSxUg3g9Ijk4MPOv7LInyPmMd41tRDjfUNy
         4mwqzmE0P74su5h0GpGm+f9dcxxuI6SePSvDYT0tx8RX4JIG/v+BXu0jR1QILS3sLJLz
         e9F2P8Z7XiDQ2YEAOvQTDghcbE2CYedh91NIRmnScfr2RGcPaRP/wuR3nAYTK329obAa
         rOazZOgWg8skH+kq6w4GRRzbyRozZ1vt1sNwGs4cglgfm2NIUZtQfnSHFDhK6QNBla7r
         gmqw==
X-Forwarded-Encrypted: i=1; AJvYcCXUBKhcDeVjqzmzI4HSZk9RUU4ajBO5nU1oZOyXziL0unCtb9FkNh8lXLe5KzzEiY52VlCAS7yaPHRVTw==@linaro.org
X-Gm-Message-State: AOJu0Yx42j4ZPbELfluuT7nL/Bi9v1KENwtDnMfh1eqvAZDurQaVoCXC
	Do7ClLLmyX6PzrTSyW+9vFVnsGLLGSBZPeEFkdwy4jKA5fx1j8dF7CV762aomSEGVw==
X-Gm-Gg: ASbGncv3yAcje869vDW5DW2wkug+piMy0hbYKV642VKnFVzLUUq2hMjG9iRxf0l615o
	sx+SvMSndfzAUmjRvQKtnSVqTH5lYnUrk7B9yEBvkw5lnXR5l+R6K0o0vQGed8i/+bkBJuhsF0V
	zqBP9o0l3Bi9amD85gUhC5ygQkt1pNGpyChkoCIabibdCobY7rZFFDEOuL9RyMbqPPQjOIIT0L1
	fToKxpD1h+vc/WfFH1990nkLt7isb8qoe3o2Uym79XzuV8xvTKsVd81EDa2ljwk6BJaxm+7IK8k
	Dqs1YqurVJDvdIxJlClmyPDUfU/crfHTruuSD6pW
X-Google-Smtp-Source: AGHT+IE4Xqp2t/vPNxcm9GHqM8zO2cSqpXtBFOyo1i51a7Px1LaEZe+L/FgMGOOkmgJ2scnA9wDOsQ==
X-Received: by 2002:a05:6a00:e8f:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-7404917149cmr2440508b3a.3.1746080649301;
        Wed, 30 Apr 2025 23:24:09 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:08 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 20/33] target/arm/helper: replace target_ulong by vaddr
Date: Wed, 30 Apr 2025 23:23:31 -0700
Message-ID: <20250501062344.2526061-21-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: QaahFkWNKepd

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 085c1656027..595d9334977 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10641,7 +10641,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     unsigned int new_el = env->exception.target_el;
-    target_ulong addr = env->cp15.vbar_el[new_el];
+    vaddr addr = env->cp15.vbar_el[new_el];
     unsigned int new_mode = aarch64_pstate_mode(new_el, true);
     unsigned int old_mode;
     unsigned int cur_el = arm_current_el(env);
-- 
2.47.2
