Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94380njb;
        Wed, 7 May 2025 16:43:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrR8wCIh0pLKGmA6DuEqR0u/M+2lnYE16rlYZDAKZjo4bUXgzZzVo3OnlyhDRTm+XU6BTc2FwaNKUwwg==@linaro.org
X-Received: by 2002:a17:903:f86:b0:216:644f:bc0e with SMTP id d9443c01a7336-22e5ea8cafamr81236305ad.24.1746661386290;
        Wed, 07 May 2025 16:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661386; cv=none;
        d=google.com; s=arc-20240605;
        b=lH1pr6iRN7ozIZjOCge188b3b6Cvbq+ZHIBh3sKwHB7zYl3/t6nb/xETc7ckRxARQ2
         Z9i261z/ihc6qi6xHhXgBmT39hkxnTCUEMjbnuvWiuZ1jcfU276uqGMFheyIOegygdKr
         Pg9/Px0hYRxvqfaJsHkAYphtDg0XqQaQUpAbkjEgGca5LOKCXBMVsxNiwKg+AW6PNAbq
         9JTbg3YPobe62JiZl+twZLpe2u7aXmnlYxdZ/qWlEitGOuH1F0SCD1KXcnFRPSx1GWad
         +u5gLICIH5GpOd+FBUnfavcrMJA7iZ9vQH7hxGxJM0TY/FMdy/6dBmGN5Jy5OmZeNk0d
         QWCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        fh=SSftrL11gZj5JWbD63hCAxVGJv+wi3oK7cAANZjs/tg=;
        b=RcYZgEvBmz4VAHBDhdLVBvxnicbPAWm38jB5NU19gxs8HXnBuiwa/I1dhZ6RrO7GZ3
         fwP54c8TjATOwPX5/zhXlLZRbUsNAIvRVyX02QAf2AcTN/nq7me3NUw10UvJAziTtqUu
         9pizy9DpIaGEPrJU3Gi0cPEwcZDeYEMw4Q6vouwS9Cr8WdenAjyNOZ9+uo41m9EFUrwz
         k+617ML/1GUurDk5huHXh9FYA5OyZjGunmGUg5EuvbD04AWAC9G5z9/CIPEsXOen+BH0
         PQxMIo63MlHYnkTHzz86vzZE7bZd1YLe7C5NeXPBuN9mOlv2TpsX2XkJ+rdyDGuWe1Zn
         BE8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PLYGMG4i;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e62c670c7sor23844125ad.17.2025.05.07.16.43.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PLYGMG4i;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661386; x=1747266186; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        b=PLYGMG4iz+6vUfcG7x18P/LdQpbptj4yxdS0plqOfh2Z9xue5j24eZQkwK5LALs6cV
         RUyqhH0ERScmUiwinwccQYoRuYFTqVSPL7oZd1obZMGZyePLtZp205qFWFEV5R6/ThXe
         i6bxsMIagXnSEtthWwjPnjoVFpw5yELVAhoQhgMMW5DMHqyY5dCDLZiflzfx2GcgykEu
         MIG+fxlZQ4zuFB7wbwLVb13GVMb9f49pG/fqFN4Ax92nVM2aXvJRXMcC4FpgrBoI+/SK
         eQLSApcCE+1E78T410zxUBGxvvXVWu+Y65bUq3yHZF2BcgMI6s0aaAoCQiReEuT06xHo
         Kn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661386; x=1747266186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        b=kiybCaEo/W7LswtooPNthY/nXOMwfhMyyTE6LCZrR62GCw9OyDXiTv7KUIVV9lWnWq
         kAmTPlTPlwCwmXWOSKGhRQxLuGZYc9nV5iKuXRGdqLCEmnIUrbyyfy8KGRqPAXrgFbiA
         9RB5YrH/OZJvIRaE3qwlLlYqgPuWxzlVC/RuGyY5H+v8YqOvemcEjzmoNRJiFocRFeqE
         NFYyqXfExOsxVuKnn2zXV8Ni7gRe5n5urLXp+hbwrGWA9xKOWMpv4i3zDAIhG/6X71um
         gelQsDQg1uCQffn8oO3jmDXM8gPYloZbM3tQsj6NT1xy9Uulgn+331FSZRkwQA/y9Hc9
         PHvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIFBgRwuDBmwlQFQVI14EB85hvJi7oSDZkS2S+dB0Z+ODJAgyQvBOz/OEZ6EA7yfnFflLNZz2xMELL4A==@linaro.org
X-Gm-Message-State: AOJu0Yz+AjS6RpxXiXekhfDkWDYb6EU3Sj8+0Z0I3nijdhZzxeWl7Uvd
	+YZ2L2F8K5sz+MRSNwbKtc+Mi1AXnejTindJ1q1ZCL0p3igL7JNqN3vPKJmCdV00ZQ==
X-Gm-Gg: ASbGncvyI1i+kopNC0dR3FNm/xURfREdYhKTwq+/1s3NfqOjcQvX5M4Mhmye7o4dFgu
	jj1FX2iDAHekJU2czllIfVA6lTfunYmoIpZvNbwVqTf7OALu87tzrp/bhYXorhnzx/7aKZ4EmU0
	FNqpPA2K2PXkrwMd2TzdaD9UBRtNUREwDe8kLGruv58qXOmt4kEHad0R4pQ1ipymTOTi5fPEr4o
	waVDxgMk/hSqSQR9HEs2O5BIihP4Xi51knmXsJMaShefb/ddtL+1XGT4tq/tJL39nV3d+dAAa4O
	AOd5upfz3ZRa8Jz+8N48FOlZ6gODKBGpeY5Isr1Yjxz6Optnc1U=
X-Google-Smtp-Source: AGHT+IEU4Pf5XRCP/PZVO8a05wh2KG6IVjY9T2lfZS6hZzaegkdfG3OhY+b1/nT4B2UQV8lzgvaq0A==
X-Received: by 2002:a17:903:2352:b0:220:d078:eb33 with SMTP id d9443c01a7336-22e5eccc55emr75031795ad.36.1746661385885;
        Wed, 07 May 2025 16:43:05 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:05 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	anjo@rev.ng,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 26/49] target/arm/arch_dump: remove TARGET_AARCH64 conditionals
Date: Wed,  7 May 2025 16:42:17 -0700
Message-ID: <20250507234241.957746-27-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: w8XtTMHyeBjt

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
