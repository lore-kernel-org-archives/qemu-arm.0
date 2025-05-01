Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp19669njj;
        Wed, 30 Apr 2025 23:24:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlLuN9dtZ6MZjaK/OZeE4CzV7Tdw5TN1b5O+mwTuHYFb9zNe2Q8auNnyfXnyEybwo87PXzA7uQ6j3yOw==@linaro.org
X-Received: by 2002:a05:6a20:e68e:b0:1ee:e24d:8fe3 with SMTP id adf61e73a8af0-20ba6efe567mr2910625637.10.1746080654319;
        Wed, 30 Apr 2025 23:24:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746080654; cv=none;
        d=google.com; s=arc-20240605;
        b=jxNswn4CzDZqMpE0zYB6Ij0Jchl0WjLBLuekEcUej8ldp35HSleu116Te4q1niEkQM
         A5SpRbJXuE0sJrU4Wb9E5lB5iP5ypQ1yYCUj7H1laPSEuUzvKNatv68OXfr1Ic/QBryJ
         At1NY2ZmMwi6WHz4ps/qmkJ0KwC48GR7K7T39PmrPoJHc3/LImYHWD4Lz3FEFB7Q+2ql
         wrUMYEZuxZ7Ci9ZNc0bA6xs4iLe6+83tQNvmp3LeHjFxHo/xoWix3E2AeR1CZDHKD7ee
         1pckrT1V8joROz1EkStaDmQ+P0VsbVp/awZBT42CjsBP3h6Uib2f/x2hVrE0r1WXgg+i
         FglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=O4aT1FPx7v6ild1hKo4Zu9XovGo//pi9dSehqEFhLB4=;
        fh=KrxyJJ64a4cKkmHc6ZMO85QxFmLHHYQ3fAwn1NoQdMw=;
        b=Z9a+ZLZq67Ubc9TEtrBDxWliC07tHUWVaBPQdi/hEJt0ZDwjRic3vuZlD0jqeEgAg6
         V87od63dTyzzT5J3MLjj5ERmd0yvaW4vrSpOCh1ArMPsrTEYsiiKE/ydH548EmfjhRvQ
         +7YRc+gJworp1GeVEIQgQAVtEZdr5e5YaoZKpjg+PpxUsigRtQ83N2tOVBWN7r5V2nO0
         h8uZ6MYVdJr+nAeYveC7MwUlreqtNgmHqrF0aGo7QupcCRRBthe6FRAUbyskGub8X7Pc
         XiHFoXrn8z62guBGlu342/2kSMA6lmVid6enqYA13uN+/8Hfo1Zm/+NkQngg2MQvUb+g
         4qOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eiIO8gC+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404eeb73f1sor107439b3a.2.2025.04.30.23.24.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 30 Apr 2025 23:24:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eiIO8gC+;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746080654; x=1746685454; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4aT1FPx7v6ild1hKo4Zu9XovGo//pi9dSehqEFhLB4=;
        b=eiIO8gC+zCtXZRgfsMMq/XIml8WEvJPzwZNGQ24ZjpZkazi05lFY2HyqURdPrHWcQx
         evRx20gdA07TRIlOIsljzxGONYcgMT0JcH2JFJHUZXbs0JYclMj9HFyeFs9ALIu4aob4
         oUHNBZXPDpYsVFCUIQphaN0OTQfh6L6E8jLkUFHdrn0h6txJIP6o5RFz7OzyGUEmhWBJ
         Eu1af5y3kYvyG75TLpS7zKJP3+y8vospCWA6dh82SK16OChHp5CSW4ZkOuQi4XUMyEMs
         Ii9e9K6+Vo3mtm7ZpnyAP3XPypy6uI0s1TWzNsmq91v/UeQqkLfp+jrASvRixAA2UFys
         4CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746080654; x=1746685454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4aT1FPx7v6ild1hKo4Zu9XovGo//pi9dSehqEFhLB4=;
        b=sd0ntLpHXpY1vhDKmz6A9UaeYo+JkT3X5JnDApTPpdPP7sefR2Jj9lwb8E9R0gAcbb
         Y1TW5NeqvMlFX6BMItExneskA/TKoIkjHqL2qvcgpv7i8lwxZTiBdbgu/RrAJvlkfQ1R
         +MzcLjXyPE78/1UYYC7d6Y+wv/zlSxsYIwvvUciN+LH5NS0nfiP7x3szvplj9QzaPYKp
         Wb6/9poOg9dI9cQeaEniBtlAWa2LuoSZ9UT0AuMX1LkyV/gGi09VTY/VK2Xe+tnPP9B3
         Z+1V68Dfq4fAtST1FmlviYZHOrGqVctjJAcxprgAXnXwVhfNeBFIqLh85lJCil4istXL
         0Frg==
X-Forwarded-Encrypted: i=1; AJvYcCUcf+k2m4jtYRPDnNJWg50HVzfE4TQKr7XopfTRCvrYhdwj1tSd98J+S3Xe5R9btaoGZpKjRg0KdoF65A==@linaro.org
X-Gm-Message-State: AOJu0Yya+9OS+7hX1IwM/e0qAwGO9fuoPMAeyehBiK/Xe2hpkL9oeTP3
	7yP28iY9olGtVGRB/CW/lytOdH00iSItDapiy3ci2srFKuAHzpxMRCOYiWpUGgFwSA==
X-Gm-Gg: ASbGncsJn11cdXzS3JEamXSoPXA5zBp1+IA5ysb/P3DgrOuCkb9B0DpbaWaMfz8Ole1
	XpHfyWib6IWZyFpOHIoqyIv0AX80IA/V1lGZpuvBw47BGijuO6ycaFzv5Mt8V8H0OOaON5rMuLp
	SsZ1Ff8pPIO0NHABncjly2jfFIvo7V0OnvQCRkm5K/hqrrMCwtsagGHqPBDO01hrpCxXd+EW+mk
	EwB7L18ILSgZ75ipR97SsHyVVZIDrig8aZYD5ZzrLxFp4gJO4CiLs7W3h81J7gAJvow12qmO4jS
	y+JFHB8b5UIU39dUkBvgowekDn1kb7Uq+p8qGSQI
X-Google-Smtp-Source: AGHT+IE2vRA/bWJPyQMqjfkqLzpQvVj8Wad7xwqt7Re1vxsIoaUiDeWrqtNpRohxNat92nerkUYhOQ==
X-Received: by 2002:a05:6a00:170a:b0:730:99cb:7c2f with SMTP id d2e1a72fcca58-7404777ea2emr2728024b3a.6.1746080653861;
        Wed, 30 Apr 2025 23:24:13 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404f9fed21sm108134b3a.93.2025.04.30.23.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 23:24:13 -0700 (PDT)
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
Subject: [PATCH v3 25/33] target/arm/arch_dump: remove TARGET_AARCH64 conditionals
Date: Wed, 30 Apr 2025 23:23:36 -0700
Message-ID: <20250501062344.2526061-26-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tJxQqgxBCJT6

Associated code is protected by cpu_isar_feature(aa64*)

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
