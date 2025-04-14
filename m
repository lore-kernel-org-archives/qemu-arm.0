Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2081131njc;
        Mon, 14 Apr 2025 08:30:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUem9IlqgNnc5/j+6G+IzWD1Hk0lTQaSErar/LHt/pGQ2UwnElb+Wd0u4bGkFa2TYG3N4IifOua0jrlAw==@linaro.org
X-Received: by 2002:a17:903:17ce:b0:223:f408:c3f8 with SMTP id d9443c01a7336-22bea4b34a7mr180014115ad.14.1744644639555;
        Mon, 14 Apr 2025 08:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744644639; cv=none;
        d=google.com; s=arc-20240605;
        b=YSJthaI8YLAKxyybGqcdJ69wAIvhkBNxWUI7oYVm1I9UCpLPoieEKIMKOHeB9wVjWH
         HVwR+oiF9a5ZVmTlFeugO9dIdZLCRNGGzHHTLgoZC/kMgxe+BNPaCXpo9WaRCBU6vhv3
         OxZVOYZL0WUDgylNuNw6zfE+r9H/llYYULBQ765++9TkZCUNYnyMH2xv9nBfin8TZebk
         pVdZmrgT7fvBQ3gQ8vL2dmqcmNxuS2G6SoWYh0zUFQhp+ubI/Pko7OZjVwy1cMNc4U02
         o1CeXfSYnQEH16DExs9wKgarpaoCz+5G20jG3meuQA99eUxJaegIjQzsTdnaTzb5Fbeh
         SblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TqyBJJOm46Sb82n8FzKaMXcdhyeyuBYZxwBUrlvI8+o=;
        fh=QVpv/itgjJx4GP47IObQAO1T/6gQuMU9E5MuZkyVJWI=;
        b=jI57RyfVq1TuVHJxatfviuoB+RvlwKU9QdYvfOCfJDHaO1KNfIv2JK/k4z1PvoC5vR
         7jF3JVYAlgU95gtevz1BFvsydZSvcnAM5ULw+/rvssbMlb7UEuBHV5y4Vnl7j42ejKR1
         UGUXEBzHRpaYnhTD+8PAUThpSV21wIdX39rqaITjRtGwq4PYogxdxfn2w62ZD23qwGFG
         xMHhViRUvRMyr+3oAmvipsS9kz1w/lMgKIbXw0xMaJ5cm9wKRBSqslsYOgUFstPjk+bH
         ts80EdaRh65YJhqsNGkJb//MgRenJDmMz3oNBaapNwUbI86oApsfO4wGIdriyWTOicO3
         VKvg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LYmMCn1b;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac7c2da84sor75761255ad.12.2025.04.14.08.30.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Apr 2025 08:30:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LYmMCn1b;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744644639; x=1745249439; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqyBJJOm46Sb82n8FzKaMXcdhyeyuBYZxwBUrlvI8+o=;
        b=LYmMCn1bvlf6LINiSvVyaY3rTyHl88/7gxN+n1oFEZL7kco3I+Y+H/f7aegoOibX1u
         Z8x1+h/2wJNlQk1B6KXDOEhrbtYa9PbEw3UlkabIxMMBiXI6wfydr+Uc3AoRza5gHLiq
         sARalDNC5AOhmZKNS45188CRQe2Jr2aCFY3kBWwpGXLrpjkZjKQCHqpQBd6DX6exfEuL
         pQ1ALlH9L4sIFXV8zxuEPeEv+ZATGQfU57b8xmJhTk/6pchkypdKCn/i9HcyILcn2Dd8
         sdfzQ0nWvNIEEOVfcaoHsRAKbmLq7dGNZJnjDQlMqhWAvOenZPfy1Q4bg9jhP6etGLXJ
         JD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744644639; x=1745249439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqyBJJOm46Sb82n8FzKaMXcdhyeyuBYZxwBUrlvI8+o=;
        b=GXYHFAOyxiGpU0T7kn57Z+t4DjS87pducsgkHybQel4oQSjAW3rucuSSEVmibNz9bW
         tx4iEzkgjBHwnOhZ+KKxI1VkSq4V+nzOSKbqm25raKJiXPVttdhMYnmPG26AIe84S/UF
         tNAiLgKNU9oAXIPAHHMgJc23dFDEhfB27WM8jXtfpW64Xu8odZeu9VPNC4nsYECgTd1Q
         Y/d7Qr5B+GoDL4y3fop7mPXgriejVEkwVqQPO6OCy+Uad9HdODDMNu/pT9bhntesf4Lb
         V+hbMizlx1pH7QlnPwbsCEANn8XicW3c0jNUnJP8Uj0cauRoJlWSr/REuxoUFlPRY+Ng
         LA+A==
X-Forwarded-Encrypted: i=1; AJvYcCWkLgxpj1LKtIy5Ov1als5kOiNq5i2qrWg35HcxG2GKEj9VrlxeC+evqMOPa8hV3jN03Semu7zv3U/JUQ==@linaro.org
X-Gm-Message-State: AOJu0Yw3eeW+hgSaeNOZgBcj7TPTE9JqMCmzEJG5GEIkVbjOCLRm6cUb
	EtH+K1+TKDOcZGsnpYwuDkhYpnP6jQdWhi+rI6EC0/kiJ0BI8UQsv/+49QqVpo6Dew==
X-Gm-Gg: ASbGncvYMaVvuuqQLa2LG1XXkLmWthrk8BvlBFWsiJ74HLYnojaJWFbt7HKIltPuty1
	XKEUMD6P8RrGyGxoCE9eYhvXwMvekcaSfWqGO4IrReSc8ajEE7fKbghEdr4848CBz3r6EhbdCv4
	Xttbu70ZRoDZTEQR4PMU4ZmjqOHpXEbUzC2ZXkMpansM+Nfi1iV5I++xgK94xz1nuIKYk7JZFlD
	c6QMTgUHtriUsQgYZN5zup6+zO5NeI9GE7cJBHMWtJ1+5HGPysjMp/p/fX0vTYN+yPKcWJ75eTk
	xKPfGniiycpFb2kvAPHI+laZKlzsZlSoiXITxgRSYsUoYYdcjdU=
X-Google-Smtp-Source: AGHT+IGj2y01HOaY/U7OEdnQAN0S+23Ws0NfwzBdUjrskqCVThL7GgoEJaZ+7iPR0rmsB7OD6BUMkA==
X-Received: by 2002:a17:902:ef0a:b0:21f:2a2:3c8b with SMTP id d9443c01a7336-22bea49d314mr182921865ad.11.1744644638942;
        Mon, 14 Apr 2025 08:30:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccbd5esm100735235ad.248.2025.04.14.08.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 08:30:38 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Yannis Bolliger <yannis.bolliger@protonmail.com>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 3/4] target/arm/ptw: extract arm_cpu_get_phys_page
Date: Mon, 14 Apr 2025 08:30:26 -0700
Message-Id: <20250414153027.1486719-4-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414153027.1486719-1-pierrick.bouvier@linaro.org>
References: <20250414153027.1486719-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 68AbqYSrV47b

Allow to call that function easily several times in next commit.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index c3e4390175e..bf92c165175 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3629,23 +3629,17 @@ bool get_phys_addr(CPUARMState *env, vaddr address,
                              memop, result, fi);
 }
 
-hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
-                                         MemTxAttrs *attrs)
+static hwaddr arm_cpu_get_phys_page(CPUARMState *env, vaddr addr,
+                                    MemTxAttrs *attrs, ARMMMUIdx mmu_idx)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
-    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    ARMSecuritySpace ss = arm_mmu_idx_to_security_space(env, mmu_idx);
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
-        .in_space = ss,
+        .in_space = arm_mmu_idx_to_security_space(env, mmu_idx),
         .in_debug = true,
     };
     GetPhysAddrResult res = {};
     ARMMMUFaultInfo fi = {};
-    bool ret;
-
-    ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
+    bool ret = get_phys_addr_gpc(env, &ptw, addr, MMU_DATA_LOAD, 0, &res, &fi);
     *attrs = res.f.attrs;
 
     if (ret) {
@@ -3653,3 +3647,13 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     }
     return res.f.phys_addr;
 }
+
+hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
+                                         MemTxAttrs *attrs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
+
+    return arm_cpu_get_phys_page(env, addr, attrs, mmu_idx);
+}
-- 
2.39.5
