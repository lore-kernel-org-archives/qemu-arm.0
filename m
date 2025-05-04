Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756162njj;
        Sat, 3 May 2025 22:29:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPmmkRKWFLc0xWR0R1ig9ULYun4jpGMlVoHY/lo0RxQ03sJ7gRpG/6qWSwxk7Z6VqX6A8kNJn9U+I5gQ==@linaro.org
X-Received: by 2002:a17:902:dac9:b0:21f:6c81:f63 with SMTP id d9443c01a7336-22e1e8e57a4mr44840185ad.16.1746336579939;
        Sat, 03 May 2025 22:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336579; cv=none;
        d=google.com; s=arc-20240605;
        b=X5yzwNNyl0wgcy/3cLJx3zpuiiEd4u1IP5o5DCPwSxJ1DPNyCtHjK8cyjnAUQQ8Gf4
         hS6kQUVbAnp1uA/ltz/M6seOfwzj9BuwKoa5P41bu5X1yxR3FpPbG9eadDccxiIv9HuH
         kZDKsfA3++F92sQ9NUC5eLrxrl860PFidNSVgT+s9Gxm/NwVqmwLPcJBFimHUawa93Xf
         9s8/vJo3JAzMQHSra3Ds8M333v8GBd6j8S7uoTcR26KArWi/YfLHPR1U66lrdAZQ95gn
         mU4urqkLCVYCgRKXEI2qUmtzB4/x3954w/w3jT2ZUJnTNeqgcfkDH6K1jsILrdB0prCo
         JkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Zr91VyD7KzMDPFf4g5hvijagOJ2GOeFDSpZ2RGMEaGY=;
        fh=FUpqJC/bHB+GZhkHaMbWPMrNq8q9KXfeihqP2lHwm44=;
        b=Q6ZYG0Qc+DaP6i231I97xD5YHbVtNLDTPTkp8ai6iFrM1LkFOdl6lpc9NiuOeaiY4x
         FnI6oxPZ9889kjZwDxxRnXwX+gmnUcTg0DQfAC9HujrBnFQ2VTD3CCJQj3yomSI/r44m
         dIzaUcG3zNGp3QodNW3mTCdd81HjeDYgJpUJOMPBoJOXmZeQHfFSMYY2gBFY+F6HtXoL
         cpqsib/9eunJ9ZECFso0qtDjXRg2AGrViP8ZOo7UsWaNoyE8rRGzDk7sTucDX8Alq4RJ
         4Whzo3wOWbc1GHw8dYOWFskIOIh0b5XEbOo5j8xPoo6n63yrc6kiaVNbJQbWhGdgqqyi
         Jzpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zjh4K4bY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb4fd9sor4866124b3a.2.2025.05.03.22.29.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zjh4K4bY;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336579; x=1746941379; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zr91VyD7KzMDPFf4g5hvijagOJ2GOeFDSpZ2RGMEaGY=;
        b=zjh4K4bYdszMvX6Lraz55TGrQC6jFhGPpfnbTwDXfq8iaY7XoHxVjFydoNUXBVrerl
         n16fbBCrMDucWb77MBm/t3vE63UDhxQWgQJq2lDlfKqE+L8i2FeRevich9xJ971CXS1I
         CoBh3F0gXrD2VY7aZjOMXg+8MpQpruynSmCGT6jWs22mq9cdCt4okoosUsP/I72d/d54
         +F1hXuwG9+u42H0iADurc3jKN5JGH5Y9NwGx/iaJ5FayP8l2VJo7N0HzB+AR2/Vqzqg5
         3AQpF6WVl9FCipjedsBn3Bn252sShc3+t9eWSHg84PXqmBxVHvl88wEHC1Lb9rUP1CPz
         dHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336579; x=1746941379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zr91VyD7KzMDPFf4g5hvijagOJ2GOeFDSpZ2RGMEaGY=;
        b=evJsLC6swONKze4wSj/jptPxpXt54TkyTWaXWdtCHPaPLnTc1bZJ8C2bawolNye15t
         7Jh65RylF9w5RJha4Iq+FJMYmhlVCjd3moH/uzb7o7ujR8QX9UkkA3k5IhXihnaqsk5E
         jR3htQCvrSxxC89n6Bg5qWBfV5RR71ei+1MJJARHXYL5m3pdfr5ELO1JOTUHTOv3SEgH
         4qkhvErh2fq+0vLlJtwnCt1cxrhY/BY6pnhJvX9I2zWdYYNdJ5CZtIkUtxFkedL/LkjO
         G4FLnAUFBVLqz43wZpU2fb/PAN8a2uEBPvkhFouIjxVaaXe0zt7v5c5WykoVy/yK3pVy
         bOLw==
X-Forwarded-Encrypted: i=1; AJvYcCX1yVt+29V4vvmuc3pf9ZW8Dj1CUSUiugiL2nwhvHdE24RVG8+uM4GhOXev3r7Yj0ufpbBu6d51LMoKtw==@linaro.org
X-Gm-Message-State: AOJu0Yzk3vRkLTgSkMfiK720Svl73HHp0i+4aN7sg1l67WL7bGIZ6TLS
	NO1oUDY2Y27ioTrk1VrakjUlpUcrrRAX3Hejpt/3ZHIK92/bnDfhOS4aWCoUHV5f+g==
X-Gm-Gg: ASbGncuyDRj7pS95aFAX+gjoJKVHUsGmXfzaieNGkl5ttNbh2GIn57WUX8ec5AVbwlm
	sZ1sgvYXmAbFDaR5gg8M5PVqRJVx9H8wNVySjEW+bVntWFPQV/NOlp9hSqTuknug3g9YJgUZQ74
	xTQC3pLaEqkNUKdtNTSuHyr8VIImExWeOjZoASxdAyxlFk29KK3uJEamRAVcmIwWtheOyBSLu19
	agsBda6ihbhDV+IR6yUHbH8W1HvjLPFkSdEVCdHEsULmq3pr5ZH/GlnHlvIlZ5qOnti90hmsxp7
	GCvY2CGh7pBfWsN4dxFiWAu3JodfrCmrrcfSdDtv
X-Google-Smtp-Source: AGHT+IFfySvOFkf5D+3E2z0KECvBrvExxDrnmyJ78lgoj5cX04fSE4cePI6QTcx4mVf5frJYla1Urw==
X-Received: by 2002:a05:6a00:1d0a:b0:736:46b4:bef2 with SMTP id d2e1a72fcca58-7406f09cfb1mr3647809b3a.6.1746336579517;
        Sat, 03 May 2025 22:29:39 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:39 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	anjo@rev.ng,
	kvm@vger.kernel.org,
	richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	alex.bennee@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 22/40] target/arm/helper: replace target_ulong by vaddr
Date: Sat,  3 May 2025 22:28:56 -0700
Message-ID: <20250504052914.3525365-23-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XnHqipp/sXk5

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
