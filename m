Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7204474wrx;
        Thu, 7 Mar 2019 06:26:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxparYHt1VVNw0hqH/4S1FW+TNS0EPl1RPbXG/YwwFWO1hkeheKHJI88kwEbwuh38OaG3KA
X-Received: by 2002:a81:1282:: with SMTP id 124mr10297325yws.0.1551968801188;
        Thu, 07 Mar 2019 06:26:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968801; cv=none;
        d=google.com; s=arc-20160816;
        b=ZB6dk08MxKgrsD+b187+oIzwucbSekTjz+jXCFCAr3Z9PKU51v9pGYuzpF2q/GjHwr
         st0WAKzjNvkbcwmCsRZBcQaAAd4vSkVpwIYHLJdlR2HsKLn/yeF2PmUWcZxGBryutEmk
         uFvjYe1N9CLRpvISCUXgB8gnqZefG+plx24L1gRnxbg4DPzJgd1mW9Kyu1PJgELlDn/D
         JYwTx237o2nCO/OcvdMQ0dFQsYGAYV1cZ+fv+IRezTwSXmP1ZXxYUbk16qVH6niV6nDC
         ZUd8wikTth24UMxc3In/xgr1dTxmCe1hqR+H6zZwtrM3kXTpcUI3t+g+9zfl6NE4sx9w
         darA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=WkQvgs2C89wMv9PoHX3LuICdaQSmkSe0BQKpzICup9U=;
        b=caE/ifr8q9+hzNJNclOr/rNaNtX84hGgVjtQHEyVDZZX85mfgoehj0zze0NHxUjx3j
         8bxXgXRYLxF7QP8MPatHmSS35WAD2Ztp4AcDc45axQaCaZ+JIidIM6yoExEGySDKFuE6
         Z8cqI7JjzF7qa4se5UAtMnPbXsVSOvXxo0g6iaKuUGG5bJ5z8EIo5fY1WQfejeFFrE+6
         8fPANTJoqZWIvrNNJE7F1vcPzYx3h+UvvxrrwFgZ/c26sl0y0npiF4PPK1ItutzH+6YM
         /KfDaq5fvi72kUwxVqcrw+MLF2V7vCp8e3O/SaWSUymfk9P9LtterV+UggM6QKDi+rMG
         Io8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 67si2732173ywb.199.2019.03.07.06.26.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:26:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1tyq-0002WL-KV
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:26:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1ttL-0005pS-IJ
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:21:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1ttK-0000i2-QW
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:20:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48636)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1ttK-0000gu-Ja; Thu, 07 Mar 2019 09:20:58 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9A5B804F2;
	Thu,  7 Mar 2019 14:20:57 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC96F5C545;
	Thu,  7 Mar 2019 14:20:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:39 +0100
Message-Id: <1551968334-18982-15-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 07 Mar 2019 14:20:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 14/29] hw/arm: Express dependencies of collie
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5fPmZ5tPm/wi

Add Kconfig dependencies for the Strongarm collie machine.
This patch is based on earlier work by =C3=81kos Kov=C3=A1cs (i.e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 7 +++++++
 hw/arm/Makefile.objs            | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 54b1c61..44988f7 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -22,6 +22,7 @@ CONFIG_GUMSTIX=3Dy
 CONFIG_SPITZ=3Dy
 CONFIG_TOSA=3Dy
 CONFIG_Z2=3Dy
+CONFIG_COLLIE=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_TMP421=3Dy
@@ -94,5 +95,3 @@ CONFIG_GPIO_KEY=3Dy
 CONFIG_MSF2=3Dy
 CONFIG_FW_CFG_DMA=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
-
-CONFIG_STRONGARM=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ef9cc97..43ef149 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -173,6 +173,13 @@ config STELLARIS
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
index 00328d1..729e711 100644
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
1.8.3.1

