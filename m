Received: by 10.223.159.74 with SMTP id f10csp2991001wrg;
        Mon, 18 Dec 2017 10:43:49 -0800 (PST)
X-Google-Smtp-Source: ACJfBouKqi8t84Y33tloi46nTFuQ1Ea+rUoFgqW1iLH044nrLqQzx8JblIE88IVHWUa4FEFiOl+M
X-Received: by 10.129.173.13 with SMTP id l13mr550911ywh.291.1513622629292;
        Mon, 18 Dec 2017 10:43:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513622629; cv=none;
        d=google.com; s=arc-20160816;
        b=R3E+MkNL1MU0K++OSgmIfDvrOyIXcqLfu3Zo+D2VtTjt1iO0xitGWB/uh49mYG6pT6
         wklnPV8VcRLpWOPQY4o8Qslv+zJ65BeCxJTdSIXMY9jb4qnPweV3SoALI+IWC++9UN9P
         uPm1UaXkb+qVn9+qbSv04M7LZtp1nO1vXrYg3mfzOKPelMaNf9oS6Tw65ZZQQ1PwLXSr
         4G5jiFcRANtzGiiIFFkth2mODTANyYmLjTfhbOHc/n5CnjprUa30Sne17sRa+Ww1kkck
         17rKVg+MxMdF+irJNXbSqZnxY7i/HJUmQjNVZjS1iOkl+zy5KygdBCRU7AOITLf/HK1R
         iWdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=SbAQzKsUC2EG/9+FPyO+p9UvPXJQnnAVP1KI6UDjMAw=;
        b=gv0TZanVpgS4sNE6QRYyo4Wb1mJ07wnsXrMmicTryBOw7dsF5L9Jswu4AjebkmvveY
         Lkje31Use/jvkv/Zw9WTEEAWGj4p009ra2MK3MuVJXD0D6iU7NnXgWYflZhgK2eIDUaK
         FqPnS4k3QWYZ2FmKBm3m2tiuattW/NzOrTkmoZ3K38uF8P2PNDa9lqhTXfw2FX2xANY3
         IOWYaEGcmbMfxylwxcw7jTEU/kEXKvsF/1NLAO0QIwqd+3bwAwbJ2xBL5stj/1CEBMyu
         zRpNKzPgJQZgKhFLb3anqjX6VUahYvqCF6MNQCslKJAZlegAk9oUiovgYXOnLBNPJQAe
         PCbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PqqxPFZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3si1280823ybp.830.2017.12.18.10.43.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:43:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PqqxPFZc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eR0OC-0000uZ-Js
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:43:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUT-0008E1-Me
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUR-00023V-OG
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:13 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:33721)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUR-000228-HE
	for qemu-arm@nongnu.org; Mon, 18 Dec 2017 12:46:11 -0500
Received: by mail-pl0-x241.google.com with SMTP id 1so3790250plv.0
	for <qemu-arm@nongnu.org>; Mon, 18 Dec 2017 09:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SbAQzKsUC2EG/9+FPyO+p9UvPXJQnnAVP1KI6UDjMAw=;
	b=PqqxPFZc5+IOkEqbRmiACcz0tFDE+mV3NH6pXTYQzWAeeEO/x2NTt3/5VtER0S0uNQ
	uvi/sePFJyVUGOiNP6pIKWnk8YPFLHWZokHPatsSd11sWHAfggP3lxq3cVTwS5SeGBLZ
	SfKLmrEOFIwb2iJKVG1I8nAwW0ikzaQKeakdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SbAQzKsUC2EG/9+FPyO+p9UvPXJQnnAVP1KI6UDjMAw=;
	b=ox3+zIF+z3lTUBI2ePea4DkU6vR7UsCBKBMKWSyLD2Jc++2ykzHBjavNx7UMAOinFT
	fat0fLYi/cxQ9xC0rNZtUqWPXypsjEhk5VjfKpBoqoy4Pq/5Y8xaEiX2HbQOi8DmUT2i
	JW0cPecWo9sYK7EPY0NOgSiMUJ0Dy4T63M1ibix9Kdbzfz3bLs1AF1ccLIxRqEB+K1LZ
	mf8GJ9I7v4YD2c7P1y7Mlo33nA5yOmsOCPpcvwoNu8twUYWzlNptGQllzKGd9o6JIXM6
	JaJiURGNAdkRPenSmHt4Jiexr/yNHk2qxNjFubUEQKz7+V5oLxcuS/ZlAOu4GxFyNGgM
	/+QQ==
X-Gm-Message-State: AKGB3mIl5EJSKRaBMkXg5ymj+RrvdspyJubn6xa+KpqHs60/EU/nAb32
	gDD9DmJ7iEvXwBStANuJu0jW2Q==
X-Received: by 10.84.129.7 with SMTP id 7mr511269plb.104.1513619170514;
	Mon, 18 Dec 2017 09:46:10 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.46.09
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:46:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:39 -0800
Message-Id: <20171218174552.18871-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171218174552.18871-1-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-arm] [PATCH 10/23] target/arm: Implement SVE Integer
 Reduction Group
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
X-TUID: Pn7huxU3YOSG

Excepting MOVPRFX, which isn't a reduction.  Presumably it is
placed within the group because of its encoding.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  44 +++++++++++++++++
 target/arm/sve_helper.c    | 116 +++++++++++++++++++++++++++++++++++++++------
 target/arm/translate-sve.c |  64 +++++++++++++++++++++++++
 target/arm/sve.def         |  22 +++++++++
 4 files changed, 231 insertions(+), 15 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 964b15b104..937598d6f8 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -162,6 +162,50 @@ DEF_HELPER_FLAGS_5(sve_udiv_zpzz_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_udiv_zpzz_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_3(sve_orv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_orv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_orv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_orv_d, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_eorv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_eorv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_eorv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_eorv_d, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_andv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_andv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_andv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_andv_d, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_saddv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_saddv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_saddv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_uaddv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_uaddv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_uaddv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_uaddv_d, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_smaxv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_smaxv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_smaxv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_smaxv_d, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_umaxv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_umaxv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_umaxv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_umaxv_d, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_sminv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_sminv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_sminv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_sminv_d, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_3(sve_uminv_b, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_uminv_h, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_uminv_s, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_3(sve_uminv_d, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pred, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pred, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pred, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index b617ea2c04..fca17440e7 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -196,11 +196,6 @@ DO_ZPZZ_D(sve_orr_zpzz_d, uint64_t, DO_ORR)
 DO_ZPZZ_D(sve_eor_zpzz_d, uint64_t, DO_EOR)
 DO_ZPZZ_D(sve_bic_zpzz_d, uint64_t, DO_BIC)
 
-#undef DO_AND
-#undef DO_ORR
-#undef DO_EOR
-#undef DO_BIC
-
 #define DO_ADD(N, M)  (N + M)
 #define DO_SUB(N, M)  (N - M)
 
@@ -216,9 +211,6 @@ DO_ZPZZ(sve_sub_zpzz_s, uint32_t, H1_4, DO_SUB)
 DO_ZPZZ_D(sve_add_zpzz_d, uint64_t, DO_ADD)
 DO_ZPZZ_D(sve_sub_zpzz_d, uint64_t, DO_SUB)
 
-#undef DO_ADD
-#undef DO_SUB
-
 #define DO_MAX(N, M)  ((N) >= (M) ? (N) : (M))
 #define DO_MIN(N, M)  ((N) >= (M) ? (M) : (N))
 #define DO_ABD(N, M)  ((N) >= (M) ? (N) - (M) : (M) - (N))
@@ -251,10 +243,6 @@ DO_ZPZZ_D(sve_umin_zpzz_d, uint64_t, DO_MIN)
 DO_ZPZZ_D(sve_sabd_zpzz_d, int64_t,  DO_ABD)
 DO_ZPZZ_D(sve_uabd_zpzz_d, uint64_t, DO_ABD)
 
-#undef DO_MAX
-#undef DO_MIN
-#undef DO_ABD
-
 #define DO_MUL(N, M)  (N * M)
 #define DO_DIV(N, M)  (M ? N / M : 0)
 
@@ -309,12 +297,110 @@ DO_ZPZZ_D(sve_umulh_zpzz_d, uint64_t, do_umulh_d)
 DO_ZPZZ_D(sve_sdiv_zpzz_d, int64_t, DO_DIV)
 DO_ZPZZ_D(sve_udiv_zpzz_d, uint64_t, DO_DIV)
 
-#undef DO_MUL
-#undef DO_DIV
-
 #undef DO_ZPZZ
 #undef DO_ZPZZ_D
 
+/* Two-operand reduction expander, controlled by a predicate.
+ * The difference between TYPERED and TYPERET has to do with
+ * sign-extension.  E.g. for SMAX, TYPERED must be signed,
+ * but TYPERET must be unsigned so that e.g. a 32-bit value
+ * is not sign-extended to the ABI uint64_t return type.
+ */
+/* ??? If we were to vectorize this by hand the reduction ordering
+ * would change.  For integer operands, this is perfectly fine.
+ */
+#define DO_VPZ(NAME, TYPEELT, TYPERED, TYPERET, H, INIT, OP) \
+uint64_t HELPER(NAME)(void *vn, void *vg, uint32_t desc)   \
+{                                                          \
+    intptr_t iv, ib, opr_sz = simd_oprsz(desc);            \
+    TYPERED ret = INIT;                                    \
+    for (iv = ib = 0; iv < opr_sz; iv += 16, ib += 2) {    \
+        uint16_t pg = *(uint16_t *)(vg + H2(ib));          \
+        intptr_t i = 0;                                    \
+        do {                                               \
+            TYPEELT nn = *(TYPEELT *)(vn + iv + H(i));     \
+            ret = OP(ret, nn);                             \
+            i += sizeof(TYPEELT), pg >>= sizeof(TYPEELT);  \
+        } while (pg);                                      \
+    }                                                      \
+    return (TYPERET)ret;                                   \
+}
+
+#define DO_VPZ_D(NAME, TYPEE, TYPER, INIT, OP)             \
+uint64_t HELPER(NAME)(void *vn, void *vg, uint32_t desc)   \
+{                                                          \
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;             \
+    TYPEE *n = vn;                                         \
+    uint8_t *pg = vg;                                      \
+    TYPER ret = INIT;                                      \
+    for (i = 0; i < opr_sz; i += 1) {                      \
+        if (pg[H1(i)] & 1) {                               \
+            TYPEE nn = n[i];                               \
+            ret = OP(ret, nn);                             \
+        }                                                  \
+    }                                                      \
+    return ret;                                            \
+}
+
+DO_VPZ(sve_orv_b, uint8_t, uint8_t, uint8_t, H1, 0, DO_ORR)
+DO_VPZ(sve_orv_h, uint16_t, uint16_t, uint16_t, H1_2, 0, DO_ORR)
+DO_VPZ(sve_orv_s, uint32_t, uint32_t, uint32_t, H1_4, 0, DO_ORR)
+DO_VPZ_D(sve_orv_d, uint64_t, uint64_t, 0, DO_ORR)
+
+DO_VPZ(sve_eorv_b, uint8_t, uint8_t, uint8_t, H1, 0, DO_EOR)
+DO_VPZ(sve_eorv_h, uint16_t, uint16_t, uint16_t, H1_2, 0, DO_EOR)
+DO_VPZ(sve_eorv_s, uint32_t, uint32_t, uint32_t, H1_4, 0, DO_EOR)
+DO_VPZ_D(sve_eorv_d, uint64_t, uint64_t, 0, DO_EOR)
+
+DO_VPZ(sve_andv_b, uint8_t, uint8_t, uint8_t, H1, -1, DO_AND)
+DO_VPZ(sve_andv_h, uint16_t, uint16_t, uint16_t, H1_2, -1, DO_AND)
+DO_VPZ(sve_andv_s, uint32_t, uint32_t, uint32_t, H1_4, -1, DO_AND)
+DO_VPZ_D(sve_andv_d, uint64_t, uint64_t, -1, DO_AND)
+
+DO_VPZ(sve_saddv_b, int8_t, uint64_t, uint64_t, H1, 0, DO_ADD)
+DO_VPZ(sve_saddv_h, int16_t, uint64_t, uint64_t, H1_2, 0, DO_ADD)
+DO_VPZ(sve_saddv_s, int32_t, uint64_t, uint64_t, H1_4, 0, DO_ADD)
+
+DO_VPZ(sve_uaddv_b, uint8_t, uint64_t, uint64_t, H1, 0, DO_ADD)
+DO_VPZ(sve_uaddv_h, uint16_t, uint64_t, uint64_t, H1_2, 0, DO_ADD)
+DO_VPZ(sve_uaddv_s, uint32_t, uint64_t, uint64_t, H1_4, 0, DO_ADD)
+DO_VPZ_D(sve_uaddv_d, uint64_t, uint64_t, 0, DO_ADD)
+
+DO_VPZ(sve_smaxv_b, int8_t, int8_t, uint8_t, H1, INT8_MIN, DO_MAX)
+DO_VPZ(sve_smaxv_h, int16_t, int16_t, uint16_t, H1_2, INT16_MIN, DO_MAX)
+DO_VPZ(sve_smaxv_s, int32_t, int32_t, uint32_t, H1_4, INT32_MIN, DO_MAX)
+DO_VPZ_D(sve_smaxv_d, int64_t, int64_t, INT64_MIN, DO_MAX)
+
+DO_VPZ(sve_umaxv_b, uint8_t, uint8_t, uint8_t, H1, 0, DO_MAX)
+DO_VPZ(sve_umaxv_h, uint16_t, uint16_t, uint16_t, H1_2, 0, DO_MAX)
+DO_VPZ(sve_umaxv_s, uint32_t, uint32_t, uint32_t, H1_4, 0, DO_MAX)
+DO_VPZ_D(sve_umaxv_d, uint64_t, uint64_t, 0, DO_MAX)
+
+DO_VPZ(sve_sminv_b, int8_t, int8_t, uint8_t, H1, INT8_MAX, DO_MIN)
+DO_VPZ(sve_sminv_h, int16_t, int16_t, uint16_t, H1_2, INT16_MAX, DO_MIN)
+DO_VPZ(sve_sminv_s, int32_t, int32_t, uint32_t, H1_4, INT32_MAX, DO_MIN)
+DO_VPZ_D(sve_sminv_d, int64_t, int64_t, INT64_MAX, DO_MIN)
+
+DO_VPZ(sve_uminv_b, uint8_t, uint8_t, uint8_t, H1, -1, DO_MIN)
+DO_VPZ(sve_uminv_h, uint16_t, uint16_t, uint16_t, H1_2, -1, DO_MIN)
+DO_VPZ(sve_uminv_s, uint32_t, uint32_t, uint32_t, H1_4, -1, DO_MIN)
+DO_VPZ_D(sve_uminv_d, uint64_t, uint64_t, -1, DO_MIN)
+
+#undef DO_VPZ
+#undef DO_VPZ_D
+
+#undef DO_AND
+#undef DO_ORR
+#undef DO_EOR
+#undef DO_BIC
+#undef DO_ADD
+#undef DO_SUB
+#undef DO_MAX
+#undef DO_MIN
+#undef DO_ABD
+#undef DO_MUL
+#undef DO_DIV
+
 void HELPER(sve_ldr)(CPUARMState *env, void *d, target_ulong addr, uint32_t len)
 {
     intptr_t i, len_align = QEMU_ALIGN_DOWN(len, 8);
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index d8b34020bb..4abc66ba5f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -22,6 +22,7 @@
 #include "exec/exec-all.h"
 #include "tcg-op.h"
 #include "tcg-op-gvec.h"
+#include "tcg-gvec-desc.h"
 #include "qemu/log.h"
 #include "arm_ldst.h"
 #include "translate.h"
@@ -201,6 +202,69 @@ void trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
 
 #undef DO_ZPZZ
 
+typedef void gen_helper_gvec_reduc(TCGv_i64, TCGv_ptr, TCGv_ptr, TCGv_i32);
+static void do_vpz_ool(DisasContext *s, arg_rpr_esz *a,
+                       gen_helper_gvec_reduc *fn)
+{
+    unsigned vsz = size_for_gvec(vec_full_reg_size(s));
+    TCGv_i32 desc = tcg_const_i32(simd_desc(vsz, vsz, 0));
+    TCGv_i64 temp = tcg_temp_new_i64();
+    TCGv_ptr t_zn = tcg_temp_new_ptr();
+    TCGv_ptr t_pg = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(t_zn, cpu_env, vec_full_reg_offset(s, a->rn));
+    tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, a->pg));
+    fn(temp, t_zn, t_pg, desc);
+    tcg_temp_free_ptr(t_zn);
+    tcg_temp_free_ptr(t_pg);
+    tcg_temp_free_i32(desc);
+
+    write_fp_dreg(s, a->rd, temp);
+    tcg_temp_free_i64(temp);
+}
+
+#define DO_VPZ(NAME, name) \
+void trans_##NAME(DisasContext *s, arg_rpr_esz *a, uint32_t insn) \
+{                                                                        \
+    static gen_helper_gvec_reduc * const fns[4] = {                      \
+        gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,            \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,            \
+    };                                                                   \
+    do_vpz_ool(s, a, fns[a->esz]);                                       \
+}
+
+DO_VPZ(ORV, orv)
+DO_VPZ(ANDV, andv)
+DO_VPZ(EORV, eorv)
+
+DO_VPZ(UADDV, uaddv)
+DO_VPZ(SMAXV, smaxv)
+DO_VPZ(UMAXV, umaxv)
+DO_VPZ(SMINV, sminv)
+DO_VPZ(UMINV, uminv)
+
+void trans_SADDV(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    gen_helper_gvec_reduc *fn;
+    switch (a->esz) {
+    case 0:
+        fn = gen_helper_sve_saddv_b;
+        break;
+    case 1:
+        fn = gen_helper_sve_saddv_h;
+        break;
+    case 2:
+        fn = gen_helper_sve_saddv_s;
+        break;
+    default:
+        unallocated_encoding(s);
+        return;
+    };
+    do_vpz_ool(s, a, fn);
+}
+
+#undef DO_VPZ
+
 static uint64_t pred_esz_mask[4] = {
     0xffffffffffffffffull, 0x5555555555555555ull,
     0x1111111111111111ull, 0x0101010101010101ull
diff --git a/target/arm/sve.def b/target/arm/sve.def
index 3bb4faaf89..c26b1377e8 100644
--- a/target/arm/sve.def
+++ b/target/arm/sve.def
@@ -35,6 +35,7 @@
 
 &rri			rd rn imm
 &rrr_esz		rd rn rm esz
+&rpr_esz		rd pg rn esz
 &rprr_esz		rd pg rn rm esz
 &pred_set		rd pat esz i s
 
@@ -52,6 +53,9 @@
 @rdn_pg_rm_esz		........ esz:2 ... ... ... pg:3 rm:5 rd:5	&rprr_esz rn=%reg_movprfx
 @rdm_pg_rn_esz		........ esz:2 ... ... ... pg:3 rn:5 rd:5	&rprr_esz rm=%reg_movprfx
 
+# One register operand, with governing predicate, vector element size
+@rd_pg_rn_esz		........ esz:2 ... ... ... pg:3 rn:5 rd:5	&rpr_esz
+
 # Basic Load/Store with 9-bit immediate offset
 @pd_rn_i9		........ ........ ...... rn:5 . rd:4		&rri imm=%imm9_16_10
 @rd_rn_i9		........ ........ ...... rn:5 rd:5		&rri imm=%imm9_16_10
@@ -90,6 +94,24 @@ UDIV_zpzz		00000100 .. 010 101 000 ... ..... .....		@rdn_pg_rm_esz
 SDIV_zpzz		00000100 .. 010 110 000 ... ..... .....		@rdm_pg_rn_esz # SDIVR
 UDIV_zpzz		00000100 .. 010 111 000 ... ..... .....		@rdm_pg_rn_esz # UDIVR
 
+### SVE Integer Reduction Group
+
+# SVE bitwise logical reduction (predicated)
+ORV			00000100 .. 011 000 001 ... ..... .....		@rd_pg_rn_esz
+EORV			00000100 .. 011 001 001 ... ..... .....		@rd_pg_rn_esz
+ANDV			00000100 .. 011 010 001 ... ..... .....		@rd_pg_rn_esz
+
+# SVE integer add reduction (predicated)
+UADDV			00000100 .. 000 001 001 ... ..... .....		@rd_pg_rn_esz
+# Note that saddv requires size != 3, which is unallocated.
+SADDV			00000100 .. 000 000 001 ... ..... .....		@rd_pg_rn_esz
+
+# SVE integer min/max reduction (predicated)
+SMAXV			00000100 .. 001 000 001 ... ..... .....		@rd_pg_rn_esz
+UMAXV			00000100 .. 001 001 001 ... ..... .....		@rd_pg_rn_esz
+SMINV			00000100 .. 001 010 001 ... ..... .....		@rd_pg_rn_esz
+UMINV			00000100 .. 001 011 001 ... ..... .....		@rd_pg_rn_esz
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.14.3

