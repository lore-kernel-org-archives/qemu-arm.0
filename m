Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A17CD4851
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:40:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPSx-0001QP-5U; Sat, 16 May 2026 20:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPSD-00077T-J7
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:34:10 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPS5-0006qR-QY
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:33:58 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-c801d732058so346487a12.1
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778978032; x=1779582832; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7JulMb7JBgH2EgAoTHRzYHxSimKKsWGbaNst37ZkVAE=;
 b=MBveLbrIbXv50/ykQz0TdiuxzpO7NxPh3jOYbN2SGmRKJGJgV3OPu6z5KrtcB+OZxT
 qg3sJN8kOgkxbk0fU+MKYIgaxQjKyBTS3xHxZnI6kLrxf5jUO0prRaVyrYwXHCwFGWnj
 MEXVcvxTMTX8xjBjoKJfK2wSWrSO6RZzI4EGsQxVTQvTraVUoHkDuNZ8vRk8thKzRKVR
 O8IAYR/ZHOTksH1aPbJtdq765mn8DF2aftwAc488YfTyEzLWP8nB9Mj53zNBWUG8DQD1
 ydJFtK8ZBysCKFTPeDhc3/6k3bZA3sKd33KbZJT/bt80qPvp6ZZ6A/AD77R7nEi+Crnb
 s13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778978032; x=1779582832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7JulMb7JBgH2EgAoTHRzYHxSimKKsWGbaNst37ZkVAE=;
 b=QF+w680qbHLHqWIj4iK+MVZAexhGZfhW7h7C5hl2Z1WUvWmtqGJDospNiDovvRJA65
 CnNXL1uEqqK8VU94TFgKn4hvKOaxj9V1mQnqtcQZTOYCBdAfd5t42SlnWV54B8EQuOKN
 0MoUYYfNskA8n8aiGN8SkcysxvA6q9+rAV25P0dG3KBjmVrCcWOxbf3GFbiENW9cX2iD
 6TcbfWVaLVNLY/Frilh3H0s1Supn8bQ4WYTNmJ3YxwmIjBnv7CVuziA8iUBMU2BacGvs
 ku+SHYHVQogZ0U9aAVTCjmdIo2Jk20m+EWgTlviNWHaQhBwOMPdENCK0L7zmWeqcH2aQ
 MRiw==
X-Gm-Message-State: AOJu0Yx5LuVI1xETJmOQt+eVgjZPrvq7PI3wGICX4bGQht6auRXc2DXu
 xgEenRiO3It/WA5XERZ24/ySMvjb7o6SJ5IiP/FSzqMoru5u+G14oGADLYWJ20hfDAZ7YpKm/5t
 /5jfv
X-Gm-Gg: Acq92OGsdbXf3ckEfWIgBtejsejhYiO8rtqlgwXiR2qYToFP9c10uqW91K6K6cd+HMm
 55NF7M9kl7P3K/vfT4VKxhiqbPO8Cfx4I2BSTaKX6aI7X9+Y05edrRr7fba0z7fSZuFTO5ozw12
 z+bMsdQswjtqzp2gs4vJGF+q/wav5CmYsaJe2AVYUs7Sci98e+agGNpgFRf+B9vDfspwCoYvLjd
 0GL/f7aIIbV4d6oyGqHVO8lDGTBmC274GdZhynfwEuDC1T+RWl+qVx5lUUDzss1jFgJ/hjqg42G
 Kdrmxm8+tISz763Wf+HGaCwmuQ9gsPMF5TzLkV98RfMudb3XlmyXrRAcJek3px/dEhACd3FCkFI
 HVG9mQpWiJzG/b9EWfyoEF8jT+2VHSlDFcE2q4qJc1colppsNXiKqoe02xYJ8MZRya4QvlNy8xe
 UTAvZ8udQWfzKg/dcC3/7CoZDaKkCO
X-Received: by 2002:a05:6a20:7f92:b0:3a2:ce0a:a629 with SMTP id
 adf61e73a8af0-3b0be709b97mr13918809637.12.1778978032066; 
 Sat, 16 May 2026 17:33:52 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c82da93df0dsm3010559a12.19.2026.05.16.17.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:33:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 51/63] target/arm: Implement FDOT (FP8 to FP32) for SVE
Date: Sat, 16 May 2026 17:29:50 -0700
Message-ID: <20260517003002.321430-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
 target/arm/tcg/sve.decode      |  4 ++++
 3 files changed, 44 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index fbce0386ef..17d6acc14d 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1550,6 +1550,11 @@ static inline bool isar_feature_aa64_ssve_f8fma(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8FMA);
 }
 
+static inline bool isar_feature_aa64_ssve_f8dp4(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SF8DP4);
+}
+
 static inline bool isar_feature_aa64_sme_b16b16(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, B16B16);
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index e23ca43f55..88e6148b83 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -8372,3 +8372,38 @@ TRANS(FMLAL_idx_hb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_hb)
 
 TRANS(FMLALL_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_sb)
 TRANS(FMLALL_idx_sb, do_fmla_fp8, a, gen_helper_gvec_fmla_idx_sb)
+
+static bool do_f8dp4(DisasContext *s, gen_helper_gvec_3_ptr *fn,
+                     int rd, int rn, int rm, int index)
+{
+    bool fp8dp4 = dc_isar_feature(aa64_f8dp4, s);
+    bool ssve_fp8dp4 = dc_isar_feature(aa64_ssve_f8dp4, s);
+    bool ok = false;
+
+    /* Feature detection and enabling are complex here. */
+    if (!(ssve_fp8dp4 || (fp8dp4 && dc_isar_feature(aa64_sve2, s)))) {
+        return false;
+    }
+    if (fpmr_access_check(s)) {
+        if (fp8dp4) {
+            s->is_nonstreaming = !ssve_fp8dp4;
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
+TRANS(FDOT_sb, do_f8dp4, gen_helper_gvec_fdot_sb, a->rd, a->rn, a->rm, 0)
+TRANS(FDOT_idx_sb, do_f8dp4, gen_helper_gvec_fdot_idx_sb,
+      a->rd, a->rn, a->rm, a->index)
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 06bbd7fa63..c49e992f10 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -1874,6 +1874,8 @@ FMLALL_sb       01100100 00 1 rm:5 10 idxn:2  10 rn:5 rd:5 &rxx idxm=0
 FDOT_zzzz       01100100 00 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 BFDOT_zzzz      01100100 01 1 ..... 10 0 00 0 ..... .....  @rda_rn_rm_ex esz=2
 
+FDOT_sb         01100100 01 1 ..... 10 0 00 1 ..... .....  @rda_rn_rm_ex esz=2
+
 ### SVE2 floating-point multiply-add long (indexed)
 
 FMLALB_zzxw     01100100 10 1 ..... 0100.0 ..... .....     @rrxr_3a esz=2
@@ -1897,6 +1899,8 @@ FMLALL_idx_sb   01100100 idxn:2  1 .. rm:3 1100 .. rn:5 rd:5 \
 FDOT_zzxz       01100100 00 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 BFDOT_zzxz      01100100 01 1 ..... 010000 ..... .....     @rrxr_2 esz=2
 
+FDOT_idx_sb     01100100 01 1 ..... 010001 ..... .....     @rrxr_2 esz=2
+
 ### SVE broadcast predicate element
 
 &psel           esz pd pn pm rv imm
-- 
2.43.0


