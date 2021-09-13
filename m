Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3513413lfb;
        Mon, 13 Sep 2021 02:58:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxx/PHB7d3mjvGAgl5vXoXEXozpY2+WD80/dThELNabsnVB4zEEKUp84AyNWqUJoyfnioVl
X-Received: by 2002:a02:708f:: with SMTP id f137mr9005600jac.68.1631527113860;
        Mon, 13 Sep 2021 02:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631527113; cv=none;
        d=google.com; s=arc-20160816;
        b=UnYKUAiw4WgptiU/xcuGprGo7PIc6EkVWGLmy4X4Zy5QdpyX4luyTqUuGmzP1m7ysB
         JHzQ+U7M3e27XzLXuB3t/XdKK6PH7/EBGkxNJSOKqSQNNQm9UYJIF1tyVJ/yGQpOq1Jv
         M4034Zbk5ch8nWk6C/R/w+bNO8XvDYUZIKb1fbvIQyRoh9rj0UKb5JlVA5HrYOEgOCVH
         QB3qJ4SJPaNIRu73fl4ba+I2I81tebB1+qRgqpNhHCmnqAX+FCGYMH9nqRLyut5v6H4O
         HXkUZ181oNBZSeO1pZJFrc+ruxWeGkFUjD8kdHzEeKKSDahlDgGlSqO8Pq1h0VeyAP8y
         0gOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MPPFBEMAEyXetbowqu2rGA84XzkvyjzYzL/hwkj6xh0=;
        b=nQuUERv7FuvjMf9g6dKqdO4u4M1wIbJXdQCVR8dbGPex5P2/o8+vp44fh/S3F89rGH
         s0y1Pap2hjkVgVMtFIy/A3ELDd2t+jOYDjVDmIlIOskfdVNaIosohuNzApPSb8ZdCBdq
         SLdat+HjB28tfz7XtTJRwVxGBeCVrnk323eOh25cxuVSsgjKr1lFfaCZK7SINKMw5zoi
         Ptu0hOzdr5RUL1oZ7gYERatJXNueMgVowCyc4X5rHNxdixnFR+cTFWMLxntrEfyhQYgP
         XO0q0Ab1g5BtRLVJJWwgRnPOtE1kWKZtLKypfiERUUDBJfEY3HNnA+3iZs1jhztcXUsp
         Cm8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/yqQ8jt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18si7192467ilc.7.2021.09.13.02.58.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 02:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/yqQ8jt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPijR-0005CS-54
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 05:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifu-0007PD-KB
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:54 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:37407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifp-0001tm-8S
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:54 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso6463075wmb.2
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MPPFBEMAEyXetbowqu2rGA84XzkvyjzYzL/hwkj6xh0=;
 b=g/yqQ8jt9rUB05QDNocQsHw/tUugWBRveLtysQIdBTlXTm/VAqfZJJgeTjpUvsAJaS
 g6KoJD1puCY+sg3YDdhPvVuXT+Y5/E1/eloQpCPqczaFMBSQAX9DhHZLbl8PI34eqvci
 c/hFU9BfXUkyN7ygplcMwkZASyE05uyB/6ZwpXlriQlyph4732C/UmBZlRID1CX2pgY2
 xE+4Bh7jmEv4ohuJUXzquW5z4LaL/Dwsr7N9zjXtDx9lZkVsw5jBM0ZnW6zJW7V/fc8W
 Fpzp1sL6l73MDpCb4XGjgkZRnqrzCtG+WacBRpERloKD8DNPBcVE25/3scqJUKFAHZFd
 M/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MPPFBEMAEyXetbowqu2rGA84XzkvyjzYzL/hwkj6xh0=;
 b=YRfvG4vZFsspcpttiH2tfDQp6f1d25wd9Ktu1DBSoHthm/CXEQTC4+VY4kfdM0D9yZ
 IPe2xoEBXDg+vDboPAmuxskwzZsIo+Se+AVl6lIMu5pS4GD7ptzfAt9oLlPqLEtU644O
 YBZ7mBJUaaHWBva/EMYjRgCybaUjsATxb4wxfRSknGzOjFyMccImaUNOyufffWLzplkf
 ytSUOj0RvJivUxit9lSiXZYyRcOBortrEamdKx1WMdP3bDL4zejBjsQGAI2vs3aEXMI2
 viDgJfeYzQGYimx/scCUqDh9JEQpHuozbbvDs8nsjrffkYUkGa2k/QFzQUrGSgpxv1Bm
 1ODA==
X-Gm-Message-State: AOAM533YcLEvBdiVejtVn2Xtr9V42JO75fd0VmR5CKu2C7fyvsLPbWsA
 EVUMdmYQQHT/lWk1Twj+gTDnlBeYWEo2bw==
X-Received: by 2002:a1c:1f09:: with SMTP id f9mr10097119wmf.58.1631526886904; 
 Mon, 13 Sep 2021 02:54:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/12] target/arm: Optimize MVE VNEG, VABS
Date: Mon, 13 Sep 2021 10:54:34 +0100
Message-Id: <20210913095440.13462-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eJfb6T20plR1

Optimize the MVE VNEG and VABS insns by using TCG
vector ops when possible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-mve.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 255cb860fec..d30c7e57ea3 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -510,7 +510,8 @@ static bool trans_VDUP(DisasContext *s, arg_VDUP *a)
     return true;
 }
 
-static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
+static bool do_1op_vec(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn,
+                       GVecGen2Fn vecfn)
 {
     TCGv_ptr qd, qm;
 
@@ -524,16 +525,25 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
         return true;
     }
 
-    qd = mve_qreg_ptr(a->qd);
-    qm = mve_qreg_ptr(a->qm);
-    fn(cpu_env, qd, qm);
-    tcg_temp_free_ptr(qd);
-    tcg_temp_free_ptr(qm);
+    if (vecfn && mve_no_predication(s)) {
+        vecfn(a->size, mve_qreg_offset(a->qd), mve_qreg_offset(a->qm), 16, 16);
+    } else {
+        qd = mve_qreg_ptr(a->qd);
+        qm = mve_qreg_ptr(a->qm);
+        fn(cpu_env, qd, qm);
+        tcg_temp_free_ptr(qd);
+        tcg_temp_free_ptr(qm);
+    }
     mve_update_eci(s);
     return true;
 }
 
-#define DO_1OP(INSN, FN)                                        \
+static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
+{
+    return do_1op_vec(s, a, fn, NULL);
+}
+
+#define DO_1OP_VEC(INSN, FN, VECFN)                             \
     static bool trans_##INSN(DisasContext *s, arg_1op *a)       \
     {                                                           \
         static MVEGenOneOpFn * const fns[] = {                  \
@@ -542,13 +552,15 @@ static bool do_1op(DisasContext *s, arg_1op *a, MVEGenOneOpFn fn)
             gen_helper_mve_##FN##w,                             \
             NULL,                                               \
         };                                                      \
-        return do_1op(s, a, fns[a->size]);                      \
+        return do_1op_vec(s, a, fns[a->size], VECFN);           \
     }
 
+#define DO_1OP(INSN, FN) DO_1OP_VEC(INSN, FN, NULL)
+
 DO_1OP(VCLZ, vclz)
 DO_1OP(VCLS, vcls)
-DO_1OP(VABS, vabs)
-DO_1OP(VNEG, vneg)
+DO_1OP_VEC(VABS, vabs, tcg_gen_gvec_abs)
+DO_1OP_VEC(VNEG, vneg, tcg_gen_gvec_neg)
 DO_1OP(VQABS, vqabs)
 DO_1OP(VQNEG, vqneg)
 DO_1OP(VMAXA, vmaxa)
-- 
2.20.1

