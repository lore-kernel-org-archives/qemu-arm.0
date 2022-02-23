X-Received: by 2002:a17:903:41d0:b0:14f:aa3b:45c6 with SMTP id u16-20020a17090341d000b0014faa3b45c6mr1667127ple.105.1645655517482;
        Wed, 23 Feb 2022 14:31:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645655517; cv=none;
        d=google.com; s=arc-20160816;
        b=LSol7fv29pqlAoqMeic6AITv4D2lG54OrXrBoPYh/pJrFsQUHEWYBZtOk80aOhO8wO
         YVJswbo+SF7aTKwR4v9AN1sokkOoYu32/EousVD1nHQ8EO2PbaMbKfJuCYKQdHQhXG9s
         dkvPZJcatXDstUDGDchH6UBbCkkabjaueKK8Wbdt4aFHjp3cHspNEWc7DbXnYa9I3/1L
         ISomwu3LGc2Nx9iUciwQZarCoQbIk21iDJPk74BnvVEE6WR5G8z4q7lmgM63aJzloqd8
         i52paHKQp+UTUBPJa6tR6xXAUAaKekbE30YxCCvAdCj9oZp3f/VdqQRDKFCV8DT4Lwvw
         FZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DRWkLoJkIekxooE0yM1xnliLnzzt/ozTUB9sEE/E5Ow=;
        b=f+J1lhKyf3QncR3vL4GtwAvX4TpX6+c5T8tteBRq2iStakMl61OBVuFGf+w8qrG+jy
         W+J7S5qgtWR95oIJRRLIwV7d6Av00gv0NJ8VkPtRVEhGaf5CHbNxBFbQXaHCU3twcRc1
         2abIxWlh14izNu5+2+w+Ekgw623hKkFqH3dVlR1/3IJItEnU0G6jBPBtEM1pdX7a/j0w
         BrY0YqsSbd4qvXQcPeQQI+stgn72FiygIDA2wGTEKmparbYidkPxEpRkbVYLXv92EuXz
         pY5EjvQo+/84QKq/z1dgjNJm0g++vjB6X6zWxIkeR7/PdboXjO2Kap4bqfox/PBCDeNo
         TVJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HsqqqynC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k4sor575788pgs.41.2022.02.23.14.31.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 14:31:57 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HsqqqynC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DRWkLoJkIekxooE0yM1xnliLnzzt/ozTUB9sEE/E5Ow=;
        b=HsqqqynCxDcY7I8E2Acrusu7Vuj2V/L3cS4Te9EDN/S57+i1HTRWhIhqbzyeTo4/80
         uPbOUZClni+rjI3bpqlBi6f7IE4vV3BR9nFe2XZT+cPBcnWXJ8XKBuNs/vL66qTNf8sB
         G3rpHUU9uYnOEMKW88ah3RQbDYARnke1y8hXDGtKzvnZfpDcCTj4M8vrZz3rK/SRDCVs
         3Purz5O0CXIYQQlD8CbPicp4gMAzuXVORy/9AAq2QUV5kLh0xLE5fRpu+xUS6KNut5lT
         1g2fPwMVVHNbwiQJjQfwNtfMlNFgiMJSLzN0EIjXskHqQrzzvtLQ2KzyzTrasInq7qou
         ITyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DRWkLoJkIekxooE0yM1xnliLnzzt/ozTUB9sEE/E5Ow=;
        b=IrNAFgjafW6WpWq4Ve+VajhZCZBpbWY222Xj2zvZMI9huBvm9mErBPj1Mpl9hOmvw/
         b37fj2EZ1y4IBHxC/mHormfZSK+MyhBA+f1vvctKcmjzLpFTUAJOS1swqMGU4cqb8oqG
         5EI9qN1kYGPwHUHwbrVXZCcUS6wR5AVGMN/1cWrNYk6F3NHuaeu9LOyM+BDZz1FGD+nv
         yHEXRsw/mBvc5AcFzqUMV+pazOuQhIrKYTrIHeLRJgiKmSFOE0bGfCA75i2KwRoebEB7
         DohIBeXSVrOTNZ1oGgEmtvHRMTyZkczUkIgDOvCtkUp/+3P3bZ54vINHZqBhrLZ16yMY
         JSLg==
X-Gm-Message-State: AOAM531azdwGLa1TECPQ42NRiZn0gCqfNNytl/enVigUMA29j4DXQliE
	UwjVEaIcR9kdz5r0XBD+HVxJDAwp
X-Google-Smtp-Source: ABdhPJxvDA4RRlQEwTENI61sXhE6YiF7je2N35goZiibJedvC9KipfIg13or3MAEWLjehhqjhCoAZQ==
X-Received: by 2002:a65:644f:0:b0:375:6899:87db with SMTP id s15-20020a65644f000000b00375689987dbmr1429743pgv.112.1645655516848;
        Wed, 23 Feb 2022 14:31:56 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com. [50.113.46.110])
        by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 14:31:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 10/17] target/arm: Implement FEAT_LPA
Date: Wed, 23 Feb 2022 12:31:30 -1000
Message-Id: <20220223223137.114264-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
References: <20220223223137.114264-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: zp7PToMAUIiP

This feature widens physical addresses (and intermediate physical
addresses for 2-stage translation) from 48 to 52 bits, when using
64k pages.  The only thing left at this point is to handle the
extra bits in the TTBR and in the table descriptors.

Note that PAR_EL1 and HPFAR_EL2 are nominally extended, but we don't
mask out the high bits when writing to those registers, so no changes
are required there.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |  1 +
 target/arm/cpu-param.h        |  2 +-
 target/arm/cpu64.c            |  2 +-
 target/arm/helper.c           | 19 ++++++++++++++++---
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index f3eabddfb5..0053ddce20 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -24,6 +24,7 @@ the following architecture extensions:
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
 - FEAT_JSCVT (JavaScript conversion instructions)
 - FEAT_LOR (Limited ordering regions)
+- FEAT_LPA (Large Physical Address space)
 - FEAT_LRCPC (Load-acquire RCpc instructions)
 - FEAT_LRCPC2 (Load-acquire RCpc instructions v2)
 - FEAT_LSE (Large System Extensions)
diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 5f9c288b1a..b59d505761 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -10,7 +10,7 @@
 
 #ifdef TARGET_AARCH64
 # define TARGET_LONG_BITS             64
-# define TARGET_PHYS_ADDR_SPACE_BITS  48
+# define TARGET_PHYS_ADDR_SPACE_BITS  52
 # define TARGET_VIRT_ADDR_SPACE_BITS  52
 #else
 # define TARGET_LONG_BITS             32
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1de31ffb40..d88662cef6 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -795,7 +795,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64pfr1 = t;
 
     t = cpu->isar.id_aa64mmfr0;
-    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 5); /* PARange: 48 bits */
+    t = FIELD_DP64(t, ID_AA64MMFR0, PARANGE, 6); /* FEAT_LPA: 52 bits */
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 28b4347213..950f56599e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11173,6 +11173,7 @@ static const uint8_t pamax_map[] = {
     [3] = 42,
     [4] = 44,
     [5] = 48,
+    [6] = 52,
 };
 
 /* The cpu-specific constant value of PAMax; also used by hw/arm/virt. */
@@ -11564,11 +11565,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
     descaddr = extract64(ttbr, 0, 48);
 
     /*
-     * If the base address is out of range, raise AddressSizeFault.
+     * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [5:2] of TTBR.
+     *
+     * Otherwise, if the base address is out of range, raise AddressSizeFault.
      * In the pseudocode, this is !IsZero(baseregister<47:outputsize>),
      * but we've just cleared the bits above 47, so simplify the test.
      */
-    if (descaddr >> outputsize) {
+    if (outputsize > 48) {
+        descaddr |= extract64(ttbr, 2, 4) << 48;
+    } else if (descaddr >> outputsize) {
         level = 0;
         fault_type = ARMFault_AddressSize;
         goto do_fault;
@@ -11620,7 +11625,15 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         }
 
         descaddr = descriptor & descaddrmask;
-        if (descaddr >> outputsize) {
+
+        /*
+         * For FEAT_LPA and PS=6, bits [51:48] of descaddr are in [15:12]
+         * of descriptor.  Otherwise, if descaddr is out of range, raise
+         * AddressSizeFault.
+         */
+        if (outputsize > 48) {
+            descaddr |= extract64(descriptor, 12, 4) << 48;
+        } else if (descaddr >> outputsize) {
             fault_type = ARMFault_AddressSize;
             goto do_fault;
         }
-- 
2.25.1
