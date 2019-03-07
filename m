Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7200142wrx;
        Thu, 7 Mar 2019 06:22:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqyCEhMI0BhJBMT8TjCiMYTvWs0amQay9CF+xf/x97hYCTb2b/7tlrkECVTx25UJ7SLX3rhw
X-Received: by 2002:a81:3dc8:: with SMTP id k191mr10122248ywa.139.1551968562121;
        Thu, 07 Mar 2019 06:22:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968562; cv=none;
        d=google.com; s=arc-20160816;
        b=VNEJC9AXN1MqtKaciVlUMTTpH9sX3hP2jsXW3w9ZAfFBbYmdLB3Uvnv3mwoAOWyvzU
         IrsRh7BHHrYrOU9CNp2jWU8rSUHv3dlb+0ZAmpk6/pXKXz3elj3pypJLfpILBO+zIjH/
         zPRuWSJ15LXGRGd4pnSxjTmMnPm1IR+pJpfxJrBwT9wwxJH3d4+DbBtfmtasQU8/pZ3o
         5SrJKpZJ1YlLCTDNQSLgZPIqCTlPFtrv8LUlYG8nAwLSUxP41oClfMEAn8+J9pO/pbll
         fhBAsXqKeXw0f5vVxV97EqSanpKt5tBAUH8nQC6AQVHPH8HqYwcPf1ww4a4o5wgqJ+Rg
         S6kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=t/OFWMyN32zvoyWq3PqROlG2kW5YSwAMrBPGQhdnc4I=;
        b=WMP1vstsYA16iMykVZFz0B+HbG1VWHjkOkEwV2K22AH2sfBkSAyur2VAYr9PkE9LQQ
         5fyrKSCNAzCZUFzTvnJmiD+IEw5IiZaONDNnSeLtweLJejwK748Cx7rQnGc7JDGkQ7dO
         BAJmbdS8/582wLc3LgQGDbKDsSXOYzHfVYhhN30H7agvocHTuDKVNTxtoXcpHHZpgKO6
         0ueGoRHkZq+bwvQTsH4/JqDu5y0b1Nu5/Gm86iLqoFiPJ95/1J79tzoNhyAifiw46fT/
         bkproXPkWIRgj3T72ngs/Y9quKL7lV5R/44GZ2dzbmAtm4tViaACcx22K6ed4FRbwq5Y
         m22w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20si2765990ywa.11.2019.03.07.06.22.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:22:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52590 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1tux-000782-Cs
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:22:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1ts6-0004cz-2m
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:19:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1ts5-0008Hg-Al
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:19:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60195)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1ts5-0008HD-34; Thu, 07 Mar 2019 09:19:41 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 563BE18DF7B;
	Thu,  7 Mar 2019 14:19:40 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7935D5C1B5;
	Thu,  7 Mar 2019 14:19:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:30 +0100
Message-Id: <1551968334-18982-6-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 07 Mar 2019 14:19:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 05/29] hw/arm: Express dependencies of the
 highbank machines with Kconfig
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
X-TUID: kRSZseAlWqdp

Add Kconfig dependencies for the highbank machine (and the midway
machine).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  9 +--------
 hw/arm/Kconfig                  | 12 ++++++++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 3475d50..13cfffa 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -6,6 +6,7 @@ CONFIG_ARM_V7M=3Dy
 CONFIG_PCI_DEVICES=3Dy
=20
 CONFIG_EXYNOS4=3Dy
+CONFIG_HIGHBANK=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -43,24 +44,17 @@ CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
=20
 CONFIG_ARM11MPCORE=3Dy
-CONFIG_A15MPCORE=3Dy
=20
 CONFIG_NETDUINO2=3Dy
=20
-CONFIG_ARM_TIMER=3Dy
-CONFIG_PL011=3Dy
-CONFIG_PL022=3Dy
-CONFIG_PL031=3Dy
 CONFIG_PL041=3Dy
 CONFIG_PL050=3Dy
-CONFIG_PL061=3Dy
 CONFIG_PL080=3Dy
 CONFIG_PL110=3Dy
 CONFIG_PL181=3Dy
 CONFIG_PL190=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
-CONFIG_XGMAC=3Dy
 CONFIG_PXA2XX=3Dy
 CONFIG_BITBANG_I2C=3Dy
 CONFIG_FRAMEBUFFER=3Dy
@@ -148,7 +142,6 @@ CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
-CONFIG_HIGHBANK=3Dy
 CONFIG_MUSICPAL=3Dy
=20
 # for realview and versatilepb
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 74436cc..2747e2b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -19,6 +19,18 @@ config EXYNOS4
=20
 config HIGHBANK
     bool
+    select A9MPCORE
+    select A15MPCORE
+    select AHCI
+    select ARM_TIMER # sp804
+    select ARM_V7M
+    select PCI
+    select PL011 # UART
+    select PL022 # Serial port
+    select PL031 # RTC
+    select PL061 # GPIO
+    select PL310 # cache controller
+    select XGMAC # ethernet
=20
 config INTEGRATOR
     bool
--=20
1.8.3.1

