Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047895njb;
        Sat, 5 Oct 2024 08:26:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLdPYj7qEYmOAU1m3JQ0GKyjQF3ywfcLl2lUsI0gcuNGbmcStK1eCVRs3xL9W0RDlcY1Dwk+INuVSbwA==@linaro.org
X-Received: by 2002:a17:903:268e:b0:20b:9b38:fbd6 with SMTP id d9443c01a7336-20bff194b37mr71963905ad.40.1728141970773;
        Sat, 05 Oct 2024 08:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141970; cv=none;
        d=google.com; s=arc-20240605;
        b=FKKxwiDDzepFCZyoa4hOxsdFy853PHVsW4/knY+fRRWbHIaKbVcD1GxbWjER3X3EV1
         Rw8gC3RO0Cr9QL8SR2JrCqIQSTbm4O8V3chleE2Q8rkTK0Fp7t2+OfGRsFU6P6IhCM16
         gplxKPytX7qYm3qArXKAUxK9Yn5vJu3w46/OjERcg8SdgYev2cgfaw9F8xLFUleGVsGg
         taOBobi73sqs7LRGSl61BRfuAqzrWSuaPTDOqNaVhY/fTKnhTLrRUJxiBNwpCM5DwQtA
         eUN1JXQyvAgKoq7OqmTGibcaNAwmikfQx2ZLKKbYk9WAxLlqK6/XrPYglfXxCwoKavDB
         OXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9tqb0TUsQOZF/sRJ8YxWqhKeQa3g/EH2JXyCvd2UdW4=;
        fh=L3gfhcAAaPaXpqKrP3R/vl7mTXTUYWxpzBQRQv6wtdo=;
        b=Al+vV5S9G9FExurvKMXGOEbyK6f0qgJTqNangQRML4Z8lqgptuu25D9/TfZmHrU3ny
         MVmJ0R8HuyEpBkXwXjQePqON2yn6TApzfgveiQpqkEhFPgz9TFGMCVOcDbe8D84zDxli
         fiI2MlsVNf+lxSarTTD8bsL8qgTMGHT9uEVM8RJt7ddiG7aXOUuEgrlM9HLF4IPtMeqn
         fyDk4edxrklo6G6uqrzTKmYk7g96eAQCfYd1w5/3p/bxMD2n1Q/nIuR0+Ndy7O5ySkYx
         TaIJjLrbSYErt6zmk7ner6IYysIyjjUlwabOZa1zdki/AQiBhqzV3ySOelWuiurDcD8q
         yuRw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oMc3a7i5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c1394f298sor9748195ad.14.2024.10.05.08.26.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:26:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oMc3a7i5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141970; x=1728746770; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tqb0TUsQOZF/sRJ8YxWqhKeQa3g/EH2JXyCvd2UdW4=;
        b=oMc3a7i5lfg1BqRraOecfPzKMeNNQhhz9H6qE5I3IERfi2HsCgEI+SAtdH7RFwjLRj
         CaeZV95jTpo6Ph38Ht7BbXxh982aBQPopaK/OclRlSkI8JUkvLsXBzy1GTe9MwpFQ6Vt
         HB/3ufcA9ETod92kvh8ksuhgepI6jRCYYQbX3cLtCRMqryngVYVDI33fSIHAFZDC/bNU
         wq7cFfB372OyffsrBBFD+VRmpaRQXM9/cLF4huP21hKUtDjhWrb9VgqpzvOnpElGQxJK
         qohzIN3PIugRSyUre6MKZOXbZi9v2rv/7UNb5dLLFvW9dxB16PVRrwdhVV8GRh0957Un
         /43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141970; x=1728746770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tqb0TUsQOZF/sRJ8YxWqhKeQa3g/EH2JXyCvd2UdW4=;
        b=kGpj6mtMDucagBPVrbNr5yB9rAuD4zjx0PwzA3eCMdqjqBbzorP5zSsjeQ71t90Ky2
         flNyWX9HWaEHNu2Zrt6PbNzzFxravsNSNCD6MK59zDQV8kIUIwY987m2JpAl7OM1nPAJ
         CWuEg6YapiI08FQ+3PPqquhi1uopeUHTM3KKe3hDJg9MjLctThQFRd81ikJ8t2LfQfuV
         3364gvHNaELBj1TE9XvJ7oexZIQpOKig9In4z9ZNd7yGghO/SjZ69DQJY6zi+WfPXOOx
         Iuy9Ju08S+MWebNJeWpw5ClY8QUDXdtVeoGf3Gw/NIEMYEM1eRv+Vp7eECv0awy5cn4N
         GUjA==
X-Forwarded-Encrypted: i=1; AJvYcCVerNYSIf/TevzNyMCdy8HK/eJJpyP8PZgQ7UMkOb941C8fscjgkctqKpUjkIAKMpggGuTnsFQ92k9G7g==@linaro.org
X-Gm-Message-State: AOJu0Yydhz3JzqBGZX09LcNQEbZq/vlG4L7Ts2FBHR7JRjYWkAMWyMqi
	V7a7uWKNp1zvPxOOla6140lXE/Y0LHT3/TyrtYDIfS5Hxt/jdyYK94vO0hkCDATxkmu2E+hLy5b
	LDZw=
X-Google-Smtp-Source: AGHT+IHAcc49fQDj+6dUv1WwyItmZo+VQhDVyFSsiB0HVGJtSbOyDZXUNQcKgpb3qKjj8UutpLm7Eg==
X-Received: by 2002:a17:902:d2d0:b0:20b:be06:f3d9 with SMTP id d9443c01a7336-20bfe1887c8mr91971805ad.24.1728141970334;
        Sat, 05 Oct 2024 08:26:10 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:26:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 18/20] target/arm: Pass MemOp to get_phys_addr_lpae
Date: Sat,  5 Oct 2024 08:25:49 -0700
Message-ID: <20241005152551.307923-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: l2hs6gPFIT3B

Pass the value through from get_phys_addr_nogpc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index f1fca086a4..238b2c92a9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1684,12 +1684,13 @@ static bool nv_nv1_enabled(CPUARMState *env, S1Translate *ptw)
  * @ptw: Current and next stage parameters for the walk.
  * @address: virtual address to get physical address for
  * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
+ * @memop: memory operation feeding this access, or 0 for none
  * @result: set on translation success,
  * @fi: set to fault info if the translation fails
  */
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                uint64_t address,
-                               MMUAccessType access_type,
+                               MMUAccessType access_type, MemOp memop,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -3534,7 +3535,8 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, ptw, address, access_type, result, fi);
+        return get_phys_addr_lpae(env, ptw, address, access_type,
+                                  memop, result, fi);
     } else if (arm_feature(env, ARM_FEATURE_V7) ||
                regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
-- 
2.43.0
