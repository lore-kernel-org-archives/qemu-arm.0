Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1756738njj;
        Sat, 3 May 2025 22:31:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaxDrANfAtgqwOmC14WYywjG0A3q0x7q1ij8u7KayahUHNCRZyu/HSULjpW6Mo7jVAOg8V9LnprMPbxQ==@linaro.org
X-Received: by 2002:a05:6a21:4a4c:b0:1f5:8de8:3b1a with SMTP id adf61e73a8af0-20e966057b1mr4875957637.13.1746336584186;
        Sat, 03 May 2025 22:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746336584; cv=none;
        d=google.com; s=arc-20240605;
        b=QbRI6f2RbWwJTZBxXDtCoOG4TimR14nLt7Yn9T2H6kb+7fcH2j+xXWGF+Qb4Onn4yh
         QUrvgljphf4obmY8mI5NErqKYammXdXKDzKO35NzF4+8Me0zO13OjOp+N5AAepSBS1FF
         4bTLmRT+SH+UhsBr+BJ8XdaVwRuZszesuRofqa6aJedsvYim+o/9V0+RwNTwgJN8BVUB
         xuTo8aGOpTF6YgdmGJRO0EeHqySA+RMH7evMNIDK+se77RkRJHk220+1F2KM4kOxnXCH
         8OZ0lMQRJiVP90Y/wJbanJQD7FmHYrZQss+jSudDINCuMltY12YktItKMzKvOd7b3oZG
         dmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        fh=FtgVl7l3ggkHc7iMl4kIXjiDrOXiKla9IQi3esgnT+c=;
        b=lPn0piIMzQEyxTDoFETQ4vP5R3moUMtPWPz1pTVQ+4EQLsytcLhaoMBFQ5TUY+cf4i
         fGBeSmJ0cD67N1qmAAMNRUxXMEtCnqhJcKcW66Q4dScL/4MkHjlldj6aQCJU7415FtNa
         9y0qfuVzSBUkINjeMwAQEWIaQ8ysXWVoAoRBARzS/DzTlWcJqjNBwHD8EpCFZhygPzu7
         as3GcbLus1DTy3x4qk35WcB2L514Gx6yl7FZPSVUoVqhZFkJFzTmiUNJtyyalGI5u9gQ
         VwDjtFXXYd7NXqqOOeSAeChwx9XikYvjtqXC1EpLo/4OL/MvQEDjvxJKD4DGe40NadNv
         VOeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vdqxhHkE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0a2f4sor3082358b3a.9.2025.05.03.22.29.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 22:29:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vdqxhHkE;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746336584; x=1746941384; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        b=vdqxhHkE+FvASA/alTDe3dvpC4610FR+9Em7y/RjxQCpEFy7UjfnuaXxHzH1TmZSBq
         swsjvfVD53qLtxCkc6g3A27UiIaVX2DFn/YqvfY5OfvtwuDrZscYl512lF+DVIq/pKn2
         9AEudEVi6Bjy8RrTeNlK09rdmefhRNcijTyZWepHq07DFOWaestkfjIzBvmFqdEDBs4W
         HKTrEpASs7f/PYqFoj5YdvLgBFOqq2X8okoWI91HbQCf9PeXJDHEvVTlpRoyhbW/IbFE
         qAO9qki7qPBObPs0ZlT2l4KC1KVz06M+kV8HtEyI+fQREzPcDuVI1dPxziw8QNcBP6rY
         r8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746336584; x=1746941384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zqH0yuKEeNcEhgp08pnDlbJMJEZktVD9woNi3X9JPBk=;
        b=Myn2vN1rvwbGhv1rI8ZsyDfRYLGk2x/22r8g/H9LWtcfUk+JLJucwkKAE56FAMS0a1
         o6ab0nLv69FAt/pfgcTTlmbJNH/OMzb2GCkBhKPFalf4YRUCYPB3paE4h8U6jVhftmuT
         btAeKf0MHYb0WK/g025g0cjSYg3t4gv//pqyEcWoSfCDk47Q65GpUS78u6pobPYDrazW
         SFi2468bC3Ei4JhOI8tBmqT/RUZys18Q+1YbiVhx+i4UBKJoq5uZS/KX6RD/j/tSamk4
         U96NcajEOwPdzKvSu150EfIBmId5Ucn+MRFFzngFOY/08g4h9KjPkedZdKtVc6FxZCwo
         TIxQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0ClKMmwRWfJ+LxZ4wwcSAZkmyeAGOUHUCsWmEdk7Gl5nihnKIBlkMXZ9UJK4ahu/rXyn8DRieeEGkfA==@linaro.org
X-Gm-Message-State: AOJu0YxJY3YCvU/Ea96dRlAWKgksErhUfDz4T1O3JLH+1N6rg+lW+SA6
	5zat+8WuscOGp4Rxs0Cnc4hwRAZndzYjT/Bc9jOTCrgDfFUE251pS+ZDULIpX9lIjJ7iJJB2b7E
	f98zALA==
X-Gm-Gg: ASbGncuwSY9Fdex/ZogvBs4SsL5sTFCv8DrFtWDNk9XSW16Ab5WsV6S26t6UKQQmCOi
	E3D5Ul+3LEqegMADzbv6rQPn2LuYYjK4SaJVDT0jgx8oCW5axt786ouW9aXqBtq/k1Vxr5wT59n
	jPhrXB3zPuPjbaUHkLwQXhIZma6PW5K6A7k8Nn+nFbjoYuAPltyc6K8ZETQj50rKfjB+YGrp9hN
	sbQhGeCJxXZw0RctVYB4L5FVteCMW56cvnZwaRrKargsAsIjlchSzaLK1aJywqm5TaH4y5l/eMi
	LRT8/OoDrPbvPXLw/hMgvX/FaSv63sUoPzrGq+HarVUm0nkqzCw=
X-Google-Smtp-Source: AGHT+IFFBK8c34bQn544bg+nODkndDO7YUq7xG/ssggchm4p/JYvKNTvfhwfbEZR6iSs/1WMinW6Zg==
X-Received: by 2002:a05:6a00:e1b:b0:73e:96f:d4c1 with SMTP id d2e1a72fcca58-7406f0d9ef8mr4125601b3a.13.1746336583780;
        Sat, 03 May 2025 22:29:43 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590207e3sm4400511b3a.94.2025.05.03.22.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 22:29:43 -0700 (PDT)
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
Subject: [PATCH v4 27/40] target/arm/arch_dump: remove TARGET_AARCH64 conditionals
Date: Sat,  3 May 2025 22:29:01 -0700
Message-ID: <20250504052914.3525365-28-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Pu14qpGW0+5l

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
