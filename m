Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5786506wrq;
        Tue, 26 Jun 2018 22:00:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfW3m1RgsCN3ANAVCfHu+L2mdvZ2mU3gPq2NQRqM3GlpFJHs6DPOxeYPzMXo13Dp6m8rwdd
X-Received: by 2002:aed:38a9:: with SMTP id k38-v6mr3988779qte.30.1530075635296;
        Tue, 26 Jun 2018 22:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530075635; cv=none;
        d=google.com; s=arc-20160816;
        b=nMSAZSgQkOuOUxuAb7772aVGzYfyt59bYT6iJyc1KDW+7NHNUig1wAYU7BotVZ9G+3
         MQbTnu55fkPzEiQ68VPWe5xwbTUqg1Er+KMTw6ouGkKCImbD7GQuEQjTUnDkyOIReYzn
         4ddlxJBEKPMJk9Eem2nmJqeW1YeHRFsanzlMM/LlyFJlyHwExsupwVNPG8ZsoQgg7x9y
         DhXoPys1VbO6cbUuhdmbcpbSMTEvAgbcWA9lDBEP6NkC2s2bIyoibyn5SR9XZcv1P17u
         tN8Ug+zAIwbmOIGLNiqgYuRRZ+MKetO2Q6suuSFJSWUJqvvz4mxliltA6hs4qUSlH/xG
         f5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=m8EeR13dv640yuyK0rXXtqtq5xr8hnRzuIVWIpMzTzs=;
        b=AH1sRw66dX3FSqtlg8EZTFK/tmhnip3gu8alfoKqB29kxBEdesd7jm3BhXQ5d5Hy0L
         1W0rPn+m9XTUyKUIr8W0Z1kq3mb2mWRc2HlFkvuhkzLVh8TwjYjgKIvVpNhbdHgpH61s
         CW9k8WTZz5vfRRIvgdS1w9kYA4w4pEFClnZEpA6w9Py228/aD1EBRqxKs61h4CVdGEk/
         YUMNESTsr2QeudsfT1qTcEkcmpyFJfiPXXRxbs+HesU9j5lZgdCfF2vRB9yNdxPwc+T5
         e3BQqvcf+AbIItO/qx2yNLmYdbmKtTx6Qz1z7yV++An0x60cK97FZIs2jZai0FdObkzT
         1Zlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="bo4xU/2m";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q67-v6si3109310qkf.96.2018.06.26.22.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 22:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="bo4xU/2m";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2ZG-0000cg-NN
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 01:00:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29g-0004XW-C1
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29e-0000sr-Ik
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:08 -0400
Received: from mail-pl0-x22d.google.com ([2607:f8b0:400e:c01::22d]:43435)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29e-0000rX-9o
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:06 -0400
Received: by mail-pl0-x22d.google.com with SMTP id c41-v6so408586plj.10
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 21:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=m8EeR13dv640yuyK0rXXtqtq5xr8hnRzuIVWIpMzTzs=;
	b=bo4xU/2m3rutKw1oxt+RpVEDQ0EJbQ/ngm2n+vUodzWYhgPZT5nVW9hEgCGgstsZZD
	OY5dq8IlRvc8ijj8Y+98k6LYqr99d1UVLOJvsQj7MKJYr7229VRTt280o2PyW1iwidB5
	zguhdnB2saDa103+GW1QsdszQ1yyTpkZoy8Cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=m8EeR13dv640yuyK0rXXtqtq5xr8hnRzuIVWIpMzTzs=;
	b=dK/gCWLZa9cQWGZWGki8tYXp9XphEIrPHObVcLb+sAo3YPPuEaITAgXo8vxh0UQ9/4
	7wRQe9wu1Adc30d2v4ne1g26aUux+QxOA6/uiEtS/jfUtru2Rq+Aqbyx4Odo+3rbHUWx
	eKYTX8Pva6dwkPH1TwnO+tr2tYQtTIQ4cSKygDXytR6ECuNAVqaxCDVcUOaDfBKaNVBV
	lmVi2kvG1huHyYGY2zomCZxuutNBMeQko0OkXP+zWphNpupj0MS9gtgb2vB24YdcQTRM
	D4FJAH6/STVZTNxJ631VbObTgwsVH4NJMJDRZSi8wK2ZtRqJf2LhjosdDMoLkn1sjqoM
	f4fg==
X-Gm-Message-State: APt69E09PDO2B7xkXzE2YJ3/gHOdMBikrZ/pMs3a7ZKoX82dSNGnvUFF
	+k6shts3F3ngUL2Y4hiVqvKdwSSg8l8=
X-Received: by 2002:a17:902:1566:: with SMTP id
	b35-v6mr4486419plh.107.1530074044958; 
	Tue, 26 Jun 2018 21:34:04 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:17 -0700
Message-Id: <20180627043328.11531-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22d
Subject: [Qemu-devel] [PATCH v6 24/35] target/arm: Implement SVE
 floating-point convert to integer
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
X-TUID: dXecqm9Y+em5

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 30 +++++++++++++
 target/arm/helper.h        | 12 +++---
 target/arm/helper.c        |  2 +-
 target/arm/sve_helper.c    | 88 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 70 ++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 16 +++++++
 6 files changed, 211 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 4c379dbb05..37fa9eb9bb 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -955,6 +955,36 @@ DEF_HELPER_FLAGS_5(sve_fcvt_hd, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_fcvt_sd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_fcvtzs_hh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzs_hs, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzs_ss, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzs_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzs_hd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzs_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzs_dd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_fcvtzu_hh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzu_hs, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzu_ss, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzu_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzu_hd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzu_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvtzu_dd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_scvt_hh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_scvt_sh, TCG_CALL_NO_RWG,
diff --git a/target/arm/helper.h b/target/arm/helper.h
index ad9cb6c7d5..8607077dda 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -134,12 +134,12 @@ DEF_HELPER_2(vfp_touid, i32, f64, ptr)
 DEF_HELPER_2(vfp_touizh, i32, f16, ptr)
 DEF_HELPER_2(vfp_touizs, i32, f32, ptr)
 DEF_HELPER_2(vfp_touizd, i32, f64, ptr)
-DEF_HELPER_2(vfp_tosih, i32, f16, ptr)
-DEF_HELPER_2(vfp_tosis, i32, f32, ptr)
-DEF_HELPER_2(vfp_tosid, i32, f64, ptr)
-DEF_HELPER_2(vfp_tosizh, i32, f16, ptr)
-DEF_HELPER_2(vfp_tosizs, i32, f32, ptr)
-DEF_HELPER_2(vfp_tosizd, i32, f64, ptr)
+DEF_HELPER_2(vfp_tosih, s32, f16, ptr)
+DEF_HELPER_2(vfp_tosis, s32, f32, ptr)
+DEF_HELPER_2(vfp_tosid, s32, f64, ptr)
+DEF_HELPER_2(vfp_tosizh, s32, f16, ptr)
+DEF_HELPER_2(vfp_tosizs, s32, f32, ptr)
+DEF_HELPER_2(vfp_tosizd, s32, f64, ptr)
 
 DEF_HELPER_3(vfp_toshs_round_to_zero, i32, f32, i32, ptr)
 DEF_HELPER_3(vfp_tosls_round_to_zero, i32, f32, i32, ptr)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1248d84e6f..a36f5b1899 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11360,7 +11360,7 @@ ftype HELPER(name)(uint32_t x, void *fpstp)                         \
 }
 
 #define CONV_FTOI(name, ftype, fsz, sign, round)                \
-uint32_t HELPER(name)(ftype x, void *fpstp)                     \
+sign##int32_t HELPER(name)(ftype x, void *fpstp)                \
 {                                                               \
     float_status *fpst = fpstp;                                 \
     if (float##fsz##_is_any_nan(x)) {                           \
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 4b36c1eecf..b6421ec19c 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3195,6 +3195,78 @@ static inline float16 sve_f64_to_f16(float64 f, float_status *fpst)
     return ret;
 }
 
+static inline int16_t vfp_float16_to_int16_rtz(float16 f, float_status *s)
+{
+    if (float16_is_any_nan(f)) {
+        float_raise(float_flag_invalid, s);
+        return 0;
+    }
+    return float16_to_int16_round_to_zero(f, s);
+}
+
+static inline int64_t vfp_float16_to_int64_rtz(float16 f, float_status *s)
+{
+    if (float16_is_any_nan(f)) {
+        float_raise(float_flag_invalid, s);
+        return 0;
+    }
+    return float16_to_int64_round_to_zero(f, s);
+}
+
+static inline int64_t vfp_float32_to_int64_rtz(float32 f, float_status *s)
+{
+    if (float32_is_any_nan(f)) {
+        float_raise(float_flag_invalid, s);
+        return 0;
+    }
+    return float32_to_int64_round_to_zero(f, s);
+}
+
+static inline int64_t vfp_float64_to_int64_rtz(float64 f, float_status *s)
+{
+    if (float64_is_any_nan(f)) {
+        float_raise(float_flag_invalid, s);
+        return 0;
+    }
+    return float64_to_int64_round_to_zero(f, s);
+}
+
+static inline uint16_t vfp_float16_to_uint16_rtz(float16 f, float_status *s)
+{
+    if (float16_is_any_nan(f)) {
+        float_raise(float_flag_invalid, s);
+        return 0;
+    }
+    return float16_to_uint16_round_to_zero(f, s);
+}
+
+static inline uint64_t vfp_float16_to_uint64_rtz(float16 f, float_status *s)
+{
+    if (float16_is_any_nan(f)) {
+        float_raise(float_flag_invalid, s);
+        return 0;
+    }
+    return float16_to_uint64_round_to_zero(f, s);
+}
+
+static inline uint64_t vfp_float32_to_uint64_rtz(float32 f, float_status *s)
+{
+    if (float32_is_any_nan(f)) {
+        float_raise(float_flag_invalid, s);
+        return 0;
+    }
+    return float32_to_uint64_round_to_zero(f, s);
+}
+
+static inline uint64_t vfp_float64_to_uint64_rtz(float64 f, float_status *s)
+{
+    if (float64_is_any_nan(f)) {
+        float_raise(float_flag_invalid, s);
+        return 0;
+    }
+    return float64_to_uint64_round_to_zero(f, s);
+}
+
 DO_ZPZ_FP(sve_fcvt_sh, uint32_t, H1_4, sve_f32_to_f16)
 DO_ZPZ_FP(sve_fcvt_hs, uint32_t, H1_4, sve_f16_to_f32)
 DO_ZPZ_FP(sve_fcvt_dh, uint64_t,     , sve_f64_to_f16)
@@ -3202,6 +3274,22 @@ DO_ZPZ_FP(sve_fcvt_hd, uint64_t,     , sve_f16_to_f64)
 DO_ZPZ_FP(sve_fcvt_ds, uint64_t,     , float64_to_float32)
 DO_ZPZ_FP(sve_fcvt_sd, uint64_t,     , float32_to_float64)
 
+DO_ZPZ_FP(sve_fcvtzs_hh, uint16_t, H1_2, vfp_float16_to_int16_rtz)
+DO_ZPZ_FP(sve_fcvtzs_hs, uint32_t, H1_4, helper_vfp_tosizh)
+DO_ZPZ_FP(sve_fcvtzs_ss, uint32_t, H1_4, helper_vfp_tosizs)
+DO_ZPZ_FP(sve_fcvtzs_hd, uint64_t,     , vfp_float16_to_int64_rtz)
+DO_ZPZ_FP(sve_fcvtzs_sd, uint64_t,     , vfp_float32_to_int64_rtz)
+DO_ZPZ_FP(sve_fcvtzs_ds, uint64_t,     , helper_vfp_tosizd)
+DO_ZPZ_FP(sve_fcvtzs_dd, uint64_t,     , vfp_float64_to_int64_rtz)
+
+DO_ZPZ_FP(sve_fcvtzu_hh, uint16_t, H1_2, vfp_float16_to_uint16_rtz)
+DO_ZPZ_FP(sve_fcvtzu_hs, uint32_t, H1_4, helper_vfp_touizh)
+DO_ZPZ_FP(sve_fcvtzu_ss, uint32_t, H1_4, helper_vfp_touizs)
+DO_ZPZ_FP(sve_fcvtzu_hd, uint64_t,     , vfp_float16_to_uint64_rtz)
+DO_ZPZ_FP(sve_fcvtzu_sd, uint64_t,     , vfp_float32_to_uint64_rtz)
+DO_ZPZ_FP(sve_fcvtzu_ds, uint64_t,     , helper_vfp_touizd)
+DO_ZPZ_FP(sve_fcvtzu_dd, uint64_t,     , vfp_float64_to_uint64_rtz)
+
 DO_ZPZ_FP(sve_scvt_hh, uint16_t, H1_2, int16_to_float16)
 DO_ZPZ_FP(sve_scvt_sh, uint32_t, H1_4, int32_to_float16)
 DO_ZPZ_FP(sve_scvt_ss, uint32_t, H1_4, int32_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 37ad1c9459..be589a1cf2 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3970,6 +3970,76 @@ static bool trans_FCVT_sd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_sd);
 }
 
+static bool trans_FCVTZS_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzs_hh);
+}
+
+static bool trans_FCVTZU_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzu_hh);
+}
+
+static bool trans_FCVTZS_hs(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzs_hs);
+}
+
+static bool trans_FCVTZU_hs(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzu_hs);
+}
+
+static bool trans_FCVTZS_hd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzs_hd);
+}
+
+static bool trans_FCVTZU_hd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvtzu_hd);
+}
+
+static bool trans_FCVTZS_ss(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_ss);
+}
+
+static bool trans_FCVTZU_ss(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_ss);
+}
+
+static bool trans_FCVTZS_sd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_sd);
+}
+
+static bool trans_FCVTZU_sd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_sd);
+}
+
+static bool trans_FCVTZS_ds(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_ds);
+}
+
+static bool trans_FCVTZU_ds(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_ds);
+}
+
+static bool trans_FCVTZS_dd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzs_dd);
+}
+
+static bool trans_FCVTZU_dd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_dd);
+}
+
 static bool trans_SCVTF_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
 {
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_hh);
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 18c174e92d..ddfb5316c9 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -829,6 +829,22 @@ FCVT_hd         01100101 11 0010 01 101 ... ..... .....         @rd_pg_rn_e0
 FCVT_ds         01100101 11 0010 10 101 ... ..... .....         @rd_pg_rn_e0
 FCVT_sd         01100101 11 0010 11 101 ... ..... .....         @rd_pg_rn_e0
 
+# SVE floating-point convert to integer
+FCVTZS_hh       01100101 01 011 01 0 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_hh       01100101 01 011 01 1 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZS_hs       01100101 01 011 10 0 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_hs       01100101 01 011 10 1 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZS_hd       01100101 01 011 11 0 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_hd       01100101 01 011 11 1 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZS_ss       01100101 10 011 10 0 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_ss       01100101 10 011 10 1 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZS_ds       01100101 11 011 00 0 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_ds       01100101 11 011 00 1 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZS_sd       01100101 11 011 10 0 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_sd       01100101 11 011 10 1 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZS_dd       01100101 11 011 11 0 101 ... ..... .....        @rd_pg_rn_e0
+FCVTZU_dd       01100101 11 011 11 1 101 ... ..... .....        @rd_pg_rn_e0
+
 # SVE integer convert to floating-point
 SCVTF_hh        01100101 01 010 01 0 101 ... ..... .....        @rd_pg_rn_e0
 SCVTF_sh        01100101 01 010 10 0 101 ... ..... .....        @rd_pg_rn_e0
-- 
2.17.1

