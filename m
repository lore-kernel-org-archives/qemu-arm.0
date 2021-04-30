Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp515246lfg;
        Fri, 30 Apr 2021 14:34:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb0KvH43rkdK/K5iJ6bnZK0tikJv8hyQcyKiUkdQWGDtbF1VJxd9IVMS3eBCmRkDVMq9SY
X-Received: by 2002:a6b:7f4a:: with SMTP id m10mr5618550ioq.70.1619818495482;
        Fri, 30 Apr 2021 14:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619818495; cv=none;
        d=google.com; s=arc-20160816;
        b=t8aujq3soN8gaiZOGkR2ESI6tVadA+rv/bN9NxYjxNak9BJzA3RkjJfZlrypihHAxI
         /zB/ywCOzEd5Z6EvrCUSPJ+ZE/Q3t/mbYxuGe/4MLkJMM3bDkGkb4hKXnHXugtRLgZnK
         KIT+VmD0vP8ZS392FCX9QSa7AVLsrFQ1F76/tWxAq+SZ9XNd13aDH4BKfmzUTUDdJiS/
         4m2tpaWsb84o/Gw6Tiw0TaWISZW6UWK4UwSUnoD3H+SahGZY7nKfBJ3V5hsTDDcw2slu
         IlWSxkBjltPSeyltC5GSElOvIabygxVEbXAhlfwSV4DVWCa/sDK9A1xCG8PtWLmQX6JY
         xHMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=o9jWx7r6+bkvJPhlg56uHSLWaUr8Yv1wsvob/iql19s=;
        b=lQ+2x8XgiNjeE21KWSszF8hAxRy7VdBXgLoiRaCYpjpHEuh//+V8jLE+3wYTKwOBwn
         dQhveY6uBjATcvA96AmYztBXJXeEfUwVylZQIndUBHBjSkGkCsFa6V1ZSiQXtbGIJ75h
         G2Oc00ITWjEkS9iK/0PjmB7f0SGxJCqt/03FVPWiTv8VlKOKntEhOIQ9z8pjZOwH09ze
         UHiSVCvkdPIbZIDrsS/1gr9OH2eAIRN0jDiAwMcQGhiRUpeB/fx8PBc4aHBV8kMHHeG6
         vPUFJ0jrmQTIbFYcJZvwj3VIuKLff+vpluanEj1kfUprx0uerRf/FZEovnDRMgAXfAh/
         KnDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VjfrlyZG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si3145525ilc.120.2021.04.30.14.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VjfrlyZG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcamk-0006f2-OH
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZn0-0005BN-JT
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:31:10 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlx-0007oQ-K5
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:31:05 -0400
Received: by mail-pl1-x634.google.com with SMTP id a11so6351029plh.3
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o9jWx7r6+bkvJPhlg56uHSLWaUr8Yv1wsvob/iql19s=;
 b=VjfrlyZG9AZqpL0Jb0zSGf45KwKVUS8W6RVY/MnK8TknIDaTZcAAKIsXCWqNG8cFuC
 m5m4cwaX/3E2T8iF7ge2iMYjJrNOK9BLpGX6FwU7cvluggXAq74k+5Khxu1BZJ+QWAnN
 QOc9TTVjtHS3JQwWoJ9ArbCyKN31xKOOcSKwM4mtGiWbhRtEBu1XYXam773M1DU2z5Qm
 lBbZPAbXXX4gydXEXokPpjAGrjDHPgq/foZkxQMmRkrEh16rnZnMmnyvESOYrIw5DL1w
 Bn0o5+NwSsEDhjXjqf2DgJ7u2hvH82vAVQt7sRsfvFLQTvvdm2w25t7u6MjE1A9uaBrg
 Xo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o9jWx7r6+bkvJPhlg56uHSLWaUr8Yv1wsvob/iql19s=;
 b=qLRIbRpr0dJk0J4Z6+munOjwyycEdyo1k1nQ9DT76jh6ozw/LBEN/+cH+L6QxloNiX
 POoe/9tluCZQv4/pwJRc+U9VmJdB+RBwG5IzpmJ3TfeE7IEcRiYbkuHaeonsU1WuIARn
 sPcb6oy6qtJBYMkmzOGMlxe0Kcb2iQatyPVYPd1pes6puxr4xSUyXzlzEBReF0gLKPE/
 zi90elwSqbaQBQBHk+Kj2WpfDVRMxQZ+QWeuAEpwA/hagL2VM1cmw2166P06xy6aRzwI
 +iHlnxmm+h5LylW5gdzWyslOtSdpfF9sOsdpSn57EoiMu3waDIyiZlW1dav0WXrHrdgr
 yeBA==
X-Gm-Message-State: AOAM531SdWtaKVOWK+hGdvXKlWGKAVWpMTQGNi6eHgqLzHaxKH3HQetj
 /0K6kDKExHuKHHxLIbj0Ja1yrqu/vF1sHA==
X-Received: by 2002:a17:90a:e54e:: with SMTP id
 ei14mr7523285pjb.142.1619814597644; 
 Fri, 30 Apr 2021 13:29:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 75/82] target/arm: Split out do_neon_ddda_fpst
Date: Fri, 30 Apr 2021 13:26:03 -0700
Message-Id: <20210430202610.1136687-76-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6rfZiSHbrFYx

Split out a helper that can handle the 4-register
format for helpers shared with SVE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-neon.c | 98 ++++++++++++++++---------------------
 1 file changed, 43 insertions(+), 55 deletions(-)

diff --git a/target/arm/translate-neon.c b/target/arm/translate-neon.c
index 45fa5166f3..41a7b2208e 100644
--- a/target/arm/translate-neon.c
+++ b/target/arm/translate-neon.c
@@ -151,24 +151,21 @@ static void neon_store_element64(int reg, int ele, MemOp size, TCGv_i64 var)
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
 
@@ -176,20 +173,34 @@ static bool trans_VCMLA(DisasContext *s, arg_VCMLA *a)
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
@@ -294,43 +305,20 @@ static bool trans_VFML(DisasContext *s, arg_VFML *a)
 
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

