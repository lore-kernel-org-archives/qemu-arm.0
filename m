Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5026767wre;
        Wed, 30 May 2018 11:09:11 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJTqg7FXhCt/3ZE7l47O+bVuqyfDOlDCKZbh2F6l2PcLLafRGOGchoaVRauP2GQYONprPTw
X-Received: by 2002:a0c:f8c9:: with SMTP id h9-v6mr3666229qvo.122.1527703751454;
        Wed, 30 May 2018 11:09:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527703751; cv=none;
        d=google.com; s=arc-20160816;
        b=XYYOgUDIWpNrbCY1cbfFsc/iLR26M5S2Ln214kwBq74gT08AP3lTl6YLWouSH67EF7
         l8fw/A7+y30QhsV+S9+tKLKJk0Gbz6QfGWi7+jwmllkKbjX3buxE90skNgA4jhblJtRu
         2kL48xf9Y0XSJCCRe+nrU/r6slXVychtEjt9Wyd1x1L6t3E5Xd6PCcQ+aCrpRsuIfKFa
         sPlRZMAYUdN/UIgRFZA4kr2YoXTtULszPWYR4vTZYu6atHhiTK6dRdH35XYoEbPd6IgO
         Pt2xtV8NEY+RUpkmiZMQ/q1gWk6v1nz0VNvEFHgidvG8LIQCSBiXnITVnkWvuLRLq5qY
         oQsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=FGG+f4HCs97Xhb/BWjMpKJ77+RPKNLTeJw2dvqrMLyM=;
        b=L0xAPtpzpIGZ6amtafohOPsSyx5xofdT4aRvfzRNtjeYGumyicVJrs41TJ9g+fHzst
         TcnDjkCXQiih/BLDLFDhoKILPq2mPcb9pfjzs21en5eU6dwvqHTBNMSj+zfpQ4utjYst
         8qFf3x8zqNIZlNvVIvERchfvJ4BOCrGHyGcC3198JWBSAtencEXjG3G6biA+hSMLkmKz
         QzQnH6f+Hod+ve8/z129TkRlf0KmVt7GuSzfHeJvsmV5bAl59V1wFCwhxULrcEWfos5R
         qSU6kqhxsp26sCelWu0ttR9wd4s0HmZJjDknFv8Q78JRV33DyMgY4MtCep/mkdcsupl6
         C28A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XWOO7t4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y10-v6si1661221qki.364.2018.05.30.11.09.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:09:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XWOO7t4V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5X4-0007hl-SY
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:09:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pl-0001us-Mc
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pk-0004YS-By
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:37 -0400
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:46386)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5Pk-0004XC-4e
	for qemu-arm@nongnu.org; Wed, 30 May 2018 14:01:36 -0400
Received: by mail-pl0-x244.google.com with SMTP id 30-v6so11533435pld.13
	for <qemu-arm@nongnu.org>; Wed, 30 May 2018 11:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FGG+f4HCs97Xhb/BWjMpKJ77+RPKNLTeJw2dvqrMLyM=;
	b=XWOO7t4VtH+hEXvRTvVze2E0mvFHsZ0ztljpFByhewrsSC7gI1hqAJWlpiw8yIQC/7
	3JTPkbuiniVGWcGJW3JxCiTqeAGMi+PkcmH9YSVHef3VQr8PVcoO+Ql27mZhSmsuf1tc
	CN6YxuATDxc0/gZwgeIib7juTVTqH1mnSEdsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FGG+f4HCs97Xhb/BWjMpKJ77+RPKNLTeJw2dvqrMLyM=;
	b=OKTIFzilUMH9CgZL7i+xk+1i+wOkqFMKwOsIKjFEdtPElA24PZnJbxorg64tkU89fU
	gRb2hK0d/vpqhzd5Mp/jdhpLtU32XjXi3I2io7IUqZl9K0k76d2ONHUAwI0IBnaQDM2V
	S1pfXiJabLPwG2aeJqtRndrFWsqkBk2zQ14Qxat6pN806DQNjgsKXJ/QugxlZjGiu2/O
	ef9hdk53A4SceBHOBrBz0Xu+D02EV9RYVwaSS4xJUE4AYvdwYZvuuoFhpwXBs2GjQvbr
	OuLqdB/6C7ieSWLJ4Qxn7uw4v7OEqnSb2XXl8cmBjL3P4OHeWcPFwN4+oZJxbrF7ZCoO
	Bc+w==
X-Gm-Message-State: ALKqPwfuLVGGFax+24++WTN2r65Yqgy021rSaJwwuFgB3/mnkosuBy0e
	S0xliKbn1b43VP0ikDaHfooFdQ==
X-Received: by 2002:a17:902:7c84:: with SMTP id
	y4-v6mr3864682pll.262.1527703295093; 
	Wed, 30 May 2018 11:01:35 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:10 -0700
Message-Id: <20180530180120.13355-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530180120.13355-1-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v3b 08/18] target/arm: Implement SVE reverse
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gekFxpLDMzqi

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 +++++++++++++
 target/arm/sve_helper.c    | 41 +++++++++++++++++++++++++++++++-------
 target/arm/translate-sve.c | 38 +++++++++++++++++++++++++++++++++++
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
index 941a098234..f8579a25e3 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -238,6 +238,26 @@ static inline uint64_t expand_pred_s(uint8_t byte)
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
@@ -616,6 +636,20 @@ DO_ZPZ(sve_neg_h, uint16_t, H1_2, DO_NEG)
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
@@ -1587,13 +1621,6 @@ void HELPER(sve_rev_b)(void *vd, void *vn, uint32_t desc)
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
index a6f85de358..90561a8b50 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2633,6 +2633,44 @@ static bool trans_CPY_m_v(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
     return true;
 }
 
+static bool trans_REVB(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL,
+        gen_helper_sve_revb_h,
+        gen_helper_sve_revb_s,
+        gen_helper_sve_revb_d,
+    };
+    return do_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_REVH(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL,
+        NULL,
+        gen_helper_sve_revh_s,
+        gen_helper_sve_revh_d,
+    };
+    return do_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_REVW(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_revw_d : NULL);
+}
+
+static bool trans_RBIT(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        gen_helper_sve_rbit_b,
+        gen_helper_sve_rbit_h,
+        gen_helper_sve_rbit_s,
+        gen_helper_sve_rbit_d,
+    };
+    return do_zpz_ool(s, a, fns[a->esz]);
+}
+
 /*
  *** SVE Memory - 32-bit Gather and Unsized Contiguous Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 519139f684..95eb4968a9 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -456,6 +456,13 @@ CPY_m_v         00000101 .. 100000 100 ... ..... .....          @rd_pg_rn
 # SVE copy element from general register to vector (predicated)
 CPY_m_r         00000101 .. 101000 101 ... ..... .....          @rd_pg_rn
 
+# SVE reverse within elements
+# Note esz >= operation size
+REVB            00000101 .. 1001 00 100 ... ..... .....         @rd_pg_rn
+REVH            00000101 .. 1001 01 100 ... ..... .....         @rd_pg_rn
+REVW            00000101 .. 1001 10 100 ... ..... .....         @rd_pg_rn
+RBIT            00000101 .. 1001 11 100 ... ..... .....         @rd_pg_rn
+
 ### SVE Predicate Logical Operations Group
 
 # SVE predicate logical operations
-- 
2.17.0

