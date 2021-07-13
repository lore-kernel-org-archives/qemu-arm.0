Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp597719lfc;
        Tue, 13 Jul 2021 06:41:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzT1W0AWw5pUbRR6Tst1Zk9iXzeyHj/uoJ30rIPVoBNcEbEe60wlUmkZKBGP3PnjJ8bmkCx
X-Received: by 2002:a05:6122:902:: with SMTP id j2mr5190743vka.6.1626183694609;
        Tue, 13 Jul 2021 06:41:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626183694; cv=none;
        d=google.com; s=arc-20160816;
        b=EQLNg7+LNEqI0X0rlz5d1CIIA+qmq3TxmXIcC2HyeXSmokj7/2DfzWkXmqo+DkMrzi
         rtXKm6WxTlJt6CSzobhSmHmUihmisSZcVtQ3FFoFXEEH4V1tddWkcot5ZWYXeoOO2ILN
         OFcjVL9cDEHAwDhBb9Pru3SctPf2+XahEa1nSPn8+2/bH1fr/XqNUorMo9DHaPRL9boz
         dW9MwhlXVzGpKybd24AB2UbRTQ34ZWjbNSUURuho4Z+pefMuAlCVY17tCtyLeGtnyi8P
         UZ5O/5W75i+S0RcSd/mFapLng5gzcxSWL+q8jnPTwegJJRaYLmHMjHTVEA8PW3EE4m6H
         +mHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KPIYZ3zIq5bH2bgXU9pNq5i9SxEKiNByuloEeu6bbIM=;
        b=UrH5z3N21inAx7T6rnddQy+ZOoTgINbnDKMuEB8r3BRLm5TPUVZnRs70OXB4AaVyWX
         FI5lRgbz2dwyVKqQAvYN30qjsreSwia5yj9P+CvKAxD5h4cSQql1fuRgnzDeqXL1vDoX
         2rnONy5HuxVL6uiBfQ5mcEuHPxqfY5gon044k6Iojz5LeP3l6urroOOOFWCu44xUff1v
         bCrtbSt/mO+/lqaKnIJr1aNyED5wEJs6qy8Djl5Muw579KD9qXPulr4oJSOAEiFwEa6a
         sV/n6PQXKEmJptCYSdsPpotMY9kJZ0ykRkDrGAF2CVUgMAbRQToip5sAgbDxPZBPmeeL
         ezJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SPIBGNyW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b76si8603191vsd.172.2021.07.13.06.41.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 06:41:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SPIBGNyW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3IfF-00071u-To
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 09:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbW-0008T0-GG
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:42 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:43958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3IbR-0003dn-Dr
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 09:37:42 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so2366814wmc.2
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 06:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KPIYZ3zIq5bH2bgXU9pNq5i9SxEKiNByuloEeu6bbIM=;
 b=SPIBGNyWKDEeVV0cl9XGjDkfUKZJHstzBPR9I54/HUkKedoXMECvpGWCiGnKLmXhA6
 We9/KzJ1HODr/XckHCD5Sm8Pl0c0BDfAx9X6wTStwiLT6CNbEFPTnEidbPrcEKECZj2q
 sX/yPrv/j3h8dRU0xxNW0xx5/w3q/hsSZ3OlafJqJBhuvk5bBZRXoT+2O4MCpCqs7/jD
 ZJc6EcqD303gxuAhfnMZm1gOfD3ypvDVX+f0ByuiS9jDPNEPHuicoybHWdMZkbwdciY1
 i8fcKI5t8I1pKAcjmTXSDDedD+BbV1aK8D2/GW/kYzhKEPRDh1YZBLMUDfRkWVZJ15AW
 ZgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KPIYZ3zIq5bH2bgXU9pNq5i9SxEKiNByuloEeu6bbIM=;
 b=Y97kwxlguruaQlEc+7VrMMVx7QXahVRrzyQ2ID4JGzP4FPYkGitTCGLOTyXqmEQ6c1
 CLKxU3K86mmzMd77HwEOxFSO6CFhqwVpC017ZMiI+rOO1bKygS1bxv4HWPHyP/wQHasu
 pXkDNRKxzYN3kmIv/VNT51fWVproXJeXJ7iQeEechZHWKbFMjh71q3nfC8G35hMb+8SH
 JDeQ8jEkda4fyqNcV4F0i/p4vRkBtOkzrDMa146+eMRSVfjZWfBqc3+iUEHzkHo1FI8R
 gT0bVOX8lhCSzU8AYz8H+GCo02O218P8yamfX66yxehqrXmTiSRIMeLVcj1c/9aBU0UQ
 sf4Q==
X-Gm-Message-State: AOAM532t8GH5MiGyoXSq9JhHatKP6CW5RxhJFEAGCuTpOMwRbyxSVjUp
 qr28DOmjYjaDeDv/i3YNsR8r+m6OYB+bZaXX
X-Received: by 2002:a05:600c:2197:: with SMTP id
 e23mr5174184wme.101.1626183455932; 
 Tue, 13 Jul 2021 06:37:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j6sm9827443wrm.97.2021.07.13.06.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:37:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 09/34] target/arm: Factor out mve_eci_mask()
Date: Tue, 13 Jul 2021 14:37:01 +0100
Message-Id: <20210713133726.26842-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713133726.26842-1-peter.maydell@linaro.org>
References: <20210713133726.26842-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: uKmYanuJSIaR

In some situations we need a mask telling us which parts of the
vector correspond to beats that are not being executed because of
ECI, separately from the combined "which bytes are predicated away"
mask.  Factor this mask calculation out of mve_element_mask() into
its own function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/mve_helper.c | 58 ++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index b111ba3b106..b0cbfda3cce 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -26,6 +26,35 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 
+static uint16_t mve_eci_mask(CPUARMState *env)
+{
+    /*
+     * Return the mask of which elements in the MVE vector correspond
+     * to beats being executed. The mask has 1 bits for executed lanes
+     * and 0 bits where ECI says this beat was already executed.
+     */
+    int eci;
+
+    if ((env->condexec_bits & 0xf) != 0) {
+        return 0xffff;
+    }
+
+    eci = env->condexec_bits >> 4;
+    switch (eci) {
+    case ECI_NONE:
+        return 0xffff;
+    case ECI_A0:
+        return 0xfff0;
+    case ECI_A0A1:
+        return 0xff00;
+    case ECI_A0A1A2:
+    case ECI_A0A1A2B0:
+        return 0xf000;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 static uint16_t mve_element_mask(CPUARMState *env)
 {
     /*
@@ -68,30 +97,11 @@ static uint16_t mve_element_mask(CPUARMState *env)
         mask &= ltpmask;
     }
 
-    if ((env->condexec_bits & 0xf) == 0) {
-        /*
-         * ECI bits indicate which beats are already executed;
-         * we handle this by effectively predicating them out.
-         */
-        int eci = env->condexec_bits >> 4;
-        switch (eci) {
-        case ECI_NONE:
-            break;
-        case ECI_A0:
-            mask &= 0xfff0;
-            break;
-        case ECI_A0A1:
-            mask &= 0xff00;
-            break;
-        case ECI_A0A1A2:
-        case ECI_A0A1A2B0:
-            mask &= 0xf000;
-            break;
-        default:
-            g_assert_not_reached();
-        }
-    }
-
+    /*
+     * ECI bits indicate which beats are already executed;
+     * we handle this by effectively predicating them out.
+     */
+    mask &= mve_eci_mask(env);
     return mask;
 }
 
-- 
2.20.1

