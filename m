Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1431766wrh;
        Sun, 5 May 2019 07:01:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYVXLWJxUJHkpdGiD0PHnkgHiiJaCI0KyTiNesrsMrifjl0dAMXu6XaUXNgUIJNQ9BwkJ/
X-Received: by 2002:a1c:1903:: with SMTP id 3mr13116513wmz.103.1557064912535;
        Sun, 05 May 2019 07:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557064912; cv=none;
        d=google.com; s=arc-20160816;
        b=X4uGa35YFcV4HZeD7/8hMNKWu8wCukixGFOlsKU1LcwhbmVXa2/MpRaH/MIFVDIPuV
         FDWd9bR+w2oIegSRdSEMjzZKtCCeHuOWwRavTyb9x/2dXlSjIM+EZzRuitttEPzjB7ow
         8Wov4BwIPR9msY/HrzR+kCp1o5MCVULuOp6VCwmPVnH4Ua6GzIdr6EMSdBPCZ7vvNRDs
         k/jjdITrBNhhdW4I3qCp4naImzYE2wX1+88yPbsJYdonpvLUmkTLkVTH3S7H1TPFbs6S
         OrysUkOwGNB8uRrAkFiQDjY8uOrXT86FGPILTdDVpaj62ddQqzhwqhwr0PTRYYdsm2mf
         ulWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=X5al5OeoBOuaBIUdq3i2MnqRlb3fLNCk1OwOb2kLIQk=;
        b=wXplKU/y9LudjDJATB9iRp3i8vshIkzUOfAa8YsDuV7MxoZ8zy7wD6N5WALaGKUaTn
         fbgtCwAcEdMfUTmzDR/nxqcNVfmVLxdDsUzVviTh1Q6BISw+FjNhCMHzry9fHwNNCYy2
         C+ChKAuFZajJ53/t7TFlm9lYs0ivghU3PoNxm55LC3kpBzs+vFxEILjbM+DOKhfMoMvr
         Nv5aFoMuVNEX8adkLG8QIA1nedn7p0Br8TWCG0qlg0jg4YWDqEWv9VlIKXOG9IYk2tJM
         QN/p6ZI5NCwBaIYYrpMagTtzo5SMWQcwE6nuJn06Q75W/XKOqFq1nD+4KGjVgSdGD+LY
         BcVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1si5756053wrn.409.2019.05.05.07.01.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 07:01:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41434 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHiB-00089x-Ji
	for alex.bennee@linaro.org; Sun, 05 May 2019 10:01:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHe1-0004CX-LP
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHe0-0004h1-LK
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHe0-0004gN-GJ; Sun, 05 May 2019 09:57:32 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C020D2D7E0;
	Sun,  5 May 2019 13:57:31 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B160C60C67;
	Sun,  5 May 2019 13:57:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:56:55 +0200
Message-Id: <20190505135714.11277-10-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Sun, 05 May 2019 13:57:31 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 09/28] hw/arm: Express dependencies of stellaris
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nDBiz41LR8ef

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 11 +++++++++++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index b7ed3c530b..3f82d635e4 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -16,6 +16,7 @@ CONFIG_MUSCA=3Dy
 CONFIG_CHEETAH=3Dy
 CONFIG_SX1=3Dy
 CONFIG_NSERIES=3Dy
+CONFIG_STELLARIS=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -24,16 +25,10 @@ CONFIG_SERIAL=3Dy
 CONFIG_MAX7310=3Dy
 CONFIG_TMP421=3Dy
 CONFIG_PCA9552=3Dy
-CONFIG_STELLARIS=3Dy
-CONFIG_STELLARIS_INPUT=3Dy
-CONFIG_STELLARIS_ENET=3Dy
-CONFIG_SSD0303=3Dy
-CONFIG_SSD0323=3Dy
 CONFIG_DDC=3Dy
 CONFIG_SII9022=3Dy
 CONFIG_ADS7846=3Dy
 CONFIG_MAX111X=3Dy
-CONFIG_SSI_SD=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 71126254ff..e5a8ae5ef9 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -91,6 +91,17 @@ config REALVIEW
=20
 config STELLARIS
     bool
+    select ARM_V7M
+    select CMSDK_APB_WATCHDOG
+    select I2C
+    select PL011 # UART
+    select PL022 # Serial port
+    select PL061 # GPIO
+    select SSD0303 # OLED display
+    select SSD0323 # OLED display
+    select SSI_SD
+    select STELLARIS_INPUT
+    select STELLARIS_ENET # ethernet
=20
 config STRONGARM
     bool
--=20
2.21.0

