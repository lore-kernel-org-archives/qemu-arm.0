Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2778285njj;
        Mon, 5 May 2025 16:20:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjKEZM0Va5BQIsO8OILT9lwhNY41asbeqy1GUdkw78EVoU64JFoajQOurr/Da1o/TKZJGAEt8bBo/ZIw==@linaro.org
X-Received: by 2002:a17:902:fc8d:b0:224:1074:638e with SMTP id d9443c01a7336-22e1eb0aa26mr131805175ad.52.1746487241361;
        Mon, 05 May 2025 16:20:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746487241; cv=none;
        d=google.com; s=arc-20240605;
        b=VcKRGJw0xiGOEbSAoVI1sBvD6r45iRnQ9/rOIBo+Jawdtf3Zp1DPLgEERTEUSj9kF9
         IghA0+qeb5lg6KSCzG7gHx9JcsAbQlzrd6FHlDL9UxmPQu+z3W2WL9fGNdE32QsqcMVx
         9BSnV0UfgiXpNvBhTjNhehAPXBfNci9+paes8EJ2P4tMr9Nb5Q571sbEzjkfJBPRjakk
         tk8UYJBlvld0Zw74WC2sVGCzTUXx10lVHQQpuCWt6oKRNn3/2C04trvKOF7zzhRWMB8b
         V5LrH0L+mzTsMsjGkoX31z/NHRyUbb/rFTwg39b43e2NakvDI9wTCGI76y3JMK84wFPZ
         /jiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=p8C01O7GU6PtK/NYVapVL2wa5t0zjMaLo72cjg41Wlg=;
        fh=L4uaWO0QsNoM7eRfihNuxMfXjlX27KEJ2ym7e4qjuP0=;
        b=gkJvlSz+TeKqyxfSTY/MoUBL/qs6SjENs1i9xqnPwPj6roUgwanmnnuwvULkKSPwqg
         Zmgxc7BHrAKVwqNqrDTPTMvx9ilrlke2xSFzLvFVIrdtP8hGhD9+cSxLTpBPBrKu+ccm
         U75RffQkI9gVy7qKtS1ONSxCR5PjCXkvpEUzhg9pNxbECUUWX1r7EryjGrIzIsrxqDi9
         orgrzDZWHdnv6Fq2eshUFY9DdtLCtFo/IzTSbXB4IxmG5EwqELRKg292iiozTxg+sdDS
         Y+ig2xlZEa+6tqLmYR9/QopB1iNBxR2xQ19Sk04BRd1Nx1h+EW/jtTQrpmX45fuG5fGL
         5G0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A9YfVg9S;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0be7c3f3sor83360505ad.12.2025.05.05.16.20.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 16:20:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A9YfVg9S;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746487241; x=1747092041; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8C01O7GU6PtK/NYVapVL2wa5t0zjMaLo72cjg41Wlg=;
        b=A9YfVg9SyOw92kva1AYc2vi7xK9HNK2B4IX0PxYnDxz/sIbc3e+FWCve2wdrAHztP4
         4M+GJSNp00S4OrkY6WYkh2bacHkHYoAb8WkARePCb6vlgW2nMjZpxxqPbO2rASm4eBrt
         rmlOSSIQxtO9HlRoSyuPP9CEXdMREdF+ItCoMeiqsGrRmVikbSMa/1z9MfOp+T0vaUga
         ATgZQRdeZlyEJNdzRY5Nky5kE6NhHEXLdXQ75b1442bAVbEkgGD2n6PRZENqMPMtExdU
         hZKhKok0IDwRhdJ00CKNjfvbdvUO0hNWYavP3UCJRYZgBMObeD1TwnW1RrIrbMDepq0F
         M42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746487241; x=1747092041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8C01O7GU6PtK/NYVapVL2wa5t0zjMaLo72cjg41Wlg=;
        b=ILpAuLLWQJ708u6sr7fIg5OL2FAx5eYN+tu1v+zJ40qXkrcakyhM395HOccwpAsdEp
         buo5KHboobr4TOUvHewdWBafQsppI2IKgQ/nFABPfhtdV3uB0Ru3lb2FIxluV0KUHJfW
         7pxLMbKNqdf0kySPboON9EBtB//Bfk0JTpzQgKvjXqBrhldd0TTCYeJUWoDplJQAjjsM
         hVlF5kr5qkK+/+jEi1cRxyXDDM4WNKWxS/jj100xaCYacMU2Kk6onpDlCk3/4VP3hIyw
         vqCR0yLQGoWqN24PA2Elghmjh1/9JyQtXJAGSVLt05h7HEttjLDp3FeHJHOL/fqXvpQa
         caJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgiWfXsJz8BAH69blAilNybXTnTJS/nyq6TSJuHP8lZ4ub3Ah/xKnTTwuyJLYYItnvPGhNImngdRM1PQ==@linaro.org
X-Gm-Message-State: AOJu0YyR2/y5T+oDV4HxRh8jbZaJwcD2GP+Fekciuev9cF3Yfa8EvBdl
	r0KejJn9tTuj89WuTiOZi542fs+OfvLmMauaJwhLzPcuD7czTHZyaED7LmG4QnuJFA==
X-Gm-Gg: ASbGncvhabKkVmR7vASFOdoeAzpvRfxV63zGJi4S4sSEx5FhMvftUv0SPuKoyKmJIM8
	5f24xZvXyKKxedxB+ZPVemZJPIMtCJhch6tj5Ilh5dYaPqn0KewzHHOdqfQ4ti2E71kN3dac1pw
	OR7hTm5usAqy9iqbZYngkOTj/UnvfXLWQVvyUsCc9j3XkqB1KeG7pmGiaREfpJHz/UUeJ6w3kBx
	IJDY9IrVXqVupRqAPzjNxatJsiCCkfJpTJWVAyZI1u3Z70WapVXlB/OVM+5jgBEYEuUynwy9V5x
	47ECYQ7/9ydWy5sSYuS83smAA/1bw/EQZ0g8+7aIo1auPUbZ2Fs=
X-Google-Smtp-Source: AGHT+IEpYzPq9ezMy4I+jEKbu52ggydOFGVSukSx9xmYEV4nOTZH+rYgC1fwP4d94dqdVjUQVDDRYQ==
X-Received: by 2002:a17:90b:2dc1:b0:2f6:be57:49d2 with SMTP id 98e67ed59e1d1-30a619b0dabmr16714791a91.17.1746487241023;
        Mon, 05 May 2025 16:20:41 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522917asm60981715ad.201.2025.05.05.16.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 16:20:40 -0700 (PDT)
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
Subject: [PATCH v6 23/50] target/arm/helper: expose aarch64 cpu registration
Date: Mon,  5 May 2025 16:19:48 -0700
Message-ID: <20250505232015.130990-24-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pj2dNJGQWhf5

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
index 7daf44e199d..7e07ed04a5b 100644
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
