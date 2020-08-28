Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1690559lfc;
        Fri, 28 Aug 2020 11:38:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyFu/UWS57n1ob1BMM7zSx21CDXJyErz+QC0JkN/UwFLulfHF29N70IciefjM3dE1J9Xk8
X-Received: by 2002:a5b:d08:: with SMTP id y8mr4829953ybp.476.1598639894328;
        Fri, 28 Aug 2020 11:38:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598639894; cv=none;
        d=google.com; s=arc-20160816;
        b=UcFY2kJI8uTQ4j0aRV1iPhDGLN79dWVLtEgBwaFwY+NJBxzlpjCm9G+pVgTTBiSiPH
         3rR9erim05Fnz5OWkT1EVbjGaDThXp7SmPU+Cir1hHk1fyNkbnY9XsaNW/Ftsf6iKkTd
         zpciPdB3oFpw6EH6def6s/UD+8Eo7+xav5ycRUemszzOdNI3CxsLpIV5tDdeU/ISJFwm
         MiPUIolTFW7J9P0U1Km8b7Ky9cX8N2AQdefs6CDTjs19xnyBu/A8Nm720tSdJL6kjF8A
         ATngVh8n0v5SmwPgkwX5C31WJ4V7IFqeXKoeJtquirxgy1C5MZyzj2lqD6tjVkxw2YwG
         ysBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+SArinhnBNgui3GNs7u+aKBEwW+643mTjOuIFolyhT4=;
        b=aXIeJ9VTuRfrUuFtrpWDxTGag2G44dgV+KghgQxg+XJsb8sHP6QM+KXke1YS6iBvMp
         +LpqUT8eh2dpMibAZwQ29Cc5hWmA/PvEv71n3m7H3AyTc1P41d9R0sQDnu2bxJkt1Ucs
         oWt9rY1wM2i382YupeKishXfPVLLhG2RKufD5Fr1FqI8tCKhTG9tPcLhO6iNrT/0ZFsq
         K/Kk3mzxxXpEIV1U7o4LrAQfQWa+4Ogl2h4sFl5S7NajxlWGkN5fppgj/x7+Sqwlu5MQ
         Unc58ddbwgxqibZzVQ5mDYbqw/7BXRwJZpRBuA4Ddy/vK61Da7sr9KTVrh2b7Z/URDGa
         rI2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rwdg2jqB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i72si73223ybg.251.2020.08.28.11.38.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:38:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rwdg2jqB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjGP-0007hx-Ik
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCO-00027r-Qm
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:34:06 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCJ-0005vI-Fb
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:34:02 -0400
Received: by mail-wm1-x341.google.com with SMTP id w2so132119wmi.1
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 11:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+SArinhnBNgui3GNs7u+aKBEwW+643mTjOuIFolyhT4=;
 b=Rwdg2jqBQUKrOFgG4Da1Ln1wHNl7br4p9tmcc8/1oqPz6zyFbTroZGVlDJsxUe2+k6
 auTkS4F6doocWS3zmmEd7eoGAa4XLC2IDVm+eWTBt9NNYA9JqmSo/g8dMpxzs4uMQCHk
 QNw9ibA7tXqF308MAyvJwSU18i1O34APggSwBOwodR413boXyPFWC6LaD7M/OPcbFsUk
 QPLvMCNsucajCL+Y3YbtP5q+/DfgZC/R1hloBe4HdTYiMCMSbYZUvRuw+F8OOXPW1xrg
 fUpEwtiU6wB5DUGdOOTAvzpchW9oUJdJzRk4uL/SAFnJ/16wWnel0Pj6rS0LukIwP2So
 vVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+SArinhnBNgui3GNs7u+aKBEwW+643mTjOuIFolyhT4=;
 b=XOZOIUSRkzc0jd8llKnP4nxLjd7ow52QqZPzMEiZEg08NV89jT0vxWbNKEFGhZyJ3+
 n/2JnBCV4R/j6oOCd96SJKB05UXF9MyaxiurL5jzReTecaMh9RC6X793q4odgF+zkiM1
 J0RKwaJdI3ZoZB1zUx9V+CtEAVflc0VtAT+TRkqOtHps+QxX1eEMRb7MTa1/LOZv77QD
 5n02d8ES5HvWGJmDXR06HP55JK8D74FMVCpL3OqRW1uQUhO2Kbxqfudk223UmjChQ5FG
 FGjsm85K6yzPbUGTxLks2qjm1J3T2QQwO8dbF+Za+ncujrxL6hBYo65npX1Hd9BLf7Se
 UmXg==
X-Gm-Message-State: AOAM532gDZU6WIdE6w1Wb6rsEzO4O9YtD3kltX6Y9DxLbTu6Gl2Fs3ec
 SXQfGfWFN9sbH/bwLy+JhrD+SJWWIeRl2qOK
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr13430wmj.79.1598639637959;
 Fri, 28 Aug 2020 11:33:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:33:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/45] target/arm: Remove local definitions of float
 constants
Date: Fri, 28 Aug 2020 19:33:10 +0100
Message-Id: <20200828183354.27913-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QP/50LkqpPxS

In several places the target/arm code defines local float constants
for 2, 3 and 1.5, which are also provided by include/fpu/softfloat.h.
Remove the unnecessary local duplicate versions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-a64.c    | 11 -----------
 target/arm/translate-sve.c |  4 ----
 target/arm/vfp_helper.c    |  4 ----
 3 files changed, 19 deletions(-)

diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
index 8682630ff6c..030821489b3 100644
--- a/target/arm/helper-a64.c
+++ b/target/arm/helper-a64.c
@@ -234,17 +234,6 @@ uint64_t HELPER(neon_cgt_f64)(float64 a, float64 b, void *fpstp)
  * versions, these do a fully fused multiply-add or
  * multiply-add-and-halve.
  */
-#define float16_two make_float16(0x4000)
-#define float16_three make_float16(0x4200)
-#define float16_one_point_five make_float16(0x3e00)
-
-#define float32_two make_float32(0x40000000)
-#define float32_three make_float32(0x40400000)
-#define float32_one_point_five make_float32(0x3fc00000)
-
-#define float64_two make_float64(0x4000000000000000ULL)
-#define float64_three make_float64(0x4008000000000000ULL)
-#define float64_one_point_five make_float64(0x3FF8000000000000ULL)
 
 uint32_t HELPER(recpsf_f16)(uint32_t a, uint32_t b, void *fpstp)
 {
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 15ad6c7d323..e4cd6b62517 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3803,10 +3803,6 @@ static bool trans_##NAME##_zpzi(DisasContext *s, arg_rpri_esz *a)         \
     return true;                                                          \
 }
 
-#define float16_two  make_float16(0x4000)
-#define float32_two  make_float32(0x40000000)
-#define float64_two  make_float64(0x4000000000000000ULL)
-
 DO_FP_IMM(FADD, fadds, half, one)
 DO_FP_IMM(FSUB, fsubs, half, one)
 DO_FP_IMM(FMUL, fmuls, half, two)
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 64266ece620..02ab8d7f2d8 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -582,10 +582,6 @@ uint32_t HELPER(vfp_fcvt_f64_to_f16)(float64 a, void *fpstp, uint32_t ahp_mode)
     return r;
 }
 
-#define float32_two make_float32(0x40000000)
-#define float32_three make_float32(0x40400000)
-#define float32_one_point_five make_float32(0x3fc00000)
-
 float32 HELPER(recps_f32)(CPUARMState *env, float32 a, float32 b)
 {
     float_status *s = &env->vfp.standard_fp_status;
-- 
2.20.1

