Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2178847njj;
        Sun, 4 May 2025 18:52:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXnqpxXmmi3bZouYSNpxAy9Nqa8PKcrnaW0DLV14YjhtshnD4IAnq8wrHkE6AP6T86usSKULn1feJhyAw==@linaro.org
X-Received: by 2002:a05:6a00:4090:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-7406f08b86cmr7713632b3a.5.1746409973338;
        Sun, 04 May 2025 18:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746409973; cv=none;
        d=google.com; s=arc-20240605;
        b=dni0pyVLSeukDKaAfAw253XTRyXC2wfOB9GccM3JSEHSY8UNjvBL1rRkYh/mSuo4Y3
         SKjZZgDFpG7Wu2qSq+6oH6I5nqVHDNoWtRe10CocU9B8viUaXHaLHWwFxIR9wPMBcV1O
         YZXqr6WX0MJ1jicY9ojASq+a0TN+emscTzjVAwIU+6qiopXqVclanZfwgcfa+oMmq1wR
         aVNYAVgA4hPRNE6Obby+jhHqwMOb2nguiz79xzrZfZZVF/ux1tRT7sbtPEJVBqSZDghK
         xNs79QSt0piXIeuWVaKdLG6k6sLnrqWQZsXMujD6udVADLRMmiLr2qh6YVi7skBjNfXb
         j8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        fh=24kCOzGykJ/sJrntzgy4QmtX5L0REvfpQPSMHKjubO0=;
        b=VpEK0zlRECXkQAIjrh4b1AM0i74j9McBgEs0gjppKC2ygCU39OGnX5bg9Psyu0CKZ9
         NLT5rPGI+7jiEcaY1/DS8JsWI2bi6ipG/MthYjkgDDdJoKmvweatHV72cX7FBrcWU0qp
         jeSB8CssELB3oDRKHxB3Wr1Kp2m2wLtrGaXoRij31aX5Qy7osQVsMrRzhO0KAVyT84c4
         8MKlJoLIKMQMoExCGJ7IVoEg5H/sPI/LAIfEC8nTA0SYYBf/j0OUQ0qcCxaf18b/4hzA
         EqpCk/l8YNnnriQh0s581pGgK8/zQArryUmLk6QX8rVyH2pd8wwNoSGj84dRtNlmGLXE
         bBWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yTFrhnC5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404ef17c3bsor4174665b3a.4.2025.05.04.18.52.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 18:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yTFrhnC5;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746409973; x=1747014773; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        b=yTFrhnC5QtEFgRtH5K4I8ZxftEswqiEE20SpeQsrGN20/wmmf4EO9Y2LNUaaItq9Jb
         U+DTMPJdIKsDkGiKZR9rkAcQSOhricU2/wY73yjTFZxw6jhMRcxWQKBszYZGnK3/DnuJ
         XHxiy9NIarlg6Kaxz6h+zPwws/57YvWY17jdEGc1BjAOaLgEaN5BZmCr7uGovhNUbnaK
         xULDZkic0GfN3+bsdvItBohqs7Zy1GGz+7yJHVAa2aPPh5jxgVZKm0iWu79uxfGR30d0
         Q3RjrEjVvPzokOxDVWF65Pz3/XRMtOE8i7vvSDHLYT7SP+eiCVhcHmkVP/dIRFln588l
         J/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746409973; x=1747014773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        b=AwSwWZ/mx6Rqv6p3+077MnyVsGjslKgGEhkLJF+wDipwsIgnuy0iWN+ecPXEvJk58h
         3LRMZf3aJcm6nD1OIQU9IBRLDWh100rCoCHrPHO3kxxx1mHooSMW/46uZJaj2LcFPKvg
         UgSPLPiY/wL8EMylrftTCovFq02Um7R2H1C6oUCN9Z5KlEfDeSEnI+s1pLOrMkxtZgD6
         b8bceHpXqlIqXIWgWpXqrkRSK6DhpWHjJhTonNOhOfvvj18fAwzzgM8rNd8cEC44XrVv
         EKwdsVrTr0U0/Oz3BsdwjaGv7HK/rxIsLCzR+EXbtoKr85ULJLTVCDqnRJsTP5OOypli
         s03g==
X-Forwarded-Encrypted: i=1; AJvYcCUhUV06eeGC08+nTaMYpP4tz4ZnEFCWybSyXTAw4dFgKssOB4sfOuRd9EyNQB+Daq748pwRh3/e0O6AbA==@linaro.org
X-Gm-Message-State: AOJu0YwoU3GwhGHYNGMVSAwWWitD68VQZ/97zqGLcTkBcAIRdXfKEYKE
	IJq8F3GCXfbw1l+LXq7i+HY6HprXVqg0qnhlQOyYBdKPyUgZGQzlVQM7PxBeWtQAxw==
X-Gm-Gg: ASbGncvHq+I/hU1WGfJJi20+phI0yWN/LehR8p5zwI+EgXoTSOGVTN2C9dizCkj4gCG
	D9iAXeOi7p7+C/i80NgNzxmzeLQDnMK0pWAxLu7i/6J5quKAtHIUwMI8vSbinJw3DKtMpomaym0
	UCxjSQ9O36kQ8Csymq3mAbytNXurI4PZEKYH+HxsTHYzAI/yEzZyOXGDa3H4Y6EPv+j/pFtPN+Z
	sQYsZPrb+1EEi2DM/ln6lpqmAd2thTuZzd2OnNYP5Xffi6FAuL2KU63YDfXqF4YjZBHzdEiZSBS
	5wvf28TL03DNGiLhEVQy2Zi4TrP5H9DdjSdCUGYo
X-Google-Smtp-Source: AGHT+IGBQ16QZAGwgjeEboATnbwXZoFnP6fmv9Cr4aS9PWpTHF70jGWZcZkTQiKdWRxPemZ0zpyEXA==
X-Received: by 2002:a05:6a20:1589:b0:1f5:6c94:2cc1 with SMTP id adf61e73a8af0-20e96ae6ab0mr7772543637.21.1746409972928;
        Sun, 04 May 2025 18:52:52 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3920074sm4462101a12.11.2025.05.04.18.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 18:52:52 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	anjo@rev.ng,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 27/48] target/arm/arch_dump: remove TARGET_AARCH64 conditionals
Date: Sun,  4 May 2025 18:52:02 -0700
Message-ID: <20250505015223.3895275-28-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: t7hkTFM6e3Ij

Associated code is protected by cpu_isar_feature(aa64*)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/arch_dump.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index c40df4e7fd7..1dd79849c13 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -143,7 +143,6 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
     return 0;
 }
 
-#ifdef TARGET_AARCH64
 static off_t sve_zreg_offset(uint32_t vq, int n)
 {
     off_t off = sizeof(struct aarch64_user_sve_header);
@@ -231,7 +230,6 @@ static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
 
     return 0;
 }
-#endif
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, DumpState *s)
@@ -273,11 +271,9 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
         return ret;
     }
 
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_sve, cpu)) {
         ret = aarch64_write_elf64_sve(f, env, cpuid, s);
     }
-#endif
 
     return ret;
 }
@@ -451,11 +447,9 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
     if (class == ELFCLASS64) {
         note_size = AARCH64_PRSTATUS_NOTE_SIZE;
         note_size += AARCH64_PRFPREG_NOTE_SIZE;
-#ifdef TARGET_AARCH64
         if (cpu_isar_feature(aa64_sve, cpu)) {
             note_size += AARCH64_SVE_NOTE_SIZE(&cpu->env);
         }
-#endif
     } else {
         note_size = ARM_PRSTATUS_NOTE_SIZE;
         if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
-- 
2.47.2
