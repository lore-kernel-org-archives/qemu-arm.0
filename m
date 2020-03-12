Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1087938lfc;
        Thu, 12 Mar 2020 12:43:02 -0700 (PDT)
X-Received: by 2002:a63:f450:: with SMTP id p16mr9582070pgk.211.1584042182138;
        Thu, 12 Mar 2020 12:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042182; cv=none;
        d=google.com; s=arc-20160816;
        b=O99dnxU26wjC1Ot+I0336cNLeQKTm09mMU6b9sZeuww+Kg//tPOdOaT7GV80IN3Y27
         /oMkUTH5Gta+vi6uyrIyA7ob7bioGmDFs3E3rYUbkY5Zk23c/tihnovQqMHIE562d45m
         wSdRXSRfdkOwYJtAJ5f3yKszHVxnc3tgnk3W4e70Uwa4Ft0p5O1dIJd3G7/ASLYGweT1
         5UF1RiVA3qOn0Smehg7B0LwXDAKxCOLISG8la6ZXM4mMqOJtPig1oCKkvas2T7NyG7hM
         HSsjZPMRVu4xmvqASPTuVi4Qa/SFAe6caDoPKQmj2RwMAVcXCJFXEq3TBCklSfm5IBWe
         H2Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tHPURWIXRjblQZ58gS3vbMqtD53IcLCIb5jBh5LhEBk=;
        b=JzJJfS+EoLTR6GRL/OOQacfjuF3jLvYFv2Z3vLs/sgtWwnNuPYZrNLBSzKpqHkdoYB
         QdOPW3Aspau0MB3QJfXtCCNHjfr5DII6w3PMx857J8QjPE/Z0TnlvP7qTqBvq4ACrggP
         DvqWoF8F8+kPFlDuJg2NPW9Je+p0BLPK0xXVf3aedscKD7cSKltqOtoZtGYomh3lDWEx
         TgtUOt58cTg0syZpcmZ6vlOYLj1NM09zb5U8zBelqEBpPguI8Jql4l7Z93jqReiiDaVM
         DSkztJyc2dINxyV2uWHTrbhtcJq3QbYJlAxIMPyojWZjq2Yc0uu4PsyvRP047AXliTxQ
         /flA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlOZmQFo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v7sor7421858pgc.59.2020.03.12.12.43.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MlOZmQFo;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tHPURWIXRjblQZ58gS3vbMqtD53IcLCIb5jBh5LhEBk=;
        b=MlOZmQFoWQ4BcERTNAds4uxhqMuCO/enNBCMxm2iuR8i7FsWL3S/cxT5f036TcYZ4U
         HlSa2YxwlY+FlemkiBU8CJAN04Na0ofH+05kOPESp9gLLSqKCd0wweaTX6B2nvXrUbpS
         csnTHbWzOkQG56KC4/uNjqPbzo3hDbQFIvid7/bjK0hEXABkJgd2fDqLLKufrjdC51Z7
         3zPyoGEjzj/b3wUap8rs1ENOrdztnzAzTgTSRSb3Ssk0oODPn/BHF26a+lDUVawMUj68
         QNZ8xzLe95x6rqTL3QFN5xiEh+/qQvV0nARGhMxSPpTvle81ANNwUJgIqpS41svM8Gzm
         vHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tHPURWIXRjblQZ58gS3vbMqtD53IcLCIb5jBh5LhEBk=;
        b=gWjkMVVvMJIUE3JbPwwUFg8Ef5XIjZauPkE2TvqzY6zhlmI/8OcIaxgcA0pS/wASh0
         kVcU3Xoo9INHOhs92XdiEZVHkwZMbElvdYutdsOLTrMGNvZElCSuViaeIX3tTn3rBTJN
         SgGE3V3l8BZCjLel/oTOd3BOr3FqEfRG1BlCzq401t7MMSJeje2S7IdkLmG/RZ3F+6QF
         t8lZNXkEpoXmvR5pRiWhT2yD3aWbH73vn8XyB2BCaewwQhzW5fqiKl9+W9IuwlhCC/Dl
         hHuDK5no9Apb42tNfK37YfEWBkvfjOROGDxUbE6dtzYMGFHe1IENykpWJvggdgLIRwez
         KXLQ==
X-Gm-Message-State: ANhLgQ0t//9kG7d5GzvdUlQK7QFtlHkS11vM8C11sKql0RZ8kpGut80e
	ZIJPprMhc4I26oz0KTsW8cYvY9MC
X-Google-Smtp-Source: ADFU+vtFMWclMd3YoRHlJ5cMw94ueR6YapU3t7zRcDypGwQNnxaRfVG+nygU5ZXL3NfEgaeZhMbB4Q==
X-Received: by 2002:a63:330f:: with SMTP id z15mr9534986pgz.104.1584042181608;
        Thu, 12 Mar 2020 12:43:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:43:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 30/42] target/arm: Use mte_check1 for sve LD1R
Date: Thu, 12 Mar 2020 12:42:07 -0700
Message-Id: <20200312194219.24406-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gg28rGLjZEg+

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 49d2e68564..e5d12edd55 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4850,16 +4850,16 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
 /* Load and broadcast element.  */
 static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
 {
-    if (!sve_access_check(s)) {
-        return true;
-    }
-
     unsigned vsz = vec_full_reg_size(s);
     unsigned psz = pred_full_reg_size(s);
     unsigned esz = dtype_esz[a->dtype];
     unsigned msz = dtype_msz(a->dtype);
     TCGLabel *over = gen_new_label();
-    TCGv_i64 temp;
+    TCGv_i64 temp, clean_addr;
+
+    if (!sve_access_check(s)) {
+        return true;
+    }
 
     /* If the guarding predicate has no bits set, no load occurs.  */
     if (psz <= 8) {
@@ -4880,9 +4880,11 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     }
 
     /* Load the data.  */
-    temp = tcg_temp_new_i64();
-    tcg_gen_addi_i64(temp, cpu_reg_sp(s, a->rn), a->imm << msz);
-    tcg_gen_qemu_ld_i64(temp, temp, get_mem_index(s),
+    temp = read_cpu_reg_sp(s, a->rn, true);
+    tcg_gen_addi_i64(temp, temp, a->imm << msz);
+    clean_addr = gen_mte_check1(s, temp, false, true, msz);
+
+    tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
                         s->be_data | dtype_mop[a->dtype]);
 
     /* Broadcast to *all* elements.  */
-- 
2.20.1
