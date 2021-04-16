Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp749230lfr;
        Fri, 16 Apr 2021 14:45:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztwdV/0DEffrSAdYP7X0Ez1JlWdbSV6LTBoAOYmzmgkec5XMmqEyCN4WWPkW9MYjslE/0s
X-Received: by 2002:a05:6e02:cad:: with SMTP id 13mr8382559ilg.77.1618609520454;
        Fri, 16 Apr 2021 14:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609520; cv=none;
        d=google.com; s=arc-20160816;
        b=ZukDPLmWTi3FDTAyUahL0siDjCAkFU2s7hEULVnT9SNzkCwiRGcxbgup0oLdj5sb7g
         2E8hDhDHusQWvT0fqwsO6uP7xvwo8N6mBuq4IHCbqSM1gLcK3kp3DWP9wFM1m/QiWtYp
         LqHZSKZ4ZgArpmZ+NhUXRK4dwdlY6lnVJU5TzPqZPHNXtxvhHK+YyoGOvP8v3Er5QREq
         DTuZCKDQ3NSgkHO7mASySOE7QqFXlyEqLPLqOlw3GEL+e3a78AHzIjtBVccePFYUMZnQ
         A+UL5Tzju0rBAppvJ8lGR9JlOsicwcJlLezzjGUJ1ms6fjieqignVrdZCE+z+HjCfpGD
         b1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ol1lmCzaRhxk8Z5yEk7BOIP02pWavr9/vkWdoeRx6P8=;
        b=Ppa6HDz8HxwQ46tNrIBKkpSEwLNHaXRWu96cde0xLBcZPFu/tl+mTxMt9Om1sTnpxa
         hxurImVr/dSW9lLZDbZ3IvDRD6Mo1g+sITak+Tzo/5h+Awa0ghjsKUgE+ogfrPbEVud0
         l2U/L753meG8E7i1AwBvTSkfTQzullXZcYR0lqCyJkmtw09Fu7veeFGN8Ob7rAJpvFP9
         d8bthoKt0ocC1+46p9xkc0vZq33Wf4REaqF9C7tIpOqNM47iIni43iR6sgwNKb6elMqb
         jOpIR2NGR5VamxvT1qu6KYk5pXuEvSPSHOedTzB1qKGVpq1B0ZemqxPaKFHB/CT1Ev4k
         GH6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QfJ1Rlhg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14si4707109ion.78.2021.04.16.14.45.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:45:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QfJ1Rlhg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXWH9-0007yf-Jt
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdg-0006Aq-Hv
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:32 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdQ-0001kj-Kf
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 17:04:32 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t22so14310858ply.1
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ol1lmCzaRhxk8Z5yEk7BOIP02pWavr9/vkWdoeRx6P8=;
 b=QfJ1Rlhg8DdXvGK8kPm/vjPWe2dZlfB93fQWyL9R4EYBGiWTW4w+9ZxK2juA6InDOH
 UEwWZ2AT8NE2pw2sxY8le35bvCjqYFR46eSlT4nvPZOl2e7cYTUAw2qenYhJiIj0rXdE
 LhnRDRakQ2WMt3+v9l7sVa/iMTO7+LwyUtjRcl30Oq+0armsTUYSrm//+E6O546+ysBe
 Kk5rcLLTwrWikIi1lGbYtrB1cwSgmuBnJec6rkUsb0HeJSnb/Z6JqbaLqgocRzUZ4bo2
 n32hWkrXu43igNQnKJDvOl9GrCH+cwUFFqCa4Nhl0hSftBwLAH11X4CQjZW25BXkMqp8
 BDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ol1lmCzaRhxk8Z5yEk7BOIP02pWavr9/vkWdoeRx6P8=;
 b=c4oRQ6j9hsM6uKCbie6mVPB66w/pqN1d66f3oVa9YbsLLwHm9FPRktP6NMc0xzJO0Q
 hXjGNmHYdua3gZNFkV88k3GV3DpQsMpId6VLYStvsbPDsAkQuqBGFeTY0v+kd7NTH6My
 IEOiZ7i/P9MYdTQWQCYG0ZGrb+4o2V0fezbktlLnAnV8lfo7dYFmDYharxghCiwptgTW
 es9VZI2mQ4Febf6FjQKmCSw0zTFMY/Uj+JkxbBQPzpZLT+BXeY2fChC9pqnkmwG4QZcR
 7XJYuu34ZNLqNBAhHe7XM+9V0PAGwBZOYMgC1HEIvi3/r7JplfFrLg/7WYdlw6ZE9kDW
 14qA==
X-Gm-Message-State: AOAM532bFUW+bIMbv/hhp8pWW8mmdkyh5f2xNhzUMumyLNOoiA4XyqYj
 /8/J2K6hffaTPs27YHXeb1llrQ==
X-Received: by 2002:a17:90b:3008:: with SMTP id
 hg8mr6920646pjb.115.1618607054976; 
 Fri, 16 Apr 2021 14:04:14 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 64/81] target/arm: Implement SVE2 TBL, TBX
Date: Fri, 16 Apr 2021 14:02:23 -0700
Message-Id: <20210416210240.1591291-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: qemu-arm@nongnu.org, Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0NDSITVJXRQ+

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428144352.9275-1-steplong@quicinc.com>
[rth: rearrange the macros a little and rebase]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 10 +++++
 target/arm/sve.decode      |  5 +++
 target/arm/sve_helper.c    | 90 ++++++++++++++++++++++++++++++--------
 target/arm/translate-sve.c | 33 ++++++++++++++
 4 files changed, 119 insertions(+), 19 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 0be0d90bee..41c08a963b 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -661,6 +661,16 @@ DEF_HELPER_FLAGS_4(sve_tbl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_tbl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_tbl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve2_tbl_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_tbl_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_tbl_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_tbl_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve2_tbx_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_tbx_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_tbx_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_tbx_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_3(sve_sunpk_h, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_sunpk_s, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_sunpk_d, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 7a2770cb0c..38aaf1b37e 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -558,6 +558,11 @@ TBL             00000101 .. 1 ..... 001100 ..... .....          @rd_rn_rm
 # SVE unpack vector elements
 UNPK            00000101 esz:2 1100 u:1 h:1 001110 rn:5 rd:5
 
+# SVE2 Table Lookup (three sources)
+
+TBL_sve2        00000101 .. 1 ..... 001010 ..... .....          @rd_rn_rm
+TBX             00000101 .. 1 ..... 001011 ..... .....          @rd_rn_rm
+
 ### SVE Permute - Predicates Group
 
 # SVE permute predicate elements
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e8a8425522..8dc04441aa 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2915,28 +2915,80 @@ void HELPER(sve_rev_d)(void *vd, void *vn, uint32_t desc)
     }
 }
 
-#define DO_TBL(NAME, TYPE, H) \
-void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc) \
-{                                                              \
-    intptr_t i, opr_sz = simd_oprsz(desc);                     \
-    uintptr_t elem = opr_sz / sizeof(TYPE);                    \
-    TYPE *d = vd, *n = vn, *m = vm;                            \
-    ARMVectorReg tmp;                                          \
-    if (unlikely(vd == vn)) {                                  \
-        n = memcpy(&tmp, vn, opr_sz);                          \
-    }                                                          \
-    for (i = 0; i < elem; i++) {                               \
-        TYPE j = m[H(i)];                                      \
-        d[H(i)] = j < elem ? n[H(j)] : 0;                      \
-    }                                                          \
+typedef void tb_impl_fn(void *, void *, void *, void *, uintptr_t, bool);
+
+static inline void do_tbl1(void *vd, void *vn, void *vm, uint32_t desc,
+                           bool is_tbx, tb_impl_fn *fn)
+{
+    ARMVectorReg scratch;
+    uintptr_t oprsz = simd_oprsz(desc);
+
+    if (unlikely(vd == vn)) {
+        vn = memcpy(&scratch, vn, oprsz);
+    }
+
+    fn(vd, vn, NULL, vm, oprsz, is_tbx);
 }
 
-DO_TBL(sve_tbl_b, uint8_t, H1)
-DO_TBL(sve_tbl_h, uint16_t, H2)
-DO_TBL(sve_tbl_s, uint32_t, H4)
-DO_TBL(sve_tbl_d, uint64_t, )
+static inline void do_tbl2(void *vd, void *vn0, void *vn1, void *vm,
+                           uint32_t desc, bool is_tbx, tb_impl_fn *fn)
+{
+    ARMVectorReg scratch;
+    uintptr_t oprsz = simd_oprsz(desc);
 
-#undef TBL
+    if (unlikely(vd == vn0)) {
+        vn0 = memcpy(&scratch, vn0, oprsz);
+        if (vd == vn1) {
+            vn1 = vn0;
+        }
+    } else if (unlikely(vd == vn1)) {
+        vn1 = memcpy(&scratch, vn1, oprsz);
+    }
+
+    fn(vd, vn0, vn1, vm, oprsz, is_tbx);
+}
+
+#define DO_TB(SUFF, TYPE, H)                                            \
+static inline void do_tb_##SUFF(void *vd, void *vt0, void *vt1,         \
+                                void *vm, uintptr_t oprsz, bool is_tbx) \
+{                                                                       \
+    TYPE *d = vd, *tbl0 = vt0, *tbl1 = vt1, *indexes = vm;              \
+    uintptr_t i, nelem = oprsz / sizeof(TYPE);                          \
+    for (i = 0; i < nelem; ++i) {                                       \
+        TYPE index = indexes[H1(i)], val = 0;                           \
+        if (index < nelem) {                                            \
+            val = tbl0[H(index)];                                       \
+        } else {                                                        \
+            index -= nelem;                                             \
+            if (tbl1 && index < nelem) {                                \
+                val = tbl1[H(index)];                                   \
+            } else if (is_tbx) {                                        \
+                continue;                                               \
+            }                                                           \
+        }                                                               \
+        d[H(i)] = val;                                                  \
+    }                                                                   \
+}                                                                       \
+void HELPER(sve_tbl_##SUFF)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                                       \
+    do_tbl1(vd, vn, vm, desc, false, do_tb_##SUFF);                     \
+}                                                                       \
+void HELPER(sve2_tbl_##SUFF)(void *vd, void *vn0, void *vn1,            \
+                             void *vm, uint32_t desc)                   \
+{                                                                       \
+    do_tbl2(vd, vn0, vn1, vm, desc, false, do_tb_##SUFF);               \
+}                                                                       \
+void HELPER(sve2_tbx_##SUFF)(void *vd, void *vn, void *vm, uint32_t desc) \
+{                                                                       \
+    do_tbl1(vd, vn, vm, desc, true, do_tb_##SUFF);                      \
+}
+
+DO_TB(b, uint8_t, H1)
+DO_TB(h, uint16_t, H2)
+DO_TB(s, uint32_t, H4)
+DO_TB(d, uint64_t,   )
+
+#undef DO_TB
 
 #define DO_UNPK(NAME, TYPED, TYPES, HD, HS) \
 void HELPER(NAME)(void *vd, void *vn, uint32_t desc)           \
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index de8a6b2a15..63e79fafe5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2417,6 +2417,39 @@ static bool trans_TBL(DisasContext *s, arg_rrr_esz *a)
     return true;
 }
 
+static bool trans_TBL_sve2(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_4 * const fns[4] = {
+        gen_helper_sve2_tbl_b, gen_helper_sve2_tbl_h,
+        gen_helper_sve2_tbl_s, gen_helper_sve2_tbl_d
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzzz(s, fns[a->esz], a->rd, a->rn,
+                          (a->rn + 1) % 32, a->rm, 0);
+    }
+    return true;
+}
+
+static bool trans_TBX(DisasContext *s, arg_rrr_esz *a)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve2_tbx_b, gen_helper_sve2_tbx_h,
+        gen_helper_sve2_tbx_s, gen_helper_sve2_tbx_d
+    };
+
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_ool_zzz(s, fns[a->esz], a->rd, a->rn, a->rm, 0);
+    }
+    return true;
+}
+
 static bool trans_UNPK(DisasContext *s, arg_UNPK *a)
 {
     static gen_helper_gvec_2 * const fns[4][2] = {
-- 
2.25.1

