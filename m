Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp208468wme;
        Wed, 16 May 2018 15:41:07 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpmjO5xVS2j06XB2c7sW0EpOAc1m1cNHkR2anOV/y7qJJWJ76blYE0q8DX1QyyCcfQQfYRV
X-Received: by 2002:aed:2805:: with SMTP id r5-v6mr3148485qtd.28.1526510467628;
        Wed, 16 May 2018 15:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526510467; cv=none;
        d=google.com; s=arc-20160816;
        b=rJzCTXf3yjBVWN+cj5cYax+Nj12zdgLvACUDKQsInqL1g+a9hMS5l/c+KOVgYRaIY/
         kqlVRM3WzXnmYHiYnliwo7vXp17+4p/pDER/9olyM+tpnssEvl3BvW+llgfECUb3Xgrx
         ouGzIMFrffi0yes2nkzVL248qlnNmmXmO//HEipansQbTrqJKjRmcMpjEVGep+8ozYhz
         jJAkuM2wxugsOda2ypoFITANLh7XKLXj0Of+IlVKrz8+1ejJF4yA7uTckmSTN83f98v9
         vUfOtpKF+UIE1c4lQiyl17Qu/Qz1BM4ePs3kQ/B8NEswbmPQxSjFPfNvwNY2zxt2MeUE
         wHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=/VEy6LkfxsEGTRAmtCOV9nGa+of9Of/uJqK50rkNees=;
        b=bJYU9sIEOxd9W597jocN5LN/qKQFZXIksotuCbavcucQMTYvQ+/MpP4OC8cl+ySFcZ
         YZU5t/SD2W4JpJnr52FMhsX1DtPDMnDPMbRfeGLMzQMFHNSVflwpc1Oclcdg0n0+PLu9
         C9vS0KnEp9u6ZquahLHZvG2WtuLmhqhL/yj40mLYOwvrHlZ8V9GPSbOxTGSkQ0xYfoYy
         XGtOiSsFWEwfpDYIx6NFTOxtJZgWNjPrhhVv5k33SOrWVc2NFErTipuvb2z0bfRsWSwj
         g+FC+xywGUd+np3wIoI9EAvjR0TklyDVJolIQNqC7zGaAcbDJFAJocDErKr8Sugzo4Mu
         BC6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EWziYGYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o145-v6si1155178qke.297.2018.05.16.15.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EWziYGYf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44831 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ56Z-0007YV-1c
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:41:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41177)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wK-0007ip-HN
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4wH-0007Ua-SJ
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:32 -0400
Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233]:44080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4wH-0007To-FT
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:29 -0400
Received: by mail-pf0-x233.google.com with SMTP id q22-v6so1047642pff.11
	for <qemu-arm@nongnu.org>; Wed, 16 May 2018 15:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/VEy6LkfxsEGTRAmtCOV9nGa+of9Of/uJqK50rkNees=;
	b=EWziYGYfGOc0My+tlCibhpzlRRSnsOBGaBkFLTT4NO8+yCfOOWdbVZayMEeoqhwlOf
	OLdCJv+aDgMYdPpUezxsUWckrDm1mT1MpaGBYR5bV/Qk7mlkWsEAtna07G6wmBog5c0N
	GPw4fDX0EGVbw8lgLQXSXBt3XjXDq2AdtSoHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/VEy6LkfxsEGTRAmtCOV9nGa+of9Of/uJqK50rkNees=;
	b=qV5J6VYeqgAo3BEQ1h336y6Gtc8gIvcqj0x8LIz3j8B5tIyNA+YFl07dlHFjZaFWiw
	xDjdGw1B4y8Zcx+ST7/oBKWqznhyalW9tm08Wk4L9B2BzMkxGjetBLuFDuFhzxIVzHtc
	7fvB566DsKYNt/jfA9zVlU9Elbdv04vZ337awmi/zO4G+WEKtanETLnU1jlJtk1c4Acs
	V4hsyRVLCyDr+xudR9O2pq/QjaFIPf36D1EonLvc7YSJE9DmNkA8RObe12vOG7G782ka
	k8tFUeBMlHb9HOyjPiWWdRxdU3nkltq7b6vUXJRSBSVOx3JMi/HVWz8lT6TkLWKDJ+vQ
	SfFA==
X-Gm-Message-State: ALKqPwfZC/3rHAI68OcemWcYy0CPo80REEmbiAQ0ZF9Cd9LHgxXLIssh
	lf40FLgZJA/IdmSgi2ZVjyk46g==
X-Received: by 2002:a62:c413:: with SMTP id
	y19-v6mr2739127pff.97.1526509828330; 
	Wed, 16 May 2018 15:30:28 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:53 -0700
Message-Id: <20180516223007.10256-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180516223007.10256-1-richard.henderson@linaro.org>
References: <20180516223007.10256-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::233
Subject: [Qemu-arm] [PATCH v3-a 13/27] target/arm: Implement SVE Integer
 Arithmetic - Unary Predicated Group
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
X-TUID: dpUHarbVNVD+

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  60 ++++++++++++++++++
 target/arm/sve_helper.c    | 127 +++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 113 +++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  23 +++++++
 4 files changed, 323 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index d516580134..11644125d1 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -285,6 +285,66 @@ DEF_HELPER_FLAGS_4(sve_asrd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_asrd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_asrd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(sve_cls_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cls_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cls_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cls_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_clz_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_clz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_clz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_clz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_cnt_zpz_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cnt_zpz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cnt_zpz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cnt_zpz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_cnot_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cnot_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cnot_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_cnot_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_fabs_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_fabs_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_fabs_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_fneg_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_fneg_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_fneg_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_not_zpz_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_not_zpz_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_not_zpz_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_not_zpz_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_sxtb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_sxtb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_sxtb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_uxtb_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_uxtb_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_uxtb_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_sxth_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_sxth_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_uxth_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_uxth_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_sxtw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_uxtw_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_abs_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_abs_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_abs_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_abs_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(sve_neg_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_neg_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_neg_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(sve_neg_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_and_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_bic_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_eor_pppp, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index a5d12603e5..236d21e771 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -500,6 +500,133 @@ DO_ZPZW(sve_lsl_zpzw_s, uint32_t, uint64_t, H1_4, DO_LSL)
 
 #undef DO_ZPZW
 
+/* Fully general two-operand expander, controlled by a predicate.
+ */
+#define DO_ZPZ(NAME, TYPE, H, OP)                               \
+void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)  \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc);                      \
+    for (i = 0; i < opr_sz; ) {                                 \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));         \
+        do {                                                    \
+            if (pg & 1) {                                       \
+                TYPE nn = *(TYPE *)(vn + H(i));                 \
+                *(TYPE *)(vd + H(i)) = OP(nn);                  \
+            }                                                   \
+            i += sizeof(TYPE), pg >>= sizeof(TYPE);             \
+        } while (i & 15);                                       \
+    }                                                           \
+}
+
+/* Similarly, specialized for 64-bit operands.  */
+#define DO_ZPZ_D(NAME, TYPE, OP)                                \
+void HELPER(NAME)(void *vd, void *vn, void *vg, uint32_t desc)  \
+{                                                               \
+    intptr_t i, opr_sz = simd_oprsz(desc) / 8;                  \
+    TYPE *d = vd, *n = vn;                                      \
+    uint8_t *pg = vg;                                           \
+    for (i = 0; i < opr_sz; i += 1) {                           \
+        if (pg[H1(i)] & 1) {                                    \
+            TYPE nn = n[i];                                     \
+            d[i] = OP(nn);                                      \
+        }                                                       \
+    }                                                           \
+}
+
+#define DO_CLS_B(N)   (clrsb32(N) - 24)
+#define DO_CLS_H(N)   (clrsb32(N) - 16)
+
+DO_ZPZ(sve_cls_b, int8_t, H1, DO_CLS_B)
+DO_ZPZ(sve_cls_h, int16_t, H1_2, DO_CLS_H)
+DO_ZPZ(sve_cls_s, int32_t, H1_4, clrsb32)
+DO_ZPZ_D(sve_cls_d, int64_t, clrsb64)
+
+#define DO_CLZ_B(N)   (clz32(N) - 24)
+#define DO_CLZ_H(N)   (clz32(N) - 16)
+
+DO_ZPZ(sve_clz_b, uint8_t, H1, DO_CLZ_B)
+DO_ZPZ(sve_clz_h, uint16_t, H1_2, DO_CLZ_H)
+DO_ZPZ(sve_clz_s, uint32_t, H1_4, clz32)
+DO_ZPZ_D(sve_clz_d, uint64_t, clz64)
+
+DO_ZPZ(sve_cnt_zpz_b, uint8_t, H1, ctpop8)
+DO_ZPZ(sve_cnt_zpz_h, uint16_t, H1_2, ctpop16)
+DO_ZPZ(sve_cnt_zpz_s, uint32_t, H1_4, ctpop32)
+DO_ZPZ_D(sve_cnt_zpz_d, uint64_t, ctpop64)
+
+#define DO_CNOT(N)    (N == 0)
+
+DO_ZPZ(sve_cnot_b, uint8_t, H1, DO_CNOT)
+DO_ZPZ(sve_cnot_h, uint16_t, H1_2, DO_CNOT)
+DO_ZPZ(sve_cnot_s, uint32_t, H1_4, DO_CNOT)
+DO_ZPZ_D(sve_cnot_d, uint64_t, DO_CNOT)
+
+#define DO_FABS(N)    (N & ((__typeof(N))-1 >> 1))
+
+DO_ZPZ(sve_fabs_h, uint16_t, H1_2, DO_FABS)
+DO_ZPZ(sve_fabs_s, uint32_t, H1_4, DO_FABS)
+DO_ZPZ_D(sve_fabs_d, uint64_t, DO_FABS)
+
+#define DO_FNEG(N)    (N ^ ~((__typeof(N))-1 >> 1))
+
+DO_ZPZ(sve_fneg_h, uint16_t, H1_2, DO_FNEG)
+DO_ZPZ(sve_fneg_s, uint32_t, H1_4, DO_FNEG)
+DO_ZPZ_D(sve_fneg_d, uint64_t, DO_FNEG)
+
+#define DO_NOT(N)    (~N)
+
+DO_ZPZ(sve_not_zpz_b, uint8_t, H1, DO_NOT)
+DO_ZPZ(sve_not_zpz_h, uint16_t, H1_2, DO_NOT)
+DO_ZPZ(sve_not_zpz_s, uint32_t, H1_4, DO_NOT)
+DO_ZPZ_D(sve_not_zpz_d, uint64_t, DO_NOT)
+
+#define DO_SXTB(N)    ((int8_t)N)
+#define DO_SXTH(N)    ((int16_t)N)
+#define DO_SXTS(N)    ((int32_t)N)
+#define DO_UXTB(N)    ((uint8_t)N)
+#define DO_UXTH(N)    ((uint16_t)N)
+#define DO_UXTS(N)    ((uint32_t)N)
+
+DO_ZPZ(sve_sxtb_h, uint16_t, H1_2, DO_SXTB)
+DO_ZPZ(sve_sxtb_s, uint32_t, H1_4, DO_SXTB)
+DO_ZPZ(sve_sxth_s, uint32_t, H1_4, DO_SXTH)
+DO_ZPZ_D(sve_sxtb_d, uint64_t, DO_SXTB)
+DO_ZPZ_D(sve_sxth_d, uint64_t, DO_SXTH)
+DO_ZPZ_D(sve_sxtw_d, uint64_t, DO_SXTS)
+
+DO_ZPZ(sve_uxtb_h, uint16_t, H1_2, DO_UXTB)
+DO_ZPZ(sve_uxtb_s, uint32_t, H1_4, DO_UXTB)
+DO_ZPZ(sve_uxth_s, uint32_t, H1_4, DO_UXTH)
+DO_ZPZ_D(sve_uxtb_d, uint64_t, DO_UXTB)
+DO_ZPZ_D(sve_uxth_d, uint64_t, DO_UXTH)
+DO_ZPZ_D(sve_uxtw_d, uint64_t, DO_UXTS)
+
+#define DO_ABS(N)    (N < 0 ? -N : N)
+
+DO_ZPZ(sve_abs_b, int8_t, H1, DO_ABS)
+DO_ZPZ(sve_abs_h, int16_t, H1_2, DO_ABS)
+DO_ZPZ(sve_abs_s, int32_t, H1_4, DO_ABS)
+DO_ZPZ_D(sve_abs_d, int64_t, DO_ABS)
+
+#define DO_NEG(N)    (-N)
+
+DO_ZPZ(sve_neg_b, uint8_t, H1, DO_NEG)
+DO_ZPZ(sve_neg_h, uint16_t, H1_2, DO_NEG)
+DO_ZPZ(sve_neg_s, uint32_t, H1_4, DO_NEG)
+DO_ZPZ_D(sve_neg_d, uint64_t, DO_NEG)
+
+#undef DO_CLS_B
+#undef DO_CLS_H
+#undef DO_CLZ_B
+#undef DO_CLZ_H
+#undef DO_CNOT
+#undef DO_FABS
+#undef DO_FNEG
+#undef DO_ABS
+#undef DO_NEG
+#undef DO_ZPZ
+#undef DO_ZPZ_D
+
 /* Two-operand reduction expander, controlled by a predicate.
  * The difference between TYPERED and TYPERET has to do with
  * sign-extension.  E.g. for SMAX, TYPERED must be signed,
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 438df6359e..52f1b4dbf5 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -323,6 +323,119 @@ static bool trans_UDIV_zpzz(DisasContext *s, arg_rprr_esz *a, uint32_t insn)
 
 #undef DO_ZPZZ
 
+/*
+ *** SVE Integer Arithmetic - Unary Predicated Group
+ */
+
+static bool do_zpz_ool(DisasContext *s, arg_rpr_esz *a, gen_helper_gvec_3 *fn)
+{
+    if (fn == NULL) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           pred_full_reg_offset(s, a->pg),
+                           vsz, vsz, 0, fn);
+    }
+    return true;
+}
+
+#define DO_ZPZ(NAME, name) \
+static bool trans_##NAME(DisasContext *s, arg_rpr_esz *a, uint32_t insn) \
+{                                                                   \
+    static gen_helper_gvec_3 * const fns[4] = {                     \
+        gen_helper_sve_##name##_b, gen_helper_sve_##name##_h,       \
+        gen_helper_sve_##name##_s, gen_helper_sve_##name##_d,       \
+    };                                                              \
+    return do_zpz_ool(s, a, fns[a->esz]);                           \
+}
+
+DO_ZPZ(CLS, cls)
+DO_ZPZ(CLZ, clz)
+DO_ZPZ(CNT_zpz, cnt_zpz)
+DO_ZPZ(CNOT, cnot)
+DO_ZPZ(NOT_zpz, not_zpz)
+DO_ZPZ(ABS, abs)
+DO_ZPZ(NEG, neg)
+
+static bool trans_FABS(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL,
+        gen_helper_sve_fabs_h,
+        gen_helper_sve_fabs_s,
+        gen_helper_sve_fabs_d
+    };
+    return do_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_FNEG(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL,
+        gen_helper_sve_fneg_h,
+        gen_helper_sve_fneg_s,
+        gen_helper_sve_fneg_d
+    };
+    return do_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SXTB(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL,
+        gen_helper_sve_sxtb_h,
+        gen_helper_sve_sxtb_s,
+        gen_helper_sve_sxtb_d
+    };
+    return do_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_UXTB(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL,
+        gen_helper_sve_uxtb_h,
+        gen_helper_sve_uxtb_s,
+        gen_helper_sve_uxtb_d
+    };
+    return do_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SXTH(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL, NULL,
+        gen_helper_sve_sxth_s,
+        gen_helper_sve_sxth_d
+    };
+    return do_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_UXTH(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3 * const fns[4] = {
+        NULL, NULL,
+        gen_helper_sve_uxth_s,
+        gen_helper_sve_uxth_d
+    };
+    return do_zpz_ool(s, a, fns[a->esz]);
+}
+
+static bool trans_SXTW(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_sxtw_d : NULL);
+}
+
+static bool trans_UXTW(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ool(s, a, a->esz == 3 ? gen_helper_sve_uxtw_d : NULL);
+}
+
+#undef DO_ZPZ
+
 /*
  *** SVE Integer Reduction Group
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 1de289e55d..0ddc1e96be 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -163,6 +163,29 @@ ASR_zpzw        00000100 .. 011 000 100 ... ..... .....         @rdn_pg_rm
 LSR_zpzw        00000100 .. 011 001 100 ... ..... .....         @rdn_pg_rm
 LSL_zpzw        00000100 .. 011 011 100 ... ..... .....         @rdn_pg_rm
 
+### SVE Integer Arithmetic - Unary Predicated Group
+
+# SVE unary bit operations (predicated)
+# Note esz != 0 for FABS and FNEG.
+CLS             00000100 .. 011 000 101 ... ..... .....         @rd_pg_rn
+CLZ             00000100 .. 011 001 101 ... ..... .....         @rd_pg_rn
+CNT_zpz         00000100 .. 011 010 101 ... ..... .....         @rd_pg_rn
+CNOT            00000100 .. 011 011 101 ... ..... .....         @rd_pg_rn
+NOT_zpz         00000100 .. 011 110 101 ... ..... .....         @rd_pg_rn
+FABS            00000100 .. 011 100 101 ... ..... .....         @rd_pg_rn
+FNEG            00000100 .. 011 101 101 ... ..... .....         @rd_pg_rn
+
+# SVE integer unary operations (predicated)
+# Note esz > original size for extensions.
+ABS             00000100 .. 010 110 101 ... ..... .....         @rd_pg_rn
+NEG             00000100 .. 010 111 101 ... ..... .....         @rd_pg_rn
+SXTB            00000100 .. 010 000 101 ... ..... .....         @rd_pg_rn
+UXTB            00000100 .. 010 001 101 ... ..... .....         @rd_pg_rn
+SXTH            00000100 .. 010 010 101 ... ..... .....         @rd_pg_rn
+UXTH            00000100 .. 010 011 101 ... ..... .....         @rd_pg_rn
+SXTW            00000100 .. 010 100 101 ... ..... .....         @rd_pg_rn
+UXTW            00000100 .. 010 101 101 ... ..... .....         @rd_pg_rn
+
 ### SVE Logical - Unpredicated Group
 
 # SVE bitwise logical operations (unpredicated)
-- 
2.17.0

