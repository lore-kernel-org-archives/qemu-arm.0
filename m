Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5778660wrq;
        Tue, 26 Jun 2018 21:48:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd16gHbvY5gXkPAZ/2BnwI+nG3u5AKCQnNi8fuxpWBrj6eYKxQxT46I4Bk+xZ099X5eLXqG
X-Received: by 2002:aed:20e7:: with SMTP id 94-v6mr4092055qtb.34.1530074901454;
        Tue, 26 Jun 2018 21:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074901; cv=none;
        d=google.com; s=arc-20160816;
        b=Yc90/07h7OUND0ifSC+nyItNf8YEl8IrdO/E5LUCqvTGWywR/2KNExLhX8c0AXY2D6
         smchJf/syPdiwXZZAPNoO9JH+9qNbd6A3GtLHkKaY3SJ+su7ur34UEMA4K6jKDOafHy6
         6cKrHTKJSAEzFrkDLf9qSmeHQBX0JBwiy3cRatpRot3xp3vgBQs7iIoJVzW0QCPY573F
         IyzjVEUlA5NiW2JB/k1X87GviQP8EgHOy9UfFWEWrli5fm7pmi55LK/Y9yW4dDZyZvHv
         qJBpiVP0SN5y49Ka9rJKKFz9HLnljn7fT3eI71XbivExJx46JxWA0ecOwP1fqT3pMrMc
         qpOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=A2/N6E/dNThqx3NglBGKSUe+klioN0aVIRT199XiPu4=;
        b=ojkw89LQPsFDB3oMAxqrWPAF4rb9Dy6bwwFpdOWeG9z++UhgYRz7HiIujaifbvQ35A
         3XDZTW1VY8cUhdBHhm5FncEt3as1qDo8AZnImynInowl+1VOY0tc/J3VK9D5KtlnOUGb
         bGo9zUTdKJg7UyLfLq78pT8lK5N8EG+ZzzqPRGhUbVEnI0RUOxrlI8Vj09Q5HfZH63UZ
         abvU1xPUnZKkdqIl+7uJKSU25isnuYU1bt27a6FXniQ7NP15GsEj55G6jIoXoXemcw/U
         n1YnmrFX2ZW43gGyJR6UVbyu3Qku7eLdMPrvNDR5jGvyP62HUTqwmYx64Q41NFtPNyJN
         HxKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ey+h2wW8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r56-v6si2068740qtb.95.2018.06.26.21.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ey+h2wW8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2NQ-0007XF-Tt
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:48:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29h-0004Xa-BN
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29f-0000uE-VY
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:09 -0400
Received: from mail-pf0-x22a.google.com ([2607:f8b0:400e:c00::22a]:39451)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29f-0000ti-OP
	for qemu-devel@nongnu.org; Wed, 27 Jun 2018 00:34:07 -0400
Received: by mail-pf0-x22a.google.com with SMTP id s21-v6so385001pfm.6
	for <qemu-devel@nongnu.org>; Tue, 26 Jun 2018 21:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A2/N6E/dNThqx3NglBGKSUe+klioN0aVIRT199XiPu4=;
	b=ey+h2wW89a1utQ0nawCvKF0ZY50GNIwZfhtzELxm0o1K6mU10Y1ULgJDUHEsGTmTI0
	FvW6sHT4QPq+5pKIqGC4IJuAhnSCOlN63anYqYStU5LOQleIHBg+ZuZSvWnRkRu1ePKM
	Uy56sPKD/GAWM/eKFEbTA9JVpNrQhQVJ66sic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A2/N6E/dNThqx3NglBGKSUe+klioN0aVIRT199XiPu4=;
	b=KApyiA7kG7aLTSJBEZEuiR8Q1OyvFxIGbHhRgdV3HqQThhnM5W8yJHX2sQLgGcR57b
	YtDHFEDSD/VwqPXCI0zL5ChsuoRCZqLCNwOEndVfvy5kVuZ6U9DoQiohQEClSzC28TO6
	7jLvEiUcqIg9xByz8txn3M7yuN2QX3wh/xRiAF8lG5j3C+ObPaTrVyc3fQdf1Chvdk0c
	FI1ALB2MAyEEVHN81lLYTSP2Aj4wa121NVyQ8aFxt/RjYu6WYjfRKVH3smSZCaksvPpF
	KDterzuw98w5zdu0d5i+sFaobRjIEZU4U8uycVtcDeMHkZMetvKL5nnvX+mNkW8lbVV5
	b4XA==
X-Gm-Message-State: APt69E2YiQ+ZvAwGP1r04EUl+9n1gj065U1lHN3Erk8LxrlzNs6+Mkl0
	wejbT3JRwRpAj40WoO4UpxZ2zds6FOw=
X-Received: by 2002:a63:7d4c:: with SMTP id
	m12-v6mr3693200pgn.201.1530074046319; 
	Tue, 26 Jun 2018 21:34:06 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.34.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:34:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:18 -0700
Message-Id: <20180627043328.11531-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22a
Subject: [Qemu-devel] [PATCH v6 25/35] target/arm: Implement SVE
 floating-point round to integral value
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
X-TUID: UpUkkYojRJJ1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 14 +++++++
 target/arm/sve_helper.c    |  8 ++++
 target/arm/translate-sve.c | 77 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      |  9 +++++
 4 files changed, 108 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 37fa9eb9bb..36168c5bb2 100644
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
index b6421ec19c..af8221c714 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3290,6 +3290,14 @@ DO_ZPZ_FP(sve_fcvtzu_sd, uint64_t,     , vfp_float32_to_uint64_rtz)
 DO_ZPZ_FP(sve_fcvtzu_ds, uint64_t,     , helper_vfp_touizd)
 DO_ZPZ_FP(sve_fcvtzu_dd, uint64_t,     , vfp_float64_to_uint64_rtz)
 
+DO_ZPZ_FP(sve_frint_h, uint16_t, H1_2, helper_advsimd_rinth)
+DO_ZPZ_FP(sve_frint_s, uint32_t, H1_4, helper_rints)
+DO_ZPZ_FP(sve_frint_d, uint64_t,     , helper_rintd)
+
+DO_ZPZ_FP(sve_frintx_h, uint16_t, H1_2, float16_round_to_int)
+DO_ZPZ_FP(sve_frintx_s, uint32_t, H1_4, float32_round_to_int)
+DO_ZPZ_FP(sve_frintx_d, uint64_t,     , float64_round_to_int)
+
 DO_ZPZ_FP(sve_scvt_hh, uint16_t, H1_2, int16_to_float16)
 DO_ZPZ_FP(sve_scvt_sh, uint32_t, H1_4, int32_to_float16)
 DO_ZPZ_FP(sve_scvt_ss, uint32_t, H1_4, int32_to_float32)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index be589a1cf2..270bf9101b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4040,6 +4040,83 @@ static bool trans_FCVTZU_dd(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve_fcvtzu_dd);
 }
 
+static gen_helper_gvec_3_ptr * const frint_fns[3] = {
+    gen_helper_sve_frint_h,
+    gen_helper_sve_frint_s,
+    gen_helper_sve_frint_d
+};
+
+static bool trans_FRINTI(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16,
+                      frint_fns[a->esz - 1]);
+}
+
+static bool trans_FRINTX(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    static gen_helper_gvec_3_ptr * const fns[3] = {
+        gen_helper_sve_frintx_h,
+        gen_helper_sve_frintx_s,
+        gen_helper_sve_frintx_d
+    };
+    if (a->esz == 0) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, a->esz == MO_16, fns[a->esz - 1]);
+}
+
+static bool do_frint_mode(DisasContext *s, arg_rpr_esz *a, int mode)
+{
+    if (a->esz == 0) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        TCGv_i32 tmode = tcg_const_i32(mode);
+        TCGv_ptr status = get_fpstatus_ptr(a->esz == MO_16);
+
+        gen_helper_set_rmode(tmode, tmode, status);
+
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           pred_full_reg_offset(s, a->pg),
+                           status, vsz, vsz, 0, frint_fns[a->esz - 1]);
+
+        gen_helper_set_rmode(tmode, tmode, status);
+        tcg_temp_free_i32(tmode);
+        tcg_temp_free_ptr(status);
+    }
+    return true;
+}
+
+static bool trans_FRINTN(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_frint_mode(s, a, float_round_nearest_even);
+}
+
+static bool trans_FRINTP(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_frint_mode(s, a, float_round_up);
+}
+
+static bool trans_FRINTM(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_frint_mode(s, a, float_round_down);
+}
+
+static bool trans_FRINTZ(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_frint_mode(s, a, float_round_to_zero);
+}
+
+static bool trans_FRINTA(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
+{
+    return do_frint_mode(s, a, float_round_ties_away);
+}
+
 static bool trans_SCVTF_hh(DisasContext *s, arg_rpr_esz *a, uint32_t insn)
 {
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, true, gen_helper_sve_scvt_hh);
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index ddfb5316c9..e45faaec3a 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -845,6 +845,15 @@ FCVTZU_sd       01100101 11 011 10 1 101 ... ..... .....        @rd_pg_rn_e0
 FCVTZS_dd       01100101 11 011 11 0 101 ... ..... .....        @rd_pg_rn_e0
 FCVTZU_dd       01100101 11 011 11 1 101 ... ..... .....        @rd_pg_rn_e0
 
+# SVE floating-point round to integral value
+FRINTN          01100101 .. 000 000 101 ... ..... .....         @rd_pg_rn
+FRINTP          01100101 .. 000 001 101 ... ..... .....         @rd_pg_rn
+FRINTM          01100101 .. 000 010 101 ... ..... .....         @rd_pg_rn
+FRINTZ          01100101 .. 000 011 101 ... ..... .....         @rd_pg_rn
+FRINTA          01100101 .. 000 100 101 ... ..... .....         @rd_pg_rn
+FRINTX          01100101 .. 000 110 101 ... ..... .....         @rd_pg_rn
+FRINTI          01100101 .. 000 111 101 ... ..... .....         @rd_pg_rn
+
 # SVE integer convert to floating-point
 SCVTF_hh        01100101 01 010 01 0 101 ... ..... .....        @rd_pg_rn_e0
 SCVTF_sh        01100101 01 010 10 0 101 ... ..... .....        @rd_pg_rn_e0
-- 
2.17.1

