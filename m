Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1664798wrp;
        Wed, 13 Feb 2019 01:00:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZZ8MSnjZWVRcyQytF5i4nKTUhjgYO/mUMiewaqEHxdoAZC5FOQ59WfuUCbevGfNRvNxrdA
X-Received: by 2002:a0d:e607:: with SMTP id p7mr3578909ywe.329.1550048437612;
        Wed, 13 Feb 2019 01:00:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550048437; cv=none;
        d=google.com; s=arc-20160816;
        b=UrOYpz3YqYSOyjoaJ7tyN58XK33vAwWxNT1mbxKzTzEir0zb88Z1YQ3W8VduVM6hej
         N2FSRSmw+O1/6kxnEUr79MgpdOnXtLX0tuRa5K+MNm8p5Y1C2XfYcbkNm62iKI34Qkpn
         /PxhPnyXRf11mD6ZQX76vfYzCP3NC5u4tDhIuFoeflLef+O2v3JFiQmG/hJgYdrUebgv
         3BtbSyIi2lyOihuGeDD8+ZBi1PETjYQBNiwLiqFGqQK5+ZAvbZhbOQKwa6phMvwNwHrM
         y2DcfIlw+BdlLxf0bG16vMQimBEXYzSNlRTZNHzs+3H2jdCD2VMpzJaLvj1ac/xP4ybw
         rmXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=z72OHb8Q7leMf6iWy4Fj0v9mbVnpfZWU6pcluleyxbk=;
        b=x+HmXS/PvU4u+0klFyNRJ6BON1+yjE8vsHIcMbh2oxlR+4K2W+fN1uoUe1l2ZqIZaQ
         ILD9Tw3n2BR0k193lBuWa1RMPEPXSUUyLwduKItDMWU8ivk76xNqVBRGiELD2D79l2wj
         98/ZNGq+m6Ua6ONcrZBBdajsn4x8WNk9UT30s3RmT4fL+HkloYslKClKfa5uh+kwQRi3
         Uln1n44tJeQPRclWy3DQVEFHfQJ4mN5BTe+Sl8Fshzq6HiHBPn/tmcmptjR0UinH13ph
         ouwxRG3Gbe/hh9gHtWzwlvuGETpiGQ+PTKlBQneZ8O5jyvYvlqiYJZJF6I6lEhGAAnzi
         5Q8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w10si8909162ybk.366.2019.02.13.01.00.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Feb 2019 01:00:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtqPF-000203-24
	for alex.bennee@linaro.org; Wed, 13 Feb 2019 04:00:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51852)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtqG3-00021O-6d
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:51:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtq4r-0005rB-8t
	for qemu-devel@nongnu.org; Wed, 13 Feb 2019 03:39:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57634)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtq4Z-0005fb-KM; Wed, 13 Feb 2019 03:39:19 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 361947F746;
	Wed, 13 Feb 2019 08:39:13 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFAF010021B6;
	Wed, 13 Feb 2019 08:39:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Wed, 13 Feb 2019 09:38:05 +0100
Message-Id: <1550047098-1210-13-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-1-git-send-email-thuth@redhat.com>
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 13 Feb 2019 08:39:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 12/25] hw/arm: Express dependencies of the
 aspeed boards with Kconfig
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
X-TUID: HSnJuxRkMa78

Dependencies have been determined by looking at hw/arm/aspeed.c

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 10 ++++++++++
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 9851068..b2e31b3 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -22,15 +22,12 @@ CONFIG_SPITZ=y
 CONFIG_TOSA=y
 CONFIG_Z2=y
 CONFIG_COLLIE=y
+CONFIG_ASPEED_SOC=y
 
 CONFIG_VGA=y
-CONFIG_TMP421=y
-CONFIG_PCA9552=y
 CONFIG_SSI_M25P80=y
 CONFIG_ALLWINNER_EMAC=y
 CONFIG_IMX_FEC=y
-CONFIG_FTGMAC100=y
-CONFIG_DS1338=y
 CONFIG_PLATFORM_BUS=y
 CONFIG_VIRTIO_MMIO=y
 
@@ -90,8 +87,6 @@ CONFIG_I82801B11=y
 CONFIG_ACPI=y
 CONFIG_ARM_VIRT=y
 CONFIG_SMBIOS=y
-CONFIG_ASPEED_SOC=y
-CONFIG_SMBUS_EEPROM=y
 CONFIG_GPIO_KEY=y
 CONFIG_MSF2=y
 CONFIG_FW_CFG_DMA=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 39cbda9..a4fe2c8 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -267,6 +267,16 @@ config FSL_IMX6
 
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
 
 config MPS2
     bool
-- 
1.8.3.1

