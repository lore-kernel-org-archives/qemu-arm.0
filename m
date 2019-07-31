Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5332098wrv;
        Wed, 31 Jul 2019 00:58:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVgcFCxJml2o+osMuKjNYjhGN8garWW2pvSNDNP9jLzellE+uauzvJk+1ubODncYmANCX7
X-Received: by 2002:a17:906:430a:: with SMTP id j10mr8771916ejm.92.1564559914715;
        Wed, 31 Jul 2019 00:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564559914; cv=none;
        d=google.com; s=arc-20160816;
        b=gUrK8IiJN7s6ugvDyDt/3XqGqudkXTzL78QBGzmxmoTAmpBGhhSCcfgrT8W1LPeoif
         UJYJWTBhGKEwgjHoL357T5ia5hjIo0VAPsnEQhpFvO32fI6G9IO6pz8EnfTY8LyPeYwm
         W5Gz/XH6eQyarfLsVI+JnZ4/M9BsiuihPlwLRCy3J1FyWVyYRdwv8XbO+I1ixwkuH9Xk
         KEuW9hY5C3EKNoAWomuCjy5G4XArpG7/stmksKnvbaJRcOYyRAvBjR25KnVTZN0napu7
         AJY3O8LxGUDYOs6ixTDGPTGiEwhydKn3qBhkz2eOX5VnWRzkDF8ecVpL4DxeIyJWCJiS
         zKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=syeagK6yvsioh49Kr4lCcqHwNuBS79TVGrgpF7RNj1M=;
        b=PffL5sorsTrfR8IRHYZdVMIeHzh/HiJND68R0LVjbNbcx6YkMFpGz34Cq58RnK6ifh
         PqLVPZLEQhACc2Or9g0DLbgFNHrNIT5axWp7MCT0ocv9JJ8xn/mNgOyZrIlUd5gd06BH
         IJ6QhkRacQqa3pd5cK4UA/exRS4WtW6TuC8r2J43gNZ/x18yhN8P/EsuKgJaKF66vjbY
         C2D2sflF0PVPB4sK1diHgchOnF+F91oOFC4QxhFq/XJmPgn3/zphOginRDSmBywPha/r
         JZxD3fZmyx73+SGJnsEUZAgzy73R/84NxFnLiUKm43cmiN0ulWXfUPXMegnowXbnUI9I
         ZsqA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14si20277977edd.22.2019.07.31.00.58.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jul 2019 00:58:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hsjVJ-0004xf-RZ
	for alex.bennee@linaro.org; Wed, 31 Jul 2019 03:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58670)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <thuth@redhat.com>) id 1hsjU3-00025z-AT
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hsjU2-00080Q-AZ
 for qemu-arm@nongnu.org; Wed, 31 Jul 2019 03:57:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33434)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hsjU2-000809-5R; Wed, 31 Jul 2019 03:57:14 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7007FA7D5;
 Wed, 31 Jul 2019 07:57:13 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1F915C1B5;
 Wed, 31 Jul 2019 07:57:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 09:56:48 +0200
Message-Id: <20190731075652.17053-5-thuth@redhat.com>
In-Reply-To: <20190731075652.17053-1-thuth@redhat.com>
References: <20190731075652.17053-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 31 Jul 2019 07:57:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v2 4/8] hw/core: Add a config switch for the
 "register" device
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
X-TUID: +h3JhOELycQq

The "register" device is only used by certain machines. Let's add
a proper config switch for it so that it only gets compiled when we
really need it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/Kconfig            | 1 +
 hw/core/Kconfig       | 3 +++
 hw/core/Makefile.objs | 2 +-
 hw/dma/Kconfig        | 1 +
 4 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/Kconfig b/hw/Kconfig
index dbae1c0852..b45db3c813 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -76,3 +76,4 @@ config XILINX_AXI
=20
 config XLNX_ZYNQMP
     bool
+    select REGISTER
diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index c2a1ae8122..d11920fcb3 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -9,3 +9,6 @@ config FITLOADER
=20
 config PLATFORM_BUS
     bool
+
+config REGISTER
+    bool
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index f8481d959f..d6cfb2a81b 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -17,7 +17,7 @@ common-obj-$(CONFIG_SOFTMMU) +=3D machine.o
 common-obj-$(CONFIG_SOFTMMU) +=3D loader.o
 common-obj-$(CONFIG_FITLOADER) +=3D loader-fit.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-properties-system.o
-common-obj-$(CONFIG_SOFTMMU) +=3D register.o
+common-obj-$(CONFIG_REGISTER) +=3D register.o
 common-obj-$(CONFIG_SOFTMMU) +=3D or-irq.o
 common-obj-$(CONFIG_SOFTMMU) +=3D split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) +=3D platform-bus.o
diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
index 751dec5426..5c61b67bc0 100644
--- a/hw/dma/Kconfig
+++ b/hw/dma/Kconfig
@@ -16,6 +16,7 @@ config I8257
=20
 config ZYNQ_DEVCFG
     bool
+    select REGISTER
=20
 config STP2000
     bool
--=20
2.21.0

