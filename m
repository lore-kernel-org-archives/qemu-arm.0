Received: by 10.28.71.27 with SMTP id u27csp2079827wma;
        Sat, 17 Feb 2018 10:37:13 -0800 (PST)
X-Google-Smtp-Source: AH8x226BQtCDXcv0oqWRwfdBjvimM3xu36DMaDwS8AvQg+h6NuduSFhnEw7SP8aaraHZFTEHH2ze
X-Received: by 10.37.134.199 with SMTP id y7mr7357872ybm.77.1518892633395;
        Sat, 17 Feb 2018 10:37:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518892633; cv=none;
        d=google.com; s=arc-20160816;
        b=RFOPYYGwiKAYY6w1FXSp8A0gQZpOOqRBe9RUmeVGwQ2L1phptrUTftfI4tEMPltZLY
         Qs03wLcmtpAfPkovBcuDvs6zLdAFlJbCoHtQS/dHUTlGfd8QxHK6H3q3NO7HhAfw7xZT
         FhQ78nGGPbUWiqLHDbzxSWhzB9FcfEJP+14L2pHYvobisIr1I3WIRFHi3dV1Kgr6+NDU
         DRGkdta7Db4RfI0PJUSGJBfKzm40JbngesPU2PaHQO/JiC9fU8AkVBC69bEmZA4I4iB0
         2GXtnvh5vumIzNgVl2G1sq7HXTpcjTHo1eTKpTvyhBF6sNHfmZa+4CDsAFz0RUZl5wlR
         ywmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=HYLGbImRsPUmVxi2WVEnc4w2Rh42rCM67spjRykW1n4=;
        b=RmgtENN2/9+04V9phzD6rLC9lTIypyDg2j/cUUkf/pCrlzw5x8cKIDWkaRxObT3oOW
         NV6P8e2iNZJTBxu/EuQf6cXyaigEkZrFr9d2r/4DQVLO5QugQGyLcpX86Ws/ZKVq8OeL
         r1v3abq97vwrDMYgH7vCHSssomXfSGDNfSDzA77vsWl38PkYQ679c+5CdVG4OLmMeiOi
         t7uJEz6KZrmUKp3RlWo0E55p7iUvykLdgzYAu9rwmhPWiFgKU2pLPf4OCiUjnEIcnRDo
         st+dxZPg6+xUi1LK60d8kvAJ4X3rppW8BiFNA1mRUBUUQXr8q0KnOg8s8OZk4hJ4mYxR
         195w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kHIuEg2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l18si3610722ywm.397.2018.02.17.10.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:37:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kHIuEg2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7MG-0003CY-ND
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:37:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79p-00010w-Os
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en79o-0001tC-Ie
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:21 -0500
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:36665)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en79o-0001su-BM
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:24:20 -0500
Received: by mail-pl0-x242.google.com with SMTP id v3so3444133plg.3
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HYLGbImRsPUmVxi2WVEnc4w2Rh42rCM67spjRykW1n4=;
	b=kHIuEg2+rn0Aznu1oT0wRsNNzYK0M64xl2q1o7ohhe57wiZxCFovgpnu4ezVB9O52/
	OIKY28v7q3OgF65Teflpl2/morhDB5ODMnB5vgKdBxf3V6glftRIbn2jug3EiAWxikb4
	+yEk+w1chHC30SALWefJ129CVcEMwNIFsy1bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HYLGbImRsPUmVxi2WVEnc4w2Rh42rCM67spjRykW1n4=;
	b=d+9OdIRGRe30yytjv1Qbt8wk7sr905d0NXU9D247dR7BNYsT6e8zAMZzWhuoo4gFuL
	v1fKlhlkO2/I32biXFdcruJJWpusbtDDaSkl1VkpBgbEw6Gve3/ClGXRDK44Us3ylarI
	0NdU1NWexKfyNd+g69ahMtj3ofMbn3KBiD4+RdiQqVwhAnc4jAbu1f9YRXXoEUDUDzYF
	uirHTAbVsOXmlEXUcSBCHo9sHptZk5u6OGdZvp5CmCZfVfA/RxuY+F95YxMhExiPgaai
	KNTqDUz0+oaSOzCVfxRYO2oG4L82FeW7nnDoFdjaFad2T04w6G9+iBtgu7Dou5OGU75B
	ghJg==
X-Gm-Message-State: APf1xPBK5DZQkHuiUwhrnLXm3zzXP/q83+PbddSdoJ5zQItJlHWoVh1n
	5nDjR1HNMxvCTfKqI0FZBAwKgw==
X-Received: by 2002:a17:902:402:: with SMTP id
	2-v6mr9254422ple.353.1518891859459; 
	Sat, 17 Feb 2018 10:24:19 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:49 -0800
Message-Id: <20180217182323.25885-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH v2 33/67] target/arm: Implement SVE reverse
 within elements
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
X-TUID: uAgsujT1gpkC

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++++++++
 target/arm/sve_helper.c    | 41 ++++++++++++++++++++++++++++++++++-------
 target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  7 +++++++
 4 files changed, 93 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a58fb4ba01..3b7c54905d 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -465,6 +465,20 @@ DEF_HELPER_FLAGS_4(sve_compact_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_2(sve_last_active_element, TCG_CALL_NO_RWG, s32, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_revb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_revb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_revb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_revh_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_revh_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_revw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_rbit_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_rbit_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_rbit_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_rbit_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index ee289be642..a67bb579b8 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -237,6 +237,26 @@ static inline uint64_t expand_pred_s(uint8_t byte)
     return word[byte & 0x11];
 }
 
+/* Swap 16-bit words within a 32-bit word.  */
+static inline uint32_t hswap32(uint32_t h)
+{
+    return rol32(h, 16);
+}
+
+/* Swap 16-bit words within a 64-bit word.  */
+static inline uint64_t hswap64(uint64_t h)
+{
+    uint64_t m = 0x0000ffff0000ffffull;
+    h = rol64(h, 32);
+    return ((h & m) << 16) | ((h >> 16) & m);
+}
+
+/* Swap 32-bit words within a 64-bit word.  */
+static inline uint64_t wswap64(uint64_t h)
+{
+    return rol64(h, 32);
+}
+
 #define LOGICAL_PPPP(NAME, FUNC) \
 void HELPER(NAME)(void *vd, void *vn, void *vm, void *vg, uint32_t desc)  \
 {                                                                         \
@@ -615,6 +635,20 @@ DO_ZPZ(sve_neg_h, uint16_t, H1_2, DO_NEG)
 DO_ZPZ(sve_neg_s, uint32_t, H1_4, DO_NEG)
 DO_ZPZ_D(sve_neg_d, uint64_t, DO_NEG)
 
+DO_ZPZ(sve_revb_h, uint16_t, H1_2, bswap16)
+DO_ZPZ(sve_revb_s, uint32_t, H1_4, bswap32)
+DO_ZPZ_D(sve_revb_d, uint64_t, bswap64)
+
+DO_ZPZ(sve_revh_s, uint32_t, H1_4, hswap32)
+DO_ZPZ_D(sve_revh_d, uint64_t, hswap64)
+
+DO_ZPZ_D(sve_revw_d, uint64_t, wswap64)
+
+DO_ZPZ(sve_rbit_b, uint8_t, H1, revbit8)
+DO_ZPZ(sve_rbit_h, uint16_t, H1_2, revbit16)
+DO_ZPZ(sve_rbit_s, uint32_t, H1_4, revbit32)
+DO_ZPZ_D(sve_rbit_d, uint64_t, revbit64)
+
 /* Three-operand expander, unpredicated, in which the third operand is "wide".
  */
 #define DO_ZZW(NAME, TYPE, TYPEW, H, OP)                       \
@@ -1577,13 +1611,6 @@ void HELPER(sve_rev_b)(void *vd, void *vn, uint32_t desc)
     }
 }
 
-static inline uint64_t hswap64(uint64_t h)
-{
-    uint64_t m = 0x0000ffff0000ffffull;
-    h = rol64(h, 32);
-    return ((h & m) << 16) | ((h >> 16) & m);
-}
-
 void HELPER(sve_rev_h)(void *vd, void *vn, uint32_t desc)
 {
     intptr_t i, j, opr_sz = simd_oprsz(desc);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index fc2a295ab7..5a1ed379ad 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2435,6 +2435,44 @@ static void trans_CPY_m_v(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
     tcg_temp_free_i64(t);
 }
 
+static void trans_REVB(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL,
+        gen_helper_sve_revb_h,
+        gen_helper_sve_revb_s,
+        gen_helper_sve_revb_d,
+    };
+    do_zpz_ool(s, a, fns[a->esz]);
+}
+
+static void trans_REVH(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL,
+        NULL,
+        gen_helper_sve_revh_s,
+        gen_helper_sve_revh_d,
+    };
+    do_zpz_ool(s, a, fns[a->esz]);
+}
+
+static void trans_REVW(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_revw_d : NULL);
+}
+
+static void trans_RBIT(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve_rbit_b,
+        gen_helper_sve_rbit_h,
+        gen_helper_sve_rbit_s,
+        gen_helper_sve_rbit_d,
+    };
+    do_zpz_ool(s, a, fns[a->esz]);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5e127de88c..8903fb6592 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -457,6 +457,13 @@ CPY_m_v		00000101 .. 100000 100 ... ..... .....		@rd_pg_rn
 # SVE copy element from general register to vector (predicated)
 CPY_m_r		00000101 .. 101000 101 ... ..... .....		@rd_pg_rn
 
+# SVE reverse within elements
+# Note esz >= operation size
+REVB		00000101 .. 1001 00 100 ... ..... .....		@rd_pg_rn
+REVH		00000101 .. 1001 01 100 ... ..... .....		@rd_pg_rn
+REVW		00000101 .. 1001 10 100 ... ..... .....		@rd_pg_rn
+RBIT		00000101 .. 1001 11 100 ... ..... .....		@rd_pg_rn
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.14.3

