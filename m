Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp291975wrq;
        Fri, 8 Feb 2019 22:40:12 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia5LpuPWdQNxXDqVMMMY5reIndBn4AvwoIdjBRlnmxRs7M5oV1Uh9LNTrmDjOxyrPp7VNwW
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr10088333wrs.108.1549694412351;
        Fri, 08 Feb 2019 22:40:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549694412; cv=none;
        d=google.com; s=arc-20160816;
        b=zP+kT4KwCz+LzzAWpPzQAAfDtSHJ2BzAyaa1+yCGzW+FHuVxH+1G2muDjblGR+sbJu
         +Yjvdud6VLWJGdih21aoAESaESL3syyat9gy/c/YROcArKXeRZQOtZsi1HlfOTNf2eTa
         FjBA00T5vaVKGZ2uDO1lKS5hc1dRNcwuqNZb8TeKdK8EdEqMWSyBj0n+NxM1YdALUH9i
         mDPQhNI4JzYjL2BuHPd/7bmiI2JlFuBcDdy11HlTyDIeC/f7a3mQufDmtgJYen/qxBeB
         UC+TymBvFilL3IKAq9JsPyWpyVtu4oPs0i3aj8MABDqCWhvK6mZaYD2X/V/ud9Ye2Czg
         UMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=WqVEDhJJt98CKUtfwitTLihKuG78VO651XzAEMJFlUc=;
        b=KT73mrMsXQDewz58+4dFkwHXQXCSuHt6OS8ivAU8R2hywsRaa4vwNjreP8C/jAF3zL
         W4vG+6SpFMuNddlscr4GkBZ6pJMKcoLOtlzGY7e/sr0VsaMUtsvr1Zr5Gl4QRZwfmBef
         a2CnFba4JUuJJoDp+3MdJ7tw/hjNxS6ji7lx1YxbtseMrgYlFERMycn8diz7CXpmq4FO
         qatwntDLxpD5ZZapiBSU7x9Mb2jIgEDvLh05rZnmSNBOoqjcNrAgIdK4Y8rDd42lJp/N
         PCuMQZvPGtuj2vZjkSw1GFm2YLbXmIWqU2O4PTE56/rhKt8sJvwJgn8xx35x3upVCzv5
         Rr1g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 124si3328912wmz.193.2019.02.08.22.40.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:40:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMJ9-0003Wf-Df
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:40:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIv-0003Vz-99
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMIs-0003OB-T4
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:39:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33014)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMIs-0003FH-Ii; Sat, 09 Feb 2019 01:39:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A442C050939;
	Sat,  9 Feb 2019 06:39:41 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9C7080D1;
	Sat,  9 Feb 2019 06:39:39 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:05 +0100
Message-Id: <1549694366-1284-5-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sat, 09 Feb 2019 06:39:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 04/25] hw/arm: Express dependencies of the
 fsl-imx31 machine with Kconfig
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
X-TUID: 5Zvp7Aq4eoku

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

