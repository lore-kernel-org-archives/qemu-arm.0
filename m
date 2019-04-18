Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp927345wrx;
        Thu, 18 Apr 2019 11:08:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtFqSv6ab7quolVKzuASKFrnIrAzUlL327bvWdC6L1qpdFO4Rr9rfCqPOp+aEIHWbuBfDS
X-Received: by 2002:adf:eb84:: with SMTP id t4mr4514832wrn.43.1555610884687;
        Thu, 18 Apr 2019 11:08:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555610884; cv=none;
        d=google.com; s=arc-20160816;
        b=wZPw4L3x8eMWARmhr0/MkXnq4UqnGQ70NVzbWQ5WESLETj5HUFEirvSJaxEEDEtet3
         2asooFXKS8ALrOwe9It0H5L87Ks8js/U//Z7cSP+2JVFEwp5UikqdgZmj2a/6CnZkPWx
         iWfDKLdzKQxZAxPqniSBB10xABfcy1q8z4bkESr15N1D+qY4JFrUstELZwJPW78LNqJi
         dKxIKW7gfXvI+zUdF0s4VXLEzd34vyMNVNflVV+TsliANS81IcCI64Acro/FJ9x0KEhv
         MBxSuhCEgBwvyPcH8lmldaxG9cVodCXb1LDgS/3XfMHrBskbsm+HYzuKfMalt/XlDZG5
         nvaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=plR/hT4EAt/NxOrJzeeDLyytLXROqB9jZgjYtFT0maA=;
        b=oXkOrz1UhBb+kOlY9mWm1GElTu3HtU3/R7UE2gjBUyZCBS9VpOL+AL8oGEcffsbFL/
         xTV+ZJjPIe9gmsWcGJGeiTk4XcB9eXc+QdZE+HmWpgEIRLJDOmD3EfFx6aqk2vhIcrAF
         oLk3Krv3ftwrdid8+q1+jKZjzLn3TmE/7xB+78/WQSzDi5VwY5mYAv5SoxnGpZKFmupc
         xM5+OjGp8+W5RiQJ1HrPbc9EhcKWmJi38U9QkxHVbE7OsuRvVqDRUxULJdqm7s5UtBtE
         husn2U+0IEjQ5vuks09DJgEHsdZXw3ay3yvX906P8sV8bEfaxPBsRcpCN6ZyhNIetQuK
         xVeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si1904534wmh.142.2019.04.18.11.08.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:08:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBS7-0007WA-MT
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:08:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45499)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBMC-0002lb-KA
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:01:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBMB-0001ao-8u
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:01:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33716)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBMB-0001ZL-1P; Thu, 18 Apr 2019 14:01:55 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C00F23132C29;
	Thu, 18 Apr 2019 18:01:53 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B1E11001DC8;
	Thu, 18 Apr 2019 18:01:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:33 +0200
Message-Id: <20190418180057.3593-6-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 18 Apr 2019 18:01:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-QEMU-4.1 v5 05/29] hw/arm: Express
 dependencies of the highbank machines with Kconfig
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Azks/G8FE1kt

Add Kconfig dependencies for the highbank machine (and the midway
machine).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  9 +--------
 hw/arm/Kconfig                  | 11 +++++++++++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 2a11e76cc7..50a4be3cad 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -8,6 +8,7 @@ CONFIG_PCI_DEVICES=3Dy
 CONFIG_PCI_TESTDEV=3Dy
=20
 CONFIG_EXYNOS4=3Dy
+CONFIG_HIGHBANK=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -45,24 +46,17 @@ CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
=20
 CONFIG_ARM11MPCORE=3Dy
-CONFIG_A15MPCORE=3Dy
=20
 CONFIG_NETDUINO2=3Dy
=20
-CONFIG_ARM_TIMER=3Dy
-CONFIG_PL011=3Dy
-CONFIG_PL022=3Dy
-CONFIG_PL031=3Dy
 CONFIG_PL041=3Dy
 CONFIG_PL050=3Dy
-CONFIG_PL061=3Dy
 CONFIG_PL080=3Dy
 CONFIG_PL110=3Dy
 CONFIG_PL181=3Dy
 CONFIG_PL190=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
-CONFIG_XGMAC=3Dy
 CONFIG_PXA2XX=3Dy
 CONFIG_BITBANG_I2C=3Dy
 CONFIG_FRAMEBUFFER=3Dy
@@ -150,7 +144,6 @@ CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
-CONFIG_HIGHBANK=3Dy
 CONFIG_MUSICPAL=3Dy
=20
 # for realview and versatilepb
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index acd07b2add..0ba377ac18 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -18,6 +18,17 @@ config EXYNOS4
=20
 config HIGHBANK
     bool
+    select A9MPCORE
+    select A15MPCORE
+    select AHCI
+    select ARM_TIMER # sp804
+    select ARM_V7M
+    select PL011 # UART
+    select PL022 # Serial port
+    select PL031 # RTC
+    select PL061 # GPIO
+    select PL310 # cache controller
+    select XGMAC # ethernet
=20
 config INTEGRATOR
     bool
--=20
2.21.0

