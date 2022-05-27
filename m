Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1224348lfh;
        Fri, 27 May 2022 11:58:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1bO/dpBUJUOjXt2eAdwb5Afnv4hH1bREbGhhX1+Y/oBuhMwz9qS2ETWsJul5pcE/aooeg
X-Received: by 2002:a05:620a:2453:b0:6a5:9150:25cf with SMTP id h19-20020a05620a245300b006a5915025cfmr10533045qkn.564.1653677906740;
        Fri, 27 May 2022 11:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653677906; cv=none;
        d=google.com; s=arc-20160816;
        b=mL5JG1UVMiLTCSLPfHGS0IsMjK1b1MUqxqv5xgamd4mMnaxriHXo8bqHtI6VlT7vtc
         /GPRdMo2qx+HJcKc4D5qo/EbdVjQA0qaXqAFZLX24QnLuy8vn2Y3Ciy1HAv2pR+gLT0p
         +rS5eYVCxHUtDqUn7WbAKNqOab6ubfz+wjNvRBrYqaegKQ6thmWl60AF/hQWmbxy5S6Z
         1OwnIoX4x/ljsi1hWj5HwdIe0zN7lUdG5Nb041ABf/8We2DBGGTmjmgLlOHdQekwoWYv
         yBbh2csRj1+73SEOCM3xLfGEf8yEeGvzRRxO47L1LVboVRuuH0jfGpoXfwZj191FpPmi
         USOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M0/ND+qB6tNKDRo2+/VUSnu4TobvBFfTAPV+oE3bzos=;
        b=Cq1WP8Q/RjsrQqfkTGs0ISATqsOschMw5am46RVVBJVaVT36cLw8dVr81Kw43mC3A+
         Hp8QuqZ0+mK+hCO4N9X+t1oWdJwzbZ/MB4NgFvrob640LzYsRRBsR2cmdpzNM4UeKrar
         6DR7F7uVGGuPjNwDrlgKLxcp9cISc6B2zmAIerH3WIZR0P28PcXRxdG4ZSIUmeLp/DIv
         dDxRPh/NbS24XxMhu10Ls6xoHPv2ALbW2Gq6psPjmYypDVM8Kp0/T4xxpwXXgTW4KJQY
         D5TZ1FZPZlx3p7pssXkEkEJNnUH8uLp9SxfG//VKNhzUv4/o4UQ+L3njL4Tjrw8q20c/
         Tk0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nIjoUzkW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8-20020ac85a08000000b002f932b25a91si2977580qta.631.2022.05.27.11.58.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nIjoUzkW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufAI-0006BQ-8P
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYd-000712-6S
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:31 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:39856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYZ-0003W2-Sx
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:19:30 -0400
Received: by mail-pl1-x630.google.com with SMTP id a13so4798972plh.6
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M0/ND+qB6tNKDRo2+/VUSnu4TobvBFfTAPV+oE3bzos=;
 b=nIjoUzkWvT2rWwRhLjWf4O1/EULz5OyYJRsH/DDnvj0NwKibd7G3MOlSJa/9My+f2L
 uEgdVwfKrYhNtVuB0HEzWbj2V6g7FHh53laldSFAcUTYorFs+XhSYJOwsUrlFN+iQiyP
 yZUU6N46w6Xjw0FUweRAUjguzRYIw2uZOMfvLPfhC368jJR+oWZfeclAzxJpmaem3hK7
 OfmnHgSZzWDLgd0TFQctt8tTiaOpFyh5vu8opb5y5WfkWtWVAnMMW+zZ/H6ZPzQtUPwh
 gri2LrJ22Zduw7NpeO9KbBWqFnREhyipbdjpwZIrNx6teSE0sXSRPNGCNE0eVoWncKDB
 o7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M0/ND+qB6tNKDRo2+/VUSnu4TobvBFfTAPV+oE3bzos=;
 b=4WuFQGlm5GlsDzFnHa35Wrk7SQinApW18g4h2X3G7bWgFR/I4/Cyt+p5Q7ZnCu6uGn
 jsOIXCOBdfyvt2fBnlDzMlOike+bNr2EVfib6/83M1ZKTiyQxRKEAi25W5DWPlQ5Z0Dz
 w8bL6Y341vtHspk9aTUpQpHkKX6WwQ+ol0vujuEAKRlV1YrAOfzEytEKnXEU+KfaEgo7
 ZhxKUjW18ePiF2sbAGKdsF1ZITWr4aOqRyFcWZvKAaagkAF/dC9cHHoA1QEH8Yk9yA3g
 bzZ7IOA3HLgkl7IDoPb4radjRsla/rAoTUVgOo0ZWEUVetJ91MAZOlGCVeR6V/XDUBEn
 9L/w==
X-Gm-Message-State: AOAM5305lonM0/YfeShij6XbXExU6tABWjgFDH5uAAu20XXe5sJZJ8dm
 JNJIrInHZTRjN8Qycp2dYY/+UIKsdCacaw==
X-Received: by 2002:a17:903:2305:b0:163:64c7:f9ff with SMTP id
 d5-20020a170903230500b0016364c7f9ffmr13070567plh.46.1653675567078; 
 Fri, 27 May 2022 11:19:27 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 019/114] target/arm: Move null function and sve check into
 gen_gvec_ool_zzp
Date: Fri, 27 May 2022 11:17:32 -0700
Message-Id: <20220527181907.189259-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
X-TUID: HXEosYjYu+n0

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index b4307f062c..e81c2de37f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -206,14 +206,20 @@ static bool gen_gvec_ool_arg_zzxz(DisasContext *s, gen_helper_gvec_4 *fn,
 }
 
 /* Invoke an out-of-line helper on 2 Zregs and a predicate. */
-static void gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
+static bool gen_gvec_ool_zzp(DisasContext *s, gen_helper_gvec_3 *fn,
                              int rd, int rn, int pg, int data)
 {
-    unsigned vsz = vec_full_reg_size(s);
-    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       pred_full_reg_offset(s, pg),
-                       vsz, vsz, data, fn);
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           pred_full_reg_offset(s, pg),
+                           vsz, vsz, data, fn);
+    }
+    return true;
 }
 
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
@@ -801,13 +807,7 @@ static bool trans_SEL_zpzz(DisasContext *s, arg_rprr_esz *a)
 
 static bool do_zpz_ool(DisasContext *s, arg_rpr_esz *a, gen_helper_gvec_3 *fn)
 {
-    if (fn == NULL) {
-        return false;
-    }
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, 0);
-    }
-    return true;
+    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, 0);
 }
 
 #define DO_ZPZ(NAME, name) \
@@ -986,20 +986,13 @@ static bool do_movz_zpz(DisasContext *s, int rd, int rn, int pg,
         gen_helper_sve_movz_b, gen_helper_sve_movz_h,
         gen_helper_sve_movz_s, gen_helper_sve_movz_d,
     };
-
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzp(s, fns[esz], rd, rn, pg, invert);
-    }
-    return true;
+    return gen_gvec_ool_zzp(s, fns[esz], rd, rn, pg, invert);
 }
 
 static bool do_zpzi_ool(DisasContext *s, arg_rpri_esz *a,
                         gen_helper_gvec_3 *fn)
 {
-    if (sve_access_check(s)) {
-        gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
-    }
-    return true;
+    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
 }
 
 static bool trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a)
-- 
2.34.1

