Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4552444ejb;
        Tue, 20 Dec 2022 10:29:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Hnd/apyzqncWpzWUGjPR0A6Iz02WnhjKqqWJZaIveQo9SsnPrUoeenK6lqU13W6k37b7H
X-Received: by 2002:a05:6214:3c9b:b0:4c6:e22d:1329 with SMTP id ok27-20020a0562143c9b00b004c6e22d1329mr74358339qvb.52.1671560965012;
        Tue, 20 Dec 2022 10:29:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671560964; cv=none;
        d=google.com; s=arc-20160816;
        b=xxXZa8vyZBhR/HbD1czuBWQFzVpbtsgcPuPplPfgd6Fxop+UsRgNj8B5h1cLqaojmx
         6VttCR+vPhvW+VYaceI+hMYmBOjNZHQ2hBSGB5uRCFUZzsGgKTpvLgKPMgwfSF+PZu7/
         WF+m/z6hzDF/o1D7fqSxAGnkMFWKQD8hggwRgj/J8gokG0SZB+ugDOu9qdViIxt22waC
         keTja1MAsmVn+sVhj2OR8Aeic/IKHz1gjYvTBO06VY39XMKFAa8Fx5R/bxEP4dhBAel2
         j1CFVcuyFk7eIkrfsdEU0lOEv6LCtNd9seEkYv8KTyTfTPbj+zVy+dVvQMtLjrUN0kxH
         a3dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=v9trR9vbrPQPoZORLPiccWNfYpM7YuhpISCWKHG0hlo=;
        b=qJKdXwdquRrQlwc25EgKSL8ZOTzM2pgU/rVb+jN045l1YhC3uBZjI4uWYrUdjtYHIm
         RFB7cXPTe1ni5SqxJezGFm1pCFKOrEdfPjrku92Ts1vNhDny6vZcM2m4FpqSL4xFJoj4
         YmLh9n7EJC4w80RTdicghUk3XDddpvubYyI1t7pEQUbrQsFeCDY7s//IRKJnfPbuQnvq
         Mi4woeK733hSmBSSH1A7AHmqoxtxzwGJMZE7AMQpyaEqKKMSf22A5fD8m3iQyocbaOOr
         HzD2OnLSyaDfxJLgB7CFLGH9LpeTaneTl1dIXdQGJZQnW/qRb7FhWFsHxl/aP8OMynue
         s9ww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020a0562141d2600b004f59f424bd4si5574587qvd.472.2022.12.20.10.29.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 10:29:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7gPJ-0001N5-EY; Tue, 20 Dec 2022 12:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7gPA-0001LC-DE; Tue, 20 Dec 2022 12:27:52 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7gP6-00057S-7P; Tue, 20 Dec 2022 12:27:52 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by mail.gandi.net (Postfix) with ESMTPSA id C8BD56000A;
 Tue, 20 Dec 2022 17:27:41 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org
Subject: [PATCH] i.MX7D: Compute clock frequency for the fixed frequency
 clocks.
Date: Tue, 20 Dec 2022 18:27:39 +0100
Message-ID: <b39c13bd71adaa91559d3436e724d90280e81c63.1671548388.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671548388.git.jcd@tribudubois.net>
References: <cover.1671548388.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.195; envelope-from=jcd@tribudubois.net;
 helo=relay3-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: KCRQ0r8+yems
Message-ID: <20221220172739.t53_xhsGlpOiIO-06JQq51oWZI5ssx0lFA7SQwBXtRk@z>

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

