Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368279nji;
        Wed, 11 Sep 2024 19:42:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUesi93InZ8RGiOmn05rSP35ttrcoBFtEIeehM8ce3Oc+MfDH52nv2/HTJMklltrHm/aRh/CjhVOl8O0w==@linaro.org
X-Google-Smtp-Source: AGHT+IGMEf6VigzbmkKckxXqe6Q8v5NKns/lLSzYmHHlmgFxbtM5JX32FlvjxAiLa7an5OQbobcC
X-Received: by 2002:a05:6214:3992:b0:6c5:578e:74ad with SMTP id 6a1803df08f44-6c57351a69cmr22466226d6.18.1726108978861;
        Wed, 11 Sep 2024 19:42:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726108978; cv=none;
        d=google.com; s=arc-20240605;
        b=IrtA1lVTUuBI6wpDf9d+hovrEbcqbU66JI5P9s07hQ/fqHCvI0u6zs8V+Q6/cQBt0e
         78sPtavcV7Wg3wfgiMjbWW1M9iTEDV8wf6MNnp4are3UISr8K49Q763/k3q6dYRgu2g9
         12pwwFyadxolcsvIQ9h9IYL1F0XELCeg0qu0XEIGuPgNe+OAuyGTf5iKDwcmN9qnoU6V
         Mvg2SLfqoTEi4huDFafQ8WzQs0RDWT36LiOuzd2GiRh0Y2tT79+ON6sZQtVOvNq7qpHD
         4+Wjq0jkeELlFuNsMtwKuF0RE8P+rdfE9SbAFRSfas9/XKUthUno22BYXly48yS4/Ro6
         gasg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z6mFWajKHD8MStnRW2dfmIGlFFHAQdj7Jutp2KpIbAc=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=Ec/JGu7X5yF2SzVNjWpCc1ddpcIOKvr8C6oG3QhC2t78/INexQk4RF/1T7BgmeBx1k
         Lt8uIAFIP/men6vVrCaY9K94JJlz96QwyeuZzJLTNyHXBN2U1S6fa48gMg2hzwsYzNnf
         FxRd8qZKX5UVcGsR9wNk//RJ86iePE/K92XzcLJMAWZBaVMAC8h5/9wn5i8MEZPWtUQC
         eET2hp8WR2VPpaNmDSFSxv+hZx/nGGseLeF5nkTzfVU+Bqscm51IMKpHQAGHkTcK17v7
         xmRLmoEJ/wEihXCqeMIzIvovSuXqR+JYyq526/znrq1rRkJTi+ULUyprjggttKDKYfIs
         pYMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w0f6o4a8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c5347822c9si129534876d6.348.2024.09.11.19.42.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:42:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=w0f6o4a8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1soZlt-0002Zj-Bo; Wed, 11 Sep 2024 22:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZlq-0002M8-7T
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:22 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZln-00047O-6c
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:21 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2057835395aso5358145ad.3
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2024 19:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108878; x=1726713678; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z6mFWajKHD8MStnRW2dfmIGlFFHAQdj7Jutp2KpIbAc=;
 b=w0f6o4a8Q+muV+Bxg0WMgAky5nPOuqhJONKmqNBoHRgp0DKrFIUOPop0hpTsQdW54E
 a7gww4euXy5+IA4DHKdkiRrs277SAS7Z1id4R97juQ4sEeHQS0LZX6rmszRSY1AYWL5a
 wFPpUcjIGfHjhtU6lYFnyO+bvzoR/rCo4dZwssRzl2JHz4gTU426/JhrDmzla4c8Hr6R
 TTTARn6LliUoLNp7aabc0RiYYsAT/mBd7KaJ8Ozc2UodwJWb6b7ZtwKHKTnBUtiLXFqW
 RuMbcNRHHMzu8pjes+J/cc2iywfVagIUP/rqbS+w46Wn8ethbcXHb1WxC1/YdNUHXDnF
 ZGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108878; x=1726713678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z6mFWajKHD8MStnRW2dfmIGlFFHAQdj7Jutp2KpIbAc=;
 b=CqKp7bxCXUqaiSUfdQsE9rY5kZBqsagYO4XMTeCbVC6ZsOVJTChLsnJOmJ16vg9p8K
 rEVVEFAn+LdMw1pNFqhhYi65yL/TGzc4QU0W8Agtv5l2ySTifIiyI62RathPSsfIWITc
 U0cwNucv2u2bYffY/IVaD+oiNmjvmZ6wnPkBziy1PvN0P7mGG/xZEcHHPyoViyexbc6r
 4onM89L2wuXpI5IGJfgsxP5dLEQ5ebPpb1haBtg20u3+KpkLV21gzlbxSiSsP8vbP0oQ
 SSM4ddLVdz7IjvvL5xTQtmvo2/vPgMWrxMLZ5Jxs4/yV5PeFweXsHhoUJJTs4Y3Miw5n
 LqdA==
X-Gm-Message-State: AOJu0Yz76rKsf+9PWhntSSaueiQ3ho9Ta/A73XYdfxxyElKzW0Ph7yFx
 p2MnDCE8hpLKeSdNwqpvODbw2nXxHZlvACeRPegRJJgUI8VT+FdrV62wxSlpr4UeSe4JY1taXQO
 n
X-Received: by 2002:a17:903:98b:b0:206:9f91:3624 with SMTP id
 d9443c01a7336-2076e32fe49mr21047405ad.13.1726108877386; 
 Wed, 11 Sep 2024 19:41:17 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 01/29] target/arm: Replace tcg_gen_dupi_vec with constants
 in gengvec.c
Date: Wed, 11 Sep 2024 19:40:46 -0700
Message-ID: <20240912024114.1097832-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8QzfdP9TBzx8

Instead of copying a constant into a temporary with dupi,
use a vector constant directly.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/gengvec.c | 43 ++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 56a1dc1f75..726a1383ae 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -297,10 +297,9 @@ void gen_srshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
 static void gen_srshr_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
 {
     TCGv_vec t = tcg_temp_new_vec_matching(d);
-    TCGv_vec ones = tcg_temp_new_vec_matching(d);
+    TCGv_vec ones = tcg_constant_vec_matching(d, vece, 1);
 
     tcg_gen_shri_vec(vece, t, a, sh - 1);
-    tcg_gen_dupi_vec(vece, ones, 1);
     tcg_gen_and_vec(vece, t, t, ones);
     tcg_gen_sari_vec(vece, d, a, sh);
     tcg_gen_add_vec(vece, d, d, t);
@@ -492,10 +491,9 @@ void gen_urshr64_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
 static void gen_urshr_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t shift)
 {
     TCGv_vec t = tcg_temp_new_vec_matching(d);
-    TCGv_vec ones = tcg_temp_new_vec_matching(d);
+    TCGv_vec ones = tcg_constant_vec_matching(d, vece, 1);
 
     tcg_gen_shri_vec(vece, t, a, shift - 1);
-    tcg_gen_dupi_vec(vece, ones, 1);
     tcg_gen_and_vec(vece, t, t, ones);
     tcg_gen_shri_vec(vece, d, a, shift);
     tcg_gen_add_vec(vece, d, d, t);
@@ -685,9 +683,9 @@ static void gen_shr64_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
 static void gen_shr_ins_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
 {
     TCGv_vec t = tcg_temp_new_vec_matching(d);
-    TCGv_vec m = tcg_temp_new_vec_matching(d);
+    int64_t mi = MAKE_64BIT_MASK((8 << vece) - sh, sh);
+    TCGv_vec m = tcg_constant_vec_matching(d, vece, mi);
 
-    tcg_gen_dupi_vec(vece, m, MAKE_64BIT_MASK((8 << vece) - sh, sh));
     tcg_gen_shri_vec(vece, t, a, sh);
     tcg_gen_and_vec(vece, d, d, m);
     tcg_gen_or_vec(vece, d, d, t);
@@ -773,10 +771,9 @@ static void gen_shl64_ins_i64(TCGv_i64 d, TCGv_i64 a, int64_t shift)
 static void gen_shl_ins_vec(unsigned vece, TCGv_vec d, TCGv_vec a, int64_t sh)
 {
     TCGv_vec t = tcg_temp_new_vec_matching(d);
-    TCGv_vec m = tcg_temp_new_vec_matching(d);
+    TCGv_vec m = tcg_constant_vec_matching(d, vece, MAKE_64BIT_MASK(0, sh));
 
     tcg_gen_shli_vec(vece, t, a, sh);
-    tcg_gen_dupi_vec(vece, m, MAKE_64BIT_MASK(0, sh));
     tcg_gen_and_vec(vece, d, d, m);
     tcg_gen_or_vec(vece, d, d, t);
 }
@@ -1044,14 +1041,13 @@ static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
     TCGv_vec rval = tcg_temp_new_vec_matching(dst);
     TCGv_vec lsh = tcg_temp_new_vec_matching(dst);
     TCGv_vec rsh = tcg_temp_new_vec_matching(dst);
-    TCGv_vec msk, max;
+    TCGv_vec max;
 
     tcg_gen_neg_vec(vece, rsh, shift);
     if (vece == MO_8) {
         tcg_gen_mov_vec(lsh, shift);
     } else {
-        msk = tcg_temp_new_vec_matching(dst);
-        tcg_gen_dupi_vec(vece, msk, 0xff);
+        TCGv_vec msk = tcg_constant_vec_matching(dst, vece, 0xff);
         tcg_gen_and_vec(vece, lsh, shift, msk);
         tcg_gen_and_vec(vece, rsh, rsh, msk);
     }
@@ -1064,9 +1060,6 @@ static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
     tcg_gen_shlv_vec(vece, lval, src, lsh);
     tcg_gen_shrv_vec(vece, rval, src, rsh);
 
-    max = tcg_temp_new_vec_matching(dst);
-    tcg_gen_dupi_vec(vece, max, 8 << vece);
-
     /*
      * The choice of LT (signed) and GEU (unsigned) are biased toward
      * the instructions of the x86_64 host.  For MO_8, the whole byte
@@ -1074,6 +1067,7 @@ static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
      * have already masked to a byte and so a signed compare works.
      * Other tcg hosts have a full set of comparisons and do not care.
      */
+    max = tcg_constant_vec_matching(dst, vece, 8 << vece);
     if (vece == MO_8) {
         tcg_gen_cmp_vec(TCG_COND_GEU, vece, lsh, lsh, max);
         tcg_gen_cmp_vec(TCG_COND_GEU, vece, rsh, rsh, max);
@@ -1170,6 +1164,7 @@ static void gen_sshl_vec(unsigned vece, TCGv_vec dst,
     TCGv_vec lsh = tcg_temp_new_vec_matching(dst);
     TCGv_vec rsh = tcg_temp_new_vec_matching(dst);
     TCGv_vec tmp = tcg_temp_new_vec_matching(dst);
+    TCGv_vec max, zero;
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -1180,15 +1175,15 @@ static void gen_sshl_vec(unsigned vece, TCGv_vec dst,
     if (vece == MO_8) {
         tcg_gen_mov_vec(lsh, shift);
     } else {
-        tcg_gen_dupi_vec(vece, tmp, 0xff);
-        tcg_gen_and_vec(vece, lsh, shift, tmp);
-        tcg_gen_and_vec(vece, rsh, rsh, tmp);
+        TCGv_vec msk = tcg_constant_vec_matching(dst, vece, 0xff);
+        tcg_gen_and_vec(vece, lsh, shift, msk);
+        tcg_gen_and_vec(vece, rsh, rsh, msk);
     }
 
     /* Bound rsh so out of bound right shift gets -1.  */
-    tcg_gen_dupi_vec(vece, tmp, (8 << vece) - 1);
-    tcg_gen_umin_vec(vece, rsh, rsh, tmp);
-    tcg_gen_cmp_vec(TCG_COND_GT, vece, tmp, lsh, tmp);
+    max = tcg_constant_vec_matching(dst, vece, (8 << vece) - 1);
+    tcg_gen_umin_vec(vece, rsh, rsh, max);
+    tcg_gen_cmp_vec(TCG_COND_GT, vece, tmp, lsh, max);
 
     tcg_gen_shlv_vec(vece, lval, src, lsh);
     tcg_gen_sarv_vec(vece, rval, src, rsh);
@@ -1197,12 +1192,12 @@ static void gen_sshl_vec(unsigned vece, TCGv_vec dst,
     tcg_gen_andc_vec(vece, lval, lval, tmp);
 
     /* Select between left and right shift.  */
+    zero = tcg_constant_vec_matching(dst, vece, 0);
     if (vece == MO_8) {
-        tcg_gen_dupi_vec(vece, tmp, 0);
-        tcg_gen_cmpsel_vec(TCG_COND_LT, vece, dst, lsh, tmp, rval, lval);
+        tcg_gen_cmpsel_vec(TCG_COND_LT, vece, dst, lsh, zero, rval, lval);
     } else {
-        tcg_gen_dupi_vec(vece, tmp, 0x80);
-        tcg_gen_cmpsel_vec(TCG_COND_LT, vece, dst, lsh, tmp, lval, rval);
+        TCGv_vec sgn = tcg_constant_vec_matching(dst, vece, 0x80);
+        tcg_gen_cmpsel_vec(TCG_COND_LT, vece, dst, lsh, sgn, lval, rval);
     }
 }
 
-- 
2.43.0

