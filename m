Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp937356wrx;
        Thu, 18 Apr 2019 11:18:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyGy7TMgCzcxE4kmVK4l/BBGsDEAZ7XSJrTo0Lp08RHQ/r6IXfmgvm0zi6G7mZHgxF6RLlB
X-Received: by 2002:a5d:5712:: with SMTP id a18mr7201031wrv.219.1555611483255;
        Thu, 18 Apr 2019 11:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555611483; cv=none;
        d=google.com; s=arc-20160816;
        b=ofdhBy6TgAaPnPCtsDrYV2u96ZHvii8mhzovc1U8pTo1E4sLQngq0RYNgd5O3wN91l
         BjO5YIR7LvTHpIUm2n+K9iHf2jidIkaQgIyoUd3Mm0BaGEhsDzO0+Xhr3bUMqv+hFwlJ
         in7NlGlFoJXupGTle++65OLpT6azPnf501VZh3SQJFhk1mdx4c1RwLRGv0z3oQt9q+6j
         9y6oiwP6a2WKoYvgz1eQf2mi/0ykCXKwZxRg6rc5wKVZDCUJTj/XGr2umKgINpxYoTUM
         M37ExZ6BP68wkQ7cC6kc49wkS3l78zkOOgqe8xbD+7CJJi19uSp3Q86YCEwGId7CZ+F2
         JZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=BpR6IRfTUOhSnbvwDaGSSvmq33RjOeqrMzXMC5CZqiA=;
        b=t4ALkjqCq6a/5fPczzZSO/iBXfUnl33Ndwja/lHf6OpE7F/UZkoc+EOoWRwBkSu2id
         +yf8fkq2p+KAqmI3Yi44GpUK4CY/bPQKwU3gi5Dw0TYRTyQQmTlVIo/D3BwTNUzRLoFR
         hqCU+3b2/GOSbBElIWiceEeAMB4SpQTsyHQhVPDdWqzOTd0zyD6svCyoPBfX5EqoW81H
         fYdY8t/+vNVKywBDK8Pakg2fs8vFM4y7zfU6pwmJZ5q12bpSDOTawz95lqf/PLD5I+LX
         g+TJQeu+JSoDP5QyPTpIMdogJfj7TCFEHXHET+xNJB8B04JEpNMdW1spsuWKQzAn6Q5r
         x8gA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si2333859wru.110.2019.04.18.11.18.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:18:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBbm-00072L-8a
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:18:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBPu-0005uX-VN
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 14:05:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBPu-0003td-0A
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 14:05:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46174)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBPl-0003pA-Dv; Thu, 18 Apr 2019 14:05:38 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF349C05FF80;
	Thu, 18 Apr 2019 18:05:35 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBA751001E66;
	Thu, 18 Apr 2019 18:05:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:54 +0200
Message-Id: <20190418180057.3593-27-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 18 Apr 2019 18:05:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-QEMU-4.1 v5 26/29] hw/arm: Express
 dependencies of the ZynqMP zcu102 machine with Kconfig
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
X-TUID: zUybvXtNxnrc

This cleans up most settings in default-configs/aarch64-softmmu.mak.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/aarch64-softmmu.mak |  4 ----
 hw/arm/Kconfig                      | 11 +++++++++++
 hw/display/Kconfig                  |  1 +
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch6=
4-softmmu.mak
index 4ea9add003..3a4b15e7e8 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -3,10 +3,6 @@
 # We support all the 32 bit boards so need all their config
 include arm-softmmu.mak
=20
-CONFIG_AUX=3Dy
-CONFIG_DDC=3Dy
-CONFIG_DPCD=3Dy
-CONFIG_XLNX_ZYNQMP=3Dy
 CONFIG_XLNX_ZYNQMP_ARM=3Dy
 CONFIG_XLNX_VERSAL=3Dy
 CONFIG_ARM_SMMUV3=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 708eae19e5..32e4cc50e5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -277,6 +277,17 @@ config STM32F205_SOC
=20
 config XLNX_ZYNQMP_ARM
     bool
+    select AHCI
+    select ARM_GIC
+    select CADENCE
+    select DDC
+    select DPCD
+    select SDHCI
+    select SSI
+    select SSI_M25P80
+    select XILINX_AXI
+    select XILINX_SPIPS
+    select XLNX_ZYNQMP
=20
 config XLNX_VERSAL
     bool
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index 0577e68c8e..bb95f8d6a4 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -108,6 +108,7 @@ config VIRTIO_VGA
=20
 config DPCD
     bool
+    select AUX
=20
 config ATI_VGA
     bool
--=20
2.21.0

