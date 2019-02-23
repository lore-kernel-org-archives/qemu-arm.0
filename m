Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7785976wrx;
        Fri, 22 Feb 2019 23:58:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3IabVNmQrmWBUm+v72+QhXL2bnlG3vZhyHHJbROxRUFFvTqi+pYK/FgjUGPNoPFGZM+fKned
X-Received: by 2002:a0d:edc2:: with SMTP id w185mr6580505ywe.228.1550908693949;
        Fri, 22 Feb 2019 23:58:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908693; cv=none;
        d=google.com; s=arc-20160816;
        b=0xqPU1cIxi8XVg4YC+Dnu2lSnFJ9vvYzodzFbSg+PNzCaZWDlvh9zBzOcVW9qkgHyL
         P08wcVcrwxPQYTzaGorog2UW9D6aD95JshG4n6GNkBtCXDhf07VOTgxxQm84GtJS2ZSs
         Qc1dPr1EjtGipz5+juJEiddeR/BBvGgRGha+/QlmLm/l766Yfpo3LtfodUSxEbHF3yTX
         0T2hZkYRa+HsFzUGGjT11RLRvYgUJ0m/YASPMwKlOa8VVEepovqXWVe4ptUaJPGR8UNR
         +IUrGRl2TGXqqIdnOb9tQwBOTwGyc5Xan4+T4O0SingN60btg1uaiQVPui/6FuX2B/zp
         dtYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=OCv7esleAkL8Ar+t9vjve7Ww6mIZhTEHcBdFs6filDU=;
        b=u5d+QKpV64JeX7HodseEF52m42Ia3ov2lIe/3rvz+bdTiAEu1JzPj8E5E68yYjGQZq
         pdJ/8W5bNyNiHVN/t6CbFOqN1WqIPaltXL0X8X2iCVzuK4Wl+eCA6lB74Y+cBgsO4F/4
         DZT5+xe16R87ZIhVEDWl9GkdywS2BfqC8HH4BOF5ZigxHy9iHghfR2vE5QyHPVDQu0fN
         9n5LX/nrKWMiD47SBJa+FKY1odxuQwwTJHnRrQg5Rvx7VX/kOiCCLE93sZ1FPGR2qi9q
         WLa9aJNBJRjbssYiIqj54teWmmudr6G8ioMedOoOXB4AlOb5yuYNAgA6f69lxI30kgUI
         1vDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b75si2107251ywb.52.2019.02.22.23.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34191 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSCL-0002VW-CP
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:58:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4W-0004kf-BP
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4V-0002GF-HR
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4V-00024u-6W; Sat, 23 Feb 2019 02:50:07 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 085477DCC2;
	Sat, 23 Feb 2019 07:49:57 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2AC45D9CA;
	Sat, 23 Feb 2019 07:49:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:07 +0100
Message-Id: <1550908162-22644-16-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Sat, 23 Feb 2019 07:49:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 15/30] hw/arm: Express dependencies of collie
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ejPPbPSlgr97

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
index b9fce47..34725e1 100644
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
@@ -96,5 +97,3 @@ CONFIG_GPIO_KEY=3Dy
 CONFIG_MSF2=3Dy
 CONFIG_FW_CFG_DMA=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
-
-CONFIG_STRONGARM=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 78e694b..f15e433 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -175,6 +175,13 @@ config STELLARIS
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

