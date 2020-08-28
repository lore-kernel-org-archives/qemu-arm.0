Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1697152lfc;
        Fri, 28 Aug 2020 11:49:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjC2WwCFPurwffxqVUTKdBaoazlks6+XPVqApDSslCY0zkxZNGqe/mUkwseGZyGwI5/Jcy
X-Received: by 2002:a25:4403:: with SMTP id r3mr4737353yba.420.1598640573199;
        Fri, 28 Aug 2020 11:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598640573; cv=none;
        d=google.com; s=arc-20160816;
        b=r+oRi1Zsoa4ibAGVjMp3axVzpL5t6w7VcgFcS/QZ86ZX0JcQw8k8qS+tchaRRmECac
         4Fa12ICgS149ghCcCY3vTwkhm1SgkNH3h2hIxd64u42xGAm2KwCWiqQ1w8nLok8XrT7T
         T1cU/IEL7lmzRzaZCZtIrF4KjFXxhGuj4kZNGKvZuqlMHjxW8x6tyNe+t6teLuXO9Myo
         PzJTDyQsRxl7GbLK2b17QVSQ05AJx0UhlsYsZk0kklgtWyHHXQ233p5mcTL9pHhe7ohz
         Joo/RiLxnOyslGfxozD11tQrLY8V5LbQo8jlQU0VmKU4S0hnnYSUMYMeNhK1auwyoKqs
         xX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dJYU2Ry2eB7dGlMsRwns5pnKgFniEVE8JEK6uxOoxIc=;
        b=itpYzt7MGaE5kKzxs2C9vq+SgkZycmo0oVaYLZWhG/q5PZCiDTJvjEHjREdl1uNpqo
         VAIWaz+PNIUovPJ1AMUlLq/fWYklAOgG9A5JAlXrc8sf2Sj2caA9fYk/9grMzGSKMID2
         JJEU825JzKkhmt7iXfeDedGnpslOGynRF3AAnlVbdapYDy/LfyMfEjiJUZAqc4uYgCOO
         yOKETlhgklCW6WNya64ekI3spm9GmB8FpvDUheKiF8f6Y/D82Ih6ZUvRo3pzaRFzMlRD
         c/JfBFvN+8E156sZCCJYZ7Ulf748p72AhDBggYW2gNp7sHsJNMDCG089vFlmZHmS3TFB
         r+FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h0m3RAuV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si85319ybd.450.2020.08.28.11.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:49:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h0m3RAuV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjRM-000157-FQ
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCx-00038V-Di
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:39 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCu-00064U-RR
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:38 -0400
Received: by mail-wr1-x441.google.com with SMTP id i7so24558wre.13
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dJYU2Ry2eB7dGlMsRwns5pnKgFniEVE8JEK6uxOoxIc=;
 b=h0m3RAuVP/D69CP9TS3WO+KCexjlkZb+PwHgg+pUmzNI8mZDwOQvdm1EPV+GmHEFfj
 s4AE6cqLaPoI0cNk9CnbWiWpbUft2QNmIIxpmDdZipDBaI04nde8W1l8BIyxE+h8KvbH
 skrNxNkC6K0R2arwwty65YZ+etZ6GC0/nyIQBGsnIhLVsDzhBC+X4v0rKI/1nZbplZ6Q
 QKSc5FNGbZRAESyuHVLWceLs5vL1moEE3qQ0LzYvdzKCMLhR6/syTbSUBsgVaTLqIh3i
 wAE2d21NwyP9CcQL4QV52cyg/HkP4q9BT7qISFoKt8JdIYMnqQIsCncmuAn8nEJhH6tm
 uLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJYU2Ry2eB7dGlMsRwns5pnKgFniEVE8JEK6uxOoxIc=;
 b=mfNo0ltuGnX8BxjAxYwmB5MpOaWzagnCba0NZ30gQoIr8ePhMT4R0heTd9cvjLHxuj
 RgwQz1ipphTF2TJJJ/pyYyF5rJBO8sTqvetMbnQbfoaX/tNtprukwsZscM5JEcqVBu7B
 01XDH9XOqQcZp4qoqQWamlgMmj7DYB7guoRWwJ8qwg9ykniA5RbhgODkQweyc4mCiR6g
 6zjvqEIFj1664EbWPvW0vXPAdB+s9eKM95X9MYIc1f5xj65Ja/mlTKNsNXPdTR7mA/ls
 tEncofgPNc5hcbeqWTXVl2zsNZGcw/s9knASWe0u1upycWgPN3GmuZcIY88ZmKnIfpUK
 2mSA==
X-Gm-Message-State: AOAM532DglNLdPx3irB3PbfEaTkPkV+aGQctxZOCNkMt+rOy7k0qRH3S
 5wUCa4hFb+GEOVUZ+MjmS+CTpuC90/XavQkE
X-Received: by 2002:adf:f106:: with SMTP id r6mr296038wro.106.1598639675098;
 Fri, 28 Aug 2020 11:34:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 32/45] target/arm: Implement fp16 for Neon fp compare-vs-0
Date: Fri, 28 Aug 2020 19:33:41 +0100
Message-Id: <20200828183354.27913-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y61T1IOtiQf3

Convert the neon floating-point vector compare-vs-0 insns VCEQ0,
VCGT0, VCLE0, VCGE0 and VCLT0 to use a gvec helper, and use this to
implement the fp16 case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h             | 15 +++++++++++++++
 target/arm/vec_helper.c         | 25 +++++++++++++++++++++++++
 target/arm/translate-neon.c.inc | 33 +++++----------------------------
 3 files changed, 45 insertions(+), 28 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index e6f65c74614..bf2b9a7d028 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -617,6 +617,21 @@ DEF_HELPER_FLAGS_4(gvec_frsqrte_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_frsqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_frsqrte_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_fcgt0_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_fcgt0_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(gvec_fcge0_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_fcge0_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(gvec_fceq0_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_fceq0_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(gvec_fcle0_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_fcle0_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(gvec_fclt0_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_fclt0_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(gvec_fadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index 995f09fb71e..072bcd1a9d5 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -730,7 +730,32 @@ DO_2OP(gvec_frsqrte_h, helper_rsqrte_f16, float16)
 DO_2OP(gvec_frsqrte_s, helper_rsqrte_f32, float32)
 DO_2OP(gvec_frsqrte_d, helper_rsqrte_f64, float64)
 
+#define WRAP_CMP0_FWD(FN, CMPOP, TYPE)                          \
+    static TYPE TYPE##_##FN##0(TYPE op, float_status *stat)     \
+    {                                                           \
+        return TYPE##_##CMPOP(op, TYPE##_zero, stat);           \
+    }
+
+#define WRAP_CMP0_REV(FN, CMPOP, TYPE)                          \
+    static TYPE TYPE##_##FN##0(TYPE op, float_status *stat)    \
+    {                                                           \
+        return TYPE##_##CMPOP(TYPE##_zero, op, stat);           \
+    }
+
+#define DO_2OP_CMP0(FN, CMPOP, DIRN)                    \
+    WRAP_CMP0_##DIRN(FN, CMPOP, float16)                \
+    WRAP_CMP0_##DIRN(FN, CMPOP, float32)                \
+    DO_2OP(gvec_f##FN##0_h, float16_##FN##0, float16)   \
+    DO_2OP(gvec_f##FN##0_s, float32_##FN##0, float32)
+
+DO_2OP_CMP0(cgt, cgt, FWD)
+DO_2OP_CMP0(cge, cge, FWD)
+DO_2OP_CMP0(ceq, ceq, FWD)
+DO_2OP_CMP0(clt, cgt, REV)
+DO_2OP_CMP0(cle, cge, REV)
+
 #undef DO_2OP
+#undef DO_2OP_CMP0
 
 /* Floating-point trigonometric starting value.
  * See the ARM ARM pseudocode function FPTrigSMul.
diff --git a/target/arm/translate-neon.c.inc b/target/arm/translate-neon.c.inc
index cf5eab784bd..fe9d09973c2 100644
--- a/target/arm/translate-neon.c.inc
+++ b/target/arm/translate-neon.c.inc
@@ -3799,6 +3799,11 @@ DO_2MISC_FP(VCVT_UF, gen_helper_vfp_touizs)
 
 DO_2MISC_FP_VEC(VRECPE_F, gen_helper_gvec_frecpe_h, gen_helper_gvec_frecpe_s)
 DO_2MISC_FP_VEC(VRSQRTE_F, gen_helper_gvec_frsqrte_h, gen_helper_gvec_frsqrte_s)
+DO_2MISC_FP_VEC(VCGT0_F, gen_helper_gvec_fcgt0_h, gen_helper_gvec_fcgt0_s)
+DO_2MISC_FP_VEC(VCGE0_F, gen_helper_gvec_fcge0_h, gen_helper_gvec_fcge0_s)
+DO_2MISC_FP_VEC(VCEQ0_F, gen_helper_gvec_fceq0_h, gen_helper_gvec_fceq0_s)
+DO_2MISC_FP_VEC(VCLT0_F, gen_helper_gvec_fclt0_h, gen_helper_gvec_fclt0_s)
+DO_2MISC_FP_VEC(VCLE0_F, gen_helper_gvec_fcle0_h, gen_helper_gvec_fcle0_s)
 
 static bool trans_VRINTX(DisasContext *s, arg_2misc *a)
 {
@@ -3808,34 +3813,6 @@ static bool trans_VRINTX(DisasContext *s, arg_2misc *a)
     return do_2misc_fp(s, a, gen_helper_rints_exact);
 }
 
-#define WRAP_FP_CMP0_FWD(WRAPNAME, FUNC)                        \
-    static void WRAPNAME(TCGv_i32 d, TCGv_i32 m, TCGv_ptr fpst) \
-    {                                                           \
-        TCGv_i32 zero = tcg_const_i32(0);                       \
-        FUNC(d, m, zero, fpst);                                 \
-        tcg_temp_free_i32(zero);                                \
-    }
-#define WRAP_FP_CMP0_REV(WRAPNAME, FUNC)                        \
-    static void WRAPNAME(TCGv_i32 d, TCGv_i32 m, TCGv_ptr fpst) \
-    {                                                           \
-        TCGv_i32 zero = tcg_const_i32(0);                       \
-        FUNC(d, zero, m, fpst);                                 \
-        tcg_temp_free_i32(zero);                                \
-    }
-
-#define DO_FP_CMP0(INSN, FUNC, REV)                             \
-    WRAP_FP_CMP0_##REV(gen_##INSN, FUNC)                        \
-    static bool trans_##INSN(DisasContext *s, arg_2misc *a)     \
-    {                                                           \
-        return do_2misc_fp(s, a, gen_##INSN);                   \
-    }
-
-DO_FP_CMP0(VCGT0_F, gen_helper_neon_cgt_f32, FWD)
-DO_FP_CMP0(VCGE0_F, gen_helper_neon_cge_f32, FWD)
-DO_FP_CMP0(VCEQ0_F, gen_helper_neon_ceq_f32, FWD)
-DO_FP_CMP0(VCLE0_F, gen_helper_neon_cge_f32, REV)
-DO_FP_CMP0(VCLT0_F, gen_helper_neon_cgt_f32, REV)
-
 static bool do_vrint(DisasContext *s, arg_2misc *a, int rmode)
 {
     /*
-- 
2.20.1

