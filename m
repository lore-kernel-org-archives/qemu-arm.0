Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4418662wrh;
        Tue, 30 Apr 2019 00:41:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyq6iOynqFSyoMvhaLJl9rxezK9/M6Gl67iIrWhsHfsIfU3JMy4LGtGpFLsetWJr3lWHR3c
X-Received: by 2002:adf:cc8a:: with SMTP id p10mr2241675wrj.34.1556610064837;
        Tue, 30 Apr 2019 00:41:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556610064; cv=none;
        d=google.com; s=arc-20160816;
        b=zQfaAF3Ksq1PZbpWrXOx/e1gPuk9tTLJ4TcpBrb+ghcxYZSVoFGFDq8Nj10U1c08/n
         1LB9FTWCcRFVNxyTdlPoK5HYeQ/dWY1yNspQ5L6DbmEQeZCTEUG7jQGI6T7d/VRV1VwA
         WcCTCvoyJfM/aL0eUskJDBqjjZbv39p0vs7fwQaqm+ULDBnIfoFPd0onJlg5oyWuRfAL
         olWjM/cjQHEX9k+kszZ0BOTNDwVRHRRpx9Te7jsXuNJqT5r4Uj+NiXOfJ3JFJLSG29Nk
         iNV/Cl+cX8YGQEZFsLaA63t4gD+1VhE0/FkbS8yENOAlOoj77Z2EvaLvKJbeMw5nRCuy
         d7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=OriLAygB75bjbIUm7+RhTNrMtC7TJfxZ8unMYXEWbfo=;
        b=wjgdMIq1tKunCfwTbPlCe6ypLrGbsFaG16oPOqgCLA4kmPA/pkoM38psCDEXI+yggR
         BAN0SAvXWFZfD3m5HcPmHFYIldMGb7el8g6czCibwzOR+EfWEIee/fPumL158L4NP77i
         5JH1oVvBzXJCo70BJyqzuz0oc/z7Z6TfIK44lModjP+/Qq/Tckvl56eZfKsjX9FSzS4S
         eGKCSw5kvbmrE1JzVThs60z4jUAZWqp4QP9+yQ+/3hiX4GOhVvH83Rcp+yeMDutJkbQ9
         yxq68NbGc7o2Xf7Y3QED3V9oVahzlA0L7hAgW5zcyfFz1RaFUu3yVECv7P+dA4FFuSiO
         lAxg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si699262wmb.122.2019.04.30.00.41.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:41:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLNNv-0003P2-Tk
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:41:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN1k-0000Ey-9s
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:18:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN1j-0005Pi-Cx
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:18:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45266)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLN1j-0005Ox-7p; Tue, 30 Apr 2019 03:18:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 493BA30832E3;
	Tue, 30 Apr 2019 07:18:06 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 376B01001DD2;
	Tue, 30 Apr 2019 07:17:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:56 +0200
Message-Id: <20190430071405.16714-22-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 30 Apr 2019 07:18:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 21/30] hw/arm: Express dependencies of the
 raspi machines with Kconfig
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
X-TUID: y/U0+xoPnXxp

Most of the code is directly controlled by the CONFIG_RASPI switch,
so not much to add here additionally.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 4 +---
 hw/arm/Kconfig                  | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 31d31d3f4a..22bff20b32 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -31,15 +31,13 @@ CONFIG_COLLIE=3Dy
 CONFIG_ASPEED_SOC=3Dy
 CONFIG_NETDUINO2=3Dy
 CONFIG_MPS2=3Dy
+CONFIG_RASPI=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_IMX_FEC=3Dy
=20
-CONFIG_FRAMEBUFFER=3Dy
-
 CONFIG_DIGIC=3Dy
-CONFIG_RASPI=3Dy
 CONFIG_NRF51_SOC=3Dy
=20
 CONFIG_FSL_IMX6=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 55f7e5bfce..40be78303c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -258,6 +258,9 @@ config ALLWINNER_A10
=20
 config RASPI
     bool
+    select FRAMEBUFFER
+    select PL011 # UART
+    select SDHCI
=20
 config STM32F205_SOC
     bool
--=20
2.21.0

