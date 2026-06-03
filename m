Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78FACD6E4A
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:33:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcIT-0007CY-Hu; Tue, 02 Jun 2026 23:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcIK-0006wj-Ty
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:28 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcII-0003mh-4N
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:29:28 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-8421f0e9c5bso1750637b3a.3
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457364; x=1781062164; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJE7TRFniC+M2fUEMxAGKEKlXN64hizgjGGYuWEgBfc=;
 b=TR5eHxKpT3dF6vwUoHgZKlOvrGAq1/UtbDepbiU1RUvS1mderfRldRhwB+j4oFWOtG
 nfniNJTFmYIRy/MxxzIugRriT0+3CzhiVB9Cx3j8E8+WMG1N6/w2API0Kuot4x0iHb7O
 9VgIDi6nuUrwuIIbXsWgkmmscc8inJ0IbyX9p0FYY8ECl2qVI7CTb7UiG1d1Zb+QGAIy
 Z/XzSC+n5b8kLLbrlshZvVgY3q0ipmqE2LoUJgXxb2cnZ1EqbONrq/59ALX6udnD4Jsp
 eWQ/GMVUXfjk4j/+Oa3eNZDuuNxq62XNFoHGe3UBAKqDvhMiZjPPaW9RcHUjIUYyRhLY
 6uRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457364; x=1781062164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RJE7TRFniC+M2fUEMxAGKEKlXN64hizgjGGYuWEgBfc=;
 b=SCgg7MVb94KsfXTwf8zLHjN9pnEgx3rhnaBMUx2YgKKwEjBKoS7EFcKD7DGx3j70tX
 jnElt0xPjvnROFOIuYUE0yoTOTcXCrR3/qDaenxdwLJ7UtmBhrT1zsOWTq3InieXuR3+
 G3BWNuBapZRq8a+1pVhwD4/fElXmcVgZFdykX9Arndicj2QPvyq6NX608rm2fNO+Wb5k
 96MsWBKcGKMrjuW6eHcB0p0ah1P2YnIln/xbn2LtPUMTxc2rtxKKfBdb0sHb2dPiZTbg
 fIj8kQ9OreJHlNymNJ19DNo5oCRSuOURhjzYqnCGbAJPlrWBhghSEPZo1f40TyBlAndH
 wHlg==
X-Gm-Message-State: AOJu0YwLXXMFn8u+/SCBxUj0u6WqFhGmF4/tN40hVtROKWTPeBu2x3yB
 TUzWWqUwx6gkUT6JWhEPpgWZTBhFZ/M0oGta76r1bzFwLxvuzgTcNu0YFvAh6JKz2j0=
X-Gm-Gg: Acq92OEaD19CheomKapQbyCObiRkmU13Omuqef0663Eh24+W/R+7eSvg45bRzY1YiOR
 EP6ntCUU/QTroESO7EpJonoduAl4z0uCZVOpY3Fnk1ETChdVc1dgS8058P2nedH59cHh6oo4nNm
 eYgl0I4/2Hq0FfL1KAA0xS+otbxWg9lE0VTQbwXp0K6nyCFZOCiCVBVarJYtWQ7nC6PRlMXQWnJ
 fBsAeAj81Fa9UhfguwEJTDQScVybdTUHDxHmxp+oLdpzXjmtgTJBWymgskLqh4Y4WmffiFilxSK
 wNFPz86PoXmIWJAqaHzsID3zxu9htSFbM27/buyuY8cdWlDKBIUlxhkO3X+bnetVa6TnmuMoi9H
 mVihOah5atFF9UkAC3jamfvYkZyrlAIh3waKTCSP1usZxjxFTEcfiDqkD/VRSSPiTtqbdZdZ21H
 hUY8dK18kp0O4hD99jjFtZKXUBtsmal+gaJLfpX0w=
X-Received: by 2002:a05:6a00:2d8f:b0:842:6fec:12aa with SMTP id
 d2e1a72fcca58-84284e2308amr1588631b3a.8.1780457363885; 
 Tue, 02 Jun 2026 20:29:23 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8428222263dsm1477831b3a.2.2026.06.02.20.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:29:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 38/45] target/arm: Implement FDOT (FP8 to FP16) for SVE
Date: Tue,  2 Jun 2026 20:28:47 -0700
Message-ID: <20260603032855.106930-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu-features.h      |  5 +++++
 target/arm/tcg/translate-sve.c | 35 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode      |  2 ++
 3 files changed, 42 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index f6184b80de..4629a3cf3e 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1565,6 +1565,11 @@ static inline bool isar_feature_aa64_ssve_f8dp4(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8DP4);
 }
 
+static inline bool isar_feature_aa64_ssve_f8dp2(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8DP2);
+}
+
 static inline bool isar_feature_aa64_sme_b16b16(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, B16B16);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index a5a0359a95..fa0f3d23b2 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8426,3 +8426,38 @@ static bool do_f8dp4(DisasContext *s, gen_helper_gvec_3_ptr *fn,
 TRANS(FDOT_sb, do_f8dp4, gen_helper_gvec_fdot_sb, a->rd, a->rn, a->rm, 0)
 TRANS(FDOT_idx_sb, do_f8dp4, gen_helper_gvec_fdot_idx_sb,
       a->rd, a->rn, a->rm, a->index)
+
+static bool do_f8dp2(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                     int rd, int rn, int rm, int index)
+{
+    bool fp8dp2 = dc_isar_feature(aa64_f8dp2, s);
+    bool ssve_fp8dp2 = dc_isar_feature(aa64_ssve_f8dp2, s);
+    bool ok = false;
+
+    /* Feature detection and enabling are complex here. */
+    if (!(ssve_fp8dp2 || (fp8dp2 && dc_isar_feature(aa64_sve2, s)))) {
+        return false;
+    }
+    if (fpmr_access_check(s)) {
+        if (fp8dp2) {
+            s->is_nonstreaming = !ssve_fp8dp2;
+            ok = sve_access_check(s);
+        } else {
+            ok = sme_sm_enabled_check(s);
+        }
+    }
+
+    if (ok) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           tcg_env, vsz, vsz,
+                           index, fn);
+    }
+    return true;
+}
+
+TRANS(FDOT_hb, do_f8dp2, gen_helper_gvec_fdot_hb, a->rd, a->rn, a->rm, 0)
+TRANS(FDOT_idx_hb, do_f8dp2, gen_helper_gvec_fdot_idx_hb,
+      a->rd, a->rn, a->rm, a->index)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index c49e992f10..26b3c7697a 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1875,6 +1875,7 @@ FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 
 FDOT_sb         01100100 01 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
+FDOT_hb         01100100 00 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=1
 
 ### SVE2 floating-point multiply-add long (indexed)
 
@@ -1900,6 +1901,7 @@ FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 
 FDOT_idx_sb     01100100 01 1 ..... 010001 ..... .....     @rrxr_2 esz=2
+FDOT_idx_hb     01100100 00 1 ..... 0100.1 ..... .....     @rrx_3a esz=1
 
 ### SVE broadcast predicate element
 
-- 
2.43.0


