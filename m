Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp481371lff;
        Thu, 17 Jun 2021 05:17:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhNPkOLsKu76ZfkzZBhABoniF/qoI/9jdfmzLK2xhswtE/M4DdaV+4QR7BksmowZWOYjQX
X-Received: by 2002:a1c:8083:: with SMTP id b125mr4796156wmd.176.1623932224571;
        Thu, 17 Jun 2021 05:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623932224; cv=none;
        d=google.com; s=arc-20160816;
        b=eixylmqShg6aM5hPvLmwZ28RA63UGa+HrtgWfQQ5ZGU8pMKpuf+7ATCTRIjBDEEsR3
         j11V+v/ywlmTaDOD1wYu6sgCq6h+YC1MUPIMdY/k9Dp/65mpHqq2i1YGF2S0qKMfnTl8
         r/E7ichiPz6rbeKUzur5bGdJZsPqgtppORSYTC0SB5aVAcDL//YcnbK1/3s8oc8npXyz
         QPxa+GFOQzRP8z+ogyO99FqFix7L9PMJLjxvneJ2tBuGgcKJ7oKMFul43DhgmkSPJCv2
         wc+kSRL0w6ZChpEGMP+tgGOUdJ5uzppWjOQSbbIrMN5pfWvQFdsQgUqp6QuXdkxPdmry
         h6QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rd6NVPrQIeVk8vL/H8gZxHKo41CJ3oISL2BjynGWmiA=;
        b=rlX7Bj3GzB3xHLfXi/pvLa0IizML+caZwThbz6+6Tw0tkFfnT57ykKUd0rJlM5NvDA
         XB/zI/DySShXkDOGgo6gsArbkFiPPgPK6AnhQvxAptO+MbMvAFhv3aAtjn5/r/gfswWE
         IjxI2+7fyA6t/bXlx+GbjgKs/kFHGI7wkfekroIt0bTNwBs2d4gVZV+2vTdQXcmJaztq
         +oQQVEcB/asa4kijUmOOQrBxaYYF6FDoOQXDVkkLLhDyY0eefkiia/AuKPC2amvhELCu
         C6xd7nPHeEMS7Y5nxLeSC6yRQwhPX1aNMJk5pDUdlwJJjzj0MmWj+ZhpZNo/v8CLr2pp
         SKiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nEeVhOKv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si6259811wmc.190.2021.06.17.05.17.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:17:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nEeVhOKv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltqxD-00010u-EO
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:17:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwn-0000yU-PP
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqwk-0006uG-Jg
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:16:37 -0400
Received: by mail-wr1-x436.google.com with SMTP id c5so6518910wrq.9
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rd6NVPrQIeVk8vL/H8gZxHKo41CJ3oISL2BjynGWmiA=;
 b=nEeVhOKvbuM4v/t/ibMCi5XdVme6O/dHEsyG4V6pjzHqHUr1Pn3tA3P3r79fdLGR2x
 j6J/al//rSjG7CrgqsgHaVK7ggHXRDLUE9g9bcugr/LQBNHjBmXdrX1/N1AgDnmmnSWi
 KZ+JAjIJCLyt2/mFIz97PwO+XRzT4vu93xdTe9DtMNW000LLON7tirkwlTBljrWfeFqY
 qUJjW6z2XZQey3PkByPKoKv7hgSWv1rSBcL4v5pWJS2vn81GeEwfs7VN4WA162e1NJGw
 w+Pn5QHFJV+ybE0Dvt3JTR8wDc6bZIgSy9/rDq6sN5bYswxnnNlksZ5zie43AG7Amnv+
 FI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rd6NVPrQIeVk8vL/H8gZxHKo41CJ3oISL2BjynGWmiA=;
 b=PeL20YjvNilOlmplKuXu6rZrHGnWds0GqtBcQVRE+QwrPkgn6R37rr+wASp8pOT6c6
 T2KHvJUrBIA570okD5uMeZHBniDs6VyjoAMYzle7QtiDVlLCSe8xEm3hTT6bUtXODIhd
 4usFkqQkjmZ4ogQCxjUVITXL0YqiNYKm4SB4Zlq/SIvGmVmRMXaojuDRA04+uRlsXCg0
 UCQCtgN6Gk+YcThi4VBUTFTVvLIjzN4Wm0+Z5JunmnJfxgUXF4vULHeXI+fl32SuVDLR
 yTGgtKDVFzq8jcy6V2xepF+jWluI2008Hogyh9sikXmGKBJynQEMbuEAHywRTVf4htxt
 luTg==
X-Gm-Message-State: AOAM532D4wtwboqWExjE2rBpwaOlP9rwRMM0ILY/suZdJLdf3WBPnLU2
 4gti24BjNev/WI+EeatqCwEf2jBV6aPAaA==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr5318816wrr.35.1623932193139; 
 Thu, 17 Jun 2021 05:16:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 03/44] target/arm: Implement MVE VCLZ
Date: Thu, 17 Jun 2021 13:15:47 +0100
Message-Id: <20210617121628.20116-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kjLdUJ0uDoyX

Implement the MVE VCLZ insn (and the necessary machinery
for MVE 1-input vector ops).

Note that for non-load instructions predication is always performed
at a byte level granularity regardless of element size (R_ZLSJ),
and so the masking logic here differs from that used in the VLDR
and VSTR helpers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    |  4 ++
 target/arm/mve.decode      |  8 ++++
 target/arm/mve_helper.c    | 97 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 38 +++++++++++++++
 4 files changed, 147 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index e47d4164ae7..c5c1315b161 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -32,3 +32,7 @@ DEF_HELPER_FLAGS_3(mve_vldrh_uw, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb_h, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrb_w, TCG_CALL_NO_WG, void, env, ptr, i32)
 DEF_HELPER_FLAGS_3(mve_vstrh_w, TCG_CALL_NO_WG, void, env, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vclzb, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vclzh, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vclzw, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 3bc5f034531..24999bf703e 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -20,13 +20,17 @@
 #
 
 %qd 22:1 13:3
+%qm 5:1 1:3
 
 &vldr_vstr rn qd imm p a w size l u
+&1op qd qm size
 
 @vldr_vstr ....... . . . . l:1 rn:4 ... ...... imm:7 &vldr_vstr qd=%qd u=0
 # Note that both Rn and Qd are 3 bits only (no D bit)
 @vldst_wn ... u:1 ... . . . . l:1 . rn:3 qd:3 . ... .. imm:7 &vldr_vstr
 
+@1op .... .... .... size:2 .. .... .... .... .... &1op qd=%qd qm=%qm
+
 # Vector loads and stores
 
 # Widening loads and narrowing stores:
@@ -61,3 +65,7 @@ VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111101 .......   @vldr_vstr \
                  size=1 p=1
 VLDR_VSTR        1110110 1 a:1 . w:1 . .... ... 111110 .......   @vldr_vstr \
                  size=2 p=1
+
+# Vector miscellaneous
+
+VCLZ             1111 1111 1 . 11 .. 00 ... 0 0100 11 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 3c2b036c9ca..8c752acb935 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -181,3 +181,100 @@ DO_VSTR(vstrh_w, 2, stw, 4, int32_t)
 
 #undef DO_VLDR
 #undef DO_VSTR
+
+/*
+ * The mergemask(D, R, M) macro performs the operation "*D = R" but
+ * storing only the bytes which correspond to 1 bits in M,
+ * leaving other bytes in *D unchanged. We use QEMU_GENERIC
+ * to select the correct implementation based on the type of D.
+ */
+
+static void mergemask_ub(uint8_t *d, uint8_t r, uint16_t mask)
+{
+    if (mask & 1) {
+        *d = r;
+    }
+}
+
+static void mergemask_sb(int8_t *d, int8_t r, uint16_t mask)
+{
+    mergemask_ub((uint8_t *)d, r, mask);
+}
+
+static void mergemask_uh(uint16_t *d, uint16_t r, uint16_t mask)
+{
+    uint16_t bmask = expand_pred_b_data[mask & 3];
+    *d = (*d & ~bmask) | (r & bmask);
+}
+
+static void mergemask_sh(int16_t *d, int16_t r, uint16_t mask)
+{
+    mergemask_uh((uint16_t *)d, r, mask);
+}
+
+static void mergemask_uw(uint32_t *d, uint32_t r, uint16_t mask)
+{
+    uint32_t bmask = expand_pred_b_data[mask & 0xf];
+    *d = (*d & ~bmask) | (r & bmask);
+}
+
+static void mergemask_sw(int32_t *d, int32_t r, uint16_t mask)
+{
+    mergemask_uw((uint32_t *)d, r, mask);
+}
+
+static void mergemask_uq(uint64_t *d, uint64_t r, uint16_t mask)
+{
+    uint64_t bmask = expand_pred_b_data[mask & 0xff];
+    *d = (*d & ~bmask) | (r & bmask);
+}
+
+static void mergemask_sq(int64_t *d, int64_t r, uint16_t mask)
+{
+    mergemask_uq((uint64_t *)d, r, mask);
+}
+
+/*
+ * mergemask() should never be passed an unknown type; catch this bug
+ * at compile time with a link error if we can, otherwise at runtime.
+ */
+#if defined(__OPTIMIZE__) && !defined(__SANITIZE_ADDRESS__)
+void unknown_mergemask_type(void *d, uint64_t r, uint16_t mask);
+#else
+static inline void unknown_mergemask_type(void *d, uint64_t r, uint16_t mask)
+{
+    abort();
+}
+#endif
+
+#define mergemask(D, R, M)                      \
+    QEMU_GENERIC(D,                             \
+                 (uint8_t *, mergemask_ub),     \
+                 (int8_t *,  mergemask_sb),     \
+                 (uint16_t *, mergemask_uh),    \
+                 (int16_t *,  mergemask_sh),    \
+                 (uint32_t *, mergemask_uw),    \
+                 (int32_t *,  mergemask_sw),    \
+                 (uint64_t *, mergemask_uq),    \
+                 (int64_t *,  mergemask_sq),    \
+                 unknown_mergemask_type)(D, R, M)
+
+#define DO_1OP(OP, ESIZE, TYPE, FN)                                     \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        TYPE *d = vd, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        unsigned const esize = sizeof(TYPE);                            \
+        for (e = 0; e < 16 / esize; e++, mask >>= esize) {              \
+            mergemask(&d[H##ESIZE(e)], FN(m[H##ESIZE(e)]), mask);       \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_CLZ_B(N)   (clz32(N) - 24)
+#define DO_CLZ_H(N)   (clz32(N) - 16)
+
+DO_1OP(vclzb, 1, uint8_t, DO_CLZ_B)
+DO_1OP(vclzh, 2, uint16_t, DO_CLZ_H)
+DO_1OP(vclzw, 4, uint32_t, clz32)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 4cabdf7a69b..9eb6a68c976 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -29,6 +29,7 @@
 #include "decode-mve.c.inc"
 
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -160,3 +161,40 @@ static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
 DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h)
 DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w)
 DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w)
+
+static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
+{
+    TCGv_ptr qd, qm;
+
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !mve_check_qreg_bank(s, a->qd | a->qm) ||
+        !fn) {
+        return false;
+    }
+
+    if (!mve_eci_check(s) || !vfp_access_check(s)) {
+        return true;
+    }
+
+    qd = mve_qreg_ptr(a->qd);
+    qm = mve_qreg_ptr(a->qm);
+    fn(cpu_env, qd, qm);
+    tcg_temp_free_ptr(qd);
+    tcg_temp_free_ptr(qm);
+    mve_update_eci(s);
+    return true;
+}
+
+#define DO_1OP(INSN, FN)                                        \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
+    {                                                           \
+        static MVEGenOneOpFn * const fns[] = {                  \
+            gen_helper_mve_##FN##b,                             \
+            gen_helper_mve_##FN##h,                             \
+            gen_helper_mve_##FN##w,                             \
+            NULL,                                               \
+        };                                                      \
+        return do_1op(s, a, fns[a->size]);                      \
+    }
+
+DO_1OP(VCLZ, vclz)
-- 
2.20.1

