Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1417305lfc;
        Thu, 4 Jun 2020 05:42:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9jqBHNDdLuP4JKDwxpaqLFvF3TJBJcP6rQtgNrXKhfUfMsIjBJ3OZDt5dGC354wz2+wDA
X-Received: by 2002:a25:b5c6:: with SMTP id d6mr7534238ybg.73.1591274520051;
        Thu, 04 Jun 2020 05:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591274520; cv=none;
        d=google.com; s=arc-20160816;
        b=uaBfHCryT5zGIQu0z8Kpyc9imwyMxKXwOdQTQlf4fdYzOKDOU8kiZFszKwv7MWm2mN
         jvbH9S4NdOPMnVje7vzhdr4TZirZFQsNJMY6z5TIyh4zYHOgOqLPY2pHrQLezuQwJY7c
         jGFOt74tGzuWcm6sHx84y0NtT/lVRIp5QBRR5LQ0noU2t4CjoFtdDTz5BjtufjMagucF
         /tct9DuMGUyM5A1G2J8N04PkfVDKOmD6BWwXLlwpxdE5Il7+6+7+4u+qVBKagPrtcRYd
         QWLBwrfQKyQajqS/AYkWNEj6KwF0P6S22DFbZ16qDCl5K9JffQGZptj9udlTfEM9ngQ0
         psCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=2mW5cvW5gxYZzpVM8wcHRJT0qd2Mm2Xpruaip9CGWVI=;
        b=yOiYZBaH3cAoF0i71g73JtJ1vv/UbzWElNpolBy61OEUt4jFx2mYzVQqYtQSJl4Lpq
         E4i7kePxONOHuWIr2ZAdcyp7YDopmyi5hIs+a/IqV2FQ3p58rCBNIIxSI9smMXbQCqmZ
         YcG9zps5rfl2+nLQGNBwnUmAtUpW4ORApzTOceoztYhW4rFCEGMfAOJDhhnk5Vmpgs6e
         2TbwY1MUisjneQ9eb+IzBw33BptZxOjI4BfGIcAwQ84vLbCIHPEm++0ph+UkzPJ1jl0D
         3wf356BSVo5CXDlnIvwRYFxj/YDJQxpAs45snnkq/NX2qoQZVvNyXYs70KMUnTVRFvNw
         BjHw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a187si3910242ybg.298.2020.06.04.05.41.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 05:42:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgpC3-0002ti-Eb
	for alex.bennee@linaro.org; Thu, 04 Jun 2020 08:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jgp9f-000824-Bo; Thu, 04 Jun 2020 08:39:31 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:35391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jgp9e-0001h4-FF; Thu, 04 Jun 2020 08:39:31 -0400
X-Originating-IP: 82.252.130.88
Received: from localhost.localdomain (lns-bzn-59-82-252-130-88.adsl.proxad.net
 [82.252.130.88]) (Authenticated sender: jcd@tribudubois.net)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2EE69E0005;
 Thu,  4 Jun 2020 12:39:26 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Subject: [PATCH v5 2/3] hw/net/imx_fec: Allow phy not to be the first device
 on the mii bus.
Date: Thu,  4 Jun 2020 14:39:09 +0200
Message-Id: <a6223b7b5c1564afc5fb3c2a9ad514bdb41be5a5.1591272275.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1591272275.git.jcd@tribudubois.net>
References: <cover.1591272275.git.jcd@tribudubois.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.196; envelope-from=jcd@tribudubois.net;
 helo=relay4-d.mail.gandi.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 08:39:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, peter.chubb@nicta.com.au,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5vm2vtz5Jiul

Up to now we were allowing only one PHY device and it had to be the
first device on the bus.

The i.MX6UL has 2 Ethernet devices and can therefore have several
PHY devices on the bus (and not necessarilly as device 0).

This patch allows for PHY devices on 2nd, 3rd or any position.

Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
---
 v2: Not present
 v3: Not present
 v4: Not present
 v5: Allow phy not to be the first device on the mii bus.

 hw/net/imx_fec.c    | 19 ++++++++-----------
 hw/net/trace-events |  4 ++--
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index eefedc252de..29e613699ee 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -280,11 +280,9 @@ static void imx_phy_reset(IMXFECState *s)
 static uint32_t imx_phy_read(IMXFECState *s, int reg)
 {
     uint32_t val;
+    uint32_t phy = reg / 32;
 
-    if (reg > 31) {
-        /* we only advertise one phy */
-        return 0;
-    }
+    reg %= 32;
 
     switch (reg) {
     case 0:     /* Basic Control */
@@ -331,19 +329,18 @@ static uint32_t imx_phy_read(IMXFECState *s, int reg)
         break;
     }
 
-    trace_imx_phy_read(val, reg);
+    trace_imx_phy_read(val, phy, reg);
 
     return val;
 }
 
 static void imx_phy_write(IMXFECState *s, int reg, uint32_t val)
 {
-    trace_imx_phy_write(val, reg);
+    uint32_t phy = reg / 32;
 
-    if (reg > 31) {
-        /* we only advertise one phy */
-        return;
-    }
+    reg %= 32;
+
+    trace_imx_phy_write(val, phy, reg);
 
     switch (reg) {
     case 0:     /* Basic Control */
@@ -926,7 +923,7 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
                                                        extract32(value,
                                                                  18, 10)));
         } else {
-            /* This a write operation */
+            /* This is a write operation */
             imx_phy_write(s, extract32(value, 18, 10), extract32(value, 0, 16));
         }
         /* raise the interrupt as the PHY operation is done */
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 26700dad997..27dfa0ef775 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -410,8 +410,8 @@ i82596_set_multicast(uint16_t count) "Added %d multicast entries"
 i82596_channel_attention(void *s) "%p: Received CHANNEL ATTENTION"
 
 # imx_fec.c
-imx_phy_read(uint32_t val, int reg) "0x%04"PRIx32" <= reg[%d]"
-imx_phy_write(uint32_t val, int reg) "0x%04"PRIx32" => reg[%d]"
+imx_phy_read(uint32_t val, int phy, int reg) "0x%04"PRIx32" <= phy[%d].reg[%d]"
+imx_phy_write(uint32_t val, int phy, int reg) "0x%04"PRIx32" => phy[%d].reg[%d]"
 imx_phy_update_link(const char *s) "%s"
 imx_phy_reset(void) ""
 imx_fec_read_bd(uint64_t addr, int flags, int len, int data) "tx_bd 0x%"PRIx64" flags 0x%04x len %d data 0x%08x"
-- 
2.25.1

