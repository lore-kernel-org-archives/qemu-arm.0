Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp935309njk;
        Fri, 24 Jan 2025 08:43:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWX1o3JHzw/N/oKgZ1vWjw3SrbFSCkh4uWlrOz0JSJAH2DOu/5fBbpDobH/Lrc+kiM/VAv4ycpuMnndxA==@linaro.org
X-Google-Smtp-Source: AGHT+IHhcSCxKx4Z+KrW811aPC0zTwNoZK2AG2fMvewShcY10ZOESDdOVAJArgtR7PM2WM52P5aw
X-Received: by 2002:ac8:590e:0:b0:456:919a:11e4 with SMTP id d75a77b69052e-46e5b806549mr103600661cf.20.1737737011391;
        Fri, 24 Jan 2025 08:43:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737011; cv=none;
        d=google.com; s=arc-20240605;
        b=IkqlNCVcgLgQEWDeueSM8esICpSKln2yhPv/oJV63kWd7YhJwwQXOtEcqr8BO6CP/I
         swP8mHFzJ9becUb/vKMHCs31GHFcRXtLFVZdgN1wL7qIAKvDk615efQ7R1s60Y/mFpvm
         mRcd1wGbp52EtyRgvtYxyFaUG7o9Uvfgbcy4HVDa3RP05l9If6b7r0nBjgcwSNZdury8
         4L5IayqK32MPcoL4+KoUHbD0ibEYsS0/f/BHn/jLEYuML1PSzSBjedjYVg72M4d9jf0I
         rpXCLzOXfGpnH/wNAMwuIDsS8u91oTad2IVKu7wFF2dXY2DY+wrzMgwQuKZ416RsWrHZ
         +fJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vTLm+cEqe7UZu5EmY1MoCvylX+SxZXjkyLAYlyIFtdA=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=a+niOri4m57HOU8CuIxerAaS8bhStIxoOMDwIWvsGfpE23tqF8RKvoinX3ZEA16xn5
         f8Xnzgp768odbtCUfxOP4lyD6aQWTonvMSMZawwxckGnENTvRCwey92wONGhDQZd0bPZ
         Gbit41N8NeTXXX9ENEsZoDYoP5F8D3yuenz5cKuM5bnlfVK2p5i51YrbsLG+BpEgLvms
         rmPbA0mEBSfjrzSLhtV1Fi3QMOhJp0VCnKVGkTbbdpy2RuGIzvqNFsvpTAO7/p7zCHzE
         LIF+OJdLiwZToXfPKmWO5XEdwooy8aGO5fULsOg54I18hkBWrMNbw+JI/sB1nDtYiNgd
         yO9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mIDzSxMv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66bc804fsi30231811cf.607.2025.01.24.08.43.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:43:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mIDzSxMv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMYu-0005VW-TS; Fri, 24 Jan 2025 11:29:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYi-0004Xt-4g
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:28 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYf-0005cA-Eg
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:29:27 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4361c705434so16682335e9.3
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736164; x=1738340964; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vTLm+cEqe7UZu5EmY1MoCvylX+SxZXjkyLAYlyIFtdA=;
 b=mIDzSxMvSpQFoTBCrAnYyqEWO+qrGoM/tFQXJeb+j4rWTNbnK2e4hKwXEj+r7Xm3QJ
 2oU2l6K1ikm2OABiTEgmgLMBx0n4c441mR+yftPILl5WvyU/jUB05FEhueRsdi8zehdg
 dXHN1cnrD3qDyxN26EV/AeX7zv04T3bAsJDO+nCtknHpPb9iwRraeSXX+dLEmdCGSHd5
 iXypDV9Wb2ByKno/34e0/l5hwHWlBXVPCOyvUwcb6SMQ2bqXIwp1vRMJJr78NzuVz0ky
 u2ndHnnuMblhsi9F/9eR0GKvfl4o5dQSj1F+xUd0mCTSbbFhj+87vtdIfxCD8jsqqpIO
 sBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736164; x=1738340964;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vTLm+cEqe7UZu5EmY1MoCvylX+SxZXjkyLAYlyIFtdA=;
 b=s6r7RQG4nzTul2mg4NW92+mpInsVnK8uW1r7CYm08fbfs+WsoEB1UwRNeVddVG03+4
 J7ap38nPM6ktm5zGK8hS+1j6sdFFmAAGWAG9ln+a48I/8tpAgukv1kzkgTkZdPYUGC3S
 xLaR+p+P5+mqJZlitj9ixI1X5hUmYi6ZAaajjyzvWpxpfVysjhMTLmIB4NX9gf0PsEVb
 +mo5V/wGSmRIQzFw2DltHYmdL1z1KWMOO7nSXbdN9iHBDgHX0ni4TbdsTaeC8GRgD7Ij
 iRY0JIqjs3YSKgLBT1YMNccS2bOPna6S5g5j750WUteROAqoIKOFgAYViMe2f77pF8Pe
 OwuQ==
X-Gm-Message-State: AOJu0YxtS+b+L9R2xRCGa9T+U75gxrs8KSt5t6CAdcJpQ9XkdZsIadZU
 1ah75z+O8HtLK6/n2Y6vQ5VMsGy4aBU20cmRGY8RY0vpxnFQtFC307mA++eT8NUg7pd7sr5szup
 K
X-Gm-Gg: ASbGncsSlLf0fpKLNrEws3Up3fmvlNbJQii1BITB/nvCR5LZcO7Uhx6lamSlwx2BcIl
 QP7V/v0GaecVpYzLVi8/ysQiHEbFkGzSi4i0bzfdFaC9O05MiwpU7Z9akEZgR4FDFNfjuSffJ40
 Avgugn2cedJcdFP3XaBcIcezfSwGJDUNW9CIjNYvfaXgF7ZsL284I4Cu5FAHU+PDfuEUZv/l8Zc
 yxRbf6yGSBu4IAA3++q9zpodHhOAtMm2sb4wfBv7J/31BewpOGvRlHxIMAocb5Att++b9sAhMhA
 2c7z76y7gF4=
X-Received: by 2002:a05:600c:5486:b0:434:f1e9:afae with SMTP id
 5b1f17b1804b1-438913bfa0fmr257493665e9.1.1737736163912; 
 Fri, 24 Jan 2025 08:29:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 37/76] target/arm: Define and use new write_fp_*reg_merging()
 functions
Date: Fri, 24 Jan 2025 16:27:57 +0000
Message-Id: <20250124162836.2332150-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
X-TUID: HGhjIZbwz8xM

For FEAT_AFP's FPCR.NEP bit, we need to programmatically change the
behaviour of the writeback of the result for most SIMD scalar
operations, so that instead of zeroing the upper part of the result
register it merges the upper elements from one of the input
registers.

Provide new functions write_fp_*reg_merging() which can be used
instead of the existing write_fp_*reg() functions when we want this
"merge the result with one of the input registers if FPCR.NEP is
enabled" handling, and use them in do_fp3_scalar_with_fpsttype().

Note that (as documented in the description of the FPCR.NEP bit)
which input register to use as the merge source varies by
instruction: for these 2-input scalar operations, the comparison
instructions take from Rm, not Rn.

We'll extend this to also provide the merging behaviour for
the remaining scalar insns in subsequent commits.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 117 +++++++++++++++++++++++++--------
 1 file changed, 91 insertions(+), 26 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index d34672a8ba6..19a4ae14c15 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -665,6 +665,68 @@ static void write_fp_sreg(DisasContext *s, int reg, TCGv_i32 v)
     write_fp_dreg(s, reg, tmp);
 }
 
+/*
+ * Write a double result to 128 bit vector register reg, honouring FPCR.NEP:
+ * - if FPCR.NEP == 0, clear the high elements of reg
+ * - if FPCR.NEP == 1, set the high elements of reg from mergereg
+ *   (i.e. merge the result with those high elements)
+ * In either case, SVE register bits above 128 are zeroed (per R_WKYLB).
+ */
+static void write_fp_dreg_merging(DisasContext *s, int reg, int mergereg,
+                                  TCGv_i64 v)
+{
+    if (!s->fpcr_nep) {
+        write_fp_dreg(s, reg, v);
+        return;
+    }
+
+    /*
+     * Move from mergereg to reg; this sets the high elements and
+     * clears the bits above 128 as a side effect.
+     */
+    tcg_gen_gvec_mov(MO_64, fp_reg_offset(s, reg, MO_64),
+                     fp_reg_offset(s, mergereg, MO_64),
+                     16, vec_full_reg_size(s));
+    tcg_gen_st_i64(v, tcg_env, fp_reg_offset(s, reg, MO_64));
+}
+
+/*
+ * Write a single-prec result, but only clear the higher elements
+ * of the destination register if FPCR.NEP is 0; otherwise preserve them.
+ */
+static void write_fp_sreg_merging(DisasContext *s, int reg, int mergereg,
+                                  TCGv_i32 v)
+{
+    if (!s->fpcr_nep) {
+        write_fp_sreg(s, reg, v);
+        return;
+    }
+
+    tcg_gen_gvec_mov(MO_64, fp_reg_offset(s, reg, MO_64),
+                     fp_reg_offset(s, mergereg, MO_64),
+                     16, vec_full_reg_size(s));
+    tcg_gen_st_i32(v, tcg_env, fp_reg_offset(s, reg, MO_32));
+}
+
+/*
+ * Write a half-prec result, but only clear the higher elements
+ * of the destination register if FPCR.NEP is 0; otherwise preserve them.
+ * The caller must ensure that the top 16 bits of v are zero.
+ */
+static void write_fp_hreg_merging(DisasContext *s, int reg, int mergereg,
+                                  TCGv_i32 v)
+{
+    if (!s->fpcr_nep) {
+        write_fp_sreg(s, reg, v);
+        return;
+    }
+
+    tcg_gen_gvec_mov(MO_64, fp_reg_offset(s, reg, MO_64),
+                     fp_reg_offset(s, mergereg, MO_64),
+                     16, vec_full_reg_size(s));
+    tcg_gen_st16_i32(v, tcg_env, fp_reg_offset(s, reg, MO_16));
+}
+
 /* Expand a 2-operand AdvSIMD vector operation using an expander function.  */
 static void gen_gvec_fn2(DisasContext *s, bool is_q, int rd, int rn,
                          GVecGen2Fn *gvec_fn, int vece)
@@ -5038,7 +5100,7 @@ typedef struct FPScalar {
 } FPScalar;
 
 static bool do_fp3_scalar_with_fpsttype(DisasContext *s, arg_rrr_e *a,
-                                        const FPScalar *f,
+                                        const FPScalar *f, int mergereg,
                                         ARMFPStatusFlavour fpsttype)
 {
     switch (a->esz) {
@@ -5047,7 +5109,7 @@ static bool do_fp3_scalar_with_fpsttype(DisasContext *s, arg_rrr_e *a,
             TCGv_i64 t0 = read_fp_dreg(s, a->rn);
             TCGv_i64 t1 = read_fp_dreg(s, a->rm);
             f->gen_d(t0, t0, t1, fpstatus_ptr(fpsttype));
-            write_fp_dreg(s, a->rd, t0);
+            write_fp_dreg_merging(s, a->rd, mergereg, t0);
         }
         break;
     case MO_32:
@@ -5055,7 +5117,7 @@ static bool do_fp3_scalar_with_fpsttype(DisasContext *s, arg_rrr_e *a,
             TCGv_i32 t0 = read_fp_sreg(s, a->rn);
             TCGv_i32 t1 = read_fp_sreg(s, a->rm);
             f->gen_s(t0, t0, t1, fpstatus_ptr(fpsttype));
-            write_fp_sreg(s, a->rd, t0);
+            write_fp_sreg_merging(s, a->rd, mergereg, t0);
         }
         break;
     case MO_16:
@@ -5066,7 +5128,7 @@ static bool do_fp3_scalar_with_fpsttype(DisasContext *s, arg_rrr_e *a,
             TCGv_i32 t0 = read_fp_hreg(s, a->rn);
             TCGv_i32 t1 = read_fp_hreg(s, a->rm);
             f->gen_h(t0, t0, t1, fpstatus_ptr(fpsttype));
-            write_fp_sreg(s, a->rd, t0);
+            write_fp_hreg_merging(s, a->rd, mergereg, t0);
         }
         break;
     default:
@@ -5075,16 +5137,19 @@ static bool do_fp3_scalar_with_fpsttype(DisasContext *s, arg_rrr_e *a,
     return true;
 }
 
-static bool do_fp3_scalar(DisasContext *s, arg_rrr_e *a, const FPScalar *f)
+static bool do_fp3_scalar(DisasContext *s, arg_rrr_e *a, const FPScalar *f,
+                          int mergereg)
 {
-    return do_fp3_scalar_with_fpsttype(s, a, f,
+    return do_fp3_scalar_with_fpsttype(s, a, f, mergereg,
                                        a->esz == MO_16 ?
                                        FPST_FPCR_F16_A64 : FPST_FPCR_A64);
 }
 
-static bool do_fp3_scalar_ah(DisasContext *s, arg_rrr_e *a, const FPScalar *f)
+static bool do_fp3_scalar_ah(DisasContext *s, arg_rrr_e *a, const FPScalar *f,
+                             int mergereg)
 {
-    return do_fp3_scalar_with_fpsttype(s, a, f, select_fpst(s, a->esz));
+    return do_fp3_scalar_with_fpsttype(s, a, f, mergereg,
+                                       select_fpst(s, a->esz));
 }
 
 static const FPScalar f_scalar_fadd = {
@@ -5092,63 +5157,63 @@ static const FPScalar f_scalar_fadd = {
     gen_helper_vfp_adds,
     gen_helper_vfp_addd,
 };
-TRANS(FADD_s, do_fp3_scalar, a, &f_scalar_fadd)
+TRANS(FADD_s, do_fp3_scalar, a, &f_scalar_fadd, a->rn)
 
 static const FPScalar f_scalar_fsub = {
     gen_helper_vfp_subh,
     gen_helper_vfp_subs,
     gen_helper_vfp_subd,
 };
-TRANS(FSUB_s, do_fp3_scalar, a, &f_scalar_fsub)
+TRANS(FSUB_s, do_fp3_scalar, a, &f_scalar_fsub, a->rn)
 
 static const FPScalar f_scalar_fdiv = {
     gen_helper_vfp_divh,
     gen_helper_vfp_divs,
     gen_helper_vfp_divd,
 };
-TRANS(FDIV_s, do_fp3_scalar, a, &f_scalar_fdiv)
+TRANS(FDIV_s, do_fp3_scalar, a, &f_scalar_fdiv, a->rn)
 
 static const FPScalar f_scalar_fmul = {
     gen_helper_vfp_mulh,
     gen_helper_vfp_muls,
     gen_helper_vfp_muld,
 };
-TRANS(FMUL_s, do_fp3_scalar, a, &f_scalar_fmul)
+TRANS(FMUL_s, do_fp3_scalar, a, &f_scalar_fmul, a->rn)
 
 static const FPScalar f_scalar_fmax = {
     gen_helper_vfp_maxh,
     gen_helper_vfp_maxs,
     gen_helper_vfp_maxd,
 };
-TRANS(FMAX_s, do_fp3_scalar, a, &f_scalar_fmax)
+TRANS(FMAX_s, do_fp3_scalar, a, &f_scalar_fmax, a->rn)
 
 static const FPScalar f_scalar_fmin = {
     gen_helper_vfp_minh,
     gen_helper_vfp_mins,
     gen_helper_vfp_mind,
 };
-TRANS(FMIN_s, do_fp3_scalar, a, &f_scalar_fmin)
+TRANS(FMIN_s, do_fp3_scalar, a, &f_scalar_fmin, a->rn)
 
 static const FPScalar f_scalar_fmaxnm = {
     gen_helper_vfp_maxnumh,
     gen_helper_vfp_maxnums,
     gen_helper_vfp_maxnumd,
 };
-TRANS(FMAXNM_s, do_fp3_scalar, a, &f_scalar_fmaxnm)
+TRANS(FMAXNM_s, do_fp3_scalar, a, &f_scalar_fmaxnm, a->rn)
 
 static const FPScalar f_scalar_fminnm = {
     gen_helper_vfp_minnumh,
     gen_helper_vfp_minnums,
     gen_helper_vfp_minnumd,
 };
-TRANS(FMINNM_s, do_fp3_scalar, a, &f_scalar_fminnm)
+TRANS(FMINNM_s, do_fp3_scalar, a, &f_scalar_fminnm, a->rn)
 
 static const FPScalar f_scalar_fmulx = {
     gen_helper_advsimd_mulxh,
     gen_helper_vfp_mulxs,
     gen_helper_vfp_mulxd,
 };
-TRANS(FMULX_s, do_fp3_scalar, a, &f_scalar_fmulx)
+TRANS(FMULX_s, do_fp3_scalar, a, &f_scalar_fmulx, a->rn)
 
 static void gen_fnmul_h(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_ptr s)
 {
@@ -5173,42 +5238,42 @@ static const FPScalar f_scalar_fnmul = {
     gen_fnmul_s,
     gen_fnmul_d,
 };
-TRANS(FNMUL_s, do_fp3_scalar, a, &f_scalar_fnmul)
+TRANS(FNMUL_s, do_fp3_scalar, a, &f_scalar_fnmul, a->rn)
 
 static const FPScalar f_scalar_fcmeq = {
     gen_helper_advsimd_ceq_f16,
     gen_helper_neon_ceq_f32,
     gen_helper_neon_ceq_f64,
 };
-TRANS(FCMEQ_s, do_fp3_scalar, a, &f_scalar_fcmeq)
+TRANS(FCMEQ_s, do_fp3_scalar, a, &f_scalar_fcmeq, a->rm)
 
 static const FPScalar f_scalar_fcmge = {
     gen_helper_advsimd_cge_f16,
     gen_helper_neon_cge_f32,
     gen_helper_neon_cge_f64,
 };
-TRANS(FCMGE_s, do_fp3_scalar, a, &f_scalar_fcmge)
+TRANS(FCMGE_s, do_fp3_scalar, a, &f_scalar_fcmge, a->rm)
 
 static const FPScalar f_scalar_fcmgt = {
     gen_helper_advsimd_cgt_f16,
     gen_helper_neon_cgt_f32,
     gen_helper_neon_cgt_f64,
 };
-TRANS(FCMGT_s, do_fp3_scalar, a, &f_scalar_fcmgt)
+TRANS(FCMGT_s, do_fp3_scalar, a, &f_scalar_fcmgt, a->rm)
 
 static const FPScalar f_scalar_facge = {
     gen_helper_advsimd_acge_f16,
     gen_helper_neon_acge_f32,
     gen_helper_neon_acge_f64,
 };
-TRANS(FACGE_s, do_fp3_scalar, a, &f_scalar_facge)
+TRANS(FACGE_s, do_fp3_scalar, a, &f_scalar_facge, a->rm)
 
 static const FPScalar f_scalar_facgt = {
     gen_helper_advsimd_acgt_f16,
     gen_helper_neon_acgt_f32,
     gen_helper_neon_acgt_f64,
 };
-TRANS(FACGT_s, do_fp3_scalar, a, &f_scalar_facgt)
+TRANS(FACGT_s, do_fp3_scalar, a, &f_scalar_facgt, a->rm)
 
 static void gen_fabd_h(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, TCGv_ptr s)
 {
@@ -5233,21 +5298,21 @@ static const FPScalar f_scalar_fabd = {
     gen_fabd_s,
     gen_fabd_d,
 };
-TRANS(FABD_s, do_fp3_scalar, a, &f_scalar_fabd)
+TRANS(FABD_s, do_fp3_scalar, a, &f_scalar_fabd, a->rn)
 
 static const FPScalar f_scalar_frecps = {
     gen_helper_recpsf_f16,
     gen_helper_recpsf_f32,
     gen_helper_recpsf_f64,
 };
-TRANS(FRECPS_s, do_fp3_scalar_ah, a, &f_scalar_frecps)
+TRANS(FRECPS_s, do_fp3_scalar_ah, a, &f_scalar_frecps, a->rn)
 
 static const FPScalar f_scalar_frsqrts = {
     gen_helper_rsqrtsf_f16,
     gen_helper_rsqrtsf_f32,
     gen_helper_rsqrtsf_f64,
 };
-TRANS(FRSQRTS_s, do_fp3_scalar_ah, a, &f_scalar_frsqrts)
+TRANS(FRSQRTS_s, do_fp3_scalar_ah, a, &f_scalar_frsqrts, a->rn)
 
 static bool do_fcmp0_s(DisasContext *s, arg_rr_e *a,
                        const FPScalar *f, bool swap)
-- 
2.34.1

