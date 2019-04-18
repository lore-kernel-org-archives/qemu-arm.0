Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp933864wrx;
        Thu, 18 Apr 2019 11:14:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw+cThAeLvb4X8joviIqpoVdXjEHa+/mdhoZfYWGW+Gr366nfU9EBXjUU2blYc/eHcLsRpN
X-Received: by 2002:a7b:c446:: with SMTP id l6mr4110549wmi.80.1555611265968;
        Thu, 18 Apr 2019 11:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555611265; cv=none;
        d=google.com; s=arc-20160816;
        b=d8PnSVKXF0Ti7SUqhZZrnCMhBxGxvyRCfSLYkGubhGURHLW8h2dWbxuERvAjGox4xh
         ZpJyEwBdJQZrs4wRHdfdSQlfT3QA4tIUo3wk9u1wwrq5LzjQgU97t0iEzVdKCynirZd0
         qfZ5VrnLVhmdHav1DjtYvVhyy+te9HtjpdbQa6aJWIegWp1THKsEesxcJg+6DgcOJsr0
         s86ukN+bjRmPq6b/21wBQE+ntx0vg54/JMRNA/nLC11j9f48eU9lmx83e5GBjkNvl/ZU
         au+EfnlSrpEVWXnzLhhvnjYkNnoG5QzhjxHoTmJAMPdvqDwm/Qktr48YjXiACv7581/V
         lK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=E+/o2SHUFCpVKPgcTfuaf67oG50VFrE85LsHMQnYsdI=;
        b=P1NTanId45z/OjhNQopnq60csOap3i5fExumtt++i4KzXPo19buhZW0KF+Z8ElHmGN
         1LIWm9OB21ifqbQdhHlWDBYvq4ptFOm3GhuDSV4u+5yexuQoD0YlppcJ8r+9HsJfbxyM
         NnKO72Gx12SZkVXd6gtGJ2IZt1Of4rFpBCbgfQwSxzxqIKQcHen5ubt9MuLf5gTSS4hY
         BIGJxq7DnzXj7uK/TxJbpIswpfAAP8lAJHv7qxf18AUokQhr5Nrib8UkbCNXXCl97W4b
         3MI+0o6rGUqDszQZS9lstTkFKUrnSmGUFBTAq2CbrbE9SnNSwlDe0x4zsF6P5CR8Dwev
         k4kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4si2365757wrs.396.2019.04.18.11.14.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:14:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBYH-00044C-0y
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:14:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47038)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBPL-0005R4-SJ
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 14:05:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBPK-0003aZ-Be
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 14:05:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:27006)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBPF-0003YJ-1N; Thu, 18 Apr 2019 14:05:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F31D1308A11B;
	Thu, 18 Apr 2019 18:04:58 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 403951018A14;
	Thu, 18 Apr 2019 18:04:37 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:51 +0200
Message-Id: <20190418180057.3593-24-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 18 Apr 2019 18:05:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-QEMU-4.1 v5 23/29] hw/arm: Express
 dependencies of the MSF2 / EMCRAFT_SF2 machine with Kconfig
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
X-TUID: znDNWFVDh8R5

Add Kconfig dependencies for the emcraft-sf2 machine - we also
distinguish between the machine (CONFIG_EMCRAFT_SF2) and the SoC
(CONFIG_MSF2) now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak | 3 +--
 hw/arm/Kconfig                  | 8 ++++++++
 hw/arm/Makefile.objs            | 3 ++-
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index ef7dd7156a..1455d083d8 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -34,9 +34,9 @@ CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
 CONFIG_DIGIC=3Dy
 CONFIG_SABRELITE=3Dy
+CONFIG_EMCRAFT_SF2=3Dy
=20
 CONFIG_VGA=3Dy
-CONFIG_SSI_M25P80=3Dy
 CONFIG_IMX_FEC=3Dy
=20
 CONFIG_NRF51_SOC=3Dy
@@ -49,5 +49,4 @@ CONFIG_PCIE_PORT=3Dy
 CONFIG_XIO3130=3Dy
 CONFIG_IOH3420=3Dy
 CONFIG_I82801B11=3Dy
-CONFIG_MSF2=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 065c7acf1b..f5cd63860d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -331,9 +331,17 @@ config FSL_IMX6UL
 config NRF51_SOC
     bool
=20
+config EMCRAFT_SF2
+    bool
+    select MSF2
+    select SSI_M25P80
+
 config MSF2
     bool
+    select ARM_V7M
     select PTIMER
+    select SERIAL
+    select SSI
=20
 config ZAURUS
     bool
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index fadd69882c..eae9f6c442 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -4,6 +4,7 @@ obj-$(CONFIG_ARM_VIRT) +=3D virt.o
 obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o
 obj-$(CONFIG_DIGIC) +=3D digic_boards.o
 obj-$(CONFIG_EXYNOS4) +=3D exynos4_boards.o
+obj-$(CONFIG_EMCRAFT_SF2) +=3D msf2-som.o
 obj-$(CONFIG_HIGHBANK) +=3D highbank.o
 obj-$(CONFIG_INTEGRATOR) +=3D integratorcp.o
 obj-$(CONFIG_MAINSTONE) +=3D mainstone.o
@@ -41,7 +42,7 @@ obj-$(CONFIG_FSL_IMX6) +=3D fsl-imx6.o
 obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) +=3D mps2.o
 obj-$(CONFIG_MPS2) +=3D mps2-tz.o
-obj-$(CONFIG_MSF2) +=3D msf2-soc.o msf2-som.o
+obj-$(CONFIG_MSF2) +=3D msf2-soc.o
 obj-$(CONFIG_MUSCA) +=3D musca.o
 obj-$(CONFIG_ARMSSE) +=3D armsse.o
 obj-$(CONFIG_FSL_IMX7) +=3D fsl-imx7.o mcimx7d-sabre.o
--=20
2.21.0

