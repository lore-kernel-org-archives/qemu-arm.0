Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp292043wrq;
        Fri, 8 Feb 2019 22:40:18 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZznPg51lBVyEODGwSVE4M7Je5NAyAqUCGGL/A/t3VOJFf2zRy95eA3idIHJCRuWz48ksXK
X-Received: by 2002:adf:ea81:: with SMTP id s1mr18957381wrm.309.1549694418926;
        Fri, 08 Feb 2019 22:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549694418; cv=none;
        d=google.com; s=arc-20160816;
        b=GMwLx48TaosWwcxDCBe1KDtQPOjrckqAXBB+wuWqEweoWFSAYmHNdb/DD8TzIIAJm/
         ngAIclgo1EIthIv0mlP9tnVLZFwCNd3OZYDDdbfmGEDAgm0TWHWNyXs6F1NEGGN+7MfJ
         GYAQ0F+pikRrivBQXL/jE1NepNAvmG2gEEyzWs1SLv0GzqbcFpla63HxK56kn2lg32fc
         TLcgykcxCgq+jUTTvdvPTWeRd7zqHJ6BCRVH/0Vawyf0teB6grvLeUEGZ54z4bnl96Jk
         Fs3ZFRS3bhxq3xbhKRV6RQbkJ/wEHmwRzVDtmC3hSt0rBicDkMA/f+moKDeJPdEx2Hcf
         gGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qkSMw9deQ9RinsLBKkB9EbaQCbROrXJ7fDD8ywtC9V0=;
        b=wFMFr8K/G4CXhjWZjw5ost1e1freLgUIHSD0Fa7zW9sdz2z18RicH8ABZH/tFbYmHG
         Gtwm6qvDJcpJgVmeXtmk0vlbkSVYaZtzaQ39/R2XJiiEHu6x+xxmlMqh4+r3uK9UFIaK
         ZyFngtxvxU8bSmKdjxlTPoDECCAxctZYxXgAnul4vibNy+SU3dAxV8XooB8BWH0Vn9cE
         fW1mpBCeOj1bPLC+b4gNojtwJ2oQKYjssio6SgBgynC5NeWkDFvsXKFum5bjMc1B7hsg
         jsAYJgXDVC462CsHf6ySb31NzEktgZLLvD7VNTMS+SKBJl9hBFWXKLw+oGYEanMaF4BP
         Mm2w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si2874067wmk.107.2019.02.08.22.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:40:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMJF-0003aP-VK
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:40:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIv-0003WB-Ba
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIt-0003Oh-3d
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMIs-0003GP-Ov; Sat, 09 Feb 2019 01:39:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25FA837EE7;
	Sat,  9 Feb 2019 06:39:43 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A492E54505;
	Sat,  9 Feb 2019 06:39:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:06 +0100
Message-Id: <1549694366-1284-6-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sat, 09 Feb 2019 06:39:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 05/25] hw/arm: Express dependencies of musicpal
 with Kconfig
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
Cc: qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3bCdNcBW1xWI

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
index 19d0ab0..fe7e306 100644
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
@@ -56,14 +55,12 @@ CONFIG_PL190=3Dy
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
@@ -140,7 +137,6 @@ CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
-CONFIG_MUSICPAL=3Dy
=20
 # for realview and versatilepb
 CONFIG_LSI_SCSI_PCI=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3d0ee29..aeb0cf0 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -48,7 +48,13 @@ config MAINSTONE
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

