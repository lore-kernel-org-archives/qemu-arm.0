Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp929972wrx;
        Thu, 18 Apr 2019 11:10:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzSWdZLyqn/VMMhIa0JWjpw3avQ4uhj/Ah3kymwUNdtxFDs1tAPx294U2ETDgZZ2ef+FvAe
X-Received: by 2002:a1c:7d42:: with SMTP id y63mr4213595wmc.113.1555611034441;
        Thu, 18 Apr 2019 11:10:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555611034; cv=none;
        d=google.com; s=arc-20160816;
        b=tSQbDNtEH8Y0AtoxhooN1r80uCaGC34Wr3+OsEb+h4RI/LKUGKYXsHZ0YPyNjVUr78
         yvuLKVzaX2dDkT3ROcsiN8l3tt/m2RuR1hIwLgbBOw0kAaN74L0Pu/b0H55qu1iIBF6b
         GDXZWZMkSPPdBIX9n/StrJ3ARHBsHa3pFpVvLuljYrwENWHAx95YwO45GIEpKGBsJMWS
         fYmYXU3Rj8dksUco1xjtafvqDGRoyaHMKdHzHbFhM/pyDkOd3jMAS78adIStrlw1fji0
         olaFVMUAHbCeIyov8KZN4w3Vdd5TEifov5xflstqECnSrLXA1P4MFhrwt94d4YXFml9S
         8Y1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=BjmJD4ACuB9XueK8yZAwmmGj9bet2jRtiZ1wGp3NGj8=;
        b=WGZhpXNawcgdMCkILpYysTHrjjF9ULrVEng5KXlnaKOf03FjCtvSlTDCggtI558hL+
         d6Xz4L86MSrXjF3OFxvNM/9rb60YkyALO+tL2MTHeQ8G5BUnOFrPmsNSVnt0GGeAt9px
         fCL6GyILbZ7a6Zaw0eupn88pcXgsxf4vyS+JYUVkjtCtu5ieFM1F/b69KJCYTqaLpshQ
         NUJ9gabU6508BTcG49CgGVeamsAUNDrKJ1soh7+xSGfdUCiaHtaY/bZlSSXaJhoE9ha9
         q6/WRySlLtUen7goXcMZDV6qdCh/h1tFtXen4+fomwaaB+kILqNlzkY3ZjLuu3Az9GUY
         jhMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si2213979wri.448.2019.04.18.11.10.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:10:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBUX-0000bg-Dv
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:10:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBNn-00047B-Es
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 14:03:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBNm-0002ac-CP
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 14:03:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBNd-0002VW-Dx; Thu, 18 Apr 2019 14:03:25 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C6D630A7C97;
	Thu, 18 Apr 2019 18:03:24 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1541E1001DEF;
	Thu, 18 Apr 2019 18:03:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:43 +0200
Message-Id: <20190418180057.3593-16-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 18 Apr 2019 18:03:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-QEMU-4.1 v5 15/29] hw/arm: Express
 dependencies of the aspeed boards with Kconfig
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
X-TUID: vS2iMQykrSRE

Dependencies have been determined by looking at hw/arm/aspeed.c

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
index 325133c129..abeaa54d88 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -254,6 +254,16 @@ config FSL_IMX6
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

