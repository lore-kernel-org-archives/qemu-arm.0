Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F2ECD6E56
	for <qemu-arm@archiver.kernel.org>; Sat, 30 May 2026 23:14:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wTSrS-0000If-EP; Sat, 30 May 2026 19:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrQ-0000H3-WB
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:57 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wTSrP-0007Z7-AZ
 for qemu-arm@nongnu.org; Sat, 30 May 2026 19:12:56 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c857d04cc99so496986a12.0
 for <qemu-arm@nongnu.org>; Sat, 30 May 2026 16:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780182774; x=1780787574; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dF/XamizDFHvwhOgZesNBvMvEKMQrxAaauoIb0LzJE0=;
 b=Doz/C/h8tgkAchsSB9GkCP+C4U/jrDHnzbT9EhVq+EfwuAK8qDSYO017uKheHJ7f/8
 XAN/2AUb7jcC8eWlnv7P6nhBOb3I3azxCRFbmWmu6hpFsdAWFMjRAF97uXQudnm49t7V
 y5ovSNXutu4886WzQ8B912t/fHD48RNUAJ+8HFwHmip2d5mU+GQ71Rx8nNg/ekO5gGdi
 S5DkF5jucld/OvrEKvE1S8URRuQHh/2Cg5Ac454+IwHG96BDIN/hCwLKGtUVPYYSVS4q
 8bPs2ClWWRCotmwTEvBDEArdVvK4olbuvydNtIfI9ROsgyM0TxwtOW1ulKJNGgZGyCPQ
 mbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780182774; x=1780787574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dF/XamizDFHvwhOgZesNBvMvEKMQrxAaauoIb0LzJE0=;
 b=ejyuqzhgdY6k8odz8o4c42EuIewl2NbliN0pfqGvY8/NafeSKaFx1u59+yxcz5EL7G
 veMk7vPV52yXaGOKt9FL4EyEVtpJlVWYQz8e5Bo8w7ZTs/KWTa9IaUJLkLap1Wvoky3W
 VSssTb3rWBJQLQvgso8fWuVjQeg/8eKCMCxG4op0GLzD/eH0eVcM9j7iVpjmchW8dgpD
 ydDGMLemGJLlpA+L7/rm9QhLw5QFgNkaW85lKTtkd5QDcyyKF//o55ZozIVGB4nrEdoR
 gmymzlYp/MaPOJzlX613dzJPWfxozuUL0OXX0r5qwV+yQ1lqvIrcWpF30sKkt2PT3Wom
 3szg==
X-Gm-Message-State: AOJu0YyCapSwSc96zf3W4e3nkVpOXZwrJ+P0iBUwgBBst3vHJFOaoo8K
 bM7Qe8BxiiPpG1y8x69rmrYgYqZrG92Iccnfyyi+p4s90Mm67EaF/+JSzv3/yKChU+U=
X-Gm-Gg: Acq92OHeL7HQDDWBPaXmmEiT7VEBTB8NSBPuomRdWTMe0zGzVHnVBsGEOPjNqIfQgro
 ZiFki1X5Fg3PbQeNrcKZDlTET/FETM41C9h4eqk2ktW90b5POkoonElLO7IymN7zbu5QE1U4qt3
 w6glSRWW+6H+Ok5XK7GeemRkUvJ26xK/ZsNHr01hUFes6qoGvLsEnK0uwFt7C9L5Lut2tlWsdG5
 s0bCxwFtJ/J4o9Kaz1rgArraR2SsAhIioegFBhZS7FiuhNSwxoWB4W7+u9/9fdCL2gQpMW/mJEh
 mJV3eBs6twhQbQpIYV1K3m+7GomWc8HB0v7PbM+J5YHyNsjskRhy6ifaMR14YqTc6LkZAkErVW7
 249IQxZTJFocVPH7xUlluQcU2a8qzhwZlLgofe9C9FnUKKQq9Rhwts/5i4LSW7R4j+wDJh9XlhQ
 A3cubleB+f9n+ol9veRj0CqDyDtAZ42W7rX1qyaB4=
X-Received: by 2002:a05:6a20:450c:b0:39c:4e62:b843 with SMTP id
 adf61e73a8af0-3b426791ab1mr4428143637.10.1780182773695; 
 Sat, 30 May 2026 16:12:53 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c857729d3d1sm5634356a12.21.2026.05.30.16.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 16:12:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 22/41] target/arm: Implement MOVT (vector to table)
Date: Sat, 30 May 2026 16:12:10 -0700
Message-ID: <20260530231229.400441-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530231229.400441-1-richard.henderson@linaro.org>
References: <20260530231229.400441-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
 target/arm/tcg/translate-sme.c | 18 ++++++++++++++++++
 target/arm/tcg/sme.decode      |  2 ++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 3a754f8d61..050a826849 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1580,6 +1580,11 @@ static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, FA64);
 }
 
+static inline bool isar_feature_aa64_sme_lutv2(const ARMISARegisters *id)
+{
+    return FIELD_EX64_IDREG(id, ID_AA64SMFR0, LUTv2);
+}
+
 static inline bool isar_feature_aa64_sme2(const ARMISARegisters *id)
 {
     return FIELD_EX64_IDREG(id, ID_AA64SMFR0, SMEVER) != 0;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 76bbacfb6e..c4bede2ae3 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -391,6 +391,24 @@ static bool do_movt(DisasContext *s, arg_MOVT_rzt *a,
 TRANS_FEAT(MOVT_rzt, aa64_sme2, do_movt, a, tcg_gen_ld_i64)
 TRANS_FEAT(MOVT_ztr, aa64_sme2, do_movt, a, tcg_gen_st_i64)
 
+static bool trans_MOVT_ztz(DisasContext *s, arg_MOVT_ztz *a)
+{
+    if (!dc_isar_feature(aa64_sme_lutv2, s)) {
+        return false;
+    }
+    if (sme_sm_enabled_check(s) && sme2_zt0_enabled_check(s)) {
+        int svl = streaming_vec_reg_size(s);
+        int tsize = MIN(svl, 64);
+        int offset = (a->off % (64 / tsize)) * tsize;
+
+        tcg_gen_gvec_mov(MO_64,
+                         offsetof(CPUARMState, za_state.zt0) + offset,
+                         vec_full_reg_offset(s, a->rt), tsize,
+                         offset ? tsize : 64);
+    }
+    return true;
+}
+
 static bool trans_LDST1(DisasContext *s, arg_LDST1 *a)
 {
     typedef void GenLdSt1(TCGv_env, TCGv_ptr, TCGv_ptr, TCGv, TCGv_i64);
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 2b9e41a75a..339de72b8a 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -141,6 +141,8 @@ MOVAZ_zt4       11000000 11 00011 0 v:1 .. 00110 za:3 zr:3 00 \
 MOVT_rzt        1100 0000 0100 1100 0 off:3 00 11111 rt:5
 MOVT_ztr        1100 0000 0100 1110 0 off:3 00 11111 rt:5
 
+MOVT_ztz        1100 0000 0100 1111 00 off:2 00 11111 rt:5
+
 ### SME Memory
 
 &ldst           esz rs pg rn rm za off v:bool st:bool
-- 
2.43.0


