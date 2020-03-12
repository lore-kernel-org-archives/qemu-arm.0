Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1088065lfc;
        Thu, 12 Mar 2020 12:43:07 -0700 (PDT)
X-Received: by 2002:a17:90a:bb92:: with SMTP id v18mr628151pjr.171.1584042187625;
        Thu, 12 Mar 2020 12:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042187; cv=none;
        d=google.com; s=arc-20160816;
        b=RRgbyL6niV9OwSSjjNJer/QYBQ93T/ijbW/skbi/GseaSa/ZzyygCMLtN0yZntq6Xz
         vmW3UFKEL/2ZtphSGBKEDVSMREAt8J335JlAEV+5mMQZA7OL9ntcy4GrpygPDWE/hwgZ
         u3R83X4GS1wB+45GqwP7MTzobPeK7rU2PNJER/C6UiJcf0wesI3lM/KBUe0NohRRJGSE
         OMTtl3AAALKsXpqPjb5GHjcRcPMD6eyPJ/J0kC0NsQdxBeIfNGvvD6n2uAIT7Y0EUOAu
         oIaMTyMvfYFBZsh9TH3TsafAC8g2TFCdMMut+FbDIXUs0M6GipAxk8Tt1fsRPPem1T6Y
         SD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6fjfG7LN06yH+pNuquMUhvUVJ8pyrVs4uGZznYaGBxE=;
        b=Id8SobG7YlsX/ZgWO1t2IP5YtA+WGx3T68NYzXabkzpYuADvCTv9By8hkDnLD/7pKI
         FORr3oCyZqAbL4ciASoEn703QMNY9Gep5JHi4WPWAjqcvPT8N5SN0ziOq4t3OTOZhAI3
         efV+POxEnKhr0U1PlvcheeyzxoBjLNcBJh1JT2TbofxpXk6dFzPhXiygpVDrSTJX8sf1
         nNI8L0DOfBsMbIQxaEVdQwQOioSHXN6faHlu/9cKGdtNuQ0vLziCE2DP4u9pHQKZPtsi
         DjJu9iDq1Kzr9QdV1da2MsVu8Bj03HS2rrg3VeM9C8XdFluJajvnHKaRXhTwFlQzOq1p
         jiZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w7WAjdqm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l4sor7126551pff.69.2020.03.12.12.43.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:43:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w7WAjdqm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6fjfG7LN06yH+pNuquMUhvUVJ8pyrVs4uGZznYaGBxE=;
        b=w7WAjdqm2IUPa54aUDMzrWvOUWnadKKNZ8zE/Wu55e9dow8az+53kEZml1xoogi3aK
         wdIA9mkwxqtHeN891u8Ilqqk2zevxXmKyXYLCTS3jfbPuR73/qcs4D8umBD7IR3jF47t
         tvIoKNiXsK7SWqpAS7RStxJLcYJD8gzCzPZJTd/Mjct9Nchz3FPtjzpquOzwqUNCGnrG
         MHjNE52OjeBKr8LVG3O+VapEURoY99G3PeKTsRtii1qDtEuBrmTJq3UAE9//7HNXNxv9
         PG87InYvMWZreqbISqdex9pTokXRnorqDcbP7UEzukpsgQhX558jUb4C8pmWVMpdFlqj
         1i+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6fjfG7LN06yH+pNuquMUhvUVJ8pyrVs4uGZznYaGBxE=;
        b=eCX6FX9U+QpWELR2vnuKHh2k08qf1UtkdJmEwHBtnDXJNEo5jj7UspLKoTOWPqtVUj
         qjGx+0uZsBftk37GKai/OFXjozmV/V7Twj2JKoSWHOsLyH710FhyZ4fvkrSB2b8htxbc
         aE/iKWx6u9NiCxFBErUG88x6KshRjgSvU912uyQwFiNa07Rp/fACdkB7N5sJu8U+k9JX
         rctK4eokBStgDFDpC7Zz20RntQ/N0ygRJqS+15+uQaOr9yuhNJ6TDNu+kJiaTcv666Vb
         0ZBf+9oLHqXWW7Z07mr8af2lXZ2j2UEeSH7rF2V6AsF/QEkk8m/zXkNueoqr3MtnEylf
         3NtQ==
X-Gm-Message-State: ANhLgQ0QTXFGz31ZOUHjbhhgatx4aNtsi7Dim9UujyIFvio+OjW4BSAy
	NlvkheOe4KFIRhA8YqhjhJhx03ZT
X-Google-Smtp-Source: ADFU+vsDnHH/9gAegEsN1OI3RsAD0l6lzGLQ8QeM6tbZzGYOllgrqNiUEbLh2NmDXNFE2nRAA/+Fqg==
X-Received: by 2002:a62:7c82:: with SMTP id x124mr1497509pfc.280.1584042186745;
        Thu, 12 Mar 2020 12:43:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:43:06 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 34/42] target/arm: Handle TBI for sve scalar + int memory ops
Date: Thu, 12 Mar 2020 12:42:11 -0700
Message-Id: <20200312194219.24406-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: XyKQLGcd1u5l

We still need to handle tbi for user-only when mte is inactive.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.h | 1 +
 target/arm/translate-a64.c | 2 +-
 target/arm/translate-sve.c | 6 ++++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index 452b4764d0..65c0280498 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -40,6 +40,7 @@ TCGv_ptr get_fpstatus_ptr(bool);
 bool logic_imm_decode_wmask(uint64_t *result, unsigned int immn,
                             unsigned int imms, unsigned int immr);
 bool sve_access_check(DisasContext *s);
+TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr);
 TCGv_i64 gen_mte_check1(DisasContext *s, TCGv_i64 addr, bool is_write,
                         bool tag_checked, int log2_size);
 TCGv_i64 gen_mte_checkN(DisasContext *s, TCGv_i64 addr, bool is_write,
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d86c13a32d..1314b200e0 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -232,7 +232,7 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
  * of the write-back address.
  */
 
-static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
+TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
 {
     TCGv_i64 clean = new_tmp_a64(s);
 #ifdef CONFIG_USER_ONLY
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5b399bb005..ce67b79b02 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4554,9 +4554,8 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
      * For e.g. LD4, there are not enough arguments to pass all 4
      * registers as pointers, so encode the regno into the data field.
      * For consistency, do this even for LD1.
-     * TODO: mte_n check here while callers are updated.
      */
-    if (mte_n && s->mte_active[0]) {
+    if (s->mte_active[0]) {
         int msz = dtype_msz(dtype);
 
         desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
@@ -4566,7 +4565,10 @@ static void do_mem_zpa(DisasContext *s, int zt, int pg, TCGv_i64 addr,
         desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << msz);
         desc = FIELD_DP32(desc, MTEDESC, TSIZE, mte_n << msz);
         desc <<= SVE_MTEDESC_SHIFT;
+    } else {
+        addr = clean_data_tbi(s, addr);
     }
+
     desc = simd_desc(vsz, vsz, zt | desc);
     t_desc = tcg_const_i32(desc);
     t_pg = tcg_temp_new_ptr();
-- 
2.20.1
