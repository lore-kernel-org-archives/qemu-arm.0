Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1266088dyc;
        Fri, 4 Jul 2025 07:50:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTl0Wiwcf8B2B+qIi1WQMoG/iF2PmWUKZXFxB7J0cP9GtNlrvHxdIoNwkHp15NSOCkUGQHzXmvSVymbg==@linaro.org
X-Google-Smtp-Source: AGHT+IE0QzKDjv+XZHC2/fu9qP+lihfLUcaqboBniclG5lrSrchPFD2Y+0+pBelciReK2nEgQl0X
X-Received: by 2002:a05:620a:1712:b0:7c5:405e:e88f with SMTP id af79cd13be357-7d5dcc7a3aemr475642885a.21.1751640605341;
        Fri, 04 Jul 2025 07:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640605; cv=none;
        d=google.com; s=arc-20240605;
        b=GOFLiOnVP/T5jiFrj9wSnBmehHjqpsKyBLXchDhwpy72w9bvWTJTj1R279g4Vh8vpF
         znaCDJMQd9IjSv+cGs+pGiZBr4gdXUdtenGin3YrmsPnIE4GsavvyYvwwIAMEstbOXQb
         U3tYUrbXQEtPlw46MGFdN2SesbBlGmBkL7xjcljZEs9QJ32xKXFtZ+dFvI9YFjdxoL5E
         4VSlI/Dsy0KapE/Vy33SvnImXuv3u4OI968BhkoR4Nl4dOPsSyn0tEBjrjqA5tIKLOhD
         XB8UbDx00VXe7tvQX5q7JOM07zJ9Zw8ymGpWnoob8RD9r6KmdZPKedXBNKaNQHBKld6Q
         zwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uvmVGiggaJVnD3biVZOgKJf/5fGxdVKjkB2gcwvGJfg=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=KYx4Zc8Tvwk5NAMdzvHDoQOD7h29/ZqHTGTkPtNyJaozU1Twaoomgt6W/RLPex8Jqa
         k+oXjO/Aa6hytKs9CMcV01paBFxubH17+LW7NvpTGZPP69V7lJV3W77z7sRplXX4Y7Vu
         VirLRZ9u+hbr8QSvNrZ2lk5xjLBxM//8M0HyZrMUii6xVlJ9P47s2SzN5Nw+nX5jnTM4
         apOP9W0me0jG+MTi7KyXtHxI8LoUvEj8iTRPEwk11OOU3bRCLtd/ypxD73zJTDyvtkXi
         vlYBQKZeoEZqNmFLgdVymBMMrcjcQ5ty4OIBSVkI09xd1U2HxmIdilddogE6n5JloNKS
         4RbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WVwyLve0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbeb71a9si228955985a.294.2025.07.04.07.50.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:50:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WVwyLve0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhTj-0001o0-GF; Fri, 04 Jul 2025 10:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhMA-0004kL-Um
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:45 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM6-0008Bn-IN
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:38 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2d09d495c6cso410881fac.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639133; x=1752243933; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uvmVGiggaJVnD3biVZOgKJf/5fGxdVKjkB2gcwvGJfg=;
 b=WVwyLve0llLgLZOICYT1tUrZDl0meSxR4w+XdcesBqDxEpOUcJ5XpcWVSYIgs3BKYn
 54FLnBvNgUKWQD5uAEwvqXN5OZWNLgo9gM8VZslPnJFDIpc/21Dd6bUGIsBTsjOTS5ho
 n/ycnUMgUR2GLXMFnaBIVJ+0wkpQSKerkUoJHjImG4X0e9Q7QvV2sT8ZrlNlRl9xTgdA
 114PT6QeaU3zkwJqgTbLSMpGLfjn/AL+EmCV8Ly9jdDysciDEhBn3M9fCuBIZHPMs6m5
 kzGxeFro0GeKuGYT4Hw4ERjQ8JCn85Y6wmREJ7XrXZTzpHszWajkTuYGkEbalOp4qfqv
 fSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639133; x=1752243933;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uvmVGiggaJVnD3biVZOgKJf/5fGxdVKjkB2gcwvGJfg=;
 b=oA5qIQrCLshHD/oqv5dEBxO6hjZrJp3QJsISkqHHWOXy7PxptV2bE9qRtIAkyZckjB
 BsHvERvuOmHFmD2P5zlkoPSsCP8LFUP4jyJK6Dnmn64r2/AP52AkdcM+nyP7fTskhyMI
 5FyAxxdPMUMXTcLhLheG17kanMi7TLq1+r9/5WxAaquKJGnzByp+VST/yItJKN4qK3nl
 RPGgVa6L4BQ2h7njalKAljI+L3zGON9Uc5QwJCvQqu5ZTBZAFVdrxlyLrX0gekDUNb9+
 7D1GqssAx2H9qSHS92VH+RuTGLqUV1lXoXOgMDH8CW6LENJTSytLA3nu3bmbe8oNmdwI
 ofyw==
X-Gm-Message-State: AOJu0Yw/66qn/eC9g8Fncxfcf1jjke1f6tHGKmJ/ciP/IlGjj1IPlmNc
 w7PXoc160vgjAz9exbstKsWDEb9ao1du/OOycTtOffx9PBd0Xh2lblVc1MDlxas3+Fc=
X-Gm-Gg: ASbGncvQKqxfAItImY9REh4k00ZKYlTpG0OSs4p/XPkj1ZVwYqZ2QZvFcaQYdl4IzZ4
 3Nh1OVwhZ1wOGIcnGumwMzG8imrGSKP2jQj24L7NXlDHPcdNt6ka8qo7ACNSvo/FnAMsMy1GmRu
 f+aq5KJKuYiQ1xIwVLpY1jynpRcArxJSLx5NnHm8ftNP3QQFsbxdSvTloUeA7czh8wxR95hVn6M
 +bBQgDDxOUjLprR+Q5U7UlVsIboAphgn7CNvqefNKFMdaoE39se0XQYUObpjk2o3B4TuXg+KI9Z
 7A6dBpNjXt8vGbpY2ZFm4yJmM3GBH3NnTzkfZSPWqyTMAsEY0d3spR106LgHCi1ITp1DDq4hUpB
 mxMF7CgDuUnd1okbcnt8sg2tV0vH9XzEaOY+zSN50knjndeblRRtjZTK+ewE=
X-Received: by 2002:a05:6870:eca2:b0:2c2:5c26:2d8e with SMTP id
 586e51a60fabf-2f791e49cc4mr2343740fac.16.1751639132705; 
 Fri, 04 Jul 2025 07:25:32 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 075/108] target/arm: Move scale by esz into
 helper_sve_while*
Date: Fri,  4 Jul 2025 08:20:38 -0600
Message-ID: <20250704142112.1018902-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x33.google.com
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
X-TUID: GoGjvdfiInuJ

Change the API to pass element count rather than bit count.
This will be helpful later for predicate as counter.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c    |  2 ++
 target/arm/tcg/translate-sve.c | 13 +++++--------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 5e11e86e5e..b8f3fbb816 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4133,6 +4133,7 @@ uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
     uint64_t esz_mask = pred_esz_masks[esz];
     ARMPredicateReg *d = vd;
 
+    count <<= esz;
     memset(d, 0, sizeof(*d));
     do_whilel(d, esz_mask, count, oprbits);
     return pred_count_test(oprbits, count, false);
@@ -4165,6 +4166,7 @@ uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
     uint64_t esz_mask = pred_esz_masks[esz];
     ARMPredicateReg *d = vd;
 
+    count <<= esz;
     memset(d, 0, sizeof(*d));
     do_whileg(d, esz_mask, count, oprbits);
     return pred_count_test(oprbits, count, true);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 210a029ab8..f74f2bb1b3 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3198,9 +3198,6 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     t2 = tcg_temp_new_i32();
     tcg_gen_extrl_i64_i32(t2, t0);
 
-    /* Scale elements to bits.  */
-    tcg_gen_shli_i32(t2, t2, a->esz);
-
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
 
@@ -3234,7 +3231,7 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
     op0 = read_cpu_reg(s, a->rn, 1);
     op1 = read_cpu_reg(s, a->rm, 1);
 
-    tmax = tcg_constant_i64(vsz);
+    tmax = tcg_constant_i64(vsz >> a->esz);
     diff = tcg_temp_new_i64();
 
     if (a->rw) {
@@ -3244,15 +3241,15 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
         tcg_gen_sub_i64(diff, op0, op1);
         tcg_gen_sub_i64(t1, op1, op0);
         tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, diff, t1);
-        /* Round down to a multiple of ESIZE.  */
-        tcg_gen_andi_i64(diff, diff, -1 << a->esz);
+        /* Divide, rounding down, by ESIZE.  */
+        tcg_gen_shri_i64(diff, diff, a->esz);
         /* If op1 == op0, diff == 0, and the condition is always true. */
         tcg_gen_movcond_i64(TCG_COND_EQ, diff, op0, op1, tmax, diff);
     } else {
         /* WHILEWR */
         tcg_gen_sub_i64(diff, op1, op0);
-        /* Round down to a multiple of ESIZE.  */
-        tcg_gen_andi_i64(diff, diff, -1 << a->esz);
+        /* Divide, rounding down, by ESIZE.  */
+        tcg_gen_shri_i64(diff, diff, a->esz);
         /* If op0 >= op1, diff <= 0, the condition is always true. */
         tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, tmax, diff);
     }
-- 
2.43.0

