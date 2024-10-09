Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp532088njl;
        Tue, 8 Oct 2024 17:05:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVh6Ub5Kq+szEyZaHiTOO0kScR2BWd5VOcf5jIbS8hNGi7l8mNMT6FEwfnSCfVo/+N6jgL8V9DPcOsMlg==@linaro.org
X-Received: by 2002:a17:903:41cb:b0:20b:b238:9d25 with SMTP id d9443c01a7336-20c6377d1femr14419795ad.38.1728432311301;
        Tue, 08 Oct 2024 17:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432311; cv=none;
        d=google.com; s=arc-20240605;
        b=lyCW8odJFoXD4MotAp7fKsZoPIUb/zBIEY7i+QJMeEZhyBksdVVIMVrVB8dH9/ro75
         l0D/sGp4jd86iq/3YCGO/+D4WtEls22bCwvNQiDN0mMoPo/RV2nITdeH9unDn5/49j4D
         dN3P2Il+7DK67I7ZVfJSmGqF9VP03kQYScVLLSjcrKrdsG5H/57GFLPYjVfUqxes9Tc1
         32gH6fNqUYmA3nYpj0x8NYZiGFpb1TJGLmUFFHT808s1FhIVv/P+h1BYs8vwjUfIjpCA
         D6UP7c+5aB3qR+ScFgTPI8uD0M92gT0WpiXhRHLFgmi42qv3jmzPkmQxJlmykmDJMCUN
         D52A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nPsGlRApUHllpr7HECmYu85LwKI3gq1PeB/gQzKhtMY=;
        fh=O4LGJPtdJLFl4QXwmX4FQYr9ZpgoVJCbpjysQVEhUI8=;
        b=XtFmbIpKOft0OF1wRU0A44YD+IICQnKbnd+Rhau1UC76ElJfo+oD9cZ4NoIJb5QzBF
         t7w7Aa8oL4EfVuSsstfX0GRIrLJ7RvDoEjbfebG9ND3DDO207cJxHuF98OsIVlnhjl6g
         6VwV2NQGKScb+gOYvkhb5YxJ9GF1a1c8lpZfUIUPnU1ei/Tm43DtkJgXo6X44124AukF
         CXP7gIsFVGfZVeP0K83slMnHIX9NSu3U6RwV8QFFUZwxCQV4eX9BN7b+IXNgYSy6OqiF
         hb1Bw5ASPV0U89KPj1Cu1435R2iDUYJHViUQxFDDi5qxyxSZZ0vgTZ/28Zcgy52l7IF9
         aw3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q0JU8i6e;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c13983b41sor61656635ad.17.2024.10.08.17.05.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:05:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q0JU8i6e;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432311; x=1729037111; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPsGlRApUHllpr7HECmYu85LwKI3gq1PeB/gQzKhtMY=;
        b=q0JU8i6eG2SYRVf9ziDgggmy2T8FRatGoT5wjOeYYZjzv+QOfqw1yW/00B7zrpa7HF
         17V0FXuCHfQGB5JZJEQa9sGEBde62rpLFK3gq78/SjYfSvoqcIO1dVWf9WSFwY2edUgM
         Ywhjb5W+veCi4qVdbnWanU81JktfSwskEXvHtDezwcBUIFobqN8Q24LQIlKew0T/xyCI
         6AfX/gXjPm6yIKEqebmMydxsIbLL1fx93Zef5yi4VwmDKgeRyTWR+87Xo+9nhLmrs7xn
         dfSGXAuqfBCU7TE11vIYBar+2g0vxV1W/NPxo6fakl+OqrHB+L8x4PYZUyXKhM6HeGoQ
         UoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432311; x=1729037111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPsGlRApUHllpr7HECmYu85LwKI3gq1PeB/gQzKhtMY=;
        b=oSa3SNLlEo0WiX1m98PNl3eHq07Ytd+K4g0ZKTBqM7JJCG/noBPcNMlN+mhCKYDrMf
         ua14xxDJCtN0K0Z3LbNvP1WXKrFZxc7pXugenjCUGyrGP+9ofLtGhMe+guoCbj/MUcA8
         lFvLlJ9MsuCvUoT/SNZGrCBGzdwEORm55druTEDXznMgC+fvXPGFnGNmrJfmvBVLln2g
         8MMh4n3CTCCfOGThKETF0iGZzUZC5/PYrOxQdAhy5KCb0X1SlIVxqicnUYPRdT9m2jo2
         cRNuheSB+q1qtGV/Tcammmoq1DyEnpjbZ4n+9TxDKkTYf34cq+8at9UyKrc/w6BHspyl
         8Nhg==
X-Forwarded-Encrypted: i=1; AJvYcCUrD0PwwEDc8LkDKcSd1yJbLrwZ4cFUFIBxsnKply3dFSA3i5etZQBEtGzcGrCsH8vMogHTNX/iAOSUwA==@linaro.org
X-Gm-Message-State: AOJu0YzMtvxPVFXFy++flTY8WerXfU01VnCVnJuFjn/NS3P7/0XJfjsw
	h2R+I11PKlwycQimJlbx6RfoAmEdb5phTYuAbtYotXqw2NyH12mJNM2Gb6hRRkoldQ==
X-Google-Smtp-Source: AGHT+IGJ8O2nfVebXs/rTPoybsu6FDn6yseoR+E5sJTRxCOXXVZpsC04cUko3bF+v5+Uw1ma0m9ncw==
X-Received: by 2002:a17:902:d585:b0:20b:a739:bd60 with SMTP id d9443c01a7336-20c6378d2acmr8950605ad.51.1728432310616;
        Tue, 08 Oct 2024 17:05:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:05:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 16/20] target/arm: Pass MemOp through get_phys_addr_twostage
Date: Tue,  8 Oct 2024 17:04:49 -0700
Message-ID: <20241009000453.315652-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PzURzXCqiuLp

Pass memop through get_phys_addr_twostage with its
recursion with get_phys_addr_nogpc.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
