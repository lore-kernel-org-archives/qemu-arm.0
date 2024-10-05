Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147754njb;
        Sat, 5 Oct 2024 13:06:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU6xBJjN9Q0z9oLIout6hBksXhqp+wJEC8ph/Jg3qYok1sGCVc13EERYycpcU/j4Lci6LtPZiBnc81PcQ==@linaro.org
X-Received: by 2002:a17:902:c94d:b0:20b:46cb:8cbe with SMTP id d9443c01a7336-20bfe00bc48mr106167725ad.29.1728158781911;
        Sat, 05 Oct 2024 13:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158781; cv=none;
        d=google.com; s=arc-20240605;
        b=Wijt4hONcmwUxh5XweOgpTzER/rGT82i3I8n7Q8wBQcN/xqZzrQfE2sMdpfY5fzLKi
         JbpYQjMNTEMrY4j4UhDZ6ULSgodXHdcCdJ+xg92wgklBZZr21dyWAuks4rwkEan1ebP8
         wVTF4ndlbvcNlqGfdodCccfH4hpjSxQVv+4vLvopGRDh+mCvdGgo+mLohadpxiTj7PNe
         /tmOOvI3NVm+XrJX8qqCN228NBZgA0aXPjPUyiH3X/9ILGWRnWrx4unutdyqRxNFRUEa
         37Lrn72d7n1DV9ERT6O2qn0wYySV6d+Q0AeQ4StS8VeC+dLp46me1s1Fdx7oG0l8m4ns
         dwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OPq3M0kuo1Nn8l2/hQhKXzGFF76ZzptYhUbdCidOcco=;
        fh=1fkVneA8pXvJk7MeF1oGqdd/gtkiX+ra3s03a/cVZU4=;
        b=gU7OCLxcQA0q/xxwSFew8dnlRC6ERbDf7jtm/Jda0CmWltpmUIV89773SRm/xkD1LG
         lWnx0GyTsH8tPg32IHIokj8oSlBiYhRw06ZbZVxNi35EvgJxE6i17yZMZ1rs0lVh/2TG
         CAGOkcOcHvOcG5sKKnYfnAq+tF43nw7pilnmd4I8bVZ9xOaAVlHAA43SdZIXJ4TCYa5S
         nQzshHiIAq3PDwjb48ZP9EDLjyo1S3RGYtO/Qy0Yhv3TR0GDFEZEtGbPsO4vgApSWo6a
         ddd8sLUcy/zV2/FNBWga+1vmw9jcaGQOf0CRgWVAo0v5PgYSwFLzIqVv7FTFM8jPgeLy
         3zOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hPGNSuiu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138b0ff0sor10255195ad.5.2024.10.05.13.06.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hPGNSuiu;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158781; x=1728763581; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPq3M0kuo1Nn8l2/hQhKXzGFF76ZzptYhUbdCidOcco=;
        b=hPGNSuiuRngefoE3eDrG6xv0JnX0TqPZyvEZ4YzZCYgt7wQa5z8r4KXAOL/tW+Tc2c
         vPCk6wFo1L0ts9yvPHsFPEbUfg0CI7lkaffrmHqDQ2A91YsM0wepIcYpo6tGmKCaPxrf
         K3s84mi7faEXYzj2nC0G4I9cPrp8ZeeeHvbVAACOaij6E4QPgpr09peAU3GbRLjT30jj
         F2kxIBgbhF8Mi0vMv53/YE+1+2MGPU0/fq35ZwN3c+3+RPQq1WP9D0nhyJziZmU1L5Rh
         AWTP4dxlM/HoZXu8GgmKGinkST7NzWeOpsbW2ixuPTUIlnD66LHWUGWTtTyws9LZGBLl
         RryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158781; x=1728763581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPq3M0kuo1Nn8l2/hQhKXzGFF76ZzptYhUbdCidOcco=;
        b=AP3reBnH+AC6m5oWrvspRpG4OuP/GJn4UBmePLMR97Rw6VL1v8J0qBcuoSiOPR2EID
         xu3UsgrM2oMA9kZJrzLn4BljNtP8W9AsBwvh5jjWn1+y3HGCRkVHeSeFnagRyNmlz6Ue
         c5V8beGLeBbcrCKxYpU/DEDUzbKWHofi7/7y/QdsM4byyqfFeUPc37b2S3mVbQx/LBjC
         La2cpLDbaC+36bpTc32zQHKhE503zl2bRwe5sMO1X3RNvcwQfwuo9+lyMZvUcUyoRJ7j
         SDYRGA7a00Tgg25b+XBgjhyy0jT7tj8Mx5OsqAZz7JE23uhCz5zmeJy+u9/SVQn9ty0S
         4LKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTo0cTB1jh1CdKag7zAbdihOuUGVq/qEDX2X/8Aelm1gwsrosAPoc5gJLVOTpPHQ2Oj5kXVw5b5ydSCg==@linaro.org
X-Gm-Message-State: AOJu0YwOoubQ11S4Iej2kZt46D6w35vbtCyD/a0ppHtVoeYWm2yXx1w+
	HXu0wljj6HO0JJ6V1dqXENTVB8iOQRU1+XZydpqdFe+S7uIX/TYWLhishNZss5Kbpg==
X-Google-Smtp-Source: AGHT+IEXZ+Zzt8PYusjsrpVGhTnFdRGcsZ6PugCvEf2Sr7CI2YAi0gDdsUS8CYPUBNKBVP2Jklnamw==
X-Received: by 2002:a17:902:da92:b0:20b:6188:fc5e with SMTP id d9443c01a7336-20bfdfff45emr91588865ad.28.1728158781473;
        Sat, 05 Oct 2024 13:06:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 21/21] target/arm: Fix alignment fault priority in get_phys_addr_lpae
Date: Sat,  5 Oct 2024 13:06:00 -0700
Message-ID: <20241005200600.493604-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: tEXpVOz4n5Ig

Now that we have the MemOp for the access, we can order
the alignment fault caused by memory type before the
permission fault for the page.

For subsequent page hits, permission and stage 2 checks
are known to pass, and so the TLB_CHECK_ALIGNED fault
raised in generic code is not mis-ordered.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 51 ++++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 21 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0a1a820362..dd40268397 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2129,6 +2129,36 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         device = S1_attrs_are_device(result->cacheattrs.attrs);
     }
 
+    /*
+     * Enable alignment checks on Device memory.
+     *
+     * Per R_XCHFJ, the correct ordering for alignment, permission,
+     * and stage 2 faults is:
+     *    - Alignment fault caused by the memory type
+     *    - Permission fault
+     *    - A stage 2 fault on the memory access
+     * Perform the alignment check now, so that we recognize it in
+     * the correct order.  Set TLB_CHECK_ALIGNED so that any subsequent
+     * softmmu tlb hit will also check the alignment; clear along the
+     * non-device path so that tlb_fill_flags is consistent in the
+     * event of restart_atomic_update.
+     *
+     * In v7, for a CPU without the Virtualization Extensions this
+     * access is UNPREDICTABLE; we choose to make it take the alignment
+     * fault as is required for a v7VE CPU. (QEMU doesn't emulate any
+     * CPUs with ARM_FEATURE_LPAE but not ARM_FEATURE_V7VE anyway.)
+     */
+    if (device) {
+        unsigned a_bits = memop_atomicity_bits(memop);
+        if (address & ((1 << a_bits) - 1)) {
+            fi->type = ARMFault_Alignment;
+            goto do_fault;
+        }
+        result->f.tlb_fill_flags = TLB_CHECK_ALIGNED;
+    } else {
+        result->f.tlb_fill_flags = 0;
+    }
+
     if (!(result->f.prot & (1 << access_type))) {
         fi->type = ARMFault_Permission;
         goto do_fault;
@@ -2156,27 +2186,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     result->f.attrs.space = out_space;
     result->f.attrs.secure = arm_space_is_secure(out_space);
 
-    /*
-     * Enable alignment checks on Device memory.
-     *
-     * Per R_XCHFJ, this check is mis-ordered. The correct ordering
-     * for alignment, permission, and stage 2 faults should be:
-     *    - Alignment fault caused by the memory type
-     *    - Permission fault
-     *    - A stage 2 fault on the memory access
-     * but due to the way the TCG softmmu TLB operates, we will have
-     * implicitly done the permission check and the stage2 lookup in
-     * finding the TLB entry, so the alignment check cannot be done sooner.
-     *
-     * In v7, for a CPU without the Virtualization Extensions this
-     * access is UNPREDICTABLE; we choose to make it take the alignment
-     * fault as is required for a v7VE CPU. (QEMU doesn't emulate any
-     * CPUs with ARM_FEATURE_LPAE but not ARM_FEATURE_V7VE anyway.)
-     */
-    if (device) {
-        result->f.tlb_fill_flags |= TLB_CHECK_ALIGNED;
-    }
-
     /*
      * For FEAT_LPA2 and effective DS, the SH field in the attributes
      * was re-purposed for output address bits.  The SH attribute in
-- 
2.43.0
