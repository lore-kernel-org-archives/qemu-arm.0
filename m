Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3687065lfa;
        Mon, 7 Jun 2021 10:14:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGoZgEKr0pvFW+izexLl+W1cj0QIQ/Xcc6h1m9emM11CcQ8FMih/pTj7b2+90Hvu+a3JUV
X-Received: by 2002:a5d:91ca:: with SMTP id k10mr15295820ior.23.1623086095579;
        Mon, 07 Jun 2021 10:14:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623086095; cv=none;
        d=google.com; s=arc-20160816;
        b=DIIYtwo1bYWUCbXehtSlrsM8nyYEaQhoFYNrkR+Iauyl0L7Qz3m978OQU9aHd7sFXW
         QKUYJHfNyBX0wDkCjriHUgoOYTbENtnAcKthD4vo9Eko20yAAdWEmV64ilHl0nmxepc3
         9n7JQWGWPvEAA+0GPeaoD25KlvoOLz770LMoJwRHkH7BitcJnOw+9NMRu4/5DiG+HRTB
         0fhmUdDiutzCICfDKKfn+3UmMwRGKFX1p8hgKMOGg2NDVMo1uJk/0shbMv3Xs/sS7F5k
         SD4u/0GUM6XpP439gM3hXVKeyuKBGH2Z5/8dTKDnVXqSNKnwYi07GvYjQAc+nVpKpF8u
         Xu/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4NcL5xtEouw+Mk0EZO835y5LYH7TGW2TpYkGpEcSuXE=;
        b=uVmOmtwOJSksb7j2+qd/qR6ln6bWsAsZ5XNtEGnGrdncH3lXwIjHFSG3kHaWz0NOFW
         cZcNcrUszEX7FSwJC+Ux3hAZlMnSV6JTD7N5G0hQ6B/nxXCRLOGJDbL5xqxF7z4R51B1
         oRB9wzGgXavAIE/mysWEeSSOR373Aj1wMWSbUbHMxdpAK1dfGTofAiDEo4vWPWBKK+tY
         l3YeUs1AhLfrdxgT6lO5bH8Iw7a6gEtLkmMK7QOtKgzkZihoTIWgs1OjJrJk1YjmM3GB
         XJh7jc/we9QVi1yOdH5yqNfvWElPytXq0VibgTOm0xoazwXBfICEempRsmpOVw3lBKCm
         N2xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ebQCYNA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si13841356ild.157.2021.06.07.10.14.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 10:14:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ebQCYNA6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIpy-0001au-Re
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 13:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaz-0007om-On
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:25 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:46062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIaX-00082e-01
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:59:25 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so49226wmg.4
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4NcL5xtEouw+Mk0EZO835y5LYH7TGW2TpYkGpEcSuXE=;
 b=ebQCYNA6C8ZF2Bz7qLnNmKjo0yVCj8xdKpQrRGNQpNQGxfRaZgHwBDpxtofu2BF8p2
 focuWu2DmGiyx8EKut6DJhBKf3XXFuRM6yfakGAB4zqg+3LFVE58XR0TxEPREQrNU8jJ
 hrm2waVKnyPYoX7CqOyPHr1mauX2TkExggnrR/pEQ8uuJXLO5U+ToxW6XORjOtufvj/s
 34dLY/tp/wT1p9IninydSE9oYyNEOn9FEx9RXfo0wsT/ftOXV2UgmBEgbGvGszqEbG+6
 5Ynb8ZsPHp2zag64pM9LK1JKgF7RJyT8UI2YE9Zr0F5YJyT2JprC9uf7hv2o9ZjG/Kul
 U+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4NcL5xtEouw+Mk0EZO835y5LYH7TGW2TpYkGpEcSuXE=;
 b=YVUZKUFQLtzFqYnc/tKFe512SE0saRLKcRnBrX/26Qs7RYYmve23gyUL78R4TYWXZO
 NyQEPeJbPhbp7AGJ5narpAbsTFRWLfKeY2TkWcuyyB97Ngfv2bHxBiD5cfmUbePVyc1N
 HsBZMC1plzCVt7CuPzlO30yIh0Y3LnXYcLNH+Yt2zTcoxjLr/WD2sVLD7TASfo7dwuXa
 5sm7+2RCQGl/dLcHTIquA9g8BaYv4oIILoRXZYgeeP5Ax3Uy1IouqOhYwZlvXPBotLOP
 MEcf2HA51YD8cSR1W0Njs+gUfwkSRrU9HjyCfXWw2lXlRBmqVwDeCwGJRs71QZWMHXNu
 cAFw==
X-Gm-Message-State: AOAM532Zpk2oDPhOUviIMW24LYR2Ww8bwwWD1iODSEFcvp9G13bsGIfw
 SNGuMQfd+xw14STzmUmXI8+/MLrazaLr78dN
X-Received: by 2002:a7b:c206:: with SMTP id x6mr100705wmi.26.1623085132209;
 Mon, 07 Jun 2021 09:58:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 36/55] target/arm: Implement MVE VBRSR
Date: Mon,  7 Jun 2021 17:58:02 +0100
Message-Id: <20210607165821.9892-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1+mydu7gJkqf

Implement the MVE VBRSR insn, which reverses a specified
number of bits in each element, setting the rest to zero.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper-mve.h    |  4 ++++
 target/arm/mve.decode      |  1 +
 target/arm/mve_helper.c    | 43 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-mve.c |  1 +
 4 files changed, 49 insertions(+)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 5853bd34687..1f77a661b9b 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -175,6 +175,10 @@ DEF_HELPER_FLAGS_4(mve_vhsubu_scalarb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vhsubu_scalarh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(mve_vhsubu_scalarw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
 
+DEF_HELPER_FLAGS_4(mve_vbrsrb, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vbrsrh, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+DEF_HELPER_FLAGS_4(mve_vbrsrw, TCG_CALL_NO_WG, void, env, ptr, ptr, i32)
+
 DEF_HELPER_FLAGS_4(mve_vmlaldavsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavsw, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
 DEF_HELPER_FLAGS_4(mve_vmlaldavxsh, TCG_CALL_NO_WG, i64, env, ptr, ptr, i64)
diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index 5c332b04a7c..a3dbdb72a5c 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -167,3 +167,4 @@ VHADD_S_scalar   1110 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHADD_U_scalar   1111 1110 0 . .. ... 0 ... 0 1111 . 100 .... @2scalar
 VHSUB_S_scalar   1110 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
 VHSUB_U_scalar   1111 1110 0 . .. ... 0 ... 1 1111 . 100 .... @2scalar
+VBRSR            1111 1110 0 . .. ... 1 ... 1 1110 . 110 .... @2scalar
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index dbcf4c24949..25426fae992 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -513,6 +513,49 @@ DO_2OP_SCALAR_U(vhaddu_scalar, do_vhadd_u)
 DO_2OP_SCALAR_S(vhsubs_scalar, do_vhsub_s)
 DO_2OP_SCALAR_U(vhsubu_scalar, do_vhsub_u)
 
+static inline uint32_t do_vbrsrb(uint32_t n, uint32_t m)
+{
+    m &= 0xff;
+    if (m == 0) {
+        return 0;
+    }
+    n = revbit8(n);
+    if (m < 8) {
+        n >>= 8 - m;
+    }
+    return n;
+}
+
+static inline uint32_t do_vbrsrh(uint32_t n, uint32_t m)
+{
+    m &= 0xff;
+    if (m == 0) {
+        return 0;
+    }
+    n = revbit16(n);
+    if (m < 16) {
+        n >>= 16 - m;
+    }
+    return n;
+}
+
+static inline uint32_t do_vbrsrw(uint32_t n, uint32_t m)
+{
+    m &= 0xff;
+    if (m == 0) {
+        return 0;
+    }
+    n = revbit32(n);
+    if (m < 32) {
+        n >>= 32 - m;
+    }
+    return n;
+}
+
+DO_2OP_SCALAR(vbrsrb, 1, uint8_t, H1, do_vbrsrb)
+DO_2OP_SCALAR(vbrsrh, 2, uint16_t, H2, do_vbrsrh)
+DO_2OP_SCALAR(vbrsrw, 4, uint32_t, H4, do_vbrsrw)
+
 /*
  * Multiply add long dual accumulate ops.
  */
diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
index 8dfc52d8027..b7bf7d0960f 100644
--- a/target/arm/translate-mve.c
+++ b/target/arm/translate-mve.c
@@ -469,6 +469,7 @@ DO_2OP_SCALAR(VHADD_S_scalar, vhadds_scalar)
 DO_2OP_SCALAR(VHADD_U_scalar, vhaddu_scalar)
 DO_2OP_SCALAR(VHSUB_S_scalar, vhsubs_scalar)
 DO_2OP_SCALAR(VHSUB_U_scalar, vhsubu_scalar)
+DO_2OP_SCALAR(VBRSR, vbrsr)
 
 static bool do_long_dual_acc(DisasContext *s, arg_vmlaldav *a,
                              MVEGenDualAccOpFn *fn)
-- 
2.20.1

