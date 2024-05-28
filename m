Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp189371ejk;
        Tue, 28 May 2024 13:31:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWP0rCmlyaEXSynDCAxVSJJzyiNZWNBioMj04wcExOmT06aGTVLKgTrXkmqU73cRaPdcfN1gzZRhMcacw+px7kyZgaSJdak
X-Google-Smtp-Source: AGHT+IFifEIu3L455oF5XmJk+a4OsuC0ATLlvLDY2cw9uXoegs2vAEtlFyhfSuKjYOlB8zBegYkf
X-Received: by 2002:a05:6214:590d:b0:6ad:9e54:e70f with SMTP id 6a1803df08f44-6ad9e54e822mr7429076d6.50.1716928318778;
        Tue, 28 May 2024 13:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716928318; cv=none;
        d=google.com; s=arc-20160816;
        b=OT9WZOXvrMBuPvNfq9rYDnP7zMWHQoEdzd8dbHNIZBDy4gPl982qS2zx2390yb9i+g
         meSgw7mKXR4/ooyfFK9bpGYuSKDSTKOqMtov2YDMzRcyWpXKAVwckMuHEIGFVaL8afTe
         YOvxfnsFV+mnh5e2ZmZlyrq35qFIgIshjiG8pkgbLRHQvLVtBGsW/FneDqcSPTl93Lkl
         8eRH8SCdaXvkn8zM/kc1xMmOZQY0zz0fL3g/xr9SFqWU4F9cSJRJoA8O501caEmU09ws
         ILQyEdKKKR5/TnThDpfaneCm7bKneJOc/cnIvrRqWKgfOhi8nxVaP9OiIgZfjb0b0/W/
         gj1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oaBKiMun4EsMMnbRc9//pAhX0NjbIhS9pHEjkYNEqI4=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=f60NVewrPWm6fESM8JulZd+WDjNbVoiyXiUNThILiy5WNLepNSWfwrDaV5HFAl36cL
         frX4v/iWEJbtxm28GhmKXFcbb6B+2OmmUpHD0T+vMXn56p31H8YwKhkUB4WTTOM5/kAQ
         NdVhNB7P92Zz7od0m4qjAYU660YgCXjIJ0W3MCf5ZILLnsgGu2ZjR99Wl/UFLyMhaDbQ
         ZdvpjZXgtw8UBcV9oZQ7tYkmpL5X9LhzE+kmLOj0oUSFSMracam3R9cCG2MrlR9a8dtQ
         gl5fp6rbZB3RE9qkjq5k0iur5Oox6ZQkh9eIguT60i56tZ1DBfDdFKviQAsZXkgaXWeS
         zuOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ob0iReAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162e26b3si112466186d6.598.2024.05.28.13.31.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 13:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ob0iReAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC3TR-0002qv-0p; Tue, 28 May 2024 16:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3TG-0002kv-My
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:30:59 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC3T9-0003Zi-Uw
 for qemu-arm@nongnu.org; Tue, 28 May 2024 16:30:58 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-6f8eba8dcfcso1028432b3a.3
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 13:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716928250; x=1717533050; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oaBKiMun4EsMMnbRc9//pAhX0NjbIhS9pHEjkYNEqI4=;
 b=ob0iReAbmJALOzMEtXqssmEk4UsKXjj3mxNXRB5SMgzA7Q9T7vVhaeHWQ6uha2gsjo
 eKhqPPsQbvzP+nhEvRb2PhQKQPmcB+1epTbr6tWAQzdzWHwZNZbaInGxII0UgeVBF764
 PwrL6vge2/nSjg2G5W1A7f+9oGjZk8pOnkNfuWcl5rXZLNSDXS6fMkRsRv+dFUBSgl8K
 MtjkRXAqvgQvDnPSgF6GEvd/gVVZV3MLk0PmguFXJeNpFSFlPndu2TebGa1KP2XPsjFa
 vq4lEcCA6BGQxNJJIUp1GvvWKofQ92NaWsR370DCo5txSsUi2BXmLhlI3by5LIzYkltE
 c9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716928250; x=1717533050;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oaBKiMun4EsMMnbRc9//pAhX0NjbIhS9pHEjkYNEqI4=;
 b=DYZG1V8gSNpEbfaLmdWrLyJkZqy+1IAjoBlPkdgOSBmT247iJBLg7n5IDfHXGXkdxd
 h7JIElS37ueaQRQLFf4sP7nbsEjffjlPxJEsAHmDcXH0kQlo9ICwyIXpp5+TdB07MaUE
 CwP3QsKvKwwayb4TYbK4mQvjpDwWxUzaHmJKVT9TGQn6d3d4z4H2qoU8BsmvX21FR5C9
 /jg3Gt2ihZC1OUEIELVCvWkLhnixbsVehqWnnYKWEf99QrOD3XQJ8d7/UaKL7cwNCaPV
 TJAe+Cw7ETcx7PM7dD/v7CNUjhzJyEzgkmUQoXdJ6Ay+p9ZJH4XbaA9sJEnS8O4SNvm9
 XiuQ==
X-Gm-Message-State: AOJu0YxZf67IdD9iuXhW07Y/wd74nurpjYwAxA6sBuct338UyR+GFCfK
 ca0zZvzdqFrC5ZWLkxcGupeMP0FXjWHrLGeIobzdlNLxX55vdd9I+TV3LulDTcn+WHL1gmrtEIX
 6
X-Received: by 2002:a05:6a20:9485:b0:1b2:101:7acd with SMTP id
 adf61e73a8af0-1b212e20ccbmr12202989637.39.1716928249643; 
 Tue, 28 May 2024 13:30:49 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbd3dbe9sm7042036b3a.10.2024.05.28.13.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 13:30:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 04/33] target/arm: Convert SUQADD and USQADD to gvec
Date: Tue, 28 May 2024 13:30:15 -0700
Message-Id: <20240528203044.612851-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240528203044.612851-1-richard.henderson@linaro.org>
References: <20240528203044.612851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
X-TUID: 2KKrelMk9mxG

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h            |  16 +++++
 target/arm/tcg/translate-a64.h |   6 ++
 target/arm/tcg/gengvec64.c     | 110 ++++++++++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c | 113 ++++++++++++++-------------------
 target/arm/tcg/vec_helper.c    |  64 +++++++++++++++++++
 5 files changed, 245 insertions(+), 64 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index f830531dd3..de2c5c9aef 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -836,6 +836,22 @@ DEF_HELPER_FLAGS_5(gvec_sqsub_s, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_sqsub_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usqadd_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usqadd_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usqadd_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_usqadd_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_suqadd_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_suqadd_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_suqadd_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(gvec_suqadd_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fmlal_a32, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate-a64.h b/target/arm/tcg/translate-a64.h
index 91750f0ca9..b5cb26f8a2 100644
--- a/target/arm/tcg/translate-a64.h
+++ b/target/arm/tcg/translate-a64.h
@@ -197,6 +197,12 @@ void gen_gvec_eor3(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
                    uint32_t a, uint32_t oprsz, uint32_t maxsz);
 void gen_gvec_bcax(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
                    uint32_t a, uint32_t oprsz, uint32_t maxsz);
+void gen_gvec_suqadd_qc(unsigned vece, uint32_t rd_ofs,
+                        uint32_t rn_ofs, uint32_t rm_ofs,
+                        uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_usqadd_qc(unsigned vece, uint32_t rd_ofs,
+                        uint32_t rn_ofs, uint32_t rm_ofs,
+                        uint32_t opr_sz, uint32_t max_sz);
 
 void gen_sve_ldr(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
 void gen_sve_str(DisasContext *s, TCGv_ptr, int vofs, int len, int rn, int imm);
diff --git a/target/arm/tcg/gengvec64.c b/target/arm/tcg/gengvec64.c
index 093b498b13..b3afabd38b 100644
--- a/target/arm/tcg/gengvec64.c
+++ b/target/arm/tcg/gengvec64.c
@@ -188,3 +188,113 @@ void gen_gvec_bcax(unsigned vece, uint32_t d, uint32_t n, uint32_t m,
     tcg_gen_gvec_4(d, n, m, a, oprsz, maxsz, &op);
 }
 
+static void gen_suqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec qc,
+                           TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec max =
+        tcg_constant_vec_matching(t, vece, (1ull << ((8 << vece) - 1)) - 1);
+    TCGv_vec u = tcg_temp_new_vec_matching(t);
+
+    /* Maximum value that can be added to @a without overflow. */
+    tcg_gen_sub_vec(vece, u, max, a);
+
+    /* Constrain addend so that the next addition never overflows. */
+    tcg_gen_umin_vec(vece, u, u, b);
+    tcg_gen_add_vec(vece, t, u, a);
+
+    /* Compute QC by comparing the adjusted @b. */
+    tcg_gen_xor_vec(vece, u, u, b);
+    tcg_gen_or_vec(vece, qc, qc, u);
+}
+
+void gen_gvec_suqadd_qc(unsigned vece, uint32_t rd_ofs,
+                        uint32_t rn_ofs, uint32_t rm_ofs,
+                        uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_add_vec, INDEX_op_sub_vec, INDEX_op_umin_vec, 0
+    };
+    static const GVecGen4 ops[4] = {
+        { .fniv = gen_suqadd_vec,
+          .fno = gen_helper_gvec_suqadd_b,
+          .opt_opc = vecop_list,
+          .write_aofs = true,
+          .vece = MO_8 },
+        { .fniv = gen_suqadd_vec,
+          .fno = gen_helper_gvec_suqadd_h,
+          .opt_opc = vecop_list,
+          .write_aofs = true,
+          .vece = MO_16 },
+        { .fniv = gen_suqadd_vec,
+          .fno = gen_helper_gvec_suqadd_s,
+          .opt_opc = vecop_list,
+          .write_aofs = true,
+          .vece = MO_32 },
+        { .fniv = gen_suqadd_vec,
+          .fno = gen_helper_gvec_suqadd_d,
+          .opt_opc = vecop_list,
+          .write_aofs = true,
+          .vece = MO_64 },
+    };
+
+    tcg_debug_assert(opr_sz <= sizeof_field(CPUARMState, vfp.qc));
+    tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
+                   rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
+}
+
+static void gen_usqadd_vec(unsigned vece, TCGv_vec t, TCGv_vec qc,
+                           TCGv_vec a, TCGv_vec b)
+{
+    TCGv_vec u = tcg_temp_new_vec_matching(t);
+    TCGv_vec z = tcg_constant_vec_matching(t, vece, 0);
+
+    /* Compute unsigned saturation of add for +b and sub for -b. */
+    tcg_gen_neg_vec(vece, t, b);
+    tcg_gen_usadd_vec(vece, u, a, b);
+    tcg_gen_ussub_vec(vece, t, a, t);
+
+    /* Select the correct result depending on the sign of b. */
+    tcg_gen_cmpsel_vec(TCG_COND_LT, vece, t, b, z, t, u);
+
+    /* Compute QC by comparing against the non-saturated result. */
+    tcg_gen_add_vec(vece, u, a, b);
+    tcg_gen_xor_vec(vece, u, u, t);
+    tcg_gen_or_vec(vece, qc, qc, u);
+}
+
+void gen_gvec_usqadd_qc(unsigned vece, uint32_t rd_ofs,
+                        uint32_t rn_ofs, uint32_t rm_ofs,
+                        uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_neg_vec, INDEX_op_add_vec,
+        INDEX_op_usadd_vec, INDEX_op_ussub_vec,
+        INDEX_op_cmpsel_vec, 0
+    };
+    static const GVecGen4 ops[4] = {
+        { .fniv = gen_usqadd_vec,
+          .fno = gen_helper_gvec_usqadd_b,
+          .opt_opc = vecop_list,
+          .write_aofs = true,
+          .vece = MO_8 },
+        { .fniv = gen_usqadd_vec,
+          .fno = gen_helper_gvec_usqadd_h,
+          .opt_opc = vecop_list,
+          .write_aofs = true,
+          .vece = MO_16 },
+        { .fniv = gen_usqadd_vec,
+          .fno = gen_helper_gvec_usqadd_s,
+          .opt_opc = vecop_list,
+          .write_aofs = true,
+          .vece = MO_32 },
+        { .fniv = gen_usqadd_vec,
+          .fno = gen_helper_gvec_usqadd_d,
+          .opt_opc = vecop_list,
+          .write_aofs = true,
+          .vece = MO_64 },
+    };
+
+    tcg_debug_assert(opr_sz <= sizeof_field(CPUARMState, vfp.qc));
+    tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
+                   rn_ofs, rm_ofs, opr_sz, max_sz, &ops[vece]);
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 9167e4d0bd..9f948e033e 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -9983,83 +9983,68 @@ static void handle_2misc_narrow(DisasContext *s, bool scalar,
 
 /* Remaining saturating accumulating ops */
 static void handle_2misc_satacc(DisasContext *s, bool is_scalar, bool is_u,
-                                bool is_q, int size, int rn, int rd)
+                                bool is_q, unsigned size, int rn, int rd)
 {
-    bool is_double = (size == 3);
+    if (!is_scalar) {
+        gen_gvec_fn3(s, is_q, rd, rd, rn,
+                     is_u ? gen_gvec_usqadd_qc : gen_gvec_suqadd_qc, size);
+        return;
+    }
 
-    if (is_double) {
+    if (size == 3) {
         TCGv_i64 tcg_rn = tcg_temp_new_i64();
         TCGv_i64 tcg_rd = tcg_temp_new_i64();
-        int pass;
 
-        for (pass = 0; pass < (is_scalar ? 1 : 2); pass++) {
-            read_vec_element(s, tcg_rn, rn, pass, MO_64);
-            read_vec_element(s, tcg_rd, rd, pass, MO_64);
+        read_vec_element(s, tcg_rn, rn, 0, MO_64);
+        read_vec_element(s, tcg_rd, rd, 0, MO_64);
 
-            if (is_u) { /* USQADD */
-                gen_helper_neon_uqadd_s64(tcg_rd, tcg_env, tcg_rn, tcg_rd);
-            } else { /* SUQADD */
-                gen_helper_neon_sqadd_u64(tcg_rd, tcg_env, tcg_rn, tcg_rd);
-            }
-            write_vec_element(s, tcg_rd, rd, pass, MO_64);
+        if (is_u) { /* USQADD */
+            gen_helper_neon_uqadd_s64(tcg_rd, tcg_env, tcg_rn, tcg_rd);
+        } else { /* SUQADD */
+            gen_helper_neon_sqadd_u64(tcg_rd, tcg_env, tcg_rn, tcg_rd);
         }
-        clear_vec_high(s, !is_scalar, rd);
+        write_vec_element(s, tcg_rd, rd, 0, MO_64);
+        clear_vec_high(s, false, rd);
     } else {
         TCGv_i32 tcg_rn = tcg_temp_new_i32();
         TCGv_i32 tcg_rd = tcg_temp_new_i32();
-        int pass, maxpasses;
 
-        if (is_scalar) {
-            maxpasses = 1;
-        } else {
-            maxpasses = is_q ? 4 : 2;
+        read_vec_element_i32(s, tcg_rn, rn, 0, size);
+        read_vec_element_i32(s, tcg_rd, rd, 0, size);
+
+        if (is_u) { /* USQADD */
+            switch (size) {
+            case 0:
+                gen_helper_neon_uqadd_s8(tcg_rd, tcg_env, tcg_rn, tcg_rd);
+                break;
+            case 1:
+                gen_helper_neon_uqadd_s16(tcg_rd, tcg_env, tcg_rn, tcg_rd);
+                break;
+            case 2:
+                gen_helper_neon_uqadd_s32(tcg_rd, tcg_env, tcg_rn, tcg_rd);
+                break;
+            default:
+                g_assert_not_reached();
+            }
+        } else { /* SUQADD */
+            switch (size) {
+            case 0:
+                gen_helper_neon_sqadd_u8(tcg_rd, tcg_env, tcg_rn, tcg_rd);
+                break;
+            case 1:
+                gen_helper_neon_sqadd_u16(tcg_rd, tcg_env, tcg_rn, tcg_rd);
+                break;
+            case 2:
+                gen_helper_neon_sqadd_u32(tcg_rd, tcg_env, tcg_rn, tcg_rd);
+                break;
+            default:
+                g_assert_not_reached();
+            }
         }
 
-        for (pass = 0; pass < maxpasses; pass++) {
-            if (is_scalar) {
-                read_vec_element_i32(s, tcg_rn, rn, pass, size);
-                read_vec_element_i32(s, tcg_rd, rd, pass, size);
-            } else {
-                read_vec_element_i32(s, tcg_rn, rn, pass, MO_32);
-                read_vec_element_i32(s, tcg_rd, rd, pass, MO_32);
-            }
-
-            if (is_u) { /* USQADD */
-                switch (size) {
-                case 0:
-                    gen_helper_neon_uqadd_s8(tcg_rd, tcg_env, tcg_rn, tcg_rd);
-                    break;
-                case 1:
-                    gen_helper_neon_uqadd_s16(tcg_rd, tcg_env, tcg_rn, tcg_rd);
-                    break;
-                case 2:
-                    gen_helper_neon_uqadd_s32(tcg_rd, tcg_env, tcg_rn, tcg_rd);
-                    break;
-                default:
-                    g_assert_not_reached();
-                }
-            } else { /* SUQADD */
-                switch (size) {
-                case 0:
-                    gen_helper_neon_sqadd_u8(tcg_rd, tcg_env, tcg_rn, tcg_rd);
-                    break;
-                case 1:
-                    gen_helper_neon_sqadd_u16(tcg_rd, tcg_env, tcg_rn, tcg_rd);
-                    break;
-                case 2:
-                    gen_helper_neon_sqadd_u32(tcg_rd, tcg_env, tcg_rn, tcg_rd);
-                    break;
-                default:
-                    g_assert_not_reached();
-                }
-            }
-
-            if (is_scalar) {
-                write_vec_element(s, tcg_constant_i64(0), rd, 0, MO_64);
-            }
-            write_vec_element_i32(s, tcg_rd, rd, pass, MO_32);
-        }
-        clear_vec_high(s, is_q, rd);
+        write_vec_element(s, tcg_constant_i64(0), rd, 0, MO_64);
+        write_vec_element_i32(s, tcg_rd, rd, 0, MO_32);
+        clear_vec_high(s, false, rd);
     }
 }
 
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 56fea14edb..d8e96386be 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1555,6 +1555,14 @@ DO_SAT(gvec_sqsub_b, int, int8_t, int8_t, -, INT8_MIN, INT8_MAX)
 DO_SAT(gvec_sqsub_h, int, int16_t, int16_t, -, INT16_MIN, INT16_MAX)
 DO_SAT(gvec_sqsub_s, int64_t, int32_t, int32_t, -, INT32_MIN, INT32_MAX)
 
+DO_SAT(gvec_usqadd_b, int, uint8_t, int8_t, +, 0, UINT8_MAX)
+DO_SAT(gvec_usqadd_h, int, uint16_t, int16_t, +, 0, UINT16_MAX)
+DO_SAT(gvec_usqadd_s, int64_t, uint32_t, int32_t, +, 0, UINT32_MAX)
+
+DO_SAT(gvec_suqadd_b, int, int8_t, uint8_t, +, INT8_MIN, INT8_MAX)
+DO_SAT(gvec_suqadd_h, int, int16_t, uint16_t, +, INT16_MIN, INT16_MAX)
+DO_SAT(gvec_suqadd_s, int64_t, int32_t, uint32_t, +, INT32_MIN, INT32_MAX)
+
 #undef DO_SAT
 
 void HELPER(gvec_uqadd_d)(void *vd, void *vq, void *vn,
@@ -1645,6 +1653,62 @@ void HELPER(gvec_sqsub_d)(void *vd, void *vq, void *vn,
     clear_tail(d, oprsz, simd_maxsz(desc));
 }
 
+void HELPER(gvec_usqadd_d)(void *vd, void *vq, void *vn,
+                           void *vm, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    bool q = false;
+
+    for (i = 0; i < oprsz / 8; i++) {
+        uint64_t nn = n[i];
+        int64_t mm = m[i];
+        uint64_t dd = nn + mm;
+
+        if (mm < 0) {
+            if (nn < (uint64_t)-mm) {
+                dd = 0;
+                q = true;
+            }
+        } else {
+            if (dd < nn) {
+                dd = UINT64_MAX;
+                q = true;
+            }
+        }
+        d[i] = dd;
+    }
+    if (q) {
+        uint32_t *qc = vq;
+        qc[0] = 1;
+    }
+    clear_tail(d, oprsz, simd_maxsz(desc));
+}
+
+void HELPER(gvec_suqadd_d)(void *vd, void *vq, void *vn,
+                           void *vm, uint32_t desc)
+{
+    intptr_t i, oprsz = simd_oprsz(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+    bool q = false;
+
+    for (i = 0; i < oprsz / 8; i++) {
+        int64_t nn = n[i];
+        uint64_t mm = m[i];
+        int64_t dd = nn + mm;
+
+        if (mm > (uint64_t)(INT64_MAX - nn)) {
+            dd = INT64_MAX;
+            q = true;
+        }
+        d[i] = dd;
+    }
+    if (q) {
+        uint32_t *qc = vq;
+        qc[0] = 1;
+    }
+    clear_tail(d, oprsz, simd_maxsz(desc));
+}
 
 #define DO_SRA(NAME, TYPE)                              \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)    \
-- 
2.34.1

