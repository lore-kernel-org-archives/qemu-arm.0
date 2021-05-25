Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4043627lfm;
        Mon, 24 May 2021 18:54:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA86G4F4NFi0KjU6JpKFLhyAdR5GB13MC7SFkgYXp5x87n5zxilWId3pbkhZmv5eBekjsC
X-Received: by 2002:a05:620a:1446:: with SMTP id i6mr31573830qkl.353.1621907687731;
        Mon, 24 May 2021 18:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621907687; cv=none;
        d=google.com; s=arc-20160816;
        b=CRf2zAZCQg7pNGsYHgTb56CMJwWCEholeLnE1/4Jgs5Fv9R5B9fr3Csdyk5abu4tXC
         BMA18eSyh2Teof8lDjYcdlr+Vjc0xOs2l5oXxaTR2noD/W4yH7HIhW2bvjx5eGoFs/iZ
         GmIWIKSMpWZwGLkshxkMQOkcqWjjZbDHd4s8oM/FNaeDZIFkJ7Qv5oTipE2xC0hpv6ZP
         5G2jx9ixImlO8GFw0JwdUMBZdlls1oSnMDRPqvidUdChez2pQJvWDLz7R11ZWyLDdp9Q
         NNCUQ9cTyb7/0GFrllvjwFs3kthlVAE79ot+QKI4lhiByVaMKfTdPTIzrWhk120LSDyP
         ExkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wEecqwdmdBE90cV2vELccP25jMzWfd6VgncPN1qIkME=;
        b=trOR9Zf3NWgXJN8/6gBdVmSxLx7JhtuwmHHePKkpgv+sCcjeCVuF43dRbxaua3zi3n
         MHhPybT8y8RwZeBi0iADIMnvmFHQ4vh4Q226jP3t79KiG8T5Ek/jrDTfT8KcH53pCHUd
         GPb1Bnv/zh+U+6ahigaHUo+xDZocpSQSjn2ZZTqiTJWKsuX0HZVmtgkmJrfMWA2ADZjB
         YZSWVCafO4g20euWqIa4lI1rns8B7gtnKobjHFR7bk4EYPVjm31ljEpVFk0q7VKymKaw
         EtB6JU8aQ3f8d9X7Gw08GzJDbpufAYXP0pK+eXycYsJn648cWRR9uPSyMWOD/mP75XIW
         X4Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f16mTpWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b197si11070416qkg.331.2021.05.24.18.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 18:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=f16mTpWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMHO-00019B-W3
	for alex.bennee@linaro.org; Mon, 24 May 2021 21:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYX-00018B-Pd
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:25 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:45045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXt-00047e-DV
 for qemu-arm@nongnu.org; Mon, 24 May 2021 21:08:25 -0400
Received: by mail-pl1-x631.google.com with SMTP id h12so3348029plf.11
 for <qemu-arm@nongnu.org>; Mon, 24 May 2021 18:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wEecqwdmdBE90cV2vELccP25jMzWfd6VgncPN1qIkME=;
 b=f16mTpWHHRlXwzpwKhZDcQlt9ZDz5GfzeaeLMBt8Ts1FPiOrRcYJvT1Gl6kRFpPTQg
 QxIcGmND0NqOvldNR9oUgKN07RsRJltwVrhBAtk/MTuudua7bNmM3Cy+NyqcL9T9XRpD
 VCKAf44hFmXFSJpGlWtBM/qefY8N2hsIlmHLyNk5QGWgbC9E+XdmgpVQqmKcS4dZUmKo
 UoHLH5mJrXa+bb809poezA5i/fDCh0/lbEVZST+aW7XOPBG1zpG6XSv0TD2biNP6SzR3
 yq9QvSLBdJ6NeGN+4N1DcvY2MtOE7Ji0aTag8ns37w1JtTPJ4jt8RbZXQWqjlI0nVXiJ
 GV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wEecqwdmdBE90cV2vELccP25jMzWfd6VgncPN1qIkME=;
 b=heA0CAzPYlm3H6mhUbbwErdH0KO+iuOPOtcWWQSULRuIPnHgCT0ooFyKPSo6zpD6oR
 N0QJ/zaTK+Uti/oUJQ4+MgjhAnzuzPm9I0lELNLcnMg+JhO5d7t4P3d88yC3wnwNGY/p
 e4tJD9UV3lK6NHeFlzf223NpHcTvjdEA0Oq4qSUOFzTi3NExdHDXvJTOIIku+GKL/udF
 rtIXZkjtTWdzbZBYKzUVTOnDoD8k4UvmicZ4Vo92MLIXhHkeS5f/iusQP+SD0aMNWQ4E
 hpJ/rzIic//ViTiJFseulVCD6ebBirN1v1my7wtWdpB/RNZE0ZnqXgiadB87v6+5o89y
 wANA==
X-Gm-Message-State: AOAM5338GTV7LNp6fAz6zQiOWjTPODR7OwRqaeYo2IskuiFXJqLuZoiJ
 nMhhaMLtlWKILS+AMECrcTLaKf28HXad6Q==
X-Received: by 2002:a17:902:ecc3:b029:f0:a7c2:7b3f with SMTP id
 a3-20020a170902ecc3b02900f0a7c27b3fmr28229823plh.4.1621904863367; 
 Mon, 24 May 2021 18:07:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 71/92] target/arm: Implement SVE2 TBL, TBX
Date: Mon, 24 May 2021 18:03:37 -0700
Message-Id: <20210525010358.152808-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AejyVSOID5OL

From: Stephen Long <steplong@quicinc.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index efc9a7ccf1..cdff155ead 100644
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
index 051a6399ac..fdeb7b106b 100644
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
index f9c2061260..4b05e2e427 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3069,28 +3069,80 @@ void HELPER(sve_rev_d)(void *vd, void *vn, uint32_t desc)
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
index 2136a41094..9a6f7c87c1 100644
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

