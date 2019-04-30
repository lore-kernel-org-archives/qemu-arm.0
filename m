Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4410412wrh;
        Tue, 30 Apr 2019 00:29:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrZEjQZcF5idktzgiQhcaczyZNXLPj4WRt/dZxfcEvCDRORLqhJrcS79UG8c73b+yki2tQ
X-Received: by 2002:a1c:2ed7:: with SMTP id u206mr1958432wmu.5.1556609356825;
        Tue, 30 Apr 2019 00:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556609356; cv=none;
        d=google.com; s=arc-20160816;
        b=f9gF7fMB4zU2DmQIXTSZIX5g0AJ7keiNt2UCSNevDOMX14D7rUh0od1uZcyF4O5Gc4
         4tmph94vYNWqAwRJ1lXM61PC4cYtXRAPg1p+4idYMlqeYyYg0mlfRC+7GqZ+2REJM6sk
         VcxbQGQXqkBs9RHiYUub3yE4TmtZZuiFsnLnLd21lPjRQW9xbNevuQqHtXYSWPmmzUYW
         Kh7RmYs2NdCw5S6jGDBcts7UdX79xFHB1lS6AjNIiRwsRTdNCk9H4nSIoQhgIGGYcP+q
         lk8xt1L6PJq11C8nPACHhB8jDNR+aQhiIDFXAT4USzxbalTd2PRWifSeUuupoXElrYgv
         EkGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2daEInaei6jg0zvuQ1QtYHOXLRCLrDocJF2C2WDG1VI=;
        b=ct7RAHbzpjvljEiUxI/ZGuEtJF7J1qTX0yx8Uh59s7wqXhltjo41JNgOR/C8IvfImL
         BlzWkssUuCSOGXNJlpuL/f8zmMipVHOCc8rl2orpEzKV2+I0LEMowTgTEne56qXIvEVr
         vS63xss55fYw0b7H2AQI6+Ne4y8Sc4AI/aRt3/eEUzC+LYpAmgITaGoaXoZpp0UwUlih
         oAow9efffG28rjsbrQyfoxMPS6kVjZ/DMcsM3uqrH8NxTLirHjLwNZ6igReKTcsSlN3j
         GL9zgpzUxiZ8mrCjT5gbG2YY4sXT62Qss0/glBV0RTFMgsxyv7d3Hm0Q/PelsTDo2Biy
         +urw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12si1139120wmf.146.2019.04.30.00.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLNCV-0000t2-Ph
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:29:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN1f-00009x-8e
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:18:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN1e-0005Iq-6b
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 03:18:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38144)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLN1Z-0005HI-Sm; Tue, 30 Apr 2019 03:17:58 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0F3730832CC;
	Tue, 30 Apr 2019 07:17:56 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CBAE1001E85;
	Tue, 30 Apr 2019 07:17:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:55 +0200
Message-Id: <20190430071405.16714-21-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 30 Apr 2019 07:17:57 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v6 20/30] hw/arm: Express dependencies of the
 MPS2 boards with Kconfig
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
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Cedric Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Andrew Jeffery <andrew@aj.id.au>, Peter Chubb <peter.chubb@nicta.com.au>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N6RpRpwoo4GB

Add Kconfig dependencies for the mps2-an* machines.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 20 +-------------------
 hw/arm/Kconfig                  | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index a0b9016e3a..31d31d3f4a 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -30,6 +30,7 @@ CONFIG_Z2=3Dy
 CONFIG_COLLIE=3Dy
 CONFIG_ASPEED_SOC=3Dy
 CONFIG_NETDUINO2=3Dy
+CONFIG_MPS2=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_SSI_M25P80=3Dy
@@ -38,28 +39,9 @@ CONFIG_IMX_FEC=3Dy
 CONFIG_FRAMEBUFFER=3Dy
=20
 CONFIG_DIGIC=3Dy
-CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
 CONFIG_NRF51_SOC=3Dy
=20
-CONFIG_CMSDK_APB_TIMER=3Dy
-CONFIG_CMSDK_APB_DUALTIMER=3Dy
-CONFIG_CMSDK_APB_UART=3Dy
-CONFIG_CMSDK_APB_WATCHDOG=3Dy
-
-CONFIG_MPS2_FPGAIO=3Dy
-CONFIG_MPS2_SCC=3Dy
-
-CONFIG_TZ_MPC=3Dy
-CONFIG_TZ_MSC=3Dy
-CONFIG_TZ_PPC=3Dy
-CONFIG_ARMSSE=3Dy
-CONFIG_IOTKIT_SECCTL=3Dy
-CONFIG_IOTKIT_SYSCTL=3Dy
-CONFIG_IOTKIT_SYSINFO=3Dy
-CONFIG_ARMSSE_CPUID=3Dy
-CONFIG_ARMSSE_MHU=3Dy
-
 CONFIG_FSL_IMX6=3Dy
 CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 0e89383f50..55f7e5bfce 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -302,6 +302,12 @@ config ASPEED_SOC
=20
 config MPS2
     bool
+    select ARMSSE
+    select LAN9118
+    select MPS2_FPGAIO
+    select MPS2_SCC
+    select PL022    # Serial port
+    select PL080    # DMA controller
=20
 config FSL_IMX7
     bool
@@ -341,6 +347,19 @@ config ARM11MPCORE
=20
 config ARMSSE
     bool
+    select ARM_V7M
+    select ARMSSE_CPUID
+    select ARMSSE_MHU
+    select CMSDK_APB_TIMER
+    select CMSDK_APB_DUALTIMER
+    select CMSDK_APB_UART
+    select CMSDK_APB_WATCHDOG
+    select IOTKIT_SECCTL
+    select IOTKIT_SYSCTL
+    select IOTKIT_SYSINFO
+    select TZ_MPC
+    select TZ_MSC
+    select TZ_PPC
=20
 config ARMSSE_CPUID
     bool
--=20
2.21.0

