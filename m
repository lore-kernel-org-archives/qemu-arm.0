Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1659011wrp;
        Wed, 13 Feb 2019 00:52:20 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaBP4rKKo8w4t+fx2ms9a7BbTZH/jK4daZpmnvGSPw9NIZv/H29JSzzKxHItclznGvOkz2n
X-Received: by 2002:a5b:8ca:: with SMTP id w10mr6421964ybq.18.1550047940392;
        Wed, 13 Feb 2019 00:52:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550047940; cv=none;
        d=google.com; s=arc-20160816;
        b=tZpUXg3V5QnckV/GgTInXA/xnqL3onxb6mNlTHO96/VWYX9b6s7axiPg8FJXYSVgIl
         gtAsl/v8yHO4gZYXWus8g8nMZq2swAowCkzlGnPEOf5wUCtMhzNKKsAjSu5bjFkxXAGb
         mg4Mvam52+pgMnOxqhtlHw9EuevFf7eogICxE7hH2P8+Guhtb/Pz/HvLq+6i4snrdF23
         i4YHoY3UXcQJpn7IDqjn4SMQIjUJvo/tb/HSbXq9zbQCbzluV3/vRQioDAi/0LyTpUTk
         9PPL5bQ/NwyNCknZtddl8hGofBVGSqmAIqs9s/8HejZKa5BOwrBGZhkhd/pxWQRz359x
         z3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=jkOXDtKGDTsEgDRwP5KioGTO/3qcNy7LYDKb510YYjE=;
        b=btAnFWOunY0vLUw64sGcVg2wmi37FSaNssgjOP7hlpPdr81UZFLA2C17vE7VR1tXpR
         7hKrGx6j+JaWVkcwKCby27PILlH/XSQ9vXhPv4FtuIgylkaKsz/es3alS82NgIkmzaeD
         2U9SdXGhZms7/mE0KTqGREWk+fly6RqjUzHK5aMtiMiNFK1/5bLpNbaMCsD8Oc9q42Il
         xyQgvNCnv6Te9RNKhjMCoHVnixwkeUtFCB6orXusmmt86Sq5QI8Vf3eOKHMnDYL2G0vt
         fDCS/xspl08zLBcejUrGoYtas+I12/5pV9kD2aHYGS6153+C1TuX58YtzUb1AY1khKS/
         gk8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si780679ywm.300.2019.02.13.00.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 00:52:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqHD-00039M-Pl
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 03:52:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqFz-0002Kh-Gg
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:51:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq59-000692-KY
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:39:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56136)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq55-00064E-Gn; Wed, 13 Feb 2019 03:39:49 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49F1EC04B926;
	Wed, 13 Feb 2019 08:39:46 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9D39610021B6;
	Wed, 13 Feb 2019 08:39:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:14 +0100
Message-Id: <1550047098-1210-22-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 13 Feb 2019 08:39:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 21/25] hw/arm: Express dependencies for
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
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KOQbtPYC8OUm

IMX25, IMX7 and IMX6UL were still missing the Kconfig dependencies.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  2 --
 hw/arm/Kconfig                  | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 5eceeba..ebe5de6 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -33,7 +33,6 @@ CONFIG_SABRELITE=y
 CONFIG_EMCRAFT_SF2=y
 
 CONFIG_VGA=y
-CONFIG_IMX_FEC=y
 
 CONFIG_NRF51_SOC=y
 
@@ -45,4 +44,3 @@ CONFIG_PCIE_PORT=y
 CONFIG_XIO3130=y
 CONFIG_IOH3420=y
 CONFIG_I82801B11=y
-CONFIG_PCI_EXPRESS_DESIGNWARE=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index cebb410..c2fba8e 100644
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
@@ -348,12 +353,25 @@ config IOTKIT
 
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

