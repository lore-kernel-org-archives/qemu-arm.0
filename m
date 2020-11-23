Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3389427lfb;
        Mon, 23 Nov 2020 00:07:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylb8rsw8H2HGJ3ki2anCkWWPUYvdaLdCk0e8OjfBVvefldzYGpO3fNIiVHBHrN3p8fDg4v
X-Received: by 2002:a25:397:: with SMTP id 145mr30398954ybd.6.1606118844707;
        Mon, 23 Nov 2020 00:07:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606118844; cv=none;
        d=google.com; s=arc-20160816;
        b=pkRJofyt0pjo6FAJ5BaTbovVtqSm9syPATjoD0hIdKlZxDTx8fWikyHlCLsPCRXI8p
         lD8SHh3eafH12sYPcqQGszmoHCaCEaMkaqpOct1rIbLeU3iQOQmGRX2K7xgbcz66OsGo
         uqwX+RcX17Ob2OP37wS4qnh+a8MzWV7K8LXI7HyElHkIYPvCjhfbhssPhOOo1WSdgnM/
         dhGzIxGtpY4nlgcn9soo2uO+w5mtCXzYQ30BXfyXLq2AwtBuCYKQEZoURy1FFYU1WJOB
         kMe2z/kj3153lkdG69JKjRvPJ9Ytm36JC8OPVd4vFLhm7hVV5Mvj2pfb/xH8tVa9YpEn
         qksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=BnJ8yPU1GP4Ir3VgX4z1XHJ2w+XW3s6NAMIqE40hfxM=;
        b=Fep8NwodXKxYPPgvwCEzmAR6dtlJAuIxYobbuQ2rNnlSaDZ1OMvU3Uupc3BmdBD+0t
         RZNSWPlHk0F3xD8tsd0MhTiW1CevPK0rKAUQjuv8n9PY9cdXYQOXUC6R1wRIZCEW8Pth
         njVOCZ0Gva2bSCYq79tvAC9XGlYt1zBRaVykTnPrAJD/gO4ikkXRfG9NjrGc7Cl1At8I
         sbP9OmqnY7i11VzJtGTpvt64YLIqO5GbjClDFl5s/g6liufkJblEgv0QpR/QQ7MBHL0a
         rvTMJu//hrfAFIQ88kuCWzVvZjRygFbMapBoJ5bK6DvMArh645SoYY+mgGA99N93A6uT
         RMNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q82si11144835ybc.446.2020.11.23.00.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 00:07:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh6se-0002Iy-1u
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 03:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kh6oU-0006LT-5S; Mon, 23 Nov 2020 03:03:06 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54648
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kh6oR-0004h4-Eo; Mon, 23 Nov 2020 03:03:05 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 61A1760351;
 Mon, 23 Nov 2020 09:02:41 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 17/17] target/arm: refactor vae1_tlbmask()
Date: Mon, 23 Nov 2020 10:02:37 +0200
Message-Id: <20201123080237.18465-17-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <3333301.iIbC2pHGDl@basile.remlab.net>
References: <3333301.iIbC2pHGDl@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 109T6RArkIzk

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index af43783339..595080d137 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4469,26 +4469,23 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
 static int vae1_tlbmask(CPUARMState *env)
 {
     uint64_t hcr = arm_hcr_el2_eff(env);
+    uint16_t mask;
 
     if ((hcr & (HCR_E2H | HCR_TGE)) == (HCR_E2H | HCR_TGE)) {
-        uint16_t mask = ARMMMUIdxBit_E20_2 |
-                        ARMMMUIdxBit_E20_2_PAN |
-                        ARMMMUIdxBit_E20_0;
-
-        if (arm_is_secure_below_el3(env)) {
-            mask >>= ARM_MMU_IDX_A_NS;
-        }
-
-        return mask;
-    } else if (arm_is_secure_below_el3(env)) {
-        return ARMMMUIdxBit_SE10_1 |
-               ARMMMUIdxBit_SE10_1_PAN |
-               ARMMMUIdxBit_SE10_0;
+        mask = ARMMMUIdxBit_E20_2 |
+               ARMMMUIdxBit_E20_2_PAN |
+               ARMMMUIdxBit_E20_0;
     } else {
-        return ARMMMUIdxBit_E10_1 |
+        mask = ARMMMUIdxBit_E10_1 |
                ARMMMUIdxBit_E10_1_PAN |
                ARMMMUIdxBit_E10_0;
     }
+
+    if (arm_is_secure_below_el3(env)) {
+        mask >>= ARM_MMU_IDX_A_NS;
+    }
+
+    return mask;
 }
 
 /* Return 56 if TBI is enabled, 64 otherwise. */
-- 
2.29.2

