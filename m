Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp753437lfr;
        Fri, 16 Apr 2021 14:53:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB1tp3nVOp9x/YeUJnm18I64stNca9jGwt7fdKbeyf+D9DDYSIABZ5r39wspW7REv2Fl1i
X-Received: by 2002:a05:6638:1390:: with SMTP id w16mr5971464jad.83.1618610023955;
        Fri, 16 Apr 2021 14:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618610023; cv=none;
        d=google.com; s=arc-20160816;
        b=JzXXmq2rO3b3XNf/I1l1QQ3q6DOaPbavW3zgas6d00z73TXAX6GSY+WGkBymaq5oql
         6h1aEcUVciQmye928u7PqiGrlf2gmXab1b8yMHS7nJhbEAu6twUs1kiq4sklGJtAjEh0
         KRlgAB0+xOmpZvBgWwSoJP0U5gQtzfoN7aPnO8LVbqIHCoqZnQMQ3rKlsiAXPjr7EFSP
         EwB1kJ1t5CjeKTIRVO2yRgl3MAALqbHVxzcoZ4pP1vkRkw1e7HCTyi5yu5VvWj1tdycG
         UDzdTGRDjjMXZkGO5Pq1FX3RxyV54iH22AapVCM56MQeSB2IukybwcXRFDo2Nm+zdkqv
         DXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SejLQptV3Xbdii/z6eoM9zkt++LAZtRH0Va0O76ztI4=;
        b=SjhRDjMz0SuH7RdgDhTfCo/RFBDme7zaqBUFQXGjaEd8OZWwDoEU1LefMKY+iTJdC4
         Hd+l56T0636PhXEu11Hofg7c4FbbwTocq8fJm8beqHqF55SuVBcKC2PREZJMMwtf2+6G
         zRrDbrGbs0sieLRe1fFJfWTxqSVjUVYayw0EzG9uxvxvXHK0C9/YGq0OFNgx6QsVi4SB
         tQB3mol+kG0TNryKtYDU21Zq9PDl3Na2lhCAcV1zmUn/5UlegZ33ARmIPKHkCf6BmgCf
         /UNiJ2+JNjOBf4skQFdiDo+pzIYIEVdNMDq7BhWnvgBqdtwKrxQBtQGZL5rI8CjTJG/W
         wsxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ar7Apl2L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si2568773ilu.145.2021.04.16.14.53.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:53:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ar7Apl2L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWPH-0000lA-7u
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdw-0006oq-2I
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:48 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:40510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVda-0001pS-TE
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:47 -0400
Received: by mail-pl1-x635.google.com with SMTP id 20so10683133pll.7
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SejLQptV3Xbdii/z6eoM9zkt++LAZtRH0Va0O76ztI4=;
 b=ar7Apl2LZBFiJ6a6aVAVFvIrCpAyQW3lgFmo5RVKpvZTJ5stWUKNrCBcJT84eoUbVg
 ZdrFso93Xt2xZSoU2JW2Atrb395ssj+UmD/ZRv4POMJMBuUrmuSCIcLhdgd2SXuKEX6g
 r9dSgxflrHo3853Y7AP842VGVD3QwUeaV80VdLr/49h1ckQthh7ysgpI7+Gnht8JXIdk
 kDwlrTkXPG0SRPxlubEOBcktwrNk8ZzRzYEYmD5xn9K4VH789kJnVNFD+Du3l3cWTTOb
 8pp76AEQsZqYErJP+3NRbwS0/E6Slv6kQWUotJk50Q4Tvnaycs/bH2W/C/8+KK+s1Zhr
 ihQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SejLQptV3Xbdii/z6eoM9zkt++LAZtRH0Va0O76ztI4=;
 b=nuLDj9sSM7D2IaMYyMEJz/4LSMsLeo9xmdV5w2wdwRPtubt1QI3e7T+uPpE+j9Z4lw
 626zJB33d2FZ/iKPUtKOOYsiYKUHnDqU9vMmUD07e4oWWQ4rjz0FJiFIqgtj0FNcn509
 bXz/oLB0LTxb4Cl1klTaXsivfrcSdmy6mz7Io3yCRhOVSlrG/qq2vGoFhmjG9Y2/J/lR
 UG4OcAJkpk9AEOVkRYSMAvAkUYmq4RawSkLUy8txy8SQ1BWjOVPuFC1e0KtSPomKpT1o
 m15OXH4Rh3ShyaVo4Cp051cR9Wp+qW2RStTi8HfA+newQ78NVMd6f0wfcajwp8UMXU6k
 iodw==
X-Gm-Message-State: AOAM531vSYLWDArP8Ch0HUpTvcikFv+s99ZjiKLNWfwKEUyZDMe0jAeL
 kioTMwX0bCo28iaQm4gP3VDn7w==
X-Received: by 2002:a17:90a:dc07:: with SMTP id
 i7mr11577441pjv.16.1618607065598; 
 Fri, 16 Apr 2021 14:04:25 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 75/81] target/arm: Split out do_neon_ddda_fpst
Date: Fri, 16 Apr 2021 14:02:34 -0700
Message-Id: <20210416210240.1591291-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gy7aPLBBfZLE

Split out a helper that can handle the 4-register
format for helpers shared with SVE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c.inc | 98 +++++++++++++++------------------
 1 file changed, 43 insertions(+), 55 deletions(-)

diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index 6f418bd8de..6385d13a7e 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -142,24 +142,21 @@ static void neon_store_element64(int reg, int ele, MemOp size, TCGv_i64 var)
     }
 }
 
-static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
+static bool do_neon_ddda_fpst(DisasContext *s, int q, int vd, int vn, int vm,
+                              int data, ARMFPStatusFlavour fp_flavor,
+                              gen_helper_gvec_4_ptr *fn_gvec_ptr)
 {
-    int opr_sz;
-    TCGv_ptr fpst;
-    gen_helper_gvec_4_ptr *fn_gvec_ptr;
-
-    if (!dc_isar_feature(aa32_vcma, s)
-        || (a->size == MO_16 && !dc_isar_feature(aa32_fp16_arith, s))) {
-        return false;
-    }
-
     /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vn | a->vm) & 0x10)) {
+    if (((vd | vn | vm) & 0x10) && !dc_isar_feature(aa32_simd_r32, s)) {
         return false;
     }
 
-    if ((a->vn | a->vm | a->vd) & a->q) {
+    /*
+     * UNDEF accesses to odd registers for each bit of Q.
+     * Q will be 0b111 for all Q-reg instructions, otherwise
+     * when we have mixed Q- and D-reg inputs.
+     */
+    if (((vd & 1) * 4 | (vn & 1) * 2 | (vm & 1)) & q) {
         return false;
     }
 
@@ -167,20 +164,34 @@ static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
         return true;
     }
 
-    opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(a->size == MO_16 ? FPST_STD_F16 : FPST_STD);
-    fn_gvec_ptr = (a->size == MO_16) ?
-        gen_helper_gvec_fcmlah : gen_helper_gvec_fcmlas;
-    tcg_gen_gvec_4_ptr(vfp_reg_offset(1, a->vd),
-                       vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->vm),
-                       vfp_reg_offset(1, a->vd),
-                       fpst, opr_sz, opr_sz, a->rot,
-                       fn_gvec_ptr);
+    int opr_sz = q ? 16 : 8;
+    TCGv_ptr fpst = fpstatus_ptr(fp_flavor);
+
+    tcg_gen_gvec_4_ptr(vfp_reg_offset(1, vd),
+                       vfp_reg_offset(1, vn),
+                       vfp_reg_offset(1, vm),
+                       vfp_reg_offset(1, vd),
+                       fpst, opr_sz, opr_sz, data, fn_gvec_ptr);
     tcg_temp_free_ptr(fpst);
     return true;
 }
 
+static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
+{
+    if (!dc_isar_feature(aa32_vcma, s)) {
+        return false;
+    }
+    if (a->size == MO_16) {
+        if (!dc_isar_feature(aa32_fp16_arith, s)) {
+            return false;
+        }
+        return do_neon_ddda_fpst(s, a->q * 7, a->vd, a->vn, a->vm, a->rot,
+                                 FPST_STD_F16, gen_helper_gvec_fcmlah);
+    }
+    return do_neon_ddda_fpst(s, a->q * 7, a->vd, a->vn, a->vm, a->rot,
+                             FPST_STD, gen_helper_gvec_fcmlas);
+}
+
 static bool trans_VCADD(DisasContext *s, arg_VCADD *a)
 {
     int opr_sz;
@@ -285,43 +296,20 @@ static bool trans_VFML(DisasContext *s, arg_VFML *a)
 
 static bool trans_VCMLA_scalar(DisasContext *s, arg_VCMLA_scalar *a)
 {
-    gen_helper_gvec_4_ptr *fn_gvec_ptr;
-    int opr_sz;
-    TCGv_ptr fpst;
+    int data = (a->index << 2) | a->rot;
 
     if (!dc_isar_feature(aa32_vcma, s)) {
         return false;
     }
-    if (a->size == MO_16 && !dc_isar_feature(aa32_fp16_arith, s)) {
-        return false;
+    if (a->size == MO_16) {
+        if (!dc_isar_feature(aa32_fp16_arith, s)) {
+            return false;
+        }
+        return do_neon_ddda_fpst(s, a->q * 6, a->vd, a->vn, a->vm, data,
+                                 FPST_STD_F16, gen_helper_gvec_fcmlah_idx);
     }
-
-    /* UNDEF accesses to D16-D31 if they don't exist. */
-    if (!dc_isar_feature(aa32_simd_r32, s) &&
-        ((a->vd | a->vn | a->vm) & 0x10)) {
-        return false;
-    }
-
-    if ((a->vd | a->vn) & a->q) {
-        return false;
-    }
-
-    if (!vfp_access_check(s)) {
-        return true;
-    }
-
-    fn_gvec_ptr = (a->size == MO_16) ?
-        gen_helper_gvec_fcmlah_idx : gen_helper_gvec_fcmlas_idx;
-    opr_sz = (1 + a->q) * 8;
-    fpst = fpstatus_ptr(a->size == MO_16 ? FPST_STD_F16 : FPST_STD);
-    tcg_gen_gvec_4_ptr(vfp_reg_offset(1, a->vd),
-                       vfp_reg_offset(1, a->vn),
-                       vfp_reg_offset(1, a->vm),
-                       vfp_reg_offset(1, a->vd),
-                       fpst, opr_sz, opr_sz,
-                       (a->index << 2) | a->rot, fn_gvec_ptr);
-    tcg_temp_free_ptr(fpst);
-    return true;
+    return do_neon_ddda_fpst(s, a->q * 6, a->vd, a->vn, a->vm, data,
+                             FPST_STD, gen_helper_gvec_fcmlas_idx);
 }
 
 static bool trans_VDOT_scalar(DisasContext *s, arg_VDOT_scalar *a)
-- 
2.25.1

