Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7793828wrx;
        Sat, 23 Feb 2019 00:09:12 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbqnMpuC1TWb/nsLv0RXiWBd+gJJM7AEzgMgn4FomoXR1v4vIe8nwOIqZmgUgNi3AoSIzQN
X-Received: by 2002:a0d:c242:: with SMTP id e63mr6408921ywd.10.1550909352729;
        Sat, 23 Feb 2019 00:09:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909352; cv=none;
        d=google.com; s=arc-20160816;
        b=bcvfzPcpTAlwhPEf1LZ3wJx8lcGbx05Sa6OnfRtQjbyHVivBv9I5T3CFOodl4cfXte
         mILJNNYNH1GRfGHr12GwuRPOa2kRy7vfiBJs6jTPqv0BS9C5gBEJN8cKlauzx61bo+vB
         ctVKXpvcJYOuXjTAma7c3W9qyEMf9aOkS5bTVGXHyrG8T043spZGfd2KtbNq8s4zz0rz
         /1YRdouc3uPQPmM5XJNFTXLBno+2hSbTJq4I9e5lj0pVfkiNJTGisolBSkFTPv6D+cMs
         KJRjwhYLPrAfv3775szc2FlP0XJoVQlFXzVJQRxAosNKvdScHehI8iVpiLxMZwaVSiYU
         uTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=ttBr31N7N9QJ7hKuVtbpIMSIhcy1jbMjEmZJL+jT0CI=;
        b=er1WDSQUIQH+sQdlyM80YEMojX+KgJZz5qljIoU9xt525lB78rGl27jLimDUCm7vwO
         rdqPqrN6LKzzcUXcSHsCR/9ffSsujp06LEfqTEUqnFhWpLcL4Pwz/k6GC3BmgRcKPzz7
         CLtCDgZpsBqPcAuQYFfVMwCOAP+YCtZnGHjaXWEYF2lnaLEq6AvswMRUIVGu8x9URL6r
         zCHBhBRyCYySagpYqaBMwNaaWKPA2rq4+8DOWUKfWt72v7+oOIUrm8GL4jQ0wlfHw7DW
         7bW92QxI/0Qgq6waH9WDgE70KlLx7fsNX+4yFj7o/pWTquT/OnQ73+ZDHif2aSkcIB1l
         rNxw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n83si2339904ywc.151.2019.02.23.00.09.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:09:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34348 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSMy-0001pA-5t
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:09:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS51-0005Hh-Ti
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:50:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS50-0002pt-0F
	for qemu-devel@nongnu.org; Sat, 23 Feb 2019 02:50:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51650)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4j-0002Yt-9A; Sat, 23 Feb 2019 02:50:23 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E89F3082208;
	Sat, 23 Feb 2019 07:50:19 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E60FF5D9CA;
	Sat, 23 Feb 2019 07:50:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:17 +0100
Message-Id: <1550908162-22644-26-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Sat, 23 Feb 2019 07:50:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 25/30] hw/arm: Express dependencies for
 remaining IMX boards with Kconfig
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aIZRBFku//7/

IMX25, IMX7 and IMX6UL were still missing the Kconfig dependencies.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  2 --
 hw/arm/Kconfig                  | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index a01e407..88e4e8e 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -34,7 +34,6 @@ CONFIG_SABRELITE=y
 CONFIG_EMCRAFT_SF2=y
 
 CONFIG_VGA=y
-CONFIG_IMX_FEC=y
 
 CONFIG_NRF51_SOC=y
 
@@ -46,4 +45,3 @@ CONFIG_PCIE_PORT=y
 CONFIG_XIO3130=y
 CONFIG_IOH3420=y
 CONFIG_I82801B11=y
-CONFIG_PCI_EXPRESS_DESIGNWARE=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9495e7f..3eee2bd 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -295,6 +295,10 @@ config XLNX_VERSAL
 
 config FSL_IMX25
     bool
+    select IMX
+    select IMX_FEC
+    select IMX_I2C
+    select DS1338
 
 config FSL_IMX31
     bool
@@ -309,6 +313,7 @@ config FSL_IMX6
     select A9MPCORE
     select IMX
     select IMX_I2C
+    select SDHCI
 
 config ASPEED_SOC
     bool
@@ -337,12 +342,25 @@ config IOTKIT
 
 config FSL_IMX7
     bool
+    imply PCI_DEVICES
+    select A15MPCORE
+    select PCI
+    select IMX
+    select IMX_FEC
+    select IMX_I2C
+    select PCI_EXPRESS_DESIGNWARE
+    select SDHCI
 
 config ARM_SMMUV3
     bool
 
 config FSL_IMX6UL
     bool
+    select A15MPCORE
+    select IMX
+    select IMX_FEC
+    select IMX_I2C
+    select SDHCI
 
 config NRF51_SOC
     bool
-- 
1.8.3.1

