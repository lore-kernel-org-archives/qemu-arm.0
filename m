Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp607421lfb;
        Thu, 26 Aug 2021 06:22:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxsr1xnZ+J89CXHtSbrV83a7X0kQ6zGQ7uG1c93p4CvXHtBenL3sz+UP0cWEUk0AsSnxCL
X-Received: by 2002:a1c:491:: with SMTP id 139mr4911711wme.137.1629984162502;
        Thu, 26 Aug 2021 06:22:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629984162; cv=none;
        d=google.com; s=arc-20160816;
        b=dAzgmU1Nrkh9Si0j5hg9LjKwTaU3bjuMFBF2MHlFYuIxJgnXCwQuh20ny2Cd5b/ipw
         nVoHIoq2Su14plEMPtle93tNZgoAl57gacuVL6uIUacs6289nVcJPucCqbfg/22hE44r
         f45l5WIWeBmQ85dTeJ59Ps3xwoF22w/iUjgeIZ6DS5wVybYLQ+3pkNDG/LwWwRo7tpTG
         uTzU9NS91GAxM1voMy5k1v0TC9L8pxRhqzOY8sXnnU5BVB1T2vWmku/cqAbGdGZs7p2/
         GYIJ/9a0lhzD9sy5AAj3T9uukYhMv0OL8LvDENPuH+bnmr60Y/hOQRXcTNVxNjZO85vL
         Y5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eizX5mzw+zXUKyLOIS3qpwRZ3tLAja9d8BhMd5VZPjw=;
        b=yp4HiCpx2wAtRn1oG+Tned6nGHHMxK+FXxprhd+WVoOvHEgQt+ZV0IqgpnEqiARhUb
         tuKef0EWIfATgrFjtGpjeBxhcmuQFZXXs1+sic7OUOk3/AagzaZNsPwB69IV+d/OGrwe
         4YPrOoXgo16Ayi81vAkdcGiF7DI+SLa7gFmTPrrORVN4Wol1lE+aj+d0K7M/iqs0KgIs
         YCmv3rraCPZUVr+cbhUkQb4YvZJwoISYW0o0HQIF0Diy3XjZRFkjUVHGziAdjYOUmena
         zlhVRyoRykPjul/dXy4dcmTErhZ4ZISn7egr4YjPWCjPZwCwclbi6EScj2nffiL0YzUm
         stnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k8RnV7iA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si2780681wmk.216.2021.08.26.06.22.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:22:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k8RnV7iA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFL7-000638-Cw
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFGE-0005ly-HK
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:40 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFG7-0004v8-VP
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:38 -0400
Received: by mail-wr1-x42f.google.com with SMTP id x12so4985656wrr.11
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eizX5mzw+zXUKyLOIS3qpwRZ3tLAja9d8BhMd5VZPjw=;
 b=k8RnV7iAfXdNmp3TtvIKl6N2oovDrS4tOZt2EzHxwMDosM4K64MjkG76EHptXZuqN/
 jLcsj/SYmONF3fKEgiW+SV6ZU9fZEzE6vD36ouzGWVSRAs5HLwhhpzo9OehZ6HIP6xdD
 EvfRBdtj55CKWg9mzmsnf23pwHAgGKhHm8w1wtsLHZuPcfTGH+n8Oq3U1f/a5z2Tlv4V
 k0nM8ycySkuUn6a4b8s87ScmXqH/RT7EByma9UH9Qgi/vBldbUXZweCb07kJd+ML5Ws6
 Prrmbye+WdC5p+116KcIsXuUqVcb4KATfInF37zHMkVgsspZyiWA00ysqzlGpz94ggok
 Z9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eizX5mzw+zXUKyLOIS3qpwRZ3tLAja9d8BhMd5VZPjw=;
 b=KD5IQQiqz4V3MErFY3hkdjZ31sm9JftZrxHVUr+lcPATj2KFf3w9JNTrJ7JmEjRulN
 sxbOIjSQQnTWGFKtqlcaTCbMozB2a4O8Nz5vKtmpZmu1Ks5BGAJT80C6FUh52T7jkUF3
 Yq6aX6iKC7hUvum6fNnlWh7ZfoYDEWSOopVz1JFDY7Q5CHlhRZBaklSTuH8+yiE/GNEA
 M2HSc1MqJ7SJvmMJg/W0rBrYsGxfoV6+aAz02ZSithto3IjjoN/pLkMKoShr+ZxZXbz6
 KxnfXwagO/cGuynWcf8KsH4eVYa8k7H2BWl6Qf3TEETGL4vveWIH/I8YY1hPKTBptLpj
 /nbQ==
X-Gm-Message-State: AOAM532Dp5EoLL0MWXxlaabphhZVZLiEq+Zxc2P633jnTj2SWfe4kkhv
 C2RofP6DAPvrSnPH5/rBmcLJaFMWQYN7DQ==
X-Received: by 2002:adf:edc2:: with SMTP id v2mr3907116wro.255.1629983850252; 
 Thu, 26 Aug 2021 06:17:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/18] target/arm: Implement MVE VCADD
Date: Thu, 26 Aug 2021 14:17:10 +0100
Message-Id: <20210826131725.22449-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: 0gpdImmqMJ9w

Implement the MVE VCADD insn.  Note that here the size bit is the
opposite sense to the other 2-operand fp insns.

We don't check for the sz == 1 && Qd == Qm UNPREDICTABLE case,
because that would mean we can't use the DO_2OP_FP macro in
translate-mve.c.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: use float16/float32
---
 target/arm/helper-mve.h    |  6 ++++++
 target/arm/mve.decode      |  8 ++++++++
 target/arm/mve_helper.c    | 40 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  4 +++-
 4 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 370876d7934..42eba8ea96d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -428,6 +428,12 @@ DEF_HELPER_FLAGS_4(mve_vmaxnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vminnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vfcadd90h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfcadd90s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfcadd270h, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfcadd270s, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index cdbfaa4245b..c728c7089ac 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -29,6 +29,8 @@
 # 2 operand fp insns have size in bit 20: 1 for 16 bit, 0 for 32 bit,
 # like Neon FP insns.
 %2op_fp_size 20:1 !function=neon_3same_fp_size
+# VCADD is an exception, where bit 20 is 0 for 16 bit and 1 for 32 bit
+%2op_fp_size_rev 20:1 !function=plus_1
 
 # 1imm format immediate
 %imm_28_16_0 28:1 16:3 0:4
@@ -125,6 +127,9 @@
 @2op_fp .... .... .... .... .... .... .... .... &2op \
         qd=%qd qn=%qn qm=%qm size=%2op_fp_size
 
+@2op_fp_size_rev .... .... .... .... .... .... .... .... &2op \
+                 qd=%qd qn=%qn qm=%qm size=%2op_fp_size_rev
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -631,3 +636,6 @@ VABD_fp           1111 1111 0 . 1 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
 
 VMAXNM            1111 1111 0 . 0 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
 VMINNM            1111 1111 0 . 1 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
+
+VCADD90_fp        1111 1100 1 . 0 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
+VCADD270_fp       1111 1101 1 . 0 . ... 0 ... 0 1000 . 1 . 0 ... 0 @2op_fp_size_rev
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index d6bc686c985..2cc8b3e11b7 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2854,3 +2854,43 @@ static inline float32 float32_abd(float32 a, float32 b, float_status *s)
 DO_2OP_FP_ALL(vfabd, abd)
 DO_2OP_FP_ALL(vmaxnm, maxnum)
 DO_2OP_FP_ALL(vminnm, minnum)
+
+#define DO_VCADD_FP(OP, ESIZE, TYPE, FN0, FN1)                          \
+    void HELPER(glue(mve_, OP))(CPUARMState *env,                       \
+                                void *vd, void *vn, void *vm)           \
+    {                                                                   \
+        TYPE *d = vd, *n = vn, *m = vm;                                 \
+        TYPE r[16 / ESIZE];                                             \
+        uint16_t tm, mask = mve_element_mask(env);                      \
+        unsigned e;                                                     \
+        float_status *fpst;                                             \
+        float_status scratch_fpst;                                      \
+        /* Calculate all results first to avoid overwriting inputs */   \
+        for (e = 0, tm = mask; e < 16 / ESIZE; e++, tm >>= ESIZE) {     \
+            if ((tm & MAKE_64BIT_MASK(0, ESIZE)) == 0) {                \
+                r[e] = 0;                                               \
+                continue;                                               \
+            }                                                           \
+            fpst = (ESIZE == 2) ? &env->vfp.standard_fp_status_f16 :    \
+                &env->vfp.standard_fp_status;                           \
+            if (!(tm & 1)) {                                            \
+                /* We need the result but without updating flags */     \
+                scratch_fpst = *fpst;                                   \
+                fpst = &scratch_fpst;                                   \
+            }                                                           \
+            if (!(e & 1)) {                                             \
+                r[e] = FN0(n[H##ESIZE(e)], m[H##ESIZE(e + 1)], fpst);   \
+            } else {                                                    \
+                r[e] = FN1(n[H##ESIZE(e)], m[H##ESIZE(e - 1)], fpst);   \
+            }                                                           \
+        }                                                               \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            mergemask(&d[H##ESIZE(e)], r[e], mask);                     \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_VCADD_FP(vfcadd90h, 2, float16, float16_sub, float16_add)
+DO_VCADD_FP(vfcadd90s, 4, float32, float32_sub, float32_add)
+DO_VCADD_FP(vfcadd270h, 2, float16, float16_add, float16_sub)
+DO_VCADD_FP(vfcadd270s, 4, float32, float32_add, float32_sub)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 98282335820..6203e3ff916 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -852,6 +852,8 @@ DO_2OP_FP(VMUL_fp, vfmul)
 DO_2OP_FP(VABD_fp, vfabd)
 DO_2OP_FP(VMAXNM, vmaxnm)
 DO_2OP_FP(VMINNM, vminnm)
+DO_2OP_FP(VCADD90_fp, vfcadd90)
+DO_2OP_FP(VCADD270_fp, vfcadd270)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
@@ -883,7 +885,7 @@ static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
     return true;
 }
 
-#define DO_2OP_SCALAR(INSN, FN) \
+#define DO_2OP_SCALAR(INSN, FN)                                 \
     static bool trans_##INSN(DisasContext *s, arg_2scalar *a)   \
     {                                                           \
         static MVEGenTwoOpScalarFn * const fns[] = {            \
-- 
2.20.1

