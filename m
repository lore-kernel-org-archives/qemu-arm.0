Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4402483wrh;
        Tue, 30 Apr 2019 00:16:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyPEfgOEcIuYI6eLMyjyZ1fMxGhScO9929HFqzmcR3SVOAU3wWNk5WBksRR/9WbTHWcDtMb
X-Received: by 2002:a1c:7a03:: with SMTP id v3mr1873628wmc.58.1556608583741;
        Tue, 30 Apr 2019 00:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556608583; cv=none;
        d=google.com; s=arc-20160816;
        b=g7yUBVAKqnp9w9udWNh69Z0/HEOMV2sCPMSRooi7CrY7hBeWTsQCEGN4qZAmtDM6FZ
         M2GmysCEdonrSytAfDRIIk6Y+KSdJkUIHdDIzAQEOb8BSe4VAPstuu5dl4VayOVdHOIC
         DlxPRIL19n9WxAZVo0zRV+aK6nF5yK5LQqBIK74aRTtvyuSMHuCS7iOp2fV8NgBHp5Pq
         rxrk8j/Qo7aBq4KgjzjecEglO90zm+krQXjunelIBhx3bCa013ojJ1veb679f7WMnqLG
         02pySKtB/KDx1izKhy67Cwk8xeWwelH+kgmvx/4d9W5zVv29gm5qMNaJR/QXJ2D2Tzcp
         DjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=qET51TsX4NM7rciRMjIpqvvwNSpmI/yktBTY1qFawjw=;
        b=wvsOeTD6WMSlbpVJkHJmB/zmXWhOkGwvtqlIQ1atZ0YJp32BX7vm0WG/eboTEgl5SK
         3TU8mF0xs8vSBKt0ApkvYyOx8q5LlcwLKGeCocbpj+2ow+CBa5+1FsdK+BRAT7qJDdG5
         la7qInXxvVZRZShkpeijqdhdwQ0dYCjkKtaYmfWvsAWEcNvAuhDQpSfCFRbjR36aXZnO
         dAN6nG+/57+knhFmeBjWJRWL2S/zUxPSoR3gf1fmZiqOtw4Rr6sPYG/LX8fTYYT9qiRc
         kR/b2mzY6tLzLo/5DZPMMNSc88KpIVpcHCG0xusfhoDZNgKhy+XLnKjlK5T8TbSAtulk
         ktNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si1031806wmh.168.2019.04.30.00.16.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:16:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40316 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLN02-0006xv-Ml
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:16:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLMzO-0006QY-Gr
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:15:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLMzN-0004WN-Fb
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:15:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56820)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLMzJ-0004UD-CH; Tue, 30 Apr 2019 03:15:38 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AB84C024AFF;
	Tue, 30 Apr 2019 07:15:35 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A296D100200A;
	Tue, 30 Apr 2019 07:15:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:42 +0200
Message-Id: <20190430071405.16714-8-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 30 Apr 2019 07:15:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 07/30] hw/arm: Express dependencies of
 integratorcp with Kconfig
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
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Cedric Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrew Jeffery <andrew@aj.id.au>, Peter Chubb <peter.chubb@nicta.com.au>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: agus4mJ4fFXm

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
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

