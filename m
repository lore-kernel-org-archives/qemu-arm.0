Received: by 10.28.71.27 with SMTP id u27csp2102632wma;
        Sat, 17 Feb 2018 11:10:27 -0800 (PST)
X-Google-Smtp-Source: AH8x2270zo46XCggLrdAc72gUfSjkyNOoKSuO5hhG9hb57GK3tsDzmtuwQsiBl1AEHfaXsKgP0x+
X-Received: by 10.37.206.71 with SMTP id x68mr7299945ybe.404.1518894627596;
        Sat, 17 Feb 2018 11:10:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518894627; cv=none;
        d=google.com; s=arc-20160816;
        b=nziuR/brzu7At7Drp+g7rtIOn/nPi4+HCpOFnC+JqFpD1PhflThZBbdUFP7axvBzA8
         +Tt81RXHKQyP7O7Ceixm63a6mUqFZN9Xc78AY/CfR5D1dtQY2olfXlPAGTniN2WF6PGg
         eQ1Txjqn9Rjejb4m/ruSqu0HlWV4o+Pg+z2Yh6UG3Es7uXZrxuMsDGjwZdS4KIIfEiWJ
         YIZ+C3tXJtSoUmmnCi966AIBm2mlgoqJmMYy+4X3Er4HOPNy5+2E2E2g2W/9IoSyMfzV
         /zSNrliXl9xu0BhPyuSJl9rQYLFUzXhhr2qdUt2eONkFR5A9/9HewXC3zHQlkBOPa2Vh
         oOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=TYEkgvQ2lsVeGMILIUd+qlGVon1fvaQFWVsi7XMK5X8=;
        b=bVIksoU1jupnvYhJ1GSA+9cDwdFhWI1ve2kWpbOKlPUW5gjYVpRWgPP7jrfGGZUUux
         bclMoEdY2XqJl5zNkvqsmyOrkKySeLuA0jMGr1gVIO9gNalftK6mJKzt6QpZZ8+Uo6iI
         qzZk+YaeZA6/k97vBbUbEZs+ZILil71IzdDnPghWvPBfuKKn0trefckfDtey9OMerrYz
         69T9v/JO0YjjuxT6ygiUYdAcQCQ3yKQD0yPkMfUbXvHWcnzNvm6BuyVDrV24s8ua9dqA
         8FabXniBmoRh9dkImuyoR8pSG+FQdiOXERtXzVH2NA73DKnBEpqdTqf4aqFpEvpOlAKy
         g9hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OENPRN3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j19si774687ywk.656.2018.02.17.11.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 11:10:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OENPRN3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7sQ-0006SX-VA
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 14:10:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7Ah-00025N-JI
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7Ag-0002NW-0V
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:15 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:42016)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7Af-0002NJ-Og
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:25:13 -0500
Received: by mail-pg0-x244.google.com with SMTP id y8so4343662pgr.9
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TYEkgvQ2lsVeGMILIUd+qlGVon1fvaQFWVsi7XMK5X8=;
	b=OENPRN3pDjBKPI8A6Li+DqhGVkcnN9QW73M2G8HKfYT4u72VfuhXjXtj/acxisha3p
	uld55SKBHwa3xpQbopJgeFGwDMFhZbfngDXiMGwRy4KnqqKGuRZZ13HTiLrtFVU7z1rC
	/yeQrfM72KiWHSsLT1Rjdp9PZZtjQPOQZQigk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TYEkgvQ2lsVeGMILIUd+qlGVon1fvaQFWVsi7XMK5X8=;
	b=aMpFgYQJhpnThKI3KEUSnIRiFTHAUhQ04N71bpyWH7Zll4MefHGtu5lUZwDCq87iQY
	bdchaDZHavMjSBsAFPleic3WdH+Mq13Fa2dI4vhlH9lRstxnNNOIUaXQecc2oOxUnvd2
	cjjnxPYQkJ4SJ4hG9U36vuLwrRxEtOI5xIcC+G/gpxgNm72NHRAWbvLSiHGBNZjq0hLA
	iwHd3qpuWALIfzFfTPF9WPzO+2zzOafB2y5gF6kAOM+5l4GYHE9au2h1FwoYEkbKscW/
	3MWv58ZW3+IGIhvmbixq6JsGW5CuUnPWUwNVm+wiVaeAL3uh4GWoIlB4wWP6V5hZLHf4
	3mJg==
X-Gm-Message-State: APf1xPBcICPWbZfAetA6bEMxYcyUg+1BZf+cJfWaEsuspJn8YPTAqQtb
	8KIEd+etDAGzsH9zAeww4tLdYQ==
X-Received: by 10.99.146.3 with SMTP id o3mr8292115pgd.309.1518891912866;
	Sat, 17 Feb 2018 10:25:12 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.25.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:25:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:22 -0800
Message-Id: <20180217182323.25885-67-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH v2 66/67] target/arm: Implement SVE
 floating-point round to integral value
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
X-TUID: 2dFQUk2cLG/f

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 ++++++++
 target/arm/sve_helper.c    |  8 +++++
 target/arm/translate-sve.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  9 ++++++
 4 files changed, 111 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 0f5fea9045..749bab0b38 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -985,6 +985,20 @@ DEF_HELPER_FLAGS_5(sve_fcvtzu_sd, TCG_CALL_NO_RWG,
 DEF_HELPER_FLAGS_5(sve_fcvtzu_dd, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_5(sve_frint_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_frint_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_frint_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve_frintx_h, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_frintx_s, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve_frintx_d, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_5(sve_scvt_hh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve_scvt_sh, TCG_CALL_NO_RWG,
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 09f5c77254..7950710be7 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3200,6 +3200,14 @@ DO_ZPZ_FP_D(sve_fcvtzu_sd, uint64_t, float32_to_uint64_round_to_zero)
 DO_ZPZ_FP_D(sve_fcvtzu_ds, uint64_t, float64_to_uint32_round_to_zero)
 DO_ZPZ_FP_D(sve_fcvtzu_dd, uint64_t, float64_to_uint64_round_to_zero)
 
+DO_ZPZ_FP(sve_frint_h, uint16_t, H1_2, helper_advsimd_rinth)
+DO_ZPZ_FP(sve_frint_s, uint32_t, H1_4, helper_rints)
+DO_ZPZ_FP_D(sve_frint_d, uint64_t, helper_rintd)
+
+DO_ZPZ_FP(sve_frintx_h, uint16_t, H1_2, float16_round_to_int)
+DO_ZPZ_FP(sve_frintx_s, uint32_t, H1_4, float32_round_to_int)
+DO_ZPZ_FP_D(sve_frintx_d, uint64_t, float64_round_to_int)
+
 DO_ZPZ_FP(sve_scvt_hh, uint16_t, H1_2, int16_to_float16)
 DO_ZPZ_FP(sve_scvt_sh, uint32_t, H1_4, int32_to_float16)
 DO_ZPZ_FP(sve_scvt_ss, uint32_t, H1_4, int32_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index bc865dfd15..5f1c4984b8 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3751,6 +3751,86 @@ static void trans_FCVTZU_dd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
     do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_dd);
 }
 
+static gen_helper_gvec_3_ptr * const frint_fns[3] = {
+    gen_helper_sve_frint_h,
+    gen_helper_sve_frint_s,
+    gen_helper_sve_frint_d
+};
+
+static void trans_FRINTI(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+    } else {
+        do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16,
+                   frint_fns[a->esz - 1]);
+    }
+}
+
+static void trans_FRINTX(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3_ptr * const fns[3] = {
+        gen_helper_sve_frintx_h,
+        gen_helper_sve_frintx_s,
+        gen_helper_sve_frintx_d
+    };
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+    } else {
+        do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
+    }
+}
+
+static void do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_i32 tmode;
+    TCGv_ptr status;
+
+    if (a->esz == 0) {
+        unallocated_encoding(s);
+        return;
+    }
+
+    tmode = tcg_const_i32(mode);
+    status = get_fpstatus_ptr(a->esz == MO_16);
+    gen_helper_set_rmode(tmode, tmode, status);
+
+    tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                       vec_full_reg_offset(s, a->rn),
+                       pred_full_reg_offset(s, a->pg),
+                       status, vsz, vsz, 0, frint_fns[a->esz - 1]);
+
+    gen_helper_set_rmode(tmode, tmode, status);
+    tcg_temp_free_i32(tmode);
+    tcg_temp_free_ptr(status);
+}
+
+static void trans_FRINTN(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_frint_mode(s, a, float_round_nearest_even);
+}
+
+static void trans_FRINTP(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_frint_mode(s, a, float_round_up);
+}
+
+static void trans_FRINTM(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_frint_mode(s, a, float_round_down);
+}
+
+static void trans_FRINTZ(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_frint_mode(s, a, float_round_to_zero);
+}
+
+static void trans_FRINTA(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    do_frint_mode(s, a, float_round_ties_away);
+}
+
 static void trans_SCVTF_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
 {
     do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_hh);
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 92dda3a241..e06c0c5279 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -848,6 +848,15 @@ FCVTZU_sd	01100101 11 011 10 1 101 ... ..... .....	@rd_pg_rn_e0
 FCVTZS_dd	01100101 11 011 11 0 101 ... ..... .....	@rd_pg_rn_e0
 FCVTZU_dd	01100101 11 011 11 1 101 ... ..... .....	@rd_pg_rn_e0
 
+# SVE floating-point round to integral value
+FRINTN		01100101 .. 000 000 101 ... ..... .....		@rd_pg_rn
+FRINTP		01100101 .. 000 001 101 ... ..... .....		@rd_pg_rn
+FRINTM		01100101 .. 000 010 101 ... ..... .....		@rd_pg_rn
+FRINTZ		01100101 .. 000 011 101 ... ..... .....		@rd_pg_rn
+FRINTA		01100101 .. 000 100 101 ... ..... .....		@rd_pg_rn
+FRINTX		01100101 .. 000 110 101 ... ..... .....		@rd_pg_rn
+FRINTI		01100101 .. 000 111 101 ... ..... .....		@rd_pg_rn
+
 # SVE integer convert to floating-point
 SCVTF_hh	01100101 01 010 01 0 101 ... ..... .....	@rd_pg_rn_e0
 SCVTF_sh	01100101 01 010 10 0 101 ... ..... .....	@rd_pg_rn_e0
-- 
2.14.3

