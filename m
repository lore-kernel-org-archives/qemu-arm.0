Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp983853njb;
        Mon, 9 Sep 2024 09:22:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLPifIiqEVqkcyHhLVrkXulZx2LyDHOH4hm/SWJWuVgEjLEFdynVqq80CHx8YdvUuDtWDaKNrQ5Q/wbA==@linaro.org
X-Google-Smtp-Source: AGHT+IEWY0ffzc0wqi6KU1Sa38BdxTGuVQMIwcgx4ZFY00GQ8SjNGPEAqGBXperexJc0yVA+RBpc
X-Received: by 2002:a05:6214:4a81:b0:6c1:6a2e:afc6 with SMTP id 6a1803df08f44-6c5282fed3amr150588186d6.15.1725898974116;
        Mon, 09 Sep 2024 09:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725898974; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4UjCJdPxDQ011tykFxdpnMEiQGk34HFBf2TB3j0hiTALIWjIe73Tb2y6lW/QaD4Av
         2m05xHB2DYZRdvO8VxAQHl3VYjU6wb6zMC2HzLvLZQ+RoZAmX8cK2NZmBgcNw+mYOTWc
         KwZTHai0ur6/hhhztxq6YxgwideUnMDgh7qopCnUkV5dTaS/zamGCJK7Pj6jpABzaQTv
         KGKMe93/U162NheuLGS215tXAUdHzTwmkCDgr+p0AYez1ubFEoPT8L2C2iYMGCl9QYwd
         f7Vi5dOpo6YFq+917wXXX1/hQscT4P0XK4KTqUp+2lZMGy0C2JHhKFpYjmlBU3jAR+6M
         7egw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b76wfqWpuwoFDlLIxKLPUFdGu7bZu4H9hMXKBVkHcrw=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=hOsxdccuzFZt7YTzUsi1UBKsVYUJbihZdKEoP0IabUJK96twIsnQ9vYtY0kIknHeKS
         /20uHKiGCEVy05q6uU3Rlk5fN/7pf/yTt8uZGYyjct/jVvw3XcUFTHd8nBv+uVz2YQ2h
         WoBsg9ey7oLqs/dKandCoKwGC98VA3wNbX9ZzAkO8vz0Zf7niusiRy5TU8H6b7EZJEZr
         XzKw43+K5KF2n049gZ47Dij278VS+USC6lJWMP/M2LrNek8kIcj+7SeusiXKzM3gbuwE
         T0sWDZzBsbQT01HMY46GuxNmnuSlkc4a4GuI6KhSu3QW03pSxAaQgJheStWQCSa5LqgD
         ubDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pfz1fKIT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c5343301b0si57156996d6.93.2024.09.09.09.22.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 09:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pfz1fKIT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snhA9-00029o-CO; Mon, 09 Sep 2024 12:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhA7-00024R-60
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:22:47 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1snhA5-0007fu-7R
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 12:22:46 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-718a3b8a2dcso2546810b3a.2
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 09:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725898962; x=1726503762; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b76wfqWpuwoFDlLIxKLPUFdGu7bZu4H9hMXKBVkHcrw=;
 b=pfz1fKITTjZrcVCB5zP6nmyZ8yeQoOENw0Zx38+ZeI9goRlICLf41d3QqA5B6bUyoI
 DLl8IhQkoVUVDMcNEFyhiKGEDc49n4N9z9H/MubPGbZFPi1EV5s8e5dn0VDU6kWRCIIi
 /AgKE7V/bcEbp7k8wk2Sl/Qd2Qx08WqoxtYPW5NJ9CJIOa7HSAKHrHKWnffZuv2AUMlm
 iXVVYSZUoxOHcOt+EySfS0sDELn1neu5QDfE11V1OryM/CZUPYrAPr/YRt843g3DCswe
 uDqK7vUOGe8LTVcnCDCYAg7/U5umrsCf90DU9LDZmisFWH7BTVXtIETeGWex4PkcajYw
 j0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725898962; x=1726503762;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b76wfqWpuwoFDlLIxKLPUFdGu7bZu4H9hMXKBVkHcrw=;
 b=vPQHcIT/UYn3KlKJlaTIOfFdl45g39FYVLsKb7/WBXFl80Ylts9Dz3Q6lLXVNd4p6/
 ZZEjQZlHfHLdEy7X+vcpsLKsJ98OQ0IHA4ZNHuahTIdILS1qegkf3K4HT2BVr6gbn7jZ
 YeuergZ6ZWfb8sarICRAFW1WqCVC6BdwnvcjlaXPyjnbwyPUdTquavi8TqpNKIisAgVs
 AOmylJ9a73ATh5aPlLzR9enFzoH/EHuMUrOS1MXudcw7AfSyO5oTSDtHUt8H/zLoGMhh
 Z2cqZQkfwUfNvX22PNP4D7S/C7k4N43cLe+CliBmTkg+y2bzZQeOsa6UktQXVagnXoPz
 Gctw==
X-Gm-Message-State: AOJu0Yxv07YLeK2XGYSdN4sIiTHTZuhcbDVUWVmPK3/+Hit6ZuHZLBg4
 0OXp/sp0c49kHOLdNUoVweSuDpJm+JeSvFkzXajm2c2FeVgEljPQuRZwstduN+I=
X-Received: by 2002:a05:6a21:6f01:b0:1cf:38a2:c4a9 with SMTP id
 adf61e73a8af0-1cf38a2c71dmr4545375637.20.1725898962367; 
 Mon, 09 Sep 2024 09:22:42 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20710f35d79sm35753305ad.288.2024.09.09.09.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 09:22:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 01/29] target/arm: Replace tcg_gen_dupi_vec with constants
 in gengvec.c
Date: Mon,  9 Sep 2024 09:22:11 -0700
Message-ID: <20240909162240.647173-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240909162240.647173-1-richard.henderson@linaro.org>
References: <20240909162240.647173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: 1eag5SP0Qn9d

Instead of copying a constant into a temporary with dupi,
use a vector constant directly.

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

