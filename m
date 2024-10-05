Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047877njb;
        Sat, 5 Oct 2024 08:26:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWiXL5OAs3mTP6p6glu91XJAbydAuZPKkxB7gpYIYA45VIZ37mWffS2rbak7GHD6bXuj13QrUPoAKTC2A==@linaro.org
X-Received: by 2002:a17:903:2291:b0:20b:b610:bd06 with SMTP id d9443c01a7336-20bfdfd323fmr85655015ad.19.1728141968841;
        Sat, 05 Oct 2024 08:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141968; cv=none;
        d=google.com; s=arc-20240605;
        b=OAcL9WLJ4pqsbIjhzNqIqNVcmYoXuToGm5FFIAV4kjh4L1iQsu02CAVDTMLdZdJWiD
         mLUK0JwGHpcP16ReIC+LDdoxZIJ3T4hBe56TRi6LCL7iCk77CM/Yj+d3d27b6mYIG9/f
         ckY5CKR78YABREznGHEueUQuxsNQq6/TUH+ejLfdLBQ9CpoDkwDaDY3Tsbr+iIb7jtF4
         QaCQA5iLMGE2gI8joleF7kHYSg4ZINwRy8dcV4PviZ+L7VwHHW9fX0ZpvUx7k9VLQFPa
         0KMy8I9xgRn6nRur0pUsvMIMp7+zbURwAf/jrGizDhFfcaKHdDbn35qsQtYWEjPpKomJ
         etKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3KXMhwqlNY3FEn9X64ijA0SceY+BOiTFnpHj8/s1p5o=;
        fh=gctxAqe/mXaUWYcgX9G/9QFG3hyRUyDRAtlWO6UchWY=;
        b=cxMwZg56T+gPE8ZewMftNJo2tTKUWd293G+ZxNEmMYxbXykZvmioWO20GYR+iTmHOY
         0BWNV90AFNCYsWB457/IX/e7AAcPZ7ujvnZu6lBg5dvIAmpc9PQKzO2d7fsY4mgmkfte
         tXVatrcUqmcc9wgKxifo94963pqtWRf8qohdpi7/cPlDc+CF0eF1p1uvlvq6bmN8JVdz
         KfwAZoIQP9FxBa6dUUSbnDyZOlqhAbLZH1WcTj1OawMbPKoGFhwFNnAx5QlzO47d46hc
         catgSsvnJ1CJmcYCKmSXCPq3t1htpJ25AQkY5tEw1fANUFmCFSZmEyigzdbNJaq5Wwxz
         i5oA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LytzGcNC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1388bd21sor13774095ad.3.2024.10.05.08.26.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LytzGcNC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141968; x=1728746768; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KXMhwqlNY3FEn9X64ijA0SceY+BOiTFnpHj8/s1p5o=;
        b=LytzGcNCJucWiWAMIPXxcFQBYyZAbhEF92rRXw3s2vey2tkf3ZUKPK0R7ZdUcmA3W6
         HtmnflffaNSLSPeqtbn3lbTiWYNT/1RXediq2ddH3OYlY1k3IIwG3fyq4AaiyzSoNhxh
         NVqt0IMUSVd8muoNndKc1a1p2YqBN1fou/juktRj8NRHODwjTwi+2Yq9bzRribKpNWCv
         TwMMYt3oG/3hhvw4G1AVTJcIb6C7XDhsc5rqatTmAasXOVl2/DKRLo8WmWH6okbQzF5c
         ekP8M6IxMGH8rAFEm8dudx6P70CqIHHg+iktlEqMvD++43TwVntNOaViOy20NmFr0jOh
         CeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141968; x=1728746768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KXMhwqlNY3FEn9X64ijA0SceY+BOiTFnpHj8/s1p5o=;
        b=RqDImGzwci+xXazooFdjhHoWO1pR5AT9gmZCEW78Yh69evAqyzTbSTZCkBP2W49d2/
         v3wZ1dS6JJeU1TZM3VrlpzJAKWLEH+EjA5w+dwRjOio1fkdyHYZhJ5+jC+4/BDo4DewI
         SEY/73LF5J2DmeI3wjSIBZW2vQrRcNOK0vWKa48gRWPeUk5K+ESyIg0/ChwCJzcvXuB1
         NZa9GNCDsrIORxQMvv3xiQVrWsVoMxr5xea9CH0HJZg6qh4swa5T7MDXxbsBmCegTuPA
         PWQ2sJjbv9QTa/SCFbEhaCC5GS/cfnS/UyVEOqRvoFnTKXmXp8DJiKeFZdbMB3nSTnok
         NBrw==
X-Forwarded-Encrypted: i=1; AJvYcCX6gEUZ/b1CbceR3oq4K60CacNhTEKIUE86AEXbBdjpCcI4sdLT9myQ1vynv5XtluQ/Ajj/H0R+3HiCbA==@linaro.org
X-Gm-Message-State: AOJu0YwQWF3PnLzi14mJUQziDwypIH9aXFQ2hBLgvuV+sIaCcI+SCqsZ
	jVv2H+IIrKTqBNKSMSkiYFJy+dFvW4j8p+DXJQ98P9uCC2mLOJm/8Wg4oaW2pwZXnA==
X-Google-Smtp-Source: AGHT+IHoXvMFOA7jUAYxgFVahS1q2i1bg/ajDF/sY9Oymkr8mht01U8RsKNrUl4cngSkkvOkcrfljQ==
X-Received: by 2002:a17:902:fc4e:b0:202:4666:f018 with SMTP id d9443c01a7336-20bfdfd2693mr105297675ad.15.1728141968397;
        Sat, 05 Oct 2024 08:26:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 16/20] target/arm: Pass MemOp to get_phys_addr_nogpc
Date: Sat,  5 Oct 2024 08:25:47 -0700
Message-ID: <20241005152551.307923-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: y/uTxkBXTufs

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
