Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979445ejc;
        Mon, 22 Aug 2022 08:27:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a89:b0:536:5dca:a673 with SMTP id e9-20020a056a001a8900b005365dcaa673mr10191813pfv.71.1661182069582;
        Mon, 22 Aug 2022 08:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182069; cv=none;
        d=google.com; s=arc-20160816;
        b=s7E5egRNtawwMOAYcS2Dk8C0BWRdI98fLSgwUeGJ6v1DMeMpXwHFMiG5i0oENgfz37
         KUqr57NmoPz32JGrjFHx8aaXTb0QmCEGNU4zZULkJddngC2bwEIbQtauykMls9tbv9w+
         qk2FfJb6XMccxuRpBPJ6k3afrgL5j2uzgCJQN5yKRMvmDt/oAtnKK1gpC0fPNItfcXZM
         74q7ijW9zHgVKhNLl2+FXc/BNB8DP3bX58Za+5Z6UrUJ+9eAasYQ2OdnTbDwKj+ruZ5O
         A8PONLA8uCnVVQjMJBFSZX6Rt93myY4Mx4eUlk8hWIsy+QBM0iDSd0mbT2N3amLLhZRl
         q1cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=J9NKDua5mjCfaRrViIxkitiohmvoSvAqzV9syZybY5w=;
        b=OsK9CaMt6yW5H7BeMppfykCT9zzes7A4Z/s4pURDZmo+8KOa5sQJYJ78UieJE/tGeB
         YiWanAqiF9uhH6UXLuTiv1gSb+dEnIlWvuTgZH74v+DFNVLPQiBWNaIJbsGyl9rvJNcQ
         CElKExJ4SUS4QGy55If+Baa1geCYtGbxyevyvQxeOBfueD6VH3S+g2pM/tWBH3eAp/8R
         Oj4Zeskc3BL0/zTqi04anxuUGIBELcbTEy/9NyT2Xsqfy19XWh2sQ/YkZsuVUD07TUji
         46rcVlXz339zhtrL6v1hgCkkvAQ3NV0TvuesW1XWAW60jwLSbr/yVLZQ+011byTz0QN5
         2bHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ys4tnb7K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f80-20020a623853000000b00536c73dd5b3sor1102141pfa.47.2022.08.22.08.27.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ys4tnb7K;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=J9NKDua5mjCfaRrViIxkitiohmvoSvAqzV9syZybY5w=;
        b=ys4tnb7KNFr9y4Jp2QDvFBy0no4nD1ZKcUgXYoxVUGPc4khNK1ZE7mUA/ABGhczfQF
         V9n7VSzZ3hQZHblw3nthVDO4/tkxbxCLIC8w+xxa/kqZFmTaQsYyr/BogaLIVc8y3uSG
         55RY1aBcAmn4Zpy8TZIapnF7ResxzAKaL0Wzx1y9YOERFEwmUEZSc+g0F61ezlRIxC7l
         nq6EilMuPM524RFQVDZSn+MvqIdaAdXZBpBzJZSWPLKG8BfaHkPqqMgBweVylVduuz9l
         i2ZIWgLXN0yuMA6EMHzmVL7xdAe9uTk0cM+ZPqgRJh8snIsxIJoicKOueRwbQHNAlAin
         53YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=J9NKDua5mjCfaRrViIxkitiohmvoSvAqzV9syZybY5w=;
        b=I49qrbkI2A2Sg06eKWhlsopLXNb/RPRemT6EtSphoJUBl4IoajwyZzs3xXa/s4xXJa
         tBri+cfnt9AqDI5xkGFthuDpcZT90AFnwDrSeOeKKOAFMnAj+Z0LVauHz5zM6rrg0cd1
         9aWd55ZTfKZV3q/LrnTi6KTnxf1AJ7X1yEy4L0puhVM24MixzC+1rI5IzjvIr/613dWL
         rIUGHXTfaHFLwbq0EYCbE1FqFTXGOz662Oyy33bQngUCRAjh77QIZdLCsSwZnKZJv758
         DHlXK8OPZbjgEpeRbxS530CIcgMRWrFXwFpOu32S0l/LRaWvZ84WehF836oZ0seW62tt
         HmGA==
X-Gm-Message-State: ACgBeo2n7hEtlFhnO0fcIVxbUWmLiPSZhbUHc6PnW/4H+fcQutnAitmZ
	ZFvAwebgkeNKbGp6rCFy1oxoB8Xj
X-Google-Smtp-Source: AA6agR7eylNrQ+mnQ/XK62i/vXlBRmYvUmXJNqaxQykuzqoAN68xuAqA8DdWTHqmJg7bAbRNHJgOHA==
X-Received: by 2002:a05:6a00:2789:b0:531:c43:6290 with SMTP id bd9-20020a056a00278900b005310c436290mr21269140pfb.21.1661182069096;
        Mon, 22 Aug 2022 08:27:49 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 08/66] target/arm: Use GetPhysAddrResult in get_phys_addr_pmsav8
Date: Mon, 22 Aug 2022 08:26:43 -0700
Message-Id: <20220822152741.1617527-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: W3OmTbGUDL/z

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 3dd6708eee..225405de3b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1967,8 +1967,7 @@ void v8m_security_lookup(CPUARMState *env, uint32_t address,
 
 static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 hwaddr *phys_ptr, MemTxAttrs *txattrs,
-                                 int *prot, target_ulong *page_size,
+                                 GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     uint32_t secure = regime_is_secure(env, mmu_idx);
@@ -2003,9 +2002,9 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                 } else {
                     fi->type = ARMFault_QEMU_SFault;
                 }
-                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                *phys_ptr = address;
-                *prot = 0;
+                result->page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
+                result->phys = address;
+                result->prot = 0;
                 return true;
             }
         } else {
@@ -2015,7 +2014,7 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
              * might downgrade a secure access to nonsecure.
              */
             if (sattrs.ns) {
-                txattrs->secure = false;
+                result->attrs.secure = false;
             } else if (!secure) {
                 /*
                  * NS access to S memory must fault.
@@ -2028,17 +2027,19 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
                  * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
                  */
                 fi->type = ARMFault_QEMU_SFault;
-                *page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
-                *phys_ptr = address;
-                *prot = 0;
+                result->page_size = sattrs.subpage ? 1 : TARGET_PAGE_SIZE;
+                result->phys = address;
+                result->prot = 0;
                 return true;
             }
         }
     }
 
-    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
-                            txattrs, prot, &mpu_is_subpage, fi, NULL);
-    *page_size = sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
+    ret = pmsav8_mpu_lookup(env, address, access_type, mmu_idx,
+                            &result->phys, &result->attrs, &result->prot,
+                            &mpu_is_subpage, fi, NULL);
+    result->page_size =
+        sattrs.subpage || mpu_is_subpage ? 1 : TARGET_PAGE_SIZE;
     return ret;
 }
 
@@ -2414,8 +2415,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         if (arm_feature(env, ARM_FEATURE_V8)) {
             /* PMSAv8 */
             ret = get_phys_addr_pmsav8(env, address, access_type, mmu_idx,
-                                       &result->phys, &result->attrs,
-                                       &result->prot, &result->page_size, fi);
+                                       result, fi);
         } else if (arm_feature(env, ARM_FEATURE_V7)) {
             /* PMSAv7 */
             ret = get_phys_addr_pmsav7(env, address, access_type, mmu_idx,
-- 
2.34.1
