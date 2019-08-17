Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp452679wrs;
        Sat, 17 Aug 2019 03:20:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzbWYyw2WrDZKkwMPx8fyal5xgaB+9VfTJdbZSrDKFA+awKOAUYT+jYYq8LQEZPGX9ye1wR
X-Received: by 2002:a37:a483:: with SMTP id n125mr13435533qke.329.1566037213212;
        Sat, 17 Aug 2019 03:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566037213; cv=none;
        d=google.com; s=arc-20160816;
        b=dwyBFhfc7k49Eb7xzoONvonyWcqP6uHGs8Z5YYq/nlb6xtu4O+lU9Q80MenTpMCETk
         7+cieDYD6b+pRSNEx+ISxwZ+Cd25iE2/2ojJfYIyRaZQwsi+otOQWzxxYuNldu/Wl/kc
         Lm6wkWpnjfJlDTtGKPPyKuDXBqtph+qaO0g3zwvYQpaM6MKZhg0neG5uINKTgptLY8UT
         qvPTvaTtc6dwbGJ3l9wOE7XIEcMBl3npm94ngGTejXpJ0gnKQ/zMTG89+2Kf49PJ31zr
         AKLuPQTc/2QQGa1gETiCw/8CwlSWuhBMWXMoL7q82jpOQMQrWxzd43TOo1PpSpRQnLIU
         tSKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=JWRXL1h78cpvosJfCqAYmpvYG1K+KoUPsCS2BKh0AcU=;
        b=omLDuuhFmM0EFIUSLZ+alM5hIpG2GHz2G7eyvsRNwjGxkghOzehua9RvB4xfM3hNMZ
         +Sl36MZLoeRgXwmLX3f1FXr56JfwSSfwgomoRGEQv8Q0TE5GBV5fdVaGXhRnzVxPfhVE
         RtChMAmlREA7UVqMpdPBkiJt5N67U6L3khl0Bj+Of9DyoFBDpK/Hb7ba2fdiMMhrxIzr
         y7hzVQkDmi75HZMoUudN/BxTEfiCEIfS6DjzvdWSi7759qtLIltdbdNlD3tNg7N1FPaS
         kDzkDa1s4eJ8Aj07w5aCGKL7tMnTmu9/nWAQWaMr17oH9iKev7OZT0YAqHzdncDmgUsa
         AWlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a20si5131661qth.311.2019.08.17.03.20.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2019 03:20:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyvoi-0000us-6o
	for alex.bennee@linaro.org; Sat, 17 Aug 2019 06:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58119)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hyvoP-0000n0-La
 for qemu-arm@nongnu.org; Sat, 17 Aug 2019 06:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hyvoO-0004Uv-MB
 for qemu-arm@nongnu.org; Sat, 17 Aug 2019 06:19:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46106)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hyvoO-0004Tm-H6; Sat, 17 Aug 2019 06:19:52 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 101683083394;
 Sat, 17 Aug 2019 10:19:51 +0000 (UTC)
Received: from thuth.com (ovpn-116-52.ams2.redhat.com [10.36.116.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF21BD1E5;
 Sat, 17 Aug 2019 10:19:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Sat, 17 Aug 2019 12:19:27 +0200
Message-Id: <20190817101931.28386-5-thuth@redhat.com>
In-Reply-To: <20190817101931.28386-1-thuth@redhat.com>
References: <20190817101931.28386-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Sat, 17 Aug 2019 10:19:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 4/8] hw/core: Add a config switch for the
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
X-TUID: TMYgwNt8Oipv

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
 
 config XLNX_ZYNQMP
     bool
+    select REGISTER
diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index c2a1ae8122..d11920fcb3 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -9,3 +9,6 @@ config FITLOADER
 
 config PLATFORM_BUS
     bool
+
+config REGISTER
+    bool
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index f8481d959f..d6cfb2a81b 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -17,7 +17,7 @@ common-obj-$(CONFIG_SOFTMMU) += machine.o
 common-obj-$(CONFIG_SOFTMMU) += loader.o
 common-obj-$(CONFIG_FITLOADER) += loader-fit.o
 common-obj-$(CONFIG_SOFTMMU) += qdev-properties-system.o
-common-obj-$(CONFIG_SOFTMMU) += register.o
+common-obj-$(CONFIG_REGISTER) += register.o
 common-obj-$(CONFIG_SOFTMMU) += or-irq.o
 common-obj-$(CONFIG_SOFTMMU) += split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) += platform-bus.o
diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
index 751dec5426..5c61b67bc0 100644
--- a/hw/dma/Kconfig
+++ b/hw/dma/Kconfig
@@ -16,6 +16,7 @@ config I8257
 
 config ZYNQ_DEVCFG
     bool
+    select REGISTER
 
 config STP2000
     bool
-- 
2.18.1

