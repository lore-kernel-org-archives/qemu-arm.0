Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7216623wrx;
        Thu, 7 Mar 2019 06:38:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqxt4sZh8F85xI0RehlNdGu7rhn0ndXkZ6XHIUh2Bitd3vVHYPtTWWmlbJJpWpPpRPMZ/WeE
X-Received: by 2002:a5b:18a:: with SMTP id r10mr11422548ybl.241.1551969488449;
        Thu, 07 Mar 2019 06:38:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969488; cv=none;
        d=google.com; s=arc-20160816;
        b=nSXqWpsJUuwn1t2IzadqUK8VTI5BETXcJuoJsk6XmnfUrbblIwob4O4cjYy5fGpgGW
         9l33yWcNELmBUIOiQgsT1a0bCB0oFXsXlIorZD/Wpxmnnq/o3u+R+aB0KLk7VB5fTwis
         RQvaR2jxxu4ii6DjGI7SckoYwmgXecxB8chT2IT7CiUPM4dQpAITSSx4XdNPppSg0+Dp
         tkxPSrnPKpQnZVctC3gWvs5b7XoDrYQAp2WMCpHW/9WrZjqVxHSHJF289ZxnpBA+Wq0s
         TEnj7bPx9GjjlXhQuOgcEMwd+G2vnkrcLPGruCOFdbA3mhSfDcQ9b/nKZwBKbOCJHev7
         ko7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=/8RAtYV8Qra4sLP2ypkwmj8aH3baybmYppBcmsWQPMg=;
        b=ACb0YFsusWhIPvSlmvTr6xB4+WbUNmriNwwSiA0SSXM+W5raEiLFkt9cr1gxFhcMfS
         PHGs450dJ2q/gwB7xXu2qa9bh3ZfcmZE0Nz9/P5EYizMJM0/5iAvALwqOTxpwRqTBmNa
         PETJ5NYa3CGOs7zHOI25kFLm48E77Mz5sMfZFlEPIN3xUrwi8vwXSCvORcYJGEr604LA
         y/IysE8PEtdpHYcQEcT0LNbtkzgYlyel4YonlksBxCSvAotDqCVeCM8MlAuSGQkHCInY
         LhB/WKs+htyHpkqY+9fKBtqhQ+G3gAd6LGgP8kJkkUIZUwPQzzkmnzxS2C0gETlGZ2rA
         kUtA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j138si2929046ybj.405.2019.03.07.06.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:38:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52875 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1u9v-0003eK-QA
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:38:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tux-0007M0-Pf
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tuv-0002ba-NS
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:39 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49952)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tut-0002Z8-Sn; Thu, 07 Mar 2019 09:22:36 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2658A3082E70;
	Thu,  7 Mar 2019 14:22:35 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AF1925C1B5;
	Thu,  7 Mar 2019 14:22:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:51 +0100
Message-Id: <1551968334-18982-27-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 07 Mar 2019 14:22:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 26/29] hw/arm: Express dependencies of the
 ZynqMP zcu102 machine with Kconfig
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
X-TUID: wYyu9QWmx0PH

This cleans up most settings in default-configs/aarch64-softmmu.mak.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/aarch64-softmmu.mak |  4 ----
 hw/arm/Kconfig                      | 11 +++++++++++
 hw/display/Kconfig                  |  1 +
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 4ea9add..3a4b15e 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -3,10 +3,6 @@
 # We support all the 32 bit boards so need all their config
 include arm-softmmu.mak
 
-CONFIG_AUX=y
-CONFIG_DDC=y
-CONFIG_DPCD=y
-CONFIG_XLNX_ZYNQMP=y
 CONFIG_XLNX_ZYNQMP_ARM=y
 CONFIG_XLNX_VERSAL=y
 CONFIG_ARM_SMMUV3=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index da4d5c1..adc38d4 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -283,6 +283,17 @@ config STM32F205_SOC
 
 config XLNX_ZYNQMP_ARM
     bool
+    select AHCI
+    select ARM_GIC
+    select CADENCE
+    select DDC
+    select DPCD
+    select SDHCI
+    select SSI
+    select SSI_M25P80
+    select XILINX_AXI
+    select XILINX_SPIPS
+    select XLNX_ZYNQMP
 
 config XLNX_VERSAL
     bool
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 25116e6..5ea402c 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -108,3 +108,4 @@ config VIRTIO_VGA
 
 config DPCD
     bool
+    select AUX
-- 
1.8.3.1

