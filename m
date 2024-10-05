Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1147719njb;
        Sat, 5 Oct 2024 13:06:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzmstPfse1Dqf01jk2Gx99/sCd8Zvri4QswOIzv4nI/M1tmu9ygUEuqwmDeKdDw7ohEI4LVByvoHUkEQ==@linaro.org
X-Received: by 2002:a17:902:d4c2:b0:20b:770b:ad3b with SMTP id d9443c01a7336-20bfd9a8db1mr94266765ad.0.1728158778789;
        Sat, 05 Oct 2024 13:06:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728158778; cv=none;
        d=google.com; s=arc-20240605;
        b=BkaCH9sSYV26SNBcGg8Ks03BLlHDo08fTmc623pepQ/F0yU0++VtwvQFd3zZ8ioyF2
         +VgA7eAqgkATKL0ApnH3+Y+Tb8dLjEqLmP4CbF8PF59fQ/ZcX6ItT32wlZ/LnArogJv0
         lh9YVdJx8i2bIiKzkFMDPbqIx+SuhMdT4NvsaPEXttiYgFcSAzb39VQBh6fwewR2GdeR
         Bh8bEePyEUxUG5VtcWw7eNZDkmj2F5Jc3AmN7vg0+gzMC3ZV6czTT6ZS+jzodK3tz7No
         QAQo7cvX+ngTdsMMUAN4Dyyf1ssfm8d2V6UQrYgA57XJjbnDzGrLhIhCmh53IvfDjn0v
         R6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=9tqb0TUsQOZF/sRJ8YxWqhKeQa3g/EH2JXyCvd2UdW4=;
        fh=angiIWa498PYG5GuDBdqIOY6bEWd/MndvO13oZqySe8=;
        b=lj+baCxxjZRPQm3NCu+e1JV0fyYqhQ6I/xlkmE2R+2CL+tx9fRfb59oQ5BQtiKkVYT
         CHJdCMhO8CIqpaZTBjUv6ww6zndwMJPIb3fl+25hKmqHszyRBJcAfcL2AfEDvNgaDU/H
         U9fWQfY/2nJf6UAZ3Cbtk/tp1k7As6jHHP2MbaT/+qgHLHmlKCI62w/kCBUn7FaKMn1P
         /jG7Ny5F2D16n1sNA6wuEoo12Izcv+d637YtU7/nSWfFASTmezh6qzOc7r5s6V/gbpND
         wPXnwqpLmbeHhWyog+VmwBwLXLTf9CB0jycdT/OZsnQk6OmcMFp3w0TkWCf47H+t6fLZ
         Wy1A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T+9vmFyY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c138d4f98sor13558325ad.7.2024.10.05.13.06.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Oct 2024 13:06:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T+9vmFyY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728158778; x=1728763578; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tqb0TUsQOZF/sRJ8YxWqhKeQa3g/EH2JXyCvd2UdW4=;
        b=T+9vmFyY0cU68+bFw7JHMz6G6cElVbAu0JtH111hB1el23gNyOyK3+31ks4JAHkbAy
         0xj4z3/gZtuE5d+WSXmUVBW6izJbMkD0EAmDjAwcLSQfuXDZR/mYe8k7vyuI54AFed7r
         9ncQ42u27whyqVF2ZTO3NLb7jo4/TUKFSc1NR5AqwcB8+2Ivd+pyMELaX/ydALkKVuiw
         XVO+PY/L17x8HYnikjunRHzHplDkpZhpR6PIWKssrg+yxg0Fn9vnGcrjAjNmkdt1VHWZ
         Sfaj2iXpMd4fNvHkJIuxDAG2BCriFKb1/fFSSdeh9vsy+TFEikaM9ySvnPatq7nMNTI2
         mnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158778; x=1728763578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tqb0TUsQOZF/sRJ8YxWqhKeQa3g/EH2JXyCvd2UdW4=;
        b=dtbCsexfE2rFBpOcc0Eocsp7KxxsUJONGst4yX5ofjaLwXke3M8kQScg0q7bhN3dMy
         jQObGcrexUzAv9EsTkoSusw5SOWsB9CQX8rlSVlUFKQY1lx5bLPLuX5uUAWqhFAzAaCG
         SbpnyXd3JgGXmoPIxFJY4zRpKZBuWGvhcOwHu3QQ6jDD7+MDHZVoQwZHiMcDJ2Bf05ZZ
         wZ7RKQ5rmBb91xUgdjvFsF1CGG4ezZ9tGo5zz4v7P/1fMCcHiLL8NBTjc5CUu8N64IDF
         no2kC3WBRl1r4DMcD0SUVw0AGaLwoYeEkw1hg38bK7MMcWmkdpoQr51FUqgcvYd4LsfJ
         oFBA==
X-Forwarded-Encrypted: i=1; AJvYcCUKEXsvDRLU4NvmivicsT2tl+2DlIjlf5MxZ7B9649RTPKwcMLAqFsJRgPUGC7m3EnwSElI5VX+h8kiDg==@linaro.org
X-Gm-Message-State: AOJu0Yzb6INjMj3lFoiI38AzQY3SnAOIAdREbDvQQBM/eU2qJlfiEoai
	UXqKBxXX+czvBXa5+3z66gUTDnCwviKAp9iHZDiN0JF64zxKEL5VOTMZqCEs4Lukbg==
X-Google-Smtp-Source: AGHT+IF/QbpbF3vd5RhMGi/uYgncSfdSoTpNoytfe03axosXsTK4sk6Oan6NQUL6chZLVm5cLU1oHQ==
X-Received: by 2002:a17:902:f78f:b0:20b:7731:e3df with SMTP id d9443c01a7336-20bff1a5c04mr101016475ad.43.1728158778416;
        Sat, 05 Oct 2024 13:06:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13931055sm16493405ad.139.2024.10.05.13.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:06:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: deller@kernel.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	linux-parisc@vger.kernel.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 18/21] target/arm: Pass MemOp to get_phys_addr_lpae
Date: Sat,  5 Oct 2024 13:05:57 -0700
Message-ID: <20241005200600.493604-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241005200600.493604-1-richard.henderson@linaro.org>
References: <20241005200600.493604-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: H18VOVYHyPp5

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
