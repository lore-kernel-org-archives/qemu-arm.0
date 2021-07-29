Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5550836lfc;
        Thu, 29 Jul 2021 04:34:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmomKgUp4rjru966F2Yf8onUaabaVMb44tLYv0a4GTVCBkKARn+eyTeOKHQyTWP6XefcoL
X-Received: by 2002:ab0:2b17:: with SMTP id e23mr3707769uar.98.1627558495119;
        Thu, 29 Jul 2021 04:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627558495; cv=none;
        d=google.com; s=arc-20160816;
        b=s2u0xl0wOB3W7JiqYIY3Bj0G5jytvduZ6ySUeJTz+B04fUEDrJTSusdAUtZiREEVOe
         vHYtydPfOvnIzsrZ+iwHVQQZL4Sx4vAAX3ZxLH/nv8N6cMWIYRJLM4X6W5aEbk/GTSiZ
         hZw4/7WAPbiTaoWbIi3BcFpJac0pfjLLIBI5Zbmyrv/D+7Z1ZG77mAREajjog00Ig0nk
         NXsp9EAGI0PAgr7qtDkMlgTcrgU+mxmxfXg4vgg926hRIKlGoGKJE5Vs3UEdX7JG2yXL
         zev72VC4+4gEIh+3PNI53qf1Gb2D+W/6fSuTFNriU0ipJnzdSX+v/WFEjNOOudmL1H8Y
         6tdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=iZpgClRSEyhYOR+Os3hp/BipliKUZ2Q4cpKVQjciGAc=;
        b=vioQKKd0S98j6S3wdYc8cu6v0jTSMFGli4XDnA+3vjYS0XRkkKDm09wmka/IWziEpi
         iVXe/kxvCYfcyX0Iz+UOIiUEtgPI8v0O9XbILx5iCPC/r6Uii+tI/JoPLuL7c8DXkKqu
         6QBIfliCffaPY918IM4v9yv2Ud0LKxbwe8WP7R2kPNAyBMjigA7mjQvFfnfxzmrpQ8Ao
         mc5PjKdaRQNbA0jnqATZfo038vDBWFJ67+NGu/NmxePeBEqVD8jFyr0pbT1YKuqwn3w8
         qO0zJh7SzreNoXffVO+99n1ZP2cbA6qowYrzcdUMEKm1c3TGTs993u0ISGn4Wp+rr2sq
         sECw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=puRrpj8+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u25si1088656vsl.382.2021.07.29.04.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=puRrpj8+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m94JS-0007II-Bw
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940x-0000dg-8m
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:33745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940f-00018k-Hv
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 a192-20020a1c7fc90000b0290253b32e8796so5028474wmd.0
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=iZpgClRSEyhYOR+Os3hp/BipliKUZ2Q4cpKVQjciGAc=;
 b=puRrpj8+LWlGrdyULw2nyGEKw2eR29UmKr6UCI6ZunTUJWUsw/w+t+VJbGcChkbsXu
 VPbc83hsoQAIpOuArKLQUNfFe+rKp5I6T8wBN0KMGJ6A6FpB9FhdJt+MKPAYYiaVCwGH
 DdksCqVxm5n4YTCocDkcou7arq37doRH6FjwSUeAoTL58Cn823KGSho9nvWHbkoQly6y
 SAoYEyJZ8ZvRKT/P93SxQqrFgc/JgzWq+VjM7LkmJvAzAX2gNAEtdEnzqBoILeuhnImv
 cDGh9hRpNCRLvbgzjIJVC9rAUjwq7fdGT17UWlfqjUBQpRJvgHlUC2sWhLJc2GyEba8e
 nvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iZpgClRSEyhYOR+Os3hp/BipliKUZ2Q4cpKVQjciGAc=;
 b=AZKwnTx+Xw0+ObAc5rfNhghfYa2z58cI5U1FFaId1Mp2nojILJJwBO9Clrn3mqe4ci
 1WLRlJ6802VOsZN8j6OmnbDFVGD+zjARffx1iQIlLFmy9Ysdm2EeWN8rYJ0T2adkRHfi
 WIsW/HKp4FsInUjy689eUOLIdS9Ir+99oM+pvnNPZkBmmTvzOssT7thOBHBf958L+Htu
 ZCx6k7KKGrco+50xNSGz63gPKkxqd+Jephq+R+t6P5KES2R6SJalIWfHuZGqp+BP6WcU
 QAmbZKpGTaJmpJzS1nPgCYE1ilatpipHgsffJ2qj4jjxnrvONhS52P1KiBijKt2dBkT3
 kSKQ==
X-Gm-Message-State: AOAM532o8ACJUuDW4OADV2sN0XRqvfEiJqLUiaQEE72i/4NoH9gS0iQQ
 87kjXPnHPbMFb8Ud0YgXeabnDi171Gdwyg==
X-Received: by 2002:a1c:238e:: with SMTP id j136mr4271650wmj.91.1627557328109; 
 Thu, 29 Jul 2021 04:15:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 16/53] target/arm: Implement MVE integer
 vector-vs-scalar comparisons
Date: Thu, 29 Jul 2021 12:14:35 +0100
Message-Id: <20210729111512.16541-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: bap6VjePkUSH

Implement the MVE integer vector comparison instructions that compare
each element against a scalar from a general purpose register.  These
are "VCMP (vector)" encodings T4, T5 and T6 and "VPT (vector)"
encodings T4, T5 and T6.

We have to move the decodetree pattern for VPST, because it
overlaps with VCMP T4 with size = 0b11.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 32 +++++++++++++++++++++++++++
 target/arm/mve.decode      | 18 +++++++++++++---
 target/arm/mve_helper.c    | 44 +++++++++++++++++++++++++++++++-------
 target/arm/translate-mve.c | 43 +++++++++++++++++++++++++++++++++++++
 4 files changed, 126 insertions(+), 11 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index ca5a6ab51cc..4f9903e66ef 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -512,3 +512,35 @@ DEF_HELPER_FLAGS_3(mve_vcmpgtw, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vcmpleb, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vcmpleh, TCG_CALL_NO_WG, void, env, ptr, ptr)
 DEF_HELPER_FLAGS_3(mve_vcmplew, TCG_CALL_NO_WG, void, env, ptr, ptr)
+
+DEF_HELPER_FLAGS_3(mve_vcmpeq_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpeq_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpeq_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmpne_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpne_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpne_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmpcs_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpcs_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpcs_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmphi_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmphi_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmphi_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmpge_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpge_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpge_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmplt_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmplt_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmplt_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmpgt_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpgt_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmpgt_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vcmple_scalarb, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmple_scalarh, TCG_CALL_NO_WG, void, env, ptr, i32)
+DEF_HELPER_FLAGS_3(mve_vcmple_scalarw, TCG_CALL_NO_WG, void, env, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 76bbf9a6136..ef708ba80ff 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -38,6 +38,7 @@
 &vidup qd rn size imm
 &viwdup qd rn rm size imm
 &vcmp qm qn size mask
+&vcmp_scalar qn rm size mask
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
@@ -90,6 +91,8 @@
 # Vector comparison; 4-bit Qm but 3-bit Qn
 %mask_22_13      22:1 13:3
 @vcmp    .... .... .. size:2 qn:3 . .... .... .... .... &vcmp qm=%qm mask=%mask_22_13
+@vcmp_scalar .... .... .. size:2 qn:3 . .... .... .... rm:4 &vcmp_scalar \
+             mask=%mask_22_13
 
 # Vector loads and stores
 
@@ -349,9 +352,6 @@ VQRDMULH_scalar  1111 1110 0 . .. ... 1 ... 0 1110 . 110 .... @2scalar
                  rdahi=%rdahi rdalo=%rdalo
 }
 
-# Predicate operations
-VPST             1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
-
 # Logical immediate operations (1 reg and modified-immediate)
 
 # The cmode/op bits here decode VORR/VBIC/VMOV/VMVN, but
@@ -474,3 +474,15 @@ VCMPGE            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 0 @vcmp
 VCMPLT            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 0 @vcmp
 VCMPGT            1111 1110 0 . .. ... 1 ... 1 1111 0 0 . 0 ... 1 @vcmp
 VCMPLE            1111 1110 0 . .. ... 1 ... 1 1111 1 0 . 0 ... 1 @vcmp
+
+{
+  VPST            1111 1110 0 . 11 000 1 ... 0 1111 0100 1101 mask=%mask_22_13
+  VCMPEQ_scalar   1111 1110 0 . .. ... 1 ... 0 1111 0 1 0 0 .... @vcmp_scalar
+}
+VCMPNE_scalar     1111 1110 0 . .. ... 1 ... 0 1111 1 1 0 0 .... @vcmp_scalar
+VCMPCS_scalar     1111 1110 0 . .. ... 1 ... 0 1111 0 1 1 0 .... @vcmp_scalar
+VCMPHI_scalar     1111 1110 0 . .. ... 1 ... 0 1111 1 1 1 0 .... @vcmp_scalar
+VCMPGE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 0 1 0 0 .... @vcmp_scalar
+VCMPLT_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 0 0 .... @vcmp_scalar
+VCMPGT_scalar     1111 1110 0 . .. ... 1 ... 1 1111 0 1 1 0 .... @vcmp_scalar
+VCMPLE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 1 0 .... @vcmp_scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index b0b380b94b0..1a021a9a817 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1787,15 +1787,43 @@ DO_VIWDUP_ALL(vdwdup, do_sub_wrap)
         mve_advance_vpt(env);                                           \
     }
 
-#define DO_VCMP_S(OP, FN)                       \
-    DO_VCMP(OP##b, 1, int8_t, FN)               \
-    DO_VCMP(OP##h, 2, int16_t, FN)              \
-    DO_VCMP(OP##w, 4, int32_t, FN)
+#define DO_VCMP_SCALAR(OP, ESIZE, TYPE, FN)                             \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,             \
+                                uint32_t rm)                            \
+    {                                                                   \
+        TYPE *n = vn;                                                   \
+        uint16_t mask = mve_element_mask(env);                          \
+        uint16_t eci_mask = mve_eci_mask(env);                          \
+        uint16_t beatpred = 0;                                          \
+        uint16_t emask = MAKE_64BIT_MASK(0, ESIZE);                     \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++) {                              \
+            bool r = FN(n[H##ESIZE(e)], (TYPE)rm);                      \
+            /* Comparison sets 0/1 bits for each byte in the element */ \
+            beatpred |= r * emask;                                      \
+            emask <<= ESIZE;                                            \
+        }                                                               \
+        beatpred &= mask;                                               \
+        env->v7m.vpr = (env->v7m.vpr & ~(uint32_t)eci_mask) |           \
+            (beatpred & eci_mask);                                      \
+        mve_advance_vpt(env);                                           \
+    }
 
-#define DO_VCMP_U(OP, FN)                       \
-    DO_VCMP(OP##b, 1, uint8_t, FN)              \
-    DO_VCMP(OP##h, 2, uint16_t, FN)             \
-    DO_VCMP(OP##w, 4, uint32_t, FN)
+#define DO_VCMP_S(OP, FN)                               \
+    DO_VCMP(OP##b, 1, int8_t, FN)                       \
+    DO_VCMP(OP##h, 2, int16_t, FN)                      \
+    DO_VCMP(OP##w, 4, int32_t, FN)                      \
+    DO_VCMP_SCALAR(OP##_scalarb, 1, int8_t, FN)         \
+    DO_VCMP_SCALAR(OP##_scalarh, 2, int16_t, FN)        \
+    DO_VCMP_SCALAR(OP##_scalarw, 4, int32_t, FN)
+
+#define DO_VCMP_U(OP, FN)                               \
+    DO_VCMP(OP##b, 1, uint8_t, FN)                      \
+    DO_VCMP(OP##h, 2, uint16_t, FN)                     \
+    DO_VCMP(OP##w, 4, uint32_t, FN)                     \
+    DO_VCMP_SCALAR(OP##_scalarb, 1, uint8_t, FN)        \
+    DO_VCMP_SCALAR(OP##_scalarh, 2, uint16_t, FN)       \
+    DO_VCMP_SCALAR(OP##_scalarw, 4, uint32_t, FN)
 
 #define DO_EQ(N, M) ((N) == (M))
 #define DO_NE(N, M) ((N) != (M))
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 2d7211b5271..6c6f159aa3e 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -44,6 +44,7 @@ typedef void MVEGenOneOpImmFn(TCGv_ptr, TCGv_ptr, TCGv_i64);
 typedef void MVEGenVIDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32);
 typedef void MVEGenVIWDUPFn(TCGv_i32, TCGv_ptr, TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32);
 typedef void MVEGenCmpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
+typedef void MVEGenScalarCmpFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -1209,6 +1210,37 @@ static bool do_vcmp(DisasContext *s, arg_vcmp *a, MVEGenCmpFn *fn)
     return true;
 }
 
+static bool do_vcmp_scalar(DisasContext *s, arg_vcmp_scalar *a,
+                           MVEGenScalarCmpFn *fn)
+{
+    TCGv_ptr qn;
+    TCGv_i32 rm;
+
+    if (!dc_isar_feature(aa32_mve, s) || !fn || a->rm == 13) {
+        return false;
+    }
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qn = mve_qreg_ptr(a->qn);
+    if (a->rm == 15) {
+        /* Encoding Rm=0b1111 means "constant zero" */
+        rm = tcg_constant_i32(0);
+    } else {
+        rm = load_reg(s, a->rm);
+    }
+    fn(cpu_env, qn, rm);
+    tcg_temp_free_ptr(qn);
+    tcg_temp_free_i32(rm);
+    if (a->mask) {
+        /* VPT */
+        gen_vpst(s, a->mask);
+    }
+    mve_update_eci(s);
+    return true;
+}
+
 #define DO_VCMP(INSN, FN)                                       \
     static bool trans_##INSN(DisasContext *s, arg_vcmp *a)      \
     {                                                           \
@@ -1219,6 +1251,17 @@ static bool do_vcmp(DisasContext *s, arg_vcmp *a, MVEGenCmpFn *fn)
             NULL,                                               \
         };                                                      \
         return do_vcmp(s, a, fns[a->size]);                     \
+    }                                                           \
+    static bool trans_##INSN##_scalar(DisasContext *s,          \
+                                      arg_vcmp_scalar *a)       \
+    {                                                           \
+        static MVEGenScalarCmpFn * const fns[] = {              \
+            gen_helper_mve_##FN##_scalarb,                      \
+            gen_helper_mve_##FN##_scalarh,                      \
+            gen_helper_mve_##FN##_scalarw,                      \
+            NULL,                                               \
+        };                                                      \
+        return do_vcmp_scalar(s, a, fns[a->size]);              \
     }
 
 DO_VCMP(VCMPEQ, vcmpeq)
-- 
2.20.1

