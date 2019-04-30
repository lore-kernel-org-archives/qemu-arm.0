Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4408761wrh;
        Tue, 30 Apr 2019 00:26:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyI66GNPlCaC/GPu022JPGYbQiKB+IZJDN6rgcGMHksQ6Yoe/b6sQAtXi5wnXrsaWTA5LJy
X-Received: by 2002:adf:b646:: with SMTP id i6mr4261553wre.12.1556609199391;
        Tue, 30 Apr 2019 00:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556609199; cv=none;
        d=google.com; s=arc-20160816;
        b=lRMKPOcbpmhehMr0Ry7HYJwujRORNCoT5dZ1r8HZtsM6W+2VYxoQr7vRZq7e509URu
         8HIENbiuGhnVl5qeR3aGwyUcYIyaaPhacEgqmTsXx0RPpO6AM9AkB8ZrWuMSmQJ/zaBA
         4/gxt1JEWAUSB2tjoz/rOIdF54EacFYNu+QPcInrQJHBLcrdyixxxdIX9JX6dAeEDBfy
         AWDLWIAfyEpozFWHBGsPuulQIYQFlg1iwTSaQihEw5N+T6defW2GnP5NRiJt//prWt57
         KEwFMPYOSPSXRZVtl1/hNrkhdi1HtKXQALmYBbx8zNXJeGkldkC4X7zWjX3Zbqi046bT
         I6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=y9y3GtYiT+dhwzc1H0gCG3VTdBdjyH5YyE+/EZcNRMY=;
        b=DPyQXL8Q9hU4+ii8tMmaFzvbGxB5JPHstVDgONwZNMNw6QgPlOeGWp7i9wvuqQCgn/
         ZosYB4aRI5HBEAnvo1sK/Xi7k+bUDGqsNsiW8pb6PmbPT0JrB/IUkB83f7yGSKrPEZp3
         sP0FkwOxXj0/ErC69Ppkyey5yowP/yHlraVX4TnDzdY4OazFpDku5MzDPBhZNBA57Ul2
         NluI3U8KwZhyrVU8eCiNENme+gFb+LwEkU6wDck+zKpdoEmaRWFnUPvZZ3i5Jts6wIoN
         wXvne9/wS3mzntASLbpvCrYy3/GKkbN79rW9EyB2eEaVOfrQEFhenP7fkG5DBjmRzhlD
         Z43g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si25039919wro.142.2019.04.30.00.26.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:26:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40508 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLN9y-0007aB-BY
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:26:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55857)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN0z-00083g-Kt
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:17:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLN0y-00058S-CM
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:17:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50840)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLN0w-000573-Cs; Tue, 30 Apr 2019 03:17:20 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07A1633025E;
	Tue, 30 Apr 2019 07:17:17 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C3521001DD2;
	Tue, 30 Apr 2019 07:17:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:51 +0200
Message-Id: <20190430071405.16714-17-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 30 Apr 2019 07:17:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 16/30] hw/arm: Express dependencies of the
 aspeed boards with Kconfig
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
X-TUID: SYnQmDOpqfgv

Dependencies have been determined by looking at hw/arm/aspeed.c

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 10 ++++++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 25e8f717ac..2580584281 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -26,15 +26,12 @@ CONFIG_SPITZ=3Dy
 CONFIG_TOSA=3Dy
 CONFIG_Z2=3Dy
 CONFIG_COLLIE=3Dy
+CONFIG_ASPEED_SOC=3Dy
=20
 CONFIG_VGA=3Dy
-CONFIG_TMP421=3Dy
-CONFIG_PCA9552=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
-CONFIG_FTGMAC100=3Dy
-CONFIG_DS1338=3Dy
 CONFIG_PLATFORM_BUS=3Dy
 CONFIG_VIRTIO_MMIO=3Dy
=20
@@ -92,8 +89,6 @@ CONFIG_I82801B11=3Dy
 CONFIG_ACPI=3Dy
 CONFIG_ARM_VIRT=3Dy
 CONFIG_SMBIOS=3Dy
-CONFIG_ASPEED_SOC=3Dy
-CONFIG_SMBUS_EEPROM=3Dy
 CONFIG_GPIO_KEY=3Dy
 CONFIG_MSF2=3Dy
 CONFIG_FW_CFG_DMA=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index a507144d9a..95ac0b540e 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -255,6 +255,16 @@ config FSL_IMX6
=20
 config ASPEED_SOC
     bool
+    select DS1338
+    select FTGMAC100
+    select I2C
+    select PCA9552
+    select SERIAL
+    select SMBUS_EEPROM
+    select SSI
+    select SSI_M25P80
+    select TMP105
+    select TMP421
=20
 config MPS2
     bool
--=20
2.21.0

