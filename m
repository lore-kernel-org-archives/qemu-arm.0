Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp617024lfb;
        Thu, 26 Aug 2021 06:33:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhGXR0GqqkqCD2yZMeWiE2Fmc+9NwGmE+zd3gD6jsMbOnz0GcrB5nEJxTYCY9tYMQ/8d7+
X-Received: by 2002:a05:600c:1c08:: with SMTP id j8mr3776385wms.27.1629984810237;
        Thu, 26 Aug 2021 06:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629984810; cv=none;
        d=google.com; s=arc-20160816;
        b=Rf9GNnICHfQqxyULspTlOFR5ErMJsZqxcaw3bHtZkySOKiGqFSn43O6KTDCoFg4iA5
         bNIrxCIEE63XW/rXF7pH75pm1vTFsdvMC+pDCBXTNWyeGDaheO8/qDyuYy1CHhwv5MSU
         L6bGp/HBOHerKw/0lQRRSmCHtMz2ZrbHY1do0LyYMB6bDpF88cLLrTHE4uO/H9ZOakFq
         zlBewA5Ox7tAMa6ghLLQKuPKcQqNkmHM5J70KodczJOGDnE2WzJlI6Dvg5fw/g/Uog+J
         X96UfpDtBFAawUefSIlciHJpit5qEOZQrL/nd52k450oLh0H7t+ZPzVHxCvo/F9iGiwQ
         FMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7pXSqEbTOZyV/ZOun+vfAXrbcR65ur8jsORWu+DjPSw=;
        b=ax3RkYMiVCFmsuhmCg52r7OJ0Zm8YUVJe9K5UTctb9GDX7C7vV7/v1tzJD3z5D2d+S
         rt0+TIjnuRsuLllLhovGGw0EJ2qDD4FG1ZUpXVbigG8+Ib7Rab6x/GtdPO9MIJJ572rz
         b4wemOsVvvwLjV08TnZLf4mxYhSnJS1hOno7+C5wwY5zzAJCs9lcm3XYJ1YBIk6R0XWG
         RyEWdgFoXHwpjCLOuIyysMRew+9rh4rGL1iOb1o6lFjH7CrEHBQ/GXBhv69GVoIqAKhK
         63bHPKEJNX5F5lEDvoVWp1cI0YD8OPVID02IkOL4QDiGOVqVs1qUTYSGJG17VCCU4qU1
         Ydhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jo1TvPzD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11si3335209wrd.390.2021.08.26.06.33.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jo1TvPzD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFVZ-0002WF-6A
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGF-0005m2-DK
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:40 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGC-0004zO-FJ
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:39 -0400
Received: by mail-wr1-x433.google.com with SMTP id h4so5016177wro.7
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7pXSqEbTOZyV/ZOun+vfAXrbcR65ur8jsORWu+DjPSw=;
 b=Jo1TvPzDkaR+O2R9XWgrIK+Ao0ZeNsxki24Z16eyrGFrkQ0D9f4yiBp9NUy6Ljmage
 gOLIbWU0tvsO1XNhMGdnimyWm3OYvfSoITTZS9z0vlna2EiL9TVIPnSCzWlhrwFy8bRW
 btIpbFzEbVFZJKlZLycPRW/raHFTk6uty5IU9rWe7jnHEv6yTcUE4c68+IreJ/8UHMQ6
 dGHK8UdmP6DT+G2MVR/cB04RWu2Be+v/9AJAxV3bjjkQa2soBQYBrhpfe60WjV6gA3DJ
 oedZaaFIIEsCaJCxAAClXqezbTQSjnZzW08it2EFKw8UMY0h5Bq68/+dQN9DkBjwKjYS
 I/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7pXSqEbTOZyV/ZOun+vfAXrbcR65ur8jsORWu+DjPSw=;
 b=SbJCKvkkona5QQXPyyGu9wxkbTNOFkHNM7F6GY9Cd77l7mRYRV0CW6RNJff60HbgHn
 u2bBXTWkhOPe6gcuV3VDYnnfk6PXjEBe+kckbulZuOoTBtDYyXKdh2/alIPpsrD10eL3
 HFqeRiP4Afazcxr2A3YuZeuzJVb9Rupvb7Rtt86gULDfp7J2HdLKaKUZ6Tu9kSUl7xC9
 5JfEoLF2ul77d4lT2jmNbgfE3NP+3UJXF7MN8IqWMJiQmF39rAeiK3jNAuzVKJxj/Rm3
 5pi05FLiiUz/jfrOLrIocNAr+mWTUjdXOCCAWya4xPI2q7nSDzfLXNVUmWlo569fgSfG
 S8SA==
X-Gm-Message-State: AOAM532Jdmm4bsXFn8kJd4UerH+tsK6MZ77gt2sBWJ8syFrk3eyeAE31
 ZlIeekizBTMos0g07sJqjMtpVzWWPoXQQQ==
X-Received: by 2002:adf:82b1:: with SMTP id 46mr3876914wrc.217.1629983853448; 
 Thu, 26 Aug 2021 06:17:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/18] target/arm: Implement MVE scalar fp insns
Date: Thu, 26 Aug 2021 14:17:14 +0100
Message-Id: <20210826131725.22449-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RLDIQRux9Fpf

Implement the MVE scalar floating point insns VADD, VSUB and VMUL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
v1->v2: add and use DO_2OP_FP_SCALAR_ALL macro; use float* types
---
 target/arm/helper-mve.h    |  9 +++++++++
 target/arm/mve.decode      | 27 +++++++++++++++++++++------
 target/arm/mve_helper.c    | 35 +++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 20 ++++++++++++++++++++
 4 files changed, 85 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 57ab3f7b59f..091ec4b4270 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -800,3 +800,12 @@ DEF_HELPER_FLAGS_3(mve_vcmpgt_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vcmple_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vcmple_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vcmple_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfadd_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfsub_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfsub_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vfmul_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vfmul_scalars, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index b0622e1f62c..5ba8b6deeaa 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -31,6 +31,8 @@
 %2op_fp_size 20:1 !function=neon_3same_fp_size
 # VCADD is an exception, where bit 20 is 0 for 16 bit and 1 for 32 bit
 %2op_fp_size_rev 20:1 !function=plus_1
+# FP scalars have size in bit 28, 1 for 16 bit, 0 for 32 bit
+%2op_fp_scalar_size 28:1 !function=neon_3same_fp_size
 
 # 1imm format immediate
 %imm_28_16_0 28:1 16:3 0:4
@@ -135,6 +137,9 @@
 @vmaxnma  .... .... .... .... .... .... .... .... &2op \
           qd=%qd qn=%qd qm=%qm
 
+@2op_fp_scalar .... .... .... .... .... .... .... rm:4 &2scalar \
+               qd=%qd qn=%qn size=%2op_fp_scalar_size
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -471,10 +476,17 @@ VSUB_scalar      1110 1110 0 . .. ... 1 ... 1 1111 . 100 .... @2scalar
   VBRSR           1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
 }
 
-VHADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
-VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
-VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
-VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+{
+  VADD_fp_scalar  111 . 1110 0 . 11 ... 0 ... 0 1111 . 100 .... @2op_fp_scalar
+  VHADD_S_scalar  1110  1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
+  VHADD_U_scalar  1111  1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
+}
+
+{
+  VSUB_fp_scalar  111 . 1110 0 . 11 ... 0 ... 1 1111 . 100 .... @2op_fp_scalar
+  VHSUB_S_scalar  1110  1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+  VHSUB_U_scalar  1111  1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+}
 
 {
   VQADD_S_scalar  1110  1110 0 . .. ... 0 ... 0 1111 . 110 .... @2scalar
@@ -490,8 +502,11 @@ VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
                   size=%size_28
 }
 
-VQDMULH_scalar   1110 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
-VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+{
+  VMUL_fp_scalar  111 . 1110 0 . 11 ... 1 ... 0 1110 . 110 .... @2op_fp_scalar
+  VQDMULH_scalar  1110  1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+  VQRDMULH_scalar 1111  1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
+}
 
 # The U bit (28) is don't-care because it does not affect the result
 VMLA             111- 1110 0 . .. ... 1 ... 0 1110 . 100 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index a6ad894414a..b49975fdc01 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3040,3 +3040,38 @@ DO_VCMLA(vcmla180h, 2, float16, 2, DO_VCMLAH)
 DO_VCMLA(vcmla180s, 4, float32, 2, DO_VCMLAS)
 DO_VCMLA(vcmla270h, 2, float16, 3, DO_VCMLAH)
 DO_VCMLA(vcmla270s, 4, float32, 3, DO_VCMLAS)
+
+#define DO_2OP_FP_SCALAR(OP, ESIZE, TYPE, FN)                           \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, uint32_t rm)        \
+    {                                                                   \
+        TYPE *d = vd, *n = vn;                                          \
+        TYPE r, m = rm;                                                 \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            if ((mask & MAKE_64BIT_MASK(0, ESIZE)) == 0) {              \
+                continue;                                               \
+            }                                                           \
+            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+                &env->vfp.standard_fp_status;                           \
+            if (!(mask & 1)) {                                          \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            r = FN(n[H##ESIZE(e)], m, fpst);                            \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_2OP_FP_SCALAR_ALL(OP, FN)                    \
+    DO_2OP_FP_SCALAR(OP##h, 2, float16, float16_##FN)   \
+    DO_2OP_FP_SCALAR(OP##s, 4, float32, float32_##FN)
+
+DO_2OP_FP_SCALAR_ALL(vfadd_scalar, add)
+DO_2OP_FP_SCALAR_ALL(vfsub_scalar, sub)
+DO_2OP_FP_SCALAR_ALL(vfmul_scalar, mul)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4d702da808d..bc4b3f840a0 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -960,6 +960,26 @@ static bool trans_VQDMULLT_scalar(DisasContext *s, arg_2scalar *a)
     return do_2op_scalar(s, a, fns[a->size]);
 }
 
+
+#define DO_2OP_FP_SCALAR(INSN, FN)                              \
+    static bool trans_##INSN(DisasContext *s, arg_2scalar *a)   \
+    {                                                           \
+        static MVEGenTwoOpScalarFn * const fns[] = {            \
+            NULL,                                               \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##s,                             \
+            NULL,                                               \
+        };                                                      \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                 \
+            return false;                                       \
+        }                                                       \
+        return do_2op_scalar(s, a, fns[a->size]);               \
+    }
+
+DO_2OP_FP_SCALAR(VADD_fp_scalar, vfadd_scalar)
+DO_2OP_FP_SCALAR(VSUB_fp_scalar, vfsub_scalar)
+DO_2OP_FP_SCALAR(VMUL_fp_scalar, vfmul_scalar)
+
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenLongDualAccOpFn *fn)
 {
-- 
2.20.1

