Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp731281lfp;
        Thu, 14 Jul 2022 08:57:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umne6n5UQC1zdsz1ZMp/B37bYSaE8VYtxYV81WQkA2e4mossFlhNeVY09+P9ULhzYf8dUS
X-Received: by 2002:ac8:5f86:0:b0:31e:aaf4:671a with SMTP id j6-20020ac85f86000000b0031eaaf4671amr8540804qta.535.1657814262983;
        Thu, 14 Jul 2022 08:57:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657814262; cv=none;
        d=google.com; s=arc-20160816;
        b=L+o9vVV8/ajCd8mRcZjYgywbpDpW7gw+mn7Z2zs9AzDoMW3pNKdDhPzxKBsymipFaN
         iNAdt7qf/pfbP25C8LLh1EYKuVvPCmq4X8MWi5SPc539BvUL88HwlhRyqDC1sdSGT8Dq
         5ahxkFZL1DtYmrwRNPuKwPHP12BPT98uLH1OKWGZYDKQaBKSo5nt7AYx2d2chS2LQzTw
         hmz7XenSOLCKwPqlzUfpyv11UmQ5uiJqfDwp96J3hfzM0uAPvD/s2dLETgTQY+1h5Q3t
         eQLpu6l1K5yFip3fHh78D9y0i2o491KQXnGxH4Do4FR0KvD/jep982Bft+l6/JxrNlQR
         0Ccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=aVEawmUEDi+0wVTvegIWktfXqozFazTJs6ycclcwaOw=;
        b=mLCWk5zZa/rVJ0fZngCpFmLfQDEDRv5te7vRMQJznsOgyg2oZELA71G0+N038ZDIGY
         hH/cHBDszEORfBJQO5YIy86z4NltV0dZHz8PfxfGOmvnb3xz0339EUsC4mw70QFFqFIb
         KiwIFTPzDGyxUrPgAiz0Wtg1zS2AK0VBshNs0BhaJtkq5KtHr3pk5YmjZ9oef3ttEHa1
         5/i4rRl5tlbMThMi3RHx4KlOdpEGEEsUDqHM3Kahr/hH8RFvcfsd3s8jEFcdCT13SZ9O
         TKoABl8+xNVm/k2pzFx4eU4rcLssshhr27YvmBkFXvBgHvazvXAZsSXH0MIYTfx/UCVK
         xAUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15-20020ac85c0f000000b00304ec6d0ae3si1467614qti.254.2022.07.14.08.57.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 08:57:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oC1Di-0001hE-Ep
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 11:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC12O-0005UF-2Q; Thu, 14 Jul 2022 11:46:01 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:44579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=QWOl=XT=kaod.org=clg@ozlabs.org>)
 id 1oC12L-0000ZB-HK; Thu, 14 Jul 2022 11:45:59 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LkJjV3FSPz4ySg;
 Fri, 15 Jul 2022 01:45:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LkJjS3F4vz4xdJ;
 Fri, 15 Jul 2022 01:45:32 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <peter@pjd.dev>, Joel Stanley <joel@jms.id.au>
Subject: [PULL 13/19] docs: aspeed: Minor updates
Date: Thu, 14 Jul 2022 17:44:50 +0200
Message-Id: <20220714154456.2565189-14-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220714154456.2565189-1-clg@kaod.org>
References: <20220714154456.2565189-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=QWOl=XT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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
X-TUID: ykctYLf+8k4q

Some more controllers have been modeled recently. Reflect that in the
list of supported devices. New machines were also added.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Message-Id: <20220706172131.809255-1-clg@kaod.org>
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

