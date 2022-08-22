Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979485ejc;
        Mon, 22 Aug 2022 08:27:54 -0700 (PDT)
X-Received: by 2002:a17:902:a982:b0:170:d646:5851 with SMTP id bh2-20020a170902a98200b00170d6465851mr21430119plb.134.1661182074718;
        Mon, 22 Aug 2022 08:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182074; cv=none;
        d=google.com; s=arc-20160816;
        b=crM2Hnga6zNa+F0mCVniBaUhRfEKDDX0gxq2DVpuQ4lRzlS0HiWZxTqQTrUQlmqjJ9
         CaAmwX/JsL95VpxihUlNl0ZT1tLhTFClD+hKAdEZAe6wFp6htSVdPPUAsito/2+hLTSR
         S/C6e16Y/JiXorbbqS9bGD4ialR+HHPLCrkBHqeDrtRn9SloKAISPRHxP/6pEmLCUm2t
         Edp7uSwnZlaCAALX2ScPSQACrbCQLt6gSL0EhIInvc9/X8nTyOzUO8adZzPcB+sywpsR
         FvtQMZwQYFQiawkhckSU/8cmA8oPF7n/1zROjZ+OMnWUcw741+ph870a4kSrKdvWMrV8
         RGZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BX+4xB/VDWHk38SQNes18SXGBzYUd9d/yvot5DujC+I=;
        b=F9sBC964CNNank9ObRozDxlxUtpleytNDmtlhuecVYUsXNeD6+JO/RYWMpk3gnUtHG
         uF7bWsyED9HdGBZI+jqcXoM7cYTSapIZ/Ocpgn8EJREAAhq0Ih9+SFb2vREJamv2evOE
         Kmm3XST+xYX0TzBMvwnGR5F1mtJOECHMtwkMYd12RuigdG1qKVWUU0PWl/JqcNqm806H
         Z4dwJ2d2BdHPZLgJ2q0apBlssargRGSCc8UFozs/pzkkJnUcn9Yx/ttQsqWsFEnb1tOK
         OYCiJ7tM7SyGIispWjQUqeE8EpEFMa2HOW28G5JXDwgp76cdZYgBhtjucPDo2co5nMin
         aTIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n6ywuIDZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t10-20020a170902b20a00b0017274c962dasor5248363plr.137.2022.08.22.08.27.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n6ywuIDZ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=BX+4xB/VDWHk38SQNes18SXGBzYUd9d/yvot5DujC+I=;
        b=n6ywuIDZmU/esoI0SslXsFkFgnj4YQVQmtEk90igcrxqCbjK0fCmqqNYYuJ6i/PrV1
         8xZtI3EGQ9wx979Ls7pyQr8xBd/5QLYZ29wh0vYJOGCv3Sijqg3eO9hP9Xc+CSMblkp4
         pURLEQxeH28HF678GhvlvV6WO6pZ+ieI2PMynqXippJTaaEFGixlDoRyRV1vpf5GheR1
         7PME3mapuHLKCGBKNbJOGncy4mt7UnYBgFTCcJm1z+YlQL2yb2X22lU7x3dh5vcdhYDT
         tBnW1m9vZwcVot3nOjfUrGmOveSy0sIC0Ygtd4e6vtRldKghttfSqvdKEW/3sKEL4kWr
         2w4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=BX+4xB/VDWHk38SQNes18SXGBzYUd9d/yvot5DujC+I=;
        b=wZh2YHjuevEmH1IU5MxGGdLX7CnL4hHeW1I1JN29bunNBk5g3tmbDfUAQ967vI7B76
         c74WiGpqv0gHu3Tk+nyFVh1xu8lPp+pmA0Umy3vH/Uos3PJ6r4yc9121spHHhFID6Q0d
         XBVjK4ADB7hrC+q/HxOMoSQ0AaVt+PMYVJzPH7aWMEx5VeAdXoV8EUDOYR8YzRt91MhD
         OpttPwGEUjyJq7jMFiOVPh/KDJhF1591zZOql+hcCjQTHtVAuXsUwIg7JDNApCbRUDr0
         UYOqDyHonvWVKtFs0Lr0mtiabPNpPwr0Bf/i/rauD9p7bBaggbffaxt/ypMhSbPDNm6R
         FeDQ==
X-Gm-Message-State: ACgBeo0Z4WbcmaLNo3CCEFfkFaVcBFsnbBcHqdF7L9kUPajNS7oOb4tD
	42+Oquv3fyG6Juswbzag/Vv0O9o0
X-Google-Smtp-Source: AA6agR5o5amRR0ROpZ3ZUzi54uBGG+9Qd8WB+aVGNz9DreFDCusFuroLq38ojCGJqRK/AauRxJTmiA==
X-Received: by 2002:a17:902:f688:b0:172:f892:5c3c with SMTP id l8-20020a170902f68800b00172f8925c3cmr1906447plg.49.1661182074122;
        Mon, 22 Aug 2022 08:27:54 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 14/66] target/arm: Add is_secure parameter to get_phys_addr_v6
Date: Mon, 22 Aug 2022 08:26:49 -0700
Message-Id: <20220822152741.1617527-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oUtTn+BuB6Jo

Remove the use of regime_is_secure from get_phys_addr_v6,
passing the new parameter to the lookup instead.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4609278b42..a6880d051b 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -533,7 +533,8 @@ do_fault:
 
 static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+                             bool is_secure, GetPhysAddrResult *result,
+                             ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
     int level = 1;
@@ -556,8 +557,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -610,8 +610,7 @@ static bool get_phys_addr_v6(CPUARMState *env, uint32_t address,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2508,7 +2507,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                   result, fi);
     } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, address, access_type, mmu_idx,
-                                result, fi);
+                                is_secure, result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
                                 is_secure, result, fi);
-- 
2.34.1
