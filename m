Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1678144wrp;
        Wed, 13 Feb 2019 01:15:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ8Mc98fkf+6mTVJ9DXbc8dCG8in8yZK4jt4zEltUUF8bMptmAwdfbVmk8114m8mEQ8R4x/
X-Received: by 2002:a81:4e41:: with SMTP id c62mr3724054ywb.247.1550049314119;
        Wed, 13 Feb 2019 01:15:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550049314; cv=none;
        d=google.com; s=arc-20160816;
        b=DqqZ7j/EqG5caM7RZIgc7QfN/2lmDaesqbGvNw2BdTcWJXbtCdJGj8YaMw6Q2diNGG
         Dv7vBEDdQycEliZvbSLrLrWwYi2xe7s0jGyVAT+dlrxMKTRABunn7k4EYBiOM9KUqR9e
         KDW636ihP4rKWtuZ1/leDkupCt7RBFFF/q3cUBdu+ZnkthllhtcPR0hqElTY0GtcLvdw
         n3RG3qPjrrTvVkeLg1V4env62u8yz96sibRj5QXHem0zXeNJb1zPBuD/zI1tkfT1sLkI
         qDsgJ2u8nd0AN3eHUA28eBYH9Nep/ZtvbFBcSEYje84SRx973RQQ1SU7Ldfv10wm7QGa
         TQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qkSMw9deQ9RinsLBKkB9EbaQCbROrXJ7fDD8ywtC9V0=;
        b=xFCXgeL6xUWZt10gXYk4Pw6Xmh7PjF3NPRjR4JIVRQpFJ0rW5KuLtKin4dhLUsRpiu
         0wDMkihQeWdEiIDlhnarGYmUMKMpDdQimbC6GT6aliPDVNG9U5+tb/b0qRTJqnfeWIrN
         k3OG5TtLLOhn7BaG9dvdBr6iPKvh/d430KtSrzOUwTYPEhouAEmTATCzTxoWHp0NNHm0
         /DA8IAkvFQsfZkgZJiJeJzwbwALSGzxbURqzwhG7Gk/Dr5lPheRQUDOqC4NWDX0wnK/v
         yPkioO1KjSl626VB6nLFdwPZYeNsS85zaSFoBL4v6NNDyY3EcR37/xn9z2b9U3uOw9A8
         H8wg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d79si9119341ywa.346.2019.02.13.01.15.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 01:15:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53513 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqdN-000509-Em
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 04:15:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG5-00025D-C9
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:51:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4I-0005VU-MA
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:38:59 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58158)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4A-0005Gz-7o; Wed, 13 Feb 2019 03:38:52 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4D1E180481;
	Wed, 13 Feb 2019 08:38:47 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B53C0101E841;
	Wed, 13 Feb 2019 08:38:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:37:58 +0100
Message-Id: <1550047098-1210-6-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 13 Feb 2019 08:38:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 05/25] hw/arm: Express dependencies of
 musicpal with Kconfig
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
X-TUID: ZI72X24p241U

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

