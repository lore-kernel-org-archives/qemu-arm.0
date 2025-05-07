Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp94361njb;
        Wed, 7 May 2025 16:43:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqdp/I5cvl7t4HftTjtwwlpgfvdHsb9OgXs7HKIVUJ5GdVG9lYXLVFGaElceHZyXa/6D5ntlGwl93+/w==@linaro.org
X-Received: by 2002:a17:902:da83:b0:224:162:a3e0 with SMTP id d9443c01a7336-22e8a7fe967mr17732485ad.49.1746661383026;
        Wed, 07 May 2025 16:43:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746661383; cv=none;
        d=google.com; s=arc-20240605;
        b=cPHsP4PJUF/jhG1QTvjkUbkKeM+vMST1Tb+M+czbSyGMcJo4O11sjaPhU+CSPsnZdK
         IJP3yHEydSof9XDChZauIHbLiqkg5XvRwkdyuSqm7YtLE1qAnu5tnrKigd975Dk0elLn
         pZDziOJwmHpSvc8MmkBFY+0WmzE1DsoZ2yRIZJz7VcvNzUzgetTcTCWCuvsp/4OVqPI5
         qQGZgWunfgHJArnnxrXLvSVYG/tCajbd6ONZ9W6zmuVPCBLrrXglwcL09efoXNkMG82B
         FEzuPjYgzO4HPeHwf/9Z0GkErLnEAEYmR/WxPYEHm21RkxD0xyAQ1q74kmiOM+It+Tgl
         xxUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6DV+2RAAVd7Czk8H7PoRnAo43qLQObnu+pSnMRVopks=;
        fh=qgAX8t+iB8Qy6vIPq0S3kWJdXWyNhDKfpWLRKQya4IU=;
        b=PDbDnH0aQX+nzX4DtCAqU8VlwqVYv46G7gveEv1ABZkHuN4E3Yp0YDolJ9WAJ5NZ8d
         MSAlKW4Gx7MqCBaaByRIamfBOjbgRLHY3mCDJMg61DrcNWNJDatfZa6wE0i2eo/Zn2JR
         gaoUVagfRO5qV0XhtC43lou6d2uLbyrFYihwKN8tl6FVhPSS1FbCPlZqKPQ8/x4umBX6
         n/ZmWgEUrbPr2G8Rwe2/6tQLtsinG96Pcg5R12wXJmSo9n4grr6/9qCrHuBH/QV+/U3y
         7Nd257MmUM6Y3n93ErhmOFuetzqbSqb2C5HFUGfix96zRq/9WqYDewm2357gtdRZphuk
         co9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t5QHFZNG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bc89e05sor90728895ad.11.2025.05.07.16.43.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 07 May 2025 16:43:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t5QHFZNG;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746661382; x=1747266182; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DV+2RAAVd7Czk8H7PoRnAo43qLQObnu+pSnMRVopks=;
        b=t5QHFZNGPv/9Eo0fyJfYpeGsNoJXbI3tDLIuOnpS+35d52D2/me+NU/ijHGYIIZjhU
         i9kXk3/7HzBOYrVfn2BM77i35QLRvo4jzTqSW70TZB3qFVU5ZloBew0QIU9m+xH/XW0C
         Onot7qtDcPIN+VEMBZ9au56GhwT3ujaXAeMr+ktQM53Jrhi/vAEH7dCxuSxdlEhnL+sw
         I14X95AfW4+5zcEOE4jWBlKUB6G6FrNEBk2uvwmUQMii9wBx4im/pxabhIIZkK8B2pDX
         RopDcR94nqDIxxLJtBENkgBRY6XmJmA0EClyE6HExJ66o/wdpEu9DJivC3MqZT2FWqYM
         PQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661382; x=1747266182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DV+2RAAVd7Czk8H7PoRnAo43qLQObnu+pSnMRVopks=;
        b=NzQKivxkrhJAgGjZIy9M2mQH+tqspIGAMhQ8NfihjXUlcuxAESzr08otb+u4usdr69
         TXpRQXX9xU205YATNFiYZErWlDb+wgdHWK8WUXA59ZolL2M4RrKAf+WS0vwwWDUIUqfL
         en6gwMDX0//laSVMCXjzOgCht7PRxDzx8It5Bk6cbnHmbOtAJur2rDpO8MSxQHjgzq18
         QITKGAiBT34ORcV+f1aihmK6ebtxd+FRREjqlFJcp99nJ78fdpGlyJtCk5n2n5FwJL0l
         kVCcTO02OZFqyaBbnVnhA/vJN8yCSuZzgYZIIW9vfrtMhY0cDgFkwyp1xqOPxuTNiFFF
         NL/w==
X-Forwarded-Encrypted: i=1; AJvYcCUUaOklHVk82afJrP5IYa/to/eYTCchL2VotDgcKqVtmRQe7TxPlFB526tIbnTPe4lgtvRvd/iN6QElww==@linaro.org
X-Gm-Message-State: AOJu0YyhD+NNSaeXgDcA1AaHHVnR5yzR8XMgjQ4KJarahA3mjjz6jIHa
	d6UQ3xolKlPnydfLzz33i62EkCKDf4Houf4O06WrkvOFhwkWEn47drUKZb0GTftf2g==
X-Gm-Gg: ASbGncvczPmjjoyfPl5zDMLCgucvdVLgFUZ0ERdhgbdsnLeKQzZErA6RCfbvVtgcNIz
	fEgWMYCgAQZwGf8PrAPcwuaLKge9AYC89hdfhtMgywSASOx94KD+9eXlm+1gZ49B5+RTgBpFFUy
	EVgLqbzjfKDjj4RsLekzJGE3lFKr+sOiVtDq2W8X5GQzT0m5cdjri7X2Z4y0jrbw6mOVzGlu5gp
	swuEDMSmieanOlLGnu4XOWmV4SsPA+yorAT6oGtk5nwwQ20xG6HsgFZ5E9k2z7/2BrghQEy/SW0
	G8Q7HDoSREosRQkcSn81cvjejysUq18l1MzJ5AgH
X-Google-Smtp-Source: AGHT+IEFUNK62tE1si4fuK2RKKlN0gVISYH36IdERyQZ1SgpJ1N+YZe4RJbDf6/SEw8jryGADSirZg==
X-Received: by 2002:a17:902:ce86:b0:22e:4203:9f33 with SMTP id d9443c01a7336-22e865f7573mr16624385ad.33.1746661382643;
        Wed, 07 May 2025 16:43:02 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e815806fdsm6491325ad.17.2025.05.07.16.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:43:02 -0700 (PDT)
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
Subject: [PATCH v7 22/49] target/arm/helper: expose aarch64 cpu registration
Date: Wed,  7 May 2025 16:42:13 -0700
Message-ID: <20250507234241.957746-23-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
References: <20250507234241.957746-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3n/baDTnBjma

associated define_arm_cp_regs are guarded by
"cpu_isar_feature(aa64_*)", so it's safe to expose that code for arm
target (32 bit).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/helper.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2e57fa80b08..18ac8192331 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6590,7 +6590,6 @@ static const ARMCPRegInfo zcr_reginfo[] = {
       .writefn = zcr_write, .raw_writefn = raw_write },
 };
 
-#ifdef TARGET_AARCH64
 static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
                                     bool isread)
 {
@@ -6824,7 +6823,6 @@ static const ARMCPRegInfo nmi_reginfo[] = {
       .writefn = aa64_allint_write, .readfn = aa64_allint_read,
       .resetfn = arm_cp_reset_ignore },
 };
-#endif /* TARGET_AARCH64 */
 
 static void define_pmu_regs(ARMCPU *cpu)
 {
@@ -7016,7 +7014,6 @@ static const ARMCPRegInfo lor_reginfo[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
-#ifdef TARGET_AARCH64
 static CPAccessResult access_pauth(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
@@ -7509,8 +7506,6 @@ static const ARMCPRegInfo nv2_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.vncr_el2) },
 };
 
-#endif /* TARGET_AARCH64 */
-
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
                                      bool isread)
 {
@@ -8951,7 +8946,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         define_one_arm_cp_reg(cpu, &hcrx_el2_reginfo);
     }
 
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_sme, cpu)) {
         define_arm_cp_regs(cpu, sme_reginfo);
     }
@@ -9012,7 +9006,6 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     if (cpu_isar_feature(aa64_nmi, cpu)) {
         define_arm_cp_regs(cpu, nmi_reginfo);
     }
-#endif
 
     if (cpu_isar_feature(any_predinv, cpu)) {
         define_arm_cp_regs(cpu, predinv_reginfo);
-- 
2.47.2
