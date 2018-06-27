Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5774499wrq;
        Tue, 26 Jun 2018 21:41:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe1RbBXZV1ZrNgstZw00O+ykzroxst7oNI+M3qFGSzOdyk+H7OD+/eIj9NaI1lP+eKpK9oI
X-Received: by 2002:a0c:a90b:: with SMTP id y11-v6mr4073408qva.179.1530074494155;
        Tue, 26 Jun 2018 21:41:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074494; cv=none;
        d=google.com; s=arc-20160816;
        b=h5WaSOFB0K+CMnqLiC9rThgbt8vLC3QbldE6vXs1oGJGfWYCoMFH0KR/hPfvmWcybb
         lr6lx9nuDmQPGRvMgTBINRHXjPLwIstIakuPxf73TZnDKNiilPN66u/6AXNX7vH56+vg
         V1NDjpkHUjOJktuhtl+gzLOt//YdkKrPfjg4lM+ODN5o5L5bFevzsKTuXsOaAiv8j8+H
         NRNF2FuED5oLqePBGYlRQXXREbQvQFgqheOmBKdvEs3sN3+czQ1kQtI6d8j4pf53vPbv
         d2AM9gSs5a5UyI3bAnmu/fFmAquE4kkgMXSX/fb8RDYIRa+I+hP3tc0WlfaRpvKk+CCq
         71qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=kgjnqdo1x1Jt+65NIX/VybxO/cc0Uu1aOhlAHWzNoyA=;
        b=YpqWafRq/Ltev6diS+P7uw9j8NlQdoupMyCLvRJW2th/JDCHYVs6MdkoO/IzdsCMSC
         xlsWGtiSPV6p6Vc+5xOhhW9cCmBfPjg0+BUh32DwUsBKfq6EfzW5c7DaCLEiiNJiCma2
         FWjQY3/OLzBXV3A6IYN+yW6HYcemyCR7kRBazd1/W6/vZlSwUASmiOQf2EXf0cQ7ncmE
         GdShquIrjzPUWp4N/PCF6LKCczvQbP8swqe2bnPzNEZ29lowk5Wyqrd1ppDjdC3buMos
         ra5x9s6ch1+66MwzACaBSi8fEUrfASV8G28W0HUTF2efPwARNuhAsN9TcDC80iDmGlaT
         lHWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bJiQOBNo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h13-v6si453853qvb.218.2018.06.26.21.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:41:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bJiQOBNo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56526 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY2Gr-0002C1-HM
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:41:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29P-0004EY-S9
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29M-0000PW-3A
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:51 -0400
Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230]:46871)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY29L-0000Nj-NK
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:47 -0400
Received: by mail-pf0-x230.google.com with SMTP id q1-v6so379281pff.13
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kgjnqdo1x1Jt+65NIX/VybxO/cc0Uu1aOhlAHWzNoyA=;
	b=bJiQOBNoAT1eCJMR2ZDpJPYaWb5hoNNE0ex12UvjRIr80uO1+Qbm1+E7u6JOUC8hf/
	J1gpuOhMuoV9YLHwwpXSWvJMekBRvyvEg4sx6PTu3nJYtytbWzZ0PyarAWfg3VlhvM9y
	8v+oOAbHJwoqNHnDF6XBg84IhSy6jtCTGvnQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kgjnqdo1x1Jt+65NIX/VybxO/cc0Uu1aOhlAHWzNoyA=;
	b=G/GJKft6A4Ya7ibxEOQsMRFeTjuQyxgXoVDEmH9wFfExwSWZmeCo6rGNcB/uNvRzKO
	gwIQaLA0shYeT64S/W6Kq2grRSWozIwJJQgpv7pWHPSHIubGOuVaHLL3OXh6nMb0lFLo
	StlParIWiTFqSIK+rRfFaNrv3+SLCA3WTxDtW4JwokZfp11x7UX90Q5N/xOARLEfGS6Q
	Wmg8OpjrjoNR9fFlK/M6nwXAzyVylH2/ilfkBh3/jA1eJgZgm9kM5LMKWBTfosk/4gTg
	93WkZeGv68vFNM9zxhoQriVJpUgIGjddzrBa6e9NXQXTKOZVwx37nV8s2IEm1h7MYKMP
	vLvQ==
X-Gm-Message-State: APt69E2SBbIRc4rVHM6u3+kBk1qF1CKgSeAbdvdPa2ApzXlkQMPEiwtR
	r9awEft1vsInGngFLCSC8dJj6w==
X-Received: by 2002:aa7:818b:: with SMTP id
	g11-v6mr4297320pfi.50.1530074026605; 
	Tue, 26 Jun 2018 21:33:46 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:33:04 -0700
Message-Id: <20180627043328.11531-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627043328.11531-1-richard.henderson@linaro.org>
References: <20180627043328.11531-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::230
Subject: [Qemu-arm] [PATCH v6 11/35] target/arm: Implement SVE scatter stores
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
X-TUID: 4QDNvxLJfV78

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

---
v6:
 * Rewrite to the usual two nested loops,
 * Add comment about XS=2.
---
 target/arm/helper-sve.h    | 41 +++++++++++++++++++++
 target/arm/sve_helper.c    | 61 +++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 75 ++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 39 ++++++++++++++++++++
 4 files changed, 216 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index a5d3bb121c..8880128f9c 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -958,3 +958,44 @@ DEF_HELPER_FLAGS_4(sve_st1hs_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 DEF_HELPER_FLAGS_4(sve_st1hd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
 
 DEF_HELPER_FLAGS_4(sve_st1sd_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbs_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sths_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stss_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbs_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sths_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stss_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbd_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_zsu, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbd_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_zss, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbd_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_zd, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 93f2942590..7622bb2af0 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3713,3 +3713,64 @@ void HELPER(sve_st4dd_r)(CPUARMState *env, void *vg,
         addr += 4 * 8;
     }
 }
+
+/* Stores with a vector index.  */
+
+#define DO_ST1_ZPZ_S(NAME, TYPEI, FN)                                   \
+void HELPER(NAME)(CPUARMState *env, void *vd, void *vg, void *vm,       \
+                  target_ulong base, uint32_t desc)                     \
+{                                                                       \
+    intptr_t i, oprsz = simd_oprsz(desc);                               \
+    unsigned scale = simd_data(desc);                                   \
+    uintptr_t ra = GETPC();                                             \
+    for (i = 0; i < oprsz; ) {                                          \
+        uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
+        do {                                                            \
+            if (likely(pg & 1)) {                                       \
+                target_ulong off = *(TYPEI *)(vm + H1_4(i));            \
+                uint32_t d = *(uint32_t *)(vd + H1_4(i));               \
+                FN(env, base + (off << scale), d, ra);                  \
+            }                                                           \
+            i += sizeof(uint32_t), pg >>= sizeof(uint32_t);             \
+        } while (i & 15);                                               \
+    }                                                                   \
+}
+
+#define DO_ST1_ZPZ_D(NAME, TYPEI, FN)                                   \
+void HELPER(NAME)(CPUARMState *env, void *vd, void *vg, void *vm,       \
+                  target_ulong base, uint32_t desc)                     \
+{                                                                       \
+    intptr_t i, oprsz = simd_oprsz(desc) / 8;                           \
+    unsigned scale = simd_data(desc);                                   \
+    uintptr_t ra = GETPC();                                             \
+    uint64_t *d = vd, *m = vm; uint8_t *pg = vg;                        \
+    for (i = 0; i < oprsz; i++) {                                       \
+        if (likely(pg[H1(i)] & 1)) {                                    \
+            target_ulong off = (target_ulong)(TYPEI)m[i] << scale;      \
+            FN(env, base + off, d[i], ra);                              \
+        }                                                               \
+    }                                                                   \
+}
+
+DO_ST1_ZPZ_S(sve_stbs_zsu, uint32_t, cpu_stb_data_ra)
+DO_ST1_ZPZ_S(sve_sths_zsu, uint32_t, cpu_stw_data_ra)
+DO_ST1_ZPZ_S(sve_stss_zsu, uint32_t, cpu_stl_data_ra)
+
+DO_ST1_ZPZ_S(sve_stbs_zss, int32_t, cpu_stb_data_ra)
+DO_ST1_ZPZ_S(sve_sths_zss, int32_t, cpu_stw_data_ra)
+DO_ST1_ZPZ_S(sve_stss_zss, int32_t, cpu_stl_data_ra)
+
+DO_ST1_ZPZ_D(sve_stbd_zsu, uint32_t, cpu_stb_data_ra)
+DO_ST1_ZPZ_D(sve_sthd_zsu, uint32_t, cpu_stw_data_ra)
+DO_ST1_ZPZ_D(sve_stsd_zsu, uint32_t, cpu_stl_data_ra)
+DO_ST1_ZPZ_D(sve_stdd_zsu, uint32_t, cpu_stq_data_ra)
+
+DO_ST1_ZPZ_D(sve_stbd_zss, int32_t, cpu_stb_data_ra)
+DO_ST1_ZPZ_D(sve_sthd_zss, int32_t, cpu_stw_data_ra)
+DO_ST1_ZPZ_D(sve_stsd_zss, int32_t, cpu_stl_data_ra)
+DO_ST1_ZPZ_D(sve_stdd_zss, int32_t, cpu_stq_data_ra)
+
+DO_ST1_ZPZ_D(sve_stbd_zd, uint64_t, cpu_stb_data_ra)
+DO_ST1_ZPZ_D(sve_sthd_zd, uint64_t, cpu_stw_data_ra)
+DO_ST1_ZPZ_D(sve_stsd_zd, uint64_t, cpu_stl_data_ra)
+DO_ST1_ZPZ_D(sve_stdd_zd, uint64_t, cpu_stq_data_ra)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4116fe9904..65da3e633f 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -43,6 +43,8 @@ typedef void gen_helper_gvec_flags_4(TCGv_i32, TCGv_ptr, TCGv_ptr,
                                      TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 typedef void gen_helper_gvec_mem(TCGv_env, TCGv_ptr, TCGv_i64, TCGv_i32);
+typedef void gen_helper_gvec_mem_scatter(TCGv_env, TCGv_ptr, TCGv_ptr,
+                                         TCGv_ptr, TCGv_i64, TCGv_i32);
 
 /*
  * Helpers for extracting complex instruction fields.
@@ -4228,3 +4230,76 @@ static bool trans_ST_zpri(DisasContext *s, arg_rpri_store *a, uint32_t insn)
     }
     return true;
 }
+
+/*
+ *** SVE gather loads / scatter stores
+ */
+
+static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm, int scale,
+                       TCGv_i64 scalar, gen_helper_gvec_mem_scatter *fn)
+{
+    unsigned vsz = vec_full_reg_size(s);
+    TCGv_i32 desc = tcg_const_i32(simd_desc(vsz, vsz, scale));
+    TCGv_ptr t_zm = tcg_temp_new_ptr();
+    TCGv_ptr t_pg = tcg_temp_new_ptr();
+    TCGv_ptr t_zt = tcg_temp_new_ptr();
+
+    tcg_gen_addi_ptr(t_pg, cpu_env, pred_full_reg_offset(s, pg));
+    tcg_gen_addi_ptr(t_zm, cpu_env, vec_full_reg_offset(s, zm));
+    tcg_gen_addi_ptr(t_zt, cpu_env, vec_full_reg_offset(s, zt));
+    fn(cpu_env, t_zt, t_pg, t_zm, scalar, desc);
+
+    tcg_temp_free_ptr(t_zt);
+    tcg_temp_free_ptr(t_zm);
+    tcg_temp_free_ptr(t_pg);
+    tcg_temp_free_i32(desc);
+}
+
+static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
+{
+    /* Indexed by [xs][msz].  */
+    static gen_helper_gvec_mem_scatter * const fn32[2][3] = {
+        { gen_helper_sve_stbs_zsu,
+          gen_helper_sve_sths_zsu,
+          gen_helper_sve_stss_zsu, },
+        { gen_helper_sve_stbs_zss,
+          gen_helper_sve_sths_zss,
+          gen_helper_sve_stss_zss, },
+    };
+    /* Note that we overload xs=2 to indicate 64-bit offset.  */
+    static gen_helper_gvec_mem_scatter * const fn64[3][4] = {
+        { gen_helper_sve_stbd_zsu,
+          gen_helper_sve_sthd_zsu,
+          gen_helper_sve_stsd_zsu,
+          gen_helper_sve_stdd_zsu, },
+        { gen_helper_sve_stbd_zss,
+          gen_helper_sve_sthd_zss,
+          gen_helper_sve_stsd_zss,
+          gen_helper_sve_stdd_zss, },
+        { gen_helper_sve_stbd_zd,
+          gen_helper_sve_sthd_zd,
+          gen_helper_sve_stsd_zd,
+          gen_helper_sve_stdd_zd, },
+    };
+    gen_helper_gvec_mem_scatter *fn;
+
+    if (a->esz < a->msz || (a->msz == 0 && a->scale)) {
+        return false;
+    }
+    if (!sve_access_check(s)) {
+        return true;
+    }
+    switch (a->esz) {
+    case MO_32:
+        fn = fn32[a->xs][a->msz];
+        break;
+    case MO_64:
+        fn = fn64[a->xs][a->msz];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    do_mem_zpz(s, a->rd, a->pg, a->rm, a->scale * a->msz,
+               cpu_reg_sp(s, a->rn), fn);
+    return true;
+}
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 6a76010f51..7d24c2bdc4 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -80,6 +80,7 @@
 &rpri_load      rd pg rn imm dtype nreg
 &rprr_store     rd pg rn rm msz esz nreg
 &rpri_store     rd pg rn imm msz esz nreg
+&rprr_scatter_store     rd pg rn rm esz msz xs scale
 
 ###########################################################################
 # Named instruction formats.  These are generally used to
@@ -198,6 +199,8 @@
 @rpri_store_msz     ....... msz:2 .. . imm:s4 ... pg:3 rn:5 rd:5    &rpri_store
 @rprr_store_esz_n0  ....... ..    esz:2  rm:5 ... pg:3 rn:5 rd:5 \
                     &rprr_store nreg=0
+@rprr_scatter_store ....... msz:2 ..     rm:5 ... pg:3 rn:5 rd:5 \
+                    &rprr_scatter_store
 
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
@@ -825,3 +828,39 @@ ST_zpri         1110010 .. nreg:2 1.... 111 ... ..... ..... \
 # SVE store multiple structures (scalar plus scalar)         (nreg != 0)
 ST_zprr         1110010 msz:2 nreg:2 ..... 011 ... ..... ..... \
                 @rprr_store esz=%size_23
+
+# SVE 32-bit scatter store (scalar plus 32-bit scaled offsets)
+# Require msz > 0 && msz <= esz.
+ST1_zprz        1110010 .. 11 ..... 100 ... ..... ..... \
+                @rprr_scatter_store xs=0 esz=2 scale=1
+ST1_zprz        1110010 .. 11 ..... 110 ... ..... ..... \
+                @rprr_scatter_store xs=1 esz=2 scale=1
+
+# SVE 32-bit scatter store (scalar plus 32-bit unscaled offsets)
+# Require msz <= esz.
+ST1_zprz        1110010 .. 10 ..... 100 ... ..... ..... \
+                @rprr_scatter_store xs=0 esz=2 scale=0
+ST1_zprz        1110010 .. 10 ..... 110 ... ..... ..... \
+                @rprr_scatter_store xs=1 esz=2 scale=0
+
+# SVE 64-bit scatter store (scalar plus 64-bit scaled offset)
+# Require msz > 0
+ST1_zprz        1110010 .. 01 ..... 101 ... ..... ..... \
+                @rprr_scatter_store xs=2 esz=3 scale=1
+
+# SVE 64-bit scatter store (scalar plus 64-bit unscaled offset)
+ST1_zprz        1110010 .. 00 ..... 101 ... ..... ..... \
+                @rprr_scatter_store xs=2 esz=3 scale=0
+
+# SVE 64-bit scatter store (scalar plus unpacked 32-bit scaled offset)
+# Require msz > 0
+ST1_zprz        1110010 .. 01 ..... 100 ... ..... ..... \
+                @rprr_scatter_store xs=0 esz=3 scale=1
+ST1_zprz        1110010 .. 01 ..... 110 ... ..... ..... \
+                @rprr_scatter_store xs=1 esz=3 scale=1
+
+# SVE 64-bit scatter store (scalar plus unpacked 32-bit unscaled offset)
+ST1_zprz        1110010 .. 00 ..... 100 ... ..... ..... \
+                @rprr_scatter_store xs=0 esz=3 scale=0
+ST1_zprz        1110010 .. 00 ..... 110 ... ..... ..... \
+                @rprr_scatter_store xs=1 esz=3 scale=0
-- 
2.17.1

