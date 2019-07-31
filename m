Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071322wrv;
        Wed, 31 Jul 2019 13:38:33 -0700 (PDT)
X-Received: by 2002:a17:902:8f93:: with SMTP id z19mr117735070plo.97.1564605513320;
        Wed, 31 Jul 2019 13:38:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605513; cv=none;
        d=google.com; s=arc-20160816;
        b=yBczKlMqcgjfaGxVslvPXjeSzvTOcQqv6CBYmSlTW+5Y0DkN9kZzBFz8GpEs4jx62o
         iAsvwzamJaJLZV0IGoVEQNRxl9hwC6HW6RcBegva0AlJICFUNRi+tDOMFdHEMhLQ9zac
         1URliqYCPRXKZPJbBAWEvXpQDPaBioDIduWSpvQxG9m/zhbCpyOa6lwZpVHgYCGJJ3GA
         7US+GS00BXo/mKvm5YC8fWoXg8jIK/VZXRmYvvzUanuOrwFZKNYekuCJPHAeJACmF2WO
         bvTkywPZ836eOqRxdyl6Bx90rVDWdlqPy/cGwSXKcdizSdO4Aomrjz/Z/PhoRRzGyGDf
         Mwvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RHV3vStI8hqe3CeMRucY7WZ1UFpWZPYBbhdsWvPNW30=;
        b=tPQiY6x/zHdPmPfUbaGAoUT7ZBQn6h494znBYdDC6pOR/MIt4qXjZe0rEukYbjE+HH
         Y5klZTNEf7ciKeyam5gwMnRElvqOimusDw5pKn8ZIeAMxBddER7kz0cdygf6BB+JwSpl
         JJ6CNEKJ1AzN9RSlz4EW55aXJd2cFXQl+vgJn71oycxoSQeyaZ+gwP1mCvMYXBZiOs9b
         yVI21WdfQkd8UTIAJR7cMl7x1BCp8HwItsL8DeVrFudG6DoqSOw2brOJ9MzPYt7gf5oX
         j1OFauaFgUYpUUFAxpapUYfA32u3xrtA0OCEa/bWdm01P4nisjgQA+4J7YgCQfoTkNYF
         d4pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWm4D6tI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f7sor45986521pgc.20.2019.07.31.13.38.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QWm4D6tI;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RHV3vStI8hqe3CeMRucY7WZ1UFpWZPYBbhdsWvPNW30=;
        b=QWm4D6tIVVlCHNDWidhXBv3U+A7GuWyovfDIlJWkpWxjEGZJBP5am0SjFaoXk2ATrD
         e95MlhjOojiBHxxlx6AO7etV/0yRuB1DQesRzt0eDwuKlueXLG0n45AogMfs6im7YH9G
         pyZBdxPoArEG5YT0c0hH5q8swpTWofLTUdk01WHc+2SCW5/iAawesl/QOOhY7nOz/6b1
         do4D1rkW5Y+EGNQBLANbDPWVBfibMol1BwM3ku5MZLiAagRTIR9Y1PxYL++Lsm4jkA//
         0xkGFAPdTq8gnajI61cWS5WOdmIOu7PDBwfkPx2srm1Fvn5alrvnV4dPmVlJ4c1Kndrc
         exjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RHV3vStI8hqe3CeMRucY7WZ1UFpWZPYBbhdsWvPNW30=;
        b=YsifGfJkDIwIusUSsEInCkupjcojkfNVAVUbRMN83Kj4gGcrMmXG7NL6xRRxPYcIPZ
         WQKSLwXKOoxLE3rXEfX+BCkiNp8qs809DBSDtBphKmg0PErY60sdLJkk8tbr82PHPCS3
         uu1qaM9gxAVycVMYvWLS01QtVKZ2udVdCR9MtSPanVc1ToF/XsaF4XzNsKmgg2S/W1wV
         waj5dP+eChA9NZET/9hm9C0e75+beAZ/C7lOV6bJsvsrYpSYi6AAxiAlkrOmYRrHMeBx
         rwIZ56HquT5UR0ARQ+KqbliIWdqrhkVjY7qdsM/2Q4a2i+0stxjZD0ujmGV00wuT1X1W
         xeDA==
X-Gm-Message-State: APjAAAVLZHCrKMsE+t2LOoljjGVVlYPS7BS0zdwh7ic0vbTj0aXpi66W
	L4a6rGkhVxFrNyVOQvewN6YrDoKR
X-Google-Smtp-Source: APXvYqw1Pnr6Xw4hruHzabYkUdZFOSUsMarpt/euRbJpfwC1kyTDI5CmNtdCTxXN/pw7fQm3/2cNPw==
X-Received: by 2002:a63:9c5:: with SMTP id 188mr80039525pgj.2.1564605512775;
        Wed, 31 Jul 2019 13:38:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 14/32] target/arm: Simplify tlb_force_broadcast alternatives
Date: Wed, 31 Jul 2019 13:37:55 -0700
Message-Id: <20190731203813.30765-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: qY2dWNrcd3jU

Rather than call to a separate function and re-compute any
parameters for the flush, simply use the correct flush
function directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 52 +++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 28 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7ecaacb276..185f5e4aea 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -626,56 +626,54 @@ static void tlbiall_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           uint64_t value)
 {
     /* Invalidate all (TLBIALL) */
-    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
 
     if (tlb_force_broadcast(env)) {
-        tlbiall_is_write(env, NULL, value);
-        return;
+        tlb_flush_all_cpus_synced(cs);
+    } else {
+        tlb_flush(cs);
     }
-
-    tlb_flush(CPU(cpu));
 }
 
 static void tlbimva_write(CPUARMState *env, const ARMCPRegInfo *ri,
                           uint64_t value)
 {
     /* Invalidate single TLB entry by MVA and ASID (TLBIMVA) */
-    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
 
+    value &= TARGET_PAGE_MASK;
     if (tlb_force_broadcast(env)) {
-        tlbimva_is_write(env, NULL, value);
-        return;
+        tlb_flush_page_all_cpus_synced(cs, value);
+    } else {
+        tlb_flush_page(cs, value);
     }
-
-    tlb_flush_page(CPU(cpu), value & TARGET_PAGE_MASK);
 }
 
 static void tlbiasid_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
     /* Invalidate by ASID (TLBIASID) */
-    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
 
     if (tlb_force_broadcast(env)) {
-        tlbiasid_is_write(env, NULL, value);
-        return;
+        tlb_flush_all_cpus_synced(cs);
+    } else {
+        tlb_flush(cs);
     }
-
-    tlb_flush(CPU(cpu));
 }
 
 static void tlbimvaa_write(CPUARMState *env, const ARMCPRegInfo *ri,
                            uint64_t value)
 {
     /* Invalidate single entry by MVA, all ASIDs (TLBIMVAA) */
-    ARMCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
 
+    value &= TARGET_PAGE_MASK;
     if (tlb_force_broadcast(env)) {
-        tlbimvaa_is_write(env, NULL, value);
-        return;
+        tlb_flush_page_all_cpus_synced(cs, value);
+    } else {
+        tlb_flush_page(cs, value);
     }
-
-    tlb_flush_page(CPU(cpu), value & TARGET_PAGE_MASK);
 }
 
 static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -3923,11 +3921,10 @@ static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     int mask = vae1_tlbmask(env);
 
     if (tlb_force_broadcast(env)) {
-        tlbi_aa64_vmalle1is_write(env, NULL, value);
-        return;
+        tlb_flush_by_mmuidx_all_cpus_synced(cs, mask);
+    } else {
+        tlb_flush_by_mmuidx(cs, mask);
     }
-
-    tlb_flush_by_mmuidx(cs, mask);
 }
 
 static int vmalle1_tlbmask(CPUARMState *env)
@@ -4049,11 +4046,10 @@ static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
     uint64_t pageaddr = sextract64(value << 12, 0, 56);
 
     if (tlb_force_broadcast(env)) {
-        tlbi_aa64_vae1is_write(env, NULL, value);
-        return;
+        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr, mask);
+    } else {
+        tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
     }
-
-    tlb_flush_page_by_mmuidx(cs, pageaddr, mask);
 }
 
 static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
2.17.1
