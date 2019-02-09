Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp292187wrq;
        Fri, 8 Feb 2019 22:40:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYaPMsPH9vhw3i+WhARxYX2LvGxZzP0+20bl6ZZ32fV9r5c6Y1aW5RdK6PMoFWY+F+gZTwp
X-Received: by 2002:a1c:1a8a:: with SMTP id a132mr1760188wma.109.1549694434937;
        Fri, 08 Feb 2019 22:40:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549694434; cv=none;
        d=google.com; s=arc-20160816;
        b=SbWnNEAd/Hiu1M325GenXW+pgU8FwR3MR5tLzYzYaB55ZjqhPQbhkEgrEPyLI1rKRG
         Sh284MbY0SAGokKioApxqY8NVeQ8th+am7oI5cuJ0VjnNJjXABBTmRSwCgurRpIU84ow
         Rjvvs5bSU5nwTTh2mHGhW/5hEBliu1bB3CfkB9X1KupsS47qBkeZXyuGBN5FzykKZMZe
         +8x9JuDcmlCOA6vGWjG9eEH7Oej3er1xiMnY9mDFEPbeaaymqPNSV3EL4MmduyeoC1Kj
         9fFMuejimPlUme/Ka2NqqtKEJtvk0SX5LbFDpFAjSmRKOsUFGjUF1WQYT5FZ+H2JjYyo
         8YIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=f5f+GuVSvBfnGe1caiJDMpxcA79uLa/BxP9r4rjcQb0=;
        b=GjmMiQKL6LvLiG8roB0kjFiHqwMUqZIi/R9IgUENTTTqrCshhKAzO6HI36LMzdD6hN
         bxRdJj+eOUWtgZ+x0aOLonnJnEzYYwv5UZ7wuY8/AdbavCWhmw0mfVKOhVQfHAzzAwx8
         5IiaWqo+aa0x9Oo0qu9XWSanY4YP2QL05lj+i4uIfkAdiNvPVd4aGa5um4kfpbVq8aNe
         0hM5baNg8GBZDxSBBfT9ZkN+Q+GIxqS32hge/W1DhhOuRDR0pOsrhi8ONBYSoVoeYoQn
         Bd5cGbalQrEhrbJCAvyw1BFAOlj/vlfq1525ewHwXiUd9Z1SHwzRRj1ZjPi+T21WAJ2x
         CRvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si922707wrx.97.2019.02.08.22.40.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:40:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41432 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMJW-0003pr-1Y
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:40:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIv-0003W9-AY
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIs-0003OH-Sj
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55150)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMIs-0003IC-Ix; Sat, 09 Feb 2019 01:39:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6B9F5947C;
	Sat,  9 Feb 2019 06:39:46 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E32562662;
	Sat,  9 Feb 2019 06:39:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:08 +0100
Message-Id: <1549694366-1284-8-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Sat, 09 Feb 2019 06:39:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 07/25] hw/arm: Express dependencies of stellaris
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
X-TUID: 3l8p4IpYKi2X

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 10 ++++++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 492db53..1be49bd 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -13,6 +13,7 @@ CONFIG_MUSICPAL=3Dy
 CONFIG_CHEETAH=3Dy
 CONFIG_SX1=3Dy
 CONFIG_NSERIES=3Dy
+CONFIG_STELLARIS=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -21,16 +22,10 @@ CONFIG_SERIAL=3Dy
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
index fe1505e..3034252 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -95,6 +95,16 @@ config REALVIEW
=20
 config STELLARIS
     bool
+    select ARM_V7M
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
1.8.3.1

