Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp454492wrs;
        Sat, 17 Aug 2019 03:22:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyyes4jiS+/VVJ3PGhEmkDEbqhfEsEdJ3BMai8mzNYPKD/c5MBNtNoycz3+0E4HWX/lR4kO
X-Received: by 2002:a17:906:2a8f:: with SMTP id l15mr9955792eje.146.1566037370183;
        Sat, 17 Aug 2019 03:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566037370; cv=none;
        d=google.com; s=arc-20160816;
        b=cdb5/MzQZbD+/DMeE7ClCYBwEE78cImJUSu9twHE9fIbrWaGAyGKXgSwnTELOJoty4
         UnCUf6JItN1eFnly0Lm9j0o50cocyrmA6NUGcUXb2m3Jt8xjuvwEzThbdsGVUSF7Y8Sn
         HojI9oJG7P6J6SWs9RgpPfBpLYmNN6ybtwflT7YbkSIZu/7NmXZOfDjORdOLt+W4g1fc
         JJyqmYQLW0eA3zQb0pKjis/q2bqQKJ8tpsLXmeyrL8ohX9LIQ8lI7GBSIqUgGDrpUHlE
         OnCcR3JB46kCRlu0XixCYJB4bQJysHNNXhUs3Gwcbe9YkNw23ug71FSzsw2CaV26t1YY
         S9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=CugeDc+tqT8yGJfqQQk5nSqyuqmz3Tno7nY4KDwC9TI=;
        b=u4hfoAmtchqiZksQA4rd8PuNxZmZ5dz1qOKsJ9bbE0vFssQfF1WXsoykh5mNpYF3mI
         m0iN4nWbO8HgXry14EmsC2M58z+MJ5+Q98HNzKQwIsyPRQuLfgaQ3S1kgI9GrGDAEcEc
         yvIF9hEAJUsm5pnl4W/1xiF1bWFqb1UCni8UEUbyBdAPSkJ3Kz0FHqafg+aqlHMy4EJH
         40onAlisjYPc5FHazhE3oOqUqsq+NqRuys9l+E4HoorMt0B1bps1ubGmAH3MOVEjre7P
         VNdzKIBITWkZGHqPboCycWxbbMwhpRrsSY93mIjNv35fXshstLVFUzIfLLQ7W7tiYrW6
         hNCw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13si4212474eja.284.2019.08.17.03.22.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2019 03:22:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyvrE-0004sT-Ua
	for alex.bennee@linaro.org; Sat, 17 Aug 2019 06:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58177)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1hyvoX-0000w5-6P
 for qemu-arm@nongnu.org; Sat, 17 Aug 2019 06:20:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1hyvoW-0004cI-41
 for qemu-arm@nongnu.org; Sat, 17 Aug 2019 06:20:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1hyvoV-0004bl-VH; Sat, 17 Aug 2019 06:20:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4091281F0F;
 Sat, 17 Aug 2019 10:19:59 +0000 (UTC)
Received: from thuth.com (ovpn-116-52.ams2.redhat.com [10.36.116.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5569D1E5;
 Sat, 17 Aug 2019 10:19:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Date: Sat, 17 Aug 2019 12:19:29 +0200
Message-Id: <20190817101931.28386-7-thuth@redhat.com>
In-Reply-To: <20190817101931.28386-1-thuth@redhat.com>
References: <20190817101931.28386-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Sat, 17 Aug 2019 10:19:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 6/8] hw/core: Add a config switch for the
 "split-irq" device
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
X-TUID: jtVGobzpeuEb

The "split-irq" device is currently only used by machines that use
CONFIG_ARMSSE. Let's add a proper CONFIG_SPLIT_IRQ switch for this
so that it only gets compiled when we really need it.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig        | 3 +++
 hw/core/Kconfig       | 3 +++
 hw/core/Makefile.objs | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 849195c3f6..6e24c73b54 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -81,6 +81,7 @@ config MUSCA
     select ARMSSE
     select PL011
     select PL031
+    select SPLIT_IRQ
=20
 config MUSICPAL
     bool
@@ -364,6 +365,7 @@ config MPS2
     select OR_IRQ
     select PL022    # Serial port
     select PL080    # DMA controller
+    select SPLIT_IRQ
=20
 config FSL_IMX7
     bool
@@ -442,6 +444,7 @@ config ARMSSE
     select IOTKIT_SYSCTL
     select IOTKIT_SYSINFO
     select OR_IRQ
+    select SPLIT_IRQ
     select TZ_MPC
     select TZ_MSC
     select TZ_PPC
diff --git a/hw/core/Kconfig b/hw/core/Kconfig
index 984143456a..fffb3d62b2 100644
--- a/hw/core/Kconfig
+++ b/hw/core/Kconfig
@@ -15,3 +15,6 @@ config PLATFORM_BUS
=20
 config REGISTER
     bool
+
+config SPLIT_IRQ
+    bool
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index ce337bd7c9..bb1afe422a 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -19,7 +19,7 @@ common-obj-$(CONFIG_FITLOADER) +=3D loader-fit.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-properties-system.o
 common-obj-$(CONFIG_REGISTER) +=3D register.o
 common-obj-$(CONFIG_OR_IRQ) +=3D or-irq.o
-common-obj-$(CONFIG_SOFTMMU) +=3D split-irq.o
+common-obj-$(CONFIG_SPLIT_IRQ) +=3D split-irq.o
 common-obj-$(CONFIG_PLATFORM_BUS) +=3D platform-bus.o
 common-obj-$(CONFIG_SOFTMMU) +=3D generic-loader.o
 common-obj-$(CONFIG_SOFTMMU) +=3D null-machine.o
--=20
2.18.1

