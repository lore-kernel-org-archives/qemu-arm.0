X-Received: by 2002:a17:90b:1a85:b0:1b9:fdd7:ae07 with SMTP id ng5-20020a17090b1a8500b001b9fdd7ae07mr11285004pjb.190.1645655509748;
        Wed, 23 Feb 2022 14:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655509; cv=none;
        d=google.com; s=arc-20160816;
        b=qCbwyXhMmOyPXAOtbNVFPT793s2+nxfY34Z2B/TkQ8AyTPKt6c35vNYbTihr2bPJsl
         RhDwsMPEc86KC3aLPErWHaSPXDKFUSXf+zDP7O3f1xyqSTMdOK+5FwiCg7XoHgdSmb02
         TpL1tszCG2pl1orKE+50ZSpaAqJBBUFE85qP8Nr/O74U7xgL1Sa0w7MbEVRbzQu9Anye
         bgewnoZYxijHEaFt4tl0A+hCXqhoI7ApjdZxQt4oC/WpM75jOdAaGGUC0C+wH5WnXkDB
         E2js482NtdPxMUtZVU3LGMBs5RI8gunN7+yq6kZxiA4zcn3L7cj832dKl9U8QL28hHuW
         sMZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TAU62jUEHWqZmP/omH+DP65D27WXovgj7reF6QpCfzg=;
        b=FaFqugC0QHmbxnlte5U5RkNz+IKnBslG7SXoOJoi3qQCi7b1okoUgCXFa90x0LsPqT
         gJJLXfYCE5deiLp0hDRhtPvmwwujdviiN4RJaCgHRJGu9bLaE0AALqyb6dUFz2ZInl6y
         tndpRHCGUsKnHuGod9/5BNAPPccA1IVJCa//46YfLL4Ick/8ujUxv2uVYWGRvpsEUAtN
         ubWlMfg0Ej8Gn0MoeiZx3upiSx3fXmU3dNTuukV2a5N2B31SNVl9GKXC/MhufQOgFZ5S
         PTLv6RivqiOQzFv2Vj+sRXj/EUrqoIvuojsFnZ/H94tpA7Hb5gqicCfelMz7+OMOUs8X
         lp6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qci+ATQT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k1sor589057pfc.33.2022.02.23.14.31.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:31:49 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qci+ATQT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TAU62jUEHWqZmP/omH+DP65D27WXovgj7reF6QpCfzg=;
        b=qci+ATQTMvD+ZRQvRNzNY3SFlHbue3ZUY+cebS/Zwj2QLeycJ7oqNnHFZCnw/zGNXd
         FbvUOd+hMLUOjiR6yCB5RkV64k/+ZCikHlYqti+f/1dElrrA7sqH0rHbeBZtD6UFFUQd
         2mxHpKOmSXsHZHUf0qf8irBBXkQGyWhrTlvDiFMN5nz3SkROpxmawZXlazUrHykhs9/7
         Inu007DSVGGvpvT47d1+i4KkcFYbZTj+dkjnfdCcEMmdKaJOlfWPhfoqw6Q2Im1wFeoI
         0qjv57FvReuByNfWOrdKPriy2dy8Oftw1nCq7aUfx/7QFD7AEyx/X6LsZA0PRfJDBSzV
         jlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TAU62jUEHWqZmP/omH+DP65D27WXovgj7reF6QpCfzg=;
        b=Sq6wdVjGM0rhlcsItp71VxS1DEgTcfnJZpnvpOzYkt5W2lkp7YFRunDStMeFD1nR7V
         5tjeRm8ue4EfeXKdboZ2gPIvFhexRzNGkZQqWV9xUf76L4E0kTafUDeyeoGk7h1M+ELI
         WWEdycZ220i4669fGA1dS6G0pzDJcKPKuSbfnjXwFKN2i0/AsUY94w0tn5vnb9K9XToN
         K9Fw5yhc7FLEMpdMI1Rk22TDsi+I672a6GS+IVAQahT2Ideja1uoH/cgNJMx/S5uW9XX
         dp3X6lS9+mhnM+1/IJc12bHm2hLdXgSmlcydqVPJXDeWX3U8qzw/N8yPDALLHafxw1Pq
         9k3Q==
X-Gm-Message-State: AOAM531+oMMFTD+H87FIVyG3ySmohj/jaqBhmcX1b/sblH6lEcJ7Jnen
	bgerSm/Z7tn98d6AQjwZ5fgLgsBW
X-Google-Smtp-Source: ABdhPJzZpRVUKB8Qvw74AY10KTm/w6s9Yol5I1U+o4fTP7/bicFk5Jq7do8bpt3ye80gxX2xH7YD0A==
X-Received: by 2002:a63:575d:0:b0:373:a27e:7c67 with SMTP id h29-20020a63575d000000b00373a27e7c67mr1412931pgm.558.1645655509245;
        Wed, 23 Feb 2022 14:31:49 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 05/17] target/arm: Pass outputsize down to check_s2_mmu_setup
Date: Wed, 23 Feb 2022 12:31:25 -1000
Message-Id: <20220223223137.114264-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: aVmkHImrA5WT

Pass down the width of the output address from translation.
For now this is still just PAMax, but a subsequent patch will
compute the correct value from TCR_ELx.{I}PS.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 71e575f352..431b0c1405 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11065,7 +11065,7 @@ do_fault:
  * false otherwise.
  */
 static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                               int inputsize, int stride)
+                               int inputsize, int stride, int outputsize)
 {
     const int grainsize = stride + 3;
     int startsizecheck;
@@ -11081,22 +11081,19 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
     }
 
     if (is_aa64) {
-        CPUARMState *env = &cpu->env;
-        unsigned int pamax = arm_pamax(cpu);
-
         switch (stride) {
         case 13: /* 64KB Pages.  */
-            if (level == 0 || (level == 1 && pamax <= 42)) {
+            if (level == 0 || (level == 1 && outputsize <= 42)) {
                 return false;
             }
             break;
         case 11: /* 16KB Pages.  */
-            if (level == 0 || (level == 1 && pamax <= 40)) {
+            if (level == 0 || (level == 1 && outputsize <= 40)) {
                 return false;
             }
             break;
         case 9: /* 4KB Pages.  */
-            if (level == 0 && pamax <= 42) {
+            if (level == 0 && outputsize <= 42) {
                 return false;
             }
             break;
@@ -11105,8 +11102,8 @@ static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
         }
 
         /* Inputsize checks.  */
-        if (inputsize > pamax &&
-            (arm_el_is_aa64(env, 1) || inputsize > 40)) {
+        if (inputsize > outputsize &&
+            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
             /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
             return false;
         }
@@ -11392,7 +11389,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     target_ulong page_size;
     uint32_t attrs;
     int32_t stride;
-    int addrsize, inputsize;
+    int addrsize, inputsize, outputsize;
     TCR *tcr = regime_tcr(env, mmu_idx);
     int ap, ns, xn, pxn;
     uint32_t el = regime_el(env, mmu_idx);
@@ -11422,11 +11419,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
+        outputsize = arm_pamax(cpu);
     } else {
         param = aa32_va_parameters(env, address, mmu_idx);
         level = 1;
         addrsize = (mmu_idx == ARMMMUIdx_Stage2 ? 40 : 32);
         inputsize = addrsize - param.tsz;
+        outputsize = 40;
     }
 
     /*
@@ -11511,7 +11510,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
 
         /* Check that the starting level is valid. */
         ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
-                                inputsize, stride);
+                                inputsize, stride, outputsize);
         if (!ok) {
             fault_type = ARMFault_Translation;
             goto do_fault;
-- 
2.25.1
