Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979499ejc;
        Mon, 22 Aug 2022 08:27:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad1:b0:530:2cb7:84e2 with SMTP id c17-20020a056a000ad100b005302cb784e2mr21323264pfl.18.1661182076067;
        Mon, 22 Aug 2022 08:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182076; cv=none;
        d=google.com; s=arc-20160816;
        b=0j8eOB8QNfcTqsj6cx+5nv3ChH9zQ5lDHs7HeYaECTXkqN5WlffrTyy1KSqyCgre8v
         lipoBviGLTx8bZzp8OdqQDdXebsf7iPsfIqG0/CT5CqyMQrej2Uf4xsTOpqp/DTtDF9c
         BIwsA1A2E7geg1FKmpWi3RRTm828pKZ/rHstrcdt4XHiPgVPgTuJ3YINdKvgy06ENTWx
         QtQQp45mFHq11toriSJgmEwzJHCYJWetXTWW2YuJ/Xf0SBcedBUe8Z6k89g264jtgq8J
         ZfxER87dXZ09onyRpzueBS+ZYccFzCaiusgb66kk490UYgNVe8T2h+3hplII0pzbwv7a
         OejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qgb+9tm2qJZiaV7ObM3Kp5VKd2kY2geHHlay7myc1Lo=;
        b=MRbA/+5jC9fezp20DrFIY0tQPXjz3ZIre3+99F2cSRI4KmRR8TunTZLNVkfZaRL+Pr
         iBioXAMD4JaYlQ+1TrehCNrcbCFDU304wFDhUNJm/n510Is0c/7mH2JqG5Qw4e0jAO+z
         aqyDy7gYsvjQX6cT+wcYbr1HbN2UsZEKVSz0SE45E1+vg9xRtw2CKHq+SlTiFfhXn+JL
         cxiuiG7XyVapGFbQx2TgTVKCGfQz/GreYg0xV/C9lOSx0vQwu8V3w/iHrfT+/umEpPYq
         bWo2GhnxSjKUv8YrGyQ1iLy2MLmy9nr2ML2Yf2TdddanmtXz080tAnoCVF/Pt50YsylV
         u1yw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BdvkrmNK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j9-20020a170902758900b0016c23c2c97dsor4988551pll.164.2022.08.22.08.27.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BdvkrmNK;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Qgb+9tm2qJZiaV7ObM3Kp5VKd2kY2geHHlay7myc1Lo=;
        b=BdvkrmNKjWAL38fOCA7Viz1NU1Sb7U8NKOCigP2Gyk36OKdgBFtpy9t6gRnuNW/qc8
         RH+n4pZ2V7FjcypVfW0nKZihdHsxWOROIuO4m++AnbdeUMfQmaMqIyXxxEPv5UgB3j1j
         DZ0wi0qew4G5h2dTRix9/Yzyf6hsJktfUST//ImTGxW39GXgSC7jpsDqPRwp5kFHfxx9
         zzqngs2qlxKvPwPsAwVQpTYilbsP/a87N20y9h/rtzACxxhDlRqL3Ev8zGgiCYMSh7kc
         cO/stD4UsXs6mMGvpWI16Li4wwQQ3KeTLQpTTTTjWz3MJsXb+F7eREdvW50H/RdsXaXi
         AXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Qgb+9tm2qJZiaV7ObM3Kp5VKd2kY2geHHlay7myc1Lo=;
        b=O5qs1Vw4sg3fxGuwDPUXPnurPjMNlILJaweYUV8xZcyq7lTKXZHG5503mIcjMQrQeT
         MhKTFu+tvVYHf90vcGZpj++7zHHLYi0msSdl47geqJotecxzSIIhth3rshx1+GJ3EQDz
         hb5tsPxYLR0UEjLAMeJMg30TcXqJlA72R2zioSNPXk+jTL+XsyuqOgZCKgeqDvPjM9ac
         jwr054ovlfdNEsXtosQfGZbBss7bAEait9VwrlpawMB7N34AF9+lGk97PAnYfGPt1NXa
         4YPekev03Sw9VG6R2FNhQRXjOFWnI8Gcj4QXOpxLq6wliQxaUm73Aai+QwR5Zmz2s8V1
         lmcQ==
X-Gm-Message-State: ACgBeo0aMS1yRzlBN8/Rp+U+0dLD+fSKSXdA0EKECRTcsTwLQXRUTm5E
	SWXmt9i8qFOPi0jQybqEwJN5jlHg
X-Google-Smtp-Source: AA6agR4y7ReE142bo2B0kRh7NisiOz5vdlIjbs0jR4ioUMfi4XDMAvtBhPSoGz2hlI8a9jhXjNlW0w==
X-Received: by 2002:a17:902:d714:b0:170:c27c:d4a with SMTP id w20-20020a170902d71400b00170c27c0d4amr20347705ply.18.1661182075611;
        Mon, 22 Aug 2022 08:27:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 16/66] target/arm: Add is_secure parameter to pmsav7_use_background_region
Date: Mon, 22 Aug 2022 08:26:51 -0700
Message-Id: <20220822152741.1617527-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rMMM6ApL7fWt

Remove the use of regime_is_secure from pmsav7_use_background_region,
using the new parameter instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index fccac2d71f..b7911e88c1 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1489,7 +1489,7 @@ static bool m_is_system_region(CPUARMState *env, uint32_t address)
 }
 
 static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
-                                         bool is_user)
+                                         bool is_secure, bool is_user)
 {
     /*
      * Return true if we should use the default memory map as a
@@ -1502,8 +1502,7 @@ static bool pmsav7_use_background_region(ARMCPU *cpu, ARMMMUIdx mmu_idx,
     }
 
     if (arm_feature(env, ARM_FEATURE_M)) {
-        return env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)]
-            & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
+        return env->v7m.mpu_ctrl[is_secure] & R_V7M_MPU_CTRL_PRIVDEFENA_MASK;
     } else {
         return regime_sctlr(env, mmu_idx) & SCTLR_BR;
     }
@@ -1516,6 +1515,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
 {
     ARMCPU *cpu = env_archcpu(env);
     int n;
+    bool secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
     result->phys = address;
@@ -1618,7 +1618,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
         }
 
         if (n == -1) { /* no hits */
-            if (!pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+            if (!pmsav7_use_background_region(cpu, mmu_idx, secure, is_user)) {
                 /* background fault */
                 fi->type = ARMFault_Background;
                 return true;
@@ -1738,7 +1738,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
     } else if (m_is_ppb_region(env, address)) {
         hit = true;
     } else {
-        if (pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+        if (pmsav7_use_background_region(cpu, mmu_idx, secure, is_user)) {
             hit = true;
         }
 
-- 
2.34.1
