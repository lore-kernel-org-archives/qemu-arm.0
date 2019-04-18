Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp923663wrx;
        Thu, 18 Apr 2019 11:04:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLGxjs2bBKTi/Uo1lHRbXiH/hXCFElRVW7PS7YjZsbTMwDal3S5xKLZNFezGgn14TniK+m
X-Received: by 2002:a1c:f205:: with SMTP id s5mr4186905wmc.124.1555610695325;
        Thu, 18 Apr 2019 11:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555610695; cv=none;
        d=google.com; s=arc-20160816;
        b=LDqeTCBkMoeFBJhvtUrpv/452GcEwm5u5EgFdusjKmKBpqvX1D6/15xLLI6Wg5RTYU
         yldb2PCB/wJqCQmTQdAgq08Hm2iDx+quQ/P5KbFTdYcoC5Mvitx9hFt5NepUVzw6i9be
         L9K3RIf/Aqs/kl4YLLP8sHzalIw91Lq+lbONGe486vwcVJKJkpNoC1dGC9MVN/1C4PJa
         m6y4+prdKMjv2XTye0/x3Z1+mLZ4dqWvX7UvhwaR91ere7fPnbxbF8vOh8pSxggEs9vz
         G0av8+wg+ra5Zn10885vc4FHIvqnFDIBWSjsl+R4oyrDvNsFwgqP+/pmXDB163ZT7yL9
         JauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=s5yegeW8BLWnuk9MNsGktoIa/O4Gfji02MqgYY0e4OY=;
        b=0OGCGGTl4yNvbaknC8u1YAvs7v+C9pV7apk7iTVlkPQKen3p6nsaEQiIqNXrnlBgUl
         oHFMy/ZWHYuRJqoWyTZ0S4NgZ+tmyGbB8jscvCU/0tsZlu3vOTAOZ6MANElX4+42WBop
         CAyV5NZzDg4Xdct4ac8k7RQeO8MWczmcqQDdUACx0+zAj1WAprHnmY4kE9XjYSDOtNeg
         jifuOJpXZmj9nKLNoLXWN6t2GuIexdJRTcQJmNfwm+Uc7ov8SdRdGw+DTrH5TijIURa+
         ECZl/LaRjdz7z+ZNsqM5XWl2bNLA3Smg4OYMxHTA5jexXqRdalIdPmg5yLk1x+q5C2i8
         Tl2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8si1545554wrw.290.2019.04.18.11.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:04:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBP4-0004OO-DA
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:04:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBMa-00035J-AX
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 14:02:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBMZ-0001t4-7I
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 14:02:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53454)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBMJ-0001fj-At; Thu, 18 Apr 2019 14:02:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 42E7188AB1;
	Thu, 18 Apr 2019 18:02:02 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11A881001F41;
	Thu, 18 Apr 2019 18:01:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:34 +0200
Message-Id: <20190418180057.3593-7-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 18 Apr 2019 18:02:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-QEMU-4.1 v5 06/29] hw/arm: Express
 dependencies of integratorcp with Kconfig
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ThJPcLJVPtEu

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 8 +-------
 hw/arm/Kconfig                  | 8 ++++++++
 hw/display/Kconfig              | 1 +
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 50a4be3cad..6195b75f48 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -9,6 +9,7 @@ CONFIG_PCI_TESTDEV=3Dy
=20
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
+CONFIG_INTEGRATOR=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -33,7 +34,6 @@ CONFIG_ADS7846=3Dy
 CONFIG_MAX111X=3Dy
 CONFIG_SSI_SD=3Dy
 CONFIG_SSI_M25P80=3Dy
-CONFIG_SMC91C111=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
 CONFIG_FTGMAC100=3Dy
@@ -50,10 +50,7 @@ CONFIG_ARM11MPCORE=3Dy
 CONFIG_NETDUINO2=3Dy
=20
 CONFIG_PL041=3Dy
-CONFIG_PL050=3Dy
 CONFIG_PL080=3Dy
-CONFIG_PL110=3Dy
-CONFIG_PL181=3Dy
 CONFIG_PL190=3Dy
 CONFIG_PL330=3Dy
 CONFIG_CADENCE=3Dy
@@ -113,9 +110,6 @@ CONFIG_VERSATILE_I2C=3Dy
 CONFIG_PCI_EXPRESS=3Dy
 CONFIG_PCI_EXPRESS_GENERIC_BRIDGE=3Dy
=20
-CONFIG_INTEGRATOR=3Dy
-CONFIG_INTEGRATOR_DEBUG=3Dy
-
 CONFIG_ALLWINNER_A10_PIT=3Dy
 CONFIG_ALLWINNER_A10_PIC=3Dy
 CONFIG_ALLWINNER_A10=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0ba377ac18..ad3b1f9b40 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -32,6 +32,14 @@ config HIGHBANK
=20
 config INTEGRATOR
     bool
+    select ARM_TIMER
+    select INTEGRATOR_DEBUG
+    select PL011 # UART
+    select PL031 # RTC
+    select PL050 # keyboard/mouse
+    select PL110 # pl111 LCD controller
+    select PL181 # display
+    select SMC91C111
=20
 config MAINSTONE
     bool
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 72be57a403..a11815c9af 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -21,6 +21,7 @@ config JAZZ_LED
=20
 config PL110
     bool
+    select FRAMEBUFFER
=20
 config SII9022
     bool
--=20
2.21.0

