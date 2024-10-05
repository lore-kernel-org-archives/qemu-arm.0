Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147737njb;
        Sat, 5 Oct 2024 13:06:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUKxCnIMzfchvLYWLFAwD5GKP7crvNxN+O1VaeciJVhMY1BFhRHJZktYmJ2hot9xCfVV4i1QHjfeTHlsw==@linaro.org
X-Received: by 2002:a17:903:1247:b0:20b:51b0:4b22 with SMTP id d9443c01a7336-20bff1a599fmr101150135ad.47.1728158780095;
        Sat, 05 Oct 2024 13:06:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158780; cv=none;
        d=google.com; s=arc-20240605;
        b=EqvqYu9dSxFJjU7Xj1Q+rJwe5/EV8fRAWA/4DS5QrbDWPB5A27BwYVlqF0cQpAT7i/
         6GVBJK/YzMfAcG+70R+Cp7vA/MSyyrWcm5fuPTLJrUpKEIJYV1VsEj7pWEYjwGGT8G4n
         zYSt0J52OjAaoYiWyKjzc1UOcE9q1A2gYPdDTauHoXPV46MfW6Yg5+Tcphzhoy40C+dJ
         zLAlRy/arqlfv95ipTZOSPWPvTSaJ+yEVwc/CEyMrOPTyKhbfi0RhUyft3ExMEK3+cyQ
         wYAqpCQLOW9ZZoX1E4Fh7J5UVOtLDT8HhHvHwYntLSyPwt2C1WuzAhSO+M86n5qI0v6c
         pObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/ZHU/9Bj/Yhl/fLIAf9ED9KKjqQvRkGT+c+Pl2SvUJY=;
        fh=gUEfadhfgalW5RgLslQKizC2tRYTC5xm8KeYtRh0J9Q=;
        b=k8cGXF0p6WnN+aA2HQr0q56tDEQPT7iigax8ZCaEhjJMxIylKZKpGE04b2GOZnG60Z
         xCcnBk/RV8k3sqJDTgkJExPcmkBGYI3hi3vjhTr9Imu6sHilUl3jxaYdt/oGFmKZt1Q1
         NqysXF96cnRUYoKaauZfMb6rWDjcVqbiLA8UZUUezBmqpR3BAv9+oWdn/IiA7qD2Fa0T
         4oKPsSOyPlNev4VNXDnIAaBxnjAIIK8Ahvk8Red219BqK220uwOr1f4lg8UnH+Y28jQc
         IAEKmkj4DCJpvaxX8D5iWfthNuBw4vdZ6ZuSjJjERkqQgTLJYvll6putJCIpHENDxbG1
         UCGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zxkeo7vl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138b46e8sor10435385ad.2.2024.10.05.13.06.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zxkeo7vl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158779; x=1728763579; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZHU/9Bj/Yhl/fLIAf9ED9KKjqQvRkGT+c+Pl2SvUJY=;
        b=zxkeo7vlj2DtsBx0j1oQVuZhpz3On8Qn6C/eqSdz6S3lL9jWR9RoPy6o/P/sZcTgZQ
         C8BLbavnij3ZFK/9XkZPFJ4b9SMdPgr7n987EG1TpeYRs4wKQIksY1JW4/AnTuLs5oeh
         kj55PTfAZZEGH4+lWDLvVxPp583hjwFpfzzlX+pckUOY7MVhuoeV68/5xZG3y2friW+W
         9yC8TBLotcXeUBqbnafihzKX3xfokSMKFYmPLbs/Of2TK2sPZs/i1DukD7b2bR69nKXP
         XGw+WfiVdocfOQdS7jFaIEYSfXoL+2NQ/nwS3//QE1tuU2xvYimXFg3UJsfUUeoUUAKJ
         hmdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158780; x=1728763580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZHU/9Bj/Yhl/fLIAf9ED9KKjqQvRkGT+c+Pl2SvUJY=;
        b=LDNZQiDpXfX9geS7XVMMcHOPkUvTYtXMuTwWmb7h54UCP2SxaNX4lEEPqGned3Nuyn
         61PDkBxjb6AWga3GZaIAx3QbSb/siUQiU+a+IuD0wXdCnGZ0+8dfCjhOags4CUydsBEv
         bIPYLJwR3smBROC6cOE76nA6SUE2UW/qxOuhukCfWBSOrCiZAEQbPAk+1+PIg6NdO7GT
         BcKip9Ll2aPK2t6f8bZcGmnZa9wI3+5hoxH3n4iaXWAVqxK7G4K9P50wIx01dyNlEYYq
         ukAHLLypAJ0dQEr5n2IjMsg9qjYBO1JZFfd85EvOu+AGX+IHM3So/XxtMRmR9tNHlCSZ
         BrnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJciPlpJG8XNiZJIIGwIEcWQGOG7kLkgfJ+Btv+c0rhF6cGMLt/SHBKqIHfra+1HzG9QeWiPv3Vw7gBg==@linaro.org
X-Gm-Message-State: AOJu0Ywb45aN9QuIL8bB9Plj7lCRK6vsijINYzIFUNd8OwCkKUf1JA8v
	FhXaoXtCbKalMoxfBCkhPVuDiPPaQ+YS+SmXkMvvvOtbT7M5pG5StRtqRNK5bAeWSw==
X-Google-Smtp-Source: AGHT+IGaG41RXKz72+WYu6xA+vlkOEFZ7bvd3v+g0ts4N6YOcoq8IJtsLlpIollZYFin0+jpif++rQ==
X-Received: by 2002:a17:903:228a:b0:207:1825:c65e with SMTP id d9443c01a7336-20bfe05f3c5mr90235625ad.18.1728158779678;
        Sat, 05 Oct 2024 13:06:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 19/21] target/arm: Move device detection earlier in get_phys_addr_lpae
Date: Sat,  5 Oct 2024 13:05:58 -0700
Message-ID: <20241005200600.493604-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bWh0nJvpaz1Q

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
