Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1661202wrp;
        Wed, 13 Feb 2019 00:55:41 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib5JtqGMz4jb7prcbbbCHsMCs3RsY8BBCJCEyGdxqZf/SggV42Rs9zQ6LyAIF9SIHMhmms6
X-Received: by 2002:a25:d004:: with SMTP id h4mr6393447ybg.156.1550048141590;
        Wed, 13 Feb 2019 00:55:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048141; cv=none;
        d=google.com; s=arc-20160816;
        b=V+0L1XOC1u3UJSq1rnT/d/LicrJvnjD2GnTZtNL4Re5ev73nzXsivYawfMQr2t75cx
         PfH5DHhZ2qQNRmQOgJbNE3bXFj5zgqOSDPIfMXzI634tCbS/7TIWYZjiOWCHrWhZu8GL
         Wv3jXxXDWe/MeUec6pvE8MuH8QUcBTMLwhESIP/vJFJ+yFLq+3oI/QaQ2Wl9uykyLWZI
         HG0rO6sbVq64SucILLZLDCu9IaHusqQqwx2agCYTcGhk2LOvpg5jC1n1nMUBVVcO6ZBA
         ekU1eBigG/Y/TbA+e7BCTHqAAKWkxg2i6fsAfEzSk+2jVU9OmFzqSptR93s8sIRObfvK
         TPMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=M1KIelrXoXww9tiMOMp7xzuAODA4f7NSRjDUAU0UyXQ=;
        b=X9R+v5dDf+2Ag9hNRktVt4wZ2/VkPY9ieyLKPa6PusRodoplnRdc+VBteZS5LvK/3t
         CHYHHJ+WxXmyOdd699VSUWGVjLKowZR8RlJaLOXHd7wtClLzRdzGTCssqk0wR2O/MMtX
         KicOXO/BrJ6r4f1/fdR9aWrHn9L0e2s4fwCqTtxi8drSAVPwelRU+fOzJqjEFU60LsaG
         wza1C7a3B+PXlkNJ1OFahlJj3HdKrwxP76YpqMbHigAzlIjY591JHLWWDputP/9CyWJS
         ShRN/W+gzsEEl/JXgsZXEKXlit08XZJvrK6TswCu3UAMiEfX30uIzAUISM1REYxMARH1
         za3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d131si6669563ybh.16.2019.02.13.00.55.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 00:55:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqKS-0006DK-VP
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 03:55:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG3-00025D-1U
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:51:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4t-0005tr-7c
	for qemu-arm@nongnu.org; Wed, 13 Feb 2019 03:39:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45344)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4r-0005jJ-7H; Wed, 13 Feb 2019 03:39:33 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8D5F356F3;
	Wed, 13 Feb 2019 08:39:21 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7405F10021B6;
	Wed, 13 Feb 2019 08:39:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:08 +0100
Message-Id: <1550047098-1210-16-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 13 Feb 2019 08:39:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 15/25] hw/arm: Express dependencies of
 allwinner / cubieboard with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rsiOfBISO9sp

Add dependencies for the Cubitech Cubieboard.

Note that CONFIG_AHCI has a hard dependency on CONFIG_PCI currently,
so PCI is now always selected by AHCI, even for boards that only
want to use AHCI via a sysbus device. We should break up that
dependency later by splitting ahci.c into sysbus and pci parts.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 6 +-----
 hw/arm/Kconfig                  | 9 +++++++++
 hw/ide/Kconfig                  | 2 +-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 3279fb5..28bb37f 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -4,6 +4,7 @@
 CONFIG_ARM_V7M=y
 
 CONFIG_ARM_VIRT=y
+CONFIG_CUBIEBOARD=y
 CONFIG_EXYNOS4=y
 CONFIG_HIGHBANK=y
 CONFIG_INTEGRATOR=y
@@ -28,7 +29,6 @@ CONFIG_NETDUINO2=y
 
 CONFIG_VGA=y
 CONFIG_SSI_M25P80=y
-CONFIG_ALLWINNER_EMAC=y
 CONFIG_IMX_FEC=y
 
 CONFIG_FRAMEBUFFER=y
@@ -55,10 +55,6 @@ CONFIG_IOTKIT_SYSCTL=y
 CONFIG_IOTKIT_SYSINFO=y
 CONFIG_ARMSSE_CPUID=y
 
-CONFIG_ALLWINNER_A10_PIT=y
-CONFIG_ALLWINNER_A10_PIC=y
-CONFIG_ALLWINNER_A10=y
-
 CONFIG_FSL_IMX6=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 5d7dafb..3d78102 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -24,6 +24,10 @@ config CHEETAH
     select OMAP
     select TSC210X
 
+config CUBIEBOARD
+    bool
+    select ALLWINNER_A10
+
 config DIGIC
     bool
     select PTIMER
@@ -257,6 +261,11 @@ config EXYNOS4
 
 config ALLWINNER_A10
     bool
+    select AHCI
+    select ALLWINNER_A10_PIT
+    select ALLWINNER_A10_PIC
+    select ALLWINNER_EMAC
+    select SERIAL
 
 config RASPI
     bool
diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index ab47b6a..c457f60 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -45,7 +45,7 @@ config MICRODRIVE
 config AHCI
     bool
     default y if PCI_DEVICES
-    depends on PCI
+    select PCI                # TODO: Split up ahci.c into sysbus and pci parts
     select IDE_QDEV
 
 config IDE_SII3112
-- 
1.8.3.1

