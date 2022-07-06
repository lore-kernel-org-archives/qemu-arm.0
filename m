Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4880367lft;
        Wed, 6 Jul 2022 10:22:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vpU/r6pSGXo0Utf6EL5eibcuvl46bUDa7gNfrl6G3IXzdWXCb36sm9SvKdXhUTKJmodorT
X-Received: by 2002:a81:52d5:0:b0:31c:924e:f569 with SMTP id g204-20020a8152d5000000b0031c924ef569mr21776036ywb.382.1657128121116;
        Wed, 06 Jul 2022 10:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657128121; cv=none;
        d=google.com; s=arc-20160816;
        b=NU/w6VgEDR9g14mkEj3UkkRTeNkDidRUmkqUgskNcjyGFBV0TFmPCirI96yGadSeZZ
         LnhV8b5N9n0c163JaCTSjwJ8nkPDlynjaDQ9hGLqafsCgXXFiDbpeJZDD4x0+1fFg5zA
         wzH58pz7oyQUSFz7t0iS8F6p8U9w6dqb4x1rG4M9A4KwH049utSf5McATUJVfSTKj0g/
         1nVNptJZl9tVSIRWF6Why4BiN1rE0bsudgVCHtyzh3k/pXk+snxHDCet1zC0PtCBEcjh
         GxbGCJnoerjXydSn4b0Ly+JD7uEPtdwUcE67QhpNM3A7kOCUIR176QwsSBWRIXe2LLtd
         G2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=v7Rw8uhpMHFHDKYV4EyjZ7YSY1SS2TFOB11cL6Cavg0=;
        b=Cit0/xPgnfdcDKzByN24BWRSting7LZTf4PL2YUhj8aEiityqdvEIjveFMaNETDwbD
         CKpK+SiGjGlop++/IseOVJYjUl8PXSFb3glWIJC8efHvzoZLiGOrposmp/GlJM/mryDb
         Bw7p7E6/F6QQ5Ci0/xvArGrMJ0XCSZkrRZucgDqTikXSJyLGzN+o7arYS6mJR+swz4Q/
         aNqjg5L0tzY71r1dkDcbN/1Zodl1P2ym+vneBWpodb3hN+TzGZkfPzw1VGX8c4DVfh7R
         4uF/hjbGVdeCsv1RJpQ6ygvv64KClU1RQySIH0NROVH7Is6H5LccUsL6mx3t8P347qAp
         Nu4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e207-20020a25e7d8000000b0066e3adba36bsi14952136ybh.451.2022.07.06.10.22.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 10:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o98iu-0006mM-G1
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 13:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=dv4w=XL=kaod.org=clg@ozlabs.org>)
 id 1o98ik-0006m7-Bn; Wed, 06 Jul 2022 13:21:50 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:49991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=dv4w=XL=kaod.org=clg@ozlabs.org>)
 id 1o98ii-0005nT-5s; Wed, 06 Jul 2022 13:21:50 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LdRD32NSvz4xZB;
 Thu,  7 Jul 2022 03:21:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LdRD03zn3z4xTq;
 Thu,  7 Jul 2022 03:21:36 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH] docs: aspeed: Minor updates
Date: Wed,  6 Jul 2022 19:21:31 +0200
Message-Id: <20220706172131.809255-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=dv4w=XL=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7in14465ciJq

Some more controllers have been modeled recently. Reflect that in the
list of supported devices. New machines were also added.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 445095690c04..6c5b05128ea8 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -31,7 +31,10 @@ AST2600 SoC based machines :
 - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
 - ``rainier-bmc``          IBM Rainier POWER10 BMC
 - ``fuji-bmc``             Facebook Fuji BMC
+- ``bletchley-bmc``        Facebook Bletchley BMC
 - ``fby35-bmc``            Facebook fby35 BMC
+- ``qcom-dc-scm-v1-bmc``   Qualcomm DC-SCM V1 BMC
+- ``qcom-firework-bmc``    Qualcomm Firework BMC
 
 Supported devices
 -----------------
@@ -40,7 +43,7 @@ Supported devices
  * Interrupt Controller (VIC)
  * Timer Controller
  * RTC Controller
- * I2C Controller
+ * I2C Controller, including the new register interface of the AST2600
  * System Control Unit (SCU)
  * SRAM mapping
  * X-DMA Controller (basic interface)
@@ -57,6 +60,10 @@ Supported devices
  * LPC Peripheral Controller (a subset of subdevices are supported)
  * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
  * ADC
+ * Secure Boot Controller (AST2600)
+ * eMMC Boot Controller (dummy)
+ * PECI Controller (minimal)
+ * I3C Controller
 
 
 Missing devices
@@ -68,12 +75,10 @@ Missing devices
  * Super I/O Controller
  * PCI-Express 1 Controller
  * Graphic Display Controller
- * PECI Controller
  * MCTP Controller
  * Mailbox Controller
  * Virtual UART
  * eSPI Controller
- * I3C Controller
 
 Boot options
 ------------
@@ -154,6 +159,8 @@ Supported devices
  * LPC Peripheral Controller (a subset of subdevices are supported)
  * Hash/Crypto Engine (HACE) - Hash support only. TODO: HMAC and RSA
  * ADC
+ * Secure Boot Controller
+ * PECI Controller (minimal)
 
 
 Missing devices
@@ -161,7 +168,6 @@ Missing devices
 
  * PWM and Fan Controller
  * Slave GPIO Controller
- * PECI Controller
  * Mailbox Controller
  * Virtual UART
  * eSPI Controller
-- 
2.35.3

