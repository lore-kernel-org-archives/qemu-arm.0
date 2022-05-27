Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1260717lfh;
        Fri, 27 May 2022 13:09:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysa0Oe0YWRriQ+kN57jozYdkK47GALKmeH538Kx3eI2lsx0HYVdhQ+gRuChq9hqjW/o2DU
X-Received: by 2002:a05:622a:1708:b0:2f9:3409:aff9 with SMTP id h8-20020a05622a170800b002f93409aff9mr23155673qtk.434.1653682144911;
        Fri, 27 May 2022 13:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653682144; cv=none;
        d=google.com; s=arc-20160816;
        b=RoPe51rfpSm4UG+1r78lO4V8awyiE9OS02Dq85e+7k0OBqYQaDNdC7Ek6ZIBNL6sVZ
         EUpy0Y9e0VnsAkoesPvT723MaIDrAWBrqG9G/dXat9dquIbRmnmmu5bDU3I+akCnN+6m
         DNoZEXHVGnk/earN/fzEBCyIHl8gFo4nhSIqmSjjL0JcEwTAAEIxRLLyGqCwtex67jao
         r1oP5jFdhAhluoLaQZgfCqbvurSwUpMNyDQ2RE6MpP3jlCTIEgQxuHFvswgtd5OjWkQe
         XrCiCxDQ077BURycSRCoZH246sPoHN2GRcYPZJrGAyHlXgwDcARxqSRMmy0oj0kxr3OV
         2GRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=leuExD2Pporl9LtnldepaUw6TRBXA4XqOPpHKchnupk=;
        b=LC7PDaNgv8+9TkyviwOXbUetdT/MhbNfoK9l8ibkxCKF0HrH9ttGV0426OfVd/Rnfk
         bYIhjLxoTvLcn00K9ucjB8dN1sQdqvXIm9zjC3Jlfsa2yIh+0PdMBsHaYlNhIZjOgfOI
         zrh3tQBxI4ev42IDW7ye3yjf7Kp+QLyeWn0giZvAZLxNwJ9YJNLgMiPN28HyXMvUfAgM
         0sCNwn/l1oLYCepgyOHgksKQ9FmS0d8SUCl2UYEz6qIYU5s3jarv7GAPkHwONKAN/UMY
         lTJFGJ0aDwnJzXXt2Np4Gddm8kDfb2zphkmGf6wK7Dkdh3EureV5xpzJ/gOrOVntvCbY
         1sWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bC63AtO6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jo30-20020a056214501e00b0045630ee7f67si2493218qvb.556.2022.05.27.13.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 13:09:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bC63AtO6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nugGe-00018D-BA
	for alex.bennee@linaro.org; Fri, 27 May 2022 16:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefZ-0001mj-5e
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:41 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:50753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuefW-0005Lu-2x
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:26:40 -0400
Received: by mail-pj1-x1036.google.com with SMTP id d20so1172002pjr.0
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=leuExD2Pporl9LtnldepaUw6TRBXA4XqOPpHKchnupk=;
 b=bC63AtO6XBtkV34aDlIZ17SK0ZzFjek9YZG21zYnPZ89zDUlqjkhTqYSAccTkjGfkv
 4F0p+V+fg210end3hOl4jk7tXF5wiCrUPZZXFLu0UGWVjdkPg3N/UHZ4WYVo97brKPnr
 Yln8uSJUsnHycarjdy+iNr64EHVsRL1X28VomMU1uSlitLjmQI2a7s1ifghnEbPAmLO9
 4Nlo+rz32hELhXeI+lHqM+BM+/ZfhuYrMewRB0PfosYzjCb4XVAUPDmqL+uh5Nad8xBR
 q+GQebL1t7g0/FB/uU2QdBgJe01fmDDg9sfqDr7n+ISX6YhXmR053hWFgxtvIAYd3tQQ
 14jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=leuExD2Pporl9LtnldepaUw6TRBXA4XqOPpHKchnupk=;
 b=t5OganrDF3Xodc2tMzV2m8cnG6sD6Tf9foASppeHUlmy/H9eXk5tQLPJ9w26kRtxWQ
 hNUDPaBJik8XCyEcJuLhP1tdJh3u1T2B+XsH9Q93Abyf80QTvxArUYp54xAORvpbhYQL
 EwTFCq2LiruNJXVYrliwH/jtEb8G6fkoyXjwGNhWcYFTurkW4t37GC9YER3sgBGfz4lc
 fZsFQxu8jXvqcZMi9okNjq/C0V8qp/PXChxCvwC5pghm6QTcSkFVthWGbZ/u+Jb282/I
 mUHepjOieDAui22EHMfZ5W4x5gnB4nm+PImnGU3remeKqNvDd0FtY8zILiQy1miOrxvb
 qA6g==
X-Gm-Message-State: AOAM533xpWQQrl0ABScBXYlZ5k3GCucnFM2+9eK8BqLXSGO70XOV52ns
 Rxgu3RfZHccaHR+rrQOAi78RSU0XZstt9w==
X-Received: by 2002:a17:902:ef45:b0:156:1858:71fc with SMTP id
 e5-20020a170902ef4500b00156185871fcmr43439509plx.23.1653675996339; 
 Fri, 27 May 2022 11:26:36 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 g13-20020aa7874d000000b0050dc762816fsm3781539pfo.73.2022.05.27.11.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:26:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 094/114] target/arm: Move null function and sve check into
 do_frint_mode
Date: Fri, 27 May 2022 11:18:47 -0700
Message-Id: <20220527181907.189259-95-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Kq9tDKyTUtVG

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 52 +++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 29 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 2a5fbec2d6..43cfd2818e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4140,62 +4140,56 @@ TRANS_FEAT(FRINTX, aa64_sve, gen_gvec_fpst_arg_zpz, frintx_fns[a->esz],
 static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a,
                           int mode, gen_helper_gvec_3_ptr *fn)
 {
-    if (sve_access_check(s)) {
-        unsigned vsz = vec_full_reg_size(s);
-        TCGv_i32 tmode = tcg_const_i32(mode);
-        TCGv_ptr status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+    unsigned vsz;
+    TCGv_i32 tmode;
+    TCGv_ptr status;
 
-        gen_helper_set_rmode(tmode, tmode, status);
-
-        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
-                           vec_full_reg_offset(s, a->rn),
-                           pred_full_reg_offset(s, a->pg),
-                           status, vsz, vsz, 0, fn);
-
-        gen_helper_set_rmode(tmode, tmode, status);
-        tcg_temp_free_i32(tmode);
-        tcg_temp_free_ptr(status);
+    if (fn == NULL) {
+        return false;
     }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    vsz = vec_full_reg_size(s);
+    tmode = tcg_const_i32(mode);
+    status = fpstatus_ptr(a->esz == MO_16 ? FPST_FPCR_F16 : FPST_FPCR);
+
+    gen_helper_set_rmode(tmode, tmode, status);
+
+    tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       pred_full_reg_offset(s, a->pg),
+                       status, vsz, vsz, 0, fn);
+
+    gen_helper_set_rmode(tmode, tmode, status);
+    tcg_temp_free_i32(tmode);
+    tcg_temp_free_ptr(status);
     return true;
 }
 
 static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     return do_frint_mode(s, a, float_round_nearest_even, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     return do_frint_mode(s, a, float_round_up, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     return do_frint_mode(s, a, float_round_down, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     return do_frint_mode(s, a, float_round_to_zero, frint_fns[a->esz]);
 }
 
 static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a)
 {
-    if (a->esz == 0) {
-        return false;
-    }
     return do_frint_mode(s, a, float_round_ties_away, frint_fns[a->esz]);
 }
 
-- 
2.34.1

