Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1668845wrp;
        Wed, 13 Feb 2019 01:04:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib5u/Zina1srxQSQABlZJF4jFJl2xo8/v9Gu06k8mJIlc8L+f0EHts3ivBIGVRyg6cAKROE
X-Received: by 2002:a25:5045:: with SMTP id e66mr6776194ybb.500.1550048672324;
        Wed, 13 Feb 2019 01:04:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048672; cv=none;
        d=google.com; s=arc-20160816;
        b=kW4MijlXT16n7DTfI8BUNP///Rw/YNZxlXpvR7n9mbK3jPzIE9lyCNpTW6n2N2VXlV
         sBHWdZqCFYeWaZjFIIto7scoAVT6OmWnL3f5nFrbNLASCD4KD2qb/pZn55MhW17cMSwE
         fcH8JVC4SS71FqSnB2QeKyF7hWA1y1thsIMoahRRAP5oIU1TS9T9/2BqluYDeYCsBPM+
         n9j8bBUM2R4Q4tM1XvP+9HaMk6IF2ODreIlFxii+RzvZNPW1VZJRT3Ry/qxjauzlTc2t
         ZBIGZ4Bh9JmckUudjIIWFY5mw2hM6OuO0O2YZmJmUVizFfXSsVkdB1767NMGvI3soeoo
         mm9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=9TSLO6slJVWOE3ZJPDOBGsEiRM9IVHfKQJlhrFhRJnI=;
        b=Yla+ojXbGJ+ptQa3EzUUpt9hk8TNCaO4agrZNeoHKm4X0hSmGfU2cb0UrDalQU/HpN
         zKhJt0tZEfln74Vi/q8iUy/LYKwmZ2BDRbgZVeX5rCN6CX4blopCH1SQLCZG5AzlQBO6
         t7FYl50yZf9+PoWbIBTpM1Cac3RuXKEQSHrJn7thk6fQPiSCV6ApRRSdUuFfXq9jThCF
         jOd00MQw8O6HbbttILfrFo7BBbzgN4JDLk4mVtymcujAXAnZKCwISmI3eUSpLrGPatWU
         La80HMWSuA2uBnJI3Jsfdtt2uVNn6waQxnHXXm1AdshpO/E0fjpyJnrBa3RrlGuGa++w
         jNCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205si9200214ywp.427.2019.02.13.01.04.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 01:04:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53351 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqT1-0004sx-Mp
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 04:04:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG3-00024X-SQ
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:51:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4d-0005iQ-AY
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:39:21 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47926)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4S-0005cl-7W; Wed, 13 Feb 2019 03:39:08 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BCBE89AD9;
	Wed, 13 Feb 2019 08:39:07 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 170D3101E841;
	Wed, 13 Feb 2019 08:39:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:03 +0100
Message-Id: <1550047098-1210-11-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 13 Feb 2019 08:39:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 10/25] hw/arm: Express dependencies of
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B+TQpFoG4uKL

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
index 1db76f6..5c43bb3 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -15,6 +15,7 @@ CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
 CONFIG_VERSATILE=3Dy
 CONFIG_VEXPRESS=3Dy
+CONFIG_ZYNQ=3Dy
 CONFIG_MAINSTONE=3Dy
 CONFIG_GUMSTIX=3Dy
 CONFIG_SPITZ=3Dy
@@ -34,16 +35,11 @@ CONFIG_VIRTIO_MMIO=3Dy
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
@@ -98,7 +94,6 @@ CONFIG_SMBUS_EEPROM=3Dy
 CONFIG_GPIO_KEY=3Dy
 CONFIG_MSF2=3Dy
 CONFIG_FW_CFG_DMA=3Dy
-CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 95f2713..67f1228 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -208,6 +208,20 @@ config VEXPRESS
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

