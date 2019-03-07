Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7205267wrx;
        Thu, 7 Mar 2019 06:27:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqyMUENwCVJiRoxMHKa/UpfBtGodoU70MtX2JPiQKsZ51e9iC8jSSMeJMFS42v+i/5Ul1/3j
X-Received: by 2002:a25:18c3:: with SMTP id 186mr11859759yby.255.1551968854048;
        Thu, 07 Mar 2019 06:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968854; cv=none;
        d=google.com; s=arc-20160816;
        b=ci8ENA/XDO97yX3AakVOrfwfv6Qp0qr4ZKUWPbqijWdN38BenFGYPdcTeaTIXGu67S
         12OnJlBFwkhgiHgrFtTxJJZRVQsVOts87/+t1EWBI0yVHGSAGLH209bCeMIblkB4JVyI
         JDENYed9p1rTCzirSkUq9PN1uScfl7/NPWwTjqFvVLkd5BwWC69aeKLsYebNCLU90lIH
         BNo7XLYjzlqUQSpCPJyvKB0s3gtiz0az8esw4QN/VjU8W1RSO4th1u/B/5qqnlcj3NtJ
         LZpKwHPsiBP4/06HeVdKCu9Ud20z7q4nFyiJ0UJVRI5DbSGIWnCbqyVLzIgmX6YqSBl7
         4aoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=lNUcN+H684jrS9rWuGsEqr3pO4iXXreiF7oCqGDldbs=;
        b=uUjnBXaVtaDCAZGN/JDYNiaQakAGn5sWiCz1xqgs7fAA68rqnElZx9knpbX3cTEBJX
         luBhp2WcDBGTzr09VIC9Px+XnwmR2CRrNSxq7r5gTlYeCxiRU4SJLsLCbeBCi4/pxQlG
         twMUq7ecNOWcpvJQ31cfdwgqluCgb/De0ZE24yJ6NU7tJF0S8yYQ5LPizuW7P2QtIIJ8
         lbqH9e+uifg9jgLBarE1BsDOr+39INtC27cSuGvr0hmtBM86ChMT7ny+Y8HSJ1yxa8DX
         7afADYjG9HSMMKxCoA3KpsLT0C9+XTXLmE99zvhTqPRbrgx/e7itsOm9iDArUqtkbI2A
         5URg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l137si2701547ywc.61.2019.03.07.06.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:27:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52686 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1tzh-0002lm-Fh
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:27:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1ttK-0005pH-Og
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:21:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1ttK-0000go-0V
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:20:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53106)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1ttI-0000fR-BZ; Thu, 07 Mar 2019 09:20:56 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 635B9753DA;
	Thu,  7 Mar 2019 14:20:55 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBB595C641;
	Thu,  7 Mar 2019 14:20:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:38 +0100
Message-Id: <1551968334-18982-14-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 07 Mar 2019 14:20:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 13/29] hw/arm: Express dependencies of
 xilinx-zynq with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 78ehXNPr1Q58

Add Kconfig dependencies for the xilinx-zynq-a9 board.
This patch is based on earlier work by =C3=81kos Kov=C3=A1cs (i.e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index f3ac12c..54b1c61 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -16,6 +16,7 @@ CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
 CONFIG_VERSATILE=3Dy
 CONFIG_VEXPRESS=3Dy
+CONFIG_ZYNQ=3Dy
 CONFIG_MAINSTONE=3Dy
 CONFIG_GUMSTIX=3Dy
 CONFIG_SPITZ=3Dy
@@ -35,16 +36,11 @@ CONFIG_VIRTIO_MMIO=3Dy
=20
 CONFIG_NETDUINO2=3Dy
=20
-CONFIG_PL330=3Dy
-CONFIG_CADENCE=3Dy
 CONFIG_FRAMEBUFFER=3Dy
-CONFIG_XILINX_SPIPS=3Dy
-CONFIG_ZYNQ_DEVCFG=3Dy
=20
 CONFIG_DIGIC=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
-CONFIG_ZYNQ=3Dy
 CONFIG_STM32F2XX_TIMER=3Dy
 CONFIG_STM32F2XX_USART=3Dy
 CONFIG_STM32F2XX_SYSCFG=3Dy
@@ -97,7 +93,6 @@ CONFIG_SMBUS_EEPROM=3Dy
 CONFIG_GPIO_KEY=3Dy
 CONFIG_MSF2=3Dy
 CONFIG_FW_CFG_DMA=3Dy
-CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 1a3ad0f..ef9cc97 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -206,6 +206,20 @@ config VEXPRESS
=20
 config ZYNQ
     bool
+    select A9MPCORE
+    select CADENCE # UART
+    select PCI
+    select PFLASH_CFI02
+    select PL330
+    select SDHCI
+    select SSI_M25P80
+    select USB_EHCI
+    select USB_EHCI_SYSBUS
+    select XILINX # UART
+    select XILINX_AXI
+    select XILINX_SPI
+    select XILINX_SPIPS
+    select ZYNQ_DEVCFG
=20
 config ARM_V7M
     bool
--=20
1.8.3.1

