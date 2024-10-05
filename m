Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147714njb;
        Sat, 5 Oct 2024 13:06:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV+VLVqOkEbdeIKoYcoByfUsOW3LaNrBedAAN9jLbTd78dMy9kR8iRIT+5fBMUobD9YVQC6QuefJkUM5A==@linaro.org
X-Received: by 2002:a17:903:2b07:b0:20b:8e18:a395 with SMTP id d9443c01a7336-20bfe291f03mr98019525ad.44.1728158777971;
        Sat, 05 Oct 2024 13:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158777; cv=none;
        d=google.com; s=arc-20240605;
        b=Vb6zJqF1DcicktAbXbWvxr9J2eO4KQSvgJ7RFKtAb041s78e/HHcpc3VtS/jP6hRB7
         LWBwQZTA/x7+WJ8o02GDJZkpqfTXRr848loxwDvAHumxNFzCC1fqiE9ZNS3eqOvTl35P
         ruF69xIjz+P5EBJGjWHlQh1yRSetMa/5nAs934I4trLChkykZm+JTq+0eQtZ0kNQ7B2K
         ITIzNrwDLNoMCAnrFcoX6JYhA10MouzfPT+eO0NbeHHfVN1UhdfleNFrZwXB9mkBuRKT
         tQpt678699+zJpr9fpe7heS9uiP6glJ5fkpka5haoeYR377joRyBQE0TzMhs4tHjcCIl
         z+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oB3S/z+Tf/YurYPbjZAkQ2iOmy2pkllXkguo9aONGm0=;
        fh=psZ4t683t+CaLDPBCkazrmFE6VkeTHtfYj0e1ZstP2E=;
        b=L/BIlqS/7q4hEm5qjOxAAf0A2TSPweHWoibQ8WLtLKnJcZmtRGmByWd2n+rXrii5fq
         37BUhRWqFY5rTqdnoHHFo/0OJFyVJc4pkLMUf29CH3D/1HFV6zXN8LbMeJDQJ9w/qBZM
         sZVymysRL9ScRV2xlnOV7qsPGCdM1pSdbBz9MKomsTxY1FubaFAa3LyasMTeXXVLEy0L
         M7qYFpkWV1Bxa6bfDizgl7w26BWCLMShfUmpWGj6NFhXrI01N2anpVp9L3HYEJ1o18oe
         QXgSC03oRWYqVnVgrs9dGD0Gt5/qGFqGCZaZEUtlsbpp0lGaj2zMpHecce4oOC4raDNG
         TM/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aGoXreRc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1390fe17sor10673625ad.16.2024.10.05.13.06.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aGoXreRc;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158777; x=1728763577; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oB3S/z+Tf/YurYPbjZAkQ2iOmy2pkllXkguo9aONGm0=;
        b=aGoXreRc5EyfTRsInqmZUZNjJYOA9CScPnC2b8vTHr+tRH7fYYoVrvyyK73dnRX1bO
         f2mqBYvXS4owwc6kpBYqfoMO6TgogPV+CUk2mQLFFMEpwAPD308dXOGmdUMWELGGB6dn
         OWfBsmIqclKW4u7kD02rKuDS8pH4ioeR8kn/TnWQArC3NSV/trbZ4qZKllDTllAdbLtX
         6D56QDoqRUMsQKxi2+VT++RaZtZsGWXS7JJUpUiPuq4y0MjQRcatkrgles6SbZu5fQuY
         j2UXuKF5yOoJ9lANpYscDNp2hgm1UQr4nBCSPLg5eblfItAv8Y4/V006wiHODr7jJQ7e
         1WRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158777; x=1728763577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oB3S/z+Tf/YurYPbjZAkQ2iOmy2pkllXkguo9aONGm0=;
        b=Np1RJ/7hhK76BzdcPp3ZyiAUSre+5aXtT7Qb/vW2drqAR0J/ZKY4nLGEmIyxC1zpRf
         q9f5FhTLap0A4AL6As7hlW9wcIi/mijDD4fuUuzwUfKxqgFc0v+clVWqocDqB+e/gFu0
         1iwBEjlUj6ezVV4pzrgAxT7d5BWTdbdobKrLhjy7ofiG4mzaioQ52L9JCSoLP9jN1ex9
         OXtg0KHUL+sSLvc1CDzI6BDInWqJk3IdezV9L7xW6vmrU9RcO0eKTA/9KyrN55EOkRUI
         hUBgNB1ahEfr6tb2Q9RUIzoOoG1JKXBi7wb8+MwwyJ3/mgyLSpeyoKcSNpE1Om/wLWga
         nKKA==
X-Forwarded-Encrypted: i=1; AJvYcCWblkLnY5DSTBwdnph6+HCt5klip5gLNQxt4jSf30F5+FBV4blfn/wBMZsLImZR8Ql7mI+Nyi+0CB+J4Q==@linaro.org
X-Gm-Message-State: AOJu0YzovOrhBz+2dyea3dSyy443C3DwDH3zKNPTx6mcdyChSJJcLdyi
	0xbrtxY0oVL4TO1vjGFaRSXyGOkb1ctTFiM6rO22DVXj1FVd8pOzHsqjoziTHsAnyEXmQ9Dw+hT
	pNkU=
X-Google-Smtp-Source: AGHT+IFI03P/ZwqgMEeykQf6RuuyTdik7GAJO+0IxSS0VbFT5FxKQ+by1C3Nfg/VbMmCSMS//V9B9g==
X-Received: by 2002:a17:902:dac5:b0:20b:b132:4dec with SMTP id d9443c01a7336-20bfde57e80mr119970415ad.11.1728158777552;
        Sat, 05 Oct 2024 13:06:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 17/21] target/arm: Pass MemOp through get_phys_addr_twostage
Date: Sat,  5 Oct 2024 13:05:56 -0700
Message-ID: <20241005200600.493604-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xOfnQZA3iMaQ

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
