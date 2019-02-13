Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1679377wrp;
        Wed, 13 Feb 2019 01:16:54 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbXHQPL3mXTAt/u7YT8Rndbhqgt9QpHN6T3fsblfNK3k2NC3A2SIucucNwJ6OYPzq2IUNZi
X-Received: by 2002:a25:ba8d:: with SMTP id s13mr6531734ybg.332.1550049414126;
        Wed, 13 Feb 2019 01:16:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550049414; cv=none;
        d=google.com; s=arc-20160816;
        b=BzjufOxNf9P+9EN+Ta7ADztjn/QGxnStlHd9BzJrzvqFwYyrWJoK7vPVvA4p26D4K5
         QbmHTxHuBLH+z7kPlBjmnx+T2Y1fDsXYMxdamuz5UnFv6gQh2jV8tF1FP1MVpDZRTCSx
         B636EtkIkq3G49XfWGHFW+KR4Kxh24QSwVKUOjLUiXRsm0EmS+A3QDRNIyZPJVfWc6jj
         wgIEWmm0zWj+7kks0b5DurIkkO7g5rWIgUnk/yNlZXwxSrGYdMJQgk58IfIzUd3sIbg+
         OENVUcURXy7FPgIyRvh2td7jaju2OoarmVEpX3vXflwcE7WB8uKogks/Zc/rPP84ZVI6
         Hy4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=WqVEDhJJt98CKUtfwitTLihKuG78VO651XzAEMJFlUc=;
        b=FfQ+KyFMBlDKJivMK+MYsQWFDC9mWI58OeVmKu9wXO28DVCud97L2MZXOjkaY5qY0y
         A/GeZfHgltnizTT0Lq8gYYN/pekNahqHKL5eFihshbUR8b2XljD4kI7UYuSZ/20Fd7Ra
         fj/4fMnLtPEHxOn084hoad71YbhDfPM7KAVL68jGLm2By7TxfDqeumj1Caki6ZOkvLBs
         8Cq1zZYIfXCnyZxsktJT5tDHrAv/mYyyRtzDTPj2yoPx5WVRPD+xbnSX2aYwIHsUVl0Y
         O8NWY9N3Ny3UMcebceCkn0zBDfmvgQzmbTjqSZFJDNOUrOmEwxLYa9uX2ZqBgQ/DUm2t
         Cqcw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c2si9065983ybc.482.2019.02.13.01.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 01:16:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53559 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqez-0006Gi-8Y
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 04:16:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG5-00024X-Rx
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:51:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4G-0005Su-T0
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:38:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq44-00057E-Ey; Wed, 13 Feb 2019 03:38:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BAC73DE11;
	Wed, 13 Feb 2019 08:38:40 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E249D10021B6;
	Wed, 13 Feb 2019 08:38:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:37:57 +0100
Message-Id: <1550047098-1210-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 13 Feb 2019 08:38:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 04/25] hw/arm: Express dependencies of the
 fsl-imx31 machine with Kconfig
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
X-TUID: KaHsM8GnE5W/

Add Kconfig dependencies for the fsl-imx31 / kzm machine.
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 5 +++++
 hw/misc/Kconfig                 | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 2033050..19d0ab0 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -8,6 +8,7 @@ CONFIG_PCI_DEVICES=3Dy
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
+CONFIG_FSL_IMX31=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -68,7 +69,6 @@ CONFIG_TSC210X=3Dy
 CONFIG_BLIZZARD=3Dy
 CONFIG_ONENAND=3Dy
 CONFIG_TUSB6010=3Dy
-CONFIG_IMX=3Dy
 CONFIG_MAINSTONE=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_NSERIES=3Dy
@@ -118,7 +118,6 @@ CONFIG_ALLWINNER_A10_PIC=3Dy
 CONFIG_ALLWINNER_A10=3Dy
=20
 CONFIG_FSL_IMX6=3Dy
-CONFIG_FSL_IMX31=3Dy
 CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c022b8d..3d0ee29 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -103,6 +103,11 @@ config FSL_IMX25
=20
 config FSL_IMX31
     bool
+    select SERIAL
+    select IMX
+    select IMX_I2C
+    select LAN9118
+    select PCI
=20
 config FSL_IMX6
     bool
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 11d4b30..54ff9a8 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -76,6 +76,8 @@ config ECCMEMCTL
 config IMX
     bool
     select PTIMER
+    select SSI
+    select USB_EHCI_SYSBUS
=20
 config STM32F2XX_SYSCFG
     bool
--=20
1.8.3.1

