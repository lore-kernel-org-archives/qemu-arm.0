Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2930662lfg;
        Tue, 9 Mar 2021 07:53:16 -0800 (PST)
X-Received: by 2002:a9d:3b86:: with SMTP id k6mr24323788otc.194.1615305196660;
        Tue, 09 Mar 2021 07:53:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615305196; cv=none;
        d=google.com; s=arc-20160816;
        b=lzmQDJ9Qr+Xew8990lr9NEJsEvc1S2x7j6epLQ3NnFoNt/fZK+9jpwro4A0k3SyFtb
         t1FVeptAEcGN5HTy2C7lTDxJXaPNrahrJhSLoZ+9ZqRpJbXXW2VIaj6ef9CyQZFAAQWn
         +yQSFVNLiCzqfGXsCCERkQiA4ovPZYp/CLTk6PNHQAmMaYSVzC0gWiJmAsTKtV/vYKaH
         ACgExLr2T0eKPCAL3uas3VQ6PhmST2MpBmVdyBygRcF06bDDKx4kOOnxqyhkpe8L8wnH
         n8zlt/kf+loS4jvFx/Zro+Bt7ernZJ1WfviR0rglR6GWcSm+LX/8xgg86J2y+uUemoiO
         HH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=uJkC/FaooZirGuu0VHFDubkoDlztZCrLbkateUX9i2Q=;
        b=hDNGs90nnyEmpnnVveFWmoirdqJdanMILSQUFoy04w9jiPnn0AFCcRTBr0ystPeXZ1
         51HkuwpSY9VtlCtmftJnr6KlCN2D0eA67aM7Kd7CmJgc5/CJ54ibnDpz4ygkOETuIR9A
         HO0/UDKaIuvKDZRyxGR8LG75Rvi5vc4Uk2+2vYL00QNQ3CtmBTX55OPI2MvrTLFitpWJ
         ERY6TlT42CcJlVuyze7HYIVAeMm/sBjPi5BMG3EywFjdk2TO4rw7BTP2lp31SsCaSOIA
         Kcnk29JJSFj6xwT4SaTLVgFXArfYVfIkqdF6oGw2t9IbHNfKcqgg03HN2UmAsabZRbTl
         bCmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QoHwiL9y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id w139sor2429877oia.127.2021.03.09.07.53.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Mar 2021 07:53:16 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QoHwiL9y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uJkC/FaooZirGuu0VHFDubkoDlztZCrLbkateUX9i2Q=;
        b=QoHwiL9y4fzf+dOnsRyy5W6s+l4wLngmQ+/gNxTJhChHcL3uz9vhjUZmanKsPU9DYs
         C0KGGUwt1vM9YSObJbOgRtrvQFg4yOVMuypeazoXsk9f8chybDaBltywLFfwigGex/Yr
         /UsjzLRQZFZrDg9MPvgiWyl5S/UbCe5Jrx/dEkDikxZPrsJ24stN7f+/CQnPuANJj78C
         YOXp6pEM6o34Sxj75oOpb5YUimMvNC1YZmb2JFvymZ6XIoJDh7kJyVI+unFEdFUZWNIW
         hAHB3CbVcJ+EaUG+kf3n5ivgPCi9vwJm142lFohBTMhrqs5efPGRq93bm1hI56fWA53R
         dEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uJkC/FaooZirGuu0VHFDubkoDlztZCrLbkateUX9i2Q=;
        b=G+NGiA5okBZQChxdCwPkXxDE+KuROH2HBunS1QuWEqShkregwvaRmWYKU46M1tIdjo
         1cMltJlY1GL/BkLbl5OjLBMyyLiY9g3FAb/emrWkH5xox4L0KQALxNDvuzIaPimiYPOO
         tTJGlVD2F4xaUpWl17APQPwlUzv1cgjjMAVdQNeFoFWRifm/6wdeLrSsq8xVTnReB+/4
         Oqu87ZYk/AmZX3a8ZRXE1EnFEKNM0bP6BozAE2yCzN7NzFWlkSnNy/eMpuo9De016KkG
         9+oPaGpaEfNtKtX9ITewvRVRz3I93C6sognv1qWGqrrRPwMeLPGAoLzI/27/y2z8Fde4
         GW+Q==
X-Gm-Message-State: AOAM531LOXWo0FZGptytaY8J+UoEAyQhGDAOs0rxRS4OP0RwvpbARzJM
	i5nKfSShBYOW0NHwI/eAc8/dp+VY
X-Google-Smtp-Source: ABdhPJxdN7kGSh3ihQoOYEwEX+tgxqXj9jj9ZX8SLTEZr+1hcQ6nXeUpGr1LaV/a5MwWSfNZIHe4Pg==
X-Received: by 2002:aca:dad4:: with SMTP id r203mr3330198oig.14.1615305196310;
        Tue, 09 Mar 2021 07:53:16 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id b14sm2952539ooj.26.2021.03.09.07.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 07:53:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v4 7/8] target/arm: Update WHILE for PREDDESC
Date: Tue,  9 Mar 2021 07:53:04 -0800
Message-Id: <20210309155305.11301-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
References: <20210309155305.11301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 2WtSOFLgnaJy

Since b64ee454a4a0, all predicate operations should be
using these field macros for predicates.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c    | 4 ++--
 target/arm/translate-sve.c | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index a95bbece4f..6f4bc3a3cc 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2850,8 +2850,8 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
 
 uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
 {
-    uintptr_t oprsz = extract32(pred_desc, 0, SIMD_OPRSZ_BITS) + 2;
-    intptr_t esz = extract32(pred_desc, SIMD_DATA_SHIFT, 2);
+    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
+    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
     uint64_t esz_mask = pred_esz_masks[esz];
     ARMPredicateReg *d = vd;
     uint32_t flags;
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 722805cf99..2420cd741b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3097,7 +3097,8 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     TCGv_i64 op0, op1, t0, t1, tmax;
     TCGv_i32 t2, t3;
     TCGv_ptr ptr;
-    unsigned desc, vsz = vec_full_reg_size(s);
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned desc = 0;
     TCGCond cond;
 
     if (!sve_access_check(s)) {
@@ -3161,8 +3162,8 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     /* Scale elements to bits.  */
     tcg_gen_shli_i32(t2, t2, a->esz);
 
-    desc = (vsz / 8) - 2;
-    desc = deposit32(desc, SIMD_DATA_SHIFT, 2, a->esz);
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
     t3 = tcg_const_i32(desc);
 
     ptr = tcg_temp_new_ptr();
-- 
2.25.1
