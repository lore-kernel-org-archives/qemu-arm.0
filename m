Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp937528njk;
        Fri, 24 Jan 2025 08:47:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW/Od5Fc1iC2/E0etKqBk4Sv6SrKdSl4vs1hZqEPMUxze0KCqALH0vPVS6zozG/vwF5rWemiIR7Pdbmdg==@linaro.org
X-Google-Smtp-Source: AGHT+IE2ZxjF2h6Z8qFs7akImfx3z3ZGkSpB9AEfHXxNiPnLP6KxnlKAXyqHoMNVot37KcjHmmur
X-Received: by 2002:a05:6102:50a5:b0:4af:e99e:b41b with SMTP id ada2fe7eead31-4b690c8894fmr29103466137.19.1737737246122;
        Fri, 24 Jan 2025 08:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737737246; cv=none;
        d=google.com; s=arc-20240605;
        b=aca/DEW1KlQm+RH2hf9odDCrSYFNxvBONp18KS6/cn07RX4q4MAgMIZgtUt9PHsztq
         dbbsEfXX9EssrVdNfruWn24gTTkcVn7ldK0ribugokTYKSMIvb2hGSGel7gnGpgNjWoQ
         yeivl/jUR6JnB9OEMNdAYzJO4sUVPZ88JvmlMZqm+jPgP2SqpSmk2YdnMQPB1Z9/kn4P
         oyMSjv5tfBkouo8CPBOxhpB83wy6LAH7vqk/PFr0sA/UtujtijOWr11nqrybay6v36mA
         kqPkhwb0Qsh7V+0ArfPStP7m7EB7NDBvCcl4jjaTYzMJoVzvnYyX3w82Oj92hriuLksk
         dY5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hQP+mP8aoERhG/l82UzKUhVhRS0CYJg3hdc1vQH02Ms=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=ZEb75Gi93KTVdtufQYTudYVz93ijAB6Wv+CWTwu6Waxk43YOLLdbUqhsHizUkuEzvc
         52tuI4//fZOdYHxTfeqzTnha25TKdJRtGQ2ZCysQlOmXqrIVDCzde02DB/lJ/2GWZ37q
         Xn9Y2Jo8Q+96Qy6Tt3bfyUPXaz++X+CLkubdDEH9Epi0ksH2WDgsh0JPtwvLPdGx4SwM
         rGMdZIfaxKy++KPI4I424Wtl+NKhtJL+zbkNyT+4GoOdbYUB3UDkbeiYY8xEXm67ywTe
         YFZ8c3f+gufyP1/qxfnLfd1LRpYgLfsY1pWX2UIBpT7U27NxWjCAXiF29c6DGRKfurAx
         E8fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l5aMiUJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709983c79si1159443137.333.2025.01.24.08.47.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:47:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l5aMiUJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMh3-0007Su-Uv; Fri, 24 Jan 2025 11:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZh-00069Z-8J
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMZX-0005oY-TE
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:30:24 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43635796b48so15510935e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736199; x=1738340999; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hQP+mP8aoERhG/l82UzKUhVhRS0CYJg3hdc1vQH02Ms=;
 b=l5aMiUJMJIoXlAMi1Tvd/ob3DsmkIzNecnMF6NE34pBLtRwFWNz7yCQF7CMwHWg2Oi
 f39FWXNf5wYZUCODnDMj3ZGrl7Gzf8vqhN9mvZpTaQ6SxWGyq0fcNfVU73GqoxEIWPt8
 LH98hGygZZ5uUR6y9XURTSoz6r7/x6XG1RrQj7dL5nkgMNpxGd+pN86wTNlDRX731jBu
 U/17RrgmYgFCWdK4l3j14l3/d73Y8ezgO8XfouteTatmk5ngsRSF/tEI2iRXCLeDe0vN
 UOePXeuk6LEH5T43J8WaLdYRbH33J7l/dfSSF2jPIdmeOt37SAqlK4tLMu28s17hykEH
 Nuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736199; x=1738340999;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hQP+mP8aoERhG/l82UzKUhVhRS0CYJg3hdc1vQH02Ms=;
 b=WSx56hpj/0PL1bv6jVoT0uPN4gaBkqe2/kLs7bZF9izemPJdwnmU58FB2wP735E89P
 57Z7PqD9RGuwQe58V6SlwULq8rnTtN8qho0dEpEDfkAzgaEJlzypHBLTzbbgkFRyo+Jo
 sFPPsVc7RNrsVWXxYp49ve/WA9RehdEpvXvUKxcw+miSyQj7cJ41VatcBBF1U1k/J3wc
 GDbQLDgTWxSXZhGEcCIxoD+XRs5aiFkvrx15oKXYy1rrx7ZfaCWCDrfZRa1i6rNergcK
 OW9hJnAI8Mg6OVb8ib/PcMqBu/6b6GKu0znfbk8EOlDdMwaoYe9LbHFNOLuemogHsBcu
 Mavg==
X-Gm-Message-State: AOJu0YywpjZskIz5FEBnl7ok+UeCXJvrdMLQ7nEQHOaDFlfKJxfNMD8K
 0dVXz6OPexiXv2Wh7PBxA7lqiivniOnbUaH7SPtPiE5mWZZMOMQfC2gAdC2LDn1QTIEG4HHfjLk
 a
X-Gm-Gg: ASbGnctkJ5Xz/GL/PW0YZvwTuXxxAzJKA6vHEPvd1R4CeOlN8lgkpVnO0ssQ2fiS/TV
 K3f6BNk4js+St0HrNHGZB+p0wcrpBu/+4vDgMpGgCSjw6VeVGo9wlFGfqCkNl9eBLt0diLCNlSw
 fk9kOczax0jlWcmXRczuVG6gqLYDtUlTHZxJpIJLGumlofKo1LUFbTw4HrgcWU/hXQ+vDoeRIr/
 kiUfxxZedGeBKuv5P9m9KqEbuIg2JvwfYZYmGjFRDnlY39O5Id62b72lgtKECVE5/HsvLVEvMf9
 y1EY8GFVasw=
X-Received: by 2002:a05:600c:21d8:b0:434:ea1a:e30c with SMTP id
 5b1f17b1804b1-438bd0bca9amr41267815e9.13.1737736199253; 
 Fri, 24 Jan 2025 08:29:59 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:29:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 64/76] target/arm: Handle FPCR.AH in negation in FMLS (vector)
Date: Fri, 24 Jan 2025 16:28:24 +0000
Message-Id: <20250124162836.2332150-65-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eF17rQ1sSHzS

Handle the FPCR.AH "don't negate the sign of a NaN" semantics
in FMLS (vector), by implementing a new set of helpers for
the AH=1 case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h            |  4 ++++
 target/arm/tcg/translate-a64.c |  7 ++++++-
 target/arm/tcg/vec_helper.c    | 25 +++++++++++++++++++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 43505d5fedc..0a8b4c946e1 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -782,6 +782,10 @@ DEF_HELPER_FLAGS_5(gvec_vfms_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_vfms_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_vfms_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
 
+DEF_HELPER_FLAGS_5(gvec_ah_vfms_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_vfms_s, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+DEF_HELPER_FLAGS_5(gvec_ah_vfms_d, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, fpst, i32)
+
 DEF_HELPER_FLAGS_5(gvec_ftsmul_h, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, fpst, i32)
 DEF_HELPER_FLAGS_5(gvec_ftsmul_s, TCG_CALL_NO_RWG,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index c688275106f..0b57e35f999 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -5871,7 +5871,12 @@ static gen_helper_gvec_3_ptr * const f_vector_fmls[3] = {
     gen_helper_gvec_vfms_s,
     gen_helper_gvec_vfms_d,
 };
-TRANS(FMLS_v, do_fp3_vector, a, 0, f_vector_fmls)
+static gen_helper_gvec_3_ptr * const f_vector_fmls_ah[3] = {
+    gen_helper_gvec_ah_vfms_h,
+    gen_helper_gvec_ah_vfms_s,
+    gen_helper_gvec_ah_vfms_d,
+};
+TRANS(FMLS_v, do_fp3_vector_2fn, a, 0, f_vector_fmls, f_vector_fmls_ah)
 
 static gen_helper_gvec_3_ptr * const f_vector_fcmeq[3] = {
     gen_helper_gvec_fceq_h,
diff --git a/target/arm/tcg/vec_helper.c b/target/arm/tcg/vec_helper.c
index 5e9663382a9..c720b435d58 100644
--- a/target/arm/tcg/vec_helper.c
+++ b/target/arm/tcg/vec_helper.c
@@ -1579,6 +1579,27 @@ static float64 float64_mulsub_f(float64 dest, float64 op1, float64 op2,
     return float64_muladd(float64_chs(op1), op2, dest, 0, stat);
 }
 
+static float16 float16_ah_mulsub_f(float16 dest, float16 op1, float16 op2,
+                                 float_status *stat)
+{
+    op1 = float16_is_any_nan(op1) ? op1 : float16_chs(op1);
+    return float16_muladd(op1, op2, dest, 0, stat);
+}
+
+static float32 float32_ah_mulsub_f(float32 dest, float32 op1, float32 op2,
+                                 float_status *stat)
+{
+    op1 = float32_is_any_nan(op1) ? op1 : float32_chs(op1);
+    return float32_muladd(op1, op2, dest, 0, stat);
+}
+
+static float64 float64_ah_mulsub_f(float64 dest, float64 op1, float64 op2,
+                                 float_status *stat)
+{
+    op1 = float64_is_any_nan(op1) ? op1 : float64_chs(op1);
+    return float64_muladd(op1, op2, dest, 0, stat);
+}
+
 #define DO_MULADD(NAME, FUNC, TYPE)                                        \
 void HELPER(NAME)(void *vd, void *vn, void *vm,                            \
                   float_status *stat, uint32_t desc)                       \
@@ -1605,6 +1626,10 @@ DO_MULADD(gvec_vfms_h, float16_mulsub_f, float16)
 DO_MULADD(gvec_vfms_s, float32_mulsub_f, float32)
 DO_MULADD(gvec_vfms_d, float64_mulsub_f, float64)
 
+DO_MULADD(gvec_ah_vfms_h, float16_ah_mulsub_f, float16)
+DO_MULADD(gvec_ah_vfms_s, float32_ah_mulsub_f, float32)
+DO_MULADD(gvec_ah_vfms_d, float64_ah_mulsub_f, float64)
+
 /* For the indexed ops, SVE applies the index per 128-bit vector segment.
  * For AdvSIMD, there is of course only one such vector segment.
  */
-- 
2.34.1

