Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp458943ocs;
        Sat, 1 Oct 2022 09:23:33 -0700 (PDT)
X-Received: by 2002:a05:622a:412:b0:35d:5770:a5ef with SMTP id n18-20020a05622a041200b0035d5770a5efmr11102617qtx.25.1664641413129;
        Sat, 01 Oct 2022 09:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664641413; cv=none;
        d=google.com; s=arc-20160816;
        b=klcCqvALswAX5662qi4yCHfH3kFdPqxDSKi7uwyo9pmHtzXm7CFVULhWX3mPWkvgYu
         9psxSGl/AU64zWZld2YCC1fiqkFFdoHQa9Ycw2lkSdm8WQERM3rTpgZ1vmB3Pjs18axH
         AnF++648e9j/ELcgG5exXZNsk11faTP/XJvWshzZkt8Fu9wyily+FdWyqQkwYofXLLoL
         4Y40j4fAxKNGUMKGjcrkyxAmnbUKjd+kvAqaxn8yHALmqKO4HoMYbV1JnyXe8OQW7XWC
         2d+Qc5dQHPTpjBa79Vov3tAiIz1TEWuO5ExXabUqvenPJw/45Y1QifpuJ4yP7jf90/6d
         i4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1FqO/N9pjgiiBZnjptWqpBsjNoDh4nF55unoVGGZ15E=;
        b=YA6zNnm9Htjq5lnwPUTRhBY4Qdlztf1TpRw4jYRnY1+jXYbcp9Rev47WOocDSmo4vK
         yg/e//N3MbFjK8DOtXOD78nwLy/prLH23cknRhoUJmEiYwNiDzQ60XakM55/s/eOUe2k
         OlRjmTe0uycIrmg8CAv1oOu4UT6o1NCeljS11HlR46uhkZ6dWaYBeUv1rDCpSWn/Jmav
         b02hgEYLnEBJhelV4dWY317HXDsNLX/ESgHJpigN6RMIoIqHuu1CntpCvsP9oayFK1yW
         VofiJPln20YAB+ELfiiNVgat1owXjNTLfYxmp/DbVRqnDvDFRciL4q3ojYFulrad2DBI
         0PNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J9r8uic4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m21-20020a05622a119500b0035d49f31f85sor2682531qtk.70.2022.10.01.09.23.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 01 Oct 2022 09:23:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J9r8uic4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1FqO/N9pjgiiBZnjptWqpBsjNoDh4nF55unoVGGZ15E=;
        b=J9r8uic4TB2HoXqNDO4naBMrtbWQ/HlsKOqMLd+y1haOoDBx1uPXVhc8CimtzJVhCm
         Jv0dz9l6xhLtKJ2l/7ktGrrK1Z00Bk88H17VL9pKAFYUNdf+K+e+FQiiU5toSaI9by6t
         AS7W+pF+Rhhe9wCB6Y3eAP3XH0EGU8xHx8S6Yyy+XUG106C5C+UaihATPfzCl/9vACAJ
         gz+x6ikWD26iqHs+AaYxXvBCglBGV1iduFEoVF9dxFrThmLK0FrUXmCJ91QOf1iAay91
         n9dg5XBVWKQGpqg2WbLtHShZZ8YE75Yvi8d4dXLTJHwkeDn3lyRAZEyeqP22Vb4a69W4
         uFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1FqO/N9pjgiiBZnjptWqpBsjNoDh4nF55unoVGGZ15E=;
        b=gBVQUTC7giyK6GH2hEbk90mxFAISXxOljbltHT4EUqgWU2FUTN/rcva6GohWryz8ki
         Nr/li+M3THW8hzRSjr3H9LAFwcIBFamrMe73yz3J0KMXAf45mk+W3h8ZUwIsNJNvMpKl
         MILOWxshybyGhPXtoGJR5o+9Y7dlpJmZs19+yXtW/mYNlMDpCCqRxGBw61622SQ+i0f1
         hY0sk/bX6Xza5k334DO08CFng0y0CDDZuCESVgOoi7pDBlfc3ZfzV1RipgNcXxs8TxoZ
         f5gWbRwmf98GSUz/KM9tVnvWvs9+KSFqN/22jtkHt/SRfpM9kIrosTH63odhEpzfGzCq
         iE5w==
X-Gm-Message-State: ACrzQf1izdvEFGokDS7qjJOErLYDlgHjKDZYfZFzEYpUFWwimhk36Brs
	JYwy5564a0V7wcn4ZleimeHZ9iAo
X-Google-Smtp-Source: AMsMyM6hmDWSAB6weAcqCD4pSBfsr2WeVFqZI49VpInu9i4S7mmoCswPfh7eI9rU0+P+m3+7fh0ClA==
X-Received: by 2002:a05:622a:111:b0:35d:51e8:9620 with SMTP id u17-20020a05622a011100b0035d51e89620mr11160539qtw.172.1664641412784;
        Sat, 01 Oct 2022 09:23:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
        by smtp.gmail.com with ESMTPSA id t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 09:23:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3 04/42] target/arm: Add is_secure parameter to regime_translation_disabled
Date: Sat,  1 Oct 2022 09:22:40 -0700
Message-Id: <20221001162318.153420-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TC4JTRUOfOhU

Remove the use of regime_is_secure from regime_translation_disabled,
using the new parameter instead.

This fixes a bug in S1_ptw_translate and get_phys_addr where we had
passed ARMMMUIdx_Stage2 and not ARMMMUIdx_Stage2_S to determine if
Stage2 is disabled, affecting FEAT_SEL2.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5192418c0e..f9b7c316d0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -131,12 +131,13 @@ static uint64_t regime_ttbr(CPUARMState *env, ARMMMUIdx mmu_idx, int ttbrn)
 }
 
 /* Return true if the specified stage of address translation is disabled */
-static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
+static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
+                                        bool is_secure)
 {
     uint64_t hcr_el2;
 
     if (arm_feature(env, ARM_FEATURE_M)) {
-        switch (env->v7m.mpu_ctrl[regime_is_secure(env, mmu_idx)] &
+        switch (env->v7m.mpu_ctrl[is_secure] &
                 (R_V7M_MPU_CTRL_ENABLE_MASK | R_V7M_MPU_CTRL_HFNMIENA_MASK)) {
         case R_V7M_MPU_CTRL_ENABLE_MASK:
             /* Enabled, but not for HardFault and NMI */
@@ -163,7 +164,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx)
 
     if (hcr_el2 & HCR_TGE) {
         /* TGE means that NS EL0/1 act as if SCTLR_EL1.M is zero */
-        if (!regime_is_secure(env, mmu_idx) && regime_el(env, mmu_idx) == 1) {
+        if (!is_secure && regime_el(env, mmu_idx) == 1) {
             return true;
         }
     }
@@ -203,7 +204,7 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
     ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
 
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, s2_mmu_idx)) {
+        !regime_translation_disabled(env, s2_mmu_idx, *is_secure)) {
         GetPhysAddrResult s2 = {};
         int ret;
 
@@ -1357,7 +1358,7 @@ static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
     uint32_t base;
     bool is_user = regime_is_user(env, mmu_idx);
 
-    if (regime_translation_disabled(env, mmu_idx)) {
+    if (regime_translation_disabled(env, mmu_idx, is_secure)) {
         /* MPU disabled.  */
         result->phys = address;
         result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
@@ -1521,7 +1522,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
     result->page_size = TARGET_PAGE_SIZE;
     result->prot = 0;
 
-    if (regime_translation_disabled(env, mmu_idx) ||
+    if (regime_translation_disabled(env, mmu_idx, secure) ||
         m_is_ppb_region(env, address)) {
         /*
          * MPU disabled or M profile PPB access: use default memory map.
@@ -1733,7 +1734,7 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
      * are done in arm_v7m_load_vector(), which always does a direct
      * read using address_space_ldl(), rather than going via this function.
      */
-    if (regime_translation_disabled(env, mmu_idx)) { /* MPU disabled */
+    if (regime_translation_disabled(env, mmu_idx, secure)) { /* MPU disabled */
         hit = true;
     } else if (m_is_ppb_region(env, address)) {
         hit = true;
@@ -2307,7 +2308,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
 
             /* If S1 fails or S2 is disabled, return early.  */
-            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2)) {
+            if (ret || regime_translation_disabled(env, ARMMMUIdx_Stage2,
+                                                   is_secure)) {
                 return ret;
             }
 
@@ -2438,7 +2440,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
 
     /* Definitely a real MMU, not an MPU */
 
-    if (regime_translation_disabled(env, mmu_idx)) {
+    if (regime_translation_disabled(env, mmu_idx, is_secure)) {
         uint64_t hcr;
         uint8_t memattr;
 
-- 
2.34.1
