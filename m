Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2930624lfg;
        Tue, 9 Mar 2021 07:53:13 -0800 (PST)
X-Received: by 2002:a9d:1c8f:: with SMTP id l15mr18143929ota.29.1615305192844;
        Tue, 09 Mar 2021 07:53:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615305192; cv=none;
        d=google.com; s=arc-20160816;
        b=uXuehgaeKY9JFxzLY4NUefI5oCJisf/yoj3QtKJbSh9Oq/7K756rWQ+of9NmbZUfbd
         6cgjM9b1JNuA3Gas5EEfUBCG+HlavfqFmVbdt6E56VdLLP9EBoLYSGFyftm5lrlub8Vc
         YKDt6KA1znYojpVnCiSDz6aD1NSYDiV1D41Y97iViv88nqs4wF+ouPo5dx4r1lvAHjFg
         sqfyqfipFoBQSIJ+rYJVuBbV2BDIeFQwwd7ZXWI5I0tIUiKNLQLKeTvIHWDzxQtTLoir
         bBxWDc2+q645Q+89Ms2fLjBrRWlWcZiWl2Q8PfzbWDdmy0rmPU3/RzZQSUA6RAZ5A3m/
         lUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fn7JFzlpxJDHE/tSppCZQRf4vgj66IW9pBItwWFchwo=;
        b=yGaNSCFhsT3lrQYp7yuc4FNCyXpS7cnn4S1R7pC6Mo6YCEc09ZjuzT4KRLCOItPQK4
         YP7V3SB+XiKHSuHfzhnG2rNrBnEGELB0xF5K0z0mFRnMFmsGXS54/LkWKYjdiUg3/RK/
         NYnLPmIJbErPJU1ZAvRpAvxgJ1bNOEKc4KfVASWsIEnwjVsN95ijYx2raZHcK3gJV/+l
         yYzdfEP0Ars8WIiUt+SVZhGeg/mvews/Vlr3nBgQjSHTVlpiweDgKppo5etVJg7JU8Sa
         vafMOCNLlwrzqYZoOiPJscplNa0UydekD9ewRZRy80k1/uYPZcGCNeemiw6+8inSx7p1
         T6+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p4hX0qCT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z5sor335085oic.157.2021.03.09.07.53.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 07:53:12 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p4hX0qCT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fn7JFzlpxJDHE/tSppCZQRf4vgj66IW9pBItwWFchwo=;
        b=p4hX0qCTFxOOwJM62HuHkgnmsY80aAwzez3f5QmrBkJvHJcyBnW3OZVWMEAGI3iKuY
         ZsqoY9c09tdozB+0vIhulRABjYtVk+QcxlWdCTea7j9VQVBorxKAo+uoDQXAKmyYs6Tw
         7Z4PWt1TTlGe8oRifiJoaBCste59LiI/mgiRqn80yH7vJ8lwF63764oOERhjJoUu70fL
         rXWtlMjiXUUpi7DKJYSamTP3ArM5u+ntSFeSs3vNj2TuxcqE8EsN1yXhgnnTtNFGOIDK
         ZQt9qRbGyg+5PTW81Ty7zbTHjdXy/o6N/2ejO2I+QLWhsKZ6zYAtaHAGboA6UblcTH2z
         ym8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fn7JFzlpxJDHE/tSppCZQRf4vgj66IW9pBItwWFchwo=;
        b=P47/KW5cjq6y8AKovuKoO/ar/RX/pNPGmebtCV6ApPOwrW33D1P2PNKSLz1NJlU/uE
         5UZBNkoAP/6JHIKYtgVdLfV4DbEpqxwxiKzLWbdjoQtLNfhLgJkXklhNI95hqSQd7ow+
         XJEegJUB4uD3uEaEEhRnU7rUUfvefzZ1gw02e04rEZXv2vJZAj4Hs28G9hR7E/3w00Lt
         4Hk+U9bBMPGnQE1zMI7vG7yHs825SXAlBRQhFxNSKHRMbG2wWVC4JUbgJZmtBYPRPQEQ
         hXxVFqEJVoxGy+tKRnO7Z6RWVuxAvfjwGyNYKjqb8s9/UDtJhjmnsE6bQBhiQsqGa9Mg
         2ZSw==
X-Gm-Message-State: AOAM532cxXVRkW/5S0xrbHs8U9IVS2+2ignm9sbT1gSVBm6XV4PCUe4l
	f6Ee/2aMb/N5mIipslq1xU0Od1Ru
X-Google-Smtp-Source: ABdhPJx10whY1aelml2lhqnysuuAV03Mfo44j4ftun5M6NREQrLaFzoXAuLLkDBq4+Y/mJcnV17osA==
X-Received: by 2002:aca:f597:: with SMTP id t145mr3397980oih.121.1615305192538;
        Tue, 09 Mar 2021 07:53:12 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 07:53:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 4/8] target/arm: Update find_last_active for PREDDESC
Date: Tue,  9 Mar 2021 07:53:01 -0800
Message-Id: <20210309155305.11301-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: fuw6Z90hxCFT

Since b64ee454a4a0, all predicate operations should be
using these field macros for predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 6 +++---
 target/arm/translate-sve.c | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 981895a17c..224c767944 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2237,10 +2237,10 @@ void HELPER(sve_compact_d)(void *vd, void *vn, void *vg, uint32_t desc)
  */
 int32_t HELPER(sve_last_active_element)(void *vg, uint32_t pred_desc)
 {
-    intptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t words = DIV_ROUND_UP(FIELD_EX32(pred_desc, PREDDESC, OPRSZ), 8);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
 
-    return last_active_element(vg, DIV_ROUND_UP(oprsz, 8), esz);
+    return last_active_element(vg, words, esz);
 }
 
 void HELPER(sve_splice)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 27402af23c..cac8082156 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2302,11 +2302,10 @@ static void find_last_active(DisasContext *s, TCGv_i32 ret, int esz, int pg)
      */
     TCGv_ptr t_p = tcg_temp_new_ptr();
     TCGv_i32 t_desc;
-    unsigned vsz = pred_full_reg_size(s);
-    unsigned desc;
+    unsigned desc = 0;
 
-    desc = vsz - 2;
-    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, esz);
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, pred_full_reg_size(s));
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, esz);
 
     tcg_gen_addi_ptr(t_p, cpu_env, pred_full_reg_offset(s, pg));
     t_desc = tcg_const_i32(desc);
-- 
2.25.1
