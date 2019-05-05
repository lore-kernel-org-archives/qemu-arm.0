Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1428483wrh;
        Sun, 5 May 2019 06:58:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6eOYozUyDJAuGC8fjVv6wHnOoemKViVV/3wIqNoZ4kuBc5BqsHDEnXtfqMVPJnLFfhdY1
X-Received: by 2002:a1c:c917:: with SMTP id f23mr9757672wmb.4.1557064680818;
        Sun, 05 May 2019 06:58:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557064680; cv=none;
        d=google.com; s=arc-20160816;
        b=pRF08Egkh2jf5MJh5dN7ymA/DE1TSaUTwO3hFsXfOwnmWGI7acEHkBHaCd5rick1OW
         r/RN/GQ4YhCMEKnrYc7b868xlj+dNjG5w+fIuqB6dIxmFZRvfTDtuYYJsAaCCPB+eB92
         gP7bpgtL2sAaUQHGZjhMfw2UMvIM4JZ65K8mYvpWj1fzx1vIsNsRWzJ4hqTAyCWLKmvM
         Tn27VSEiFI2sQFdWXhORIYYs3kHZrOYaRxj7xoMe62VRWQnt2+pulqNEvTMtWE9rTJMS
         mExA/lLIpS473ABnns95oulowov6vM4iP7ENR5zwU6EjC2uhaEa7fOR7LndFQPgRydrw
         VDmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=hZCNqmAHszGN7szn/4/N0piSWFHnCPKBVeGiz6/fZBs=;
        b=m+UwkzUMbG0/1fIOJECt9jEyqYos1M8eZegvjnvjxJahBsbdABt42TnVaYhAV5xmIk
         xl4orqO6qKEoKSzQ55huRtifQF/ydIFbcBhaNe51gk9b8XvzK1EB4zQw3ae3waceGOGS
         f8wnuVNRuCSjgn4b6F5bp/bvt9j9TxHWVGZxMzUTcZjtzeoqM/Z+wMQ6ygFNk1o9YwsS
         3Kq3aE7suuZiqEDjQxmjDl1AS6WQ2XJwUzDhzSbcEiJxwXbcangPf2r1putGptjDseyd
         8uZxn9mC1rrjLBdBJEfTF0ik+2qmKCMkcP03Vx5JFOwFgrX5jayd9KZc20hgJv1HA+rF
         gbZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si5869231wrh.385.2019.05.05.06.58.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 05 May 2019 06:58:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41358 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNHeR-0004Id-UE
	for alex.bennee@linaro.org; Sun, 05 May 2019 09:57:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdu-00044H-E0
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hNHdt-0004a9-IR
	for qemu-arm@nongnu.org; Sun, 05 May 2019 09:57:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43466)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hNHdt-0004ZT-CT; Sun, 05 May 2019 09:57:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD41537EE7;
	Sun,  5 May 2019 13:57:24 +0000 (UTC)
Received: from thuth.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0CDC60C5F;
	Sun,  5 May 2019 13:57:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Sun,  5 May 2019 15:56:50 +0200
Message-Id: <20190505135714.11277-5-thuth@redhat.com>
In-Reply-To: <20190505135714.11277-1-thuth@redhat.com>
References: <20190505135714.11277-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sun, 05 May 2019 13:57:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 04/28] hw/arm: Express dependencies of the
 highbank machines with Kconfig
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
X-TUID: CUUAIq2KVky8

Add Kconfig dependencies for the highbank machine (and the midway
machine).
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
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

