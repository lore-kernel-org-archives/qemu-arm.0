Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp921633wrx;
        Thu, 18 Apr 2019 11:03:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxosFtbFNRmD7QfnFJhHwb9Wl5uMRI9GNUHUfm57h7VdG2s8Mc1ZkwbxsU4QvDb65i2FT1A
X-Received: by 2002:a1c:1d81:: with SMTP id d123mr3899612wmd.59.1555610588261;
        Thu, 18 Apr 2019 11:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555610588; cv=none;
        d=google.com; s=arc-20160816;
        b=xoGzKwLG8O3Xkvs6D5znos4sORWangtLrMDWc9o1yUM2l0oelAHLtW6TlnL1fZst/O
         SEZh21/4nQMEHbvfEPIzteXKSBuABRrsBUiouCu/J6eMzLKaiFpR7afbq0Mr/OIEaVsl
         FS+cf4zAFZRxDpy603vXunPsHp2BinUzMA6qD6kIsSUxHkMuxSbuUzOqOsek/d/AtQC9
         L/DVhfn2eXjk/GZjybJ+YBHggNvSXL2q0xBvtKO8R5KTuIRD5Bn8Ohh++yqlXlRvROHn
         wGODbm4OWIS/djSlPbtBii4zutI+1l2EqKQ7WR8RnZgywpdzejyLQ3ZEiSmvMOeqwz47
         4DsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=7hN1C+Jqee6gi5FDXqo2fEcbpm3QKzqYxzjRtvTJH5w=;
        b=R0ygPF+FVQrCvMeoUw1OjGdOsJySFmBpld9kX9FCPmSfn9dh5MP5ld4MOD/NNxAdhY
         asvJ3sBcr5l+/G+y7IGkFHAzaLId5Nqs8AzI+9DEa7654LHx0KGkyCdTXUoSqchadE7m
         kulrzkqkdHSciFaEG0oYNqXJTnpcDHmB2V5XBqQrN4lBH7yXWv2J5Zpdp7FzYT19dk3B
         097o3pAxpFs1AANkFghmDj3BhvR60D7pMb8hUrF8Rqar9Toy9HEWdnUf5Lgpt72+Mm+c
         9/sk/1J96U1I3b8vCNCW1ThpQLB8pEMaPSKY3/6miC7jxb3ZWRMST7MIcvQRqC6CGjam
         aJhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o204si2028805wmo.121.2019.04.18.11.03.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBNL-0003Vr-A5
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:03:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBMZ-000343-5I
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:02:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBMX-0001rl-RB
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:02:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51700)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBMX-0001r7-LC; Thu, 18 Apr 2019 14:02:17 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8FD5330018FE;
	Thu, 18 Apr 2019 18:02:16 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C0631001DC8;
	Thu, 18 Apr 2019 18:02:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:35 +0200
Message-Id: <20190418180057.3593-8-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 18 Apr 2019 18:02:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-QEMU-4.1 v5 07/29] hw/arm: Express
 dependencies of the fsl-imx31 machine with Kconfig
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
X-TUID: 3P5EDp72Jr2i

Add Kconfig dependencies for the fsl-imx31 / kzm machine.
This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 4 ++++
 hw/misc/Kconfig                 | 2 ++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 6195b75f48..7f94811ccb 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -10,6 +10,7 @@ CONFIG_PCI_TESTDEV=3Dy
 CONFIG_EXYNOS4=3Dy
 CONFIG_HIGHBANK=3Dy
 CONFIG_INTEGRATOR=3Dy
+CONFIG_FSL_IMX31=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -68,7 +69,6 @@ CONFIG_TSC210X=3Dy
 CONFIG_BLIZZARD=3Dy
 CONFIG_ONENAND=3Dy
 CONFIG_TUSB6010=3Dy
-CONFIG_IMX=3Dy
 CONFIG_MAINSTONE=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_MUSCA=3Dy
@@ -115,7 +115,6 @@ CONFIG_ALLWINNER_A10_PIC=3Dy
 CONFIG_ALLWINNER_A10=3Dy
=20
 CONFIG_FSL_IMX6=3Dy
-CONFIG_FSL_IMX31=3Dy
 CONFIG_FSL_IMX25=3Dy
 CONFIG_FSL_IMX7=3Dy
 CONFIG_FSL_IMX6UL=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ad3b1f9b40..9087b7d714 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -98,6 +98,10 @@ config FSL_IMX25
=20
 config FSL_IMX31
     bool
+    select SERIAL
+    select IMX
+    select IMX_I2C
+    select LAN9118
=20
 config FSL_IMX6
     bool
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 5f67d0d6d9..385e1b0cec 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -76,6 +76,8 @@ config ECCMEMCTL
 config IMX
     bool
     select PTIMER
+    select SSI
+    select USB_EHCI_SYSBUS
=20
 config STM32F2XX_SYSCFG
     bool
--=20
2.21.0

