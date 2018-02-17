Received: by 10.28.71.27 with SMTP id u27csp2087249wma;
        Sat, 17 Feb 2018 10:48:30 -0800 (PST)
X-Google-Smtp-Source: AH8x224+5Yj4sZfuW2ecj5B+ETNR35FnU4PV2PF+w8uWzqBouudMPHZQkUQtQMbOw6GJnjGJLTDc
X-Received: by 10.37.49.6 with SMTP id x6mr2520150ybx.446.1518893309976;
        Sat, 17 Feb 2018 10:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893309; cv=none;
        d=google.com; s=arc-20160816;
        b=y23t4A4T4jUq5kL0Cnh1N+0tHvkX7mJ3UJE9XTCfMVkiA6BxFVStlPMB6nNaZYqEpR
         zrn0FUzZacnxcMmGoeooKrVsPz5pogUCelBL9xrClQa/uh8AZfjddJF998kGrJT1TLgF
         sJnKwSuyq2xgggkGXiW4oMx2HAQPRrkC/jK8PSqm9HPhOVKjqjKsoFyKymU5E2JwVIWG
         fgmXnVMbEp9WScFXOzbiW3Zcl2xnLvp6vdGmtdnMVBJj3DRAwhNmZRhbvty3dK/HFV4N
         uLDVTLXzz/731xTbUOHuLVGR4tHy9zQLZfW6YPS9wG3sK5ekkryTPfArAa9+AX50L4P4
         BSrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=8ZPV9VHMlufqnzfBjaH561O57HKOPZlRQxm41Pp/2u4=;
        b=URqT3nTW7gAA0pEBUrlw8IO3y1DIqA+lC3ejQyUZGgpf/Oi6JPf7Yw7uqM5Co3x7LW
         /j6GtbSMTNS+5HHpuQB+K2srVWxTgxhUcIA8gt0G4L5gfugD3eHEo39ctRTsZklT0BYT
         BYnC8GwCS8j0/nqrCjPnYgye7e296j3p3+0iq7ozcJxIturn+dcjcv3ulV3WefAf4yg9
         sBe5iFEafKXi1emua3Z1CmLiWgDjQX1wG/7QtPiAg4Y4rEiZdNvNO3SDkpUDpaiBRDvh
         LdkBw2uD0LYe9UpJ1bG0v+qsZ0C1R+EBH8RaDPoJm9EATWD5DxyHJzscYbl1ZisgTlla
         3adA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YsP6ikEi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x82si757556ywa.689.2018.02.17.10.48.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:48:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YsP6ikEi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48257 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7XB-00041M-9v
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:48:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79k-0000sm-6C
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79i-0001pv-A6
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:16 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:36599)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79i-0001pj-1U
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:14 -0500
Received: by mail-pf0-x244.google.com with SMTP id p5so484167pff.3
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8ZPV9VHMlufqnzfBjaH561O57HKOPZlRQxm41Pp/2u4=;
	b=YsP6ikEiSp9Batn91eU/Rl+M+SJ/N9BzD+8oWcykyx2ZJE9/F1T/GFEl83APQ5+qOj
	gt2S/r7NOtbmCKF6LzwtkwGEaC046JHhosydXCvqNpYFq03G8cq6TBlgnr6iPRPufh7S
	HyBXWvCu3wyqngPFLby+5f3in/+Ga9vp80+OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8ZPV9VHMlufqnzfBjaH561O57HKOPZlRQxm41Pp/2u4=;
	b=MivUhrSqgyQ7WdF7N+MnJauJnKtT/XR1G4709VwhpRR5775Vvs11ko3mFbxfOTUPdb
	UjQHgp4gKumda10DokGILir33Li9ElWYvkafQ0j7k2fWsR8cn6suoAYgC11s+LsPXgbf
	hdxIcQeAR26m4zYOsGlhgyRs2e4VRqpFrFrbliRLw0xDgkwLbNG3Op+CAjtsv7NW+8EO
	DK+xCtqAA1mmv4IgZc8V671X2m93KKw5DFyUZmXbomBMOZ76wDMSVwVR023FIzG/+4Va
	Rc/fUXfzMb0KaHJu0+XVPRhAyaebAHBjpriXVTccoeh1It3Sr1iZyhUP2ctY0fMmpCBX
	TH3g==
X-Gm-Message-State: APf1xPBDjpAkkISO+nlHmISEzNBmGEZLZxBKhr/Cu8xBvUoYhQaebc/b
	x+R1MR6ArRpTtwuPRnfQLI4nStP04tY=
X-Received: by 10.99.146.3 with SMTP id o3mr8290580pgd.309.1518891853101;
	Sat, 17 Feb 2018 10:24:13 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:45 -0800
Message-Id: <20180217182323.25885-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v2 29/67] target/arm: Implement SVE Permute -
 Interleaving Group
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5BBjAQ0DIreH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 15 ++++++++++
 target/arm/sve_helper.c    | 72 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 69 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 10 +++++++
 4 files changed, 166 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ff958fcebd..bab20345c6 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -445,6 +445,21 @@ DEF_HELPER_FLAGS_4(sve_trn_p, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_rev_p, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 DEF_HELPER_FLAGS_3(sve_punpk_p, TCG_CALL_NO_RWG, void, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_zip_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_zip_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_zip_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_zip_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_uzp_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_uzp_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_uzp_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_uzp_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_trn_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_trn_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_trn_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_trn_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index c3a2706a16..62982bd099 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -1944,3 +1944,75 @@ void HELPER(sve_punpk_p)(void *vd, void *vn, uint32_t pred_desc)
         }
     }
 }
+
+#define DO_ZIP(NAME, TYPE, H) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)       \
+{                                                                    \
+    intptr_t oprsz = simd_oprsz(desc);                               \
+    intptr_t i, oprsz_2 = oprsz / 2;                                 \
+    ARMVectorReg tmp_n, tmp_m;                                       \
+    /* We produce output faster than we consume input.               \
+       Therefore we must be mindful of possible overlap.  */         \
+    if (unlikely((vn - vd) < (uintptr_t)oprsz)) {                    \
+        vn = memcpy(&tmp_n, vn, oprsz_2);                            \
+    }                                                                \
+    if (unlikely((vm - vd) < (uintptr_t)oprsz)) {                    \
+        vm = memcpy(&tmp_m, vm, oprsz_2);                            \
+    }                                                                \
+    for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                    \
+        *(TYPE *)(vd + H(2 * i + 0)) = *(TYPE *)(vn + H(i));         \
+        *(TYPE *)(vd + H(2 * i + sizeof(TYPE))) = *(TYPE *)(vm + H(i)); \
+    }                                                                \
+}
+
+DO_ZIP(sve_zip_b, uint8_t, H1)
+DO_ZIP(sve_zip_h, uint16_t, H1_2)
+DO_ZIP(sve_zip_s, uint32_t, H1_4)
+DO_ZIP(sve_zip_d, uint64_t, )
+
+#define DO_UZP(NAME, TYPE, H) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)         \
+{                                                                      \
+    intptr_t oprsz = simd_oprsz(desc);                                 \
+    intptr_t oprsz_2 = oprsz / 2;                                      \
+    intptr_t odd_ofs = simd_data(desc);                                \
+    intptr_t i;                                                        \
+    ARMVectorReg tmp_m;                                                \
+    if (unlikely((vm - vd) < (uintptr_t)oprsz)) {                      \
+        vm = memcpy(&tmp_m, vm, oprsz);                                \
+    }                                                                  \
+    for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                      \
+        *(TYPE *)(vd + H(i)) = *(TYPE *)(vn + H(2 * i + odd_ofs));     \
+    }                                                                  \
+    for (i = 0; i < oprsz_2; i += sizeof(TYPE)) {                      \
+        *(TYPE *)(vd + H(oprsz_2 + i)) = *(TYPE *)(vm + H(2 * i + odd_ofs)); \
+    }                                                                  \
+}
+
+DO_UZP(sve_uzp_b, uint8_t, H1)
+DO_UZP(sve_uzp_h, uint16_t, H1_2)
+DO_UZP(sve_uzp_s, uint32_t, H1_4)
+DO_UZP(sve_uzp_d, uint64_t, )
+
+#define DO_TRN(NAME, TYPE, H) \
+void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)         \
+{                                                                      \
+    intptr_t oprsz = simd_oprsz(desc);                                 \
+    intptr_t odd_ofs = simd_data(desc);                                \
+    intptr_t i;                                                        \
+    for (i = 0; i < oprsz; i += 2 * sizeof(TYPE)) {                    \
+        TYPE ae = *(TYPE *)(vn + H(i + odd_ofs));                      \
+        TYPE be = *(TYPE *)(vm + H(i + odd_ofs));                      \
+        *(TYPE *)(vd + H(i + 0)) = ae;                                 \
+        *(TYPE *)(vd + H(i + sizeof(TYPE))) = be;                      \
+    }                                                                  \
+}
+
+DO_TRN(sve_trn_b, uint8_t, H1)
+DO_TRN(sve_trn_h, uint16_t, H1_2)
+DO_TRN(sve_trn_s, uint32_t, H1_4)
+DO_TRN(sve_trn_d, uint64_t, )
+
+#undef DO_ZIP
+#undef DO_UZP
+#undef DO_TRN
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 45e1ea87bf..09ac955a36 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2042,6 +2042,75 @@ static void trans_PUNPKHI(DisasContext *s, arg_PUNPKHI *a, uint32_t insn)
     do_perm_pred2(s, a, 1, gen_helper_sve_punpk_p);
 }
 
+/*
+ *** SVE Permute - Interleaving Group
+ */
+
+static void do_zip(DisasContext *s, arg_rrr_esz *a, bool high)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve_zip_b, gen_helper_sve_zip_h,
+        gen_helper_sve_zip_s, gen_helper_sve_zip_d,
+    };
+    unsigned vsz = vec_full_reg_size(s);
+    unsigned high_ofs = high ? vsz / 2 : 0;
+
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn) + high_ofs,
+                       vec_full_reg_offset(s, a->rm) + high_ofs,
+                       vsz, vsz, 0, fns[a->esz]);
+}
+
+static void do_zzz_data_ool(DisasContext *s, arg_rrr_esz *a, int data,
+                            gen_helper_gvec_3 *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       vec_full_reg_offset(s, a->rm),
+                       vsz, vsz, data, fn);
+}
+
+static void trans_ZIP1_z(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zip(s, a, false);
+}
+
+static void trans_ZIP2_z(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zip(s, a, true);
+}
+
+static gen_helper_gvec_3 * const uzp_fns[4] = {
+    gen_helper_sve_uzp_b, gen_helper_sve_uzp_h,
+    gen_helper_sve_uzp_s, gen_helper_sve_uzp_d,
+};
+
+static void trans_UZP1_z(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zzz_data_ool(s, a, 0, uzp_fns[a->esz]);
+}
+
+static void trans_UZP2_z(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zzz_data_ool(s, a, 1 << a->esz, uzp_fns[a->esz]);
+}
+
+static gen_helper_gvec_3 * const trn_fns[4] = {
+    gen_helper_sve_trn_b, gen_helper_sve_trn_h,
+    gen_helper_sve_trn_s, gen_helper_sve_trn_d,
+};
+
+static void trans_TRN1_z(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zzz_data_ool(s, a, 0, trn_fns[a->esz]);
+}
+
+static void trans_TRN2_z(DisasContext *s, arg_rrr_esz *a, uint32_t insn)
+{
+    do_zzz_data_ool(s, a, 1 << a->esz, trn_fns[a->esz]);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index bcbe84c3a6..2efa3773fc 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -415,6 +415,16 @@ REV_p		00000101 .. 11 0100 010 000 0 .... 0 ....	@pd_pn
 PUNPKLO		00000101 00 11 0000 010 000 0 .... 0 ....	@pd_pn_e0
 PUNPKHI		00000101 00 11 0001 010 000 0 .... 0 ....	@pd_pn_e0
 
+### SVE Permute - Interleaving Group
+
+# SVE permute vector elements
+ZIP1_z		00000101 .. 1 ..... 011 000 ..... .....		@rd_rn_rm
+ZIP2_z		00000101 .. 1 ..... 011 001 ..... .....		@rd_rn_rm
+UZP1_z		00000101 .. 1 ..... 011 010 ..... .....		@rd_rn_rm
+UZP2_z		00000101 .. 1 ..... 011 011 ..... .....		@rd_rn_rm
+TRN1_z		00000101 .. 1 ..... 011 100 ..... .....		@rd_rn_rm
+TRN2_z		00000101 .. 1 ..... 011 101 ..... .....		@rd_rn_rm
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

