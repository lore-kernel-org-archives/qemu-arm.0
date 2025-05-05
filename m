Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778317njj;
        Mon, 5 May 2025 16:20:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgA6kw8J/KOm8Y1FbHbOiNQ4UeFbnduAZsZOvjM4ikzk6Wpl1lMgJ59F1iXaC/zZdZICOga6wHaSuRcA==@linaro.org
X-Received: by 2002:a17:90b:5843:b0:2ff:698d:ef7c with SMTP id 98e67ed59e1d1-30a7fcc950bmr930012a91.29.1746487244994;
        Mon, 05 May 2025 16:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487244; cv=none;
        d=google.com; s=arc-20240605;
        b=AX8I3/Qnv820+3MYn/Pzw1LWMbonGBCfFkKANukfGHHV9xReRmuSnNPnUJJc9pxRyo
         QDtFuEk7we0eDSSEZps24QQdJ3duhZA4mSpdprcmNSmiYT5Ahzz6ewKkwdiy7cHSBFuj
         K68Xng4fh+IOA/IDbZFFQHf6ZPnxM6U2OUcXsgStma/asNsqef55k9U9fl8UD5YoLX/3
         ngmI+LlODkpoygLJpdQ0UI+BuIxQD8OxVWAmM/HZ2xqDPBL11A3oh/txlt6nkt2pf6EP
         Mde2MHp9fH3BSeQVPoVEBErAR8OC6OK+QbrqCSdM0sZTkBRvEFz3qvPkQ8wZydxVHzw7
         NPSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        fh=xM4s6FGoF65sw8/2TX7N65E7qidWpXUGLvTtdURCQOE=;
        b=MlJYEVILsNKep3xZUHlI1fK1aquLF98JQ4sH8IgpczBIxL5Xv9FyIfmpFeKKKthBf2
         m42v1BiXQvh+v8O1NC8aoKktDMgq3hrOITXXrlYK6qN1NJ8oddmHz8whEmw+q0XwgIsW
         imjVGoMFLlO/gMA0NHHniq0HVlVxMsM1vWtABxInbWSUR8jS0HJH8koKGPP8W5OgC8ij
         QzNbKps6VVUr+KSgYjAqEV9k+O+Ry7YcxYMS+IwpnHAF5t+Gtv44T/yqhhldNcLxJl7L
         VZvRj2e0Pg9mp1Q3a1OXFWPI//e0x5J0Vr12l/u0R2ZaHamyVuVphplXaTVuO7U6X50K
         qLZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cqBzTA2s;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc7f8acsor52742965ad.14.2025.05.05.16.20.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cqBzTA2s;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487244; x=1747092044; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        b=cqBzTA2sjIvg6fc/Yz+rct+DZgWeExU6sOgNeCoLIGTl4/wuz7RGZknjLdlZUDS7WM
         k32rngYfdPAVPhYCd7VpvgJgAdaj0Nhk/u9yH2tRDMKlXMDoR8+OWfiZ7aIRepABEbmb
         vUSPNBrujGhD3Ap/X7qYr8U3VmlrqDKUO9Bo5gcINieXzp9LS8/PUFWycMYOOkLp2lQT
         eP0R6Y/zjAdmsdI8hKYlFj0oOvQYhncoYs9/gExXo8yjuDZbPUxed7fsQ6lnc0LK/dUO
         X1j3eK8Zf8iAWx9h95Bda7DoA2MpWQdpuAIHp7zY+0m+zVXejLHSigtbeRidSM7xF2Mu
         yZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487244; x=1747092044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        b=naJSWx/Kfkq1pAmSKjQ90rn6+3IB5M3Ppkn0y7ylM3X1xj3+9wIlQCd7rr/kfmAUkP
         3axn+p35iE0gzubbx7y+aH4pOIPm+p0SO7+oCjCpTQSZANvl58ca/yD/eKu/ho5JtBoS
         hDyv6/KXqfbknfoDJS3XGAUsW0FDYrndQZVkP0n/+i+wCodVXen1lmMs2gAx8ErQT+0D
         jX8g0BW8w5ImMMg6tJGdr2loKrWpRcHkFxAGHrgWgNv7RNIz2RkGpkwGVsTw/rkySLcD
         7paveDneCU+BlyjvkG+vo2CfB1NVU9d072nr826MeMBJ1jWX7U+tlxGapDPiccX0AkGt
         1bNg==
X-Forwarded-Encrypted: i=1; AJvYcCXhD71DZWa82Rz/3IQz4Lw/2KZT6mmSmYcMDWKLn1PfH3uJgWYQFxofKBXogvMosAdw5b+0/JCQYo7rxw==@linaro.org
X-Gm-Message-State: AOJu0Yz+3gDVEvmmpAxn0FIZB0yf92A+aqIa6wu2alkIUj0fTHU6c6v7
	VI4FhrAz/QMC9SHXcvb8jv2S+IkYuRkCJthCAxYiFOBw+iR7pk4w2WEN/iLgw8KZ0g==
X-Gm-Gg: ASbGncsNmi3iGBStfWQSB3dqyNeEG0quOKZQar16RwwB7UkV/NWN00C1IVQHWyZwRii
	vuIdjcbYjVOjr8Br5wX2AR/1+RYQwlpDvPzy+z79UMgdWIwZJLhPqOIDxm/6BhxCrKEP4/TEA5x
	Ufc570UgWEsDjSfqMTtoyE3qvASrUszO9UM46WiDhzs3Vz7ykKCCNrtwqu9a4frqyvYCtnY0x2r
	i2cr/iRsqc4MjggJeGIxYnMtiW206gLHhIE3Yw2WDMwKQE/vo7s5wT2aYP4D4Wp86xbHverleHn
	GdkRnnuFicOWGavEq+RjrzNTpbOI6uCyeOwD0yVT
X-Google-Smtp-Source: AGHT+IEM7kaXEWCjPJCRibG1QX47pOlJJpefd7EuFnbK5xMzUMnHJ0NFjXgA0rgQXuFWitn7GRKtLw==
X-Received: by 2002:a17:902:ce91:b0:223:325c:89f6 with SMTP id d9443c01a7336-22e35fa30eemr13388815ad.10.1746487244580;
        Mon, 05 May 2025 16:20:44 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:44 -0700 (PDT)
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
Subject: [PATCH v6 27/50] target/arm/arch_dump: remove TARGET_AARCH64 conditionals
Date: Mon,  5 May 2025 16:19:52 -0700
Message-ID: <20250505232015.130990-28-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Pv8EGHh5eapi

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
