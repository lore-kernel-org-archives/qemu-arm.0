Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7211973wrx;
        Thu, 7 Mar 2019 06:33:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqzsTzI6g/7khBSJyGJgmaleNixfjcqvgbe00pVjdRDbUQSA9twazU7ROfMiid7TLXMBhBoy
X-Received: by 2002:a81:2e86:: with SMTP id u128mr10049779ywu.241.1551969219663;
        Thu, 07 Mar 2019 06:33:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969219; cv=none;
        d=google.com; s=arc-20160816;
        b=leOwUT0r6x7+Cm7nRps52go6mWD7DlKNm56BqnE5sL0Xwa7GaC8FaNsB5rIlpdBW+2
         m0l1KBi+6JCD2+W7oISZ7NsTIh0f/PdQQuOlJ3Pp2sfJhZkDTpqDhLj6Lk8Xf7JCl9Cd
         PI2EvUJh3ocT2U88ManX420M9KEXuQfi8KeAbmWWx1ghVXKlQGuxOwxNAS0Gz62Wa4Jc
         lVseGXWbkRb54LUXC52ZxQZ44yJ9XMn7qXSyExSuA0ncFZFMEf+O1fDTOn8W1vEISWFZ
         5602qgLDpoQqJlz/+oGa2SuZHLyG6ctnCwMV5geHoc2Q0ISUSom8HmQlaFxg8hIGTBJt
         KI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=Ukkc51vErgfbznqb+7aDEcJZGHEYI2EGXOTVyATgVaQ=;
        b=FD1cl3Zq6/Swx8IRv9OZP6e4OQAHqlSuTpBqsSovpdXRkpdV065uKurvuuSBaeBKE2
         4q0qHSNEKumIvNXP+uuiHmA2NgO/YLECxOhKa1WqYluK81xeUZcdVMA3jVkyqRc2KmK0
         kmzr3DSTJxwupUiud9tEwJGjUP+ZVVBTFHVfTxQzMKF8iBQQzQ8Q+hqvYhR0ZBnkbe2H
         GGMg8puziIDIyFwRUi+tLAobxePIIcS9f5nI5bzlgDB2cmoDG+g6rxnzY3BrIbexj8tV
         YmCVNmHE2IgrqT7AgUIgofYcxWmERmp0tHFUJ1ethxN1zVFVcCNMTLskueFuPsUUSX9H
         m5Og==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q125si2808685ywc.262.2019.03.07.06.33.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:33:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52788 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1u5b-00008j-5a
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:33:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tuX-0006xd-Ui
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tuW-00024A-Vw
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:22:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50462)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tuW-00022b-PQ; Thu, 07 Mar 2019 09:22:12 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D665C318A601;
	Thu,  7 Mar 2019 14:22:11 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7786F5C1B5;
	Thu,  7 Mar 2019 14:22:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:48 +0100
Message-Id: <1551968334-18982-24-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 07 Mar 2019 14:22:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 23/29] hw/arm: Express dependencies of the
 MSF2 / EMCRAFT_SF2 machine with Kconfig
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
X-TUID: Q0XSsOxEwQHy

Add Kconfig dependencies for the emcraft-sf2 machine - we also
distinguish between the machine (CONFIG_EMCRAFT_SF2) and the SoC
(CONFIG_MSF2) now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  3 +--
 hw/arm/Kconfig                  | 10 +++++++++-
 hw/arm/Makefile.objs            |  3 ++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 9150858..a01e407 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -31,9 +31,9 @@ CONFIG_MPS2=y
 CONFIG_RASPI=y
 CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
+CONFIG_EMCRAFT_SF2=y
 
 CONFIG_VGA=y
-CONFIG_SSI_M25P80=y
 CONFIG_IMX_FEC=y
 
 CONFIG_NRF51_SOC=y
@@ -46,5 +46,4 @@ CONFIG_PCIE_PORT=y
 CONFIG_XIO3130=y
 CONFIG_IOH3420=y
 CONFIG_I82801B11=y
-CONFIG_MSF2=y
 CONFIG_PCI_EXPRESS_DESIGNWARE=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index cff2925..7df0bb6 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -325,7 +325,6 @@ config MPS2
     select MPS2_SCC
     select PL022    # Serial port
     select PL080    # DMA controller
-    select TZ_MPC
 
 config FSL_IMX7
     bool
@@ -339,9 +338,17 @@ config FSL_IMX6UL
 config NRF51_SOC
     bool
 
+config EMCRAFT_SF2
+    bool
+    select MSF2
+    select SSI_M25P80
+
 config MSF2
     bool
+    select ARM_V7M
     select PTIMER
+    select SERIAL
+    select SSI
 
 config ZAURUS
     bool
@@ -374,6 +381,7 @@ config ARMSSE
     select IOTKIT_SECCTL
     select IOTKIT_SYSCTL
     select IOTKIT_SYSINFO
+    select TZ_MPC
     select TZ_MSC
     select TZ_PPC
 
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index fadd698..eae9f6c 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -4,6 +4,7 @@ obj-$(CONFIG_ARM_VIRT) += virt.o
 obj-$(CONFIG_ACPI) += virt-acpi-build.o
 obj-$(CONFIG_DIGIC) += digic_boards.o
 obj-$(CONFIG_EXYNOS4) += exynos4_boards.o
+obj-$(CONFIG_EMCRAFT_SF2) += msf2-som.o
 obj-$(CONFIG_HIGHBANK) += highbank.o
 obj-$(CONFIG_INTEGRATOR) += integratorcp.o
 obj-$(CONFIG_MAINSTONE) += mainstone.o
@@ -41,7 +42,7 @@ obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
 obj-$(CONFIG_MPS2) += mps2-tz.o
-obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
+obj-$(CONFIG_MSF2) += msf2-soc.o
 obj-$(CONFIG_MUSCA) += musca.o
 obj-$(CONFIG_ARMSSE) += armsse.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
-- 
1.8.3.1

