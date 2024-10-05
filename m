Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147708njb;
        Sat, 5 Oct 2024 13:06:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVpJkTiaD6IsjuuCgjz13aTisGfy+Xu7mPqBhG57bOLzDA2pDZjLm7l63/QRJdrQDbxlqS5alTT3X/hNA==@linaro.org
X-Received: by 2002:a17:903:2307:b0:20b:75ce:cfb6 with SMTP id d9443c01a7336-20bfe023d1cmr135552465ad.6.1728158777062;
        Sat, 05 Oct 2024 13:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158777; cv=none;
        d=google.com; s=arc-20240605;
        b=Pngado5oB4T2i1GCh5FaVhPIHoNaqqW1Zl9w1k8NREQTQ9ISkBlfRecYInYEaQVPjV
         KBGSioGRK2lv73k4iqqt65GGUHUK4eCqr5J/uay+SZurz48Lj1Pvg8I09za4ujmxh9yu
         ocrzjBLSrqnJGzFgS4w50Te4ziPpUOCBVXAX5N1DRnHo2FFo3GyNgpOV6dipLNcwAPSZ
         EQQ6eDD9hsFlHIiHGZ7F9CboUtIya0S3nSXAz/KPs5NQeJwYYDV1n4OcnTk1bobSuPJf
         yY9tUEjz5Vhbc3nDvp/Q7/lGT/gcSIZN/aO4jL4bMC7uBJUXfg1VcVWab1rtMw5gRqTA
         xg9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3KXMhwqlNY3FEn9X64ijA0SceY+BOiTFnpHj8/s1p5o=;
        fh=6QWlMZT7Sd6iFg/w14ODbm0FGTeujKCDZe6BWCdAjaU=;
        b=O83O95Ova01XS8jemx+xdrVxzDACc1ou16Bq7EcxLWpZgcNAGhM4SRMwrgwLaTk1K+
         3fiK2gYRHNLsXSQeUjckGuL4X/PKtc7gjHMq4vzl1P1LtbUDu+Be3f/IHt5CwE3Lt1Xa
         WMCfBrd0MX4PTInSizn98Fsp6ZkcjMk+Ci28sKohBZLqe5KW6Ox9bcnC6Nd3Q0yQcvxu
         b73pObUOQZOkJKGzf+6qgH/YtRtmBRAdOGMs+stkKrZ4bezmWb2iJbfMJepk3AqHXj9+
         lFsom0ckt6dMT9tYjl0oKyJeDs8dFqBeFrVZbpCmGm68y7A+EpULVZPeQjXt1B0M7ip2
         pS+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FIvcJFcf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138b46e8sor10435095ad.2.2024.10.05.13.06.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FIvcJFcf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158776; x=1728763576; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KXMhwqlNY3FEn9X64ijA0SceY+BOiTFnpHj8/s1p5o=;
        b=FIvcJFcfGSKGGOuKv1PxbJIHqXHqxiZ78TZCOA5GIDktBl9Wmf+j6/eUvVLC0kFPBE
         y6NTRqnfQeo/2Cg7JZcm4MfnF8fIklwmQhk+Yx8JKXl4K7JWtfJCEq6RxHJsJZRk07dS
         UTHPQmupn/H4nksvrf7VbF9xUaxduwzMg2mgtuRFJPGbrGlZze/hjkw4h1oqt9gySd/d
         Z0avGun/u7x8NR6ptOyUDbhJNASbbJX3Y6M4F6tY+bLjmVwoIgAZn9nAHsCl68zlZjLh
         Yu50HqctATsBfKkSJvuHSy2dKR7FnQjxpRUgzb5mETg3kruqu6at4ocbStd3m69gZIMn
         KRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158776; x=1728763576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KXMhwqlNY3FEn9X64ijA0SceY+BOiTFnpHj8/s1p5o=;
        b=nzkaYJAkWzigV72FV4f+A5NPCzCBw2AbYwqLQTxFkIELzWNNih0oGc1JVPhOBPBEeo
         MG7SwdjgK+6oh7RSkDDoOBtZMdJbyD73l7nNwYNhKYLqzCJ2TH0jj3llUPaS26Yprn32
         /JRVmo2l7OG7SEQp9mS5R52uHoL0hLQ4wFN/Tu1UTHzBrhLtbUrpocYFyRFMybzMdc85
         a5tCnr0XBkKEvOu7eRQ1mgqnN0YOgbeCSEm//DXQnbxaznu6HFrvaqdd/DxB4ydglaod
         Uz8IfR32vmgXc5EIHDGYyKIYxDzTzKrA7GzgfdqVvywy4BFvy0CiXAbGenWwL9FfMYZ8
         vvdA==
X-Forwarded-Encrypted: i=1; AJvYcCVVjfmX4hu4tet5IMQm8/IiB5+JAuRQde9kPM5nBhXSjcV4WwcWVFpo/T8YiPElh2wBrhvsUJzOReClHw==@linaro.org
X-Gm-Message-State: AOJu0Yx7OyPbHxPpkMNSgl1/Q4aOCZLyAAgu41nKeoDQMv+cFZEC3ojT
	lfrss++CuyvTaGh4r68JDx1hZwNalpPoAsSRBkVrnLhRbxDFFQXpAYaNUEuj30w32w==
X-Google-Smtp-Source: AGHT+IEc/YiENR//GQsH6NJPwFKZle512StiSwrb6jw4fVSQbkD7P+i/ct1jx2CukoHpWHGxpya25Q==
X-Received: by 2002:a17:902:ec84:b0:20b:6b68:c635 with SMTP id d9443c01a7336-20bff20ca7dmr104384815ad.58.1728158776618;
        Sat, 05 Oct 2024 13:06:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 16/21] target/arm: Pass MemOp to get_phys_addr_nogpc
Date: Sat,  5 Oct 2024 13:05:55 -0700
Message-ID: <20241005200600.493604-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: MiP5bxxFXKCZ

Zero is the safe do-nothing value for callers to use.
Pass the value through from get_phys_addr_gpc and
get_phys_addr_with_space_nogpc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index e92537d8f2..0445c3ccf3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -75,7 +75,7 @@ typedef struct S1Translate {
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                 vaddr address,
-                                MMUAccessType access_type,
+                                MMUAccessType access_type, MemOp memop,
                                 GetPhysAddrResult *result,
                                 ARMMMUFaultInfo *fi);
 
@@ -3313,7 +3313,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     ARMSecuritySpace ipa_space;
     uint64_t hcr;
 
-    ret = get_phys_addr_nogpc(env, ptw, address, access_type, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, address, access_type, 0, result, fi);
 
     /* If S1 fails, return early.  */
     if (ret) {
@@ -3339,7 +3339,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, 0, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
@@ -3406,7 +3406,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
 
 static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                       vaddr address,
-                                      MMUAccessType access_type,
+                                      MMUAccessType access_type, MemOp memop,
                                       GetPhysAddrResult *result,
                                       ARMMMUFaultInfo *fi)
 {
@@ -3547,7 +3547,8 @@ static bool get_phys_addr_gpc(CPUARMState *env, S1Translate *ptw,
                               GetPhysAddrResult *result,
                               ARMMMUFaultInfo *fi)
 {
-    if (get_phys_addr_nogpc(env, ptw, address, access_type, result, fi)) {
+    if (get_phys_addr_nogpc(env, ptw, address, access_type,
+                            memop, result, fi)) {
         return true;
     }
     if (!granule_protection_check(env, result->f.phys_addr,
@@ -3568,7 +3569,8 @@ bool get_phys_addr_with_space_nogpc(CPUARMState *env, vaddr address,
         .in_mmu_idx = mmu_idx,
         .in_space = space,
     };
-    return get_phys_addr_nogpc(env, &ptw, address, access_type, result, fi);
+    return get_phys_addr_nogpc(env, &ptw, address, access_type,
+                               memop, result, fi);
 }
 
 bool get_phys_addr(CPUARMState *env, vaddr address,
-- 
2.43.0
