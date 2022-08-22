Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979531ejc;
        Mon, 22 Aug 2022 08:27:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4ad2:b0:1fa:f9d3:df64 with SMTP id mh18-20020a17090b4ad200b001faf9d3df64mr14198697pjb.19.1661182079103;
        Mon, 22 Aug 2022 08:27:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182079; cv=none;
        d=google.com; s=arc-20160816;
        b=fyk8gLi79o8nhVeDsdvjYD+AWMsxxr7Z6POsf5URm5FBZtOSTPmCXwK7GX8NafIFsM
         xdwFvu0FzS9xlR4hOi86+/cWPDK1fq4G1oLOShchUmafhV5/C+DqH/+X+tfkeuUC7G/6
         At/V0JQYcQac8eZmku+7tXRIIugP0cQF4S+QldOdHakusOS5IClse/PI0WDp11G0nPd7
         bRSJAObmjPFmqE16ckC5lPGOEh9tY1elG9xENJB+W8DETNv2o/VzPHiRUNjjKN+238+B
         sITqNUL9qogtodZOJKsA4gbXDWXPtxTxL6NarxrQnVfbAmCkmqR9gbOGgizj58czOp7m
         dEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QVvH22x8bUjcLYNQ/ECfXWnYzFb7GNF185+z8yEomUw=;
        b=fZEp/4jO9sUmBqV1ffgSORRflpDqN3htNHJmSjVSvzmmR4iCgqg90WoKJYKO50y7sm
         kyzLdOahdZ+7ZuUgc3JqJb0m/vplLr7pKlaQbonE5LRiww3otq1kQIr8kQ38EOm+lQ/B
         aTHIVxoTJ7xFX418GTqlMD1xHbDo3nODR+4chmV/0zXR9SIPIt97mgKTxcJ+KyBzUggs
         XlhzlJ6QwP/ACvJsXFtnNrn2PiRSjopgwJw80F99WrtKqxr0UT+QvQ3uHuyQ1t9dVnqp
         t6IAarqJjbt//4PaouPfoxHI6QXbtDDyW/yt/EMc9JCDofIZycEyu2QzJAwq1GIPWiDz
         Jv6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W3fjhv9/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z5-20020a170902ccc500b0016d6b468e09sor5020652ple.11.2022.08.22.08.27.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Aug 2022 08:27:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W3fjhv9/";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=QVvH22x8bUjcLYNQ/ECfXWnYzFb7GNF185+z8yEomUw=;
        b=W3fjhv9/KyxmUPFnf2hroekE3ORZzXOYdutjwT8D4mxUfi1z65uahKUMFAFi2QO5wI
         XvdGGEQUJPsPZCPYkIE0DBpA6jzanqsIMflTPPvQZJ9Dz8qgcXikdCiiKj0UOyUlklTp
         sY36A8jFkb8AhExryQxgv+XEXbyq+KZLQWCZvlcUa/k+POBkMxg6MmvmjXN3aRxU2KYZ
         5BFcYRWi4m+//Rj1xsN0PN5zVJhpJ1kG+jwzdoQkm0TLYkSTOUUscl7Xqn571OVSTx0p
         tkNIeeOSM4dfxtwl+PxbOzq4FbiNIlkPtyjxcx8D9cmTj0qcyeaiyKPyuiBaftAOGsSE
         O9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=QVvH22x8bUjcLYNQ/ECfXWnYzFb7GNF185+z8yEomUw=;
        b=LNYcb14CQeWk+yUeufbDh0zorZRQ09ux8mOmkIU794Wf7ADEgd63v8ZFYa7w5VmS/d
         8bMUT7Zc01/DFw9IbLrm/eHAB2DWhc6zL1wbTWuEHAhjmgMFmAXjmD1dzlPJO+THnkTD
         fFoWtPeQhCgqiFPnyvsTzqcemG5PTJjx8D3Bb0eevFzNp5aDGsKWPU9EMa276Ze1rJDd
         jFWLlkoQ3/MEKYlxbBFwgBoNgBsg6fZVNcuJV/Kd4XYmVfChZEBW1utvzUkKeM2ZyU/l
         ttmQbo7i7peX7a2OMF8OdEDkZQqVWRTcOetE7pZKKuGnioS7jl4ftehmarhsjsQwnXo4
         sCdQ==
X-Gm-Message-State: ACgBeo2QnPWc7S97mqTFgW+1padcl/guoScd3ydG9mtFV8GJ8Je3uS0M
	VsJvBScNzhfatMw1FgZJOi3PaDEL
X-Google-Smtp-Source: AA6agR5Wv22w6M4Vg3YKjo5SCg0RabCS3SqyjHvhic38xPgSSuAPhCyXDYkuRHqzncHmewrHJIz0kg==
X-Received: by 2002:a17:902:e84c:b0:172:d932:4b11 with SMTP id t12-20020a170902e84c00b00172d9324b11mr9897950plg.125.1661182078683;
        Mon, 22 Aug 2022 08:27:58 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([71.212.157.236])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 08:27:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 20/66] target/arm: Add is_secure parameter to get_phys_addr_pmsav5
Date: Mon, 22 Aug 2022 08:26:55 -0700
Message-Id: <20220822152741.1617527-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ghUHEOECySCU

Remove the use of regime_is_secure from get_phys_addr_pmsav5.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index eca7763367..c338e2324a 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1350,13 +1350,12 @@ do_fault:
 
 static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
                                  MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                                 GetPhysAddrResult *result,
+                                 bool is_secure, GetPhysAddrResult *result,
                                  ARMMMUFaultInfo *fi)
 {
     int n;
     uint32_t mask;
     uint32_t base;
-    bool is_secure = regime_is_secure(env, mmu_idx);
     bool is_user = regime_is_user(env, mmu_idx);
 
     if (regime_translation_disabled(env, mmu_idx, is_secure)) {
@@ -2420,7 +2419,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
         } else {
             /* Pre-v7 MPU */
             ret = get_phys_addr_pmsav5(env, address, access_type, mmu_idx,
-                                       result, fi);
+                                       is_secure, result, fi);
         }
         qemu_log_mask(CPU_LOG_MMU, "PMSA MPU lookup for %s at 0x%08" PRIx32
                       " mmu_idx %u -> %s (prot %c%c%c)\n",
-- 
2.34.1
