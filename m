Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4408154wrh;
        Tue, 30 Apr 2019 00:25:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyb5LnfJKedLjsVZbMpFOUB4TfA/7OC/liWPDWAJftQu6Kjk/UCcLCJmA7K91AHEs1R5CDm
X-Received: by 2002:a5d:4fc3:: with SMTP id h3mr2609152wrw.54.1556609140714;
        Tue, 30 Apr 2019 00:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556609140; cv=none;
        d=google.com; s=arc-20160816;
        b=wQ325Ehg7vppeTMZIy6H5dhOPDBD97NOGmKJEGPCSP6XCYtdstoTdFVA+Bu3/swGvx
         KDlqDj77fTPRw9pfgrIhWoyi9/Sz8irH48BTmqHAwrSPJNuvNIat3L1QfITUAlXjnC3w
         LVAxsKTQNDabuJTENNJDZnrGiB1v2FDvUVZPo3a4k8tRqOS8KtvjKKLmMupIM7bFOj+N
         SL+mGTGho2M/poqqZEP6A1KLVGAWuLViAAoAn1LwRlkp3LHvaqDflv4B2+eA6+IFS8CC
         qG9BfxY7AVsr80ux2tepV0r7KzIAoXwc92BU3bF0N/z3RkB8ZoxI5LQ3J1lfti7IzdK4
         p+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=X5al5OeoBOuaBIUdq3i2MnqRlb3fLNCk1OwOb2kLIQk=;
        b=Ko2pn19K0SjSTH6xHPtkYt8vkBBKO+wqt4KQx1LRal8we+Ezr5UifJ7exoomKIBK2z
         uHDZheLSmL8Y/J0Y/FmW13kB5+gbN2/DS0fjIka/YCnlAtaB9BlvNYq0ET0WvEtg/ve7
         Oq/s/QwvAdcRXEdcxbstKHyDCFGpPLxO1LraRlDJwJKr//8SjtJkSvSPP6CQnCF2kcYh
         ZG/g7/A9Mmli6x85estW+pA1xhPX7f4PrhAYR9/kKpSZCvnFu35qAezumH6INRcdkDR6
         Nn9op1XYQpEf2zxbcMNxzTpi4uI8trTIxz9fFGBOC7JPPkoy3BTwaQtboFcl1HlpJZQp
         GBEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10si4830216wru.323.2019.04.30.00.25.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 00:25:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40492 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLN91-0006X4-Or
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 03:25:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLMzx-0007FQ-Sv
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:16:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hLMzx-0004mL-1Z
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 03:16:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38364)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hLMzw-0004m3-Sc; Tue, 30 Apr 2019 03:16:16 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE5BF3082A32;
	Tue, 30 Apr 2019 07:16:15 +0000 (UTC)
Received: from thuth.com (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8A711001DD2;
	Tue, 30 Apr 2019 07:16:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Tue, 30 Apr 2019 09:13:46 +0200
Message-Id: <20190430071405.16714-12-thuth@redhat.com>
In-Reply-To: <20190430071405.16714-1-thuth@redhat.com>
References: <20190430071405.16714-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 30 Apr 2019 07:16:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 11/30] hw/arm: Express dependencies of
 stellaris with Kconfig
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
X-TUID: cuUDsffzjVUo

This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 11 +++++++++++
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index b7ed3c530b..3f82d635e4 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -16,6 +16,7 @@ CONFIG_MUSCA=3Dy
 CONFIG_CHEETAH=3Dy
 CONFIG_SX1=3Dy
 CONFIG_NSERIES=3Dy
+CONFIG_STELLARIS=3Dy
=20
 CONFIG_VGA=3Dy
 CONFIG_NAND=3Dy
@@ -24,16 +25,10 @@ CONFIG_SERIAL=3Dy
 CONFIG_MAX7310=3Dy
 CONFIG_TMP421=3Dy
 CONFIG_PCA9552=3Dy
-CONFIG_STELLARIS=3Dy
-CONFIG_STELLARIS_INPUT=3Dy
-CONFIG_STELLARIS_ENET=3Dy
-CONFIG_SSD0303=3Dy
-CONFIG_SSD0323=3Dy
 CONFIG_DDC=3Dy
 CONFIG_SII9022=3Dy
 CONFIG_ADS7846=3Dy
 CONFIG_MAX111X=3Dy
-CONFIG_SSI_SD=3Dy
 CONFIG_SSI_M25P80=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 71126254ff..e5a8ae5ef9 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -91,6 +91,17 @@ config REALVIEW
=20
 config STELLARIS
     bool
+    select ARM_V7M
+    select CMSDK_APB_WATCHDOG
+    select I2C
+    select PL011 # UART
+    select PL022 # Serial port
+    select PL061 # GPIO
+    select SSD0303 # OLED display
+    select SSD0323 # OLED display
+    select SSI_SD
+    select STELLARIS_INPUT
+    select STELLARIS_ENET # ethernet
=20
 config STRONGARM
     bool
--=20
2.21.0

