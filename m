Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2802827njk;
        Mon, 2 Dec 2024 05:15:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU4GAApMjoGBIqdGs7oWa9ASjftLEz7Upv6vBnC/WKGSeHkyvT3hslhID7c2M2jk+g1ZQSj3qj1e3XyWQ==@linaro.org
X-Received: by 2002:a5d:59a3:0:b0:385:f892:c8fe with SMTP id ffacd0b85a97d-385f892caf7mr1215917f8f.21.1733145305313;
        Mon, 02 Dec 2024 05:15:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733145305; cv=none;
        d=google.com; s=arc-20240605;
        b=VTktYmMceFZi7ABzpTEYq5uB4bW4jZjcC2wxI5yfdpKVDfx38IxwrWSWaZANMYQ1/J
         LcIzilQmu7FYLaLSXypq6qvnv4uR+gdwnLoA0+1oFHwiOo8p//dIxY0SWumHebDa3NbR
         qvsCgoHIhX+fR0eDp4sX07grFgaiNsc8RBdHHh2rRYRyjWC/6gJEJWcmYBykPd0aJTUU
         6dmvoL3ielg3DUpBUJZ6vocExm5sC3bwvfB8YoXm5yuGm5QRQi8OvweinLHAgKg90ny0
         S8IQBNzofa2G/N41Xrikr+mPgkTU/BfrgcfXmJbIMbbpUgSDE621fugNCrTTvg6Oum6E
         dg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Lx4u5nyS6FnIACOhuZuILUeF3tfNByeD1RldfY5AhvM=;
        fh=Jk+TaBNeM2IIVfenOw+HOZlRkAFICX2y9Hz3J1TdG3Q=;
        b=GRtR/IOZVUwoA5wq+XjWKJQhq/ar6tL26SR3X74jow9zSA/FNo4exmn47PszvRwdeL
         6gPwyC3UZ9i+c7bweZLXDmkV1TVmx7kLjkXUmWsJOsYaXrL+f8w546Ruas7GfTRUlFDJ
         oJj7IFLhtWSDpJb57eT9bQc+E+vSVu1w+M8XJAArm8KJMJRvUoRcwZAK8fVOqw/XbY7I
         84XiPwKwAPWpkt8sY3mb5b3O41CV6EobZtLfa8nlPXCypeRqoKrTcEytMfbdF0DaELJ4
         hSwl8MTurHn9URIt0Mbi5V2xxEhaVtHyeg/LdNmhgsC/ZHk4V16uKpidSqdfZNazrhdq
         x9Og==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=azlu+msp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385ea00b89bsor689033f8f.3.2024.12.02.05.15.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Dec 2024 05:15:05 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=azlu+msp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733145305; x=1733750105; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lx4u5nyS6FnIACOhuZuILUeF3tfNByeD1RldfY5AhvM=;
        b=azlu+mspdJIykbdZjFx4joEpgCjZag4Y3Re3gtfZNtkRtSjNVZePVoqjTj6a0nLqdm
         7MCxXXab0rEt7tH4gqMp8rX1oXUL8NwRGlH2gmOs++9W1pZsfsdzoSyFV1WarrbUArda
         4cuZwVNVWc/QMbS+oiqA93C46ZR6zambp1PztmlSPyoMpQnJRrWdSgYrjS0Z2WcLmjIL
         CtazV/QOhFfbHHneRaPPnE/p/ss9iSjsdosufTX/39o5gUON0aC5p95LdynlQzjvjscp
         7WScvWFbiJqg4h/B0xQdWQHpy/uoYCFCjLeD0waoFPCsTmvh02M2OrZ9KCGxmM+87I+J
         PABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733145305; x=1733750105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lx4u5nyS6FnIACOhuZuILUeF3tfNByeD1RldfY5AhvM=;
        b=NtkA4TtZWNZr/1dQ5Xa0ZerzbaOP8c+kG61g2OIPnWlYIAfWqDUPeaqZj9NwDWqywE
         to5u5fzQ8dVAXmf30srm7iJOnwOmLwVsbfyAWvG6qxAfh9GLywZnXqoRk6vqh43wRk6w
         ofYhdu2foOMKuk0aZkNAjiWAodyEQJtAbo14jncyqPsjuANRB+bPrAlGEexsfKkikX2V
         Y1T2yIUcmoJXAgH9WNtT//UUkhE7SZvFQS3wowSsVxPD1rhVvvyrq8RD7E2Ha+cg8V34
         8E2mEXPmn9kxUdFEyq/83vgkbyi81unakiMqtPZR8wxmZKxyg99sCT85tDAIqWsarWnb
         8J+g==
X-Forwarded-Encrypted: i=1; AJvYcCU543pUzt4iWSPdzU1FuZah+ytAfZJZidIiKJi7yj0NzQdfm58iAVrTDysyT6/a8wYjyr2KxL1XS4Jcyg==@linaro.org
X-Gm-Message-State: AOJu0Ywa1Nu96qiQEJQRSA2rFB7Gq10cStDijva8JcdKUqJm9Tu68iDv
	Sz1xdlAKt9XcXgdfbI1CPnxwTO6HwmIOV5d2lYAFGfCk6+XsUMQCQuAyb7Zk7DQp4Q==
X-Gm-Gg: ASbGncvhghw48MCjSUd4NWS8wdYSL+1VgjYK3ccAG6eAwPc8EGpZmY3Mi52krKguwjr
	2Ds6M/dGtPhoCrpF1rKqNO1T+m5kRGxutPCerphbgBa00ilFxNejZB6H1IFz4voAbelMfqctU8B
	X0kzP9V3lCZJvvaRzdeKGdiOTSLAUrhNy7JAv3DSU3jT5rw4t3+6KlQ7y+2xGL1U0tG71hb7T4X
	hJ0Dd7vH8f0ipOvilKSlvBfq2Vp9OcVi9BdSCiz/Bx56jUTCHG7zK4=
X-Google-Smtp-Source: AGHT+IE2VGJAnehuVMFVcXwJwWYUFFGthX624YluXZHUiteB7VGRqCKZnI4ZvOYVRTx+MYrc/9o62g==
X-Received: by 2002:a05:6000:a01:b0:385:edd1:2245 with SMTP id ffacd0b85a97d-385edd123c6mr4738904f8f.30.1733145299323;
        Mon, 02 Dec 2024 05:14:59 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dea1e4ebsm10160157f8f.1.2024.12.02.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 05:14:58 -0800 (PST)
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
Subject: [PATCH v2 for-10.0 53/54] target/tricore: Set default NaN pattern explicitly
Date: Mon,  2 Dec 2024 13:13:46 +0000
Message-Id: <20241202131347.498124-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202131347.498124-1-peter.maydell@linaro.org>
References: <20241202131347.498124-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: eDJWXKeYtiIJ

Set the default NaN pattern explicitly for tricore.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/tricore/helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 7014255f77c..e8b0ec51611 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -117,6 +117,8 @@ void fpu_set_state(CPUTriCoreState *env)
     set_flush_to_zero(1, &env->fp_status);
     set_float_detect_tininess(float_tininess_before_rounding, &env->fp_status);
     set_default_nan_mode(1, &env->fp_status);
+    /* Default NaN pattern: sign bit clear, frac msb set */
+    set_float_default_nan_pattern(0b01000000, &env->fp_status);
 }
 
 uint32_t psw_read(CPUTriCoreState *env)
-- 
2.34.1
