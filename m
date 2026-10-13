Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCF9CC6B13
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 08:46:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGY9K-0000U7-1I; Tue, 13 Oct 2026 04:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4b-0001lV-Ub
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:28 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGY4W-0008HZ-8y
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 04:41:25 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so32217905e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 01:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791880879; x=1792485679; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=4um6vfgWs9h9kp00xbqJa6oHTA9SbTpa0Ruq+mXG+G0=;
 b=W97usoh+wdXB+JGcN0H4fnhzWCdczCysY+lV53QZiV6iSdD4aRv9zqQEvGhkx1IIEA
 2LcCe1DySIjddQKQyKpyGGHBuuIuicY6phbIPjuXozxwGu17zpzECVSyP5AHYesKk6kk
 Fn5Pu618LYuqUZ8AF7tDEEQFTUF56y1ln7rofKKcBZHIBg9yq99ivtK3A0wt07iVxBUY
 VeEw2WQQc49BHTjYFDxQF4TwdB+STWsax/QxrQmqMi4ppqIiKebiZXKxQHRisoWMFU18
 neTDWTPA9zjnR493Dy7IoLpaTjac5d38GpijTph+ZUo0B5Sqpj5SfTp5xGpYoOTDnmcM
 PTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791880879; x=1792485679;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=4um6vfgWs9h9kp00xbqJa6oHTA9SbTpa0Ruq+mXG+G0=;
 b=rU9JyyGs2Qu2P/d/UYh0LfXN5sDdazemChOpQjNv8Sr5rt63arhuCiyyzPkOXY6WSP
 MXLL6Oos4vFNEwtaScsE0FXcul44sfpPEjW6LaZKYata0ymfs46ckRW0hjBBAKWJrJhy
 TCm8+tkLsFVw3lPP/iRSYt5gbVgk0ob6qhct03kuTR4zPOEchfyEnbgk0mwB53Z4ZrEt
 qIAZj0ETfKujdzSXHQQ4kkYEE395KgHN0PTZF/KJ/P9VbzNvDlJoS+UH8KOYsiSAw2IN
 71gM2/5XWvzfolq5pk9D9UlPDk6JxatCE71BhRxnU/PQOG6em1EbTidXotgmkkh4m5nX
 +XNQ==
X-Gm-Message-State: AFq9FYIzDNWh3bLoReBZkUFPrSkK6cicCJcs94D93LRF/TJ8I3KA/hMZ
 NITyALbQAM+jldUgdxpIJBMH8ujVC2bB8iNbykfj6VUszPWrFL+hqWd9RwyNtPBQO2F4IXs+TRO
 DDsJsDKg=
X-Gm-Gg: AYBFou0YuG5TwhwwC0ySUN/bPbLLpG9RitKaiRfmq9YtKOju31qphkfVMesYsFMLZaW
 s8YJvZxlo0QJDviNLB+X84OhGOdVMbg+ZR8NVN4nPDOWEBNuDFy9dv3yGFBF6AlsHXBxHGTGTXS
 Fb1JVuc4VP8sKS81OkHqk4wVRlNu22f9xE2S3zE63xnFnzozd3/Rnda1ddfOumh07yZessErbwz
 +luszE6G/qkvYbQQn8B6qb285vUOt+s0o7seDjP+C7hIjqsI+dL0m7xzCNblcMrZ3iIxq+tkEdQ
 2o9hHQoEGqh/8xi/U9udWRZDpyaB1r9n+j0Kk/UO8jSnPlgNRNPf/j3b+l4kXZ5oWE9bvypGyga
 8RzjqpUD5TyrPdAhCSomiHnRoQqIINHLeuYb1YUfIqvumLjIGN7cuM5sbm1+PJ9NoamZ6zmAN8c
 rYfLN6FCIcfONAeRj5pe9evCVYZIyDvHkzYwdON11F2KFJIS/m2zyMe6LD02a7xtCjlF38Tv2f6
 3sZsYbuOqMxCRUbkQfRfYBHkJTMvbWkFg/0I9cZPo5Noru4aLYDUnfS6wI/a8Hem22t3qKvM1gP
 +AA=
X-Received: by 2002:a05:600c:6383:b0:4a1:a6e0:4ce4 with SMTP id
 5b1f17b1804b1-4a1a6e04d7cmr36094065e9.33.1791880878575; 
 Tue, 13 Oct 2026 01:41:18 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be96549sm495086735e9.6.2026.10.13.01.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 01:41:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 80/86] hw/intc/arm_gicv5: Implement IRS_VPE_HPPIR
Date: Tue, 13 Oct 2026 09:39:27 +0100
Message-ID: <20261013083933.1024405-81-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083933.1024405-1-peter.maydell@linaro.org>
References: <20261013083933.1024405-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

Now we are calculating and storing the vHPPI for each VPE, we can
implement IRS_VPE_HPPIR, which allows the guest to read the current
vHPPI for the VPE it has selected using IRS_VPE_SELR.

The specification allows the IRS to return the current vHPPI on
reads, rather than having to sample and hold the vHPPI at the point
when a VPE is selected by writing to IRS_VPE_SELR.  We choose to do
this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv5.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/hw/intc/arm_gicv5.c b/hw/intc/arm_gicv5.c
index ab0cd1d80e5..b3ce8a87e81 100644
--- a/hw/intc/arm_gicv5.c
+++ b/hw/intc/arm_gicv5.c
@@ -2319,6 +2319,21 @@ static void irs_vpe_selr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
     cs->irs_vpe_statusr[domain] = status;
 }
 
+static uint64_t irs_vpe_hppir_read(GICv5 *s, GICv5Domain domain)
+{
+    /*
+     * The spec allows the IRS to update IRS_VPE_HPPIR as the VPE's
+     * vHPPI changes, rather than sampling it when IRS_VPE_SELR
+     * is written like e.g. IRS_VPE_DBR. That's what we choose to do.
+     */
+    VPE *vpe = vpe_from_selr(s, domain);
+
+    if (vpe && vpe->vhppi.prio != PRIO_IDLE) {
+        return vpe->vhppi.intid | R_IRS_VPE_HPPIR_HPPIV_MASK;
+    }
+    return 0;
+}
+
 static void irs_vpe_dbr_write(GICv5 *s, GICv5Domain domain, uint64_t value)
 {
     GICv5Common *cs = ARM_GICV5_COMMON(s);
@@ -2617,6 +2632,22 @@ static bool config_readl(GICv5 *s, GICv5Domain domain, hwaddr offset,
             *data = 0;
         }
         return true;
+    case A_IRS_VPE_HPPIR:
+        if (gicv5_domain_has_virt(cs, domain)) {
+            *data = extract64(irs_vpe_hppir_read(s, domain), 0, 32);
+        } else {
+            /* RAZ if no virt */
+            *data = 0;
+        }
+        return true;
+    case A_IRS_VPE_HPPIR + 4:
+        if (gicv5_domain_has_virt(cs, domain)) {
+            *data = extract64(irs_vpe_hppir_read(s, domain), 32, 32);
+        } else {
+            /* RAZ if no virt */
+            *data = 0;
+        }
+        return true;
     case A_IRS_VPE_CR0:
         /* RES0 when VIRT_ONE_N is not implemented */
         *data = 0;
@@ -2962,6 +2993,14 @@ static bool config_readll(GICv5 *s, GICv5Domain domain, hwaddr offset,
             *data = 0;
         }
         return true;
+    case A_IRS_VPE_HPPIR:
+        if (gicv5_domain_has_virt(cs, domain)) {
+            *data = irs_vpe_hppir_read(s, domain);
+        } else {
+            /* RAZ if no virt */
+            *data = 0;
+        }
+        return true;
     }
 
     return false;
-- 
2.43.0


