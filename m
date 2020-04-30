Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2213806lfm;
        Thu, 30 Apr 2020 11:30:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypKIf4NmGJM9zkwwfecLS6mWhGXcQgw+NMz0HU1AnTehVu1YyOcTh8KPnvnBdCypWsre7pVI
X-Received: by 2002:ac8:66c6:: with SMTP id m6mr5261132qtp.25.1588271433012;
        Thu, 30 Apr 2020 11:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588271433; cv=none;
        d=google.com; s=arc-20160816;
        b=SZA7KO7x8z+cvhYRTtRH6QPVdT6/I1Kl+alxiZk0UTQdFDabrO9vSMh5dszGxj0ZTL
         tFw3zUITg3or7LVsIMRdzlSpUrVADzt8LhQnwa/cinx5uYKMHQ/xUrGx94xpWIrCxs3/
         RfnBbnFS1roraP3xpfszfmRBD9iE0NEFvUzk38AFf7HtN74ja1+CeJWbbVWs/cOK+hhO
         uL1Ro9Izl9LrzNRyryzYBXUd2zjK2THlu5wNKAZD+6dJpl/92IHK3ebvA8klY+wfQbNO
         29TwMhFDMv5iDc8tiJugokGqJqMQWDCNf3+b0PP6/QHH66q9Zd3blUMxWo9xyeBzt2Ra
         KMQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZfEz2YMeL9tkSikXJxczdohyg0MDh5B8nybWX2FfwKQ=;
        b=NROmowQyOxFG0WHfPtnG3qnFHtigozs4JtLU+blYAtG8v2ubixY4nVzAd8XKz0GJum
         mEb+G5oysoPnvaB3IbjWrsmiKcOirJEW5/Y6Km8sSbYqVNtMvWBRHuObzCIyFvjHJ3Te
         2I7dqTIiUAACL0RawCCl9BSRdp8ocq+SvOOOOWcHluApGnhfXgWq+Lzdsh1FVm9bPtRi
         b7o5B9IpawAO+fbhyZswN7uDiYn0XRQt15MtCCnlfNZywqBmGfabiFKU3JzAuAe3dbTX
         M5lqHTixGHwFpg9wXt0iHjc0xHoFwza0ecZWknv6BInfT7lkoZ7En5Y0x/o7hw2lFNw6
         9vQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VvVfMi5u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id b5si217810qkl.46.2020.04.30.11.30.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:30:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VvVfMi5u;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDxA-0006Wi-7V
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:30:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36444)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDeZ-0002Zz-9n
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:11:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUDe1-0001Ky-6K
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:11:19 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUDdz-0001Jq-27
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 14:10:44 -0400
Received: by mail-wr1-x442.google.com with SMTP id c12so3038324wrp.0
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 11:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZfEz2YMeL9tkSikXJxczdohyg0MDh5B8nybWX2FfwKQ=;
 b=VvVfMi5uaq7eTbFSnt4nBQ1SAxE1Uh3T7rqnAdTeaRFazPBE8kdUnsVpFA9nECKNGZ
 4V9NlxnO4yAK9pYX6I19mJqDfjx1XtpjNo5X0HWvZyDp6tS8ADIpCbdqKfMjDvfeLyxo
 yustmqT9L5wgQmMXZeQMDfOPFtdGDMpUqiRZf2FfL9yQwawqYAMoeucUbPyPBseq2WbN
 FzzmaPgGEBJxThwo4zoGFDnOg3hUTnQuRtKpQcOlgBkIerS0PKVJ2FA88PLitCi1NbBC
 zoOM/OUbUclHkUzehd5e2mZ7BanXJ6ESdi1YuF6KTuSjvbGoL7NXZ/5DmSGbWO/LQMQJ
 BeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZfEz2YMeL9tkSikXJxczdohyg0MDh5B8nybWX2FfwKQ=;
 b=H9k8syzah2XFEsE27uAIIX4tly+ZI5G3mAdsO8M6JXGWCJBO6VKoKN4Z/2+V9taPrH
 6F62+p2rMnFjojLdeu6hT1cmaxXv/NGyBwObkyRS91ToZ9HYY7RG4r0JO3atExaq7gdM
 jrSuXxfEA2jZ+8ypMqjgZulVREoSuHqI8N7kj+Ua0TX7AV1jclIUqMAAJfwWfQq7hL94
 gtHfKd+GG2k4CCn4MKRm4PbJp7ppCN6aQxQWYaK04UQnOoGrI9mmfPRyUg6BOtGkfKuP
 bjXGL8J3WVFw39Iy1c6mp7x9I4PzFlx3PsiAwbJzw1hiWxUPG0QoApLAnAxi7JS3cKy4
 70Cg==
X-Gm-Message-State: AGi0PuaDpd7RUZ1gs+ALDqW6mtdnXfqUpxMNsAY+Axm9jysqRnTccy+2
 mEMpMYYEYxht4TbY1tm77uqTlklxoKahiQ==
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr1819620wru.243.1588270241718; 
 Thu, 30 Apr 2020 11:10:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t8sm652421wrq.88.2020.04.30.11.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 11:10:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 28/36] target/arm: Convert Neon VPMAX/VPMIN 3-reg-same insns
 to decodetree
Date: Thu, 30 Apr 2020 19:09:55 +0100
Message-Id: <20200430181003.21682-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200430181003.21682-1-peter.maydell@linaro.org>
References: <20200430181003.21682-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EG8R1NrvDikQ

Convert the Neon integer VPMAX and VPMIN 3-reg-same insns to
decodetree. These are 'pairwise' operations.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 71 +++++++++++++++++++++++++++++++++
 target/arm/translate.c          | 16 +-------
 target/arm/neon-dp.decode       |  9 +++++
 3 files changed, 82 insertions(+), 14 deletions(-)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 4692448fc5f..cd4c9dd6f28 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1204,3 +1204,74 @@ static bool trans_VABA_U_3s(DisasContext *s, arg_3same *a)
     }
     return do_vaba(s, a, abd_fns[a->size], add_fns[a->size]);
 }
+
+static bool do_3same_pair(DisasContext *s, arg_3same *a, NeonGenTwoOpFn *fn)
+{
+    /* Operations handled pairwise 32 bits at a time */
+    TCGv_i32 tmp, tmp2, tmp3;
+
+    if (!arm_dc_feature(s, ARM_FEATURE_NEON)) {
+        return false;
+    }
+
+    /* UNDEF accesses to D16-D31 if they don't exist. */
+    if (!dc_isar_feature(aa32_simd_r32, s) &&
+        ((a->vd | a->vn | a->vm) & 0x10)) {
+        return false;
+    }
+
+    if (a->size == 3) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    assert(a->q == 0); /* enforced by decode patterns */
+
+    /*
+     * Note that we have to be careful not to clobber the source operands
+     * in the "vm == vd" case by storing the result of the first pass too
+     * early. Since Q is 0 there are always just two passes, so instead
+     * of a complicated loop over each pass we just unroll.
+     */
+    tmp = neon_load_reg(a->vn, 0);
+    tmp2 = neon_load_reg(a->vn, 1);
+    fn(tmp, tmp, tmp2);
+    tcg_temp_free_i32(tmp2);
+
+    tmp3 = neon_load_reg(a->vm, 0);
+    tmp2 = neon_load_reg(a->vm, 1);
+    fn(tmp3, tmp3, tmp2);
+    tcg_temp_free_i32(tmp2);
+
+    neon_store_reg(a->vd, 0, tmp);
+    neon_store_reg(a->vd, 1, tmp3);
+    return true;
+}
+
+#define DO_3SAME_PAIR(INSN, func)                                       \
+    static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
+    {                                                                   \
+        static NeonGenTwoOpFn * const fns[] = {                         \
+            gen_helper_neon_##func##8,                                  \
+            gen_helper_neon_##func##16,                                 \
+            gen_helper_neon_##func##32,                                 \
+        };                                                              \
+        if (a->size > 2) {                                              \
+            return false;                                               \
+        }                                                               \
+        return do_3same_pair(s, a, fns[a->size]);                       \
+    }
+
+/* 32-bit pairwise ops end up the same as the elementwise versions.  */
+#define gen_helper_neon_pmax_s32  tcg_gen_smax_i32
+#define gen_helper_neon_pmax_u32  tcg_gen_umax_i32
+#define gen_helper_neon_pmin_s32  tcg_gen_smin_i32
+#define gen_helper_neon_pmin_u32  tcg_gen_umin_i32
+
+DO_3SAME_PAIR(VPMAX_S, pmax_s)
+DO_3SAME_PAIR(VPMIN_S, pmin_s)
+DO_3SAME_PAIR(VPMAX_U, pmax_u)
+DO_3SAME_PAIR(VPMIN_U, pmin_u)
diff --git a/target/arm/translate.c b/target/arm/translate.c
index b04643cec9a..4bbdddaa30c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3011,12 +3011,6 @@ static inline void gen_neon_rsb(int size, TCGv_i32 t0, TCGv_i32 t1)
     }
 }
 
-/* 32-bit pairwise ops end up the same as the elementwise versions.  */
-#define gen_helper_neon_pmax_s32  tcg_gen_smax_i32
-#define gen_helper_neon_pmax_u32  tcg_gen_umax_i32
-#define gen_helper_neon_pmin_s32  tcg_gen_smin_i32
-#define gen_helper_neon_pmin_u32  tcg_gen_umin_i32
-
 #define GEN_NEON_INTEGER_OP_ENV(name) do { \
     switch ((size << 1) | u) { \
     case 0: \
@@ -4794,6 +4788,8 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         case NEON_3R_VRSHL:
         case NEON_3R_VQRSHL:
         case NEON_3R_VABA:
+        case NEON_3R_VPMAX:
+        case NEON_3R_VPMIN:
             /* Already handled by decodetree */
             return 1;
         }
@@ -4805,8 +4801,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
         pairwise = 0;
         switch (op) {
         case NEON_3R_VPADD_VQRDMLAH:
-        case NEON_3R_VPMAX:
-        case NEON_3R_VPMIN:
             pairwise = 1;
             break;
         case NEON_3R_FLOAT_ARITH:
@@ -4863,12 +4857,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
             tmp2 = neon_load_reg(rm, pass);
         }
         switch (op) {
-        case NEON_3R_VPMAX:
-            GEN_NEON_INTEGER_OP(pmax);
-            break;
-        case NEON_3R_VPMIN:
-            GEN_NEON_INTEGER_OP(pmin);
-            break;
         case NEON_3R_VQDMULH_VQRDMULH: /* Multiply high.  */
             if (!u) { /* VQDMULH */
                 switch (size) {
diff --git a/target/arm/neon-dp.decode b/target/arm/neon-dp.decode
index d91f944f84a..e47998899ce 100644
--- a/target/arm/neon-dp.decode
+++ b/target/arm/neon-dp.decode
@@ -42,6 +42,9 @@
 @3same           .... ... . . . size:2 .... .... .... . q:1 . . .... \
                  &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp
 
+@3same_q0        .... ... . . . size:2 .... .... .... . 0 . . .... \
+                 &3same vm=%vm_dp vn=%vn_dp vd=%vd_dp q=0
+
 VHADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 0 .... @3same
 VHADD_U_3s       1111 001 1 0 . .. .... .... 0000 . . . 0 .... @3same
 VQADD_S_3s       1111 001 0 0 . .. .... .... 0000 . . . 1 .... @3same
@@ -128,6 +131,12 @@ VMLS_3s          1111 001 1 0 . .. .... .... 1001 . . . 0 .... @3same
 VMUL_3s          1111 001 0 0 . .. .... .... 1001 . . . 1 .... @3same
 VMUL_p_3s        1111 001 1 0 . .. .... .... 1001 . . . 1 .... @3same
 
+VPMAX_S_3s       1111 001 0 0 . .. .... .... 1010 . . . 0 .... @3same_q0
+VPMAX_U_3s       1111 001 1 0 . .. .... .... 1010 . . . 0 .... @3same_q0
+
+VPMIN_S_3s       1111 001 0 0 . .. .... .... 1010 . . . 1 .... @3same_q0
+VPMIN_U_3s       1111 001 1 0 . .. .... .... 1010 . . . 1 .... @3same_q0
+
 VQRDMLAH_3s      1111 001 1 0 . .. .... .... 1011 ... 1 .... @3same
 
 SHA1_3s          1111 001 0 0 . optype:2 .... .... 1100 . 1 . 0 .... \
-- 
2.20.1

