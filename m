Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5330970wrv;
        Wed, 31 Jul 2019 00:57:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx1WJkBDuuumd3aGFju6Hx/pdx+a0dW4B1PwQ3396tHBFsCX4+Q6ntzq5bKlfeA6NN+q2mQ
X-Received: by 2002:a17:906:4354:: with SMTP id z20mr52292635ejm.163.1564559847326;
        Wed, 31 Jul 2019 00:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564559847; cv=none;
        d=google.com; s=arc-20160816;
        b=i+IVDVNoFGEEaGJV5SKrexijqGwzvfvob2UtT39fdftRlByt76gFTe/U9265FN+aNr
         t15oj6TFxoM+Y/LNP+el6sxDavLrbeGyFUXpevovVXVL6kXTCVvCA/+kiSKyZUGfFpG7
         711jy/LlLtHPH5D+3NJKlaB5v0+rI4fqytx+82gszVTuAMhz/kBac8mkez0IwE8C/Mi/
         F6STXSnfcDIQ9Y1NAoezx8ZcLnpz732JXem5iOI1ShJmpv6/xqhkfPJ5s9G/bQntwzC5
         8Qa6yZUAgLDlO/ELh+oNzTmfzktwWpCpbrkd+Ce9JKTxYW3iZ+mp+Iygz+yE9Trq+rJd
         Qzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=8vOG1LNYjRnzuvPBQnPnMlolw7PUPoSfEV7XfYWDy9k=;
        b=oD3LSg9jcyLOvQc6jfSne1v2J1Uwss+5MD0eXRYoU51TvMpgDKiFrgJRc6CuWzl70Z
         jHFCDpqLn5/G0QCK+5aQ1IvATnipkOlafMu+0ueEzLl4icYJmSGROymry6FB9ioKZpiE
         Y/+5vmM4SW38frWMzneDN9xk5n+hnSdbe3kLrA8JP0cQSsRx3rfQCEYo62oH1qj9Gs+F
         ufRaU2wj21GGHmxSUPSWGbFYZof2BfbHK1RlpbSZgnmlRjJ64jCQ8jbrSXMhkZYByvWR
         7j2Iv0odh4T+Poz2mTPGQnL28D8EgYMBK0SrUFMD+E6Exp1E3xOwJjxFcQEl/C4UwYnI
         kR0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si19784170ejk.288.2019.07.31.00.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 00:57:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsjUE-0002J5-E8
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 03:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58693)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hsjU5-0002C2-77
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hsjU4-00082Z-7a
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44532)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hsjU4-00081e-1m; Wed, 31 Jul 2019 03:57:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5E0693022468;
 Wed, 31 Jul 2019 07:57:15 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B26795C1B5;
 Wed, 31 Jul 2019 07:57:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 09:56:49 +0200
Message-Id: <20190731075652.17053-6-thuth@redhat.com>
In-Reply-To: <20190731075652.17053-1-thuth@redhat.com>
References: <20190731075652.17053-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 31 Jul 2019 07:57:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 5/8] hw/core: Add a config switch for the
 "or-irq" device
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c877fGsdUZTp

The "or-irq" device is only used by certain machines. Let's add
a proper config switch for it so that it only gets compiled when we
really need it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig        | 3 +++
 hw/core/Kconfig       | 3 +++
 hw/core/Makefile.objs | 2 +-
 hw/pci-host/Kconfig   | 3 ++-
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ab65ecd216..849195c3f6 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -292,6 +292,7 @@ config RASPI
 config STM32F205_SOC
     bool
     select ARM_V7M
+    select OR_IRQ
     select STM32F2XX_TIMER
     select STM32F2XX_USART
     select STM32F2XX_SYSCFG
@@ -360,6 +361,7 @@ config MPS2
     select LAN9118
     select MPS2_FPGAIO
     select MPS2_SCC
+    select OR_IRQ
     select PL022    # Serial port
     select PL080    # DMA controller
=20
@@ -439,6 +441,7 @@ config ARMSSE
     select IOTKIT_SECCTL
     select IOTKIT_SYSCTL
     select IOTKIT_SYSINFO
+    select OR_IRQ
     select TZ_MPC
     select TZ_MSC
     select TZ_PPC
diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index d11920fcb3..984143456a 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -7,6 +7,9 @@ config PTIMER
 config FITLOADER
     bool
=20
+config OR_IRQ
+    bool
+
 config PLATFORM_BUS
     bool
=20
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index d6cfb2a81b..ce337bd7c9 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -18,7 +18,7 @@ common-obj-$(CONFIG_SOFTMMU) +=3D loader.o
 common-obj-$(CONFIG_FITLOADER) +=3D loader-fit.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-properties-system.o
 common-obj-$(CONFIG_REGISTER) +=3D register.o
-common-obj-$(CONFIG_SOFTMMU) +=3D or-irq.o
+common-obj-$(CONFIG_OR_IRQ) +=3D or-irq.o
 common-obj-$(CONFIG_SOFTMMU) +=3D split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) +=3D platform-bus.o
 common-obj-$(CONFIG_SOFTMMU) +=3D generic-loader.o
diff --git a/hw/pci-host/Kconfig b/hw/pci-host/Kconfig
index 8c16d96b3f..1edc1a31d4 100644
--- a/hw/pci-host/Kconfig
+++ b/hw/pci-host/Kconfig
@@ -2,8 +2,9 @@ config PAM
     bool
=20
 config PREP_PCI
-    select PCI
     bool
+    select PCI
+    select OR_IRQ
=20
 config GRACKLE_PCI
     select PCI
--=20
2.21.0

