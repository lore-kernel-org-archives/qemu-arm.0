Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp5086814njd;
        Fri, 4 Apr 2025 15:35:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+gwuvwnSIHWPolFCYtIPco/eEQ2xORox5Hjx+N6Wf1j6R1W+Fwu+gcJ3vU3lR1Wb3I6SPVWFEJ5j44Q==@linaro.org
X-Received: by 2002:a7b:cc98:0:b0:43d:fa59:a684 with SMTP id 5b1f17b1804b1-43ed0db3b99mr29297125e9.32.1743806129892;
        Fri, 04 Apr 2025 15:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743806129; cv=none;
        d=google.com; s=arc-20240605;
        b=YAwZBLeC1Kf6W7YvpfKbIwXS4T56ULElEZJjYN6Ij0G9SbKlmUTP3u5AUbes3TEEcz
         iVw/5OG4ZHka2OD7QCVZLGrEo1bNoTGwqPFr2XV7Ig+p2bu1r1XAyf43Ir1YBp4iHBHV
         dFl7UvVQhC4IPCct9Qvza/IXRLVox68jgLzrV05LPtKdgiGOfJW9VTKHIfDnD+YOdnfT
         xWEkJ5bDSNTe8fND2R8B1J+cq/SCUBbOjAwQjOovWcuomHwN9WFIkGxvW7cFxZ/TyORW
         OVL5TlCMbJQ7VzgcOYNPQde6hsJZwaQB5k0tZCx6ARscjuX/7Sq2GjwSnjstMeSMI5zq
         7viw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vxlCfJu/ghlRwJtFNdG3a/Et1O+b4mI9O6ETIO8F/ks=;
        fh=Qr1CJZY61cKGBr0WyNpsXg3zoojwejh9Q4oqdLWMccg=;
        b=ciZtK5b4oViqONfxiRz00fVFBEhUkVsxNAuv63C0QE8PB/L1CZw3J40rCt+v0WQjFZ
         ++68k1psDTjV5iCj8kYwSZxPgJTuB37yyURNZcdwU8JMwFTrToTQbOzAPZsxI6MsjU8a
         xpG8n8RYUIaaXobTyop0S/fFxlJELsYgL+kSk7/X3dohZyAIN6vqpdZspOHOi+dcCvux
         7+z1W/TNFqz8eEIJIBtkzwZNloJ6wDwWtbSmb+98E7ttQmGjjd/ni8u3a/pP16dM1f4E
         +rUBo+Sr+R/mw6T/+SKC3YXPyjHTf9MhsPhTntdXlt4C0m/qDfoFiXzNIzM1SBGaVPud
         n1zQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LCUbJKAA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec342c884sor21154995e9.1.2025.04.04.15.35.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Apr 2025 15:35:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LCUbJKAA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743806129; x=1744410929; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxlCfJu/ghlRwJtFNdG3a/Et1O+b4mI9O6ETIO8F/ks=;
        b=LCUbJKAApndWWLUKlWqfD2ETU3Hugvbd55eEAtdsvjyMaem9Z//HCM1M5ecLYkx0gL
         FLgl03kTSCP39JtIAVCXSJtlwUOEVAtvvBmKBNT0DBmH9ThPF4OVgYlyLNYNZ5TLysgM
         Ex2PlivQceJUbTWeIn5xeTYKW2VHrKq4EGH99II9ZWxLGjkVR+3sgzNXGNPZdr2QoRwK
         ywr54VqFLz3PWW4ovdSfGMDyLu5nDwX/Yfq35JPzLD1+kv7Wh4ErWBG9x+TJRWcLP4v7
         Fy2FqbJw4QQMSHL1RViNI/jm2G+fH+JoUjPjkrt+thXUcTldl4l7/VY2Oq72pYyHM8z4
         GujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743806129; x=1744410929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxlCfJu/ghlRwJtFNdG3a/Et1O+b4mI9O6ETIO8F/ks=;
        b=aqWo7N+RMEif3KnXfWIa5IVlVHQiTyuEgAlOwYF/2eChirDr/nZEiXKcNyAAIWgxca
         lMKhQhp50K+3FDPczYWe4H5ZwMxKoxM3r+eJb0pDfbXmNK8PKRR3m34zXON6EwFqhv7O
         yEtCyJfGn3KOX9UAH4aabdu/kZWTtdNaVzMXsAYQdR5PNFz+Cd/7h7KoGrp6JTJ5NfYZ
         gEiznamcKMAH0Cl9B62dTZ6ffovBCVZwz6GKs4CbP2w3rUHTEsu9txIctikwQN/s0Ekn
         gG0wKzDcfr9bEJ5do7Q1dXtj1Itdcd05iVwJ4zNBc5D8r6DVvBH27h4glocUTshuVPJW
         J1og==
X-Forwarded-Encrypted: i=1; AJvYcCV0DcYv34PQn6Xuzs3BcFuKru1dXuJggd7MFVU/Ngn20fVgX/xb/8dwEdA5EvSlOil2FNTmBP86W7Q43w==@linaro.org
X-Gm-Message-State: AOJu0Yyhy06DMLHpk/lzvzda8bWyjNeZnyhwheAdT8bMqQ/V7x7SZeyB
	md0rBubnMBbhtV8f2w9tQjLNFwi0WJQEsJHQolimWP/4urZEkMwOaIKCnnSQ+3KpZV9cadkoH8+
	HaRo=
X-Gm-Gg: ASbGncuPGoeYJLLv7MxMxlxeFlw2i/o39qFVV975IyJ0r1UGmtMIAg9qTXza2yfU7U3
	dGUfxFRKUJUVK3UlzhSqGuu4YFB5dS97E6LjKQhgv1YZgmfC4x26othjD5gf5RVaCNI+R4fRg4+
	/varbUXMLg5Y2P/JwS9EhYutQyMbrl5ViDDQIBDAsHlH9uSuYfjECoIpywyZn/TYPDPh7VGVlXv
	HpXmHLw1XP6EmbO3NcRcHl2JXI0k5JlUpxdVcl0/zVkyCDIi6gxd42G2zVU/DH0mTj7jHE7fVw3
	KWn7pLbS8po8LaxpiF+kNpg08LP4YGkpIxCqeZPPm+DZnpaT8SX92Lq619CZdCbPnSIOPSTkXOL
	pYWwsG05b2R1fw8UnakFPWU6e
X-Google-Smtp-Source: AGHT+IHULMFoU9I6lSJs4fhIrGNL405naq7zzUhGfdPr8FgjDMFs3ympFUW5t1hQ2vzvZdeZXgAcFA==
X-Received: by 2002:a05:600c:4ec6:b0:43d:fa59:a685 with SMTP id 5b1f17b1804b1-43ed0db4025mr38379115e9.33.1743806129342;
        Fri, 04 Apr 2025 15:35:29 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b76f2sm5404476f8f.53.2025.04.04.15.35.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Apr 2025 15:35:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 1/9] target/arm: Remove uses of TARGET_AARCH64 in arch_dump.c
Date: Sat,  5 Apr 2025 00:35:13 +0200
Message-ID: <20250404223521.38781-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250404223521.38781-1-philmd@linaro.org>
References: <20250404223521.38781-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0I39CykAwm3w

It is safe to remove TARGET_AARCH64 #ifdef'ry for code
guarded by runtime check on aa64_sve ISA feature, which
is only available for Aarch64 CPUs.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
2.47.1
