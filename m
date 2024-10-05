Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1047733njb;
        Sat, 5 Oct 2024 08:25:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUF68X2bwvR3Ix5TnjbBQVlyDDsPrEIXFp9rdPHQgscWoygQCzFHx2bKpKS1iMHPKHyNzdOEQZeBRIhLQ==@linaro.org
X-Received: by 2002:a17:902:e54f:b0:20b:9698:a234 with SMTP id d9443c01a7336-20bfde65b4dmr83396035ad.8.1728141954242;
        Sat, 05 Oct 2024 08:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728141954; cv=none;
        d=google.com; s=arc-20240605;
        b=CebRKkouZ5eCArA5PMAGPuOD6tFsFqKS2NLfpdN12C1sPZTwBIVJx4KOf09UZvyXPP
         ZXtElDlnIS104pHwVvrMSeM3vAIxl0AZ6pS+v7GzzGhP/asQ5ZX9TRDS/wYL9xlfwR+j
         xXDKNpWQjnK7yHtNJqROkBJNDhRjvxCCMRrcSoUdjfyNFNnyO++U8ucBmwR/Ca3YagqB
         7Hv1x6c9vEFPaSxqOYFWVBs3VTvTmHQgQeBxr9zmLPPSIE9GecS3NxgXjtr43iKIDaxi
         WR7eOgFzRM6RrfS00w4mJn7AiJZt6mT17CDHKvPIhWcWgqMgPJ5Co9RIw9ugRJOJpdsE
         ojWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qpc+gtvz4QF2D7U7hwk6I/PwDTmOhNNc5A8A2G2CqV8=;
        fh=jP2DhuYJ1mWELDIQZJuUVVO2ccA5dYBvmrXwcYimNHM=;
        b=gKYH4m4fxEN1NJm5V9YEhl1UygSDtk4gwQ0S7G2er+5Po/Jh0D5xpGmzphot+TV2qc
         N2eVEk4IzCd0ap1p9fOrfJF9qH5LYHVLktNhZgCfJzf4gYyd0XUFBXVyHuBVx09k5TtQ
         ymlJwm+ZxzLfsAdzg+SjCXck2mqswjSfLFJfGPAbnstSUxB6DswBXFu6UYJy7UEY8nD+
         JuuM4J281g1PJqNya/36aYviXuyMbI2+/S6pjk6VVQRuP/yxZZlfhs4RrS7DAt6nTsTw
         0iS6Tv1rnaVZ17UoEsm51w+cl/VogXj412uxU4YQZzfBaX0z4uMOViEXUAdZKhjcLBXi
         zCvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PZs4XAdb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138af96dsor14869135ad.4.2024.10.05.08.25.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 08:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PZs4XAdb;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728141954; x=1728746754; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qpc+gtvz4QF2D7U7hwk6I/PwDTmOhNNc5A8A2G2CqV8=;
        b=PZs4XAdblxnQGpYoOFWa3tAzVnc8wLNbmDAmsyF1yVjzcOM3RYQO6pglfZck05gPjD
         5rjS5fPAGoV7y9m8tx/d49EVp+Fq3IRv5Bd09eMMrtKXsp6gHQ3ohMcJznODm5ysPKF9
         dKvLUBDCBFpfkb5N/82XTZi0nGyZ1LloM++K+HiBWqIrt591emvQ6F0dRgU1UPum84xW
         k4wFJxyGvR02/MNS+SSoGWR+RpFtlXCBtl0zwQsDj9xVBCr+zT4wUHvxyIxOXQM4BI3D
         vXw7Bh22ZK/kefaTDjSqseZKvGYAGbUu/d1zZ5d6zBKVAMWstCL3s9kC1obgwMzB39dx
         z6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728141954; x=1728746754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qpc+gtvz4QF2D7U7hwk6I/PwDTmOhNNc5A8A2G2CqV8=;
        b=DKHM4yaTxF9D57h8exBiOhr7q5pqwKp17zZhKIYl3kM/4y+1l2NCQdM23V59XysMUx
         Hy+3eszGZunB/wzo2jH+bsij617jA8I+FEYUfK0lrvHOMu0YeeBZUMBkbDw5QnMAjpkC
         QTB+ZJ7nXIFng9URiW2FAs+jzZ4elzFM7uMhSkvOaltS9vJXfHClFsRelXEPaVRI9d5S
         IH2wcVHVZYihibewW03dcedMbQRQBXLRx0j8qFbZL3qfvQcaAEl02kmU2Mu1ZXH1ZPrJ
         i26VpvcxjSZ7eGK8xLlkCdEwTjYvX9bUMbJWBmp8+ulNCfH2Ny0I1ioeeEvbI7l+lXx/
         vgRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmFEIx/bKtji5N2W98M1EPIOW5V0VAOb1i0Jiq3aDTU62ntxb403hF8dY82KYNp2GKffnD4ChkzDLAcw==@linaro.org
X-Gm-Message-State: AOJu0YxGgcWap2jgkLDL4DpHdgA7vclWZCtWwLuOW4DhG9wRJHyGZkUk
	8LVt/GuR0mSJ8KDfOPJOfG2fGX7muNF0rg+qg9lWXP0+HhkKDskj3V7vG4DpRYM9qg==
X-Google-Smtp-Source: AGHT+IELKa52UOR7Ytz4WC8NdW2qQ7qz0VWYMH9P15Fb5pfsJzTN9y4328hD9lJpQGFW7j/3iwlUjQ==
X-Received: by 2002:a17:902:f68f:b0:20b:54cc:b34e with SMTP id d9443c01a7336-20bfee34d54mr84315875ad.51.1728141953851;
        Sat, 05 Oct 2024 08:25:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1396948dsm14351765ad.225.2024.10.05.08.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 08:25:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH 01/20] accel/tcg: Assert noreturn from write-only page for atomics
Date: Sat,  5 Oct 2024 08:25:32 -0700
Message-ID: <20241005152551.307923-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005152551.307923-1-richard.henderson@linaro.org>
References: <20241005152551.307923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0h4FwkFVGAEU

There should be no "just in case"; the page is already
in the tlb, and known to be not readable.

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
