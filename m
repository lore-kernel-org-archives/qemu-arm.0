Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp531938njl;
        Tue, 8 Oct 2024 17:04:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtiOH0xiY8FXLgyJA8kU81M9d7esIYiFZ+AOuRD86J0ZIaBEw8IUsNXzmpvr57cz+zMeKF7bbzasr4cQ==@linaro.org
X-Received: by 2002:a17:902:cec7:b0:20b:4f95:9335 with SMTP id d9443c01a7336-20c637f77c8mr14482305ad.43.1728432296667;
        Tue, 08 Oct 2024 17:04:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728432296; cv=none;
        d=google.com; s=arc-20240605;
        b=V+5MbCk0CeICsUF/e3CcLEDYbMN1Z68IUgI1yP3NidGUWMt35T0UmFr13fLgEDKcQP
         9yBcLZElHC30ZFGFTATp+hsUlxvMbamBAhSh9QamXlc/dvr4XEMyde6WFJpbQBKTeHtd
         cYdAM2Ay7IusnYLJcbzZ06FHqF+KaVUxw1WCffxlOZaGBM6tQfSOJkETTpR+xyZnMvCc
         mKWYAnFozgUVFVdZ+Z7ERgFLZIi2UqXevU3eRFcyzGQxWE98kUoq4gGiZDcM3Tu7LU41
         fpC0QtY7Kq4i1gjzD/erhLpiHyc0FW1hSVoI8d+WhU3O/fPhneKQHm4u2lOhsyKNj9rq
         kZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5sM2rASXzZfAaByCSG4X7yOvvA/fFZaOvGmejFsljDo=;
        fh=HOd9+aRZ7Mo3GODAj1FtckCRsZte2bAmI2tQIJxQRa4=;
        b=j/9lLNNJ5xHDqqSbE/2iU4/kSKMP+5X3pd4VUeYVUJ2sj4hdXChnkJ3sa5uHTnIe3T
         t2AFzdQXDlnhj1btl0YuVCJl3UwGlgtwt7LgRs27OIq2E1GoTm8qmnyBrLxCRt7+Hgvi
         wgEDEoKaNOKWjtAlZrEJxNeNz9y1vGngsUCPJtNtwjFLRPF3LRJmrrjeFgq+s8M4Ln2L
         4DMaZHmiDRnA1/L1Wze8KJVTBREtGmIGAla98hXOodwGgS/oda9bbM2hVjfhNsz/YRTH
         n3k3b94aobT9+tJTn6/BDMAXMFfJtsjY3ldjTcwhDYDJCVfskqmvudtwq/LMIP/VPO0i
         vUrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mHX4EKkR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138b0f3dsor67457175ad.5.2024.10.08.17.04.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 17:04:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mHX4EKkR;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728432296; x=1729037096; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sM2rASXzZfAaByCSG4X7yOvvA/fFZaOvGmejFsljDo=;
        b=mHX4EKkRTSqmkBJFkbsJ7Jq5PLVk38AW4xzpt8QgDL6ISv2H6aB4EQ5D1/yrYUWPd2
         vzcojFYlDpIcojIxShST2wnqv7YdJkW+iXFxY6tX70Ye4qA9IEPp5Xy8ukqweWiZS1v8
         /HGH4VoiSGJ4BI31e2NhmE2f9fFG3TeYmyoKB4WlV3yHwOwbmcz2SJv6eaG5Q+gnZ8Kp
         EA8TR/kowN/HmhSWeJZqP1+eC1GoBIXD03CDeg4AmuXq2PR2c+BZtU1Xr3K2e6MFNFH4
         i/1lNUg8iyGZWSeLfQzIXQIKlVkLxVe1rcBnitwB+0uvXDsy64Y0lAw0XfAZEWBWx/Hz
         4/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728432296; x=1729037096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sM2rASXzZfAaByCSG4X7yOvvA/fFZaOvGmejFsljDo=;
        b=mSj7yqBW+VbzB7woT5iEDuPMs/Epx8+BbGG1DB4MoZIC1ERg1W5ODNq5tUu/ICGxpE
         9YH65QfsTZg7x6nF9sg1UXYx8XOj90CyHkyZflIAQydJZiy58H1XBS81OlxZ6YrIZSWn
         qtflT04eL1agH6oOw234yp18PxaAE+fKn9AiYS+YMaM/GQdoaiNwZyrnT1GP1gTSxCFg
         UbmCuWWOesAkPn3HMOUepzJlkoec0HGmlocP2S1UePgI8j0mqeOMtyiXP5r1AkiA6c8J
         J4Cf6MJ6r3rs29nTf71LsqQwzYrMU9nS6tp8hQBECnalqoV77HnS5QEn+48uAbSn1YFL
         jYXg==
X-Forwarded-Encrypted: i=1; AJvYcCVtHQ4/jBgzl7gRITGh+4p/9U3PboFONHChYych9EBGVH0FIug3+/1MzRNhvfwYStWsxVd0soCL8G0m+A==@linaro.org
X-Gm-Message-State: AOJu0Yy56oakT2/qsyhRRnKpKGWwSDp+sXqIjfOwhsmX+HW4xb2sZTY2
	rt1y9M0gb/n+jARk6GtfDoAfyvBDtBYEp94H7qBTv0mTenHqe7OVwfcaxLMtnxbwLpvWm+3/jKG
	Rr/A=
X-Google-Smtp-Source: AGHT+IH2ZvMU4bGuSg+tDG+ztb5xg61iiZPQqytdtvNBcTuZ+zmK3VvxDZbtlEMK7wthugBWGqHljQ==
X-Received: by 2002:a17:902:f685:b0:20c:5c37:e2c6 with SMTP id d9443c01a7336-20c6375b1ecmr12035995ad.11.1728432296270;
        Tue, 08 Oct 2024 17:04:56 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cecf2sm60705105ad.104.2024.10.08.17.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 17:04:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 01/20] accel/tcg: Assert noreturn from write-only page for atomics
Date: Tue,  8 Oct 2024 17:04:34 -0700
Message-ID: <20241009000453.315652-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009000453.315652-1-richard.henderson@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: GLS+UgGSCBeW

There should be no "just in case"; the page is already
in the tlb, and known to be not readable.

Reviewed-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 117b516739..fd6459b695 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1852,10 +1852,9 @@ static void *atomic_mmu_lookup(CPUState *cpu, vaddr addr, MemOpIdx oi,
         /*
          * Since we don't support reads and writes to different
          * addresses, and we do have the proper page loaded for
-         * write, this shouldn't ever return.  But just in case,
-         * handle via stop-the-world.
+         * write, this shouldn't ever return.
          */
-        goto stop_the_world;
+        g_assert_not_reached();
     }
     /* Collect tlb flags for read. */
     tlb_addr |= tlbe->addr_read;
-- 
2.43.0
