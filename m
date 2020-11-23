Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3389119lfb;
        Mon, 23 Nov 2020 00:06:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZ0RWda9Vh2z+RUmTmit49pCvOcu8h2akP7AVmsKEaxcsGSCB6kjKzs+PiWxzZKyNNE6H3
X-Received: by 2002:a25:24d4:: with SMTP id k203mr34701281ybk.62.1606118809482;
        Mon, 23 Nov 2020 00:06:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606118809; cv=none;
        d=google.com; s=arc-20160816;
        b=RzoaCoVGBbgphCu1kA5SMSoPrLFoW3IPekjkiy6oT9xs2Idf/Cu6GWx6qQiUaocniK
         ze6qim69Ep7Hc4+Mesm3cM8D1yBQRDqoV9+0cv8l/+87cnmSidtKSzHEqKQA2v8z26qq
         2ZJaPFHiYEMb3XF9zm5m7A8IADgXLG2CTr3XUWYuGzY/eygRJZkFPirbA4yHxy3O/b9H
         b1SKG9YdgPPT1sQkaeaWVorUoj/OU3Yh+d5tx/RUqlBUEfhbUtssBvStkN5fyga62ppf
         nne3S6cYmvxkeb1zF83v5lm89QdTKNjZE72X34j/2wf44xJ2gj59XzuYkzyJFrKsrVaq
         MHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ZRgDdqhXUxNQHb25gguKTvo3oyFm2MjAfr2gUrRA/vs=;
        b=YElkey1MUP6kYJMePKCfkJQ4Lx9EPOgtYuLtUizs4ARjt583BbTT1npPLJmv+RSMml
         cNEabn2fMW6helkL/ryuG49NUmzHNmF/jWu6/NoArkJyLYFz/I7soKdUSxY10BEM1nmy
         lR/AN23HwUkeDwc+BT84nHcCN0u1Ti2S0eSq2sdZKogJFSqisDBT7k7YG79XzNE9siTl
         CrDBxG53pX0fk9p5XQgYyUbQbnICOOO0l7AiFeNPH0IZGTQCjS9la4xfekwD5ewQkNPd
         vW8z7kIXc8SKRxIV/xbr1+vHPB9WTCwfY1njBopyTrqwsG7FUtcLMzanx+3H4hRMXKzn
         Tv8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si10506897ybq.119.2020.11.23.00.06.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 00:06:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kh6s4-0000Zl-Tc
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 03:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kh6oT-0006KF-0H; Mon, 23 Nov 2020 03:03:05 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:54642
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kh6oQ-0004fg-KM; Mon, 23 Nov 2020 03:03:04 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 6560D60533;
 Mon, 23 Nov 2020 09:02:40 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 13/17] target/arm: handle VMID change in secure state
Date: Mon, 23 Nov 2020 10:02:33 +0200
Message-Id: <20201123080237.18465-13-remi.denis.courmont@huawei.com>
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fxcj6YmD30D4

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

The VTTBR write callback so far assumes that the underlying VM lies in
non-secure state. This handles the secure state scenario.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9c338a4a97..d46339f344 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4018,10 +4018,15 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * the combined stage 1&2 tlbs (EL10_1 and EL10_0).
      */
     if (raw_read(env, ri) != value) {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_E10_1 |
-                            ARMMMUIdxBit_E10_1_PAN |
-                            ARMMMUIdxBit_E10_0);
+        uint16_t mask = ARMMMUIdxBit_E10_1 |
+                        ARMMMUIdxBit_E10_1_PAN |
+                        ARMMMUIdxBit_E10_0;
+
+        if (arm_is_secure_below_el3(env)) {
+            mask >>= ARM_MMU_IDX_A_NS;
+        }
+
+        tlb_flush_by_mmuidx(cs, mask);
         raw_write(env, ri, value);
     }
 }
-- 
2.29.2

