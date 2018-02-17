Received: by 10.28.71.27 with SMTP id u27csp2089283wma;
        Sat, 17 Feb 2018 10:51:42 -0800 (PST)
X-Google-Smtp-Source: AH8x226voa9aXom/UPaFWVsxrZfRCKQILhK99ID36dBHsz8Tnebvz4wkk3EYdER6NLwWEDAdoW1U
X-Received: by 10.13.247.2 with SMTP id h2mr7296663ywf.443.1518893502047;
        Sat, 17 Feb 2018 10:51:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893502; cv=none;
        d=google.com; s=arc-20160816;
        b=b8VJr1HSZclYvrEB2TH3D2q6+JtSf4NTH/ebUv36Abg7qSBzHGIqvhi+dtgeQX8/PV
         GwasuN5tRmHu8vk/whxqe/nLsLMwvDfu7X6VD92FNULoA1aoT9yaSknxRkTO0eCxfhe0
         qC1wGNcj4jLAYRfpqkjN7lZlLkhe/Kg9ACP3+GRSYFz2FMH47DEvnOcZ6SU+gvKokk1X
         Bg4n1099UuZ/Srnr2YLAgW2nv3ep2eyKplYPsjr8Hi3U7n/C3QswFn3mFwVDUG+97kqs
         wGjzqSTLoMcwRbosNOoQocQcFCeFDToKGzZx3zGtI3rKMOvEeT/Eq23S9m/17ojbHl0x
         y6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=7ABdzz1wITfCNiODAQGc4uzbhTYqYtjwPZz9V9qFcXA=;
        b=h7Ux/4zKPMq+Bpm6ZIclvSSne/cdQtMJxaUCYLuJPv5M/7CNGu19CayeHucZPS7HIX
         LNOQ8PQY/gSIrSQzPjJRR5EyucLwMslmlVmt/Q9DgKvRFyVvX1z/wcocV03dRcsumuNL
         2pgutf8BhsimqsKdttBqMuXToo0m4e7xgqdmeQdlXsZ4YhzEA4/MNLISva08d67vK8b5
         bystEJF9gk7isst7ORBS7/r8nXM40AUxZHq3CnszJ6ob7Pfgw/1woA2bb3B8mkQ60veS
         dejtaDLPascDBhwmUK3oJRztAeR8n9NNPB9UnsIx1hyYHBPuIPJu4YTJd3Snr0ken8R3
         z68Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WIhqa3mi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p17si3502966ybj.636.2018.02.17.10.51.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:51:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WIhqa3mi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48278 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7aH-0006HJ-CB
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:51:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AC-0001On-Mi
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AA-00025r-UN
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:44 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:38170)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AA-00025S-Lt
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:42 -0500
Received: by mail-pl0-x241.google.com with SMTP id h10so3439633plt.5
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7ABdzz1wITfCNiODAQGc4uzbhTYqYtjwPZz9V9qFcXA=;
	b=WIhqa3mih7ta9C/mSlgyt29PjH06zUxuey5fGbCpXsZMB37Ycu70Aymdq7FPknrFPF
	K2ip6LnGuh/RJPbHghxloZGepjGEmq8Npdi6gGCMXBKyAPM2+F4xrgqdX3AuGCR7ByOI
	6sdlWqCxcvFuE7p9BTb6qmlGHIQ3z2rK2XwGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7ABdzz1wITfCNiODAQGc4uzbhTYqYtjwPZz9V9qFcXA=;
	b=m876LtdkkhvPcQmhrydUNiUp+/5wkPsdccN0fu2rdvgpN35k7z72Wn3H2ynGN1nSkq
	w2sch0Cnd+cC78gMfpqLJcMnvOximw2Am9MbETrIscX/d26akt9nxo3/E3Ihh2SHpPmo
	SCSa05P5dKcn5AkGq/8o0h4LxszQW/EN5Dk+9VcpCkZR73oNVmxnSD4Ns4pJVppK/U8+
	SGMLys6MnR0apM06MdDB6URlTRcXY/0maTvgUEHt5MsLnITEU1cUXcpxxII1pRGswHfw
	yAUdBERO7UYq97KXcVAIpgWO0hovyiX2Dvrr8Ow1RQMhmwF4eY/RJ2QCefApdTRXPj6M
	0uow==
X-Gm-Message-State: APf1xPDIHIPUz30JdtkBiVxYUlQ3Ie80eWJ1Zh5rvAvSwO4BDnCHUjis
	oClB3QqGdFj9kU+LVqEuFGdTNJHGvak=
X-Received: by 2002:a17:902:b189:: with SMTP id
	s9-v6mr9342318plr.243.1518891881212; 
	Sat, 17 Feb 2018 10:24:41 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:03 -0800
Message-Id: <20180217182323.25885-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-devel] [PATCH v2 47/67] target/arm: Implement SVE integer
 convert to floating-point
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8z+3LTh8Pk5T

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 30 +++++++++++++++
 target/arm/sve_helper.c    | 52 ++++++++++++++++++++++++++
 target/arm/translate-sve.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 22 +++++++++++
 4 files changed, 196 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 74c2d642a3..fb7609f9ef 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -720,6 +720,36 @@ DEF_HELPER_FLAGS_5(gvec_rsqrts_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(gvec_rsqrts_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_scvt_hh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_scvt_sh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_scvt_dh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_scvt_ss, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_scvt_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_scvt_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_scvt_dd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_ucvt_hh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_ucvt_sh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_ucvt_dh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_ucvt_ss, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_ucvt_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_ucvt_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_ucvt_dd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(sve_ld1bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld2bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_ld3bb_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index e259e910de..a1e0ceb5fb 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -2789,6 +2789,58 @@ uint32_t HELPER(sve_while)(void *vd, uint32_t count, uint32_t pred_desc)
     return predtest_ones(d, oprsz, esz_mask);
 }
 
+/* Fully general two-operand expander, controlled by a predicate,
+ * With the extra float_status parameter.
+ */
+#define DO_ZPZ_FP(NAME, TYPE, H, OP)                            \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    for (i = 0; i < opr_sz; ) {                                 \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));         \
+        do {                                                    \
+            if (pg & 1) {                                       \
+                TYPE nn = *(TYPE *)(vn + H(i));                 \
+                *(TYPE *)(vd + H(i)) = OP(nn, status);          \
+            }                                                   \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);             \
+        } while (i & 15);                                       \
+    }                                                           \
+}
+
+/* Similarly, specialized for 64-bit operands.  */
+#define DO_ZPZ_FP_D(NAME, TYPE, OP)                             \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc) \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;                  \
+    TYPE *d = vd, *n = vn;                                      \
+    uint8_t *pg = vg;                                           \
+    for (i = 0; i < opr_sz; i += 1) {                           \
+        if (pg[H1(i)] & 1) {                                    \
+            d[i] = OP(n[i], status);                            \
+        }                                                       \
+    }                                                           \
+}
+
+DO_ZPZ_FP(sve_scvt_hh, uint16_t, H1_2, int16_to_float16)
+DO_ZPZ_FP(sve_scvt_sh, uint32_t, H1_4, int32_to_float16)
+DO_ZPZ_FP(sve_scvt_ss, uint32_t, H1_4, int32_to_float32)
+DO_ZPZ_FP_D(sve_scvt_sd, uint64_t, int32_to_float64)
+DO_ZPZ_FP_D(sve_scvt_dh, uint64_t, int64_to_float16)
+DO_ZPZ_FP_D(sve_scvt_ds, uint64_t, int64_to_float32)
+DO_ZPZ_FP_D(sve_scvt_dd, uint64_t, int64_to_float64)
+
+DO_ZPZ_FP(sve_ucvt_hh, uint16_t, H1_2, uint16_to_float16)
+DO_ZPZ_FP(sve_ucvt_sh, uint32_t, H1_4, uint32_to_float16)
+DO_ZPZ_FP(sve_ucvt_ss, uint32_t, H1_4, uint32_to_float32)
+DO_ZPZ_FP_D(sve_ucvt_sd, uint64_t, uint32_to_float64)
+DO_ZPZ_FP_D(sve_ucvt_dh, uint64_t, uint64_to_float16)
+DO_ZPZ_FP_D(sve_ucvt_ds, uint64_t, uint64_to_float32)
+DO_ZPZ_FP_D(sve_ucvt_dd, uint64_t, uint64_to_float64)
+
+#undef DO_ZPZ_FP
+#undef DO_ZPZ_FP_D
+
 /*
  * Load contiguous data, protected by a governing predicate.
  */
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7b21102b7e..05c684222e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3161,6 +3161,98 @@ DO_FP3(FRSQRTS, rsqrts)
 
 #undef DO_FP3
 
+
+/*
+ *** SVE Floating Point Unary Operations Prediated Group
+ */
+
+static void do_zpz_ptr(DisasContext *s, int rd, int rn, int pg,
+                       bool is_fp16, gen_helper_gvec_3_ptr *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr status;
+
+    if (fn == NULL) {
+        unallocated_encoding(s);
+        return;
+    }
+    status = get_fpstatus_ptr(is_fp16);
+    tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                       vec_full_reg_offset(s, rn),
+                       pred_full_reg_offset(s, pg),
+                       status, vsz, vsz, 0, fn);
+}
+
+static void trans_SCVTF_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_hh);
+}
+
+static void trans_SCVTF_sh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_sh);
+}
+
+static void trans_SCVTF_dh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_dh);
+}
+
+static void trans_SCVTF_ss(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_scvt_ss);
+}
+
+static void trans_SCVTF_ds(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_scvt_ds);
+}
+
+static void trans_SCVTF_sd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_scvt_sd);
+}
+
+static void trans_SCVTF_dd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_scvt_dd);
+}
+
+static void trans_UCVTF_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_ucvt_hh);
+}
+
+static void trans_UCVTF_sh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_ucvt_sh);
+}
+
+static void trans_UCVTF_dh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_ucvt_dh);
+}
+
+static void trans_UCVTF_ss(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_ucvt_ss);
+}
+
+static void trans_UCVTF_ds(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_ucvt_ds);
+}
+
+static void trans_UCVTF_sd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_ucvt_sd);
+}
+
+static void trans_UCVTF_dd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_ucvt_dd);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6c906e25e9..b571b70050 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -134,6 +134,9 @@
 @rd_pg_rn	........ esz:2 ... ... ... pg:3 rn:5 rd:5	&rpr_esz
 @rd_pg4_pn	........ esz:2 ... ... .. pg:4 . rn:4 rd:5	&rpr_esz
 
+# One register operand, with governing predicate, no vector element size
+@rd_pg_rn_e0	........ .. ... ... ... pg:3 rn:5 rd:5		&rpr_esz esz=0
+
 # Two register operands with a 6-bit signed immediate.
 @rd_rn_i6	........ ... rn:5 ..... imm:s6 rd:5		&rri
 
@@ -689,6 +692,25 @@ FTSMUL		01100101 .. 0 ..... 000 011 ..... .....		@rd_rn_rm
 FRECPS		01100101 .. 0 ..... 000 110 ..... .....		@rd_rn_rm
 FRSQRTS		01100101 .. 0 ..... 000 111 ..... .....		@rd_rn_rm
 
+### SVE FP Unary Operations Predicated Group
+
+# SVE integer convert to floating-point
+SCVTF_hh	01100101 01 010 01 0 101 ... ..... .....	@rd_pg_rn_e0
+SCVTF_sh	01100101 01 010 10 0 101 ... ..... .....	@rd_pg_rn_e0
+SCVTF_dh	01100101 01 010 11 0 101 ... ..... .....	@rd_pg_rn_e0
+SCVTF_ss	01100101 10 010 10 0 101 ... ..... .....	@rd_pg_rn_e0
+SCVTF_sd	01100101 11 010 00 0 101 ... ..... .....	@rd_pg_rn_e0
+SCVTF_ds	01100101 11 010 10 0 101 ... ..... .....	@rd_pg_rn_e0
+SCVTF_dd	01100101 11 010 11 0 101 ... ..... .....	@rd_pg_rn_e0
+
+UCVTF_hh	01100101 01 010 01 1 101 ... ..... .....	@rd_pg_rn_e0
+UCVTF_sh	01100101 01 010 10 1 101 ... ..... .....	@rd_pg_rn_e0
+UCVTF_dh	01100101 01 010 11 1 101 ... ..... .....	@rd_pg_rn_e0
+UCVTF_ss	01100101 10 010 10 1 101 ... ..... .....	@rd_pg_rn_e0
+UCVTF_sd	01100101 11 010 00 1 101 ... ..... .....	@rd_pg_rn_e0
+UCVTF_ds	01100101 11 010 10 1 101 ... ..... .....	@rd_pg_rn_e0
+UCVTF_dd	01100101 11 010 11 1 101 ... ..... .....	@rd_pg_rn_e0
+
 ### SVE Memory - 32-bit Gather and Unsized Contiguous Group
 
 # SVE load predicate register
-- 
2.14.3

