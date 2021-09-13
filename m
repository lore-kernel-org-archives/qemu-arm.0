Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3516891lfb;
        Mon, 13 Sep 2021 03:03:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz45xS8FWDRK6n2mEnkWIZecLrBbKpchSqwjcuGZMldCTlnJHEXdRkhZLo5znw9WOn5hgHw
X-Received: by 2002:a67:f74a:: with SMTP id w10mr4191128vso.13.1631527415965;
        Mon, 13 Sep 2021 03:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631527415; cv=none;
        d=google.com; s=arc-20160816;
        b=QaQMcDM+8KejRMuENeEZ1UNNGlTerM1/cjVuEgIEXsl/f8TOTd1CFoKbqelbw6uRVl
         BFUmHLuNBpixbVfsl5Yi1Y4E6/EKIQ3m/6mF9HZF5C8I9OE2+WOBEaZEe25uvP8AuTkP
         ecr69z1UXNbSqzbtF9AdStLIR56sH6o1khAOdWfftGqomcmnmEFReZI1iwUBHnl/At8j
         0pKwJzYOVbodcxlV79ZzqSCd8NC+zFj7WicCibYTDszxQ9VOpLA+4eRdQeRKaGFS7mIs
         DNRC863qdkY22yIo43pSZLHR4o9vnDcMsWHWmIxv4bNTi3Xt2jqISJfrMXngvp54XkgN
         VqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zir4X0mMBHe1fXRJ/2xzGzZwDp6YizXAS8FXTu1+ZDc=;
        b=rt9SJZA/5bnqM1Of0eWmS/ac4MepWGm0EGCfjWYVbTVKdr9K9uty0RUlaULeZZ+Scv
         0KYyDRz//L1BB3MKUX8R4LPkF9YQhMz7zWAqJodUSpDK7wcIiFDposFSrkDuzFLTsIpM
         lN4Fb0FC/yJRUeZk7TUD+i7Ph9fUFEo9YnP3EJkb/Z1VS5jfTyLI3v//dvzBI5OnMVmc
         CCtI95kk1teGF97k+4sP6A8v/ORK8E1zKygdsC3GqJnQdMziRVZPr4PSYfLFVmzn+aI1
         fzm9tTwzQDGjN8H3b+qCsAqlDdg6WsrTEz37j2xlija5amccs6Wg2QzmINKC7ZTDtmCk
         uLZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BRfK0I+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21si183592uar.102.2021.09.13.03.03.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 03:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BRfK0I+R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPioJ-0003RC-8n
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 06:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifp-00079u-Q6
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:49 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPifn-0001se-H6
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 05:54:49 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q11so13673304wrr.9
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zir4X0mMBHe1fXRJ/2xzGzZwDp6YizXAS8FXTu1+ZDc=;
 b=BRfK0I+Rujz3EMKYKGnthHaUPJYBEEMMO+rHWn+0FPQfFOVQgOZt9P1dLDnb9rMdy7
 U9hmaA08tcXshFCs1jCqOcmSshByZdzMPRFv1e1+hw3STCD9W/qJgz1m/fmYGWSjsbtj
 CD+/+tjKJnSl9fMLfgT2pWsA9vBk88YoQNvLEf3xY29JxOA9GivqVlFVkYTp3r4UVOe+
 FQ1ZGY9FLQ0du5TsfW0ZwPslnBT/ChGnhTPNVHS5mnQfiM5zX9PDdIjPF0qrNDMBSMOU
 Ci06oXTGHWLqEgPYXlAGkChfCfhLpTScUbsKjuST3JloR+MJsXYiPaV18Nl3Nt+GOsSw
 vuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zir4X0mMBHe1fXRJ/2xzGzZwDp6YizXAS8FXTu1+ZDc=;
 b=fqRxzXiYtmwbWfab9cp9tZC6kMXfwxeh5OnAHqAq8ifPbRB8UUr1G7PPsy8J0aPcSu
 4S3wpRoVIrO/wGZUnJV6srn91wiTLqsxBEYOjX/J0feFtPcaF/wSLVZOqWCZFGkVNCxz
 B4Yhx+HwBy3b+gIORaLOR4DP096VAsbmjJb0jFICM6ZE11rJE+4bP7Ecrd0oKfCYaYl/
 EVxq/rPViDQseBB+4HCatAD0UzIlj4Pg7DXUcmBUEy16E9I+L9UyEcRZB7jfODLfGQxX
 44PhOaMHjskdjTI4Ait9gsOdHYJ7wU6ThlCp1u0Vgwd1Fq/fPVyWFMo3a3GZIAYg69UQ
 Sm8g==
X-Gm-Message-State: AOAM531xwP/XR2MS3X7uwsV4DZcAOZ3oIq+W7xxsyomji3vAdgVvC2qV
 Q2p/0I6U7Tt9oIsPbJSq2pC8/JmKXrvsNw==
X-Received: by 2002:a5d:4810:: with SMTP id l16mr11482628wrq.3.1631526886276; 
 Mon, 13 Sep 2021 02:54:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m184sm6475338wmm.3.2021.09.13.02.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 02:54:46 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/12] target/arm: Optimize MVE arithmetic ops
Date: Mon, 13 Sep 2021 10:54:33 +0100
Message-Id: <20210913095440.13462-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913095440.13462-1-peter.maydell@linaro.org>
References: <20210913095440.13462-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3TFaSG3HvXzy

Optimize MVE arithmetic ops when we have a TCG
vector operation we can use.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-mve.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 77b9f0db334..255cb860fec 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -838,7 +838,7 @@ static bool trans_VPSEL(DisasContext *s, arg_2op *a)
     return do_2op(s, a, gen_helper_mve_vpsel);
 }
 
-#define DO_2OP(INSN, FN) \
+#define DO_2OP_VEC(INSN, FN, VECFN)                             \
     static bool trans_##INSN(DisasContext *s, arg_2op *a)       \
     {                                                           \
         static MVEGenTwoOpFn * const fns[] = {                  \
@@ -847,20 +847,22 @@ static bool trans_VPSEL(DisasContext *s, arg_2op *a)
             gen_helper_mve_##FN##w,                             \
             NULL,                                               \
         };                                                      \
-        return do_2op(s, a, fns[a->size]);                      \
+        return do_2op_vec(s, a, fns[a->size], VECFN);           \
     }
 
-DO_2OP(VADD, vadd)
-DO_2OP(VSUB, vsub)
-DO_2OP(VMUL, vmul)
+#define DO_2OP(INSN, FN) DO_2OP_VEC(INSN, FN, NULL)
+
+DO_2OP_VEC(VADD, vadd, tcg_gen_gvec_add)
+DO_2OP_VEC(VSUB, vsub, tcg_gen_gvec_sub)
+DO_2OP_VEC(VMUL, vmul, tcg_gen_gvec_mul)
 DO_2OP(VMULH_S, vmulhs)
 DO_2OP(VMULH_U, vmulhu)
 DO_2OP(VRMULH_S, vrmulhs)
 DO_2OP(VRMULH_U, vrmulhu)
-DO_2OP(VMAX_S, vmaxs)
-DO_2OP(VMAX_U, vmaxu)
-DO_2OP(VMIN_S, vmins)
-DO_2OP(VMIN_U, vminu)
+DO_2OP_VEC(VMAX_S, vmaxs, tcg_gen_gvec_smax)
+DO_2OP_VEC(VMAX_U, vmaxu, tcg_gen_gvec_umax)
+DO_2OP_VEC(VMIN_S, vmins, tcg_gen_gvec_smin)
+DO_2OP_VEC(VMIN_U, vminu, tcg_gen_gvec_umin)
 DO_2OP(VABD_S, vabds)
 DO_2OP(VABD_U, vabdu)
 DO_2OP(VHADD_S, vhadds)
-- 
2.20.1

