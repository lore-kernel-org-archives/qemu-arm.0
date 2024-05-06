Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1269987ejc;
        Sun, 5 May 2024 18:06:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVt32q+++0WtZKXkkXUeThgW7wVvtbI8il1ETQbAzj+3IokAeZupB+d6qWLvuNgLfQSeH/lWUg8f3hGegB82JcfJcdYfkPZ
X-Google-Smtp-Source: AGHT+IHg0lI9VIKruOcl4OiEBMQco0NcsCY23w6EJZMzxWgRZ7kTxeHkCCfXj3vyS8p6PV2kj6hP
X-Received: by 2002:ac8:5d89:0:b0:43a:ffb9:6c65 with SMTP id d9-20020ac85d89000000b0043affb96c65mr11276416qtx.0.1714957572292;
        Sun, 05 May 2024 18:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714957572; cv=none;
        d=google.com; s=arc-20160816;
        b=WOusmBlz62Q+5GUnrJPK3XzE5dPU41iD1Ms5xcf23eCGAu1O4QUfRSPUnxS5bB9F9C
         tkmZmWxApKVvbZyCiq3KabKs84ymBb1rFoKSC3jM2LF8Knsx9i/T4q+m7wvt0/vdQCpD
         LTIDjsZLdk06T14CMIudTzACQXZfqPDwUSZzRiLgyPNKck1qHkFCURMO515A1rPXMo7f
         sPqb5R8yz/fCAMzMwfV/9z+RqQgWkJ6qMOFHTGbUOIX++gij4guNOd13X1JQK+AisGuh
         pp87jFoOdC93XtsbR240OycUjduLpcTxOo1fC5xzlsvWyNXClkan/xVl8vqFO/1923a5
         JdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=iccr9YyZ3HdEuxXKQYPZblDFrOgHnTo/LDaPjYT3ffA=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=rMT6t+oA9xmBLWxVc7Jzb/oKW+JTxIj1n1KRMHMirLrL/VnKFBhryV+39k/EeS0da4
         dvpfF4EavTGMRuDHQK+FtIRt6Xd2WBdde55ZFEqLo0oLxGOUOnggAwaMviIX3OtMeTpN
         oCJaHdAZf5tQv0RyBCNnVXcUGN89zbKPgn1mWMYVDyd/RECo3uX3C5N8WTFmcQgRJhl2
         BBAIJR01Q9cBXcUpIpMbvf4SpvzHJBNPU8P2nIkAt/oZ6OiUoiapGeZFQ04SC9J+u4G4
         W6K1UeSnTrxgrSYCQt9fFWhkoa4yOvTSve5yK9zoeV1V18elaSBabVWp69Agm/nEhig1
         YM5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gQ34xgde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020a05622a148100b0043af18fd41csi8486514qtx.32.2024.05.05.18.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:06:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gQ34xgde;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3mmW-0007ot-Bv; Sun, 05 May 2024 21:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmS-0007mw-K7
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:38 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1s3mmD-0002TU-Uv
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:04:36 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6f30f69a958so811164b3a.1
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714957459; x=1715562259; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iccr9YyZ3HdEuxXKQYPZblDFrOgHnTo/LDaPjYT3ffA=;
 b=gQ34xgdeTap5izGRmv4Hz1rTRhFsZyPSViL4dNzFC6ojzv2IAREPPDT0EzWsM9tN3k
 oTvIinBzrWj0gylt4Dw8POb49hrvRcd6XBrvHpy6lRrjPkZpQISktA8ngjzk9ajOKM+d
 QrHpumB8bV5k9lJkJPu8lo5MoBEwiZqrfpHL7HiXXoPwLxXCWtJakonVqclGp4XnvMVa
 /NeWFrGuePISGosscC87s7g29xmV/xeX8KDUpZ3RsR6G/sQYtveGjIfcXWXJrl2F35WX
 uqlOSuotxep9BVoxRPllSnCf2W+1dTLWEjih9rWsfotcFFrHG1CO9O2xa65dC8SMZ800
 ms3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714957459; x=1715562259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iccr9YyZ3HdEuxXKQYPZblDFrOgHnTo/LDaPjYT3ffA=;
 b=BTvE1bKVLeCE4dqFUSWk7WOpWgcIu//CqVcQTksMx+jW6V+qEdBz94+d7HCdUS+n7j
 3VCOSLl8AVRWKo3cWqmpikIB6y4eQuStHA73gjuObhtMNHG8nHbxJwq4qA29OeUwW1Nz
 g0gJFmKyOUZmiU1LoD1obxH1kNJFI5YC9osv5vNzY3ko7Xye0j96Gj9z5dZTCzGNVe2o
 0hxQs5+NFP4R22NWf1gXM6EFLOUROEbqx6mdCkhZqYgyVE/bfbMCSHt7TB6Laz5j/IUD
 I5NNCv2s8BC+FGEgy3kVndI6tFKWx+OdgGm0bijS7EG9aEE2xmg1bw4wtl6tBYIEXUiH
 ZDIQ==
X-Gm-Message-State: AOJu0Yx+BFV+zAPiI6ENhojBMxEwE/XB0Q4Woqfa+wXdpfVV9mXyEIMq
 idlJRt97G/PUj1JuSJ7Lbi6uh74pJMbNUK1i7KXOq+7+Hh2EEbsWT9F4ZV3m88c=
X-Received: by 2002:a05:6a20:c995:b0:1af:96bb:f746 with SMTP id
 gy21-20020a056a20c99500b001af96bbf746mr3400574pzb.6.1714957459102; 
 Sun, 05 May 2024 18:04:19 -0700 (PDT)
Received: from stoup.. (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 pv7-20020a17090b3c8700b002a5f44353d2sm8958232pjb.7.2024.05.05.18.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 18:04:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 16/57] target/arm: Convert FNMUL to decodetree
Date: Sun,  5 May 2024 18:03:22 -0700
Message-Id: <20240506010403.6204-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240506010403.6204-1-richard.henderson@linaro.org>
References: <20240506010403.6204-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hOtaqcPlc3wL

This is the last instruction within disas_fp_2src,
so remove that and its subroutines.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/a64.decode      |   1 +
 target/arm/tcg/translate-a64.c | 177 +++++----------------------------
 2 files changed, 27 insertions(+), 151 deletions(-)

diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 4d72fafae7..dbfdfd80f9 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -703,6 +703,7 @@ FADD_s          0001 1110 ..1 ..... 0010 10 ..... ..... @rrr_hsd
 FSUB_s          0001 1110 ..1 ..... 0011 10 ..... ..... @rrr_hsd
 FDIV_s          0001 1110 ..1 ..... 0001 10 ..... ..... @rrr_hsd
 FMUL_s          0001 1110 ..1 ..... 0000 10 ..... ..... @rrr_hsd
+FNMUL_s         0001 1110 ..1 ..... 1000 10 ..... ..... @rrr_hsd
 
 FMAX_s          0001 1110 ..1 ..... 0100 10 ..... ..... @rrr_hsd
 FMIN_s          0001 1110 ..1 ..... 0101 10 ..... ..... @rrr_hsd
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e6c3da5b2a..caf4d8154d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -4951,6 +4951,31 @@ static const FPScalar f_scalar_fmulx = {
 };
 TRANS(FMULX_s, do_fp3_scalar, a, &f_scalar_fmulx)
 
+static void gen_fnmul_h(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_ptr s)
+{
+    gen_helper_vfp_mulh(d, n, m, s);
+    gen_vfp_negh(d, d);
+}
+
+static void gen_fnmul_s(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_ptr s)
+{
+    gen_helper_vfp_muls(d, n, m, s);
+    gen_vfp_negs(d, d);
+}
+
+static void gen_fnmul_d(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, TCGv_ptr s)
+{
+    gen_helper_vfp_muld(d, n, m, s);
+    gen_vfp_negd(d, d);
+}
+
+static const FPScalar f_scalar_fnmul = {
+    gen_fnmul_h,
+    gen_fnmul_s,
+    gen_fnmul_d,
+};
+TRANS(FNMUL_s, do_fp3_scalar, a, &f_scalar_fnmul)
+
 static bool do_fp3_vector(DisasContext *s, arg_qrrr_e *a,
                           gen_helper_gvec_3_ptr * const fns[3])
 {
@@ -6933,156 +6958,6 @@ static void disas_fp_1src(DisasContext *s, uint32_t insn)
     }
 }
 
-/* Floating-point data-processing (2 source) - single precision */
-static void handle_fp_2src_single(DisasContext *s, int opcode,
-                                  int rd, int rn, int rm)
-{
-    TCGv_i32 tcg_op1;
-    TCGv_i32 tcg_op2;
-    TCGv_i32 tcg_res;
-    TCGv_ptr fpst;
-
-    tcg_res = tcg_temp_new_i32();
-    fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_op1 = read_fp_sreg(s, rn);
-    tcg_op2 = read_fp_sreg(s, rm);
-
-    switch (opcode) {
-    case 0x8: /* FNMUL */
-        gen_helper_vfp_muls(tcg_res, tcg_op1, tcg_op2, fpst);
-        gen_vfp_negs(tcg_res, tcg_res);
-        break;
-    default:
-    case 0x0: /* FMUL */
-    case 0x1: /* FDIV */
-    case 0x2: /* FADD */
-    case 0x3: /* FSUB */
-    case 0x4: /* FMAX */
-    case 0x5: /* FMIN */
-    case 0x6: /* FMAXNM */
-    case 0x7: /* FMINNM */
-        g_assert_not_reached();
-    }
-
-    write_fp_sreg(s, rd, tcg_res);
-}
-
-/* Floating-point data-processing (2 source) - double precision */
-static void handle_fp_2src_double(DisasContext *s, int opcode,
-                                  int rd, int rn, int rm)
-{
-    TCGv_i64 tcg_op1;
-    TCGv_i64 tcg_op2;
-    TCGv_i64 tcg_res;
-    TCGv_ptr fpst;
-
-    tcg_res = tcg_temp_new_i64();
-    fpst = fpstatus_ptr(FPST_FPCR);
-    tcg_op1 = read_fp_dreg(s, rn);
-    tcg_op2 = read_fp_dreg(s, rm);
-
-    switch (opcode) {
-    case 0x8: /* FNMUL */
-        gen_helper_vfp_muld(tcg_res, tcg_op1, tcg_op2, fpst);
-        gen_vfp_negd(tcg_res, tcg_res);
-        break;
-    default:
-    case 0x0: /* FMUL */
-    case 0x1: /* FDIV */
-    case 0x2: /* FADD */
-    case 0x3: /* FSUB */
-    case 0x4: /* FMAX */
-    case 0x5: /* FMIN */
-    case 0x6: /* FMAXNM */
-    case 0x7: /* FMINNM */
-        g_assert_not_reached();
-    }
-
-    write_fp_dreg(s, rd, tcg_res);
-}
-
-/* Floating-point data-processing (2 source) - half precision */
-static void handle_fp_2src_half(DisasContext *s, int opcode,
-                                int rd, int rn, int rm)
-{
-    TCGv_i32 tcg_op1;
-    TCGv_i32 tcg_op2;
-    TCGv_i32 tcg_res;
-    TCGv_ptr fpst;
-
-    tcg_res = tcg_temp_new_i32();
-    fpst = fpstatus_ptr(FPST_FPCR_F16);
-    tcg_op1 = read_fp_hreg(s, rn);
-    tcg_op2 = read_fp_hreg(s, rm);
-
-    switch (opcode) {
-    case 0x8: /* FNMUL */
-        gen_helper_advsimd_mulh(tcg_res, tcg_op1, tcg_op2, fpst);
-        gen_vfp_negh(tcg_res, tcg_res);
-        break;
-    default:
-    case 0x0: /* FMUL */
-    case 0x1: /* FDIV */
-    case 0x2: /* FADD */
-    case 0x3: /* FSUB */
-    case 0x4: /* FMAX */
-    case 0x5: /* FMIN */
-    case 0x6: /* FMAXNM */
-    case 0x7: /* FMINNM */
-        g_assert_not_reached();
-    }
-
-    write_fp_sreg(s, rd, tcg_res);
-}
-
-/* Floating point data-processing (2 source)
- *   31  30  29 28       24 23  22  21 20  16 15    12 11 10 9    5 4    0
- * +---+---+---+-----------+------+---+------+--------+-----+------+------+
- * | M | 0 | S | 1 1 1 1 0 | type | 1 |  Rm  | opcode | 1 0 |  Rn  |  Rd  |
- * +---+---+---+-----------+------+---+------+--------+-----+------+------+
- */
-static void disas_fp_2src(DisasContext *s, uint32_t insn)
-{
-    int mos = extract32(insn, 29, 3);
-    int type = extract32(insn, 22, 2);
-    int rd = extract32(insn, 0, 5);
-    int rn = extract32(insn, 5, 5);
-    int rm = extract32(insn, 16, 5);
-    int opcode = extract32(insn, 12, 4);
-
-    if (opcode > 8 || mos) {
-        unallocated_encoding(s);
-        return;
-    }
-
-    switch (type) {
-    case 0:
-        if (!fp_access_check(s)) {
-            return;
-        }
-        handle_fp_2src_single(s, opcode, rd, rn, rm);
-        break;
-    case 1:
-        if (!fp_access_check(s)) {
-            return;
-        }
-        handle_fp_2src_double(s, opcode, rd, rn, rm);
-        break;
-    case 3:
-        if (!dc_isar_feature(aa64_fp16, s)) {
-            unallocated_encoding(s);
-            return;
-        }
-        if (!fp_access_check(s)) {
-            return;
-        }
-        handle_fp_2src_half(s, opcode, rd, rn, rm);
-        break;
-    default:
-        unallocated_encoding(s);
-    }
-}
-
 /* Floating-point data-processing (3 source) - single precision */
 static void handle_fp_3src_single(DisasContext *s, bool o0, bool o1,
                                   int rd, int rn, int rm, int ra)
@@ -7686,7 +7561,7 @@ static void disas_data_proc_fp(DisasContext *s, uint32_t insn)
             break;
         case 2:
             /* Floating point data-processing (2 source) */
-            disas_fp_2src(s, insn);
+            unallocated_encoding(s); /* in decodetree */
             break;
         case 3:
             /* Floating point conditional select */
-- 
2.34.1

