Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E30CD5BB3
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:10:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY2Y-0001qR-CZ; Fri, 22 May 2026 18:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1V-0006sJ-T9
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:19 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1K-0002sl-LB
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:11 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2ba0fc8b1f0so55973795ad.3
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487624; x=1780092424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tNas8j0YGMewMuMPCse64nyq2c6XBZnLm98phrEO7Do=;
 b=khvC0SjTJ+nASHS6dP4wm5m83hEFb3RPiqu5Ir3V6VvetQLujSQW7wl3Jh3Jft0cTo
 jNqNSxMl/0i8LracFcegmBY74Z5IQzq24MWvohpLVT3tH8np377ccXgUQ0QLJHOolfQT
 HAG1pl2+Oe6RKbqkindqsu2T4+sv73sYPf/9cKa249nIgRcALHu62PDaq80yPNgRh24W
 rDv9uGNUtSnm68Atth/HcA4PLLhZzHYMA87kn02q7kwj2klrnElqf9dvWGMngO34E23F
 b7tnw8LOAJwC2gJYmlbLtTdaZt/d9hUd/cCY5jzDla5zypiri9TcugsnmxjNtzNzyaG8
 dkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487624; x=1780092424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tNas8j0YGMewMuMPCse64nyq2c6XBZnLm98phrEO7Do=;
 b=n++3qXNrhRJ4capRESG74yY9NAY+T0f+Cgx8NmVjdc8Xt2cwWJKRlymlyjaqt3gDIH
 2PVclnjXLOHdEMBJngQtcJwol6JEO+b55qvm4KVmuteYZileSEXMmMT7xczw4MquxqbQ
 TTjhBG5EK4Avt3eY3pkhfc0+iyKQcp8CTZXwBmHVM7g9VBsK61S0TXtAfG3FBd++evof
 HJFsbEjEmnI+N5UPH9C35beQlZQLhamBeQvYC3TmN53p5IduwBfRF4DVTg2+4erqC+dg
 cPXE3DYgfrAQ6gQw1qrkZEeYNVEB1phzemNUzwMqhyGxPzBqQ6mQhfzeFe9SiCJ7kSt7
 YksQ==
X-Gm-Message-State: AOJu0YyKcinXAqxOAuS/lyumN9C6KlhSP5Mg3sAVY75kUXsgYC2ljysu
 B50MFIPh17zN3e2YMpFj69ClfJ+d6YYDd0/EhLtTzbsFILSA5ckuG3NaVSvuCToTcgo=
X-Gm-Gg: Acq92OGpKTlfMNfghijTt/2JLAGBS3qZ8O+v0FL6Cfm+0lUfbO3OCMlMwvCCEFBwMUO
 7SwyngExORm2LL3ttvHgg16yXMl7HY4ifNSASyjBPhdnh0Q4H8EzhB6WmlJ6uFlend2sL/XYNW2
 iWAUfLt4ZUfMyE4wDlf4xha40ha2EpCj+GmrnsYKrBrE/TnE7MTn82Mo7doCl/b6Qg32LQHOzet
 MarnJOz9f5ehsDKpYKDLRxK1yZzwdpt9BAqGzbCNKhC1kYnK5MKGU+FhFuyDp2bKznpaSFDsd6e
 VKUpoUgyfG5KrW8UKCnzEzUFNQEtgqB4wvQIbt4tj6hZMQqlZXaNxXzB65WXurmNLw/XWfIdiFb
 xtFbIHQpBN+aOmMP8ZuQmXxI0/8exOAOByFTOACkdsXolPl3ujfytMqL3w29HvGLHbL9hpySdEB
 qlSVO9JycjyykwsOdupHPtc21TshfC
X-Received: by 2002:a17:903:1b2c:b0:2b0:60db:7927 with SMTP id
 d9443c01a7336-2beb06bc19cmr57543535ad.28.1779487623608; 
 Fri, 22 May 2026 15:07:03 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56b7920sm27835745ad.21.2026.05.22.15.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:07:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 60/64] target/arm: Implement FMMLA (FP8 to FP32) for SVE
Date: Fri, 22 May 2026 15:03:02 -0700
Message-ID: <20260522220306.235200-61-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
 target/arm/tcg/translate-sve.c | 16 ++++++++++++++++
 target/arm/tcg/sve.decode      |  2 ++
 3 files changed, 23 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 67b9d7e982..8f6cc2974f 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1693,6 +1693,11 @@ static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
     return isar_feature_aa64_sve(id) && isar_feature_aa64_sme_sve_bf16(id);
 }
 
+static inline bool isar_feature_aa64_sve2_f8mm8(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_sve2(id) && isar_feature_aa64_f8mm8(id);
+}
+
 static inline bool
 isar_feature_aa64_sme2_or_sve2_faminmax(const ARMISARegisters *id)
 {
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 5cecd0f5fb..510d8ed3e0 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8460,3 +8460,19 @@ static bool do_f8dp2(DisasContext *s, gen_helper_gvec_3_ptr *fn,
 TRANS(FDOT_hb, do_f8dp2, gen_helper_gvec_fdot_hb, a->rd, a->rn, a->rm, 0)
 TRANS(FDOT_idx_hb, do_f8dp2, gen_helper_gvec_fdot_idx_hb,
       a->rd, a->rn, a->rm, a->index)
+
+static bool do_fmmla_fp8(DisasContext *s, arg_rrrr_esz *a,
+                         gen_helper_gvec_3_ptr *fn)
+{
+    if (fpmr_access_check(s) && sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ptr(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           tcg_env, vsz, vsz, 0, fn);
+    }
+    return true;
+}
+
+TRANS_FEAT_NONSTREAMING(FMMLA_sb, aa64_sve2_f8mm8, do_fmmla_fp8, a,
+                        gen_helper_gvec_fmmla_sb)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 26b3c7697a..6610432528 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1808,6 +1808,8 @@ BFMMLA          01100100 01 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=1
 FMMLA_s         01100100 10 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=2
 FMMLA_d         01100100 11 1 ..... 111 001 ..... .....  @rda_rn_rm_ex esz=3
 
+FMMLA_sb        01100100 00 1 ..... 111 000 ..... .....  @rda_rn_rm_ex esz=2
+
 ### SVE2 Memory Gather Load Group
 
 # SVE2 64-bit gather non-temporal load (scalar plus 64-bit unscaled offsets)
-- 
2.43.0


