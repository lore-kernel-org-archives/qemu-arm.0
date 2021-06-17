Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp502854lff;
        Thu, 17 Jun 2021 05:43:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG6xy5bUEXW5CatmQfcZwyrNkYezY/2i8Dr9Pzt4H9yhG3vdABTv1gL0Ptk0mvri/Rt7m1
X-Received: by 2002:ab0:7791:: with SMTP id x17mr4992274uar.67.1623933815896;
        Thu, 17 Jun 2021 05:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623933815; cv=none;
        d=google.com; s=arc-20160816;
        b=hNEwlGaOuXaTcUd6VbteBkPvLzHeceTnKKWLeBedDZ3HSyBMtvpN48cs4+NShI1jlu
         opsrgxlicQwjns/jqdE5jOjGSp8XUh5iJrcId8b+fIlmkg4U4j8vW/KsFsyy/D5NkaZ/
         3hYos7XUAV8bL7dAlBVYp/2GlOET8E7BONwHW7kJYuYGhXGB32ZG88KjaRvNJ2pNu9XK
         dBVFwUGcnhtPAGiLFXJsTGN32pqfqaueAeexRWj58pFJCbFPkbrnIK3jRC7YKp4Px3P8
         fxjq6XSwUmUG/AKgVNe09xCCnjbd4LarJmHC1n7YPTjF73BEe3jKg8+OeBn2hJiSEs2N
         9PwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3uw9BmjefCWH7wFd8kwcS0Ujw/qGKgac5TabPp9d3fQ=;
        b=yuh6oUdSusB/f+8yB86x7Mz+U+qh7SiKX8p8c20RINNnQ14w6dLhsRVZMvRKW0THB3
         QYUQzIH1zHZlAClBkzaYiKJPtOYDh0EcPv786Fs7xQAm4v1yPXm+tzjWrn40AFQZoY6c
         56ucYsXy5NK6k1yrEB7TBEHZ7spTihfEB6qArJNWN3m3dCOvCIIRV6MOpkooqDdhEpGf
         O4WPPG5P+wqeAcuMVVXDRcqOEyQ72PFLG1sKgGUF1O15cjinn/DkyfbayvKJQxnmeyB6
         0YyM5yLJNAHTIEEP+CZtDWeEsFM/Gr1FUlZ/+PWcmhn/HdEOmz8J6gtajx8T33k2h3fK
         5eXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=av45oS7i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si1275281vsg.424.2021.06.17.05.43.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Jun 2021 05:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=av45oS7i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ltrMt-0005g7-5f
	for alex.bennee@linaro.org; Thu, 17 Jun 2021 08:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqxK-0002KN-Tn
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltqx7-0007Cu-I2
 for qemu-arm@nongnu.org; Thu, 17 Jun 2021 08:17:10 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so6220171wms.5
 for <qemu-arm@nongnu.org>; Thu, 17 Jun 2021 05:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3uw9BmjefCWH7wFd8kwcS0Ujw/qGKgac5TabPp9d3fQ=;
 b=av45oS7iXyWwUXYyNYX8Ey2RLU3lMaIOLvtMy9RtNoQ6B5CLFFbAsb8rjn8O0ZTJGD
 n1yAdAGXrXgw8AzR8j1fQiN7LB3JT22ou250dp9auSRT9EH32QISRJIownsiIDR3Uzkn
 QN/9vMq8E/mzT++XJzsRTU1G7aVAE0E5eF4rEQZFxrRdKXz3nIwUaetATp2aU+Qd9kzu
 SCBfma7/4Oag3XoBRuQIngg7EQFDW9DoMhMnJm/iNni+rVMyS2Ev5BXbNVVqMMF5rVgu
 dnttmTDOkKB46B+u/MzRjs6Lsca+B1iWO91RkJK7CYWCZWlE8b5k26cu3huFpgHWx2OH
 guzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uw9BmjefCWH7wFd8kwcS0Ujw/qGKgac5TabPp9d3fQ=;
 b=BJZhxMINNDBrFK8QoSkqNeFMgdxsVX/ancvR/yVWUIMCHocrRjqst4eutEw8tCu3i8
 bDAGJImGJt5mALYbbZfs7XJXZ9tVoTlg9ulvpgT5ktW2HCtGKfboehcz3aX9Axn7DPxG
 Uh2+mflvxKARKFw+/RkWKb+vgWxSFk9yfPCjunQ+lCAqTkXpOXTvjmgSvAvbx8Klnk57
 QffxJ3X6fkmiw08pg+omYJQgsi1o5JzzkDW7LJk1w49nsQk22wD03KClm/dHuWnoENAR
 zzYTrWBPEtlmN0q/KaONx46Z99DBLws25rZxtXU9IxdRLkL+kbs8CexcQ9mS94gvg6ii
 yctg==
X-Gm-Message-State: AOAM532ecRKTTALIxVgdcbYM6rBsp66lq00R1fTWZ45Zt3VgE0kgqZIr
 NVU8kd2HpDzPqV0IaPwQ+q04uGA5gq9Y2g==
X-Received: by 2002:a05:600c:4fca:: with SMTP id
 o10mr4738078wmq.91.1623932216176; 
 Thu, 17 Jun 2021 05:16:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a1sm6961970wra.63.2021.06.17.05.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:16:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 33/44] target/arm: Implement MVE VQRSHL
Date: Thu, 17 Jun 2021 13:16:17 +0100
Message-Id: <20210617121628.20116-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617121628.20116-1-peter.maydell@linaro.org>
References: <20210617121628.20116-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: znae3m5KWfKs

Implement the MV VQRSHL (vector) insn.  Again, the code to perform
the actual shifts is borrowed from neon_helper.c.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-mve.h    | 8 ++++++++
 target/arm/mve.decode      | 3 +++
 target/arm/mve_helper.c    | 6 ++++++
 target/arm/translate-mve.c | 2 ++
 4 files changed, 19 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 1c5626bb726..42be99ad526 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -177,6 +177,14 @@ DEF_HELPER_FLAGS_4(mve_vqshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 DEF_HELPER_FLAGS_4(mve_vqshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
 
+DEF_HELPER_FLAGS_4(mve_vqrshlsb, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshlsh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshlsw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
+DEF_HELPER_FLAGS_4(mve_vqrshlub, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshluh, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+DEF_HELPER_FLAGS_4(mve_vqrshluw, TCG_CALL_NO_WG, void, env, ptr, ptr, ptr)
+
 DEF_HELPER_FLAGS_4(mve_vadd_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vadd_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 2c37e265765..e78eab6d659 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -133,6 +133,9 @@ VQSUB_U          111 1 1111 0 . .. ... 0 ... 0 0010 . 1 . 1 ... 0 @2op
 VQSHL_S          111 0 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 VQSHL_U          111 1 1111 0 . .. ... 0 ... 0 0100 . 1 . 1 ... 0 @2op_rev
 
+VQRSHL_S         111 0 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
+VQRSHL_U         111 1 1111 0 . .. ... 0 ... 0 0101 . 1 . 1 ... 0 @2op_rev
+
 # Vector miscellaneous
 
 VCLS             1111 1111 1 . 11 .. 00 ... 0 0100 01 . 0 ... 0 @1op
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 5175684b232..82140ac1e5e 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -622,9 +622,15 @@ DO_2OP_SAT(vqsubsw, 4, int32_t, DO_SQSUB_W)
     WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, false, satp)
 #define DO_UQSHL_OP(N, M, satp) \
     WRAP_QRSHL_HELPER(do_uqrshl_bhs, N, M, false, satp)
+#define DO_SQRSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_sqrshl_bhs, N, M, true, satp)
+#define DO_UQRSHL_OP(N, M, satp) \
+    WRAP_QRSHL_HELPER(do_uqrshl_bhs, N, M, true, satp)
 
 DO_2OP_SAT_S(vqshls, DO_SQSHL_OP)
 DO_2OP_SAT_U(vqshlu, DO_UQSHL_OP)
+DO_2OP_SAT_S(vqrshls, DO_SQRSHL_OP)
+DO_2OP_SAT_U(vqrshlu, DO_UQRSHL_OP)
 
 #define DO_2OP_SCALAR(OP, ESIZE, TYPE, FN)                              \
     void HELPER(glue(mve_, OP))(CPUARMState *env, void *vd, void *vn,   \
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 52fef6cd892..bd4c6150cad 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -404,6 +404,8 @@ DO_2OP(VQSUB_S, vqsubs)
 DO_2OP(VQSUB_U, vqsubu)
 DO_2OP(VQSHL_S, vqshls)
 DO_2OP(VQSHL_U, vqshlu)
+DO_2OP(VQRSHL_S, vqrshls)
+DO_2OP(VQRSHL_U, vqrshlu)
 
 static bool do_2op_scalar(DisasContext *s, arg_2scalar *a,
                           MVEGenTwoOpScalarFn fn)
-- 
2.20.1

