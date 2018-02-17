Received: by 10.28.71.27 with SMTP id u27csp2101960wma;
        Sat, 17 Feb 2018 11:09:27 -0800 (PST)
X-Google-Smtp-Source: AH8x2256oJ1+TOrfwxLj1H/hV/4ivO3PEPLeKQliiB+E6/eGinCj1GenoFKfE5SL+qKy3ujC5tNz
X-Received: by 10.37.119.6 with SMTP id s6mr7236484ybc.53.1518894567440;
        Sat, 17 Feb 2018 11:09:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894567; cv=none;
        d=google.com; s=arc-20160816;
        b=miHPXz2NkDo8Szou0jgE0P0WD5ZvyR4rzyI4XGVtWi9C7yn53TrBGWKNQccuI41Lhe
         YHUXPIb/GNwtrb1sWT4mxt5KRx3qaKfb9OzeGnDxWThM79LLWa8bRAKpy1Kx7MdZyZDo
         FtFMER3UN3yVZFfuI3ni3xx1818Y/H3o4uFEjolQeDis1PUsJ7R375yKWIB7J+LaWNSO
         ZFiyq78RF8Nr0Hm8aKEvFIujSznOCV8QksCgTC5wM9CLtKwMHkRWnHtftonbkedw8OOA
         lYFk6efuhj7by1qPpr/0eMV+XnXK8N5L8aAFhlqdV3et93eRAsVyYrekhBNKK8R4WslG
         s8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=/pW1zgtuWTJfjGKD3YWxaK5UQ0fE+1tL0T5+VXhGEbA=;
        b=kr5fQDme093dD6nYsiAz7/PwKIYnU9kWBvM0cYayzocYcxBA8V6sAYd8Cv9zLM5215
         KBqhPOtHn1a0B39ekEFEnfiVCmb59OAkSdZ0hOT9c5yCCYVnEWP5nU2uZz/pdm2FCl9U
         UvC1uZQx01WQAePrq/f2UVjc7SH+DKHWhOmz9eb+IaH8ughcy5tucfGXynTy9WOXtrha
         k8EsOIvM7mLZjKWXdNaesTDIpYt33DGSj0gR4nbe9Zdj5kVOsWUVQxXp3qEZtLocs+yL
         po4zNvJWP5CQZTbRnZvD5omIqDkodjsDbWnVSbSM4g6UZvVjSjFVCCv6V8X6ePADl/s5
         aHtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KD3mFwNu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 5si232884ybv.578.2018.02.17.11.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:09:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KD3mFwNu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7rS-00052r-N9
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:09:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7Ae-00021V-N4
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:25:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7Ad-0002Li-8S
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:25:12 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:46094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7Ad-0002L6-1b
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:25:11 -0500
Received: by mail-pg0-x243.google.com with SMTP id m1so262275pgp.13
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/pW1zgtuWTJfjGKD3YWxaK5UQ0fE+1tL0T5+VXhGEbA=;
	b=KD3mFwNuu0Wh5YtxIVHjM+iS1Dq7EM4MN/PnNHEUVpr1exml7OMtKF6sfATjkMwoym
	mZNtfX/P4RPWuJ7rVnnfO8rXiDgo2i8fJIt6fcNWZUfn2lDMniMH4bK/68xARR53osVB
	neelp2qsTMXks/J2JYWi2qkgcP/n0d7IwCd6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/pW1zgtuWTJfjGKD3YWxaK5UQ0fE+1tL0T5+VXhGEbA=;
	b=jIM0kKuiVqV1cSBzp6yOF28LQNX7yfiNkSRTGn32qKVvwO9UdJhAV7KE1051rSDA5T
	7Y07Ok5BSdGxwNPquFx1pcyjhzwDq6Jaoss3ZrPABgdys0it4RQiPdMZ41JjjZT4CG1s
	S+nv/uUBkMjlUNblSv0ADzAzWpt9jjvd6iXs7K3Ejf4c5imjB0TNDULSp9SQ3YHKZc3b
	pcFY0KZ7hT+qrex62yflTktIl4/jltb6UraQexrWjlGvcFbP7p884rZb0o4pd5+8GmQv
	EyiMhT53ncT4f8b0uRisYG/2LN7vVhfARUjCegllrax3E8npR6Xn1tsMB+Vp6loanPQO
	INcA==
X-Gm-Message-State: APf1xPBAOxmpqrizaSSsR/dM5jgyW7VW24DbRpWNYhlezRVYug3PH/qP
	3hdJZEIW2qA77kXVdw67Sc2VwDUf/XA=
X-Received: by 10.98.67.68 with SMTP id q65mr9808636pfa.129.1518891909777;
	Sat, 17 Feb 2018 10:25:09 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.25.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:25:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:20 -0800
Message-Id: <20180217182323.25885-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH v2 64/67] target/arm: Implement SVE
 floating-point convert precision
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
X-TUID: FQGx8VyhArbw

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 13 +++++++++++++
 target/arm/sve_helper.c    | 27 +++++++++++++++++++++++++++
 target/arm/translate-sve.c | 30 ++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  8 ++++++++
 4 files changed, 78 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index ce5fe24dc2..bac4bfdc60 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -942,6 +942,19 @@ DEF_HELPER_FLAGS_6(sve_fmins_s, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_6(sve_fmins_d, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, i64, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_fcvt_sh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvt_dh, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvt_hs, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvt_ds, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvt_hd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_fcvt_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_scvt_hh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_scvt_sh, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 53e3516f47..9db01ac2f2 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3157,6 +3157,33 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc) \
     }                                                           \
 }
 
+static inline float32 float16_to_float32_ieee(float16 f, float_status *s)
+{
+    return float16_to_float32(f, true, s);
+}
+
+static inline float64 float16_to_float64_ieee(float16 f, float_status *s)
+{
+    return float16_to_float64(f, true, s);
+}
+
+static inline float16 float32_to_float16_ieee(float32 f, float_status *s)
+{
+    return float32_to_float16(f, true, s);
+}
+
+static inline float16 float64_to_float16_ieee(float64 f, float_status *s)
+{
+    return float64_to_float16(f, true, s);
+}
+
+DO_ZPZ_FP(sve_fcvt_sh, uint32_t, H1_4, float32_to_float16_ieee)
+DO_ZPZ_FP(sve_fcvt_hs, uint32_t, H1_4, float16_to_float32_ieee)
+DO_ZPZ_FP_D(sve_fcvt_dh, uint64_t, float64_to_float16_ieee)
+DO_ZPZ_FP_D(sve_fcvt_hd, uint64_t, float16_to_float64_ieee)
+DO_ZPZ_FP_D(sve_fcvt_ds, uint64_t, float64_to_float32)
+DO_ZPZ_FP_D(sve_fcvt_sd, uint64_t, float32_to_float64)
+
 DO_ZPZ_FP(sve_scvt_hh, uint16_t, H1_2, int16_to_float16)
 DO_ZPZ_FP(sve_scvt_sh, uint32_t, H1_4, int32_to_float16)
 DO_ZPZ_FP(sve_scvt_ss, uint32_t, H1_4, int32_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index e185af29e3..361d545965 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3651,6 +3651,36 @@ static void do_zpz_ptr(DisasContext *s, int rd, int rn, int pg,
     tcg_temp_free_ptr(status);
 }
 
+static void trans_FCVT_sh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvt_sh);
+}
+
+static void trans_FCVT_hs(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_hs);
+}
+
+static void trans_FCVT_dh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_fcvt_dh);
+}
+
+static void trans_FCVT_hd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_hd);
+}
+
+static void trans_FCVT_ds(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_ds);
+}
+
+static void trans_FCVT_sd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvt_sd);
+}
+
 static void trans_SCVTF_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
 {
     do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_hh);
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index ca54895900..d44cf17fc8 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -824,6 +824,14 @@ FNMLS_zpzzz	01100101 .. 1 ..... 111 ... ..... .....		@rdn_pg_rm_ra
 
 ### SVE FP Unary Operations Predicated Group
 
+# SVE floating-point convert precision
+FCVT_sh		01100101 10 0010 00 101 ... ..... .....		@rd_pg_rn_e0
+FCVT_hs		01100101 10 0010 01 101 ... ..... .....		@rd_pg_rn_e0
+FCVT_dh		01100101 11 0010 00 101 ... ..... .....		@rd_pg_rn_e0
+FCVT_hd		01100101 11 0010 01 101 ... ..... .....		@rd_pg_rn_e0
+FCVT_ds		01100101 11 0010 10 101 ... ..... .....		@rd_pg_rn_e0
+FCVT_sd		01100101 11 0010 11 101 ... ..... .....		@rd_pg_rn_e0
+
 # SVE integer convert to floating-point
 SCVTF_hh	01100101 01 010 01 0 101 ... ..... .....	@rd_pg_rn_e0
 SCVTF_sh	01100101 01 010 10 0 101 ... ..... .....	@rd_pg_rn_e0
-- 
2.14.3

