Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1430944wrh;
        Sun, 5 May 2019 07:01:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKswr9XvHKucC1CrAjUa3wrsXL7nLMU9RrULAEvw8DyYxCpgv49etckhPa/nEwtsIFDdFE
X-Received: by 2002:adf:c503:: with SMTP id q3mr14948624wrf.263.1557064863587;
        Sun, 05 May 2019 07:01:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557064863; cv=none;
        d=google.com; s=arc-20160816;
        b=NCEtQSY9cqOsdprFXQL1wtaUA91nHC2JuTUW6px/3/O/GwZb9VuXwBXnLKwagMXGZb
         oDM0tTqp4Gy3m1rfPAo3W/qOJXU7xbK/7egFL4Ky0QsFtHr4058Oj8JPP8lkb9HGWgU1
         NX+aLJPPraiSuUkhD57jsX8pepo+akm7Afl2obNwUxw5K1wvwwW4N7zwuGET+u3dDUcF
         R5w34CUV/4o87c9C2i7x1AlED3NsvkBQZ/m7bmiQAlcK0z3ivFt1LbokJcL/VPVuqjL3
         j5MKotiLMCR5Farz5797SoOP61/WbNRVrFarzzyOJieu7JVVElg/d6Jsc+XIRdNpx13N
         kRfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=WaxLNGSWsUNRa6r4NpEkiQDGHzPWy23Kkr7YKgt/6SU=;
        b=cokKuzCqbYsu3WpBhCAmUTmDsmDr/9GfJ+qkfdSH9zbYih9fF1ksBVeAxpL1VlyEeK
         Nqa0vVdMidoZMKf0btzvj3NmspqxuCCxmL/lUzxz2+0+ovAlirCK/4+n0jfVh3RFwLwi
         6qOVWU4CP3rNDilj6yvAQg8GfreqOqTTsuKGwn23Rl37YuDEoyd5K40dt71bJ2jRl2Z2
         V5nh6yBEEtmyAY5Bzc6UtmCUznCXvHCk97NlKNQA7zvl4bkUn1GGVzLvLVD9aI2uAubl
         IFpMWt6Q3pNhZBfzz6scEUMH/z/ZEPCdypxTwstrbX8B/auQAjmO1H9X2Sz5cT0NUh5B
         dgHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si5607479wrm.178.2019.05.05.07.01.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:01:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41416 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHhO-000768-Jh
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:01:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHe7-0004Gc-4o
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHe6-0004m8-4y
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33572)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHe5-0004lV-Ub; Sun, 05 May 2019 09:57:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A3443086201;
	Sun,  5 May 2019 13:57:37 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D60B60C18;
	Sun,  5 May 2019 13:57:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:56:59 +0200
Message-Id: <20190505135714.11277-14-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Sun, 05 May 2019 13:57:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 13/28] hw/arm: Express dependencies of collie with
 Kconfig
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8hiKpIQ1Lkfw

Add Kconfig dependencies for the Strongarm collie machine.
This patch is based on earlier work by =C3=81kos Kov=C3=A1cs (i.e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 7 +++++++
 hw/arm/Makefile.objs            | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index af78e7c892..25e8f717ac 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -25,6 +25,7 @@ CONFIG_GUMSTIX=3Dy
 CONFIG_SPITZ=3Dy
 CONFIG_TOSA=3Dy
 CONFIG_Z2=3Dy
+CONFIG_COLLIE=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_TMP421=3Dy
@@ -97,5 +98,3 @@ CONFIG_GPIO_KEY=3Dy
 CONFIG_MSF2=3Dy
 CONFIG_FW_CFG_DMA=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
-
-CONFIG_STRONGARM=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index dfdc1b1fd6..a507144d9a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -169,6 +169,13 @@ config STELLARIS
=20
 config STRONGARM
     bool
+    select PXA2XX
+
+config COLLIE
+    bool
+    select PFLASH_CFI01
+    select ZAURUS  # scoop
+    select STRONGARM
=20
 config SX1
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 00328d1b0b..729e711b87 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -17,7 +17,7 @@ obj-$(CONFIG_TOSA) +=3D tosa.o
 obj-$(CONFIG_Z2) +=3D z2.o
 obj-$(CONFIG_REALVIEW) +=3D realview.o
 obj-$(CONFIG_STELLARIS) +=3D stellaris.o
-obj-$(CONFIG_STRONGARM) +=3D collie.o
+obj-$(CONFIG_COLLIE) +=3D collie.o
 obj-$(CONFIG_VERSATILE) +=3D versatilepb.o
 obj-$(CONFIG_VEXPRESS) +=3D vexpress.o
 obj-$(CONFIG_ZYNQ) +=3D xilinx_zynq.o
--=20
2.21.0

