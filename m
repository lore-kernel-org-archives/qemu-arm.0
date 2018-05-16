Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp204593wme;
        Wed, 16 May 2018 15:35:47 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZo8w81OyYz+miO3+H6CuDcrcMsUrady/xVek/Mo/yr/nXO6tnw1AXJjVY6Z6Z6LUKdErqcj
X-Received: by 2002:ae9:f442:: with SMTP id z2-v6mr2843186qkl.335.1526510147787;
        Wed, 16 May 2018 15:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510147; cv=none;
        d=google.com; s=arc-20160816;
        b=YVV87Jue4zAd3Ze5zcDQTlvdn9vunk3FRGjmHBpenl91KHHNdgglflEprhptCfYm4g
         Tt92M5NMt7CufFXBNmZAV48kT0BcCGJ+7SXsrOBQqwnphMjDnezilpcCRn73qahiprKk
         2//5cCJbX6GDqC65WvKKhSkGpVZ/fYBA9dtLbUeAvjK0bYhTxh1BhlEIErdOcOiWSAyE
         rW/5moxjmKYrlY5P7tqpkPmKRO+sz8mJPEwiYMIDg+DLO/SRyeRW6olG1X9yVqqd8itJ
         OG6eKR7Q4RecsBbC2eusH2CQ23v/TWoFTYP2Tz/DKlsxLsX3Qq2xgljBMfYMI6PE1jsd
         Nu9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=glh4d2APpezpBz9IDQVX/72okeWJ0gX7vbbiOtLdZLo=;
        b=DG/frtbSEb+KNFQkrTeXNF9VQQMiNeuqlGV7BwcVr0oDIu4LTnVTYRv6W5a/3p2d+e
         LcykVKyzOqRtsAh/MGDO5DgVST3zcIeKhm7+EJQ1gGhCkFPfPIMoRzQ430/kCgOX2oqT
         jNzeaySx0I2mQr70yk96h8euVGnUXBemcszR3vh+uPZ0lsljizccNWd2VJ2W8RY/+X66
         8MDFkjhrH7gimuNMF6I9GN5y7Eevp/XU1PrJk2N2uSzhF3spJtMoJnKf86hE5dP8w2li
         4t3BKGGg927lNQ2Cd1Z9FTpBIDhbu2EAIFZIZn1X5CV+rfIko+u3lwqRNoNrfkJBGuqs
         cnUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ANyc3pcM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d128-v6si3536708qkf.395.2018.05.16.15.35.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:35:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ANyc3pcM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ51P-0002qx-7g
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:35:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wL-0007k8-Or
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wJ-0007Ve-L3
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:33 -0400
Received: from mail-pg0-x22c.google.com ([2607:f8b0:400e:c05::22c]:38366)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wJ-0007VB-7E
	for qemu-devel@nongnu.org; Wed, 16 May 2018 18:30:31 -0400
Received: by mail-pg0-x22c.google.com with SMTP id n9-v6so896149pgq.5
	for <qemu-devel@nongnu.org>; Wed, 16 May 2018 15:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=glh4d2APpezpBz9IDQVX/72okeWJ0gX7vbbiOtLdZLo=;
	b=ANyc3pcMNgnYLkrq186VhCWZzIigPEmhgTgTyN7yrevaL2tHv1OUfMRlxW0qEk/NB0
	O6V4Qgwyt6p5RMrNSWliNWtjmKdNUw5zIcdLyAQrLRE7rzSJhVhtbwDsEzRYayRvzraz
	bnihbD/M8bbL5gKsXkexLflSlcbzIWvhK0/q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=glh4d2APpezpBz9IDQVX/72okeWJ0gX7vbbiOtLdZLo=;
	b=aKtwf/CCw4Zd8wyXKlqqXT+mGPINj1uLzfVjTJTuw8QI/p0+2Z6fyTbdWT7KesauGS
	H3vVMf/5sKQl6Ep3nvMRfhmu9p0CzwdNZm3I52rXVdwaPg7dVoUVyIK+1kN1EImivdFI
	KLLUkFg2RcK6zePdl4gVZWpkgjLC3bN4gGF3E+goZ1kgQ8dmsL3vMIUYeSZkAzLqRwPN
	K3Q4/Dx6AXM7lEe7wmkrV5Szby9FwzwPxbZOQthW+fQV+KpXc2dkhwp/M8V2DKfUDciP
	Bqy8Gqm0CWm5BwnhkhWaTmmWeF3jFvLn1BYf7A5TWkg/jCez1OzyN7Mc0ttLxMwIvx8p
	eKyA==
X-Gm-Message-State: ALKqPwdP9UPp4wwdxs88kYACjEqMtEeX0DSIzW/+q8E8fGgi5pb3XqrJ
	uHIToidmgj0UYbaBfQthCUYOutlMB2s=
X-Received: by 2002:a62:d044:: with SMTP id
	p65-v6mr2808230pfg.64.1526509829814; 
	Wed, 16 May 2018 15:30:29 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:54 -0700
Message-Id: <20180516223007.10256-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::22c
Subject: [Qemu-devel] [PATCH v3-a 14/27] target/arm: Implement SVE Integer
 Multiply-Add Group
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6NO+Y+SyhMw8

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 18 ++++++++++++
 target/arm/sve_helper.c    | 57 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 34 +++++++++++++++++++++++
 target/arm/sve.decode      | 17 ++++++++++++
 4 files changed, 126 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 11644125d1..b31d497f31 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -345,6 +345,24 @@ DEF_HELPER_FLAGS_4(sve_neg_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_neg_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_neg_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_6(sve_mla_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_mla_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_mla_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_mla_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_6(sve_mls_b, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_mls_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_mls_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_6(sve_mls_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 236d21e771..56a4eb71d5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -935,3 +935,60 @@ DO_ZPZI_D(sve_asrd_d, int64_t, DO_ASRD)
 #undef DO_ASRD
 #undef DO_ZPZI
 #undef DO_ZPZI_D
+
+/* Fully general four-operand expander, controlled by a predicate.
+ */
+#define DO_ZPZZZ(NAME, TYPE, H, OP)                           \
+void HELPER(NAME)(void *vd, void *va, void *vn, void *vm,     \
+                  void *vg, uint32_t desc)                    \
+{                                                             \
+    intptr_t i, opr_sz = simd_oprsz(desc);                    \
+    for (i = 0; i < opr_sz; ) {                               \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));       \
+        do {                                                  \
+            if (pg & 1) {                                     \
+                TYPE nn = *(TYPE *)(vn + H(i));               \
+                TYPE mm = *(TYPE *)(vm + H(i));               \
+                TYPE aa = *(TYPE *)(va + H(i));               \
+                *(TYPE *)(vd + H(i)) = OP(aa, nn, mm);        \
+            }                                                 \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);           \
+        } while (i & 15);                                     \
+    }                                                         \
+}
+
+/* Similarly, specialized for 64-bit operands.  */
+#define DO_ZPZZZ_D(NAME, TYPE, OP)                            \
+void HELPER(NAME)(void *vd, void *va, void *vn, void *vm,     \
+                  void *vg, uint32_t desc)                    \
+{                                                             \
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;                \
+    TYPE *d = vd, *a = va, *n = vn, *m = vm;                  \
+    uint8_t *pg = vg;                                         \
+    for (i = 0; i < opr_sz; i += 1) {                         \
+        if (pg[H1(i)] & 1) {                                  \
+            TYPE aa = a[i], nn = n[i], mm = m[i];             \
+            d[i] = OP(aa, nn, mm);                            \
+        }                                                     \
+    }                                                         \
+}
+
+#define DO_MLA(A, N, M)  (A + N * M)
+#define DO_MLS(A, N, M)  (A - N * M)
+
+DO_ZPZZZ(sve_mla_b, uint8_t, H1, DO_MLA)
+DO_ZPZZZ(sve_mls_b, uint8_t, H1, DO_MLS)
+
+DO_ZPZZZ(sve_mla_h, uint16_t, H1_2, DO_MLA)
+DO_ZPZZZ(sve_mls_h, uint16_t, H1_2, DO_MLS)
+
+DO_ZPZZZ(sve_mla_s, uint32_t, H1_4, DO_MLA)
+DO_ZPZZZ(sve_mls_s, uint32_t, H1_4, DO_MLS)
+
+DO_ZPZZZ_D(sve_mla_d, uint64_t, DO_MLA)
+DO_ZPZZZ_D(sve_mls_d, uint64_t, DO_MLS)
+
+#undef DO_MLA
+#undef DO_MLS
+#undef DO_ZPZZZ
+#undef DO_ZPZZZ_D
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 52f1b4dbf5..f14bb2196a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -634,6 +634,40 @@ DO_ZPZW(LSL, lsl)
 
 #undef DO_ZPZW
 
+/*
+ *** SVE Integer Multiply-Add Group
+ */
+
+static bool do_zpzzz_ool(DisasContext *s, arg_rprrr_esz *a,
+                         gen_helper_gvec_5 *fn)
+{
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_5_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->ra),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           pred_full_reg_offset(s, a->pg),
+                           vsz, vsz, 0, fn);
+    }
+    return true;
+}
+
+#define DO_ZPZZZ(NAME, name) \
+static bool trans_##NAME(DisasContext *s, arg_rprrr_esz *a, uint32_t insn) \
+{                                                                    \
+    static gen_helper_gvec_5 * const fns[4] = {                      \
+        gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,        \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,        \
+    };                                                               \
+    return do_zpzzz_ool(s, a, fns[a->esz]);                          \
+}
+
+DO_ZPZZZ(MLA, mla)
+DO_ZPZZZ(MLS, mls)
+
+#undef DO_ZPZZZ
+
 /*
  *** SVE Predicate Logical Operations Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 0ddc1e96be..5e4335b2ae 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -47,6 +47,7 @@
 &rpr_esz        rd pg rn esz
 &rprr_s         rd pg rn rm s
 &rprr_esz       rd pg rn rm esz
+&rprrr_esz      rd pg rn rm ra esz
 &rpri_esz       rd pg rn imm esz
 
 ###########################################################################
@@ -71,6 +72,12 @@
 @rdm_pg_rn      ........ esz:2 ... ... ... pg:3 rn:5 rd:5 \
                 &rprr_esz rm=%reg_movprfx
 
+# Three register operand, with governing predicate, vector element size
+@rda_pg_rn_rm   ........ esz:2 . rm:5  ... pg:3 rn:5 rd:5 \
+                &rprrr_esz ra=%reg_movprfx
+@rdn_pg_ra_rm   ........ esz:2 . rm:5  ... pg:3 ra:5 rd:5 \
+                &rprrr_esz rn=%reg_movprfx
+
 # One register operand, with governing predicate, vector element size
 @rd_pg_rn       ........ esz:2 ... ... ... pg:3 rn:5 rd:5       &rpr_esz
 
@@ -186,6 +193,16 @@ UXTH            00000100 .. 010 011 101 ... ..... .....         @rd_pg_rn
 SXTW            00000100 .. 010 100 101 ... ..... .....         @rd_pg_rn
 UXTW            00000100 .. 010 101 101 ... ..... .....         @rd_pg_rn
 
+### SVE Integer Multiply-Add Group
+
+# SVE integer multiply-add writing addend (predicated)
+MLA             00000100 .. 0 ..... 010 ... ..... .....   @rda_pg_rn_rm
+MLS             00000100 .. 0 ..... 011 ... ..... .....   @rda_pg_rn_rm
+
+# SVE integer multiply-add writing multiplicand (predicated)
+MLA             00000100 .. 0 ..... 110 ... ..... .....   @rdn_pg_ra_rm # MAD
+MLS             00000100 .. 0 ..... 111 ... ..... .....   @rdn_pg_ra_rm # MSB
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.17.0

