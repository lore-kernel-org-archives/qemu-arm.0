Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047885njb;
        Sat, 5 Oct 2024 08:26:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvoyeH79x2a6jqz1M6KBAxZVRk1XHLshXCeBDtzrzqEJEUF4kF60bPWb+NLT1YaAiXFXIJMHfTSLZl3A==@linaro.org
X-Received: by 2002:a17:902:e852:b0:20b:642c:223d with SMTP id d9443c01a7336-20bfdf8045amr91374385ad.11.1728141969731;
        Sat, 05 Oct 2024 08:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141969; cv=none;
        d=google.com; s=arc-20240605;
        b=JsqVt564gnRZSXES/BgEBMyJseuNh1FYlqAt6nAZxbkPMTeLlSP38gytVAzsNpEv0D
         7Rz4sytVlo++2ktrWVPV+TFe3jFmGIdODdoY7B1auc1uduPwoS4v7RA67+IxSMUjRlfb
         mO+kDrSrGLAczZ/5bM8RJ7B76uddA632Pkc3HWZnMjfDMSbdWNy8cXC3e+LQsAfaiLc8
         NMZ1jHURIzTksowNrpre/8AxUSzE09q2YN9at6g15/ej5F/7rvvBwgFRui3TVEYBIkbL
         v19+INdLqBv3vITO0k7m0DigD6S4TN2bBfiobYK7LUhl4DNUPk/zBh4Kg7nW9vBEGQCH
         9bKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oB3S/z+Tf/YurYPbjZAkQ2iOmy2pkllXkguo9aONGm0=;
        fh=zjMwXqe4GeOZRFj9qJTXVi1rWKEf0k68RStQTRhDorA=;
        b=DaYgNFVMyzSgwYizZVf7yA5t9ZqGuE+/vw5Bk7sxAOTQTHvGkCOOWL7wU6gQZzdnvN
         vgun3bcfVxk7lw+k2rIVGmpOm0tx4yWBARrnHhKIrhqu2Lv2y4XcM+szYvoDDsWmjS0l
         33+eDydrvdbyMkYF1qhgMurpPYFo3N+PAYF6QV5Yf1CVm8fJvpqNf+BPEyanuQkPhwSv
         NqkEnPw6F/YzEltIRIjKSP/i4KtaFeWY7QfHo3Y1Wq1d9mjyv9gYeWW/5jVzKuGxzmKa
         BYbciA5CnZ/mTninnBa/LgNOwQtfzDpJ22rZbKdSIiKwarG1HoX0JFZ9Fs5Hs/R6q7GD
         GXyw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CtERMhWT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138ba8dbsor8949365ad.3.2024.10.05.08.26.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CtERMhWT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141969; x=1728746769; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oB3S/z+Tf/YurYPbjZAkQ2iOmy2pkllXkguo9aONGm0=;
        b=CtERMhWTRXVfP03xkpxIVNS8p6Loxu2ifSvHwUshBKSavtCBVTCD7Y0paWV3JA64r8
         XqBmaegtcqvoswJMlIMzm82Du8pFb7q0xBrR/Pi6BVSFVjf8Tx1zf+i84SDQPBTXd5q2
         yAgonZr/qzK70BhqgY5ZgDHLJ8ltZxXajOGj8uoYPpmuROTAW7s/R7u9O3O8wyZtaFiH
         GyAifoHPbgx9LoN163BJ19KvO4G5I039Ifa7I9KQeMmtuvaW744nuV9VvncHzAHT7o2y
         HfLVAFiZpgmTxlPZGF5uKboOCI9ScfqQJHYSg0uJx6lPjPzmPg8gAfXN6bVSUQo2UbYP
         /UTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141969; x=1728746769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB3S/z+Tf/YurYPbjZAkQ2iOmy2pkllXkguo9aONGm0=;
        b=EyIhaTgDySeIirBEUKa4HqALresxp5jP6o3x+1pfoUcp3Slze7rGf5cH3yyDxOyNa0
         I2KJq9cvY2cU3VkdwlVZpkjdKRFo64tgz8HygGM2a7CXr2bigiNGyWfV8BRqHosxBfU2
         fV8DZnsEfKYV22I3PtSE4AY4oe51FrEd5jKZ92gceudtJ9rdBTqnaR8OWeGJQzqtwyGR
         C4dUS4HIRaz9nQhtJwbvXp1jMcG6J7RiUSkr8BYljf1nU6OofzvrijS12zBiox7ZMoZ1
         mkAqfQ38NlaV6jDsBhsxyHMIi/SPEO/TdJv3ovgqWO3hJlp71zp6MTE7uqOpX88w5At9
         H4KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdmhfZGmc5ausypHueUPyJxR2vdacBPFYFpAjEDXRsK9wg19Vd6iUiE20W7ripVjD3yPipzFhj6MBoqQ==@linaro.org
X-Gm-Message-State: AOJu0Yw54hLzT+P9skbtzvQlgZ3ylk7lxo2sgxFk/EGapOjTPfRWnnwV
	ZZB4uYyh2T+gBXy/JIVNnfqDQPznbYUzIuF+Oa9tG4bxm28Gs/Gmg049ak7vWYh/IQ==
X-Google-Smtp-Source: AGHT+IHGjDyFhoX1JFcZLwPMzIWk0VZ6VyK/OgPBEe0dpV3tD5qpqz+OhbMKSWs06HyBvYG2qhd0Ew==
X-Received: by 2002:a17:903:2343:b0:20b:8924:3a77 with SMTP id d9443c01a7336-20bfe071396mr82155675ad.26.1728141969294;
        Sat, 05 Oct 2024 08:26:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 17/20] target/arm: Pass MemOp through get_phys_addr_twostage
Date: Sat,  5 Oct 2024 08:25:48 -0700
Message-ID: <20241005152551.307923-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FvlG6DzfNrxN

Pass memop through get_phys_addr_twostage with its
recursion with get_phys_addr_nogpc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 0445c3ccf3..f1fca086a4 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3301,7 +3301,7 @@ static bool get_phys_addr_disabled(CPUARMState *env,
 
 static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
                                    vaddr address,
-                                   MMUAccessType access_type,
+                                   MMUAccessType access_type, MemOp memop,
                                    GetPhysAddrResult *result,
                                    ARMMMUFaultInfo *fi)
 {
@@ -3313,7 +3313,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     ARMSecuritySpace ipa_space;
     uint64_t hcr;
 
-    ret = get_phys_addr_nogpc(env, ptw, address, access_type, 0, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, address, access_type,
+                              memop, result, fi);
 
     /* If S1 fails, return early.  */
     if (ret) {
@@ -3339,7 +3340,8 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     cacheattrs1 = result->cacheattrs;
     memset(result, 0, sizeof(*result));
 
-    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type, 0, result, fi);
+    ret = get_phys_addr_nogpc(env, ptw, ipa, access_type,
+                              memop, result, fi);
     fi->s2addr = ipa;
 
     /* Combine the S1 and S2 perms.  */
@@ -3469,7 +3471,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
         if (arm_feature(env, ARM_FEATURE_EL2) &&
             !regime_translation_disabled(env, ARMMMUIdx_Stage2, ptw->in_space)) {
             return get_phys_addr_twostage(env, ptw, address, access_type,
-                                          result, fi);
+                                          memop, result, fi);
         }
         /* fall through */
 
-- 
2.43.0
