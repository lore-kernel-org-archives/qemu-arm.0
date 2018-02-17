Received: by 10.28.71.27 with SMTP id u27csp2071883wma;
        Sat, 17 Feb 2018 10:26:41 -0800 (PST)
X-Google-Smtp-Source: AH8x22705nCAMNQXKpxIcbGd4v6n5SHZKcThmUrRW7Y6ZbahlCED6Ug8c3xD2NW0f5rXlxdRGcoF
X-Received: by 10.129.53.17 with SMTP id c17mr6540436ywa.133.1518892001208;
        Sat, 17 Feb 2018 10:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892001; cv=none;
        d=google.com; s=arc-20160816;
        b=pShskpyCmixO0SRte286w1XfWOgwILRjw2AWJSR+SVtVTq0OmLClpoQDEOboi3YnmG
         QbxcrcmLLVFpDBhvny/Q4LqSAGBRZp2IngYw9X0eIzcG/HBT5viiSq3uvzJo7VTokx6a
         n8IiOKoFL607gIGnyaxqA77HeIVDNJXR71YRfU0S3Z64emkapMttlgRrJkk4Bstsogre
         ZhPWQwxV9YONlpsb1x4P3JRlytdHyjScJRvwUp8Bi0SJCWpBZgOO+SWlrhGNWEZecCki
         X9+bZzIc7LfCxRMUA7SHOj0JUKEtInA0YclXE7Xwv0JjXZ2iZ4brAQqA8hufHvmO8GJ7
         G0fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=JrLpQVNkAD2ooQuftQEUHc/FeKYLqxEFlP7jwgpSp7M=;
        b=GDxi8XodZIEfm37OAN+z5OG6R0ODYD49KB3ujUZTeWiy1Cya/Nf55bahEDltFsH4oi
         xDpJ9W9Sra3j86NLDBZ2NAg4CunsTRVUP3+Wg62y+r2KGnrCnuCC1FEol8xnMq3e6fA3
         P2HnEUZGsakk07JXHwoWDD2NgeGPhCOKwv9qshfe94Be2RCrsyNoDrxjGYcmzsp5Mkr2
         GTGPZncUo50S0+ht/Ol0FXXLkjb+uMdcg5XN1o65hwvqfTrNbBMPYmkkupdaCC7GFn7N
         Sq2lLvG7bquWP8KwTCh5FAlARfo8VQyZRqG+jnmPavMtKWmnuIOzp2xZKloDo4vNcwl/
         GDRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVWirNV3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r66si2015204ywf.203.2018.02.17.10.26.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:26:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bVWirNV3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48069 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7C4-0002kT-J2
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:26:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79O-0000VJ-7U
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79M-0001dX-QY
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:54 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:44552)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79M-0001dF-JA
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:23:52 -0500
Received: by mail-pl0-x243.google.com with SMTP id w21so3426484plp.11
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JrLpQVNkAD2ooQuftQEUHc/FeKYLqxEFlP7jwgpSp7M=;
	b=bVWirNV3nDHul8zG/O7qFSIG1shh6nqF2GybheeEh3srcQfFjTUGfmFIXxZ3H73PgV
	hYZUxie8fh0zmZ5aqkWTv8zv27iUNqu6UIAvS8nRc9LtoHmyTr6Sdpe5mIIjbg7QOkI7
	wv0ltXw6AQpZCrmxpbDOSSlaNhfkHK9k9asEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JrLpQVNkAD2ooQuftQEUHc/FeKYLqxEFlP7jwgpSp7M=;
	b=SyJR5VOdM5Y622Sw0VE3ojVddKYotSPChg2DKOXTSD7o4Dk6raiLWeSLgkdFK6h6hu
	3HvbjdNCDHa2DFqlZ5q89rxPumGJQkcz4Gy794I62LN3L7FrSK/qJYFJE8YuTlh81CpD
	Ru5HBBLea0ybsGzJZ/aGorBir5NESYCUyXrRnsN8SH/Jnh5kw0Tykm3XBTu6YVPD92eI
	cd/ILn774o1NcpKQYQ/fnBZNFb2+dUDFqP8DyWftUSzbhVZTcZx3t7AONve6Ggpp+J34
	XZcjc5oy08ItlsEwfQ2FNXhF3sqaG+ldBLjDRvXFkljZYyWl7XRnV+Yj5lswuH4tPDfS
	WL3w==
X-Gm-Message-State: APf1xPAwkpA8+cF61GIUQuk4dTKFEjp/HnNnrf6tcR/J3aw4m2SWXPY3
	AYREkhuuBxj+TnekiIxLSbNihj6o6M0=
X-Received: by 2002:a17:902:6941:: with SMTP id
	k1-v6mr4060710plt.86.1518891831346; 
	Sat, 17 Feb 2018 10:23:51 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:31 -0800
Message-Id: <20180217182323.25885-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-devel] [PATCH v2 15/67] target/arm: Implement SVE Integer
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zOE1ttJNu+sH

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 18 ++++++++++++++
 target/arm/sve_helper.c    | 58 +++++++++++++++++++++++++++++++++++++++++++++-
 target/arm/translate-sve.c | 31 +++++++++++++++++++++++++
 target/arm/sve.decode      | 17 ++++++++++++++
 4 files changed, 123 insertions(+), 1 deletion(-)

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
index e11823a727..4b08a38ce8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -932,6 +932,62 @@ DO_ZPZI_D(sve_asrd_d, int64_t, DO_ASRD)
 #undef DO_SHR
 #undef DO_SHL
 #undef DO_ASRD
-
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
index dce8ba8dc0..b956d87636 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -609,6 +609,37 @@ DO_ZPZW(LSL, lsl)
 
 #undef DO_ZPZW
 
+/*
+ *** SVE Integer Multiply-Add Group
+ */
+
+static void do_zpzzz_ool(DisasContext *s, arg_rprrr_esz *a,
+                         gen_helper_gvec_5 *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    tcg_gen_gvec_5_ool(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->ra),
+                       vec_full_reg_offset(s, a->rn),
+                       vec_full_reg_offset(s, a->rm),
+                       pred_full_reg_offset(s, a->pg),
+                       vsz, vsz, 0, fn);
+}
+
+#define DO_ZPZZZ(NAME, name) \
+static void trans_##NAME(DisasContext *s, arg_rprrr_esz *a, uint32_t insn) \
+{                                                                    \
+    static gen_helper_gvec_5 * const fns[4] = {                      \
+        gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,        \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,        \
+    };                                                               \
+    do_zpzzz_ool(s, a, fns[a->esz]);                                 \
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
index b875501475..68a1823b72 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -48,6 +48,7 @@
 &rpr_esz	rd pg rn esz
 &rprr_s		rd pg rn rm s
 &rprr_esz	rd pg rn rm esz
+&rprrr_esz	rd pg rn rm ra esz
 &rpri_esz	rd pg rn imm esz
 &ptrue		rd esz pat s
 
@@ -73,6 +74,12 @@
 @rdm_pg_rn	........ esz:2 ... ... ... pg:3 rn:5 rd:5 \
 		&rprr_esz rm=%reg_movprfx
 
+# Three register operand, with governing predicate, vector element size
+@rda_pg_rn_rm	........ esz:2 . rm:5  ... pg:3 rn:5 rd:5 \
+		&rprrr_esz ra=%reg_movprfx
+@rdn_pg_ra_rm	........ esz:2 . rm:5  ... pg:3 ra:5 rd:5 \
+		&rprrr_esz rn=%reg_movprfx
+
 # One register operand, with governing predicate, vector element size
 @rd_pg_rn	........ esz:2 ... ... ... pg:3 rn:5 rd:5	&rpr_esz
 
@@ -188,6 +195,16 @@ UXTH		00000100 .. 010 011 101 ... ..... .....		@rd_pg_rn
 SXTW		00000100 .. 010 100 101 ... ..... .....		@rd_pg_rn
 UXTW		00000100 .. 010 101 101 ... ..... .....		@rd_pg_rn
 
+### SVE Integer Multiply-Add Group
+
+# SVE integer multiply-add writing addend (predicated)
+MLA		00000100 .. 0 ..... 010 ... ..... .....   @rda_pg_rn_rm
+MLS		00000100 .. 0 ..... 011 ... ..... .....   @rda_pg_rn_rm
+
+# SVE integer multiply-add writing multiplicand (predicated)
+MLA		00000100 .. 0 ..... 110 ... ..... .....   @rdn_pg_ra_rm # MAD
+MLS		00000100 .. 0 ..... 111 ... ..... .....   @rdn_pg_ra_rm # MSB
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.14.3

