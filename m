Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1229132lfh;
        Fri, 27 May 2022 12:05:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR1DFxVlf7aWSAYYSZhEhTBYbPcRB9bGudVTKR39QAZsAit2tR78P60NIU6HYN/97QAsf8
X-Received: by 2002:a37:5346:0:b0:69c:679d:9d51 with SMTP id h67-20020a375346000000b0069c679d9d51mr30269496qkb.189.1653678357856;
        Fri, 27 May 2022 12:05:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678357; cv=none;
        d=google.com; s=arc-20160816;
        b=mjjPPoa9qutdFiC2dzmWVMntvGm5hTPiEmQ/3g1pN9ny4SfhV6eJ5AdGPm1ekiKJM6
         VWQMT9J7b3e0Joe/FGu35AaiQyQVpV4xLJoZNzNq74zwPeJQemvqcZemHBlyK/ToRKJI
         y927UF7NtTNfmuGMdQrw7EBt2xDpBhZTCOGprDjm3zj7mSJPEd2x/XAICRLMJNS4SdXt
         R2sc1SI2rnwVnzmEaWewhvmSNwZi7cGReJYW932u61VmqBcR28KYA9KeRZPD7zgW1v5L
         oGkcCT/aSvpoQMNiVu/k2UUfDEokext+9IXLSOKChTnMp4pLcbgMLPJjoqmx4eM27Lho
         zrkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bfRDXoHEnYVqnP7P+6Bm6dNiqrEf9sE4aGi0f1DAeKE=;
        b=LK0DpoHjnHDFuIvD+mAuxh+RrhQ3XvKizcYiOPI09gdL5CspMwKUkta+KmONwPQXeH
         2TnjzUPnfb8R0f9FXJndQWE9nfVWnCnYw5jxfw9lhyYUi0G04/RihPzYq0KMPOvMtHmE
         ZHlH9hXak96kpPBzTPz7CPZ/mtyfgoRS6ff7Fn4YsdZ02nz6Cf23HZl8wrJV+uOZ85Ly
         7AX9ZfrUUYsZfR5nqi6ixEGexlO4I83RCxfxFbzV7pVFxBbPmDSEq/D8H6ywxW9Eweh2
         +NcVHz4V2ovx8NwHDV2qBCmt+3/0m0ntFBP/RqcDRWAxEv50nkir5HxfMdaHdi5DByLx
         Tptw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vR1cTr9u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020a056214224d00b0044440f29953si3350141qvc.440.2022.05.27.12.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:05:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vR1cTr9u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufHZ-0000NX-Cv
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:05:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYo-0007h4-Pc
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:42 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:47084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYk-0003fO-40
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:42 -0400
Received: by mail-pf1-x42e.google.com with SMTP id j6so4952027pfe.13
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bfRDXoHEnYVqnP7P+6Bm6dNiqrEf9sE4aGi0f1DAeKE=;
 b=vR1cTr9uTCzDzKckDGpgnfRpCLw2z7ZBeMx1r/cpwQxnJ0i1WhRI0l9/aPwK3C7MLg
 LSvvhM2wigM9IhryzqBSSUWCF8kUtMERRYviFwLCO6hGGVCSqBkqbc52ZuJIiM6CVr56
 DBM1QE03Vz1qG7YduXs2DTR3gdDDYhVoN5fDIUtGJvBXDUmtCRjLXtvilqKDmkJx+Jd/
 UmQohwDjZzE+pQsiH3etRs/O1xkwGDQsRaqhc9SGTA7ILV2UJG2EktG72lObW9ygqfVs
 c6VeK8fp50+GjPo/cv7uWX19Hu0ho99/1TuQifZ0Yg0gNapoSVRGsCUc0SQo0zR2svUJ
 GfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfRDXoHEnYVqnP7P+6Bm6dNiqrEf9sE4aGi0f1DAeKE=;
 b=i5RYMwu2KzOR7PCNZhNHHElmRWWA2NLWTSSxnQWdJMjczrdY9DdVl9z6MV8Vu1yQPw
 6+cAbynVP/6KsBWt0RtryX0wW/ZyXdrnWNzWKPc7nAPfOk1lKVo66I5Do5nPVR6aljIf
 0tegPQQ75IzEnox5MXJZl9Uy1x6IOYCZ70mNSKxP/QvF7Qz0wvF3ROv1wPAtLZmenxmb
 UEA9kDLZwPUCUTCBGveYBP77ZFl0j9Vn2MEMM/kDbEDgu6rCEYPSsVFesJP2oxMOM30q
 c4cTybzGgmwFyU5BgSeIKaCGvbS3c0qYnmD3QCjUv0+bo74CQTzuh+7CS+YoP968lTnB
 buGQ==
X-Gm-Message-State: AOAM530KSUaaMWbW02WODcTFbFaruVh0sh7IUHMRUgm815L7OJzfsQFz
 dZkOttZXi3id3QvhmKFcxphaDF/iLG6Vzw==
X-Received: by 2002:a63:2645:0:b0:3f5:f438:c0e0 with SMTP id
 m66-20020a632645000000b003f5f438c0e0mr38030700pgm.186.1653675576799; 
 Fri, 27 May 2022 11:19:36 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 030/114] target/arm: Move null function and sve check into
 gen_gvec_fn_zzz
Date: Fri, 27 May 2022 11:17:43 -0700
Message-Id: <20220527181907.189259-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a1fY1Qmvs4IN

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 5ab9de46a7..3af4626e58 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -259,13 +259,19 @@ static bool gen_gvec_ool_arg_zpzz(DisasContext *s, gen_helper_gvec_4 *fn,
 }
 
 /* Invoke a vector expander on three Zregs.  */
-static void gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
+static bool gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
                             int esz, int rd, int rn, int rm)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    gvec_fn(esz, vec_full_reg_offset(s, rd),
-            vec_full_reg_offset(s, rn),
-            vec_full_reg_offset(s, rm), vsz, vsz);
+    if (gvec_fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        gvec_fn(esz, vec_full_reg_offset(s, rd),
+                vec_full_reg_offset(s, rn),
+                vec_full_reg_offset(s, rm), vsz, vsz);
+    }
+    return true;
 }
 
 /* Invoke a vector expander on four Zregs.  */
@@ -366,10 +372,7 @@ const uint64_t pred_esz_masks[4] = {
 
 static bool do_zzz_fn(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *gvec_fn)
 {
-    if (sve_access_check(s)) {
-        gen_gvec_fn_zzz(s, gvec_fn, a->esz, a->rd, a->rn, a->rm);
-    }
-    return true;
+    return gen_gvec_fn_zzz(s, gvec_fn, a->esz, a->rd, a->rn, a->rm);
 }
 
 static bool trans_AND_zzz(DisasContext *s, arg_rrr_esz *a)
@@ -6421,10 +6424,7 @@ static bool trans_MUL_zzz(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_fn_zzz(s, tcg_gen_gvec_mul, a->esz, a->rd, a->rn, a->rm);
-    }
-    return true;
+    return gen_gvec_fn_zzz(s, tcg_gen_gvec_mul, a->esz, a->rd, a->rn, a->rm);
 }
 
 static gen_helper_gvec_3 * const smulh_zzz_fns[4] = {
@@ -6945,10 +6945,7 @@ static bool do_sve2_fn_zzz(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *fn)
     if (!dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
-    }
-    return true;
+    return gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
 }
 
 static bool trans_SABA(DisasContext *s, arg_rrr_esz *a)
@@ -7880,10 +7877,7 @@ static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
     if (!dc_isar_feature(aa64_sve2_sha3, s)) {
         return false;
     }
-    if (sve_access_check(s)) {
-        gen_gvec_fn_zzz(s, gen_gvec_rax1, MO_64, a->rd, a->rn, a->rm);
-    }
-    return true;
+    return gen_gvec_fn_zzz(s, gen_gvec_rax1, MO_64, a->rd, a->rn, a->rm);
 }
 
 static bool trans_FCVTNT_sh(DisasContext *s, arg_rpr_esz *a)
-- 
2.34.1

