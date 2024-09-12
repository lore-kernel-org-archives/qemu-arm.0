Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368177nji;
        Wed, 11 Sep 2024 19:42:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCb7/iO4YjXBXC07NpuHxUPy79+svNvuoAIjxnhBmZkNg9SdtJH6gXJ3Y9KumrcyH00M+FvPA9Q+CR+A==@linaro.org
X-Google-Smtp-Source: AGHT+IE3LK/RoCDU0xl8TGI1Q5ZzjrE3OrFgFbdi4bc5zycBCaGmeEAPifVRL6aS6iyazM7FoYjA
X-Received: by 2002:a05:620a:3954:b0:79f:197d:fe92 with SMTP id af79cd13be357-7a9e5ee7bc3mr219845785a.2.1726108943604;
        Wed, 11 Sep 2024 19:42:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726108943; cv=none;
        d=google.com; s=arc-20240605;
        b=deekkGkxw/aZ1BmRE4FU6ggI5DjttwTwcPlNWxulBaKC5R5wBIQGvpqyphVyHY6XAu
         PH3Xh1Ce3+3cwjhjoUyAKhTvMwTmjkq2xZI0mSGwkR/hYgeA/Sx5fPBrWmCqgbKFmjQw
         h2HuXHzQIkW8YEA066VAZDk2fUdNHME0sxuKsihgTfdwNwgZQIVmM4mKC0/Vm9O18A+e
         IOOZGByMVoi6B07uJWZSNymojFpxbBrVTzCpWh33zOXfXM8Aa5RWVwCxj5CbXPw+Lewg
         Dr6rwBK7i3ALS2DXhXVZvm4mGCZBQY5fHs0588dRrOuroswQW7+nICeXMhj1YmoHggCv
         O+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d3AYwzPdHoHu5Aos81gdCbKTZ5PvIr4Bh9qOHvqoApc=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=GQzWLV9I0gp+tuvQLfUFyTAYWyCTvYC78wHecDNqF9Rdk9achlnCgXzczXj8O7Ma75
         yLwBtDJ5a0JgnQ0wJt/fb4t9H3dAkmu8yA4jJhY5dZuODhtlBoPvutSl1u4I1YyNmQri
         RNThb8Fy4zK7QW5yzLReBPz8I9JRqew7oyRExwVMIhvvBhCqA0Cs6dab5P0xK1KNe86Z
         e5vwRgDjGhq13EXKJl7OM0sjbyXuskVkk/UJ8GbYFoZvTExSelFZSfMQrZ+skehvM9Ly
         cMM+Gn2vQ7VOSUSDrTKNMEtphC5ZV27U0Le55b2kigerdQSOHrn80k6zPmNXODmBVobG
         153Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rd8TeEjW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a47eb8si247873385a.442.2024.09.11.19.42.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:42:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rd8TeEjW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1soZlz-0002zC-LM; Wed, 11 Sep 2024 22:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZlr-0002TE-Q1
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:24 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZlp-000485-Qp
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:23 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2057835395aso5358325ad.3
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2024 19:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108880; x=1726713680; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3AYwzPdHoHu5Aos81gdCbKTZ5PvIr4Bh9qOHvqoApc=;
 b=Rd8TeEjWqzwKADlbshioFVUe2NjnKi/9TItdr67iKodPhsAHjAwGR+aRBVBRZelHiA
 CiGcrDLp3g33nbX/Lptd2mp9UWRDl6u/Tzr3UR/WndO9hwYSQ5w1xrjQ52kDUVU8JtlW
 2byd6XmF++NJZ0FrYBiRdF0VIKyF7xIrQwhg0FZbi0XkDr4uAaD5kM+BJdL7FV/+EfnV
 U3+8As4aN4SRY+S8Rm+jMOp+Cm0YcdrwER0lzGPqhIR5oTqL9KHy7fLSokkdYURL+nqT
 XPm1iHitZidbzIvRGhqNwMIceySQ1cTA/Hg7rzyyEVBmpQMdkTYSeV2wFsbuPWxyqiyV
 yxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108880; x=1726713680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3AYwzPdHoHu5Aos81gdCbKTZ5PvIr4Bh9qOHvqoApc=;
 b=XxmuIUlyLZru4hVndaDi0xqOaM1fZ6U5icaSpsymM+zepBSpvArMwhjCbaA+eLgGNl
 GZGt2NnLz9QnC9xhTizUbed1wmNfLlq1xqNm9/8kEKn4+qR1WATDAbJYknz8QCaSMYqa
 lNKQ8UyP3ruQBwVteQ1cx5H/W4S0qKLoxURs3m0ESxKB6jp7Er3Sa+TScHcH5O1+jl72
 ueJ2SoYuslwZIVW9cQR7NjGRSC8JawEt7PGOMPh+2AuAwF2vXXg3g8unSA3HKiE6oSgM
 e+McXyo5NHyA1wxHQ6p6hEdyC/qMzgk1LjamEGMaK5vOhxcJyfdosN5elE/ssZbtAwKC
 ViMg==
X-Gm-Message-State: AOJu0YzbPGpoxa+lsWfe8lUyYWTVlqX22NInhZTGrpy7365Cv4nSkdLz
 Uv9iAH4f60FcU1PcItOTcPwX+mgV/zAJ9xHd3me8WoQQBvF11ZZ0x18zfsfr56w=
X-Received: by 2002:a17:903:1c6:b0:207:7537:c651 with SMTP id
 d9443c01a7336-2077537c765mr9232715ad.45.1726108880473; 
 Wed, 11 Sep 2024 19:41:20 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 04/29] target/arm: Use cmpsel in gen_sshl_vec
Date: Wed, 11 Sep 2024 19:40:49 -0700
Message-ID: <20240912024114.1097832-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iofD4wlQOajd

Instead of cmp+and or cmp+andc, use cmpsel.  This will
be better for hosts that use predicate registers for cmp.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/gengvec.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 3edbf3a262..c5fc1b6cfb 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -1160,7 +1160,6 @@ static void gen_sshl_vec(unsigned vece, TCGv_vec dst,
     TCGv_vec rval = tcg_temp_new_vec_matching(dst);
     TCGv_vec lsh = tcg_temp_new_vec_matching(dst);
     TCGv_vec rsh = tcg_temp_new_vec_matching(dst);
-    TCGv_vec tmp = tcg_temp_new_vec_matching(dst);
     TCGv_vec max, zero;
 
     /*
@@ -1180,16 +1179,15 @@ static void gen_sshl_vec(unsigned vece, TCGv_vec dst,
     /* Bound rsh so out of bound right shift gets -1.  */
     max = tcg_constant_vec_matching(dst, vece, (8 << vece) - 1);
     tcg_gen_umin_vec(vece, rsh, rsh, max);
-    tcg_gen_cmp_vec(TCG_COND_GT, vece, tmp, lsh, max);
 
     tcg_gen_shlv_vec(vece, lval, src, lsh);
     tcg_gen_sarv_vec(vece, rval, src, rsh);
 
     /* Select in-bound left shift.  */
-    tcg_gen_andc_vec(vece, lval, lval, tmp);
+    zero = tcg_constant_vec_matching(dst, vece, 0);
+    tcg_gen_cmpsel_vec(TCG_COND_GT, vece, lval, lsh, max, zero, lval);
 
     /* Select between left and right shift.  */
-    zero = tcg_constant_vec_matching(dst, vece, 0);
     if (vece == MO_8) {
         tcg_gen_cmpsel_vec(TCG_COND_LT, vece, dst, lsh, zero, rval, lval);
     } else {
@@ -1203,7 +1201,7 @@ void gen_gvec_sshl(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
 {
     static const TCGOpcode vecop_list[] = {
         INDEX_op_neg_vec, INDEX_op_umin_vec, INDEX_op_shlv_vec,
-        INDEX_op_sarv_vec, INDEX_op_cmp_vec, INDEX_op_cmpsel_vec, 0
+        INDEX_op_sarv_vec, INDEX_op_cmpsel_vec, 0
     };
     static const GVecGen3 ops[4] = {
         { .fniv = gen_sshl_vec,
-- 
2.43.0

