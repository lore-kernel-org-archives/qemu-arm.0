Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8A1CD6E55
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Jun 2026 03:33:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wUcLK-0001ag-CP; Tue, 02 Jun 2026 23:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcLF-0001PL-Rt
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:32:29 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wUcLD-0004c1-CT
 for qemu-arm@nongnu.org; Tue, 02 Jun 2026 23:32:28 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2bf30d530bdso47792565ad.3
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2026 20:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780457546; x=1781062346; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WFZDxQPlMUk4Y3zCdCtj6jkmwOnh+sTkiuf5F+8SjLo=;
 b=ulRimwm4X/4K+iPi7ZNEy41bBHkG/wcNGVq0R63oEZ/TZBzaJMbBIXa498EWUsNei+
 0cbBRAKADbEGNduWG+4/jEli9tXvrrQN8wiORKFpjNq9hip+Ea3br3LvfI9oJWYJmSM0
 Ne9Jlm6tp77DwAOGyqoh/UIwW6+RYStOdnbuNuwULKile/6wEFjrG8nmel/rZkKMShYA
 Ggb4t8Vqs5wlFqs4NvNn8VhQQjAtSLcMqSG0oZaQpM+oCjRPL7GjNxMCPV1jXjmKc7wQ
 A2TPm/xvMgpuBw8HMMKUDvMXO9ZWXAO2dOlsjVE4QdcOC/FhdxurYTEDQklwi5nT51lC
 MFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780457546; x=1781062346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WFZDxQPlMUk4Y3zCdCtj6jkmwOnh+sTkiuf5F+8SjLo=;
 b=aHDkdKmkfASewR5dBoH9Itp0CzY0x7OYKtNVaeHBj/yNJUOgIE4hH2s/bvFmb1Ms4V
 yZkcxyqY3p+N1Y4kvk3B2i38V9VzJ42xoAZ5st8FBALv1WRMgMNHKfhPyJW9i90SGQAY
 /2zdXIjyttNCwVTRLwugW0xmjV9rC6bY5hh0PzITaxWoQI+45YgrNfJNd0TElnTu8MfY
 +958HrPUDH1kGwSjEDF4siqUjXL+a8vE/MMuV+bIeQ6x9/m9Pdbt3t5J2TiwTrCDx0m/
 JZ5ILrJ81YLhEhG6raTDy4pB54+YDn6AXBGcvUD2q9lSeusiStJLW+bVR4kJsjHhOFj1
 0MoQ==
X-Gm-Message-State: AOJu0YxXlEwg44xEI9f2TqHNyFk2WVRs1V8Jies1bUwae7YCAjPoj+Dt
 czFnIwNo5yy5w77A3AD4dhiUVi+l+5a2OfdaOtQGHWHAkfiZe4ANBXBAC5ytqFx/MRI=
X-Gm-Gg: Acq92OEF0nmZcN77gU1oLHC3VTf89XOghtsaJK/DGwfxpKh3akm7BYzunCDjZXpGyAc
 yLijYusquV17mNssguAo0pXiAM+8g6umlbgMGRce//N68z4mjZb53/eM64YZ8OskOqCX7Bu0vzP
 MaHzV5tZvl8Uyhl6lbR9e7JeIsC/TY40ejqGJNkxqDU6U3syoI+fBhNo5Zj8pb9JMIyOeiUltYr
 Zvc8ZDzsl3mm2cCeqXWmMmjvSHSZyoTN6I70EfNQ5/O+6c58S/lhoR6cJfyo2ldleHwWMWAdShx
 JQjtp5sjprmV2JMWIkdcL993ns9YZldVFz8fms61knkLRt12ip52GxXOX2Rhj05WVQ80uibvDh5
 PKKOok1m3iE84RX2TiGsmUQM5UpILsCXqh+J/A8repGt7EXQznscJmVGZ+SuaXoNDJ6Aywx74a5
 qIUxWtCJRrDx1P4PsTZw2sQumqPszEiigNZPSmw2c=
X-Received: by 2002:a17:902:d2c2:b0:2bf:21e6:baee with SMTP id
 d9443c01a7336-2c1641be20dmr16543625ad.28.1780457545921; 
 Tue, 02 Jun 2026 20:32:25 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c164fa0236sm7785685ad.33.2026.06.02.20.32.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2026 20:32:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 40/45] target/arm: Implement FMMLA (FP8 to FP32) for AdvSIMD
Date: Tue,  2 Jun 2026 20:28:49 -0700
Message-ID: <20260603032855.106930-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603032855.106930-1-richard.henderson@linaro.org>
References: <20260603032855.106930-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 target/arm/cpu-features.h        |  5 +++++
 target/arm/tcg/helper-fp8-defs.h |  2 ++
 target/arm/tcg/fp8_helper.c      | 25 +++++++++++++++++++++++++
 target/arm/tcg/translate-a64.c   |  1 +
 target/arm/tcg/a64.decode        |  2 ++
 5 files changed, 35 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 4629a3cf3e..1fc8db8d58 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1630,6 +1630,11 @@ static inline bool isar_feature_aa64_f8dp2(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8DP2);
 }
 
+static inline bool isar_feature_aa64_f8mm8(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64FPFR0, F8MM8);
+}
+
 /*
  * Combinations of feature tests, for ease of use with TRANS_FEAT.
  */
diff --git a/target/arm/tcg/helper-fp8-defs.h b/target/arm/tcg/helper-fp8-defs.h
index 5995d77577..3c74f02022 100644
--- a/target/arm/tcg/helper-fp8-defs.h
+++ b/target/arm/tcg/helper-fp8-defs.h
@@ -35,3 +35,5 @@ DEF_HELPER_FLAGS_5(gvec_fdot_idx_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env,
 
 DEF_HELPER_FLAGS_5(gvec_fdot_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_FLAGS_5(gvec_fdot_idx_hb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_FLAGS_5(gvec_fmmla_sb, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/fp8_helper.c b/target/arm/tcg/fp8_helper.c
index a25e0a1d92..9db4ff4c2f 100644
--- a/target/arm/tcg/fp8_helper.c
+++ b/target/arm/tcg/fp8_helper.c
@@ -806,3 +806,28 @@ void HELPER(gvec_fdot_idx_hb)(void *vd, void *vn, void *vm,
 
     clear_tail(vd, oprsz, simd_maxsz(desc));
 }
+
+void HELPER(gvec_fmmla_sb)(void *vd, void *vn, void *vm,
+                           CPUARMState *env, uint32_t desc)
+{
+    FP8MulContext ctx = fp8_mul_start(env, -1);
+    size_t oprsz = simd_oprsz(desc);
+    size_t nseg = oprsz / 16;
+    uint64_t *n = vn;
+    uint64_t *m = vm;
+    float32 *d = vd;
+
+    for (size_t seg = 0; seg < nseg; seg++, d += 4, n += 2, m += 2) {
+        float32 d0 = f8dotadd_s(n[0], m[0], 8, d[H4(0)], &ctx);
+        float32 d1 = f8dotadd_s(n[0], m[1], 8, d[H4(1)], &ctx);
+        float32 d2 = f8dotadd_s(n[1], m[0], 8, d[H4(2)], &ctx);
+        float32 d3 = f8dotadd_s(n[1], m[1], 8, d[H4(3)], &ctx);
+
+        d[H4(0)] = d0;
+        d[H4(1)] = d1;
+        d[H4(2)] = d2;
+        d[H4(3)] = d3;
+    }
+
+    clear_tail(vd, oprsz, simd_maxsz(desc));
+}
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 83d90cfcf4..367f87f05d 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -7501,6 +7501,7 @@ static bool do_f8dot(DisasContext *s, arg_qrrr_e *a,
 
 TRANS_FEAT(FDOT_sb_v, aa64_f8dp4, do_f8dot, a, gen_helper_gvec_fdot_sb)
 TRANS_FEAT(FDOT_hb_v, aa64_f8dp2, do_f8dot, a, gen_helper_gvec_fdot_hb)
+TRANS_FEAT(FMMLA_sb, aa64_f8mm8, do_f8dot, a, gen_helper_gvec_fmmla_sb)
 
 static bool do_f8dot_idx(DisasContext *s, arg_qrrx_e *a,
                          gen_helper_gvec_3_ptr *fn)
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index a3e404e7fe..6922e91010 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -1227,6 +1227,8 @@ FMLALL_sb_v     0.00 1110 0.0 rm:5 110001 rn:5 rd:5 \
 FDOT_sb_v       0.00 1110 000 ..... 11111 1 ..... ..... @qrrr_s
 FDOT_hb_v       0.00 1110 010 ..... 11111 1 ..... ..... @qrrr_h
 
+FMMLA_sb        0110 1110 100 ..... 11101 1 ..... ..... @rrr_q1e0
+
 ### Advanced SIMD scalar x indexed element
 
 FMUL_si         0101 1111 00 .. .... 1001 . 0 ..... .....   @rrx_h
-- 
2.43.0


