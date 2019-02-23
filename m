Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7781665wrx;
        Fri, 22 Feb 2019 23:50:38 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYpmT7uJxuxZ3cbmQ51d+ig8YBZ44sWCj5pbVHCrsrJfo9KO9WbytT661JzfhmgNjV5Hl+R
X-Received: by 2002:a5b:447:: with SMTP id s7mr6241260ybp.168.1550908237955;
        Fri, 22 Feb 2019 23:50:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908237; cv=none;
        d=google.com; s=arc-20160816;
        b=oxFu4vsQdEk28jJzbDJ7sl5GWa4lGfJiVBAuGvsKDJbcmp3EaUWM/7QEKA/+u3bBEq
         w3/PmDirq4fzXbGHoPMP4lUrfnxymcwkYSFeuy3uti1DCeyzY9aLOO9PZSM+ncL98/9F
         t3a6DPG3XGNshhzW8IpfCfBA0+tGyEtSJNDTXU2nC2dTmL5MF7kxAlkN9pWM+l79vp3a
         7ixzBsPLXRemErTAQrHmO2qDY5OwR177pxuM4ZdfoBpHVhv4elLWiyLTdfN84Cfd97fo
         LmyoCK629AMnaGU5hytFW8Dw+qmPkzOC56v4q8TkVd4J/+dsN6iOLNC/ZNvxaVBHO1hn
         eyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ZbzXTtkKQQZQv4Oesbi2xx48lLYpwSQaa+B9lwoudTg=;
        b=iosPkFiwsBBgtN3dKF+jP+BrRTSYLnVxPJptAPrykb/9njqJNRSjBVnaXrPcaeaK8Q
         MU91XNIoBLj0RWJv4G0CFBt3774tYv9p6B56hxlrOBFjEDt/EpuiBJsi4CMvOGWaa0xu
         Z3/cjnsUZVregwvkSAiUD0Tk3fzDIv06bxXkOUp3YVdxFlDQkZmOj2HZmgzobsBmBZXV
         ches5i+EQlRA0BUm/G/eIbUMAo/nNEBhEUg+ZyZNUtqtQwpgN7Jmwm+v1XFqzgYWdECF
         EmUppZZ0/qW/idaBLOZqnlKDk5F9TsKKhtqGwXuqUEviapAl04MJb47f9TWXWegAaqXB
         LJSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o132si2162418ywo.220.2019.02.22.23.50.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:50:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxS4z-0004x8-DT
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:50:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4A-0004VO-PT
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS49-0001tr-Qc
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51608)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS49-0001tI-L6; Sat, 23 Feb 2019 02:49:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C41053082208;
	Sat, 23 Feb 2019 07:49:44 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65E9E5D9CA;
	Sat, 23 Feb 2019 07:49:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:01 +0100
Message-Id: <1550908162-22644-10-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Sat, 23 Feb 2019 07:49:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 09/30] hw/arm: Express dependencies of
 musicpal with Kconfig
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cpbxTIljLtJb

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 6 +-----
 hw/arm/Kconfig                  | 6 ++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 388a2ba..c8eafb1 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -9,13 +9,13 @@ CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
 CONFIG_FSL_IMX31=3Dy
+CONFIG_MUSICPAL=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
 CONFIG_ECC=3Dy
 CONFIG_SERIAL=3Dy
 CONFIG_MAX7310=3Dy
-CONFIG_WM8750=3Dy
 CONFIG_TWL92230=3Dy
 CONFIG_TSC2005=3Dy
 CONFIG_LM832X=3Dy
@@ -38,7 +38,6 @@ CONFIG_IMX_FEC=3Dy
 CONFIG_FTGMAC100=3Dy
 CONFIG_DS1338=3Dy
 CONFIG_PFLASH_CFI01=3Dy
-CONFIG_PFLASH_CFI02=3Dy
 CONFIG_MICRODRIVE=3Dy
 CONFIG_USB_MUSB=3Dy
 CONFIG_PLATFORM_BUS=3Dy
@@ -54,14 +53,12 @@ CONFIG_PL190=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
 CONFIG_PXA2XX=3Dy
-CONFIG_BITBANG_I2C=3Dy
 CONFIG_FRAMEBUFFER=3Dy
 CONFIG_XILINX_SPIPS=3Dy
 CONFIG_ZYNQ_DEVCFG=3Dy
=20
 CONFIG_ARM11SCU=3Dy
 CONFIG_DIGIC=3Dy
-CONFIG_MARVELL_88W8618=3Dy
 CONFIG_OMAP=3Dy
 CONFIG_TSC210X=3Dy
 CONFIG_BLIZZARD=3Dy
@@ -137,7 +134,6 @@ CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
-CONFIG_MUSICPAL=3Dy
=20
 # for realview and versatilepb
 CONFIG_LSI_SCSI_PCI=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index df10a4d..ece2962 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -51,7 +51,13 @@ config MUSCA
=20
 config MUSICPAL
     bool
+    select BITBANG_I2C
+    select MARVELL_88W8618
     select PTIMER
+    select PFLASH_CFI02
+    select PCI
+    select SERIAL
+    select WM8750
=20
 config NETDUINO2
     bool
--=20
1.8.3.1

