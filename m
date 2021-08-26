Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp608791lfb;
        Thu, 26 Aug 2021 06:24:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMNTxd3STrpSzhHI6B3ZaqiRY9eGnqtQODUOf0Wn0YC/q7m6M+qXELIIQVH3SXo0cvF48b
X-Received: by 2002:a1c:980d:: with SMTP id a13mr14533145wme.68.1629984255537;
        Thu, 26 Aug 2021 06:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629984255; cv=none;
        d=google.com; s=arc-20160816;
        b=WB9BSHYcQeOM8TY6dYhQj6vKCzcZAEj8mLrU1ZhgEQGmfUL8p3yxWYMi8/IgowyKAy
         AfXGHkHBkXIIkQylcVn2p8++1vSXfLPKvymZug48lj+2GWWq9v2lnZhNZNnYNI2ea5Ti
         4bjeIdvQVHbNHubwt4I4U1PjoKatpVbf1T6ErrroWoKG+CQUEBPc5U+GzMgPxfMV8PX+
         XCYsfOH0mfh5KqgsOac5Bo0ooxEQC4tlouHmKSciBBIDDa6HK5QyICcnZcHNwbh5XQYD
         43XwDLL1/BNgccgH+SWmfYzFeYDG3WkYZ5PJ3UCqBC05UYSCDWmzZUpprtg/cS0lr35f
         xerw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=i35Lsr/dn1GODrzYN0U582ydyfLQGp/hvCXCCo2NUrA=;
        b=E6R4eQbnhyOWCsOl3RcY7yCMJ2Esv01a5kiO8PqruajqgOcC3UISHIi2CFQsXyrkP2
         /SdT7sJ2OkuCYgzf6qCRH1SBtcFS0Lhxdezbr9ZPCo+212aRLYRhH5swlQXtQzQMxe1T
         7ELzL5uRl2Z9EUxV+QNn9h7LCx9BhkQRE1FIfNgkeVqf2XF6U5AxS+0S9FhyWz8Ed6rF
         QvUVnSKByTFfxDl9PuFzQV37wi2x0Nc2BpDeanfAMvmVwrLe6n0BdxSCOoXt6yJOv8ge
         ggZvlC9tYhtJuI9KZG6XH7tIjaP+fQrIrNnG4Rcs7fSJSGdNP+t+34zxxg9k6YgIkVHs
         n3XQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vaNMDH3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si3623810wrd.3.2021.08.26.06.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 06:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vaNMDH3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJFMc-0001PU-Ea
	for alex.bennee@linaro.org; Thu, 26 Aug 2021 09:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFG8-0005ef-Uh
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:34697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFG6-0004uW-Py
 for qemu-arm@nongnu.org; Thu, 26 Aug 2021 09:17:32 -0400
Received: by mail-wr1-x435.google.com with SMTP id h13so5064794wrp.1
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 06:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=i35Lsr/dn1GODrzYN0U582ydyfLQGp/hvCXCCo2NUrA=;
 b=vaNMDH3KI+7Ye0fdPLWsSE+pVz+xGjaivRVCqR2pfr73Wfy7AlQHLUJchnmy9ibp5F
 nGMGepYLZMAJQiqK7KD0Ac7N8VSXhUGJGrgKYlG9T9YAcXuNlbY++C0y4GjWGtV0OhYh
 Plw5KGG9c3MirogKm5g+NnS8epq2K+Cvojky0sVNcDZ3+2KukQgHZZPkzRz0rylZpDlf
 1nFvGnBWHENDrr6YzJ6CWmFbhh314vq3UD2NXLWacqgJ0BYXz+3GRUMKi71LtOVJAmVU
 BqrWDsUUkc55I4uPQVu1L9khf4kkwBDzkfZ83ihAK64wVlLjmfmRrfcQmXpC0ZifMYZA
 nedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i35Lsr/dn1GODrzYN0U582ydyfLQGp/hvCXCCo2NUrA=;
 b=SPlvPN4Vt9jhBy/kJ/2Z6UZnqyL1aLJKmxIsflMdJET5PQ51UIoSByQK/ZbOU3k044
 7eU/Ttm4n3mw76HJ7y7dy//GrPv0VrROsAvl4fkfAlhXrS6pxJfS/3+lq/WWtJkd9jhD
 9pseH9QMtd+uTSdvleM3Tt9XnnKt7eRu3DzmCa6ZvUJYBmDFblA7YpLcivt8VrYzFVq8
 PshH2usVVoatQO/cGwkxZmFLB/siwvJSPXo13kQ/+dsvHS3vsBUMR97pAwjLHQjqtuXh
 ncZQ2BorkagVirBaxl1IukCrwbG6sCRoKFhoPl6w1kATN+CvT++lTua3kZoh1amnk8ub
 fgHA==
X-Gm-Message-State: AOAM532Ddn6OA489c2ybSOeUb7l06Cniudd7LUn5Ab2IDsp6XeRb+Hgi
 Agiz3TeeSdx1yc/p17P3SEu4aGCY2wfImQ==
X-Received: by 2002:a05:6000:234:: with SMTP id
 l20mr3908366wrz.359.1629983849374; 
 Thu, 26 Aug 2021 06:17:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i17sm1341908wrc.38.2021.08.26.06.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 06:17:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/18] target/arm: Implement MVE VSUB, VMUL, VABD, VMAXNM,
 VMINNM
Date: Thu, 26 Aug 2021 14:17:09 +0100
Message-Id: <20210826131725.22449-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826131725.22449-1-peter.maydell@linaro.org>
References: <20210826131725.22449-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qMZ6Z/BrCi7H

Implement more simple 2-operand floating point MVE insns.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
v1->v2: use DO_2OP_FP_ALL
---
 target/arm/helper-mve.h    | 15 +++++++++++++++
 target/arm/mve.decode      |  6 ++++++
 target/arm/mve_helper.c    | 16 ++++++++++++++++
 target/arm/translate-mve.c |  5 +++++
 4 files changed, 42 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 32fd2e1f9be..370876d7934 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -413,6 +413,21 @@ DEF_HELPER_FLAGS_4(mve_vhcadd270w, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfaddh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vfadds, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vfsubh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfsubs, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfmulh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfmuls, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vfabdh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vfabds, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vmaxnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vmaxnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vminnmh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vminnms, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index e211cb016c6..cdbfaa4245b 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -625,3 +625,9 @@ VCMPLE_scalar     1111 1110 0 . .. ... 1 ... 1 1111 1 1 1 0 .... @vcmp_scalar
 
 # 2-operand FP
 VADD_fp           1110 1111 0 . 0 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
+VSUB_fp           1110 1111 0 . 1 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
+VMUL_fp           1111 1111 0 . 0 . ... 0 ... 0 1101 . 1 . 1 ... 0 @2op_fp
+VABD_fp           1111 1111 0 . 1 . ... 0 ... 0 1101 . 1 . 0 ... 0 @2op_fp
+
+VMAXNM            1111 1111 0 . 0 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
+VMINNM            1111 1111 0 . 1 . ... 0 ... 0 1111 . 1 . 1 ... 0 @2op_fp
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index abca7c0b2ab..d6bc686c985 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -2838,3 +2838,19 @@ DO_VMAXMINA(vminaw, 4, int32_t, uint32_t, DO_MIN)
     DO_2OP_FP(OP##s, 4, float32, float32_##FN)
 
 DO_2OP_FP_ALL(vfadd, add)
+DO_2OP_FP_ALL(vfsub, sub)
+DO_2OP_FP_ALL(vfmul, mul)
+
+static inline float16 float16_abd(float16 a, float16 b, float_status *s)
+{
+    return float16_abs(float16_sub(a, b, s));
+}
+
+static inline float32 float32_abd(float32 a, float32 b, float_status *s)
+{
+    return float32_abs(float32_sub(a, b, s));
+}
+
+DO_2OP_FP_ALL(vfabd, abd)
+DO_2OP_FP_ALL(vmaxnm, maxnum)
+DO_2OP_FP_ALL(vminnm, minnum)
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index d2c40ede564..98282335820 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -847,6 +847,11 @@ static bool trans_VSBCI(DisasContext *s, arg_2op *a)
     }
 
 DO_2OP_FP(VADD_fp, vfadd)
+DO_2OP_FP(VSUB_fp, vfsub)
+DO_2OP_FP(VMUL_fp, vfmul)
+DO_2OP_FP(VABD_fp, vfabd)
+DO_2OP_FP(VMAXNM, vmaxnm)
+DO_2OP_FP(VMINNM, vminnm)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1

