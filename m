Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7215806wrx;
        Thu, 7 Mar 2019 06:37:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUP1jDiYwCHq28tkpF8XkHIu7r4WFokszSBmRuU1iFp5cLu7KTS/JCdf9+ubRS8m+zDSlb
X-Received: by 2002:a81:2544:: with SMTP id l65mr10108958ywl.263.1551969440251;
        Thu, 07 Mar 2019 06:37:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969440; cv=none;
        d=google.com; s=arc-20160816;
        b=rr56ycz2A5bd+72WajxCNdZBcTA5emniRWwHNXeguSu1IG3mtKH5XWt33UL6y6ebum
         IL58LwYoHYbmwGINVAHgPPvUO37Xa2ZoZhNMA9jwHlusvSs6XlsVfz88yNh8UuIH1e1+
         0qoc9VJrqKRPQWMs/28+l3hajKUSd6YCgvqQCY+3nv8NtZU8Vh1g3xSNgIyQEWDYWpVN
         nnxW1SJ/qisQ/Qzu5rQJECIbq+SONplXjq6bKqEdO4j1P2oOStszDkABdBMm5MdaSh3u
         PMqy9pzxZ2XsTzqk2J7FBtokwCFzPH8wEljRChhGXqmjDq2HkURHBNiPRvTKCS7exSTd
         Jo+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=+KjoVIeUHdJmdfbEihUpQAq9pUysMxIHqvJJk0WTbWs=;
        b=EL8Z+KCQ631OQgAgmW/STppG6HfTGOjTAoBj5Qnm/G6hr9kduQ0NJ68dYjOMU7Id39
         GXs7XoCPp+LKlSJ5y68GdUK3DBui8Y1HG7W9RaqcVntXiTbE8MZ+dzssWj7S7OJToqcC
         7bWlCu87FpWFUVgZJGtKNgjHzb74grT47jSZ+L7Bei4yyZotycZDszCa6s8cZWia739v
         5N82a0B/tNBJy6h3/BGay+V0VRTbMHR5EBmljhvb8w5ambG4JN6/ZTbFHzUU88ln3i5u
         1JZBsul5xJW3VquTRFiqN1P4S99Q8kahhSDnBL7GzUPc1dYgTl2yiUjmlFJbowE6AL2c
         nicw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s196si2522408ywg.441.2019.03.07.06.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:37:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1u99-000320-L3
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:37:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tub-00071o-GG
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tua-0002A2-HM
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34792)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tua-00028Z-7u; Thu, 07 Mar 2019 09:22:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B4683092663;
	Thu,  7 Mar 2019 14:22:15 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 397755C28C;
	Thu,  7 Mar 2019 14:22:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:49 +0100
Message-Id: <1551968334-18982-25-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 07 Mar 2019 14:22:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 24/29] hw/arm: Express dependencies for
 remaining IMX boards with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hFykqykiIRA7

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
index 7df0bb6..6a8b801 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -289,6 +289,10 @@ config XLNX_VERSAL
 
 config FSL_IMX25
     bool
+    select IMX
+    select IMX_FEC
+    select IMX_I2C
+    select DS1338
 
 config FSL_IMX31
     bool
@@ -303,6 +307,7 @@ config FSL_IMX6
     select A9MPCORE
     select IMX
     select IMX_I2C
+    select SDHCI
 
 config ASPEED_SOC
     bool
@@ -328,12 +333,25 @@ config MPS2
 
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

