Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B79FF887E
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:25:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFAY-00081l-Oh; Wed, 29 Apr 2026 20:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAR-0007eU-O0
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:11 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFAP-0006az-Ol
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:22:11 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-82f8bf96b46so152465b3a.2
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508528; x=1778113328; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TOvd1stmjwYt3jtt3lYPGf9ETCY3xwD7NojicPAgY3M=;
 b=WEO1+yV+9S9ck4TSX6CwKG1oQtwnax3ksIv2uLF89pbZjq40QvX+KFXDeTlH4pZWfz
 phlbFrLOZeiXjttzz3nOnno+khQUWcRqFDPPIaAMy2QU++BvdaMMshacyRf3hh7cT0Pn
 T+9Urt/L42qs8+A8X7lGwC1YEn9gcCOoFgWRgBtac6zYeiKWUzOYmeoUxZjr+kBBUNqM
 awnbUqy5yuWfx7bz73mX/MODzRQFFNVonGmOuKypnKoH2trm7glspvkZhC3ibyZaA46L
 GOrhlfw/BOWvduzzC597SByfN7ctp7eijk0qxihxNE3OD5c6v6aDZDE7c+zxGWlb7yhw
 ktFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508528; x=1778113328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TOvd1stmjwYt3jtt3lYPGf9ETCY3xwD7NojicPAgY3M=;
 b=D+vlnuXsPJvRIqduF1XArY6h5nIYqs5XDtpp4FUTGt48AQQ2wrZKjyP3iY8Iu1KDPs
 uOPfHFe5rEsvLtXtr5isHJfAts4N95QXaT8QJvQYeouBGKWvR1Az3R1H1K+E5R0pNcR4
 l/BH3a5PkShKpFa+BBy9IQr0yDrsO6m/0Pt3/3JKB3CUuzVA/bLWJGlRyXdGzxbhEQao
 IgvlU6w3C+guVR2L+xI82vtjuopKMg1WpKsglfJz+SWeZTqNZQRD8uRL/+D0SKkHN96P
 03yIKN2qVJPUovCd3Kb20GGbKVK0GBrbc+i9l2VAEUdxVrujZRCs8usb4wCpgGebRMKZ
 L0Bg==
X-Gm-Message-State: AOJu0YxMHvbOV0SJAAXQOKod4m/AxLFZqPlqPU/+tU3fvYZgWhlViP1O
 9wzXoNHc6knsAmI8sKSmPgXh59aI59QA520bX2Qxeo5zgdTiyn6naUxatPWy3s9CoHs=
X-Gm-Gg: AeBDiesxkYGb+QT4iTRABO3PDvXvRb6HgmyWQ+tl6i4WTqrfCEhkKMZ9pvtzAsRW3iQ
 9V+FvwKgqX+Sw8xsd6jM241t/bNiXKiLWtRsNQM+mrZTj38UmgcIn1smFOLvociQrh+HmFMyYww
 7tIHWP7G3LDmGU725YPiV0SVSir1FfpGYZdXbuafc+9VPsxMwv4QqlZYKYraCGHew26LHA7fnG5
 wF5IJR76zUbpl75CYwxlVnmZ/vkeYNQaL+l1kGLM5J0Mjl8PD5kXKI8veYbsaGoFbYeKyLCRX05
 AVqCLOGpPGieZKGFY74P4Jrs8K6uNfZBsaPnJXTmNoQX2qrfEogr0JU0pf9NLRhMTMps5K2ByHS
 2W59vqorO+SEHoNnWOaI86wFKOm12baCWbV7wTSr9tBNdQhBoKrmKQdDKb/pIJcW6gTlEzaZFvC
 c0iJ8kUXdYANmAZwtZmX7JMjuA8od7gCdjoSo0LCTZ
X-Received: by 2002:a05:6a00:391c:b0:82a:6461:6d1e with SMTP id
 d2e1a72fcca58-834fdcc4b03mr755188b3a.46.1777508528327; 
 Wed, 29 Apr 2026 17:22:08 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-834ed5cd3b8sm3461727b3a.16.2026.04.29.17.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:22:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 35/47] target/arm: Implement LUTI2, LUTI4 for AdvSIMD
Date: Thu, 30 Apr 2026 10:20:34 +1000
Message-ID: <20260430002046.59739-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
 target/arm/tcg/helper-defs.h   |  5 ++++
 target/arm/tcg/translate-a64.c | 38 +++++++++++++++++++++++++
 target/arm/tcg/vec_helper.c    | 52 ++++++++++++++++++++++++++++++++++
 target/arm/tcg/a64.decode      |  6 ++++
 4 files changed, 101 insertions(+)

diff --git a/target/arm/tcg/helper-defs.h b/target/arm/tcg/helper-defs.h
index a05f2258f2..05ccf795e8 100644
--- a/target/arm/tcg/helper-defs.h
+++ b/target/arm/tcg/helper-defs.h
@@ -1122,3 +1122,8 @@ DEF_HELPER_FLAGS_4(sme2_luti4_2s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_4(sme2_luti4_4h, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_4(sme2_luti4_4s, TCG_CALL_NO_RWG, void, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_4(gvec_luti2_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_luti2_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_luti4_b, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(gvec_luti4_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 3c784afc99..508d8e377b 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5405,6 +5405,44 @@ static bool trans_TBL_TBX(DisasContext *s, arg_TBL_TBX *a)
     return true;
 }
 
+static bool do_lut_1(DisasContext *s, arg_rrx_e *a, gen_helper_gvec_3 *fn)
+{
+    if (fp_access_check(s)) {
+        gen_gvec_op3_ool(s, true, a->rd, a->rn, a->rm, a->idx, fn);
+    }
+    return true;
+}
+
+TRANS_FEAT(LUTI2_1b, aa64_lut, do_lut_1, a, gen_helper_gvec_luti2_b)
+TRANS_FEAT(LUTI2_1h, aa64_lut, do_lut_1, a, gen_helper_gvec_luti2_h)
+TRANS_FEAT(LUTI4_1b, aa64_lut, do_lut_1, a, gen_helper_gvec_luti4_b)
+
+static bool trans_LUTI4_2h(DisasContext *s, arg_rrx_e *a)
+{
+    if (!dc_isar_feature(aa64_lut, s)) {
+        return false;
+    }
+    if (fp_access_check(s)) {
+        /*
+         * (Ab)use preg_tmp to merge two disjoint 128-bit quantities
+         * into a sequential 256-bit table.
+         */
+        QEMU_BUILD_BUG_ON(sizeof_field(CPUARMState, vfp.preg_tmp) < 32);
+        unsigned tmp_ofs = offsetof(CPUARMState, vfp.preg_tmp);
+        unsigned rn0_ofs = vec_full_reg_offset(s, a->rn);
+        unsigned rn1_ofs = vec_full_reg_offset(s, (a->rn + 1) % 32);
+
+        tcg_gen_gvec_mov(MO_64, tmp_ofs, rn0_ofs, 16, 16);
+        tcg_gen_gvec_mov(MO_64, tmp_ofs + 16, rn1_ofs, 16, 16);
+
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd), tmp_ofs,
+                           vec_full_reg_offset(s, a->rm),
+                           16, vec_full_reg_size(s),
+                           a->idx, gen_helper_gvec_luti4_h);
+    }
+    return true;
+}
+
 typedef int simd_permute_idx_fn(int i, int part, int elements);
 
 static bool do_simd_permute(DisasContext *s, arg_qrrr_e *a,
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 3231bb2100..f0dc11bc8a 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -3345,3 +3345,55 @@ DO_SME2_LUT(4,4,h, 2)
 DO_SME2_LUT(4,4,s, 4)
 
 #undef DO_SME2_LUT
+
+void HELPER(gvec_luti2_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    unsigned part = simd_data(desc);
+    unsigned vl = simd_oprsz(desc);
+    unsigned elements = vl / 8;
+    unsigned ibase = elements * part;
+    ARMVectorReg scratch;
+
+    do_lut_b(&scratch, vm, vn, elements, ibase, 0, 2, 8, 1);
+    memcpy(vd, &scratch, vl);
+    clear_tail(vd, vl, simd_maxsz(desc));
+}
+
+void HELPER(gvec_luti2_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    unsigned part = simd_data(desc);
+    unsigned vl = simd_oprsz(desc);
+    unsigned elements = vl / 16;
+    unsigned ibase = elements * part;
+    ARMVectorReg scratch;
+
+    do_lut_h(&scratch, vm, vn, elements, ibase, 0, 2, 16, 1);
+    memcpy(vd, &scratch, vl);
+    clear_tail(vd, vl, simd_maxsz(desc));
+}
+
+void HELPER(gvec_luti4_b)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    unsigned part = simd_data(desc);
+    unsigned vl = simd_oprsz(desc);
+    unsigned elements = vl / 8;
+    unsigned ibase = elements * part;
+    ARMVectorReg scratch;
+
+    do_lut_b(&scratch, vm, vn, elements, ibase, 0, 4, 8, 1);
+    memcpy(vd, &scratch, vl);
+    clear_tail(vd, vl, simd_maxsz(desc));
+}
+
+void HELPER(gvec_luti4_h)(void *vd, void *vn, void *vm, uint32_t desc)
+{
+    unsigned part = simd_data(desc);
+    unsigned vl = simd_oprsz(desc);
+    unsigned elements = vl / 16;
+    unsigned ibase = elements * part;
+    ARMVectorReg scratch;
+
+    do_lut_h(&scratch, vm, vn, elements, ibase, 0, 2, 16, 1);
+    memcpy(vd, &scratch, vl);
+    clear_tail(vd, vl, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index a9cf259b9b..6aea3ce89f 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1344,6 +1344,12 @@ EXT_q           0110 1110 00 0 rm:5 0  imm:4 0 rn:5 rd:5
 
 TBL_TBX         0 q:1 00 1110 000 rm:5 0 len:2 tbx:1 00 rn:5 rd:5
 
+LUTI2_1b        0100 1110 100 rm:5 0 idx:2  100 rn:5 rd:5   &rrx_e esz=0
+LUTI2_1h        0100 1110 110 rm:5 0 idx:3   00 rn:5 rd:5   &rrx_e esz=1
+
+LUTI4_1b        0100 1110 010 rm:5 0 idx:1 1000 rn:5 rd:5   &rrx_e esz=0
+LUTI4_2h        0100 1110 010 rm:5 0 idx:2  100 rn:5 rd:5   &rrx_e esz=1
+
 # Advanced SIMD Permute
 
 UZP1            0.00 1110 .. 0 ..... 0 001 10 ..... .....   @qrrr_e
-- 
2.43.0


