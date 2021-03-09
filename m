Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2930649lfg;
        Tue, 9 Mar 2021 07:53:15 -0800 (PST)
X-Received: by 2002:aca:de09:: with SMTP id v9mr3368881oig.50.1615305195211;
        Tue, 09 Mar 2021 07:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615305195; cv=none;
        d=google.com; s=arc-20160816;
        b=RWylE07e1nXUNOGoNnQkDJC/JnywWyR8LJut80v7TKEK1i4+MR18887ao87jWU4BOi
         a7IsdFZcOvNnLZKyTkMlOT+kYEG/ONtyYnADaucMzQDewNOeKdt8EoZK8e1G6c7uqVH5
         /Ic0CcGspiDxe+g7GrCb0yQ7W+T5oBCsAlXh+cdMJKSKNUYA+GaE9yGq8KwV9I8FwvZG
         IWNTDvrj0jxd6tJ/pWGJfSZODgrEktaUpdBU+8s7HuFi3J8z8tBBGcXpryI6CzsXuWHk
         gOpU2+qnapv2oKEkw316fXCAmMJhcz5oKoViSbMpyWOlS39g1tCAw5Q0mI+eE4noZKzJ
         Va6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=za48O+F8pe+cx2YKh2fq/jSCGfZWB6heIOQcKS7+4hU=;
        b=Qw/OLwaXdSaC/qaximbykROvsp930Rk0B0/pbx36/ktqUCl0qhlxdbGA2blGL0eHpk
         zjIv8OtesoSmIOPtZyrHWehUlfGsY0ppxA+QKhdJ1vL9fW7OIkkwFPtjoB9YV932N/qW
         /1I9NkUnOsl+QrUHoHegsfm9KNitlr1017IhiGxMN44l/UmRIAYoZAEMxjylu19gbxLC
         2KZ7I1Em2rkMmj85VfApSzUTQo0aQHPgARDsEuXmwsh3bXf5fRpkm3oWakGxxnr5oSsF
         WyiSgKsMZU47rase6TTbQYRAOWxK0WIWtscLSG+81/N/gdcXocJLhTJ+MrDVBChBlQHz
         M5qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TjgiVrTe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o6sor49699otp.186.2021.03.09.07.53.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 07:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TjgiVrTe;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=za48O+F8pe+cx2YKh2fq/jSCGfZWB6heIOQcKS7+4hU=;
        b=TjgiVrTelXvgtfADV7qMnMzU0YC6MCB3slQ+MpbtDvcE0fhXtI23Cp/aJ9FTFSEF1p
         FFGOELM86zJPyOsZIl9hspptXrLlf6w7xHgbi8LpwyvDEVgzf+niJrETuX8rBJY6cK4h
         oSoiQQ3j5zMmA87R7m7h/rm+WVy7EIMDpSGEFN7UdKud7u84YjGIZLapbZxjR8N6Lnqh
         f2B9GNVweqbZ5vghI21EKTPXfp3+DVmgrf7I3XeHwhDaSRyls5AxjBSSvKLNI4IrsAzT
         4830R7SwV35RLkGuIQXIWgwxPOlUP6BaeAIDX2VHDoqBYjEUYW7d70LI2ut8Ub6t9MP4
         0oDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=za48O+F8pe+cx2YKh2fq/jSCGfZWB6heIOQcKS7+4hU=;
        b=hgdIA05B7xA+wiaqrCnF6cwTPjbqg9uly0I2FU/O7BHYbxJ7zOAzTkZqs6DI/9okdd
         3DdJ9kyRcIBIww5Tby7/pSnz+k60zYiztROBAMCiyjxISxgxBF08veUm7z5InGYLjAoa
         p5b3QjBi+2Uvj/mWgTWNh+s/gbgx6weUg4XG/LLfh2kl2v0Cs8r5Nim3sL1gXNG/R9hX
         0rpExfARzCE3DlOXr+5BLLrm1bVJ/LFC1d/Df0IgYKsobyORrjPhDxfIcUxEpj4fLzWx
         Aj+3ZMLmRx437rod0u0Ym9vg28aSD0IRtQnxQl6/cwmPxCflCmaxdlZuSuxPXW6BRpW4
         KREA==
X-Gm-Message-State: AOAM531QAQe1PUgJF9A+M4V4nNV8p+AnNK9WgGfRXbRsO2lMp8HDBCDL
	djeFnEisvnsI49sdfG9cRhlg8E1W
X-Google-Smtp-Source: ABdhPJzbThi+ZkCVP9zGhvqiaJMM4IusupgOtIhOvi4Lter6+oGWF0kk1ivZmL+/wKKgKpjxFUXZAA==
X-Received: by 2002:a9d:5604:: with SMTP id e4mr25460860oti.198.1615305194901;
        Tue, 09 Mar 2021 07:53:14 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 07:53:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 6/8] target/arm: Update CNTP for PREDDESC
Date: Tue,  9 Mar 2021 07:53:03 -0800
Message-Id: <20210309155305.11301-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wrHHb/s8glie

Since b64ee454a4a0, all predicate operations should be
using these field macros for predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 6 +++---
 target/arm/translate-sve.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 8e0a5d30a5..a95bbece4f 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2836,12 +2836,12 @@ uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 
 uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t words = DIV_ROUND_UP(FIELD_EX32(pred_desc, PREDDESC, OPRSZ), 8);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     uint64_t *n = vn, *g = vg, sum = 0, mask = pred_esz_masks[esz];
     intptr_t i;
 
-    for (i = 0; i < DIV_ROUND_UP(oprsz, 8); ++i) {
+    for (i = 0; i < words; ++i) {
         uint64_t t = n[i] & g[i] & mask;
         sum += ctpop64(t);
     }
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index c0212e6b08..722805cf99 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2967,11 +2967,11 @@ static void do_cntp(DisasContext *s, TCGv_i64 val, int esz, int pn, int pg)
     } else {
         TCGv_ptr t_pn = tcg_temp_new_ptr();
         TCGv_ptr t_pg = tcg_temp_new_ptr();
-        unsigned desc;
+        unsigned desc = 0;
         TCGv_i32 t_desc;
 
-        desc = psz - 2;
-        desc = deposit32(desc, SIMD_DATA_SHIFT, 2, esz);
+        desc = FIELD_DP32(desc, PREDDESC, OPRSZ, psz);
+        desc = FIELD_DP32(desc, PREDDESC, ESZ, esz);
 
         tcg_gen_addi_ptr(t_pn, cpu_env, pred_full_reg_offset(s, pn));
         tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
-- 
2.25.1
