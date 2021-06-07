Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3681253lfa;
        Mon, 7 Jun 2021 10:07:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycQdxmstRMBQKL+/cHJ0FM1EYPnpkH0BZWJhFTbzdzo9FKU/Zfieth0FQaPV9TJwTkVobK
X-Received: by 2002:a5d:68ca:: with SMTP id p10mr17905570wrw.65.1623085653070;
        Mon, 07 Jun 2021 10:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623085653; cv=none;
        d=google.com; s=arc-20160816;
        b=Cl/A9icoFtBKb/hPSf22mY/LMb5+tUbnIwNvPEhYWYnAbFsurDjhoar263i8Semknq
         fZPOmiFzQPJJSFYviFbfEA8Odza3hgAgdso28FgHmv5FZPRZDrZPom3hIB7Jn78KhQsd
         ym1ec63owTkvquiot+Oo0yY+mOv4XLTrEabpPLmtRzcgjsylnXE+n4otbf8sCP6MK7De
         v/4S/tDuzuVCnigFgmIWsz9nL/4P1lCC2ZYEaJ+glm/6DLnKFX/NCZbJK+av7J7odkIz
         p2rBZV0wk5EvNhVEbSrSjRZYx9r95g5f9nbmd8xlO2guLdqfo7+84OlflkMZm5od3Wt0
         L90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x6vOOVgQ4YobSFgYhZ+zoWMkCw7inNQqjouGvEkHSxI=;
        b=TdFotsuWyQfZf8tdn3XE/1zqSAps2AVy559FNFRk660+fos80tL7ywJiBC8gVi3x4Y
         3jTHa1y8NgWV5s4LsVg8lCU/W/pNpazc+SZnznG94KoGw7E6z5OcjFBAfHqarQBKZl6J
         RNVtWDhfXOuQgCj9z4TpQJiKnCw4dKFacfrFr4iqg/1dWK2xVq7dNXwxEp9/Fg2zReUH
         wUq5Eeo1y61NEb6D+rm9asdvn9xddMt/j4LTQBbkqo1zuc9Vke+21fmhfruhFwhicV4/
         qFLjzH0mBsAh140sdi1kN4z4NZAOaKSyXGig4Rjd33Z0TBNndkWILpxEuZv5Fo666ANd
         SulQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VMuAZtmF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e14si8958239wrq.347.2021.06.07.10.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:07:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VMuAZtmF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIiq-0004Np-3T
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaS-0007UZ-45
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:54 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaC-0007vw-4D
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:49 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so81700wmq.0
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x6vOOVgQ4YobSFgYhZ+zoWMkCw7inNQqjouGvEkHSxI=;
 b=VMuAZtmFkhWwpS6dVETPt7Cv9/QYAdyCJuF87+E3Mlnl+2rUx5ZyKiljsTqiAeQ0Ym
 CtM8IuSOWCtyMlAYtbcrlHppYmuEOE8rrEpGXgd4p7PHUSQQ1n1jKANpYzg26yBnvz14
 rTj2h5zDcDrlY7BL2tTafbZuvvfxEoUrrtox+CaLUWbHq9npsydAHb9piONnlUYWzklb
 ZV9/VctCzq3u5YVXKgA63AU6Gdmj8D2uZ28kXMxv5bIzKQ1SIwlrAoxOMFiFraz2U4vJ
 fh7QoU2F8SnUieOaxmffHFkfN/gMclNmc3vhu6i1h9b2weNsd59jbztHUYpeybvf0OVg
 vWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x6vOOVgQ4YobSFgYhZ+zoWMkCw7inNQqjouGvEkHSxI=;
 b=ncc5Ct5kHQyvLfFTfz3oJJ/dTDM1smIgxz1yzUF2redxPgMSdeRDJgriJQG0GEvvuf
 hsShHZpEq3JrthYWwlN1gE88fYDX8uEjMrjbhL8KLVIJoUWf1AvmS1P1dY0qNOp3fPl+
 PIO1FXz9osFD2IxJGvUkQQ8MXSoSILm+SgRbjlZ3icQtLTPpU3P10/crN306dkGjXqo7
 fxbZfiQbzCEITb1wRf+/Cx0yBw6biDjjRgZPbI2553WnXP2t4mdOY+7Jfc61/usjdqm6
 UWPGcrdN8isXIlXUqIA/1+Gu+0rvvUvQ5ePg4XRTGVupokd+XewSJhWbsq8DTaNPXqQF
 V6+g==
X-Gm-Message-State: AOAM530nTZ86T8+lcr0nvRjvDEot465n5HeSQYASwSU9Xv4fbO2P4uCQ
 GCfLYDRZOT9X6vNfdoc/8bm6FWBfFL6054bm
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr68719wmq.31.1623085114773; 
 Mon, 07 Jun 2021 09:58:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/55] target/arm: Implement MVE VCLZ
Date: Mon,  7 Jun 2021 17:57:39 +0100
Message-Id: <20210607165821.9892-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AleKQGwvZkAO

Implement the MVE VCLZ insn (and the necessary machinery
for MVE 1-input vector ops).

Note that for non-load instructions predication is always performed
at a byte level granularity regardless of element size (R_ZLSJ),
and so the masking logic here differs from that used in the VLDR
and VSTR helpers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  4 ++++
 target/arm/mve.decode      |  8 +++++++
 target/arm/mve_helper.c    | 48 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 43 ++++++++++++++++++++++++++++++++++
 4 files changed, 103 insertions(+)

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
index 6a2fc1c37cd..b7c44f57c09 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -196,3 +196,51 @@ DO_VSTR(vstrh_w, 4, stw, int32_t, H4)
 
 #undef DO_VLDR
 #undef DO_VSTR
+
+/*
+ * Take the bottom bits of mask (which is 1 bit per lane) and
+ * convert to a mask which has 1s in each byte which is predicated.
+ */
+static uint8_t mask_to_bytemask1(uint16_t mask)
+{
+    return (mask & 1) ? 0xff : 0;
+}
+
+static uint16_t mask_to_bytemask2(uint16_t mask)
+{
+    static const uint16_t masks[] = { 0x0000, 0x00ff, 0xff00, 0xffff };
+    return masks[mask & 3];
+}
+
+static uint32_t mask_to_bytemask4(uint16_t mask)
+{
+    static const uint32_t masks[] = {
+        0x00000000, 0x000000ff, 0x0000ff00, 0x0000ffff,
+        0x00ff0000, 0x00ff00ff, 0x00ffff00, 0x00ffffff,
+        0xff000000, 0xff0000ff, 0xff00ff00, 0xff00ffff,
+        0xffff0000, 0xffff00ff, 0xffffff00, 0xffffffff,
+    };
+    return masks[mask & 0xf];
+}
+
+#define DO_1OP(OP, ESIZE, TYPE, H, FN)                                  \
+    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
+    {                                                                   \
+        TYPE *d = vd, *m = vm;                                          \
+        uint16_t mask = mve_element_mask(env);                          \
+        unsigned e;                                                     \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
+            TYPE r = FN(m[H(e)]);                                       \
+            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
+            d[H(e)] &= ~bytemask;                                       \
+            d[H(e)] |= (r & bytemask);                                  \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+#define DO_CLZ_B(N)   (clz32(N) - 24)
+#define DO_CLZ_H(N)   (clz32(N) - 16)
+
+DO_1OP(vclzb, 1, uint8_t, H1, DO_CLZ_B)
+DO_1OP(vclzh, 2, uint16_t, H2, DO_CLZ_H)
+DO_1OP(vclzw, 4, uint32_t, H4, clz32)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 14206893d5f..6bbc2df35c1 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -29,6 +29,7 @@
 #include "decode-mve.c.inc"
 
 typedef void MVEGenLdStFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
+typedef void MVEGenOneOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 
 /* Return the offset of a Qn register (same semantics as aa32_vfp_qreg()) */
 static inline long mve_qreg_offset(unsigned reg)
@@ -167,3 +168,45 @@ static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
 DO_VLDST_WIDE_NARROW(VLDSTB_H, vldrb_sh, vldrb_uh, vstrb_h)
 DO_VLDST_WIDE_NARROW(VLDSTB_W, vldrb_sw, vldrb_uw, vstrb_w)
 DO_VLDST_WIDE_NARROW(VLDSTH_W, vldrh_sw, vldrh_uw, vstrh_w)
+
+static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
+{
+    TCGv_ptr qd, qm;
+
+    if (!dc_isar_feature(aa32_mve, s)) {
+        return false;
+    }
+    if (a->qd > 7 || a->qm > 7 || !fn) {
+        return false;
+    }
+
+    if (!mve_eci_check(s)) {
+        return true;
+    }
+
+    if (!vfp_access_check(s)) {
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
+        MVEGenOneOpFn *fns[] = {                                \
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

