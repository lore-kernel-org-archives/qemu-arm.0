Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4423599ejb;
        Tue, 20 Dec 2022 07:37:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7N/jj9qBWBNzKxHr82TYRjiiPYJwBfaVbUke4VJFHDtS74kXg0ND6sRz3Y1JFRKuHnTSpG
X-Received: by 2002:a25:180b:0:b0:71c:52cd:fad3 with SMTP id 11-20020a25180b000000b0071c52cdfad3mr36697580yby.54.1671550647873;
        Tue, 20 Dec 2022 07:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671550647; cv=none;
        d=google.com; s=arc-20160816;
        b=QOtcDuZYGQp41tw/J6pndmkaL/TyPJ6eL3QgCTHC6mpFFrCehoQOFNfLrdY9Sjnor0
         p5J2a7VHMgItfAllC0B/o62ADN37OD+Tg7AoI8HB6rphc7DMadZuCYHgPV8uHj8j5T2c
         OjeXhrRrQ2QCgkvfVouB7nsqABWh/larkKn0KCsqODUPS1U51KM8kCLa0GKZa921WZ2r
         UeG55FbJqpa5qmzVGVY6VNEU9Zaob3tQxT42NSSPY3oYwHB/4FPluI0YL/b4fbfQGShr
         slztcCxRBbDIxgShOKSIGSUJa4nVFRw5wtgA/js4o7wv1HaJZuF+eNfc0MTbOiL1NT36
         6cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=v9trR9vbrPQPoZORLPiccWNfYpM7YuhpISCWKHG0hlo=;
        b=b4nvUwL5dg3sw2K+WCzz7ADzsVXu5hwTn8f9PWtehfqoamKDXz6PAxJRo5GXSkUfht
         DcgfvLDX9G6fUQUhzY7aq/Y0GBEQ17ZnBCrZzYiFzWCOhKVu2WHAz5tmA8QHz8YxQRtC
         O/G2wbsD4vkd2vuMNsqr/KHNuDkJDwH4jcCwvxF5xqtEizpcnb0YLFEkkVReDdGNXYPh
         4B795soK/cOyPrMU/ch4f1bEsyDa+O0uaGG88KPYVpzBGznEBzeOEVwnAv11N6JW0nhg
         PzhJIb0LBj5Vd2I14fbyYYLZ0d3MCwGNuk4UZxiDcAzFNy7DVy75UP4XPXhRQnZ7fTbV
         Mqjg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs13-20020a05620a470d00b006fa2412eec9si5420839qkb.587.2022.12.20.07.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 07:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7eg9-00079i-G0; Tue, 20 Dec 2022 10:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7eg4-00071w-5r
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 10:37:12 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7eg2-0003xq-If
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 10:37:11 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 50ADEE0012;
 Tue, 20 Dec 2022 15:37:04 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Subject: [PATCH] i.MX7D: Compute clock frequency for the fixed frequency
 clocks.
Date: Tue, 20 Dec 2022 16:37:03 +0100
Message-Id: <b39c13bd71adaa91559d3436e724d90280e81c63.1671548388.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671548388.git.jcd@tribudubois.net>
References: <cover.1671548388.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.196; envelope-from=jcd@tribudubois.net;
 helo=relay4-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dM3iNeQL5uc1

CCM derived clocks will have to be added later.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/misc/imx7_ccm.c | 49 +++++++++++++++++++++++++++++++++++++---------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/hw/misc/imx7_ccm.c b/hw/misc/imx7_ccm.c
index 075159e497..f135ec7b7e 100644
--- a/hw/misc/imx7_ccm.c
+++ b/hw/misc/imx7_ccm.c
@@ -16,6 +16,10 @@
 #include "hw/misc/imx7_ccm.h"
 #include "migration/vmstate.h"
 
+#include "trace.h"
+
+#define CKIH_FREQ 24000000 /* 24MHz crystal input */
+
 static void imx7_analog_reset(DeviceState *dev)
 {
     IMX7AnalogState *s = IMX7_ANALOG(dev);
@@ -219,16 +223,43 @@ static const VMStateDescription vmstate_imx7_ccm = {
 static uint32_t imx7_ccm_get_clock_frequency(IMXCCMState *dev, IMXClk clock)
 {
     /*
-     * This function is "consumed" by GPT emulation code, however on
-     * i.MX7 each GPT block can have their own clock root. This means
-     * that this functions needs somehow to know requester's identity
-     * and the way to pass it: be it via additional IMXClk constants
-     * or by adding another argument to this method needs to be
-     * figured out
+     * This function is "consumed" by GPT emulation code. Some clocks
+     * have fixed frequencies and we can provide requested frequency
+     * easily. However for CCM provided clocks (like IPG) each GPT
+     * timer can have its own clock root.
+     * This means we need additionnal information when calling this
+     * function to know the requester's identity.
      */
-    qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Not implemented\n",
-                  TYPE_IMX7_CCM, __func__);
-    return 0;
+    uint32_t freq = 0;
+
+    switch (clock) {
+    case CLK_NONE:
+        break;
+    case CLK_32k:
+        freq = CKIL_FREQ;
+        break;
+    case CLK_HIGH:
+        freq = CKIH_FREQ;
+        break;
+    case CLK_IPG:
+    case CLK_IPG_HIGH:
+        /*
+         * For now we don't have a way to figure out the device this
+         * function is called for. Until then the IPG derived clocks
+         * are left unimplemented.
+         */
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: Clock %d Not implemented\n",
+                      TYPE_IMX7_CCM, __func__, clock);
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "[%s]%s: unsupported clock %d\n",
+                      TYPE_IMX7_CCM, __func__, clock);
+        break;
+    }
+
+    trace_ccm_clock_freq(clock, freq);
+
+    return freq;
 }
 
 static void imx7_ccm_class_init(ObjectClass *klass, void *data)
-- 
2.34.1

