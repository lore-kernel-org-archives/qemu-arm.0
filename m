Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95F3CD4851
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:36:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPT1-0001xZ-2m; Sat, 16 May 2026 20:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPSD-00078L-KP
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:34:10 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPS8-0006r6-Dq
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:33:59 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-3698e34a567so580732a91.2
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778978035; x=1779582835; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sODePEuBtD1IMu2N8xv9dK23f4fUAur2uaNFWSg4sSI=;
 b=aqkOgbPB4WNquwMisISfwv0Wdx+wrMqlSeiMlV+T+vBD3H+e0Y4TwrlbB85WIUi+in
 QF+XlICVKaQIZcO1/nQZWYQjJQQXhTfar0dqz5TRjmulETPLqB9L0kctQs+59cWIrPoi
 nOTXvImtX6wZ/juEpJwTcp58lqJoHHo2JYFZAEwDQq8A5vltlxW7i+IfsCA6SmgwNqpG
 8FTs/qaxifOBozpDMNjwIi9bAhF5bgnSpavIsjAlPJlJ2urtDmocq1mJdykqgCP1F3x9
 jwhDzvUP6KIS6PyaAM3g7mIcFylW0xF6u/eQ6SFsAzvFAykwt/cMkP9SZUYpHIeDi65P
 1p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778978035; x=1779582835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sODePEuBtD1IMu2N8xv9dK23f4fUAur2uaNFWSg4sSI=;
 b=hjqlRQk6WkWar25G87e9Avnbq4EM6uBBS2cuuDmr7oUU/ayxmjkH88G0AFYIwd1cpP
 K3QLV0NAexxy0+N6m2OF9gBtCOBkCKIClUpMhVlyUMscWif9s2CoyU6FKQWTVfjumDeq
 dru/XtP5kEYO0dl+zrqCbUBII7RVkbltrrnPWu44YZJ5DS1fBw/1B7nUSjCsXsEX9taL
 JCWGagBepMuR+sNexu0ZSr8X+Hv9SunhybzLrEc+F7/EUF41l12e0Sa/IavEVlKrAYNK
 YGk8h3Peq7hDkb+gFvtd38RAlou3Lyg1e02so9x1RB9CgPMBmTKChxkAfhG+Q2A7IA9p
 8jvw==
X-Gm-Message-State: AOJu0Yx6cKibW9M0mOruZbD6aL3597/4D+Er8ZVmyMzrTzpv2h7iHo8k
 V/H1dsiUyAwC2cCgYY4CCZ3NCghS09aEGQQ+b+/YcXmQChfWULhPZGwqxIIshsClzUE=
X-Gm-Gg: Acq92OHu6vtKlocppOPej58gYiQ72NrH3ekf+H3cKwDwGN1qF5cJmvK34kz9hRm40Wx
 fhLNiorZBXBLrBwZWluYVEbv3w/HLqvKkPlM4JDdk0OlAS+N3F8ufV0/ToCTM2rWPhp4k6LWITC
 Curf8YYpxIN+Q4gY/hF1/Cws1pRsKBWKE+jgGeBOQuWdNJA4NjsOyAjzHB1JWKx8+VsSmMuiahl
 EXXpTSTuDwTFfJo6gE1ym1HrZEh7nvgccwRPvbcNqXjQa2u+/WStCIafBgetxnRZFsy5LbpBfQE
 rrc3YqPRzTtmyqwsrDNEMyxOuTjLW1bKIb8bvyweuETKRynJlOlueD8O4Cosp/59XIGerMGp5g3
 KtFRRBifH2vz5kJT7SJngdHVFurdlRi7SJtrfuIOsldWBDHjIDVVR7s2upftpk3ztLbXpxFcStD
 2sOvoeIdnLrBbzEqSDoZro03qUxXVw
X-Received: by 2002:a05:6a20:2451:b0:3a8:21e0:1ffa with SMTP id
 adf61e73a8af0-3b22ebde1a4mr10812784637.27.1778978035030; 
 Sat, 16 May 2026 17:33:55 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82da93df0dsm3010559a12.19.2026.05.16.17.33.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:33:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 54/63] target/arm: Implement FDOT (FP8 to FP16) for SVE
Date: Sat, 16 May 2026 17:29:53 -0700
Message-ID: <20260517003002.321430-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
index 7bedc293fd..90098c3cbe 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1555,6 +1555,11 @@ static inline bool isar_feature_aa64_ssve_f8dp4(const ARMISARegisters *id)
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


