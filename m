Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4552992ejb;
        Tue, 20 Dec 2022 10:30:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6x/j1xWAgvZVFYeiDXeTHTEo7tA3DwxoUX552J1OgwVl0cDE1ZfVT+f8iNM3QnPvqYu3GS
X-Received: by 2002:a0c:e9c6:0:b0:4c7:6938:4514 with SMTP id q6-20020a0ce9c6000000b004c769384514mr61891226qvo.0.1671561015222;
        Tue, 20 Dec 2022 10:30:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671561015; cv=none;
        d=google.com; s=arc-20160816;
        b=HA78moW7Dvx0EOFn9OU0beKbrkMJtHo4PRu4exQ9FPRMf/OBUYSfzbkuy9QrX0T6Py
         QY0EDbfTZl8RWDbed/MBwy/0aQKo+0TVelG8Mg5tlihOPG4aAWZiV0xEA4D7ADwAy0oT
         IpoHzl2hYgg/XHQqsW+1mujl7wWzVle2zBMHRks7a7onNaqQFpRDjD2t1np64rr9eb1K
         zyVmJjcfpxLjVTLOnVbDgGbeR6EmHJmbyhBG7pIEVGlKU6ONXYzL12SPpMfENkPmy+HA
         8ypfnmJyXXulUoWFeaFrL9hjUCokD7YKSdVqP9Ftzlz/e8VXC/7yEyH1cGD2n56eUd7H
         8egQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=OhYTU1aJZb39lmftLIYLDD1VOLE6G+xxYeYH0iJptug=;
        b=KPo/pLiJl7uxq4tBrMSJNAgcH5qTGYEIif3YV/jw9mhlEsnUsyTc+Y3YP04OYTEsw6
         Yns5ppiLII8qs81qWy88IO1pZeevX8/ECFzQGWHHmnaql3kMMw9j47poNGg8UUJiCSyL
         cuUTFqkUoFn8XN3MJHxupbXM0QSz//Xal3sH3SJd1XyvqRO7ae2BZuWv06tKf6UfOb/N
         EEQJ+p7sBildf4T7yxIRCaGMHznPSz4jPhqM1sMUStNu1eETVfoJ0vk81lg5h2z6LpcN
         J9YWSyVThyluRyKgAfvB2oT3rIiJoiw78VpOzBziZkg7YE2cXhAKzSosXnXkaCC7hp1F
         MpHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fo5-20020ad45f05000000b0051f40149c5fsi552869qvb.266.2022.12.20.10.30.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 10:30:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7gPG-0001Mh-Ua; Tue, 20 Dec 2022 12:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7gPA-0001LB-B3; Tue, 20 Dec 2022 12:27:52 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1p7gP6-000575-6H; Tue, 20 Dec 2022 12:27:52 -0500
Received: (Authenticated sender: jcd@tribudubois.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 6B0CFC0008;
 Tue, 20 Dec 2022 17:27:35 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-devel@nongnu.org
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm@nongnu.org
Subject: [PATCH] i.MX7D: Connect GPT timers to IRQ
Date: Tue, 20 Dec 2022 18:27:30 +0100
Message-ID: <63a81cac41c769989e23caebb476dc078e83731d.1671548388.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671548388.git.jcd@tribudubois.net>
References: <cover.1671548388.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.198; envelope-from=jcd@tribudubois.net;
 helo=relay6-d.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: vZUXic4FkpqI
Message-ID: <20221220172730.tKZGVtkzlDiGDTmlUth2_xMNgK4yZQqao4Bt5u2D-tA@z>

So far the GPT timers were unable to raise IRQs to the processor.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 hw/arm/fsl-imx7.c         | 10 ++++++++++
 include/hw/arm/fsl-imx7.h |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index cc6fdb9373..146bb559bb 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -219,9 +219,19 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
             FSL_IMX7_GPT4_ADDR,
         };
 
+        static const int FSL_IMX7_GPTn_IRQ[FSL_IMX7_NUM_GPTS] = {
+            FSL_IMX7_GPT1_IRQ,
+            FSL_IMX7_GPT2_IRQ,
+            FSL_IMX7_GPT3_IRQ,
+            FSL_IMX7_GPT4_IRQ,
+        };
+
         s->gpt[i].ccm = IMX_CCM(&s->ccm);
         sysbus_realize(SYS_BUS_DEVICE(&s->gpt[i]), &error_abort);
         sysbus_mmio_map(SYS_BUS_DEVICE(&s->gpt[i]), 0, FSL_IMX7_GPTn_ADDR[i]);
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->gpt[i]), 0,
+                           qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                            FSL_IMX7_GPTn_IRQ[i]));
     }
 
     for (i = 0; i < FSL_IMX7_NUM_GPIOS; i++) {
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 1c5fa6fd67..50f19d8db0 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -235,6 +235,11 @@ enum FslIMX7IRQs {
     FSL_IMX7_USB2_IRQ     = 42,
     FSL_IMX7_USB3_IRQ     = 40,
 
+    FSL_IMX7_GPT1_IRQ     = 55,
+    FSL_IMX7_GPT2_IRQ     = 54,
+    FSL_IMX7_GPT3_IRQ     = 53,
+    FSL_IMX7_GPT4_IRQ     = 52,
+
     FSL_IMX7_WDOG1_IRQ    = 78,
     FSL_IMX7_WDOG2_IRQ    = 79,
     FSL_IMX7_WDOG3_IRQ    = 10,
-- 
2.34.1

