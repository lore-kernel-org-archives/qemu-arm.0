Received: by 10.28.71.27 with SMTP id u27csp2103233wma;
        Sat, 17 Feb 2018 11:11:18 -0800 (PST)
X-Google-Smtp-Source: AH8x2278UCJK4aYVH1E7gQBWq6Re7eNKnZ1dgkeMeqp0OS00Ms60tiZDXfFAKstVVx2S3ze6M9jd
X-Received: by 10.13.203.150 with SMTP id n144mr7408281ywd.39.1518894678598;
        Sat, 17 Feb 2018 11:11:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894678; cv=none;
        d=google.com; s=arc-20160816;
        b=HcV04qIh7LqiN60VACdJ+QRCRwWkdJcXbJU7k1fGeDCtY46gnDwqfvZ3GN+8E1dWS8
         mRDqttrpJrWKCs1fubTT7zX5Ci/COLVTv926CN+WcCZ2/0FDJMLQ7J8MN+LXrs+xNc5D
         fRg1mu5jk+5SdAUoIxIVIO5e3gKkJ2Lblq9Js7w9Tu+zkNmgtUd6J4cNKYw00wdH1Req
         wSbpSFtyl5plzTwgNDhMmhGlh9e6KYD/nPdnU9dLotgPZxtxuZxz/iP8xrbefaM5NyLx
         DZmKoupVRfqFdc3F2AIwdkGQ0uv61Ej9SvCfuYFm4OjX4FLKkpDU7lxxv2gR4arW0t1E
         I4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Y10V3pA5jyYqp4BAV4fenO1hcQGPIHd6qQBTl6wUr7o=;
        b=vgW/6iNuPservpzpLHxN+sgtVz4FGlC+nPZIlwlHXEfbua9y2b4o0gRUCjgb6cETYc
         Gw2kS51Pz7zq7cc9KKjDTJgQIOg5Wjr07IrNW9zmK09vy8cr0S980+ZoFaT/xyxYXXWh
         N2ijmgY21UcVIH9Qy37DN1HSWMOZeuqfXYOvC6EiQERtk1bSHbt3nNhCrxCtiHi5KktR
         QWMb19c1m98VrjoHK0QRuxERV6QXEoKxfOoYTrE/J7gMZGQVJtkgSYUVIMZUr/Ii7KNc
         WhzlsEoqcNdsxQGvITpNfVXbjnB3ZtmTRMHqq4tzVN7JcrkAxsRss/uj6r1EoNeyWM0p
         IYhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T1NMf67a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w9si1920450ybw.104.2018.02.17.11.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:11:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T1NMf67a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7tG-0006y5-0R
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:11:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AX-0001rI-Po
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:25:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AW-0002GE-Lm
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:25:05 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:39714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AW-0002Fn-EL
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:25:04 -0500
Received: by mail-pg0-x242.google.com with SMTP id w17so4356674pgv.6
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y10V3pA5jyYqp4BAV4fenO1hcQGPIHd6qQBTl6wUr7o=;
	b=T1NMf67azn3fAUVZXhEEHvirBgKsZtqgLkp4xA2p64VZK5oFjoE/qWbosH8wFg+dQu
	wYQ4xbhj4wNJmZbmLSCPRRqBaAcHSqs0y3krBTstMM7Ulr3FRuAMWTn3a8c9484UpP9k
	lUBa614cysd4+gA+R4z7su4ga9vnHbO2dcG1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y10V3pA5jyYqp4BAV4fenO1hcQGPIHd6qQBTl6wUr7o=;
	b=BHmYTinzCQkW/gl3TdeUomosOaJseChKjd5VPSeKRUSrNzCqzOOlO6yh3+E1cRf9nd
	yGPFxndHKPsSKf77FkAQZ9ip+BsV3j75qM+wYFJJBxVxD4Dn9hRTjj4TtVAGBfce/6Wz
	TcvKAhLWPVVZlQCcnux40gARzmXjGIJe7TrfjTTP6wyd2b18nvlNXxjaXTiN2Ay/cZAM
	vWqJc1vJGXVEweOaqG2j7utP38rHUXGbO8YkcCMwBm+ScbkfAHX8o8sf9pxw3aaFqvWD
	RiVX4Q+dWOuKoU5AHJMogA10WlDKx+QrOkKadWXMDfpH8zwE02M0Fo68LACHaXFlpImE
	CUfQ==
X-Gm-Message-State: APf1xPC3tPW2KnNzXfGYJ+LSe6uc277BYWEwbyQJoGbOsErzLKgS8KvS
	+J+8o+iL1W1dVZj0/40IlpPHQSmKxwk=
X-Received: by 10.99.114.86 with SMTP id c22mr8198570pgn.41.1518891903201;
	Sat, 17 Feb 2018 10:25:03 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.25.01
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:25:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:17 -0800
Message-Id: <20180217182323.25885-62-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-devel] [PATCH v2 61/67] target/arm: Implement SVE Floating
 Point Unary Operations - Unpredicated Group
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
X-TUID: wVJxbREBYd1u

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.h        |  8 ++++++++
 target/arm/translate-sve.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    | 20 ++++++++++++++++++++
 target/arm/sve.decode      |  5 +++++
 4 files changed, 76 insertions(+)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index a8d824b085..4bfefe42b2 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -565,6 +565,14 @@ DEF_HELPER_2(dc_zva, void, env, i64)
 DEF_HELPER_FLAGS_2(neon_pmull_64_lo, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 DEF_HELPER_FLAGS_2(neon_pmull_64_hi, TCG_CALL_NO_RWG_SE, i64, i64, i64)
 
+DEF_HELPER_FLAGS_4(gvec_frecpe_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_frecpe_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_frecpe_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_4(gvec_frsqrte_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_frsqrte_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_frsqrte_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(gvec_fadd_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fadd_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(gvec_fadd_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a77ddf0f4b..463ff7b690 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3235,6 +3235,49 @@ DO_VPZ(FMAXNMV, fmaxnmv)
 DO_VPZ(FMINV, fminv)
 DO_VPZ(FMAXV, fmaxv)
 
+/*
+ *** SVE Floating Point Unary Operations - Unpredicated Group
+ */
+
+static void do_zz_fp(DisasContext *s, arg_rr_esz *a, gen_helper_gvec_2_ptr *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+
+    tcg_gen_gvec_2_ptr(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       status, vsz, vsz, 0, fn);
+    tcg_temp_free_ptr(status);
+}
+
+static void trans_FRECPE(DisasContext *s, arg_rr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_2_ptr * const fns[3] = {
+        gen_helper_gvec_frecpe_h,
+        gen_helper_gvec_frecpe_s,
+        gen_helper_gvec_frecpe_d,
+    };
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+    } else {
+        do_zz_fp(s, a, fns[a->esz - 1]);
+    }
+}
+
+static void trans_FRSQRTE(DisasContext *s, arg_rr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_2_ptr * const fns[3] = {
+        gen_helper_gvec_frsqrte_h,
+        gen_helper_gvec_frsqrte_s,
+        gen_helper_gvec_frsqrte_d,
+    };
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+    } else {
+        do_zz_fp(s, a, fns[a->esz - 1]);
+    }
+}
+
 /*
  *** SVE Floating Point Accumulating Reduction Group
  */
diff --git a/target/arm/vec_helper.c b/target/arm/vec_helper.c
index e711a3217d..60dc07cf87 100644
--- a/target/arm/vec_helper.c
+++ b/target/arm/vec_helper.c
@@ -40,6 +40,26 @@
 #define H4(x)   (x)
 #endif
 
+#define DO_2OP(NAME, FUNC, TYPE) \
+void HELPER(NAME)(void *vd, void *vn, void *stat, uint32_t desc)  \
+{                                                                 \
+    intptr_t i, oprsz = simd_oprsz(desc);                         \
+    TYPE *d = vd, *n = vn;                                        \
+    for (i = 0; i < oprsz / sizeof(TYPE); i++) {                  \
+        d[i] = FUNC(n[i], stat);                                  \
+    }                                                             \
+}
+
+DO_2OP(gvec_frecpe_h, helper_recpe_f16, float16)
+DO_2OP(gvec_frecpe_s, helper_recpe_f32, float32)
+DO_2OP(gvec_frecpe_d, helper_recpe_f64, float64)
+
+DO_2OP(gvec_frsqrte_h, helper_rsqrte_f16, float16)
+DO_2OP(gvec_frsqrte_s, helper_rsqrte_f32, float32)
+DO_2OP(gvec_frsqrte_d, helper_rsqrte_f64, float64)
+
+#undef DO_2OP
+
 /* Floating-point trigonometric starting value.
  * See the ARM ARM pseudocode function FPTrigSMul.
  */
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index feb8c65e89..112e85174c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -747,6 +747,11 @@ FMINNMV		01100101 .. 000 101 001 ... ..... .....		@rd_pg_rn
 FMAXV		01100101 .. 000 110 001 ... ..... .....		@rd_pg_rn
 FMINV		01100101 .. 000 111 001 ... ..... .....		@rd_pg_rn
 
+## SVE Floating Point Unary Operations - Unpredicated Group
+
+FRECPE		01100101 .. 001 110 001110 ..... .....		@rd_rn
+FRSQRTE		01100101 .. 001 111 001110 ..... .....		@rd_rn
+
 ### SVE FP Accumulating Reduction Group
 
 # SVE floating-point serial reduction (predicated)
-- 
2.14.3

