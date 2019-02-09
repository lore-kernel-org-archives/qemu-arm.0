Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp299085wrq;
        Fri, 8 Feb 2019 22:52:43 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY//pIvk4IAXQ7Skfy4o4Fzxp3CKnVJx22k8rUwXJSGgfUAmaKwQL25+2c/n0XFnbl4aTOY
X-Received: by 2002:a1c:f707:: with SMTP id v7mr1784381wmh.18.1549695163441;
        Fri, 08 Feb 2019 22:52:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549695163; cv=none;
        d=google.com; s=arc-20160816;
        b=tdcGxp2L/Q5z/PWOqkMj5Omon6TqyiVxC6CqhRVqGdbEWzXd2YmKAhcoyK1zxvKWuQ
         bssGQ8JhS7pIciH1zmeZ1qJV8+RcF3V+s3wjlvCnOYsw0rdvObai6DlCLw7yP0hqs4FD
         grXFDC8+opE1OYuHvzRy+JGa1bJLHTPJ+0moTGw1KWYCUFzhBkeg3pGNe64cCuO+/oaO
         hwqIrOS/RtC+MYeheFWoCQI2vX1LPND6Dw54quOj7u8phcXPOb5Y5GdIcxP581m/pVDA
         R35digHSZy/5Nixa7NcmVT4G9KafkW1Xn02mlO1FoQGw2PxtgMPdlO7vPxPvpzuNVrvq
         9+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=rEZpWu7HZ1cEobmY06voi2sQW3/NcbxxCqwHuB+syzo=;
        b=06g2wrtL5kOQsCKlmr9uO92tthaH9Po/n/iDeR6MZu/z9hSIvKDweezFOXF7VguIFr
         ozN2sccQ/eMTS0cIAqs777LeZdxmZ429dALY189OGNJZ2CL5OCNVMPFXlvTLcUt5Af1Z
         9ndSaWn9GUgr3x7SLU9cONqJ3sdgdWrIz7zviyCULFfiF9P+ygbfnwwNh7xy+aVadNSb
         HJoUAuqNIjrqaNUCpzswfgd28ltOK393fxnSX7WAPn0x5hpjAu5wEgGFftsK7oA8PaNT
         3gopxUj3K83DaIcaFcKmxbXzPtIvCEN3tfHD8Xb+8CihSpl6qwOfNRuY+tzSgFYvZnWB
         HTIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si2969498wrp.16.2019.02.08.22.52.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:52:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41624 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMVG-0005cJ-FM
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:52:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJr-0004V8-My
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJn-0004U8-PA
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52244)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMJl-0003y1-TO; Sat, 09 Feb 2019 01:40:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 59A5A637E3;
	Sat,  9 Feb 2019 06:40:26 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8AF35B6A4;
	Sat,  9 Feb 2019 06:40:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:22 +0100
Message-Id: <1549694366-1284-22-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sat, 09 Feb 2019 06:40:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 21/25] hw/arm: Express dependencies for remaining
 IMX boards with Kconfig
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wwtW+qGHCAPP

IMX25, IMX7 and IMX6UL were still missing the Kconfig dependencies.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  2 --
 hw/arm/Kconfig                  | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 729e4b8..e0d1a00 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -33,7 +33,6 @@ CONFIG_SABRELITE=y
 CONFIG_MSF2=y
 
 CONFIG_VGA=y
-CONFIG_IMX_FEC=y
 
 CONFIG_NRF51_SOC=y
 
@@ -45,4 +44,3 @@ CONFIG_PCIE_PORT=y
 CONFIG_XIO3130=y
 CONFIG_IOH3420=y
 CONFIG_I82801B11=y
-CONFIG_PCI_EXPRESS_DESIGNWARE=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 7823a16..c4b3cd2 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -297,6 +297,10 @@ config XLNX_VERSAL
 
 config FSL_IMX25
     bool
+    select IMX
+    select IMX_FEC
+    select IMX_I2C
+    select DS1338
 
 config FSL_IMX31
     bool
@@ -311,6 +315,8 @@ config FSL_IMX6
     select A9MPCORE
     select IMX
     select IMX_I2C
+    select SDHCI
+    select PCI          # TODO: Currently required for SDHCI, remove this later
 
 config ASPEED_SOC
     bool
@@ -350,12 +356,26 @@ config IOTKIT
 
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
+    select PCI          # TODO: Currently required for SDHCI, remove this later
 
 config NRF51_SOC
     bool
-- 
1.8.3.1

