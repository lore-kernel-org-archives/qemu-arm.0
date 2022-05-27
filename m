Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1213118lfh;
        Fri, 27 May 2022 11:35:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz73PZzAH2YMyRLgIAckn1VzlO2fVvnHl4Pzebxk5nyoKpNdFMJzWjdG1yeb9EhHC/KxNtf
X-Received: by 2002:ac8:5b15:0:b0:2f9:3316:9551 with SMTP id m21-20020ac85b15000000b002f933169551mr22993865qtw.193.1653676556008;
        Fri, 27 May 2022 11:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653676556; cv=none;
        d=google.com; s=arc-20160816;
        b=0pHtfZbrIJhVKcK5FHPW8DVK2nuzs85P7tMK7D9Rudh/0vdeIAy3mdYXoSOz2ntGAw
         ID1trVGKwAjxptgNhTwAohDfpP6I3/yMthUsznrOvu3HHl12eMrUI+QR2ssz9xsFl8Hc
         HfQpbW8gwdTAr6trR+dpZLhPL3TH8hz5/pMIjrJtxmdMApypU0ou1e1qrYL3h78CrOoF
         xWPCu3h45+Mx2zcaE3DvZKKsvtxOTVGkVjEkkBshK8I1v5s311uTxaSMMLvZffchqEl8
         /LbddzXJqRzbUGuVhzWlZhWmunieAydng4Nx7q24xIWzU6VNHXdukzlOYAGnsUFoGyxy
         fQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3Tb3jrtughSCfdEcxDgiEe9Xl6N1iTWei8jPIPKCx/Q=;
        b=vuC5eL8l+ib3Rlx30VT/TK/Zi492u0Fbr5IUIk9++VWdkw9iWFU7ZpwOO5lATX4Az8
         lq8VasoQxl3q5f8427HNzcsg7ckPXg9M+krLK+YRVLAR2C07hL0OqXLcw9+olSSDC58y
         FDyJ3HSjRr/QCFG5qX76mdQaQpwlRiKh066vKxon33ZUEXY9CqQl7FLsd1x9Y4f8C2wd
         mlBB0kFpFLsHP4802G2bduRVKjREQvqwUrN36xWZTqkB2TLRWuKjn2vAzSZx+tE4yvKr
         tdOlJ/Vd2jWQxmRpUqjgxDmz2JnEscYOlFg2vOhvC/oW+NN9jQyJ2horZ2wCyBEDtnT7
         JnSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CEiY6gmN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020a05622a148200b002f94475d2d4si3209568qtx.199.2022.05.27.11.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:35:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CEiY6gmN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueoV-0006IA-6C
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYp-0007iI-5f
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:43 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYl-0003fl-3D
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:42 -0400
Received: by mail-pg1-x535.google.com with SMTP id f4so4560428pgf.4
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Tb3jrtughSCfdEcxDgiEe9Xl6N1iTWei8jPIPKCx/Q=;
 b=CEiY6gmNYnILCJMCamB2z9wCHsl66PVH3xSSvocTvW8Pdo0HRxqA8A4Jk3SRn2sFlf
 nmIZMVG+VyEi3mgKYKnJ+dDP1HzhLneAsddI5+kvdQCjvs37LySv+PNLiptB/XB8R6fk
 6naOgH19S9ADKk3atuXrSSGjPcVt1cCoNv/ZC6N/m6Dev45XKPbvtdKDJF77Mg+BbIQq
 rQVE+9bny29JBtMB7jv39MN55uC9TFF0EpZnvT3BjKOTa6tGJk4xK9OCjImCGlKOQYxv
 uM4MexI8n4p6UwWovmaXUxN4/iZ3u7xRP0CreRqkyRxiXXDSSSnNEjUrrFNWR0oGQFKn
 wI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Tb3jrtughSCfdEcxDgiEe9Xl6N1iTWei8jPIPKCx/Q=;
 b=oSYkkVr5KasZYUN+QFqk2zf7FBv4fTV3j0opzDNeWoKYAH9faNSAqn6xBtQotgB9CZ
 zq8xAXa2SWKWoCz2vlDFVJdCLjveUoZhTHrKLVKJAVu44aYtj2xGqDnvr3fUCY9w5Zmb
 vYGJ0LI6si+1zW77WkMEzaOHJYajBeUKUKOOEnhEIfnCyXnJh1B5rT6Am/2PexXpVaLO
 EyK5YiueNiJ9gCkMYfhi0Ttxw22uqVtGN6klJysWq28epKS3jmy1aknN91kPctowSLtj
 ni3I/sJH0A8r5NpbU5Y/ptRqyKVazCiqWduAAPahLs49cZRiwW38XHAmtwqFsb9G2eiF
 Eywg==
X-Gm-Message-State: AOAM530nihuVkXbLx5uZJJNEsklkhBNDfPbhijYfsiHWaAEPqp7wmirG
 /0Cix1uzTTWbuHsMTSaL1ztErQ==
X-Received: by 2002:a05:6a00:2918:b0:512:e4b5:60fb with SMTP id
 cg24-20020a056a00291800b00512e4b560fbmr45450494pfb.50.1653675577882; 
 Fri, 27 May 2022 11:19:37 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 031/114] target/arm: Rename do_zzz_fn to gen_gvec_fn_arg_zzz
Date: Fri, 27 May 2022 11:17:44 -0700
Message-Id: <20220527181907.189259-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +/9/JouSetyA

Rename the function to match gen_gvec_fn_zzz,
and move to be adjacent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3af4626e58..1b3afcc24c 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -274,6 +274,12 @@ static bool gen_gvec_fn_zzz(DisasContext *s, GVecGen3Fn *gvec_fn,
     return true;
 }
 
+static bool gen_gvec_fn_arg_zzz(DisasContext *s, GVecGen3Fn *fn,
+                                arg_rrr_esz *a)
+{
+    return gen_gvec_fn_zzz(s, fn, a->esz, a->rd, a->rn, a->rm);
+}
+
 /* Invoke a vector expander on four Zregs.  */
 static void gen_gvec_fn_zzzz(DisasContext *s, GVecGen4Fn *gvec_fn,
                              int esz, int rd, int rn, int rm, int ra)
@@ -370,29 +376,24 @@ const uint64_t pred_esz_masks[4] = {
  *** SVE Logical - Unpredicated Group
  */
 
-static bool do_zzz_fn(DisasContext *s, arg_rrr_esz *a, GVecGen3Fn *gvec_fn)
-{
-    return gen_gvec_fn_zzz(s, gvec_fn, a->esz, a->rd, a->rn, a->rm);
-}
-
 static bool trans_AND_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_and);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_and, a);
 }
 
 static bool trans_ORR_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_or);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_or, a);
 }
 
 static bool trans_EOR_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_xor);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_xor, a);
 }
 
 static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_andc);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_andc, a);
 }
 
 static void gen_xar8_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
@@ -707,32 +708,32 @@ static bool trans_NBSL(DisasContext *s, arg_rrrr_esz *a)
 
 static bool trans_ADD_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_add);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_add, a);
 }
 
 static bool trans_SUB_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_sub);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_sub, a);
 }
 
 static bool trans_SQADD_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_ssadd);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_ssadd, a);
 }
 
 static bool trans_SQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_sssub);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_sssub, a);
 }
 
 static bool trans_UQADD_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_usadd);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_usadd, a);
 }
 
 static bool trans_UQSUB_zzz(DisasContext *s, arg_rrr_esz *a)
 {
-    return do_zzz_fn(s, a, tcg_gen_gvec_ussub);
+    return gen_gvec_fn_arg_zzz(s, tcg_gen_gvec_ussub, a);
 }
 
 /*
-- 
2.34.1

