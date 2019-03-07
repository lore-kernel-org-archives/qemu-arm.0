Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7218188wrx;
        Thu, 7 Mar 2019 06:39:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqwNSAbesGm/zDqMV00lup398E5ckR58IP3T4qqo7hz96qPvsnz9jBL/LWqpnt3I7K2lwOYv
X-Received: by 2002:a81:5252:: with SMTP id g79mr9927667ywb.420.1551969575878;
        Thu, 07 Mar 2019 06:39:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551969575; cv=none;
        d=google.com; s=arc-20160816;
        b=M7W/0pB3uaSpxIhLhv6wrsdh64Q8pOjCqcZ0cNlLOjVkc3C7Xm+0GoL45NaNyU4V7G
         vIyOcOinw9K7Y/2pX418MzBIwywMnZj1fU3InvliR2gUG92Af+0bILq80Vv7EbcgvNsl
         tloFrNoCK5Ol8EyzbuSQVeWoRt/UKFp1itj11aO5iFBZHB675sH64IbHGlx8h8uLsCpi
         ko/h24LhKjO2heKou8ZWZ+fQyqx4f46eq3p6Dt61NxVgigZ3q1Y73V+vekuSzH0JFRHT
         ZW8weKTsl41IBjXlfrQLJcHq+F4TOqCPfRDA9xpuETwWbdrAb6FXiy1gC7g4NcU2Vii8
         IeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=4dgQ0fgvcxHCOo88rhP/FS2VJ6mlthjbcT7WknD/3FM=;
        b=mYri9htBgaQkYQq42UvSS4LHFDWghF8IUbDBLPsvXyHyklugFjplGlKHK/8s4Dm6st
         GwfxBfzHWXL11BQh1SqFOWu3Pd17XeT7SiFnBME5xw1RNDqriiFqdpoZh/131qgYVanL
         Gn/xonZJHQ6wjeE2wvWRr0wqcsYtoLmpp23P8EZjeKKjgMfJZhrBpM54T/5WrQFGnOp9
         hBobeccdgxisXld0Blzax9UlZ86BEe4Hzrq1cjAlUN3ggbmz7sJpXUvn0FgNIOUBxspW
         rfz1gX3N2Jlszp0cyjld8m3lM5PQNzE23g9zCVVhSPBzf5kPohG69gEJqp7M5dqWDjRw
         kXYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y140si393302yby.11.2019.03.07.06.39.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:39:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1uBL-0004G2-A0
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:39:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44735)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tut-0007IS-Ju
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:22:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tur-0002XA-Jq
	for qemu-devel@nongnu.org; Thu, 07 Mar 2019 09:22:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tun-0002Rr-3V; Thu, 07 Mar 2019 09:22:29 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BB443089ED8;
	Thu,  7 Mar 2019 14:22:28 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE1445C1B5;
	Thu,  7 Mar 2019 14:22:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:50 +0100
Message-Id: <1551968334-18982-26-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 07 Mar 2019 14:22:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 25/29] hw/arm: Express dependencies of the
 microbit / nrf51 machine with Kconfig
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
X-TUID: YuRSrLqaXKfw

Add Kconfig dependencies for the NRF51 / microbit machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 6 ++++++
 hw/arm/Makefile.objs            | 3 ++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 88e4e8e..ee95cc0 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -32,11 +32,10 @@ CONFIG_RASPI=y
 CONFIG_DIGIC=y
 CONFIG_SABRELITE=y
 CONFIG_EMCRAFT_SF2=y
+CONFIG_MICROBIT=y
 
 CONFIG_VGA=y
 
-CONFIG_NRF51_SOC=y
-
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 6a8b801..da4d5c1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -353,8 +353,14 @@ config FSL_IMX6UL
     select IMX_I2C
     select SDHCI
 
+config MICROBIT
+    bool
+    select NRF51_SOC
+
 config NRF51_SOC
     bool
+    select I2C
+    select ARM_V7M
 
 config EMCRAFT_SF2
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index eae9f6c..994e67d 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -8,6 +8,7 @@ obj-$(CONFIG_EMCRAFT_SF2) += msf2-som.o
 obj-$(CONFIG_HIGHBANK) += highbank.o
 obj-$(CONFIG_INTEGRATOR) += integratorcp.o
 obj-$(CONFIG_MAINSTONE) += mainstone.o
+obj-$(CONFIG_MICROBIT) += microbit.o
 obj-$(CONFIG_MUSICPAL) += musicpal.o
 obj-$(CONFIG_NETDUINO2) += netduino2.o
 obj-$(CONFIG_NSERIES) += nseries.o
@@ -48,4 +49,4 @@ obj-$(CONFIG_ARMSSE) += armsse.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
 obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
 obj-$(CONFIG_FSL_IMX6UL) += fsl-imx6ul.o mcimx6ul-evk.o
-obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o microbit.o
+obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
-- 
1.8.3.1

