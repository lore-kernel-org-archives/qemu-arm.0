Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp938940wrx;
        Thu, 18 Apr 2019 11:19:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxEYvOaSRx6cI5CL1EttuSAlYa7PNODzVdJxNab1Zzeetv5FnMzlaS4bzS9juN8Oc4HGLyE
X-Received: by 2002:adf:c002:: with SMTP id z2mr62380097wre.177.1555611583196;
        Thu, 18 Apr 2019 11:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555611583; cv=none;
        d=google.com; s=arc-20160816;
        b=ApEWRJHiQ4pUMd3hAJ9yKJJnZIC9cz+voxw5OBjGvm8akKqAIXaMrVXVNqqozYjDal
         40ITiGpvIc6SxYb64HPD/ZmwjB5MEXaJA/NXVPW6Fxk1fUQD48ggjnMewKII2GQv+Qkz
         IK/CG0MfEw9JZZDQgGdettoyaKLct2oMM1fjeqUukXgFr6ZuUgUndFAQTgFsYK7C3+j6
         7IRqE6JwEa7SyBYIT+y9q4GVJN7JCHFDEoYhwrDwnqAdwd6qV+zMZy6WtT+eD1mCmVgj
         zzxszNq0n2yl093hS1D90hPyDeAUbB+uY8VWWhB+uxjLIkkHmaJ0BlhlAvMIlbRyDiYV
         mxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=X8EMr3NjnD5P4KuNHnJE77u+/btAC4dzSb+78piDKqo=;
        b=LhxVxAGWzfpRYZuTMgwzfT3jW+MAuchkKFNPWUqJ4QucNoFKWTeI+Nzf+SOaZys/um
         45z/jIL69Js43+wG/5ZwaWiQ04X6yVLvXoZ6mP/4D3qrfqVg0x/giNtjkEpVefja8xPm
         0pc9LJ/jeTei1FRoLew2KWDWUfBkGVNLIaXq3C6VZMoFnaCHqnFzIgy6ExuOA9Ze0Xiv
         j/0KFqBAhCeeovUbAa9IM+7+A+XuOI/2KsOeHU8asqSH8Vi+98grog+Df/zqvNtKQNG8
         GtNexbf3UIjYEZxBMPITfdvFXwyL6MayAhauSPwQoKic/VqthJ/wszdY8ThkJIo4TYxr
         5p1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si1581854wrw.438.2019.04.18.11.19.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:19:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBdO-0000NP-7g
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:19:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBPj-0005lH-EP
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:05:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBPi-0003nh-CT
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:05:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45974)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBPg-0003eL-H1; Thu, 18 Apr 2019 14:05:32 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B9F3C1306EC;
	Thu, 18 Apr 2019 18:05:20 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 493741018A10;
	Thu, 18 Apr 2019 18:04:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:52 +0200
Message-Id: <20190418180057.3593-25-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 18 Apr 2019 18:05:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-QEMU-4.1 v5 24/29] hw/arm: Express
 dependencies for remaining IMX boards with Kconfig
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
X-TUID: bNHR4SZkvKJv

IMX25, IMX7 and IMX6UL were still missing the Kconfig dependencies.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  2 --
 hw/arm/Kconfig                  | 19 +++++++++++++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 1455d083d8..6dc388c43e 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -37,7 +37,6 @@ CONFIG_SABRELITE=3Dy
 CONFIG_EMCRAFT_SF2=3Dy
=20
 CONFIG_VGA=3Dy
-CONFIG_IMX_FEC=3Dy
=20
 CONFIG_NRF51_SOC=3Dy
=20
@@ -49,4 +48,3 @@ CONFIG_PCIE_PORT=3Dy
 CONFIG_XIO3130=3Dy
 CONFIG_IOH3420=3Dy
 CONFIG_I82801B11=3Dy
-CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f5cd63860d..58439c492a 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -283,6 +283,10 @@ config XLNX_VERSAL
=20
 config FSL_IMX25
     bool
+    select IMX
+    select IMX_FEC
+    select IMX_I2C
+    select DS1338
=20
 config FSL_IMX31
     bool
@@ -296,6 +300,7 @@ config FSL_IMX6
     select A9MPCORE
     select IMX
     select IMX_I2C
+    select SDHCI
=20
 config ASPEED_SOC
     bool
@@ -321,12 +326,26 @@ config MPS2
=20
 config FSL_IMX7
     bool
+    imply PCI_DEVICES
+    imply TEST_DEVICES
+    select A15MPCORE
+    select PCI
+    select IMX
+    select IMX_FEC
+    select IMX_I2C
+    select PCI_EXPRESS_DESIGNWARE
+    select SDHCI
=20
 config ARM_SMMUV3
     bool
=20
 config FSL_IMX6UL
     bool
+    select A15MPCORE
+    select IMX
+    select IMX_FEC
+    select IMX_I2C
+    select SDHCI
=20
 config NRF51_SOC
     bool
--=20
2.21.0

