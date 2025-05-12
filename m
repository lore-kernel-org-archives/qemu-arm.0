Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp42776njb;
        Mon, 12 May 2025 11:05:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgqioX7/5clHIWjUrxaklgFZNweiFLsJri5y3AcoIWYv3dV5nAndd/qUNtCBASy34fvWub+DNzLBSOuA==@linaro.org
X-Received: by 2002:a17:902:e84d:b0:224:283f:a9ef with SMTP id d9443c01a7336-22fc8b10574mr187113685ad.6.1747073131205;
        Mon, 12 May 2025 11:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747073131; cv=none;
        d=google.com; s=arc-20240605;
        b=lPH7PNDmpHDDKyb/dArsI0viHbmasS5yIJUkiEo3A1SfHU177rJ23R9LXBDI72mu8Z
         VCLqmOnX0s8IbhK/nwGBTpXBn33V15xy2/h/lAD7o7iUdBji2cLKHfn9aFEnlx4Wp0RF
         G6l5tWFnag05xPF3A13EsB8AXTe2tqqk0Luic4FIJ/1SarxM5ESk/IOJ2VMCBWuziRNo
         GWSXZkSNgtpXSLcHc4xQTOI+YwPS6XjlYEAl8HaZo4OwcI1AG9WebqEzDNcQeKUyjWcK
         rBGimKWgp55rysNKP6Rko4P9C1xIw5oEzwLhsQaEO7EHBPOgRD5otAOdfpaHy/vzyc9o
         WrvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ynPpe+7xoYBYdred6SBN6w9Y0IgzDdC2ZAA3L0jAu5s=;
        fh=Xves2C1qzP0VvFM8tpGiJSWXqh4+WuhOgHGjlRvQ4ns=;
        b=TfP2cVSXplgyFzzZtNpUZCZoPGlzCYlwMPF2mdXjYwwAnl0XaUZB7gAaT4vgPVXzQl
         t8aVoXP25E4SOoriFNAGYzA9jPCc6XG2KZoTyu+I7gi5niYZaoIwdbVrrc3nj7/TwR/S
         3abTbQ6lMCVkizReNrGR1ZXo47pELSxOiEQ/BbClpKRDooVgdqE/TGK3eVo+/kPfCrMI
         CQYygmZ9RyWejNZwOcA3knFuyNRaUJg1uvM40oJyckwPqVGzQgzZgNNjDr0tnmyOZuf9
         mQhJ5DsZsbjdEGWogLyaZKjy3GbbwBbHIFaIgHK+B3CxT5BjhhHDNRfJ4ZjhyYyCrdhu
         ELhg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n0QH2+HA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22fc6f311easor62275775ad.17.2025.05.12.11.05.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 12 May 2025 11:05:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n0QH2+HA;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747073131; x=1747677931; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynPpe+7xoYBYdred6SBN6w9Y0IgzDdC2ZAA3L0jAu5s=;
        b=n0QH2+HAop8vVXvm7seoH9krIf+H32wBCISlFqcgQJpfKN7wOJXFR41AIBgztLQfNQ
         +BkFfePxIMGnT0Vg4ou87rxO7/S+9WD/3BcYyzvYAU1VlgVgXujwHzEEHnE1if5W+Rdh
         Mxbvb0kWqNwGXHZyAc0s/X0mQdtwIU0kpMjhrS500UTgrGslRxbbGcj0agwv7ZuGSXEQ
         hzzRZbW34M0wjegLhQaTMzUJuoyMvqU+phKeq32suinudTl+tCMRaT+k/W+SdAew+XHT
         FzNtg3ZR1W7nrfb/G7J253kKy8nak6caOFJPWi7DjeJbk+jv72Q0dG8GO5iTlMgwgKB1
         BjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073131; x=1747677931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynPpe+7xoYBYdred6SBN6w9Y0IgzDdC2ZAA3L0jAu5s=;
        b=ohJfpvJqtjHNO4A4X9puR24mWn0s0B3t543rioYG9OF3w+Ykxu+TalrcGRK/xPyxG0
         5EBuhxXZNL8EwRbRGCfsmWXJgnBzy2oVjF+DwygGmmHS5NWLedT8PO4pdhf0sDnglcpp
         51MxznbijZmEaIIY6BUPsGYRxnhvqX818Jqr9q/4eaw6KyM+OiOlQLrwjoS7nnSaXZHV
         RIWHDGximehLMONE7GZU8PQ7FCQN6zSXBmrcY36WmD9w3Dnh/0pspHOIKZ66Ok/6bem8
         +08DVGhPwBd7Xc83dcyw5frbxQ6AAjcrrQWbEhaGdCez20U6FFq7lFGc2ZYtakM0+uHB
         7P+A==
X-Forwarded-Encrypted: i=1; AJvYcCWAsy9XVB6pF/5x/JHwqZO++BLt49aX2tYnvDBYiqEMeVJ9YzBD1aLTeyn95WPJ+7aMVJPC4pUm+bvY5Q==@linaro.org
X-Gm-Message-State: AOJu0YwVlFIoQYcoB2BY1CQaq+b0LrhoHY2vI302/HtLtTThhaV51+7L
	+vLRSy6Kt1U3P4cTqh2jlW8w5YHn746tc4GdlD5zlVG3wizrb3ZekdNDglDE4qti0A==
X-Gm-Gg: ASbGncsn7lpOxtS/j0Je2pid6Bpef4J+6pPAvABQam2fqjzai/5sFKTKUHfmFuFMMdI
	+IBnyKE3IEORKOXP1y21wLNHU+QEYrig288skk9zg9g6P2gknmmz6S5J6w6W5K3IrSUC6zlnSWv
	USFEssum+CAOSNyZBWev+pCo0SGyCHcKmNtjF3QNtCe4oSCP1zvay856B1lLL+9Kv5TgzgurZj7
	ynYet6BtPqwcibvqas2Ufn7NBZs8HVoYPODKWlzTn0xIg0jcuBbVI9EDnXce/QUptao+0mGLy+K
	zlLs2mBkeX90W7ojpvGZ1xr1kqgvOuX6Z9OyZWa4zIXYowTbo6zLaLowTCkIiQ==
X-Google-Smtp-Source: AGHT+IHOIsMsSo9l7r0BSna7qr5cjMQFR4caBJLTeNrnfl8hHoLW5O8u+UyBnmKRl9wmyrnYPFvZiw==
X-Received: by 2002:a17:903:41c7:b0:220:be86:a421 with SMTP id d9443c01a7336-22fc9185f46mr214714525ad.38.1747073130756;
        Mon, 12 May 2025 11:05:30 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a2e4fsm65792005ad.232.2025.05.12.11.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:05:30 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	kvm@vger.kernel.org,
	alex.bennee@linaro.org,
	anjo@rev.ng,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v8 21/48] target/arm/helper: expose aarch64 cpu registration
Date: Mon, 12 May 2025 11:04:35 -0700
Message-ID: <20250512180502.2395029-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
References: <20250512180502.2395029-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LmNqeo83XBx7

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
index d2607107eb9..92a975bbf78 100644
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
