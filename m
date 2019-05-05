Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1443765wrh;
        Sun, 5 May 2019 07:14:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxVD+lTTaDakVm7F+olYF1p88LOT/FEIq7gZR+FxIKxevaMG+AGCUDipqbcjy/uNnD6YGnW
X-Received: by 2002:a05:600c:2506:: with SMTP id d6mr13861041wma.106.1557065660903;
        Sun, 05 May 2019 07:14:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557065660; cv=none;
        d=google.com; s=arc-20160816;
        b=HIiEU5VAkQl0dciqbJ4ZF/Y+f5S6OzaJ0CyDUHc0sYsg1V6GoqS8seEOkdj2gisFNZ
         y7TwTkyBkh9I55iGLdG1YM6UIBw03yqKcemAmk5o9G0heelMfxecSuPG4DlRswESky+e
         wLpJ/lBhKVpUTbjnAphy7BIaX7zCVStIQh8BL+/gBH/AWk+Bd12qwc01DWxRRjzpXLSu
         +cKWRVji0q9xO0na/hV+3eiT95wJaIIg1VpuSP7J5eAuzcZP/Vvif5yGLpRtiBkn4D8o
         9GHhN/da6/vuaNtxsd8oRORtHyZOtg7tdJuoeTApFGeCmh2L9zUaW4Ckj6nRmmmKF84h
         To9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2daEInaei6jg0zvuQ1QtYHOXLRCLrDocJF2C2WDG1VI=;
        b=blryEwOauBLjoJqp1HIeou6C0gowJn5+40Cbp2hbmNUqO81ioJURMEc5RGwLJ3Siym
         vAvaLn/RgLySlKYcP2PeNk7uvtN3aYSWdtgPOxPyU8b9WLx4R1a1MvivvXr2Y2I8NHQY
         cVFJUHsqFB7qZsbgUJMc5k2IhdaJhUCAmNVo/jU+EG6wCoE1+0DKnI34IK4nt4iEL/OU
         QccSBzS0OSzMEAeC7YXTkXH2Z+h6IUPKmHbveUZFASeFzArCgAA+j9a4//ak1TBKwS4K
         F234tGpe3FNk9Qe5qT3ZTLABM16QB4mFFeQVtqTpTCDx0I2OQ5tHAEkJQVctBu5j3CFW
         hWiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d23si6526825wrc.175.2019.05.05.07.14.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:14:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41618 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHuF-0001kU-V7
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:14:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeM-0004WK-Bw
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:57:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHeK-0004w0-8U
	for qemu-devel@nongnu.org; Sun, 05 May 2019 09:57:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44686)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHeE-0004rR-Ln; Sun, 05 May 2019 09:57:48 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D753DC057E37;
	Sun,  5 May 2019 13:57:44 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA70A60C18;
	Sun,  5 May 2019 13:57:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:57:04 +0200
Message-Id: <20190505135714.11277-19-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sun, 05 May 2019 13:57:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 18/28] hw/arm: Express dependencies of the MPS2
 boards with Kconfig
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RhJZVn9sE6ul

Add Kconfig dependencies for the mps2-an* machines.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 20 +-------------------
 hw/arm/Kconfig                  | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index a0b9016e3a..31d31d3f4a 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -30,6 +30,7 @@ CONFIG_Z2=3Dy
 CONFIG_COLLIE=3Dy
 CONFIG_ASPEED_SOC=3Dy
 CONFIG_NETDUINO2=3Dy
+CONFIG_MPS2=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
@@ -38,28 +39,9 @@ CONFIG_IMX_FEC=3Dy
 CONFIG_FRAMEBUFFER=3Dy
=20
 CONFIG_DIGIC=3Dy
-CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
 CONFIG_NRF51_SOC=3Dy
=20
-CONFIG_CMSDK_APB_TIMER=3Dy
-CONFIG_CMSDK_APB_DUALTIMER=3Dy
-CONFIG_CMSDK_APB_UART=3Dy
-CONFIG_CMSDK_APB_WATCHDOG=3Dy
-
-CONFIG_MPS2_FPGAIO=3Dy
-CONFIG_MPS2_SCC=3Dy
-
-CONFIG_TZ_MPC=3Dy
-CONFIG_TZ_MSC=3Dy
-CONFIG_TZ_PPC=3Dy
-CONFIG_ARMSSE=3Dy
-CONFIG_IOTKIT_SECCTL=3Dy
-CONFIG_IOTKIT_SYSCTL=3Dy
-CONFIG_IOTKIT_SYSINFO=3Dy
-CONFIG_ARMSSE_CPUID=3Dy
-CONFIG_ARMSSE_MHU=3Dy
-
 CONFIG_FSL_IMX6=3Dy
 CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0e89383f50..55f7e5bfce 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -302,6 +302,12 @@ config ASPEED_SOC
=20
 config MPS2
     bool
+    select ARMSSE
+    select LAN9118
+    select MPS2_FPGAIO
+    select MPS2_SCC
+    select PL022    # Serial port
+    select PL080    # DMA controller
=20
 config FSL_IMX7
     bool
@@ -341,6 +347,19 @@ config ARM11MPCORE
=20
 config ARMSSE
     bool
+    select ARM_V7M
+    select ARMSSE_CPUID
+    select ARMSSE_MHU
+    select CMSDK_APB_TIMER
+    select CMSDK_APB_DUALTIMER
+    select CMSDK_APB_UART
+    select CMSDK_APB_WATCHDOG
+    select IOTKIT_SECCTL
+    select IOTKIT_SYSCTL
+    select IOTKIT_SYSINFO
+    select TZ_MPC
+    select TZ_MSC
+    select TZ_PPC
=20
 config ARMSSE_CPUID
     bool
--=20
2.21.0

