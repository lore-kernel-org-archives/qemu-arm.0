Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147643njb;
        Sat, 5 Oct 2024 13:06:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXy4YqJseQaPJT492KO1JuWxxf/7D8pfqjrl/H+3bpkBTJqRvJC85+pQ6iyVCiWYK+AHL6YLiGh78aIw==@linaro.org
X-Received: by 2002:a17:90b:1b4f:b0:2e0:8780:ecb with SMTP id 98e67ed59e1d1-2e1e5d62ff4mr10235550a91.12.1728158770459;
        Sat, 05 Oct 2024 13:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158770; cv=none;
        d=google.com; s=arc-20160816;
        b=aZJeal91JW8iOdyR3xkjNrviAKKoesa35p3y3zo3Pn0z3CDlIxyznNCcYXyDJvjS6p
         AqEkbTLTu1RhoxNP/UKS5scrdxHv8sObxaFK3rr+gyRyHg30knMCcLdFidojTFE2hhSV
         Vvlxt3fGAv6vJdhccnEfKSl/bxezaq90XkRP1j6p/FgegwCiJ9bYAPNxK7MoWavlqQbb
         5WA0IlvoXuXIx0HALZ67lkRrAdxMFQpBychantSO0IgHpMBivFRl+5txf5NSXLl+xJwu
         06uGQWS+uRIACzDiDwZ0OGEs8sDIGNAAhNuLIeP/5S2Wscvy2h1olM/CQftQIeh6KjBP
         9AdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/wa2JC5GTiuZOa9FUt+c/E5R/4D7wBSs90VoPwelenc=;
        fh=qkNEreyDsGXF7V+jMxf/pKxeCadc/rr6dh81f3CfM2Q=;
        b=YeNv5W8xSGF6oUWDIqm4PArpnYeMBBmbN8kz91z57sOAHXoxbPpMSnod401aT9pe/B
         UplIE4Uu74gkQZmWlG5CtV6TfdCssLnJLSbeoU2UilqXopj/w6+ROW6Y7FYTmCIzJhYl
         uKsZkpsfcrFosqQazxD5rsMstFczXYHWUgEok/Wea/StUhD/nGOb54fZz/fn5VFdOQZp
         9J40x1nMCOBqGuq2/wKV6YCwvzB9/BI3+ex6cze5MiaYxvByGB9sn/fssLYxzQ1be1te
         ujDDzhEZ97hSB1Lt6s2C8lUMRrBawZM+O0l6knvwNR7H98wovCHH1/qvWkKVfp9aGnAm
         yb4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d794yStj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2e1e8248b23sor1950272a91.0.2024.10.05.13.06.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d794yStj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158770; x=1728763570; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wa2JC5GTiuZOa9FUt+c/E5R/4D7wBSs90VoPwelenc=;
        b=d794yStje7GCJQzgKqIGztopkCdpM5OopityuR9frryurh1ZXMYs/0aXHoJ8zLXZs1
         Cccx/uY7IGmcaDLyEeLXmqDTk+ouhBlyTmLHkXHI1Rj6pdPRlulobmT262pde0G4kE2Q
         YNJWBDLwWADYYqvq/lUfBRHPLlCxYA75wYSizHU8rRvo77rD+Td7zuiJJWVOWeVud6hg
         xIQWV6OQrxv9wxA+lTA4twoopbdOXLWHqqxLybzjkcfogyWUXh5f++W6iQs7gS/9PXmv
         Qpteq5875BvDQ29LHp1f0BtVmVNgWIVA+ANuLZSj8DbH2UP7w8a107GPByNjcYj0xyHn
         p9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158770; x=1728763570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wa2JC5GTiuZOa9FUt+c/E5R/4D7wBSs90VoPwelenc=;
        b=WlhFq+rBCeUwCtiXK80DIhBgr3si2pHY3nWDVpb4524DNaydVzCoKBdai0EklnX81w
         Eu26HTApQlEwKaSq8igBIcesd4sVg796RVvRzKn5YFUBvdMBRDsD9YGZ0EIhgaJ5Kouo
         6xt2ubh6iI6CUuyQl0qAxk4y8mbJ3ZeiokvJCDND1qmGPCNn4lzKdjDGqlXKWMbUweYi
         EOJECTwEuY0paTz2uSVp1IHM1rN5pT8L1ej1UFVNoDXKWe7LBHj4XZsO8gDnFpcNi4BF
         M3dvTjtLuaH+OL5cDgngOLkaKAVzGYjcV6m0SPTrcnSVpyQS7vxdSLz90H4xPsDEIUBp
         OHPg==
X-Forwarded-Encrypted: i=1; AJvYcCV+UzpPGhYJ6dFCzrV9vETkUVMEwb3esHdNeoKPhb3+SEvHDOb8Wtgaucy0HDvoX4FTNIOGHFvpJiZbNQ==@linaro.org
X-Gm-Message-State: AOJu0YzuMVCdgpgIAlaytE/1PcHMvFxtMFHVAMgu0uBuM0/7Hwfn2r1M
	wzkY4RGG7nwyW/gogxq9741Qx3PXsdGtEJsGqsgp5u/BlA6iIT/Z9QaRbcauAY3a/w==
X-Google-Smtp-Source: AGHT+IEu/yRGIXzgnnxtsNkCW1Gem8iXzS/ffba0hjtpfN6ZQ1VIoxbuDWZWql5a5WIxSKhWPrRs6g==
X-Received: by 2002:a17:90b:3709:b0:2e0:7b03:1908 with SMTP id 98e67ed59e1d1-2e1b38c7582mr16486887a91.10.1728158770066;
        Sat, 05 Oct 2024 13:06:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 09/21] target/hppa: Perform access rights before protection id check
Date: Sat,  5 Oct 2024 13:05:48 -0700
Message-ID: <20241005200600.493604-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bcGxTzrfu20i

In Chapter 5, Interruptions, the group 3 exceptions lists
"Data memory access rights trap" in priority order ahead of
"Data memory protection ID trap".

Swap these checks in hppa_get_physical_address.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/mem_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/hppa/mem_helper.c b/target/hppa/mem_helper.c
index a386c80fa4..f027c494e2 100644
--- a/target/hppa/mem_helper.c
+++ b/target/hppa/mem_helper.c
@@ -267,6 +267,12 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
         goto egress;
     }
 
+    if (unlikely(!(prot & type))) {
+        /* Not allowed -- Inst/Data Memory Access Rights Fault. */
+        ret = (type & PAGE_EXEC) ? EXCP_IMP : EXCP_DMAR;
+        goto egress;
+    }
+
     /* access_id == 0 means public page and no check is performed */
     if (ent->access_id && MMU_IDX_TO_P(mmu_idx)) {
         int access_prot = (hppa_is_pa20(env)
@@ -281,12 +287,6 @@ int hppa_get_physical_address(CPUHPPAState *env, vaddr addr, int mmu_idx,
         prot &= access_prot;
     }
 
-    if (unlikely(!(prot & type))) {
-        /* Not allowed -- Inst/Data Memory Access Rights Fault. */
-        ret = (type & PAGE_EXEC) ? EXCP_IMP : EXCP_DMAR;
-        goto egress;
-    }
-
     /*
      * In priority order, check for conditions which raise faults.
      * Remove PROT bits that cover the condition we want to check,
-- 
2.43.0
