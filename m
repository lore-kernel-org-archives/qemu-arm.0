Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2081123njc;
        Mon, 14 Apr 2025 08:30:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXai1YiPoLKlwfrud100R5VrOwHWur5YZFHL1NK48n+c/UNWjQAL00Sa0lwVO5kXRv++Gx9/ItVdwBdmw==@linaro.org
X-Received: by 2002:a17:903:17c5:b0:223:5ca8:5ecb with SMTP id d9443c01a7336-22bea4efaaemr171061885ad.42.1744644638643;
        Mon, 14 Apr 2025 08:30:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744644638; cv=none;
        d=google.com; s=arc-20240605;
        b=KZTb/x7rxAwafw7nsEUA7sOjti/jm80312wHeGdwGZV9di7rx2J6Yn8bDkxfnzR1Cs
         1qaz+9q1xiPRhs9QMVH55qVzv5lrUstTdWZuxKY0FnShjQRZyfC3fT3uWfL3HjFj17ua
         iZMDXNJEQlg+nP2v4fojhVk3MOFoQZqnB4NdTnykFvwV7Gx+GRePdRaeizOF7qZWmhZw
         X3tzQ3LC6/0f24CWEMNpXKknxz/ddnjXKU8Bq+NkWGU35S2O6/m5M/AwL0qIBZIxNf75
         6LUNVOGU3Ks7wI/8W4KwhbWHZXkCrjyo2g4JdRHLStUrl9WGktzhXHiblucHqfUUyivQ
         jYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DOhwcP3937IV4/I3AUCZub2ArCcFcEQmAAV0iFEFVrI=;
        fh=AJeq9daNpoekNbJaLmhlODdmlsmXVxCFBp+AYxLKLDk=;
        b=EA4xDIHqURTmHYsR1+4dD7xHG+cISwcUEdr1ZRy4wv0RCfmFbZ+Vw42K6xkITWTKHc
         HhKee4HG1QlDWYtBoGKbIBwxcw1fyKdNTOigZMJqK3dSSbx2DmAKI70Alg9h1EPXlH9H
         /++J58hGSDCuFoD9Afp+582On+N3AWu6bMTXJPMQjJmHL1kJpEuBzsso5qk7mp+MRexa
         re98d5++xXKjfIyYa0tcJRuGnZ5MSm9Gykx7Eng3Tj+6fpHNjkrbxSga4zozO4KY0kKD
         TQlXmXs03DFP4om8ulOnTVcMtJ6Nvl2SfqB90gC5k4gJrQyH0MServLtReoWsEV4WF1K
         EdNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SI2VvEcX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22ac7c3e210sor91110935ad.11.2025.04.14.08.30.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Apr 2025 08:30:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SI2VvEcX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744644638; x=1745249438; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOhwcP3937IV4/I3AUCZub2ArCcFcEQmAAV0iFEFVrI=;
        b=SI2VvEcX3A1aDd0Q7HTjjz4AjGki2OikYyXI6a4a45/NPr+FJlrLoLYxnfTi+DJ1/M
         w8PPOvLotKWgLVJpZ7CSXIOyaOCujVuHPkavmn8qZZAPFLoXkbsrhg2KBWS3JRC8OsrY
         wm8+jSeUwpeWEAW0tO4yBIHdkiZvap9EX7c4kXzqQ3BtMaFdfUpRVs22subvEcxf43rv
         p+vFNnliCM9lj5sum4XLWnNvgmxhHJ0xRbze+Yus/COOX2UTbJn1TXWQDeSl3tZ6Y5sL
         DuPv4orOyUDbamBU1ZVrSMKp2G/5ve4+7cncPpUzPMdb02bm5PJXXklsB7S+vgrXaEDu
         exJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744644638; x=1745249438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DOhwcP3937IV4/I3AUCZub2ArCcFcEQmAAV0iFEFVrI=;
        b=gq5Msihz7DQQRb/Z0eB0yyHpsHlDpePssqXbEGgjZN937gsibR5guzgC1dLmC6ddZg
         TDLZjL4Cy5EVLSOvYl1DvIhx2OGWcS21w+nfNNQEd5jk+DvuZA7nX+O27ExMiszaTjCi
         Qdy98u4t62/sU2TkXW6bsE1JxX50BTeI90gKh1kLd2EfWNWxrK+6qrdbnAjd92gSym6A
         UXVuNf2FJW/Z29teonMjdWPBBQhEaGMi1viA/6CCZs1msOGaKFTagAAhWBjWEEHxFhcA
         6RkviZZ5voUO+QDZ3lKfRH5frSeWVwtE1x4Jtz9gzEsy32BSD3oDeuzVvDQfbHhopCbN
         W62g==
X-Forwarded-Encrypted: i=1; AJvYcCVOhA4kqxwLDL73DaKanZdDBaQ32idfZhSVsHRGhES08D8i+C2R0kffnYVF+DuQ0RKpJnRd5Hg6kUF1hA==@linaro.org
X-Gm-Message-State: AOJu0YyqSpofVTSn7PoHw1kqr9nGUjIWfzJhvx4Ll++o76+CcJY80+Ln
	fMMSvrYGZPjxOlRQCxVUj1bmvNUIxZeUG9JRlfVlMUu+35bX6zWYCT4ZrOkMmvTpkQ==
X-Gm-Gg: ASbGncvZJKMlmfVfpXxF1DAhiswenQpfE00bUQNBgTff8feEHlYzYzo2a2qXRJYrUjW
	vwbIM8rrmn6QP1Jm1+FnZ1meWOUaSyL8+sTsXOrogHpdZI4KhxiYgx059UznhZjvnef47ZCPXV4
	6F1bFiOutq4ChOM0CEZdl8t8vxFuumWUFkLLyvaIPC2XLTa9B7r4vG2jYVnw0lNrs5ScEOftlqK
	Sh02JF2tebbTVwYUj9TYRI1jqgDdy/mmhT11cjNa2ZEdglCQbXe98mKfISVNctzo8gBw9wQHxbj
	a1BryfGjoZrn3piA34k7hYSTqLXak6nZErOHqLCi
X-Google-Smtp-Source: AGHT+IHNJgD2U+K0t5vYeZYvHWnfRgisCyObJFOaeoJMMd/KKVj5+ZOqdLPI4BXOV/Nqm83Dl9Eiug==
X-Received: by 2002:a17:902:f712:b0:21f:35fd:1b6c with SMTP id d9443c01a7336-22bea4fc93emr191716465ad.45.1744644638076;
        Mon, 14 Apr 2025 08:30:38 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. ([38.39.164.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccbd5esm100735235ad.248.2025.04.14.08.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 08:30:37 -0700 (PDT)
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
Subject: [PATCH v2 2/4] target/arm/ptw: get current security_space for current mmu_idx
Date: Mon, 14 Apr 2025 08:30:25 -0700
Message-Id: <20250414153027.1486719-3-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414153027.1486719-1-pierrick.bouvier@linaro.org>
References: <20250414153027.1486719-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: LVCLrXqmxtTV

It should be equivalent to previous code.
Allow to call common function to get a page address later.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/ptw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index fdc575ec8c7..c3e4390175e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -3635,7 +3635,7 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     ARMMMUIdx mmu_idx = arm_mmu_idx(env);
-    ARMSecuritySpace ss = arm_security_space(env);
+    ARMSecuritySpace ss = arm_mmu_idx_to_security_space(env, mmu_idx);
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_space = ss,
-- 
2.39.5
