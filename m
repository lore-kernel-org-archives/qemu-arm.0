Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5561169lfc;
        Thu, 29 Jul 2021 04:51:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxou1+F9vSjJCpIQL8bHwDVsgxicfg6oVtWI5Ld3xzcv++IvV8V/SpeZ7Df0x27Bu5Dh6s
X-Received: by 2002:a05:6214:b6e:: with SMTP id ey14mr4481035qvb.4.1627559470718;
        Thu, 29 Jul 2021 04:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627559470; cv=none;
        d=google.com; s=arc-20160816;
        b=xEmputcNPoy87DJ1VMiM3KMwC2N8NCAMqc4M6dcswPsucTj7AD1TJLNW63y4OVNH4N
         u2Ej3mj8v6bKVi0oxz99D12g0gqsNFytpO88YuFo82pxwN0dJ53+zYcM1sNquSe9wADn
         f1zxmrqjf7s7iTMyicAIiR1UvyK76dqKGGAEYeq886jO66NTDQoSqOBRJgBfoS3dhcOF
         fs+4s/iV6IrmjTJTb50I/wd9lDRDC0QEXygORh3dkyxXVtgy91E9P2J+B07EnqSs+Ba4
         Ln2Nao0PnLBqYvmB1ge2VuaOwZopmQCkEq5Iq50ynDcGW0Lhu/mxStDVq+tkztpFBPb5
         9xbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=j0VNEds2e4uUMVkkbv3wCuyg9G/hLSB47JPGz5ftqSI=;
        b=H4aqswW9RWzVwHTy2gAho20ZKqIRrYLOxJR984Fdy1Zxq7JYm1K3YmyziHdQFqmtdT
         VSFtiKsGsG5fL8pg/YrfNVlYe+6YYwJQdg/naEimulxoinwvNA5x0mZ4NxQFemnZF1DV
         PdKd/MYgvmKH49+wuNgHegyoZ1q6Q8R9XEditO6u+NYKiKEFQaaGri6tA/pVukPkdFiU
         N49tfK57c7fL72YmWVLRJejquFksawpxpnpDDduAm/5WBLHK33kU+HY2y2QsH/eMntqi
         QX7btLUmtDPFDsWQcDPAYAzLsOke133ddJKgMaOv5Dy3+pONffim4gr+XxWMdoI1BCKu
         dBBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OZ/IjqkG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20si2021668qtg.383.2021.07.29.04.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OZ/IjqkG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m94ZB-0004iO-Ur
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941e-0001We-6z
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:16:30 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941A-0001Vi-1V
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:16:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id p5so6464798wro.7
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=j0VNEds2e4uUMVkkbv3wCuyg9G/hLSB47JPGz5ftqSI=;
 b=OZ/IjqkGod40w6VxYsTfg4W7gES942iRVVySX5bexpEAMYswZZwRDp1c6UyCnweLqU
 utGSIQiglNeyPMk7BWaP9hcJjzg2BMVhqFDi1jpg03XDF+SC3mTHOWtoyJ3e7Q9aZjva
 rqX6Qxfo+utpMjbTHYreuGjvAavs86jO3yr1BDoO/EfW7IO73SAJOxnypPl708HhRr4P
 r3Ow9josV4/R4OAXsemkPD6SrMUfqscjTRg0XR9YYPCb1ZuHR/9LjT8jSo7073C9I9/z
 QEdWtOcpi3URj3hIi2ffvBdcj5KwKr6LuDhePW7LdnsqFLBIHsA3fqOy5PyEE3anXy/J
 2uGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j0VNEds2e4uUMVkkbv3wCuyg9G/hLSB47JPGz5ftqSI=;
 b=ggv+1XfPPjq6qtDwghv4Hv7do5uQFonN+LhbjfJ0AE92PlSOE5cBveeevDALhwTpsP
 GejVQ5SQ6d7bhRDpydtyXkmBH0Tqsqvx9/0AMKE82lOOXzGCR/22XfC4AhMLhKmQWYBN
 T8CP+eTkotVWQTeX1VbloUuk/B2NbWsLSg1/XFok3gpuEqCzbQ8Fy1GqLDFmtf9grdCG
 pcnmHJZ2VSvGzLgBVzwJ3a224BU1dr6ZL4FDgW6CSUSO69hd10laovbqzMROQFJyLeLC
 YEOQzIC1U70NxF/1jYrQKYenoKKMVe+9eeYN0CanVT0WFTap0F4xeOzFmxP+0dkiNQ8A
 vxqA==
X-Gm-Message-State: AOAM530Nd/6dlthQF3h3cVqMCB1utur/hLun14aggljCS5p9lR6mDRGE
 RFGJh5YOaAM1EW4HRxq84t/Y5VWUcgJt6A==
X-Received: by 2002:a05:6000:548:: with SMTP id
 b8mr4376317wrf.159.1627557358175; 
 Thu, 29 Jul 2021 04:15:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 52/53] target/arm: Implement MVE VRINT insns
Date: Thu, 29 Jul 2021 12:15:11 +0100
Message-Id: <20210729111512.16541-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: 7/v/PA5ZeEp1

Implement the MVE VRINT insns, which round floating point inputs
to integer values, leaving them in floating point format.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  6 +++++
 target/arm/mve.decode      |  7 ++++++
 target/arm/mve_helper.c    | 35 +++++++++++++++++++++++++++++
 target/arm/translate-mve.c | 45 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 93 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index f6345c7abbe..76bd25006d8 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -882,3 +882,9 @@ DEF_HELPER_FLAGS_4(mve_vcvt_sf, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vcvt_uf, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vcvt_fs, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vcvt_fu, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(mve_vrint_rm_h, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vrint_rm_s, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(mve_vrintx_h, TCG_CALL_NO_WG, void, env, ptr, ptr)
+DEF_HELPER_FLAGS_3(mve_vrintx_s, TCG_CALL_NO_WG, void, env, ptr, ptr)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 32de4af3170..72b93bfcaa3 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -815,3 +815,10 @@ VCVTPS            1111 1111 1 . 11 .. 11 ... 000 10 0 1 . 0 ... 0 @1op
 VCVTPU            1111 1111 1 . 11 .. 11 ... 000 10 1 1 . 0 ... 0 @1op
 VCVTMS            1111 1111 1 . 11 .. 11 ... 000 11 0 1 . 0 ... 0 @1op
 VCVTMU            1111 1111 1 . 11 .. 11 ... 000 11 1 1 . 0 ... 0 @1op
+
+VRINTN            1111 1111 1 . 11 .. 10 ... 001 000 1 . 0 ... 0 @1op
+VRINTX            1111 1111 1 . 11 .. 10 ... 001 001 1 . 0 ... 0 @1op
+VRINTA            1111 1111 1 . 11 .. 10 ... 001 010 1 . 0 ... 0 @1op
+VRINTZ            1111 1111 1 . 11 .. 10 ... 001 011 1 . 0 ... 0 @1op
+VRINTM            1111 1111 1 . 11 .. 10 ... 001 101 1 . 0 ... 0 @1op
+VRINTP            1111 1111 1 . 11 .. 10 ... 001 111 1 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 7a5143ba6f3..015f25cffce 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -3338,6 +3338,12 @@ DO_VCVT_RMODE(vcvt_rm_uh, 2, uint16_t, helper_vfp_touhh)
 DO_VCVT_RMODE(vcvt_rm_ss, 4, uint32_t, helper_vfp_tosls)
 DO_VCVT_RMODE(vcvt_rm_us, 4, uint32_t, helper_vfp_touls)
 
+#define DO_VRINT_RM_H(M, F, S) helper_rinth(M, S)
+#define DO_VRINT_RM_S(M, F, S) helper_rints(M, S)
+
+DO_VCVT_RMODE(vrint_rm_h, 2, uint16_t, DO_VRINT_RM_H)
+DO_VCVT_RMODE(vrint_rm_s, 4, uint32_t, DO_VRINT_RM_S)
+
 /*
  * VCVT between halfprec and singleprec. As usual for halfprec
  * conversions, FZ16 is ignored and AHP is observed.
@@ -3408,3 +3414,32 @@ DO_VCVT_SH(vcvtb_sh, 0)
 DO_VCVT_SH(vcvtt_sh, 1)
 DO_VCVT_HS(vcvtb_hs, 0)
 DO_VCVT_HS(vcvtt_hs, 1)
+
+#define DO_1OP_FP(OP, ESIZE, TYPE, FN)                                  \
+    void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vm)   \
+    {                                                                   \
+        TYPE *d = vd, *m = vm;                                          \
+        TYPE r;                                                         \
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
+            r = FN(m[H##ESIZE(e)], fpst);                               \
+            mergemask(&d[H##ESIZE(e)], r, mask);                        \
+        }                                                               \
+        mve_advance_vpt(env);                                           \
+    }
+
+DO_1OP_FP(vrintx_h, 2, uint16_t, float16_round_to_int)
+DO_1OP_FP(vrintx_s, 4, uint32_t, float32_round_to_int)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 194ef99cc74..2ed91577ec8 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -641,6 +641,51 @@ DO_VCVT_SH(VCVTT_SH, vcvtt_sh)
 DO_VCVT_SH(VCVTB_HS, vcvtb_hs)
 DO_VCVT_SH(VCVTT_HS, vcvtt_hs)
 
+#define DO_VRINT(INSN, RMODE)                                           \
+    static void gen_##INSN##h(TCGv_ptr env, TCGv_ptr qd, TCGv_ptr qm)   \
+    {                                                                   \
+        gen_helper_mve_vrint_rm_h(env, qd, qm,                          \
+                                  tcg_constant_i32(arm_rmode_to_sf(RMODE))); \
+    }                                                                   \
+    static void gen_##INSN##s(TCGv_ptr env, TCGv_ptr qd, TCGv_ptr qm)   \
+    {                                                                   \
+        gen_helper_mve_vrint_rm_s(env, qd, qm,                          \
+                                  tcg_constant_i32(arm_rmode_to_sf(RMODE))); \
+    }                                                                   \
+    static bool trans_##INSN(DisasContext *s, arg_1op *a)               \
+    {                                                                   \
+        static MVEGenOneOpFn * const fns[] = {                          \
+            NULL,                                                       \
+            gen_##INSN##h,                                              \
+            gen_##INSN##s,                                              \
+            NULL,                                                       \
+        };                                                              \
+        if (!dc_isar_feature(aa32_mve_fp, s)) {                         \
+            return false;                                               \
+        }                                                               \
+        return do_1op(s, a, fns[a->size]);                              \
+    }
+
+DO_VRINT(VRINTN, FPROUNDING_TIEEVEN)
+DO_VRINT(VRINTA, FPROUNDING_TIEAWAY)
+DO_VRINT(VRINTZ, FPROUNDING_ZERO)
+DO_VRINT(VRINTM, FPROUNDING_NEGINF)
+DO_VRINT(VRINTP, FPROUNDING_POSINF)
+
+static bool trans_VRINTX(DisasContext *s, arg_1op *a)
+{
+    static MVEGenOneOpFn * const fns[] = {
+        NULL,
+        gen_helper_mve_vrintx_h,
+        gen_helper_mve_vrintx_s,
+        NULL,
+    };
+    if (!dc_isar_feature(aa32_mve_fp, s)) {
+        return false;
+    }
+    return do_1op(s, a, fns[a->size]);
+}
+
 /* Narrowing moves: only size 0 and 1 are valid */
 #define DO_VMOVN(INSN, FN) \
     static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
-- 
2.20.1

