Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC6ECD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:52:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8S7-0007qi-Au; Thu, 07 May 2026 19:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rz-0007OK-GR
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:15 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Rw-00029w-2C
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:48:15 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-7dca00c1591so507904a34.3
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197687; x=1778802487; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hd4GcTCtxIy0yP6zc3Nx1kS0pnGqa1eP/vZ+uW2aMwo=;
 b=cHVfp6PsqvLTroAw98KWKY8qiuUK4A+q357dRohQXMgPxlc/HtlvNxX6CSOEMCtKKc
 hZIARsG5dsSibWs/HepKVxwFKYNxPhFvEwQCWgR/LpX0ff4ey07muvCxgoMlk728CAaf
 QqS6R8z3Rn0SdovAyHqoQsqVIo+FO5/C9K6XGymksx8/CEmEYr9XYarxCTQAmFSsxX1e
 r+8blARSDqpwnSHzJMgnnDgXOGLg2sGxrIp1Cno2ithqMU5ssqcfalDbODIcxtRixGuf
 DTCSmqO0ZDW3/Lu49DBHmKOvuLtZOVQBgmlJDzXNS2wbjeMF69N9a1z9/bKI/dlOyaYo
 /WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197687; x=1778802487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Hd4GcTCtxIy0yP6zc3Nx1kS0pnGqa1eP/vZ+uW2aMwo=;
 b=TKAOBluafBDZ43+30DdC36cHaObzQeXPecL/V4ZgbmPEbpTkhd+KOPJr4Up9ymUYco
 Z5W11Jtg2g0nr676Zx4X4ZG/zJTH+iofzs320e6KgcHA+pPOzLa4m8G729MzO5yMbyqz
 zioZFa7GSiBlQE3dvkxeRi49yHDjaQgzLV9UgNEr7EoTqcM3QiN5BkRBprkuwah7+RLj
 sExbvf9r4F5iHlHsMibghOCEJutqB0JfxmBfQw9uxGBWl94qjlWERew8ISuvbs0OsezH
 9i+zdI9X3KsVRkEn1svHGvODsheNdiyNopL83Rpp+dWMeht1AvtqsK5GDMFYQFah6CVt
 4jdQ==
X-Gm-Message-State: AOJu0Yyv6bjoo4zBRQN4imwIXtCg+MdZrBGaaUKTyaFegFvA16U4efEd
 HoTqCHZFEOHpYo1Dhav0K+hApq5WmZ6rRZ5eMJGXrSAoKpbxIayVormOR5U9kRaJmAA=
X-Gm-Gg: AeBDieuAIzEMroS2oXDvmqHXdkASsjROSDhvDlqBO5X9NspTLLVeWSl43IhqYfShiYz
 ZyebU3q2GRE1RNjLffN9vXpS7LS1Q9myOLn30RJ9A6XV18DmeAyfNiKX9FlBIGj1leC33l959//
 9UirdUe8Wi3FrWRMXobiER/8bmYkc1RgOzJEGvQHt/qdKd52sKDH2hCzF/R3H8c+9SaNNkPEHDl
 e0rkuhEgRz1CJUC2ERPJiUGhojFmHdt7Fhzwt9r0Se1xmv3yyuqefMBQX9FP8GbDi4CB0/mtdnT
 CickMlao0RU8gm1vExGBzcFWr5dADUI0aahUIJlgKMfXh8D2Fr4ncsojQ/byDlEWasP6NIju2KB
 dkPuXNqaQb/iT6siK0UXPE5WefdJALZnzKwZatvLB5QaR4eX81FOMkWaHGiT6wMLRevO9mxl6dO
 rKqbR57GmDuPrhqcuRECjurXVzOPpFwqoUiPwx7FKXpsWUaA==
X-Received: by 2002:a05:6820:1627:b0:67e:16b4:aa1a with SMTP id
 006d021491bc7-69998d624a3mr6210716eaf.54.1778197687293; 
 Thu, 07 May 2026 16:48:07 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4355736f517sm242730fac.12.2026.05.07.16.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:48:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 53/60] target/arm: Implement FDOT (FP8 to FP16) for SVE
Date: Thu,  7 May 2026 18:44:06 -0500
Message-ID: <20260507234413.643512-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index ae98d126ae..9825262284 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1549,6 +1549,11 @@ static inline bool isar_feature_aa64_ssve_f8dp4(const ARMISARegisters *id)
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
index 88e6148b83..8d622f9a1c 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8407,3 +8407,38 @@ static bool do_f8dp4(DisasContext *s, gen_helper_gvec_3_ptr *fn,
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


