Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1229158lfh;
        Fri, 27 May 2022 12:06:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSfF7N8HCp5ZU11eDMTQZRwt10tycm0CjAEooAKGTxtq7MPuLcgoT7T3yJPhkx4Ex3VUQ8
X-Received: by 2002:a05:620a:298c:b0:6a0:94d2:2e39 with SMTP id r12-20020a05620a298c00b006a094d22e39mr30168819qkp.278.1653678360319;
        Fri, 27 May 2022 12:06:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678360; cv=none;
        d=google.com; s=arc-20160816;
        b=esQmRWUZUKW8ceGBvf17vfvBRYtcAJV6N4cSVpcGw3Q6VC473+wKxYhKSvEf5CgOwA
         75QWysBuuOyakwyvKGD6iDNnBbj2SuS/E9U6CE/i5immTcS7LRXr34piX0Bnl3BZ1kk2
         C6LtEUdrtbsSbcD+BoEC0268xQfCiMaHClaNPABbRC5BE7t6ppQU9BTUHrFYGf3pVt7p
         wh6gNbMIlKIERWpsxn1JRzHlar7YpHowUKf/36xeQ2UZx7lFDDnbvcm2f7YuWGLdcWYV
         RMcbEDzaskQSNkwi507xA+zvtQgO3yv2atXJMS2MvsWRJun9ymAl+eTM/A9u1EPODRXQ
         D3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fA/+mmRPrAiRguQNj9lWkmnOAt/Mp49u7yd687It8sE=;
        b=QvWcQHtvdKAK8taYxPUM9l3qtARFfRdhn80klnP/6PZTfJYkmVrAVShyCSTBAifieH
         HHrwJc4+0iPttsSY+lv+XSvbFUExCYfAyyEHqLJM+GPiv3ZjhKdkQKxHJ5T5jv7GzrNp
         Kk3BR75Ww51dso5V2BNaZlf/2TqvQlJ32YI7KoxM5TsrijBxawLm3lVlHRNp5wWSDSWk
         3qOP7x101f2HO5i+dNDKiA/kXf9vhNwlW8y3PKnR65rH554WTJRJ+ZGUGpxddnDbxH39
         XrsA87kAl5ey4j99eLcdUfN+GX3OE9xs4ZV9x1nhvorixMGmALaUaxJXg9yoTIHJJy+Y
         Prmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=viEbjAgh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t79-20020a374652000000b0069f385e76a6si3038385qka.256.2022.05.27.12.06.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:06:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=viEbjAgh;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufHb-0000R0-Qm
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYi-0007Kq-EO
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:36 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:53869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYe-0003d0-2k
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:35 -0400
Received: by mail-pj1-x1029.google.com with SMTP id z11so5270213pjc.3
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fA/+mmRPrAiRguQNj9lWkmnOAt/Mp49u7yd687It8sE=;
 b=viEbjAghYlNYezMSh6ANiXkvRQQ6IGPlKSHxiWozTXBrbuJGTEOAhM+K0QU2SqSq2X
 ORBRZ/cgG9p1REhRBN5f+Um7Ej1C59IbGOTVXzECztxbnBwyF3WPCsFUcVAioONGrd4h
 9RwIN+PDnfmQFdeXEuPSxzwnWS9iLLreyz7NPMvafWOBXAyLSHYQ7FlOGv7v6RVBPyjE
 t26HFA0Y1o8Srp5nNpfQbil63ggE7MCQPKsfA8UKcTWd3MfhjA9q1LxaUueX8fz1VsIH
 5lBQjs6Qc3ZtWP2N48kty6r6ev4hTSw1ePY8CLXNFqv+K8reV1M+sQBiVwfszDrbZFFz
 esjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fA/+mmRPrAiRguQNj9lWkmnOAt/Mp49u7yd687It8sE=;
 b=j1j0ueeFtxQDojvZtAKdLpgi7VX5OPjvqdOFnC+dMrKrN3nuwkDYzd8dTpaucudJY4
 c77rHzhbY88312v31tS409Rwq5KCGpONfRfOIHaRBrNpAGJMjjUzGgrsQiAR/dDPFseW
 vDzcjaMyqobGGmWnVA0EyEMiQgQCoF4/m5D+g3bQnTRgKSZAVBR/8IYG5bPmQGQABfYC
 ej5HHHaEtdjf6RAk3N7EplUqAc0648TpJ9i8mPcRkNJmnI2vgQ+bUwC3zQxoAXEqfG1Q
 X4aX+OgJ3tsk4CJxar5YFdRQsfolHHkqI5By/94bpeGlpQRf1+ARoshbxmF2YLJXUiK4
 AVUg==
X-Gm-Message-State: AOAM533rvk4R5JhD+Ufgmb0qhdRTOpw+SqWEH1/3yrXEym86Isj2ae2h
 ADpUY+XhvoEdfk7UiaVgXpHJOuEp1TZkJg==
X-Received: by 2002:a17:90a:5515:b0:1dc:c1f1:59bd with SMTP id
 b21-20020a17090a551500b001dcc1f159bdmr9702248pji.81.1653675570514; 
 Fri, 27 May 2022 11:19:30 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 023/114] target/arm: Rename do_zpzi_ool to
 gen_gvec_ool_arg_zpzi
Date: Fri, 27 May 2022 11:17:36 -0700
Message-Id: <20220527181907.189259-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
X-TUID: wKHB72ahs9W6

Rename the function to match gen_gvec_ool_arg_zpz,
and move to be adjacent.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fe11cfed6b..86e87a2078 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -228,6 +228,11 @@ static bool gen_gvec_ool_arg_zpz(DisasContext *s, gen_helper_gvec_3 *fn,
     return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, data);
 }
 
+static bool gen_gvec_ool_arg_zpzi(DisasContext *s, gen_helper_gvec_3 *fn,
+                                  arg_rpri_esz *a)
+{
+    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
+}
 
 /* Invoke an out-of-line helper on 3 Zregs and a predicate. */
 static void gen_gvec_ool_zzzp(DisasContext *s, gen_helper_gvec_4 *fn,
@@ -952,12 +957,6 @@ static bool do_movz_zpz(DisasContext *s, int rd, int rn, int pg,
     return gen_gvec_ool_zzp(s, fns[esz], rd, rn, pg, invert);
 }
 
-static bool do_zpzi_ool(DisasContext *s, arg_rpri_esz *a,
-                        gen_helper_gvec_3 *fn)
-{
-    return gen_gvec_ool_zzp(s, fn, a->rd, a->rn, a->pg, a->imm);
-}
-
 static bool trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a)
 {
     static gen_helper_gvec_3 * const fns[4] = {
@@ -971,7 +970,7 @@ static bool trans_ASR_zpzi(DisasContext *s, arg_rpri_esz *a)
     /* Shift by element size is architecturally valid.  For
        arithmetic right-shift, it's the same as by one less. */
     a->imm = MIN(a->imm, (8 << a->esz) - 1);
-    return do_zpzi_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
 static bool trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a)
@@ -988,7 +987,7 @@ static bool trans_LSR_zpzi(DisasContext *s, arg_rpri_esz *a)
     if (a->imm >= (8 << a->esz)) {
         return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
     } else {
-        return do_zpzi_ool(s, a, fns[a->esz]);
+        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
     }
 }
 
@@ -1006,7 +1005,7 @@ static bool trans_LSL_zpzi(DisasContext *s, arg_rpri_esz *a)
     if (a->imm >= (8 << a->esz)) {
         return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
     } else {
-        return do_zpzi_ool(s, a, fns[a->esz]);
+        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
     }
 }
 
@@ -1024,7 +1023,7 @@ static bool trans_ASRD(DisasContext *s, arg_rpri_esz *a)
     if (a->imm >= (8 << a->esz)) {
         return do_movz_zpz(s, a->rd, a->rd, a->pg, a->esz, true);
     } else {
-        return do_zpzi_ool(s, a, fns[a->esz]);
+        return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
     }
 }
 
@@ -1037,7 +1036,7 @@ static bool trans_SQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
     if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzi_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
 static bool trans_UQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
@@ -1049,7 +1048,7 @@ static bool trans_UQSHL_zpzi(DisasContext *s, arg_rpri_esz *a)
     if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzi_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
 static bool trans_SRSHR(DisasContext *s, arg_rpri_esz *a)
@@ -1061,7 +1060,7 @@ static bool trans_SRSHR(DisasContext *s, arg_rpri_esz *a)
     if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzi_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
 static bool trans_URSHR(DisasContext *s, arg_rpri_esz *a)
@@ -1073,7 +1072,7 @@ static bool trans_URSHR(DisasContext *s, arg_rpri_esz *a)
     if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzi_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
 static bool trans_SQSHLU(DisasContext *s, arg_rpri_esz *a)
@@ -1085,7 +1084,7 @@ static bool trans_SQSHLU(DisasContext *s, arg_rpri_esz *a)
     if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
         return false;
     }
-    return do_zpzi_ool(s, a, fns[a->esz]);
+    return gen_gvec_ool_arg_zpzi(s, fns[a->esz], a);
 }
 
 /*
-- 
2.34.1

