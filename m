Received: by 10.28.71.27 with SMTP id u27csp2094120wma;
        Sat, 17 Feb 2018 10:59:24 -0800 (PST)
X-Google-Smtp-Source: AH8x227BfeV+/Ia5weKnqeAg+/cDdPX63D9YRR5gVSaqaDod8NMEkz8YCdIR/SJ+JGyxZEPcNmPM
X-Received: by 10.37.173.214 with SMTP id d22mr3344728ybe.508.1518893964821;
        Sat, 17 Feb 2018 10:59:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518893964; cv=none;
        d=google.com; s=arc-20160816;
        b=WzwH7BdD3kO+qPlYb4isngUB7mRadXOYe4TpbtcYk7er4nv/gmzgywTGkKrRa7WsT+
         CfSJXpY393FuuUSYalZ4zrR5KGCsT0Vu39mHXcXqfgHkzcCm6/RUtqOPc3RG95uiNhze
         9bYz2kaWP1yVp0tXqpcnTDD5VvMRh2PIp954OlRMSWOc/hCR20+1c4CkHqwamWVZW4Md
         gc4c6APSz6duKDzWhqfPGrqk1+ybJxxvZwV0n8wialalNBsVwovKwrDnIa6nQfyn+YnR
         K/ZFYkh8g6SoZSF5MB0kPXYXHRBlNvJioOtfldiYkFq6g3ZARwrOkllPXJO8TG+Ls012
         RdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=IhToWs1C7AovvETP6XOvXMuMMPnPAh0jKOUin6dQbJU=;
        b=z0TByXm9BUO/PqJNT0T1mJxKcQ9NkfnkOzSo0m7ogaiHwipJRfQiS2TijimakjeDFY
         KXObAOCBx1DRk+ojLx8cSAaiquzie+t/l9JJsrwt7mpneWH1XdXPuR/w0RQQuSi2QG6l
         qWLh4VtHrusINIPOJuVi2DWfHpwUM5jamJqG3DQ/WIrD9Kp2H8hCv1WKMsXL6MsMMlB4
         4sm1cgi2VcspXb5JIevo+WnJX7MJtYUAr+eCsKpovn2yTA8hOnpDjWh8TwTsf4nX/fZh
         xzKZnu6Pa3Wifl12W8PHef932egHK7AN5lASWhUEEojXOEuQ1vuVXtuaCiW0Q0uzx2hE
         dz2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QB9g90y2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 10si3198224ywt.351.2018.02.17.10.59.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:59:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QB9g90y2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en7hk-0004UF-5s
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:59:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AL-0001bz-OB
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en7AK-0002AG-2v
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:53 -0500
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:37016)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en7AJ-00029z-Ri
	for qemu-devel@nongnu.org; Sat, 17 Feb 2018 13:24:52 -0500
Received: by mail-pl0-x241.google.com with SMTP id ay8so3443369plb.4
	for <qemu-devel@nongnu.org>; Sat, 17 Feb 2018 10:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IhToWs1C7AovvETP6XOvXMuMMPnPAh0jKOUin6dQbJU=;
	b=QB9g90y2TEkyU1V27BzKlf0vX0kK5U2vJncmfjTKWsy4dmrrR7r/oGGoPZlIu/zvUd
	l8/GFpDFU8ohWjjQ36ULEbIvZnU1XsLrSXauYEbJBMpIXecpxmAc6P52AtLMGR1RLnri
	t+Dirc7B5c7M8M5TcFTIqj80cmYLkI0K/4Gu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IhToWs1C7AovvETP6XOvXMuMMPnPAh0jKOUin6dQbJU=;
	b=Ht510ic2dQlEk3XZBRNdjlQTlVNJ34Xd8yxlASzdpcjsx94xQd5gRfYPss2whq4ds9
	wpf8E9gZcF5YM1wjillLoPkrSLGKnnOQsn+/I84hPH9YiQBHOkTCsp3D1rImBx2uYAwZ
	gfUMioKkTAP1evFHyiQkEcAB19b78ZgFNiRYMSvyaoZjoQpOWVUzzzJloC2Vksref+c+
	V3SABcL/xlSRbcapE3Ht25sv0t8NUoO1g5OBdTPc1JA3Qf8zw4kpdL7ckI2nwBDc+5MA
	bo5pOYZ3RoVRSsLKjOyQRYM+LetiTKjHtSFP1ogThJYRvxkCTkzuJAch44/AX3Gt9OnW
	xTcg==
X-Gm-Message-State: APf1xPDkx/QvW4Z4QObLO/oml/Ss8eXUa1IUkfnw6/zaSy5yTcxnLvrc
	1cqw/wSz2Icet4NP7xeExfupObv/xRY=
X-Received: by 2002:a17:902:b488:: with SMTP id
	y8-v6mr8856075plr.432.1518891890498; 
	Sat, 17 Feb 2018 10:24:50 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.24.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:24:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:23:09 -0800
Message-Id: <20180217182323.25885-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180217182323.25885-1-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-devel] [PATCH v2 53/67] target/arm: Implement SVE scatter
 stores
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
X-TUID: S8wyAFdZ7FGK

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 41 ++++++++++++++++++++++++++
 target/arm/sve_helper.c    | 62 ++++++++++++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/sve.decode      | 39 +++++++++++++++++++++++++
 4 files changed, 213 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 6c640a92ff..b5c093f2fd 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -918,3 +918,44 @@ DEF_HELPER_FLAGS_4(sve_st1hs_r, TCG_CALL_NO_WG, void, env, ptr, tl, i32)
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
index a7dc6f6164..07b3d285f2 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -3545,3 +3545,65 @@ void HELPER(sve_st4dd_r)(CPUARMState *env, void *vg,
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
+    intptr_t i, oprsz = simd_oprsz(desc) / 8;                           \
+    unsigned scale = simd_data(desc);                                   \
+    uintptr_t ra = GETPC();                                             \
+    uint32_t *d = vd; TYPEI *m = vm; uint8_t *pg = vg;                  \
+    for (i = 0; i < oprsz; i++) {                                       \
+        uint8_t pp = pg[H1(i)];                                         \
+        if (pp & 0x01) {                                                \
+            target_ulong off = (target_ulong)m[H4(i * 2)] << scale;     \
+            FN(env, base + off, d[H4(i * 2)], ra);                      \
+        }                                                               \
+        if (pp & 0x10) {                                                \
+            target_ulong off = (target_ulong)m[H4(i * 2 + 1)] << scale; \
+            FN(env, base + off, d[H4(i * 2 + 1)], ra);                  \
+        }                                                               \
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
+        if (pg[H1(i)] & 1) {                                            \
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
index 9c724980a0..ca49b94924 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -47,6 +47,8 @@ typedef void gen_helper_gvec_flags_4(TCGv_i32, TCGv_ptr, TCGv_ptr,
                                      TCGv_ptr, TCGv_ptr, TCGv_i32);
 
 typedef void gen_helper_gvec_mem(TCGv_env, TCGv_ptr, TCGv_i64, TCGv_i32);
+typedef void gen_helper_gvec_mem_scatter(TCGv_env, TCGv_ptr, TCGv_ptr,
+                                         TCGv_ptr, TCGv_i64, TCGv_i32);
 
 /*
  * Helpers for extracting complex instruction fields.
@@ -3887,3 +3889,72 @@ static void trans_ST_zpri(DisasContext *s, arg_rpri_store *a, uint32_t insn)
                      (a->imm * elements * (a->nreg + 1)) << a->msz);
     do_st_zpa(s, a->rd, a->pg, addr, a->msz, a->esz, a->nreg);
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
+static void trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a, uint32_t insn)
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
+        unallocated_encoding(s);
+        return;
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
+}
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 5d8e1481d7..edd9340c02 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -81,6 +81,7 @@
 &rpri_load	rd pg rn imm dtype nreg
 &rprr_store	rd pg rn rm msz esz nreg
 &rpri_store	rd pg rn imm msz esz nreg
+&rprr_scatter_store	rd pg rn rm esz msz xs scale
 
 ###########################################################################
 # Named instruction formats.  These are generally used to
@@ -199,6 +200,8 @@
 @rpri_store_msz     ....... msz:2 .. . imm:s4 ... pg:3 rn:5 rd:5    &rpri_store
 @rprr_store_esz_n0  ....... ..    esz:2  rm:5 ... pg:3 rn:5 rd:5 \
 		    &rprr_store nreg=0
+@rprr_scatter_store ....... msz:2 ..     rm:5 ... pg:3 rn:5 rd:5 \
+		    &rprr_scatter_store
 
 ###########################################################################
 # Instruction patterns.  Grouped according to the SVE encodingindex.xhtml.
@@ -832,3 +835,39 @@ ST_zpri		1110010 .. nreg:2 1.... 111 ... ..... ..... \
 # SVE store multiple structures (scalar plus scalar)         (nreg != 0)
 ST_zprr		1110010 msz:2 nreg:2 ..... 011 ... ..... ..... \
 		@rprr_store esz=%size_23
+
+# SVE 32-bit scatter store (scalar plus 32-bit scaled offsets)
+# Require msz > 0 && msz <= esz.
+ST1_zprz	1110010 .. 11 ..... 100 ... ..... ..... \
+		@rprr_scatter_store xs=0 esz=2 scale=1
+ST1_zprz	1110010 .. 11 ..... 110 ... ..... ..... \
+		@rprr_scatter_store xs=1 esz=2 scale=1
+
+# SVE 32-bit scatter store (scalar plus 32-bit unscaled offsets)
+# Require msz <= esz.
+ST1_zprz	1110010 .. 10 ..... 100 ... ..... ..... \
+		@rprr_scatter_store xs=0 esz=2 scale=0
+ST1_zprz	1110010 .. 10 ..... 110 ... ..... ..... \
+		@rprr_scatter_store xs=1 esz=2 scale=0
+
+# SVE 64-bit scatter store (scalar plus 64-bit scaled offset)
+# Require msz > 0
+ST1_zprz	1110010 .. 01 ..... 101 ... ..... ..... \
+		@rprr_scatter_store xs=2 esz=3 scale=1
+
+# SVE 64-bit scatter store (scalar plus 64-bit unscaled offset)
+ST1_zprz	1110010 .. 00 ..... 101 ... ..... ..... \
+		@rprr_scatter_store xs=2 esz=3 scale=0
+
+# SVE 64-bit scatter store (scalar plus unpacked 32-bit scaled offset)
+# Require msz > 0
+ST1_zprz	1110010 .. 01 ..... 100 ... ..... ..... \
+		@rprr_scatter_store xs=0 esz=3 scale=1
+ST1_zprz	1110010 .. 01 ..... 110 ... ..... ..... \
+		@rprr_scatter_store xs=1 esz=3 scale=1
+
+# SVE 64-bit scatter store (scalar plus unpacked 32-bit unscaled offset)
+ST1_zprz	1110010 .. 00 ..... 100 ... ..... ..... \
+		@rprr_scatter_store xs=0 esz=3 scale=0
+ST1_zprz	1110010 .. 00 ..... 110 ... ..... ..... \
+		@rprr_scatter_store xs=1 esz=3 scale=0
-- 
2.14.3

