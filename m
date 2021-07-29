Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5543062lfc;
        Thu, 29 Jul 2021 04:24:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEJPDYfPiN0e+vFeuR9B69Mmk8Xxr4Zx8XhuxnCLfGvCkkO5pxNOepA+eAefVZg44hYuui
X-Received: by 2002:ac8:5e11:: with SMTP id h17mr3747038qtx.213.1627557864864;
        Thu, 29 Jul 2021 04:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557864; cv=none;
        d=google.com; s=arc-20160816;
        b=ao76bLzk+XKNL7oKYy5f/lxr7x5tXjrXK9EBBcmYUnb5xC8kfGLuROEuGmHrFvNH1h
         7mfR7f5HjyNaDxhZXCz9fgN/l373hDrw78DhqUoDBwVGlKdEfhHjEFaZQD+EsViCPDnx
         ejxV7iAz+ez/SsNntdwMdD3lr+VBdJ20GN6PH98JkwbVyhjTlC8JCtxkaKHRryczdQMa
         dqyE2FVSyCSVyga7NZAnjmYHs5DNzsCn84ScHJN+UYiuEx3we1AR1Wa5/nzcxZ5XcOZ9
         XL/ByAWlsS8EGdfg7w0b9xoGnIGD7HuUI6rqFI/EE5eQnbEpdMkSK4/kT6CzSbDEjeS7
         mXIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NumtafSnEiF4kjNIFtDKTqX8sKZowsVsCRz2Ds8yzEc=;
        b=U5CmgqZembmBEZsOl2Ak/RiyEXsKGpDX6DcCrUXZG6pfcb9bKRYtYzOmrN7ycbkyga
         VTyoAShjmGJYaXjLFBFeXCptRk16VA5W+x603xR0rt+8cDTqwrAoH1SDSI8erbSkWkhb
         srGB1S7wJzDSFiwjZQfg0e46ElDDJP4bI/+ShlzNmzcirkg4VRxlL2TOxQvjQqXSacxv
         d7eCHBM5Ey+BA+tmxj6sJNxPVA7UVZpMNO2FdI0gIK3SVt6onk6Om4z8w7Gzfl1RnxnO
         xA1juPtPcNhkwEjPzUBb0lJy2H7tYaaZbS/+17bTtftLWTxyahzqD/NxI3hyHpF8+0R6
         o4tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PZZBvpgo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si1865011qtg.289.2021.07.29.04.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PZZBvpgo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m949I-0001LM-46
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940g-0000Iy-3X
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:30 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940a-00012B-5S
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 07:15:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id r2so6483503wrl.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 04:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NumtafSnEiF4kjNIFtDKTqX8sKZowsVsCRz2Ds8yzEc=;
 b=PZZBvpgo2retsmAoruoibwBJfAkNQthPHUnd1T4sSwr5naD0f8YbvQBpcc/Yobx2M8
 WIL5YrLdK7/nDei+MRptkvqUf63mYpgsyJzitgcvoheFb7ZIwmyOZuIbNP4IiqtY8MCc
 xrRj896WxnTCMtxIoBrfor9jCGN+ecAefzX5fT373mpNB3kiycL+OkHXnGrYBIhVTBjY
 E8N8YH+RaHnSt8uGM601PzHoKQZqJNaP/wuyg7paUp0AADFjcy5IUQvkxUPwWrmCi9l0
 yuw8SiS7dgZjT3LKPuJJWmkywpmjPKxGgwe6F8pMlNx4se7Pb9znp7o8DrxP4szUaRVr
 FRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NumtafSnEiF4kjNIFtDKTqX8sKZowsVsCRz2Ds8yzEc=;
 b=cFpGB6A5NgV8EkwLwXCCz6PYBuNIubiTk+i0sGTL7iCFuCnqFO/Rk7BxNU93VFW/Jn
 zTf6q521fdIaKH03WntlqnzYEspuiZ70H6CqJvBwA9aUKoFYkIkHg4FcMPgu4aN0YYwX
 uWvE8YG3pBPbvZiHZkuaZp8FkbZthuUT/CsssdKgaWzjE/G9QZNSoseyNEGX28S6Qwyk
 VEM1setzPeOi+RxWSz+KEMNRYmiWSWTaHvwlqsmwFietZJwGXXwAYw92RSB94kPx8GGR
 nf3sauqkGLpYTKkfAemQaD4VauWyNSlK8i4J8k4dgpQTSUugDdqXdzDhyfRs1yJELeTg
 MahA==
X-Gm-Message-State: AOAM5330Bch2JpT4FJ/vg43yG01H7TybEVnVma8R6S/a9sKAxcCUNIbH
 /g881PMoUr7jq73AYhStXokOE3wwrSzqmg==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr4207436wrm.59.1627557322075; 
 Thu, 29 Jul 2021 04:15:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 09/53] target/arm: Factor out mve_eci_mask()
Date: Thu, 29 Jul 2021 12:14:28 +0100
Message-Id: <20210729111512.16541-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: WKSl8DBJx3ps

In some situations we need a mask telling us which parts of the
vector correspond to beats that are not being executed because of
ECI, separately from the combined "which bytes are predicated away"
mask.  Factor this mask calculation out of mve_element_mask() into
its own function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve_helper.c | 58 ++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index bc67b86e700..ffff280726d 100644
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

