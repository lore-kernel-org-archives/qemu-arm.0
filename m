Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2930672lfg;
        Tue, 9 Mar 2021 07:53:18 -0800 (PST)
X-Received: by 2002:aca:4a95:: with SMTP id x143mr3317718oia.59.1615305198062;
        Tue, 09 Mar 2021 07:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615305198; cv=none;
        d=google.com; s=arc-20160816;
        b=VaBZvTUQAh5GVxgh8I6lWWKPAuH3GcSp89qfn9dueQlIKo/k9VOr4WqKN9f6yk9yc8
         9VbJftaUM/X5cZgLb3kkBqeAwT7z+4cmWKXKW1GqvwTn4VoywsVTe2yQWdfxFq0ek6mf
         5MUQw1uh2rc7WkE1Ky0fmwb+/Z9pUlNJH5X659WtGk+hZlb15leXDQO9bI6yGVACVfR8
         osoMO6B+fix/LZkszz5MAv6RjIiLSSpFzRbdUu94lChl/yLYfkOP9fdspfMMxuPAjVKE
         UH1l+MnV0MN+zSNaR69dvzYOLPBO4HFFb5pJT5bgcCZ5QxcK+gciZeSwTvVVBaZJH7oF
         ZKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kPQnPJ7DMhJJR2d+A/Ri0b5LMFWa1kAHZRSsfJazyFE=;
        b=GC+T/uT6xYGR7Ib+wDUAazl5tuEV3HxKRoJJlXDQoiWRgJhlyCkHJyG67/Y+HovQGF
         2wTz1ho4XsZY1MRjESSb1BcUDJJCOeExqFCpy/Ek3RgfkT8bOicfzYetoW6A/gBBCfdM
         gCFoMNSBlo7cVt/CeNgKRlgxCy5atyDDzJ891F95aYO8TflMns9MKKwFCUNrAag1VoiF
         +O/0vcmfqczGbGZ3cANsq8l5tmFruwzHyn6aEg4+/OoH8vrmFmPrTu74opZzKqeOojhl
         xDucdmUuepLqe7xljSTJWY6/MeZC6GFB7NweMYnSwnhBkgwOxiscWhvbwJ/Hbu6R45SA
         NZ8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CGklaU2V;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h131sor4048799oif.89.2021.03.09.07.53.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 07:53:18 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CGklaU2V;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kPQnPJ7DMhJJR2d+A/Ri0b5LMFWa1kAHZRSsfJazyFE=;
        b=CGklaU2VC4z9nSnobL5Chl81RexnvQ2fhx0iuuwEO1vQFMPRe+lGtL1opZysUkbOds
         BjsY1/mEJARUwC7o4pH65C4ZGeAKUFT3slYIpOVLkxTEerNyxy3kribuzp1dk6k59lw6
         E/ChaWqEzD+DrVAqfF6Ta/Bz8+wQZmxBiwmTmIEr3K3FW9qzX6/Lq8hhLU437dHCWVcj
         sQclWVkrpDdzA3hiKCs7c9dbtst3MsVREp6W/u9TFYP6ev5mkMvmjkj+it9g7dAIWHkZ
         6r/taznM880SlJ6KNaMCM3ISsc9tO2z19htYGGWDQ4ZSIzmuyZla3YzLlAmXVrsWY8k8
         flGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kPQnPJ7DMhJJR2d+A/Ri0b5LMFWa1kAHZRSsfJazyFE=;
        b=qJ6tzOVNDYWzABCMhNc8/G4/6CsmQg0WXgjSediggn45YT/78d8QSircvxa2ZCN6zc
         zUwu+4Jl71vfkaYAXydnotYqzpawSHrOblo8HAUL8nMTvpY1VOBy5XgS6F4Fwo9C8lYF
         OIatsvJg169z4dzvIw0w26lLJKWubngVHXiXcMfbZOe1MejdigIeDoqicfDo4XmbqfIi
         FRUCpOmmHrRAxOjAl4SeWwZN7GwQD8Gf7XjErSO3mpkxI//ib+IIZwexYSBIOOvVqqmg
         eu4L1lzDl4/2kmt/lfbChucmQkMgE01lTcOkYen5YRatFyYefdka25hWV86H3v616aFE
         DCYA==
X-Gm-Message-State: AOAM531TXxdR406FOh9eQriU4A7fqoR8KOltcbakWflt505AGDKzpeEV
	kCoqZOLmxVNSs3DSndF3SPpeNo7uC0WjADC2m4Q=
X-Google-Smtp-Source: ABdhPJzx22I8KOesJOPxeMQHNPHe/hq4YtQuKa0CTb3cl+rx1wZ+R3I44vEKjUJe6GjpY3AWnJPBNQ==
X-Received: by 2002:aca:44d6:: with SMTP id r205mr3416941oia.104.1615305197748;
        Tue, 09 Mar 2021 07:53:17 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 07:53:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 8/8] target/arm: Update sve reduction vs simd_desc
Date: Tue,  9 Mar 2021 07:53:05 -0800
Message-Id: <20210309155305.11301-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vSdSNwM99kSo

With the reduction operations, we intentionally increase maxsz to
the next power of 2, so as to fill out the reduction tree correctly.
Since e2e7168a214b, oprsz must equal maxsz, with exceptions for small
vectors, so this triggers an assertion for vector sizes > 32 that are
not themselves a power of 2.

Pass the power-of-two value in the simd_data field instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 2 +-
 target/arm/translate-sve.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 6f4bc3a3cc..fd6c58f96a 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2896,7 +2896,7 @@ static TYPE NAME##_reduce(TYPE *data, float_status *status, uintptr_t n) \
 }                                                                     \
 uint64_t HELPER(NAME)(void *vn, void *vg, void *vs, uint32_t desc)    \
 {                                                                     \
-    uintptr_t i, oprsz = simd_oprsz(desc), maxsz = simd_maxsz(desc);  \
+    uintptr_t i, oprsz = simd_oprsz(desc), maxsz = simd_data(desc);   \
     TYPE data[sizeof(ARMVectorReg) / sizeof(TYPE)];                   \
     for (i = 0; i < oprsz; ) {                                        \
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));               \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2420cd741b..0eefb61214 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3440,7 +3440,7 @@ static void do_reduce(DisasContext *s, arg_rpr_esz *a,
 {
     unsigned vsz = vec_full_reg_size(s);
     unsigned p2vsz = pow2ceil(vsz);
-    TCGv_i32 t_desc = tcg_const_i32(simd_desc(vsz, p2vsz, 0));
+    TCGv_i32 t_desc = tcg_const_i32(simd_desc(vsz, vsz, p2vsz));
     TCGv_ptr t_zn, t_pg, status;
     TCGv_i64 temp;
 
-- 
2.25.1
