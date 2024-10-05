Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047903njb;
        Sat, 5 Oct 2024 08:26:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMwhTk+tYg+k1I6SkXI6p2HkWvqOUPtJ7DUPvwUgFmTFQuA+72ISsOzrUNuUcjTuq6HrdEBF813c5uwA==@linaro.org
X-Received: by 2002:a17:902:e80c:b0:20b:7094:8d14 with SMTP id d9443c01a7336-20bfde58014mr103852725ad.5.1728141971770;
        Sat, 05 Oct 2024 08:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141971; cv=none;
        d=google.com; s=arc-20240605;
        b=ihw3S3i9De93OKbGzqUNlU7c1zFUttqx8Zukz44tK+YroyXOXuHL4loN84uNWOKQIb
         Ha1D5Vkf9WDiMOv7xyWb/VkBvRXwCuhhVjXsrLgdF78c/jAsaDRXePXA4f8pdPynEAMc
         Ju5nvY7QNZKZDwbfS3g8nDkJvYT7eikzmESaSqMTP55AMvIGc7AwVt0161z65UW3ib30
         9izbPTnyL8xdiggGZFLFBw1uaj80iPDM7zjffsoFJ2P0PSiOUMu+aHGjQIr1dJOdzY0Y
         CzyhTN+Q8Sr+pkjvlhcNQfoZN6PucfMyvVK4B0d0D5yMZEvXl9fmVHJjPv5WaY5IYoKo
         qzCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/ZHU/9Bj/Yhl/fLIAf9ED9KKjqQvRkGT+c+Pl2SvUJY=;
        fh=eXtsLInz+BJPEttbWYsvHoEB/YU0yEteVO4MS3POAS0=;
        b=Bmo/PF/eXljnml8cM3UkfBkkqUSzfNFUNkHuWZlgshkUH1kWTM3iupFGGSxFOveilV
         q+suvX8l5lWCZFrHlIT8AgY3IEd47wEUb1RyaogQZzJvGFEUgcoe/TpK+Gm0GivbQx70
         8lp/QwxAID1YMzCk4ezOCJHdq+ULDR6EVhCUCRvoGa7EvSrn9BX/9d8/b6vjpsjjMBU6
         GW+5iUeDztAELGpviwPxim4J5WLxr6pTRCSjdZ9fRRNEE8G5R2z3Vlqj88FmXX237+/C
         Dm0YhmNeClm2EP76dZGRUohXMIgq3lIzy6FHaN3QQz/GVqrKFpUysruC+oUNeKiEl49R
         8HpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cweBGUCQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1390fe5esor9055135ad.15.2024.10.05.08.26.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cweBGUCQ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141971; x=1728746771; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZHU/9Bj/Yhl/fLIAf9ED9KKjqQvRkGT+c+Pl2SvUJY=;
        b=cweBGUCQtQg8Wvz+cY3aw3ROEcLdK9kVIX5nxF+fOvWy8Kqq328wXkqOaT5uajkev7
         At7r+DDaeX3y6NqGhj7lfFlItv08CVAyPTGg+HLha7jzzKVlUB1A8ZuMadlx981J2qmp
         jwpxy7tfX6Xhy46c6TH+BsCtPUwrMtkSQgbLkXAwJYHiskYj3aenYV0jtl3hfXPlxlvL
         v+rlOF7iriImoEl+br++cK+5ctdUlqV0bdnPGxA3LW4YbiCcYwp27KtkRpgH6GKqU/HV
         vpl3lrDDktBQPvE1Xc/GeeBgSRsLOirWWOu2/XIrgSIhNDnH5lK5E8Ko0umdHT6B3G5T
         LBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141971; x=1728746771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZHU/9Bj/Yhl/fLIAf9ED9KKjqQvRkGT+c+Pl2SvUJY=;
        b=nWpIbfw/cBTuTYlJWx2jCRZ1At208gSqUbKPGoHgOY8koRdcCAdg+cH/L9oLgRjlAF
         x9UKenCxvK6zv/Hj3sgiIulsTzKyuOTxRUBrvtgWeHEZqnVLAhX9tBEAZwcL2jBDhZfx
         ltmX2w9lc7c0X80C7gj9xrmTW+0/HnQhzUAj15GgryaRhjw17Tg9gMyMOK4nc1KJH1cJ
         Y9bL3R+jFUnDt6o2K6iqkzP60Jf2CV9UHGVPWff5aZ767T39QcrptvFiZRs2JeJp6sMc
         bEmk2LUyLd4FCjz3Z72HhtWVdgqLYFhGq7EIb7QxHWBEYk1wWy+MnwB6beZ2ME11WeRJ
         DQyw==
X-Forwarded-Encrypted: i=1; AJvYcCVTo0WdjACdCkac7FkmOG4wgF/WxhOD2TqXXX8jufy2WauA8Fymopkl/l1shucxIWpxYrFFbLd1PTQlLA==@linaro.org
X-Gm-Message-State: AOJu0Yz2THLN5h4g80cfj1oEIulJgLpZA8O9MVnVqCTpsiPpU+6GEN5x
	pt64HFYgVIYeuFiIPgqyh1qV96n+e1QXSK4V4l8+t14SE39vzVinP/aYlEpZSAHJfw==
X-Google-Smtp-Source: AGHT+IH4Lr64SQZfzlOO2MyBkQGMuSWCJxA1Uid5flyT3IfspQk+qHg9k3FYTQCTF9/9yq+5XQ2JSg==
X-Received: by 2002:a17:903:2b07:b0:20b:8e18:a395 with SMTP id d9443c01a7336-20bfe291f03mr89154495ad.44.1728141971365;
        Sat, 05 Oct 2024 08:26:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 19/20] target/arm: Move device detection earlier in get_phys_addr_lpae
Date: Sat,  5 Oct 2024 08:25:50 -0700
Message-ID: <20241005152551.307923-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bFCrM5+AdMAM

Determine cache attributes, and thence Device vs Normal memory,
earlier in the function.  We have an existing regime_is_stage2
if block into which this can be slotted.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 49 ++++++++++++++++++++++++------------------------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 238b2c92a9..0a1a820362 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2029,8 +2029,20 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             xn = extract64(attrs, 53, 2);
             result->f.prot = get_S2prot(env, ap, xn, ptw->in_s1_is_el0);
         }
+
+        result->cacheattrs.is_s2_format = true;
+        result->cacheattrs.attrs = extract32(attrs, 2, 4);
+        /*
+         * Security state does not really affect HCR_EL2.FWB;
+         * we only need to filter FWB for aa32 or other FEAT.
+         */
+        device = S2_attrs_are_device(arm_hcr_el2_eff(env),
+                                     result->cacheattrs.attrs);
     } else {
         int nse, ns = extract32(attrs, 5, 1);
+        uint8_t attrindx;
+        uint64_t mair;
+
         switch (out_space) {
         case ARMSS_Root:
             /*
@@ -2102,6 +2114,19 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          */
         result->f.prot = get_S1prot(env, mmu_idx, aarch64, ap, xn, pxn,
                                     result->f.attrs.space, out_space);
+
+        /* Index into MAIR registers for cache attributes */
+        attrindx = extract32(attrs, 2, 3);
+        mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
+        assert(attrindx <= 7);
+        result->cacheattrs.is_s2_format = false;
+        result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
+
+        /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB. */
+        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
+            result->f.extra.arm.guarded = extract64(attrs, 50, 1); /* GP */
+        }
+        device = S1_attrs_are_device(result->cacheattrs.attrs);
     }
 
     if (!(result->f.prot & (1 << access_type))) {
@@ -2131,30 +2156,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     result->f.attrs.space = out_space;
     result->f.attrs.secure = arm_space_is_secure(out_space);
 
-    if (regime_is_stage2(mmu_idx)) {
-        result->cacheattrs.is_s2_format = true;
-        result->cacheattrs.attrs = extract32(attrs, 2, 4);
-        /*
-         * Security state does not really affect HCR_EL2.FWB;
-         * we only need to filter FWB for aa32 or other FEAT.
-         */
-        device = S2_attrs_are_device(arm_hcr_el2_eff(env),
-                                     result->cacheattrs.attrs);
-    } else {
-        /* Index into MAIR registers for cache attributes */
-        uint8_t attrindx = extract32(attrs, 2, 3);
-        uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
-        assert(attrindx <= 7);
-        result->cacheattrs.is_s2_format = false;
-        result->cacheattrs.attrs = extract64(mair, attrindx * 8, 8);
-
-        /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB. */
-        if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-            result->f.extra.arm.guarded = extract64(attrs, 50, 1); /* GP */
-        }
-        device = S1_attrs_are_device(result->cacheattrs.attrs);
-    }
-
     /*
      * Enable alignment checks on Device memory.
      *
-- 
2.43.0
