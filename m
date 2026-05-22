Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4078DCD5BB3
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:08:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQY2T-0001ID-1w; Fri, 22 May 2026 18:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1W-0006sV-5V
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:21 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQY1O-0002te-FL
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:07:17 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2be1dd4af34so64105765ad.1
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487625; x=1780092425; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1BN3YrxBeYnKrLp4dE6hJz3KYuErqD7i23aJarhXNf4=;
 b=iKOr4c8gYPnf+hCqiQaWYwtEv53F520hdyhNySzgFhfrVypyj8eVwd9cEulz4yUWiV
 EvFm78TT9tWxr6dRd1HcjzECQj4+W0NbEREFec/hYVZCtS6PPbWPyhoXPyAsexZAdumb
 NamKdv7NmGmRmIYuvAATRdc/lw3fo1ySeKhzaQgOtJoGbVcg10xF8CY7ujskDovzgnZZ
 zBXIAgSq6otu2XlK1E6sPtFj5CG7M6PoUQmyUuhUNmvh9BxDPc8qW8DLXNS1BMYF5rn0
 prgKfKXycVBwvI49CaHJBepK4G4TlmvtXclnf9BJ0EoSWgjeoyFPDLM3iRnJqkuRy+Yj
 1kGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487625; x=1780092425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1BN3YrxBeYnKrLp4dE6hJz3KYuErqD7i23aJarhXNf4=;
 b=ofCxMAbA0NLmPgHJ8e3BaB/HHcuaw1I+wFXgQ6XAHg1x9hcYkUrZy8kyctSIoil2kk
 HV9SV4c833Eb5AZECFJ/BG6/SqXcnJhXMlEII5kcgi9c9Sjq9s7Lma/PEpoVbbachgLH
 7CyUW8oAER0Gxrhz6x5aVjNR7+C0Zy1OXdd5cQSoNH+LK/kWCpMgjm+PgQM1YSt7HZZ4
 GkMvsRAL4ZlA+PxPiXMvNKSvL+fu+LfqzK7Sb6P4dfXy6tNcGbQZcfwWNqB7cMqYldTU
 PgX9xnadNfphsw0rc2ha+sf2saUKpkwziPmENFXDJrYNAkyl+Z0k0Ss5Ez7coTkPyXFv
 /QZg==
X-Gm-Message-State: AOJu0Yznd5SyujlNULb9MIVeMeeb2lISw6b8+kxq6Q5x7PQG7MMBz6eO
 uNBLUt6niowgassLQtaaAhxlZ/xnVIylgCkRyfoNqtwKfKkIspmgqvsASFffzIMAbkAqQ+ISNOj
 v9G38
X-Gm-Gg: Acq92OEAPezb1cfJZQkhkcFQwMIIC7z+A/1KxBi23IUss2bQzXccYPWJeUnk17wmcoM
 3S3PB2OPvuQMBWzmJndW5+t6r7qFUViSTx7i1CmUkSwIyVdz1xtpIWKRNuacHgyS98TNzJYHfZp
 vWPiM4lfb7cGmQFPw9R2K6Kc4jIVzuqM0cxxMtFYo9D0F73ZpTLZBzh2nf7CoIWXqI6A4UjLBT9
 i77B+watx6T7LmN0sHvIH5bq0Gy9DQDio73rQNU96wiQpIxpdQbkVdiaJWCFEasYFP/m9Np0cvn
 oT0jJ+uaUQyEdhduvxOyqWm7eCftU6Wfc76aBg0o/oXJUyVqHMeMhYY65rHDLkZCTCj6JdoK+fm
 HZyww17s+Gx3grYilLkCi2W6pn/RIQYgw3PIVoLdtM0Cd4iN3NzEZf6xoY2T08Sa29iFzj7+fLr
 WrY3ATC0ybumLRrFUPjB8l3UAhik5z
X-Received: by 2002:a17:903:1ac3:b0:2bc:7d1d:b677 with SMTP id
 d9443c01a7336-2beb065f97fmr60171355ad.36.1779487625385; 
 Fri, 22 May 2026 15:07:05 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56b7920sm27835745ad.21.2026.05.22.15.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:07:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v7 62/64] target/arm: Implement FMMLA (FP8 to FP16) for AdvSIMD
Date: Fri, 22 May 2026 15:03:04 -0700
Message-ID: <20260522220306.235200-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
 target/arm/cpu-features.h        |  5 +++++
 target/arm/tcg/helper-fp8-defs.h |  1 +
 target/arm/tcg/fp8_helper.c      | 25 +++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   |  1 +
 target/arm/tcg/a64.decode        |  1 +
 5 files changed, 33 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 8f6cc2974f..fce38dfbb0 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1625,6 +1625,11 @@ static inline bool isar_feature_aa64_f8mm8(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8MM8);
 }
 
+static inline bool isar_feature_aa64_f8mm4(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8MM4);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 3c74f02022..e942308af4 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -37,3 +37,4 @@ DEF_HELPER_FLAGS_5(gvec_fdot_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_fdot_idx_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_FLAGS_5(gvec_fmmla_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_5(gvec_fmmla_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index 9db4ff4c2f..8365da9893 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -831,3 +831,28 @@ void HELPER(gvec_fmmla_sb)(void *vd, void *vn, void *vm,
 
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_fmmla_hb)(void *vd, void *vn, void *vm,
+                           CPUARMState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, 0xf);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nseg = oprsz / 8;
+    uint32_t *n = vn;
+    uint32_t *m = vm;
+    float16 *d = vd;
+
+    for (size_t seg = 0; seg < nseg; seg++, d += 4, n += 2, m += 2) {
+        float16 d0 = f8dotadd_h(n[H4(0)], m[H4(0)], 4, d[H2(0)], &ctx);
+        float16 d1 = f8dotadd_h(n[H4(0)], m[H4(1)], 4, d[H2(1)], &ctx);
+        float16 d2 = f8dotadd_h(n[H4(1)], m[H4(0)], 4, d[H2(2)], &ctx);
+        float16 d3 = f8dotadd_h(n[H4(1)], m[H4(1)], 4, d[H2(3)], &ctx);
+
+        d[H2(0)] = d0;
+        d[H2(1)] = d1;
+        d[H2(2)] = d2;
+        d[H2(3)] = d3;
+    }
+
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c62fd6f4c3..5523ac03b2 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7416,6 +7416,7 @@ static bool do_f8dot(DisasContext *s, arg_qrrr_e *a,
 TRANS_FEAT(FDOT_sb_v, aa64_f8dp4, do_f8dot, a, gen_helper_gvec_fdot_sb)
 TRANS_FEAT(FDOT_hb_v, aa64_f8dp2, do_f8dot, a, gen_helper_gvec_fdot_hb)
 TRANS_FEAT(FMMLA_sb, aa64_f8mm8, do_f8dot, a, gen_helper_gvec_fmmla_sb)
+TRANS_FEAT(FMMLA_hb, aa64_f8mm4, do_f8dot, a, gen_helper_gvec_fmmla_hb)
 
 static bool do_f8dot_idx(DisasContext *s, arg_qrrx_e *a,
                          gen_helper_gvec_3_ptr *fn)
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 6404c26540..e7f2f30abb 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1217,6 +1217,7 @@ FDOT_sb_v       0.00 1110 000 ..... 11111 1 ..... ..... @qrrr_s
 FDOT_hb_v       0.00 1110 010 ..... 11111 1 ..... ..... @qrrr_h
 
 FMMLA_sb        0110 1110 100 ..... 11101 1 ..... ..... @rrr_q1e0
+FMMLA_hb        0110 1110 000 ..... 11101 1 ..... ..... @rrr_q1e0
 
 ### Advanced SIMD scalar x indexed element
 
-- 
2.43.0


