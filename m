Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1275295lfm;
        Wed, 17 Jun 2020 21:54:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBLmBI5SB7OkmGNSdLV22iAZG0F6A0PWZAs+EEjwry+oAZa+vdBJNPxloy3tBMvlSBFWtb
X-Received: by 2002:a25:f509:: with SMTP id a9mr3739034ybe.227.1592456068984;
        Wed, 17 Jun 2020 21:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456068; cv=none;
        d=google.com; s=arc-20160816;
        b=ZZ/G+qn+HcAoo7r2sLSgfTD5PFBvrZBA8l8gEO6sgIcg1vFLCE0tFJHINADmAb0Rp3
         YP1jHmzh7WEm9ZQAVZhryG5S2ycLiLX34N7A370DOpnBf9YsXMSlgZwhCVH6giQO/lTr
         CmCGuz2LByH90GtI/9QsPZnntz7MwkTNygZJUM1Sj4sB4GnPPWk+HQ56xDgqr+GkZ6j7
         5AEEETCPR0SVuvsW8JACasGPNmW56xPA5Yb/6s3JvPPbMrDKNjwIrVnXkKzAMpFYIGv3
         QW+4NqQjZw7J3mDxNE0JSeHX4otStcmQyQ7Yctiwvem1qDdVVoa/uZGrhUB5nyGExAdc
         +91Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hCW4/GyvyqwT7A7EbFX1G7JyVwhdeQp5hc2q/+l+LFg=;
        b=S2op+MDSYuP9G0oi94QVvt9bAmIzLRiit+qwL2I3addIKYZNF17LA8XH5Lt5hE5NJn
         4RZkzUuBNdJcsniInypXmTfbNAXYJrC4pUrvIYq0XZZcnzJfiml3wy3z5D73csypEbF0
         ZAiJn/Eny7ls7rxPAX9EP6/SM7SBmyDir5ofUyMkypzbapgGoqtiXbg0veXiq+ct7YFD
         8brJ83rZWNMo2Jn92uRCEGCM7JTJlTweUGh+cwU5/D+bRSMddL/sV2fHTYaRV2JcMu7u
         CubppRmq2e/N+R1RqD+s37mheH4l2Lz9mXrREsMu+pWet21R3c5XfaYRcBVX5VjvCBRO
         FObw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kH3rPjqs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22si1470731ybf.201.2020.06.17.21.54.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 21:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kH3rPjqs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmZI-0007M0-Ab
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 00:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCJ-0002H0-J7
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:30:43 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:39027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmCH-0003Ad-9N
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:30:43 -0400
Received: by mail-pg1-x542.google.com with SMTP id v11so2334532pgb.6
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hCW4/GyvyqwT7A7EbFX1G7JyVwhdeQp5hc2q/+l+LFg=;
 b=kH3rPjqsKLFf67nuEDWxWCUBTGWWEuf9szo8VJL9vS4OupcdCGCqzZPP34J5d/aquU
 uR5VifBhjYGp2urs9pdSyJtmnfmYW4etsDbNCnF4602larXAVtyvmmsmnz/lgs6BHVp6
 xnGaLH5wObE4CnCiq55Kc9HnqaSk6bMG6yWWfZfdWEH47se/uIyIgnTIG7vmscCkvlov
 3zLN1VAs16OqwUHXNYWun5QJBGPLnBexC8+xarbaLOFtr6ryq1cy9+H056P9FRYJDPTM
 1kvIiu8JgD1bOebnHpqQcA0Twk5ncYK7YVtedHkeuB1kH1zLnKrRwPPDrZm6XdtFKS7d
 5/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hCW4/GyvyqwT7A7EbFX1G7JyVwhdeQp5hc2q/+l+LFg=;
 b=ELNbmyaflbpJXFpAYBVatRdXNTTjnN7IYeO0NHKg74jzScdqmVQN1mqQwWGGgBaYM6
 5zwEBNRz2ZGnqxwWer9TmtYqinHaOBsXdF41GyG4S/afOb59jX2Wf6chV0qOi+77iBGf
 wWj9N55fupKJEqay9pPmosfxsV1b0T+Szdo4mRsf6wTUi3ToQ5+G5LPzGv3Y7rMWYeDy
 WbuioVxd9aiAm3InVG0JXG1tPa+nM3fOU+EQwdj96RqxUfbmUPhIlQBzQX0gB4hsExxW
 f8iEBF2bPPmF7vuWevH1HFeKNOLH6RDH4o4nnK4gHyKisrAtE/IUHCu9vM4ep8n8xP3x
 6ARw==
X-Gm-Message-State: AOAM5310PzOHakzI3Pa8xYyUMMl1WCGdJihkKOus8v5Co3Ig3XfkQWna
 ay9WUNYxIOVbf0WkLESJr5YsYA==
X-Received: by 2002:aa7:9818:: with SMTP id e24mr2042592pfl.30.1592454639990; 
 Wed, 17 Jun 2020 21:30:39 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id i191sm1298861pfe.99.2020.06.17.21.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:30:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 059/100] target/arm: Implement SVE2 XAR
Date: Wed, 17 Jun 2020 21:26:03 -0700
Message-Id: <20200618042644.1685561-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eh2gKr5tscpn

In addition, use the same vector generator interface for AdvSIMD.
This fixes a bug in which the AdvSIMD insn failed to clear the
high bits of the SVE register.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |   4 ++
 target/arm/helper.h        |   2 +
 target/arm/translate-a64.h |   3 ++
 target/arm/sve.decode      |   4 ++
 target/arm/sve_helper.c    |  39 ++++++++++++++
 target/arm/translate-a64.c |  25 ++-------
 target/arm/translate-sve.c | 104 +++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    |  12 +++++
 8 files changed, 172 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 1d5d272c5c..9f6095c884 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2070,6 +2070,10 @@ DEF_HELPER_FLAGS_5(sve2_histcnt_d, TCG_CALL_NO_RWG,
 
 DEF_HELPER_FLAGS_4(sve2_histseg, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve2_xar_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_xar_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve2_xar_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_6(sve2_faddp_zpzz_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/helper.h b/target/arm/helper.h
index 643fc3a017..7a29194052 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -783,6 +783,8 @@ DEF_HELPER_FLAGS_4(gvec_uaba_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_uaba_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(gvec_uaba_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(gvec_xar_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 #ifdef TARGET_AARCH64
 #include "helper-a64.h"
 #include "helper-sve.h"
diff --git a/target/arm/translate-a64.h b/target/arm/translate-a64.h
index da0f59a2ce..e54e297c90 100644
--- a/target/arm/translate-a64.h
+++ b/target/arm/translate-a64.h
@@ -117,5 +117,8 @@ bool disas_sve(DisasContext *, uint32_t);
 
 void gen_gvec_rax1(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
                    uint32_t rm_ofs, uint32_t opr_sz, uint32_t max_sz);
+void gen_gvec_xar(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t rm_ofs, int64_t shift,
+                  uint32_t opr_sz, uint32_t max_sz);
 
 #endif /* TARGET_ARM_TRANSLATE_A64_H */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0edb72d4fb..a375ce31f1 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -65,6 +65,7 @@
 &rr_dbm         rd rn dbm
 &rrri           rd rn rm imm
 &rri_esz        rd rn imm esz
+&rrri_esz       rd rn rm imm esz
 &rrr_esz        rd rn rm esz
 &rpr_esz        rd pg rn esz
 &rpr_s          rd pg rn s
@@ -384,6 +385,9 @@ ORR_zzz         00000100 01 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 EOR_zzz         00000100 10 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 BIC_zzz         00000100 11 1 ..... 001 100 ..... .....         @rd_rn_rm_e0
 
+XAR             00000100 .. 1 ..... 001 101 rm:5  rd:5   &rrri_esz \
+                rn=%reg_movprfx esz=%tszimm16_esz imm=%tszimm16_shr
+
 # SVE2 bitwise ternary operations
 EOR3            00000100 00 1 ..... 001 110 ..... .....         @rdn_ra_rm_e0
 BSL             00000100 00 1 ..... 001 111 ..... .....         @rdn_ra_rm_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index bc1c3ce1f0..a6c5ff8f79 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6784,3 +6784,42 @@ void HELPER(sve2_histseg)(void *vd, void *vn, void *vm, uint32_t desc)
         *(uint64_t *)(vd + i + 8) = out1;
     }
 }
+
+void HELPER(sve2_xar_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    int shr = simd_data(desc);
+    int shl = 8 - shr;
+    uint64_t mask = dup_const(MO_8, 0xff >> shr);
+    uint64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        uint64_t t = n[i] ^ m[i];
+        d[i] = ((t >> shr) & mask) | ((t << shl) & ~mask);
+    }
+}
+
+void HELPER(sve2_xar_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    int shr = simd_data(desc);
+    int shl = 16 - shr;
+    uint64_t mask = dup_const(MO_16, 0xffff >> shr);
+    uint64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        uint64_t t = n[i] ^ m[i];
+        d[i] = ((t >> shr) & mask) | ((t << shl) & ~mask);
+    }
+}
+
+void HELPER(sve2_xar_s)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 4;
+    int shr = simd_data(desc);
+    uint32_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ror32(n[i] ^ m[i], shr);
+    }
+}
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b80ee9f734..4f5c433b47 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13829,8 +13829,6 @@ static void disas_crypto_xar(DisasContext *s, uint32_t insn)
     int imm6 = extract32(insn, 10, 6);
     int rn = extract32(insn, 5, 5);
     int rd = extract32(insn, 0, 5);
-    TCGv_i64 tcg_op1, tcg_op2, tcg_res[2];
-    int pass;
 
     if (!dc_isar_feature(aa64_sha3, s)) {
         unallocated_encoding(s);
@@ -13841,25 +13839,10 @@ static void disas_crypto_xar(DisasContext *s, uint32_t insn)
         return;
     }
 
-    tcg_op1 = tcg_temp_new_i64();
-    tcg_op2 = tcg_temp_new_i64();
-    tcg_res[0] = tcg_temp_new_i64();
-    tcg_res[1] = tcg_temp_new_i64();
-
-    for (pass = 0; pass < 2; pass++) {
-        read_vec_element(s, tcg_op1, rn, pass, MO_64);
-        read_vec_element(s, tcg_op2, rm, pass, MO_64);
-
-        tcg_gen_xor_i64(tcg_res[pass], tcg_op1, tcg_op2);
-        tcg_gen_rotri_i64(tcg_res[pass], tcg_res[pass], imm6);
-    }
-    write_vec_element(s, tcg_res[0], rd, 0, MO_64);
-    write_vec_element(s, tcg_res[1], rd, 1, MO_64);
-
-    tcg_temp_free_i64(tcg_op1);
-    tcg_temp_free_i64(tcg_op2);
-    tcg_temp_free_i64(tcg_res[0]);
-    tcg_temp_free_i64(tcg_res[1]);
+    gen_gvec_xar(MO_64, vec_full_reg_offset(s, rd),
+                 vec_full_reg_offset(s, rn),
+                 vec_full_reg_offset(s, rm), imm6, 16,
+                 vec_full_reg_size(s));
 }
 
 /* Crypto three-reg imm2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 559250e0d6..640b109166 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -340,6 +340,110 @@ static bool trans_BIC_zzz(DisasContext *s, arg_rrr_esz *a)
     return do_zzz_fn(s, a, tcg_gen_gvec_andc);
 }
 
+static void gen_xar8_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+    uint64_t mask = dup_const(MO_8, 0xff >> sh);
+
+    tcg_gen_xor_i64(t, n, m);
+    tcg_gen_shri_i64(d, t, sh);
+    tcg_gen_shli_i64(t, t, 8 - sh);
+    tcg_gen_andi_i64(d, d, mask);
+    tcg_gen_andi_i64(t, t, ~mask);
+    tcg_gen_or_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_xar16_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
+{
+    TCGv_i64 t = tcg_temp_new_i64();
+    uint64_t mask = dup_const(MO_16, 0xffff >> sh);
+
+    tcg_gen_xor_i64(t, n, m);
+    tcg_gen_shri_i64(d, t, sh);
+    tcg_gen_shli_i64(t, t, 16 - sh);
+    tcg_gen_andi_i64(d, d, mask);
+    tcg_gen_andi_i64(t, t, ~mask);
+    tcg_gen_or_i64(d, d, t);
+    tcg_temp_free_i64(t);
+}
+
+static void gen_xar_i32(TCGv_i32 d, TCGv_i32 n, TCGv_i32 m, int32_t sh)
+{
+    tcg_gen_xor_i32(d, n, m);
+    tcg_gen_rotri_i32(d, d, sh);
+}
+
+static void gen_xar_i64(TCGv_i64 d, TCGv_i64 n, TCGv_i64 m, int64_t sh)
+{
+    tcg_gen_xor_i64(d, n, m);
+    tcg_gen_rotri_i64(d, d, sh);
+}
+
+static void gen_xar_vec(unsigned vece, TCGv_vec d, TCGv_vec n,
+                        TCGv_vec m, int64_t sh)
+{
+    tcg_gen_xor_vec(vece, d, n, m);
+    tcg_gen_rotri_vec(vece, d, d, sh);
+}
+
+void gen_gvec_xar(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
+                  uint32_t rm_ofs, int64_t shift,
+                  uint32_t opr_sz, uint32_t max_sz)
+{
+    static const TCGOpcode vecop[] = { INDEX_op_rotli_vec, 0 };
+    static const GVecGen3i ops[4] = {
+        { .fni8 = gen_xar8_i64,
+          .fniv = gen_xar_vec,
+          .fno = gen_helper_sve2_xar_b,
+          .opt_opc = vecop,
+          .vece = MO_8 },
+        { .fni8 = gen_xar16_i64,
+          .fniv = gen_xar_vec,
+          .fno = gen_helper_sve2_xar_h,
+          .opt_opc = vecop,
+          .vece = MO_16 },
+        { .fni4 = gen_xar_i32,
+          .fniv = gen_xar_vec,
+          .fno = gen_helper_sve2_xar_s,
+          .opt_opc = vecop,
+          .vece = MO_32 },
+        { .fni8 = gen_xar_i64,
+          .fniv = gen_xar_vec,
+          .fno = gen_helper_gvec_xar_d,
+          .opt_opc = vecop,
+          .vece = MO_64 }
+    };
+    int esize = 8 << vece;
+
+    /* The SVE2 range is 1 .. esize; the AdvSIMD range is 0 .. esize-1. */
+    tcg_debug_assert(shift >= 0);
+    tcg_debug_assert(shift <= esize);
+    shift &= esize - 1;
+
+    if (shift == 0) {
+        /* xar with no rotate devolves to xor. */
+        tcg_gen_gvec_xor(vece, rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz);
+    } else {
+        tcg_gen_gvec_3i(rd_ofs, rn_ofs, rm_ofs, opr_sz, max_sz,
+                        shift, &ops[vece]);
+    }
+}
+
+static bool trans_XAR(DisasContext *s, arg_rrri_esz *a)
+{
+    if (a->esz < 0 || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        gen_gvec_xar(a->esz, vec_full_reg_offset(s, a->rd),
+                     vec_full_reg_offset(s, a->rn),
+                     vec_full_reg_offset(s, a->rm), a->imm, vsz, vsz);
+    }
+    return true;
+}
+
 static bool do_sve2_zzzz_fn(DisasContext *s, arg_rrrr_esz *a, GVecGen4Fn *fn)
 {
     if (!dc_isar_feature(aa64_sve2, s)) {
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index f016aa7978..3b38cdafb0 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -1698,3 +1698,15 @@ void HELPER(gvec_umulh_d)(void *vd, void *vn, void *vm, uint32_t desc)
     }
     clear_tail(d, opr_sz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_xar_d)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;
+    int shr = simd_data(desc);
+    uint64_t *d = vd, *n = vn, *m = vm;
+
+    for (i = 0; i < opr_sz; ++i) {
+        d[i] = ror64(n[i] ^ m[i], shr);
+    }
+    clear_tail(d, opr_sz * 8, simd_maxsz(desc));
+}
-- 
2.25.1

