Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979411ejc;
        Mon, 22 Aug 2022 08:27:46 -0700 (PDT)
X-Received: by 2002:a17:903:110c:b0:172:6a39:436b with SMTP id n12-20020a170903110c00b001726a39436bmr20440192plh.131.1661182066434;
        Mon, 22 Aug 2022 08:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182066; cv=none;
        d=google.com; s=arc-20160816;
        b=UeMqz1/VFPIHI654SuJQXqwQQBYoXtdeMoNpSJ6Hw4ynzcgQdCoyucxg5OG2Ni97aS
         xFd1izChi5IOY3mpU+DxDUy4atGRCMYX60OAhepBzgcL7vUPG4hwpTtamZBtrYj2PiCM
         okD4Legca2IX7qd66uVKV+Tv2YiBmS6a4wR3an9CanoAMCHwneTFnwVRbTPyKUUjvsjl
         s9Eb8ArW8e4AsXEBOQmBMQEZN7hsZUkLzCqimtnuTnm3GUVD3RQyl87V+F/SUfI5+Bnk
         DI9Xdz62sntPkijG00TWMPiD+SE16a2Y1QSu/3DUg7hSvan+cIbGspvHQHVsar5GkKNu
         BTQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=J5SoQylTtJu5qfrohns44hEwW2yRQ/CAKj0/Q0ls+dE=;
        b=AQNtfEUTDwriZgOG1rOX4tBIZs5m1FTNpZSreKbu5FXWM1/l2KOD4e1scn78HQ2k7c
         ZeOJXJiBKVdK7FIhbsj8uUF9NoKanG7MeOvE4Ooro2FajmDoZlXewBT9VwXDcJESOiVs
         hDhD5UhAoPlfP5J7vMdEzl5BaNqo64EjHz0msIM9ZlPjyNkEvfgHozpj8J7BT6N0pPSk
         5IlLGhILhkwboWFV/sMg/qh0vs473BAIS3gMlABa9gw70MsHg8cvMTzt5S5jkGmB3tkN
         YDp/i4tyxHqBI00OIXsPRIATpo3TN0lalVx7dIOgevAcmP5MnspjtAQUNFjZ1RaLuWsy
         FJvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNMGG2mV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u3-20020a170902bf4300b001728ae55776sor5042155pls.170.2022.08.22.08.27.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cNMGG2mV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=J5SoQylTtJu5qfrohns44hEwW2yRQ/CAKj0/Q0ls+dE=;
        b=cNMGG2mVmMqt/RMikdzproCU901gaWsITpCQoomHArQanf0RtCOkGguhoPMyDRD/gA
         ckI5SeSGB4U96IC3oENNp2vPqkntLbknK8fIsXgWypcW6fslYDGRnRHSa4TrDTLZUBfh
         lTvZ71Fv8cNXyUNddYR8JuKIhfWrisIolr/uFnx1kWJcnabEXbmZPSJ7v8PbVUp5ukbw
         OQMElfz5Fj/4Q25VD4qupAhDrW5Xg4LaUJ2Mnn52Sw+cSnsfyRGqeC5PdGbfCOUHxQvG
         EUj7bwO/pcVDwh7NbllHwx+SawoUvurC0vWO7VSGJtUu2hjwvacFWH/7VojJlljskHxk
         M3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=J5SoQylTtJu5qfrohns44hEwW2yRQ/CAKj0/Q0ls+dE=;
        b=CsCCOIgVTWp+ByBd4+Jn+ilWCHKVFqOSXS72BP0XL5iQyopBfSFq1rRPTJemI6kjnF
         D7eCV29lqQ1iV/YFXxpgp9zc0MFj5JZwaY6pdcmau7DVtkoI/R4OrQ2wNzFoFY78ta+v
         Sa5stbta/tD3IK9WbwuTrz7HCQM02p2Nk6Tk5GyCRTVbEQB2Numy4lv7i0hWL+21brLy
         UqpTMf2bVP9ftjdrfEKV6pWlOsZMF1kkN9/iVn7Hv4o5x789wuUy6g0bWUC+jjQcHixS
         0YO+J/6MOKqIPlZBL570JGY3ZK4WrM4p2+l1fdqLP7T6f1Mk5Z4tC1OOjkTDW3Pw1JGA
         rzFg==
X-Gm-Message-State: ACgBeo0655Nek9JdY2TR/MkQ1GgA0dImXniwC7ms5DB2cNNGktyh4Cpc
	eKNm1+zA8BE3ln+0WiuanS/Cv1Xb
X-Google-Smtp-Source: AA6agR7QATCr4gA9aiDpAeK6ljldBYtQbENUkANKfhhp+DNP3ecK6kXfreFeXS3HfOjw/fp354POWA==
X-Received: by 2002:a17:90b:4d8d:b0:1fb:2e53:5079 with SMTP id oj13-20020a17090b4d8d00b001fb2e535079mr6033723pjb.175.1661182065921;
        Mon, 22 Aug 2022 08:27:45 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 04/66] target/arm: Use GetPhysAddrResult in get_phys_addr_v6
Date: Mon, 22 Aug 2022 08:26:39 -0700
Message-Id: <20220822152741.1617527-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3YGoFsotGFN2

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4f248f6266..4961bc2f9f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -536,8 +536,7 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             hwaddr *phys_ptr, MemTxAttrs *attrs, int *prot,
-                             target_ulong *page_size, ARMMMUFaultInfo *fi)
+                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -597,11 +596,11 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
             phys_addr = (desc & 0xff000000) | (address & 0x00ffffff);
             phys_addr |= (uint64_t)extract32(desc, 20, 4) << 32;
             phys_addr |= (uint64_t)extract32(desc, 5, 4) << 36;
-            *page_size = 0x1000000;
+            result->page_size = 0x1000000;
         } else {
             /* Section.  */
             phys_addr = (desc & 0xfff00000) | (address & 0x000fffff);
-            *page_size = 0x100000;
+            result->page_size = 0x100000;
         }
         ap = ((desc >> 10) & 3) | ((desc >> 13) & 4);
         xn = desc & (1 << 4);
@@ -627,12 +626,12 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         case 1: /* 64k page.  */
             phys_addr = (desc & 0xffff0000) | (address & 0xffff);
             xn = desc & (1 << 15);
-            *page_size = 0x10000;
+            result->page_size = 0x10000;
             break;
         case 2: case 3: /* 4k page.  */
             phys_addr = (desc & 0xfffff000) | (address & 0xfff);
             xn = desc & 1;
-            *page_size = 0x1000;
+            result->page_size = 0x1000;
             break;
         default:
             /* Never happens, but compiler isn't smart enough to tell.  */
@@ -640,7 +639,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         }
     }
     if (domain_prot == 3) {
-        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
+        result->prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
     } else {
         if (pxn && !regime_is_user(env, mmu_idx)) {
             xn = 1;
@@ -658,14 +657,14 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                 fi->type = ARMFault_AccessFlag;
                 goto do_fault;
             }
-            *prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
+            result->prot = simple_ap_to_rw_prot(env, mmu_idx, ap >> 1);
         } else {
-            *prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
+            result->prot = ap_to_rw_prot(env, mmu_idx, ap, domain_prot);
         }
-        if (*prot && !xn) {
-            *prot |= PAGE_EXEC;
+        if (result->prot && !xn) {
+            result->prot |= PAGE_EXEC;
         }
-        if (!(*prot & (1 << access_type))) {
+        if (!(result->prot & (1 << access_type))) {
             /* Access permission fault.  */
             fi->type = ARMFault_Permission;
             goto do_fault;
@@ -676,9 +675,9 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
          * the CPU doesn't support TZ or this is a non-secure translation
          * regime, because the attribute will already be non-secure.
          */
-        attrs->secure = false;
+        result->attrs.secure = false;
     }
-    *phys_ptr = phys_addr;
+    result->phys = phys_addr;
     return false;
 do_fault:
     fi->domain = domain;
@@ -2516,8 +2515,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                   result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                &result->phys, &result->attrs,
-                                &result->prot, &result->page_size, fi);
+                                result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
                                 &result->phys, &result->prot,
-- 
2.34.1
