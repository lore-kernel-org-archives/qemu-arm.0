Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp1287685lfk;
        Wed, 9 Feb 2022 20:04:41 -0800 (PST)
X-Received: by 2002:a17:90a:7f81:: with SMTP id m1mr716431pjl.157.1644465881741;
        Wed, 09 Feb 2022 20:04:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644465881; cv=none;
        d=google.com; s=arc-20160816;
        b=yAgH9uYdqLz8i6daj7bSGxyhVDHzL7eNrX4xkVaDPGnwrwSt7pkhBez3/RwmfJaEY4
         GNruUCnYDOvI4pJfWh4mzrq07oMMXnQ+ZErBFQCxM3l8CGnEW54SNI/KFd+aU0mtEjsY
         GGSQsw2wGmrKF8hVBrMXE0V9bLTGyxpMKMG6wUzSgiDP2hiuQrmiuQiuxuV9MSPOr4zY
         5HFgohdo9W+g53zqwFkULER5CkbXfYZ5uRjOnFzjRtB54I7UEz1wL+88YpaOake25bmx
         9e5o9k14EQfyT0ycRdpmF1auwNQUjoz9qeO3DSj+xWKbYf/R+CzfpJO5tJrEjpZ0axjZ
         rW/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=M9yoHlP5X1aUjQ5+XqVVCuvodgZ7D3QrARDveNRnzPE=;
        b=LSS3dp+KZNcA4MdJHiHchP4QCCr/YUYk9KkLkmi5uwAqaojISqpUlOV9wlL5Ddcnq5
         TxR4zbQ5F4qEY/HUHBcIqn/FclD8TmUu/iokS3bizNU4MXCsnZclOzThy9rJ2zeFBQWb
         FdJ6zdCD5pah1obzmlCJRl3rUukhtZQRnN0keTVju6NCJsktStJDIJsHDp/ha1gjnwt1
         iqbVpYilgg/zpUPNtK8RwisrcfYa4diIekmdn25avGuTskxXvNHCIGcKvOOwZnwCEwuY
         6NPCN5lzQKqJV6blu1BLSllz4GjdwD0yk9Ecgx9zh6beEJ98/yrB3jeVKobWkCCpeeVn
         R3og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vf+owxys;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n50sor1269352pfv.10.2022.02.09.20.04.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Feb 2022 20:04:41 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vf+owxys;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M9yoHlP5X1aUjQ5+XqVVCuvodgZ7D3QrARDveNRnzPE=;
        b=vf+owxysXq1AM8pznsPiJhfGf5bzg13BCYLoIW72rwX1LVmWb6NA8lfNEOVK8S8LfU
         hBq4Q6BEi+wzv+dYGJ+gAnYw12glXMpkRhrp/W4BqQllWoCzgj29AyU0H/ShS0OKJ9La
         d+2hqdHAwFq4bIqK6jeKpW5ZYOMsaOzPEVm8oIQpjF1i40DNInxKTxnIr4IJsxjB1von
         vCNJwPdHfU/AFWfF/ufjNOE1ps18kLYH99FY6YOnTFrHieAxoapVux2nHeehYem5GmG9
         FYCChhUaHgRniVdzSp6AN5zuntC91PBvEWDp9UkdhIyyynPmXuLau562rN9thkPi+CGe
         UUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M9yoHlP5X1aUjQ5+XqVVCuvodgZ7D3QrARDveNRnzPE=;
        b=XU+0b3pQnoxDM8zgvL9zhfSsdlXrlLXV0ZUqQkRkpges8iKVOqcYqVrz30nTgb/+V6
         YRtYMR/D7eMwCLR3JHE26UJwklHWqpSAC33LvInHzwQ8NMCWWMkN71Oqs4CcL6kjC6mA
         x9sMLNiF5XoMlhwo0jL0Wk/zMd8E3QIXt+/iEIET/zvmkncxuDUXn7y/D6HoXGIYhdwW
         UqsOb/nEm1rzcUsWABBHk4brJzifCIRbMle3XGJoebS+jxRuhx4ILIEz2y6pLk00iuoZ
         wOhomqD+iuxHSBYSxWzV+6AiTmfea4zDlDvuxUUFwdjHH4zG8ArBMOJZFZncEiqys956
         rICg==
X-Gm-Message-State: AOAM531XcNOeb6PNs8iJQf++6dAWWC1bGIKJzZ6a/fB5JexmxmHUbiYk
	9b271e6ioYj6I13NeGlOqEZFC2Jp3jFwYk6oJWw=
X-Google-Smtp-Source: ABdhPJxwuJRTtkamHJ5ua8gbfdP8Ie6ONFkd9QPWjTYg24XnoQwfY1gtqxwHZwRIfQeCeMIEV2ZtFg==
X-Received: by 2002:a05:6a00:98e:: with SMTP id u14mr5590601pfg.12.1644465881227;
        Wed, 09 Feb 2022 20:04:41 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain ([124.189.222.164])
        by smtp.gmail.com with ESMTPSA id y4sm9749814pgp.5.2022.02.09.20.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 20:04:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 03/15] target/arm: Fault on invalid TCR_ELx.TxSZ
Date: Thu, 10 Feb 2022 15:04:11 +1100
Message-Id: <20220210040423.95120-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210040423.95120-1-richard.henderson@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bFr+/RPDCcGh

Without FEAT_LVA, the behaviour of programming an invalid value
is IMPLEMENTATION DEFINED.  With FEAT_LVA, programming an invalid
minimum value requires a Translation fault.

It is most self-consistent to choose to generate the fault always.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Continue to bound in aa64_va_parameters, so that PAuth gets
    something it can use, but provide a flag for get_phys_addr_lpae
    to raise a fault.
---
 target/arm/internals.h |  1 +
 target/arm/helper.c    | 32 ++++++++++++++++++++++++++++----
 2 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 3f05748ea4..ef6c25d8cb 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1055,6 +1055,7 @@ typedef struct ARMVAParameters {
     bool hpd        : 1;
     bool using16k   : 1;
     bool using64k   : 1;
+    bool tsz_oob    : 1;  /* tsz has been clamped to legal range */
 } ARMVAParameters;
 
 ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b5f80988c9..14cc866d8d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11188,8 +11188,8 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
                                    ARMMMUIdx mmu_idx, bool data)
 {
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    bool epd, hpd, using16k, using64k;
-    int select, tsz, tbi, max_tsz;
+    bool epd, hpd, using16k, using64k, tsz_oob;
+    int select, tsz, tbi, max_tsz, min_tsz;
 
     if (!regime_has_2_ranges(mmu_idx)) {
         select = 0;
@@ -11230,9 +11230,17 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
     } else {
         max_tsz = 39;
     }
+    min_tsz = 16;  /* TODO: ARMv8.2-LVA  */
 
-    tsz = MIN(tsz, max_tsz);
-    tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
+    if (tsz > max_tsz) {
+        tsz = max_tsz;
+        tsz_oob = true;
+    } else if (tsz < min_tsz) {
+        tsz = min_tsz;
+        tsz_oob = true;
+    } else {
+        tsz_oob = false;
+    }
 
     /* Present TBI as a composite with TBID.  */
     tbi = aa64_va_parameter_tbi(tcr, mmu_idx);
@@ -11249,6 +11257,7 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
         .hpd = hpd,
         .using16k = using16k,
         .using64k = using64k,
+        .tsz_oob = tsz_oob,
     };
 }
 
@@ -11372,6 +11381,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
+
+        /*
+         * If TxSZ is programmed to a value larger than the maximum,
+         * or smaller than the effective minimum, it is IMPLEMENTATION
+         * DEFINED whether we behave as if the field were programmed
+         * within bounds, or if a level 0 Translation fault is generated.
+         *
+         * With FEAT_LVA, fault on less than minimum becomes required,
+         * so our choice is to always raise the fault.
+         */
+        if (param.tsz_oob) {
+            fault_type = ARMFault_Translation;
+            goto do_fault;
+        }
+
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
     } else {
-- 
2.25.1
