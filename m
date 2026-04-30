Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E8AFF8875
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 00:26:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIFDz-0006rj-7C; Wed, 29 Apr 2026 20:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFDe-0006Qa-RJ
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:25:35 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wIFDY-0007Tf-U6
 for qemu-arm@nongnu.org; Wed, 29 Apr 2026 20:25:26 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-c70f91776fcso111871a12.0
 for <qemu-arm@nongnu.org>; Wed, 29 Apr 2026 17:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777508723; x=1778113523; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aaacGOh8gwX3lVHScHw0vooo3S9NCC3dC/eSJzjcavA=;
 b=XI9upLLuXm+Pyc7oDBaFUl45gPZ8D/w1rXRqA/QR88nXOKKLpVixxXkrVlZBKHAQfe
 BugH2i/AjmCHuaxekpsD8bp2rM38tGSHBM7OBGyiohb6smuvNVjIE4DoWxrMBLviwy4l
 rsSFf3vnM+tcC9XX5+Cw1I59ks6tlEKstWO2NeKH/tkQqyuyitiTmCLYlmB9mt2n1ivk
 AtgKwaCgi2/408pzvmLn9r0qZqegjpinv/qdegA9rCygDVbrlayRF2X96dMcvyiVZff7
 M3QT3+/Kqr8MtVS6rbM+fBtj6gJ+WTh7vYgG1arOWnQqVR149qjdP0OLrCOMnUTnmQOV
 OxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777508723; x=1778113523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aaacGOh8gwX3lVHScHw0vooo3S9NCC3dC/eSJzjcavA=;
 b=iNURF6xd+icc4ipiSMFXhpTecVepnX+nOLOtoVqM14EYtWRfifTXzYHCcQUqArTDwm
 VpsKeuW8qo2X4KPq4dUuI3V1ig9QDkhmPTF7vSx1mF5VTfPCrLsPrTTgpCTK2o1km2OB
 cwVgKcqtCXeI70/CAR8HMwYXPJ13ukWhHS/gj32VmrYnoJGbPCEDgy4APhduKLLagbkO
 Xf8863rzWBvybFkrz21J/5sj5s6gGagd+D08ixTrANf8MyIjvTGoFq8Fqmaz0ljA5ABC
 hsK6UBDG0ewXuaNMVBfNEylzVh3j+8WOXop8y+sCbTyYWoQ0IH7YGNwQEywrE9Q+Mgoj
 IFhA==
X-Gm-Message-State: AOJu0Yzy/Wet9QKHhZIFdj7fobUQnz5sHNcR78jYW8aDExhp2S+esaty
 x3nGEnFoAce4S+2qpJ8VA7N8wXNvINjmgpekojRpThYaAgPS7VCrqf++9xclrAiJvY1XzsUjtPf
 0+OpJMBo=
X-Gm-Gg: AeBDiet+rTAsny5EuMc+tBDEB5xQxi3uHJiNT4rk3BNYvdYLVykGvAh2ifDvo8BaRsn
 jNGjKG9I2TZqYlGMBWKByzsIWYGJtRK4w2IZ10WJ/gCko++siUnn4E6lNDbiUq0ecpYVPYJDxZ9
 xsKGotEFlw4Hq3SoJmkcxy5zpX2JNbRzTfcl8yIE9edGijlcVXYuwsX+fW0jF2BqJ09B969yUfJ
 hNTJXyz2Al6KSS9IR6GhkWhk42CnN57mm4ftW0saGCqTPFxwPb8FHZgbi15VB8MM9qFdXWRRnlZ
 unQ36rOdgSAYJMFQAlbFuBfq03ebaCFSElM91BV6VjH6fR9JzcbeXMePK/13lj8604QO6bk1TAy
 bE4RsfnTv961HNr766cvosoZniBKYJT2ht+ViP2Srn0wrhNkaB3DRGrdhd+n/mYXMz7tZYGniGy
 w7rQQ1b3+9sawww3ZgsnukbTC8kRcYVNu08phwzW8K
X-Received: by 2002:a05:6a20:a106:b0:3a0:d88:6d7f with SMTP id
 adf61e73a8af0-3a3cf861605mr714215637.42.1777508723068; 
 Wed, 29 Apr 2026 17:25:23 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c7fd64f21b4sm3204112a12.21.2026.04.29.17.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2026 17:25:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 40/47] target/arm: Implement MOVT (vector to table)
Date: Thu, 30 Apr 2026 10:20:39 +1000
Message-ID: <20260430002046.59739-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430002046.59739-1-richard.henderson@linaro.org>
References: <20260430002046.59739-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
index 15e9821ce5..4b228b4f3b 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -1556,6 +1556,11 @@ static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
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
index 2f79c458e1..214427db1f 100644
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


