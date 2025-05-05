Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778282njj;
        Mon, 5 May 2025 16:20:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuXDyynzUvRRT+biQ6BDWPKLRK8/zIiUgGsEBAPo7JCt1lFFGhNb6Aut3pKHV395I2/fm+e7GLSPfG7Q==@linaro.org
X-Received: by 2002:a17:902:ce02:b0:223:536d:f67b with SMTP id d9443c01a7336-22e1eaaf8ccmr170689865ad.38.1746487240508;
        Mon, 05 May 2025 16:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487240; cv=none;
        d=google.com; s=arc-20240605;
        b=JpgYGn59jxHo1xvWwzXfZEE7eObHU9OA//xECgAP+3+s1cnBPoIwTer8pWcNLf+abb
         FodAL2Rbc+lfqGGy3wcs4AODOgwHKrRcvQCIsVGbbC1girNyGp/6spAzpywdxDcLL0zQ
         EN1X7pRos2naPx7/U/GmDcYS+lzmTbYM+X7wUROK7aVjSoAyzuZqA/g2J7+KzgtEXnWP
         atwFdAL3kNajqQvmqCmrMc4lvadCZX57t4IRRI1BpibS9S3GWG85g3luAOspzmMpiIKj
         AY1hIymvlZNfi3jyTLIqHEARKqHaWQumEgsIceLQXUdVg29yDtjwYgocwCV/nM6pvJ+8
         yXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZaY3toZMvHik6Oxfda0st+OdZGZoqXe3KmHGIqEM8+g=;
        fh=iuMzoKTvlZUtqgE2HKgzjOK02lSSC39X3LYG5iP5WBs=;
        b=OIdOiKmMkPOWbS310tvnGuM5kTsk39rWE9dvi/m8ZDtnTQTndotfnHTyaB0Glwa70F
         KTZhoxORTy2IazCPHf/LJT73LMlor/zSgtzazmnmZ7CCU/LzkI6OK/H3dQw916mstZug
         yAIzTYCbWeMf1cDTz+gW+34XO1qGAEnaT3s8tvurvqM8OtFPs4eKHgXalB+pV0CgJC6Y
         QvKcUTqpaiX2KQgsfD3vvC0eU4kO0pyrrM4a2j97A1hJiKo3QHxNOWgqFJUCEGVARNRT
         1iBkWb2v40Zwwc5Iuw50rDyyVgOqnstyiGNzFTMYS28HbcUzt5b9eB+BSP8c77wsegxp
         3g1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NAjdw8T0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb06f1csor73768575ad.4.2025.05.05.16.20.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NAjdw8T0;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487240; x=1747092040; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaY3toZMvHik6Oxfda0st+OdZGZoqXe3KmHGIqEM8+g=;
        b=NAjdw8T0V58ZdX9NU8LywNktG1GS/my3XAqm1oliNF68HKFLSJsEMM5TJmvHS0btt5
         r15LIonD5UH8RKueNqgonwKoO8exQIYYPX1fg1H44MIJ1ZquCIe8cwERnMsEupLYs8gy
         0WV3LG0+iuabqTJGTbWUQbXNAEqprzQFxpSPOAWa+ZfycUN/bu6JIaGY1YVatyGdjlem
         1iHADdEprlbZvTWIvTf8xrrrY5wkkE+yCtO/GZN3eFlV19TwqM5WQa9ZU/9ZgLAITU0j
         2XRZYEBh3D1s0uH+wYhyKwFueLArISjLY3tcjG0JT/9cBlmSbwPs9OdhE9RyQDzJqfpb
         qD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487240; x=1747092040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaY3toZMvHik6Oxfda0st+OdZGZoqXe3KmHGIqEM8+g=;
        b=WxPzPx07V+1cF7chzwsxwCd1AOHHXnSNykiIZifL8ee2gXVJnaehYnuzotLVCY67t0
         8/66gaoG0nJmlKb9NjWplylsFx+RJ9CN9WKw+X7zTPiyo5FYU6L7Gwqvz7tagK20gza8
         5rz8dR4CiCeo3jc7Jk8fp6foHwvNDrjP8Wr9Rqz+vd1smAX8z0MB80myiA0h5i4ePCcA
         QfRLTz1eOXwM+BKCd4azW6+pP0YoXUPJzWnHLEwm6RyHzCDZjUWIa6ICXEi8ZpqvemO4
         1a9DDVJQKvS/rLtukGvJx9RfxImYPwexCLX1Lo9grmMzTvZ61m+HM++ETZrOTYZLiNhg
         exgg==
X-Forwarded-Encrypted: i=1; AJvYcCXN4ZCpTaFx3lRtCGMwAPq3ANiwnJMBq1wGK4zVztuZtrYPz4eGD6/+5j1jXaFxgaM0WNayzXXluwk0jA==@linaro.org
X-Gm-Message-State: AOJu0Yz+L1p9aETftysDZD1xwdnPE5JOBcp5np4WYWa6h3EFTdB5/kKX
	HNVRTW/DHpWrwRjen2Dg88CDCO9sTzq3emVSK91E30uYZ47iIsNpPJ6saTStTSCV9g==
X-Gm-Gg: ASbGncu3jyfNkgwaeJc5TFp5+Y9YgOophcsxLxPmflWZp0zuGf+Va/XdUYzav+JgJbm
	OFD0gkdCSU482bcmUSouuBx/OyEnHpBOnaV1jm9PxQ3LHdhvikwZruxSLTFKznvYHLvXypoL/PB
	hM8+0QNIoNZvAAXpLvf4TdDoTYV/FWbc47owLses7MF6gPBoB6vBEtDcrRk7BJgM47w8cST2v07
	vtmWUvrDbdkLCsBE3O82Vk5djNJdXtBNBfZItYeG5ccKsZsfi6eFs1xqWnVQ7dOFu1vQq6kX9DG
	kIO2DDzmXAsxMsbDiAa7snoqm64ID18fYbhoHwXg
X-Google-Smtp-Source: AGHT+IEJpX9b4sIeMwievSiYenGx0avBZsdb5YYkcnnfwScYImSa6xg3N3nAjjr/lE8XrijHR6UurQ==
X-Received: by 2002:a17:903:1b2f:b0:223:f408:c3f7 with SMTP id d9443c01a7336-22e1ea47acbmr137947265ad.16.1746487240186;
        Mon, 05 May 2025 16:20:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:39 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 22/50] target/arm/helper: replace target_ulong by vaddr
Date: Mon,  5 May 2025 16:19:47 -0700
Message-ID: <20250505232015.130990-23-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zlFlKvR+E5cr

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 10384132090..7daf44e199d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10621,7 +10621,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
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
