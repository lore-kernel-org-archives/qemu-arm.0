Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1317859lfb;
        Tue, 12 May 2020 09:39:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypJA1AMI7k4cPOghfe4NDSHIayJgTg/YscpVfJl+WzLeUQdzRsLxqo9I8bPj7c+AUr074A9H
X-Received: by 2002:a37:9b47:: with SMTP id d68mr21359689qke.88.1589301574966;
        Tue, 12 May 2020 09:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589301574; cv=none;
        d=google.com; s=arc-20160816;
        b=QkS5a+Es2Gzx2FzRAtPo6doM9gUyRhMGoYeefwAqEn/i0ZaUapLAvF5QsLb51TGj/v
         wjcRzK0+IQs3ZbgaPAlndoLQ5lHX/OHnGc0Bdn6JvCg6edUmtA+iNbAGXdmzkzqKcMcb
         cE/0xiJnCrULhdsCWtEa2Jw4fT85vPGHlG/yAturMFvS7vRuueUbSwiVlOtRsoLsQ+1w
         Lxzi2hl9wPo+ZmLf7BdTjPfblmkNaNTo/R4uWX9cYzQetJp4QTWPretCDDS0RgVL2RQj
         deKvrfw9niliCZiawf4Q9LGQ3IBVXacXVmAjn9H/ZLYTfLuE/78lK1rHsJIkU5PTeHN3
         Ss7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WX2yhGL+5A/xIoAy1lX3eCz5+m+tDDilj9TcJLBfsZo=;
        b=SL8AGvxTMAy3eyeJeWsBC26hxqZn1pOCM4uVi6Gg5Mo4HKNEPKbnp/1BBFS9/M12Z/
         YHgt1yolydSXBGj10CpU0Ci6w9XsclVKSNb2YwLMA0MJC+94n/FrbRAZwzjh7jfYU24p
         BQVpOySgA2KnVOCMByZmTIP3ERz7pMQHSCqQP26JADqtnORWqcozXCB79St0W5IY3eK5
         XHm+wOA5AKP2svSXtn2P3mZygN2sAh1c2WrvdJlm6ol0LE97ZSCj91MrbJX0NODGvsUZ
         X2JSl4H6Mjhy0EqYugQRkr/JF5QirPEJA+G6ttf+NHacqlARKSbj5PeTcJTRVcGVk8HD
         JMhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R6BJGvEs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si7807090qtc.140.2020.05.12.09.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 May 2020 09:39:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R6BJGvEs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYXwM-0006du-8b
	for alex.bennee@linaro.org; Tue, 12 May 2020 12:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXw0-0006Bk-HL
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:12 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jYXvz-00062W-IQ
 for qemu-arm@nongnu.org; Tue, 12 May 2020 12:39:12 -0400
Received: by mail-wr1-x443.google.com with SMTP id s8so16303237wrt.9
 for <qemu-arm@nongnu.org>; Tue, 12 May 2020 09:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WX2yhGL+5A/xIoAy1lX3eCz5+m+tDDilj9TcJLBfsZo=;
 b=R6BJGvEsANjNW2tuQi1uy9ImNNdc/a7cgoXPqR9uVBLZ5bFj/Dq3WWlBitTMxcv0DI
 e2bx9ilOL4mC1sSHwMOUrnfzTpNh6sLwS+tB98w62JnuwGAQkaEnWwqglmnHJZOYqcii
 VCbmb95d7DBH1nMDEzoLJH9WFoym2fP7fGhmP6X9ABL7hy6vLwZ5d5FemiJ4CVyvZ7ZC
 Z+2lnhW+BPBCH9Zb0BiKYBXIRrEgD9VjbwscSfMvVAv8pMQVB1/cD33eGht3tUAiim47
 PcCFO5xR+rqR5qw+oWiOiCv1Pq8Y0IQqLMSulp4juctHsTg1gUe78FT8UNaEegmcOsEo
 v12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WX2yhGL+5A/xIoAy1lX3eCz5+m+tDDilj9TcJLBfsZo=;
 b=kFuKixb//1kUhFCL9DtyyVW1zcL/x+lr4eikR5J28k2ZDfGH9cD0XOkhInbUi1Y51H
 y3geIQ2ATAxAmAK80BdWC77vALB4TMYv92Ryu2/RwXPGy28Z2q/nZ0rj8d37arIsAitc
 zJA5ROCsQMJ9hTSKOcmJzdoMyzl7HXC3tzgquEBlqQr/y1CWw0Tua8hJWTbSycE6gSNJ
 bd8QyP/1Hig2RHa/3JNLHX6X/Rc2wNowm6u1nElq+yhlv5VBlUxECGEfzyZmjLAhcUEF
 OR+e2fUPliwg/IdSwA/gh6mAZn5+2uZMaVsp61ec6NqHrQJ8W8EZSc9rq3/ITHa1zmeY
 hDHg==
X-Gm-Message-State: AGi0PuZ+POX/2c82ZpxxXRCdS/jouqs991oTg9EXrOL7j9IISiSdRYLK
 ItoNgV6s2JXhyYjhLxU5JO4I42P3BBwCNA==
X-Received: by 2002:a5d:66c5:: with SMTP id k5mr25283374wrw.17.1589301549505; 
 Tue, 12 May 2020 09:39:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm18525981wmo.32.2020.05.12.09.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:39:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/17] target/arm: Convert Neon 3-reg-same SHA to decodetree
Date: Tue, 12 May 2020 17:38:49 +0100
Message-Id: <20200512163904.10918-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200512163904.10918-1-peter.maydell@linaro.org>
References: <20200512163904.10918-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1eM3XONw07/G

Convert the Neon SHA instructions in the 3-reg-same group
to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/neon-dp.decode       |  10 +++
 target/arm/translate-neon.inc.c | 139 ++++++++++++++++++++++++++++++++
 target/arm/translate.c          |  46 +----------
 3 files changed, 151 insertions(+), 44 deletions(-)

diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index 04aff438410..68b0a44793f 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -91,4 +91,14 @@ VMUL_3s          1111 001 0 0 . .. .... .... 1001 . . . 1 .... @3same
 VMUL_p_3s        1111 001 1 0 . .. .... .... 1001 . . . 1 .... @3same
 
 VQRDMLAH_3s      1111 001 1 0 . .. .... .... 1011 ... 1 .... @3same
+
+SHA1_3s          1111 001 0 0 . optype:2 .... .... 1100 . 1 . 0 .... \
+                 vm=%vm_dp vn=%vn_dp vd=%vd_dp
+SHA256H_3s       1111 001 1 0 . 00 .... .... 1100 . 1 . 0 .... \
+                 vm=%vm_dp vn=%vn_dp vd=%vd_dp
+SHA256H2_3s      1111 001 1 0 . 01 .... .... 1100 . 1 . 0 .... \
+                 vm=%vm_dp vn=%vn_dp vd=%vd_dp
+SHA256SU1_3s     1111 001 1 0 . 10 .... .... 1100 . 1 . 0 .... \
+                 vm=%vm_dp vn=%vn_dp vd=%vd_dp
+
 VQRDMLSH_3s      1111 001 1 0 . .. .... .... 1100 ... 1 .... @3same
diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 661b5fc4cf2..03b3337e460 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -686,3 +686,142 @@ static bool trans_VMUL_p_3s(DisasContext *s, arg_3same *a)
 
 DO_VQRDMLAH(VQRDMLAH, gen_gvec_sqrdmlah_qc)
 DO_VQRDMLAH(VQRDMLSH, gen_gvec_sqrdmlsh_qc)
+
+static bool trans_SHA1_3s(DisasContext *s, arg_SHA1_3s *a)
+{
+    TCGv_ptr ptr1, ptr2, ptr3;
+    TCGv_i32 tmp;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON) ||
+        !dc_isar_feature(aa32_sha1, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vn | a->vm | a->vd) & 1) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    ptr1 = vfp_reg_ptr(true, a->vd);
+    ptr2 = vfp_reg_ptr(true, a->vn);
+    ptr3 = vfp_reg_ptr(true, a->vm);
+    tmp = tcg_const_i32(a->optype);
+    gen_helper_crypto_sha1_3reg(ptr1, ptr2, ptr3, tmp);
+    tcg_temp_free_i32(tmp);
+    tcg_temp_free_ptr(ptr1);
+    tcg_temp_free_ptr(ptr2);
+    tcg_temp_free_ptr(ptr3);
+
+    return true;
+}
+
+static bool trans_SHA256H_3s(DisasContext *s, arg_SHA256H_3s *a)
+{
+    TCGv_ptr ptr1, ptr2, ptr3;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON) ||
+        !dc_isar_feature(aa32_sha2, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vn | a->vm | a->vd) & 1) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    ptr1 = vfp_reg_ptr(true, a->vd);
+    ptr2 = vfp_reg_ptr(true, a->vn);
+    ptr3 = vfp_reg_ptr(true, a->vm);
+    gen_helper_crypto_sha256h(ptr1, ptr2, ptr3);
+    tcg_temp_free_ptr(ptr1);
+    tcg_temp_free_ptr(ptr2);
+    tcg_temp_free_ptr(ptr3);
+
+    return true;
+}
+
+static bool trans_SHA256H2_3s(DisasContext *s, arg_SHA256H2_3s *a)
+{
+    TCGv_ptr ptr1, ptr2, ptr3;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON) ||
+        !dc_isar_feature(aa32_sha2, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vn | a->vm | a->vd) & 1) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    ptr1 = vfp_reg_ptr(true, a->vd);
+    ptr2 = vfp_reg_ptr(true, a->vn);
+    ptr3 = vfp_reg_ptr(true, a->vm);
+    gen_helper_crypto_sha256h2(ptr1, ptr2, ptr3);
+    tcg_temp_free_ptr(ptr1);
+    tcg_temp_free_ptr(ptr2);
+    tcg_temp_free_ptr(ptr3);
+
+    return true;
+}
+
+static bool trans_SHA256SU1_3s(DisasContext *s, arg_SHA256SU1_3s *a)
+{
+    TCGv_ptr ptr1, ptr2, ptr3;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON) ||
+        !dc_isar_feature(aa32_sha2, s)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if ((a->vn | a->vm | a->vd) & 1) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    ptr1 = vfp_reg_ptr(true, a->vd);
+    ptr2 = vfp_reg_ptr(true, a->vn);
+    ptr3 = vfp_reg_ptr(true, a->vm);
+    gen_helper_crypto_sha256su1(ptr1, ptr2, ptr3);
+    tcg_temp_free_ptr(ptr1);
+    tcg_temp_free_ptr(ptr2);
+    tcg_temp_free_ptr(ptr3);
+
+    return true;
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 1f06cb5a87f..ee2b8d6f6e3 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5359,7 +5359,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
     int vec_size;
     uint32_t imm;
     TCGv_i32 tmp, tmp2, tmp3, tmp4, tmp5;
-    TCGv_ptr ptr1, ptr2, ptr3;
+    TCGv_ptr ptr1, ptr2;
     TCGv_i64 tmp64;
 
     if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
@@ -5403,49 +5403,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             return 1;
         }
         switch (op) {
-        case NEON_3R_SHA:
-            /* The SHA-1/SHA-256 3-register instructions require special
-             * treatment here, as their size field is overloaded as an
-             * op type selector, and they all consume their input in a
-             * single pass.
-             */
-            if (!q) {
-                return 1;
-            }
-            if (!u) { /* SHA-1 */
-                if (!dc_isar_feature(aa32_sha1, s)) {
-                    return 1;
-                }
-                ptr1 = vfp_reg_ptr(true, rd);
-                ptr2 = vfp_reg_ptr(true, rn);
-                ptr3 = vfp_reg_ptr(true, rm);
-                tmp4 = tcg_const_i32(size);
-                gen_helper_crypto_sha1_3reg(ptr1, ptr2, ptr3, tmp4);
-                tcg_temp_free_i32(tmp4);
-            } else { /* SHA-256 */
-                if (!dc_isar_feature(aa32_sha2, s) || size == 3) {
-                    return 1;
-                }
-                ptr1 = vfp_reg_ptr(true, rd);
-                ptr2 = vfp_reg_ptr(true, rn);
-                ptr3 = vfp_reg_ptr(true, rm);
-                switch (size) {
-                case 0:
-                    gen_helper_crypto_sha256h(ptr1, ptr2, ptr3);
-                    break;
-                case 1:
-                    gen_helper_crypto_sha256h2(ptr1, ptr2, ptr3);
-                    break;
-                case 2:
-                    gen_helper_crypto_sha256su1(ptr1, ptr2, ptr3);
-                    break;
-                }
-            }
-            tcg_temp_free_ptr(ptr1);
-            tcg_temp_free_ptr(ptr2);
-            tcg_temp_free_ptr(ptr3);
-            return 0;
-
         case NEON_3R_VPADD_VQRDMLAH:
             if (!u) {
                 break;  /* VPADD */
@@ -5496,6 +5453,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VMUL:
         case NEON_3R_VML:
         case NEON_3R_VSHL:
+        case NEON_3R_SHA:
             /* Already handled by decodetree */
             return 1;
         }
-- 
2.20.1

