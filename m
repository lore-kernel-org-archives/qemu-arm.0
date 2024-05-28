Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp189955ejk;
        Tue, 28 May 2024 13:33:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUruvJroyN0CZnP1s8ULcqe3rtKJ/qgmPy6TztLtY6up4BB5SIzvtGDhejbdONCpWA8uwxSjad4vo8dqIxo0ukGPS5X+V8e
X-Google-Smtp-Source: AGHT+IFL6toYwvSdd8iLZf4hsuCpvAEn/vh09nmH2RXsvlEpBc8qV1KbF+VG9ExexOCjKdZbbIuD
X-Received: by 2002:a05:620a:448c:b0:792:ec90:b1f9 with SMTP id af79cd13be357-794ab110ad3mr1692345085a.73.1716928402913;
        Tue, 28 May 2024 13:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716928402; cv=none;
        d=google.com; s=arc-20160816;
        b=M0/bTOwXSAbIaPZsHihMVZnxg1ntLqyE/SfBA1/QzHBShwBDjTVGR/Lvd6X13MkAo9
         xXCET9RpG7x4wRG9cKZ2Kaiiv1JYE7UgbtDmr2uSIbmECIq6Klue4yfaXJAWin+IvGit
         pT6/RjO+CZWyFr/6D7p1n1altF/grffmqVpX6eGkE01iU40hI9fykAhAxoa2DYlxSgL8
         k9QT7Jl9SqCg9nr/wibqePxm1X506b6d1ipwdzRuyldLC11kFZvLnza7J4SiSn4S/cjH
         T+YIkWqeFzBB5vxJhEp5GoYD0zUMcbBreS2j8QzLC5Ql8Ve6s/FmhTfuceXAG8lVJq8l
         MGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3XxAxrOkK1zF0OD6pzy6IUaKx6OajSHHLR/9wKuuiPQ=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=qKz9Swfm8Cwtp0q5N5ZfHfZjAgC1VvG949vMG0MxAdhsTKj2lYv+gU3HlR69J7QBSe
         YKXwFC4mF7lV72MHtfoj+DCjP8ixfw8+FmtoJo58s0ywA7JZgdPaekypbP8NgWeQ+3OE
         N6axu/q25bJaroHcjyd6HprArxQpyMGkHIVW2TYagaPwOSeuQ4XhxvxOzmdkg5GOmjnM
         yKyBXPI0pY3GqYt4uC92/rGTPONzENiMqa9GCy3Wh85ttPoC60TVquPu9TzFQKQRu1SS
         zM+lUOOPs5IMemZap4EtIbHYWeAEFF3Wkwx2jd8jiyfhD45q+Lw0hMyEsetI6K5d0DsW
         /Flg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L/VuoVwD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abcac2dcsi1102417685a.89.2024.05.28.13.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 13:33:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="L/VuoVwD";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC3UF-0004II-Rm; Tue, 28 May 2024 16:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3Tl-0003Av-Sy
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:29 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TW-0003kt-IY
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:31:28 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6f8e98784b3so943401b3a.1
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 13:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716928272; x=1717533072; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3XxAxrOkK1zF0OD6pzy6IUaKx6OajSHHLR/9wKuuiPQ=;
 b=L/VuoVwDIfl7j+cOg7hLwI7dq6y43qfh5Zawk1KYe6YzVlhihmqUS2UfAtqLmOQAwJ
 g0RjNDRQwfte1P+Kd/P5YyZHFxPAuogznxhyTCJcmfUS/7eXayzzIjJsp8Zr3m1UIvhO
 ZjxFOJM8b3/ZuqcbJc7u8Kf1BvsuZ81H0jVNWWyYORMZRTEO6lwEasC3SDnzfL0pXy3J
 48GjVH4nt+UVyZYJTio+UZXCpBDNjqudoRp1sPolVCOoLoj1vB6sio6YMlTJabFsC+v9
 1+byG9PJJMZUbSsJ8CN5eGffXJUDkN8D0/U877oe+cSTmREAMwzuJ/YbUffT5wULwK6C
 b1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928272; x=1717533072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3XxAxrOkK1zF0OD6pzy6IUaKx6OajSHHLR/9wKuuiPQ=;
 b=FdRYNjfyrIekCkltgp881V7DU9JVCpD7ZJ8VKb8v7VEkPBz98I8K9idH//jc7RN0Z9
 gEKjplgNCV6guyuAR646UHGOWAx1I36BkFyQgcB4FBTXWqMkQs7uBw8SjLVQYEYAS5u9
 BKENOOy7dmvjOJTxF0/vptWbixEzxsDDvmLtYBhbTtn7KiKPYzWHWbU1J28X16iVh2xJ
 2PwRgP5dR8zUvKRBAOZLm5YLU3e6dQM7VQAiJ8w/89IYlZbnd8Z4AcY9irfUvkwwX8qQ
 RtBPJw9gynfUCG6AaTrJ3+NQmbCSfih9HFliY0+Xz11C5kRZ5qXHMWYI0si3QLSFoy0a
 rSsQ==
X-Gm-Message-State: AOJu0Yw9UfE6VxxjDu/4R3yw0zCMEEqet1SVSwc/fsugPb8bCLeW6lfC
 wqiDtgeZlQBsnPE+3O5/t7aPQ3pQSX2rNBLPObPBjuJskjLA/eBzD66Hv5KNsdo=
X-Received: by 2002:a05:6a20:9d8e:b0:1b1:ec00:dac8 with SMTP id
 adf61e73a8af0-1b212df058amr12726988637.27.1716928272053; 
 Tue, 28 May 2024 13:31:12 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3dbe9sm7042036b3a.10.2024.05.28.13.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:31:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 30/33] target/arm: Tidy SQDMULH, SQRDMULH (vector)
Date: Tue, 28 May 2024 13:30:41 -0700
Message-Id: <20240528203044.612851-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528203044.612851-1-richard.henderson@linaro.org>
References: <20240528203044.612851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yABtiIDf3Jni

We already have a gvec helper for the operations, but we aren't
using it on the aa32 neon side.  Create a unified expander for
use by both aa32 and aa64 translators.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate.h      |  4 ++++
 target/arm/tcg/gengvec.c        | 20 ++++++++++++++++++++
 target/arm/tcg/translate-a64.c  | 23 ++++-------------------
 target/arm/tcg/translate-neon.c | 23 +++--------------------
 4 files changed, 31 insertions(+), 39 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 3b1e68b779..aba21f730f 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -539,6 +539,10 @@ void gen_gvec_sri(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
 void gen_gvec_sli(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
                   int64_t shift, uint32_t opr_sz, uint32_t max_sz);
 
+void gen_gvec_sqdmulh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                         uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_sqrdmulh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                          uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 void gen_gvec_sqrdmlah_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                           uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
 void gen_gvec_sqrdmlsh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
diff --git a/target/arm/tcg/gengvec.c b/target/arm/tcg/gengvec.c
index 119826bf28..56a1dc1f75 100644
--- a/target/arm/tcg/gengvec.c
+++ b/target/arm/tcg/gengvec.c
@@ -35,6 +35,26 @@ static void gen_gvec_fn3_qc(uint32_t rd_ofs, uint32_t rn_ofs, uint32_t rm_ofs,
                        opr_sz, max_sz, 0, fn);
 }
 
+void gen_gvec_sqdmulh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                         uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3_ptr * const fns[2] = {
+        gen_helper_neon_sqdmulh_h, gen_helper_neon_sqdmulh_s
+    };
+    tcg_debug_assert(vece >= 1 && vece <= 2);
+    gen_gvec_fn3_qc(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, fns[vece - 1]);
+}
+
+void gen_gvec_sqrdmulh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                         uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
+{
+    static gen_helper_gvec_3_ptr * const fns[2] = {
+        gen_helper_neon_sqrdmulh_h, gen_helper_neon_sqrdmulh_s
+    };
+    tcg_debug_assert(vece >= 1 && vece <= 2);
+    gen_gvec_fn3_qc(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz, fns[vece - 1]);
+}
+
 void gen_gvec_sqrdmlah_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                           uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz)
 {
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c4601cde2f..c673b95ec7 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -724,19 +724,6 @@ static void gen_gvec_op3_fpst(DisasContext *s, bool is_q, int rd, int rn,
                        is_q ? 16 : 8, vec_full_reg_size(s), data, fn);
 }
 
-/* Expand a 3-operand + qc + operation using an out-of-line helper.  */
-static void gen_gvec_op3_qc(DisasContext *s, bool is_q, int rd, int rn,
-                            int rm, gen_helper_gvec_3_ptr *fn)
-{
-    TCGv_ptr qc_ptr = tcg_temp_new_ptr();
-
-    tcg_gen_addi_ptr(qc_ptr, tcg_env, offsetof(CPUARMState, vfp.qc));
-    tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
-                       vec_full_reg_offset(s, rn),
-                       vec_full_reg_offset(s, rm), qc_ptr,
-                       is_q ? 16 : 8, vec_full_reg_size(s), 0, fn);
-}
-
 /* Expand a 4-operand operation using an out-of-line helper.  */
 static void gen_gvec_op4_ool(DisasContext *s, bool is_q, int rd, int rn,
                              int rm, int ra, int data, gen_helper_gvec_4 *fn)
@@ -11007,12 +10994,10 @@ static void disas_simd_3same_int(DisasContext *s, uint32_t insn)
 
     switch (opcode) {
     case 0x16: /* SQDMULH, SQRDMULH */
-        {
-            static gen_helper_gvec_3_ptr * const fns[2][2] = {
-                { gen_helper_neon_sqdmulh_h, gen_helper_neon_sqrdmulh_h },
-                { gen_helper_neon_sqdmulh_s, gen_helper_neon_sqrdmulh_s },
-            };
-            gen_gvec_op3_qc(s, is_q, rd, rn, rm, fns[size - 1][u]);
+        if (u) {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_sqrdmulh_qc, size);
+        } else {
+            gen_gvec_fn3(s, is_q, rd, rn, rm, gen_gvec_sqdmulh_qc, size);
         }
         return;
     }
diff --git a/target/arm/tcg/translate-neon.c b/target/arm/tcg/translate-neon.c
index f9a8753906..915c9e56db 100644
--- a/target/arm/tcg/translate-neon.c
+++ b/target/arm/tcg/translate-neon.c
@@ -937,28 +937,11 @@ DO_SHA2(SHA256SU1, gen_helper_crypto_sha256su1)
     }
 
 #define DO_3SAME_VQDMULH(INSN, FUNC)                                    \
-    WRAP_ENV_FN(gen_##INSN##_tramp16, gen_helper_neon_##FUNC##_s16);    \
-    WRAP_ENV_FN(gen_##INSN##_tramp32, gen_helper_neon_##FUNC##_s32);    \
-    static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,         \
-                                uint32_t rn_ofs, uint32_t rm_ofs,       \
-                                uint32_t oprsz, uint32_t maxsz)         \
-    {                                                                   \
-        static const GVecGen3 ops[2] = {                                \
-            { .fni4 = gen_##INSN##_tramp16 },                           \
-            { .fni4 = gen_##INSN##_tramp32 },                           \
-        };                                                              \
-        tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs, oprsz, maxsz, &ops[vece - 1]); \
-    }                                                                   \
     static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
-    {                                                                   \
-        if (a->size != 1 && a->size != 2) {                             \
-            return false;                                               \
-        }                                                               \
-        return do_3same(s, a, gen_##INSN##_3s);                         \
-    }
+    { return a->size >= 1 && a->size <= 2 && do_3same(s, a, FUNC); }
 
-DO_3SAME_VQDMULH(VQDMULH, qdmulh)
-DO_3SAME_VQDMULH(VQRDMULH, qrdmulh)
+DO_3SAME_VQDMULH(VQDMULH, gen_gvec_sqdmulh_qc)
+DO_3SAME_VQDMULH(VQRDMULH, gen_gvec_sqrdmulh_qc)
 
 #define WRAP_FP_GVEC(WRAPNAME, FPST, FUNC)                              \
     static void WRAPNAME(unsigned vece, uint32_t rd_ofs,                \
-- 
2.34.1

