Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3806844wrg;
        Tue, 14 May 2019 03:00:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBiRdIVT9ygZDJ+u90DOMOUY3j8dnoj8w3e4PgcsS3zQSNWq3qBLbV6PCLNg42EINhgSRX
X-Received: by 2002:a17:906:6781:: with SMTP id q1mr26726566ejp.267.1557828055047;
        Tue, 14 May 2019 03:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557828055; cv=none;
        d=google.com; s=arc-20160816;
        b=IPrv6U9QyDHP3Kgl8lBucCjJCHG/n58C+itP7GZBF37J1IJYuJjLpouRUvngKngVFS
         uRKbCUJgUb1UJQsiiYbKBnIxn7NBAotWH0kqH2zOiBiNRQF8YS8U+qNa8kgkklj9gjTl
         t80g14bMH44X1SkDMYEmOT8YcKo7WZFIY4jSTBHW/dOQlwAKLuvT47OQBIULwZ087u4x
         zs3YF4+4iajhJGXNrjCaJQnf98XozHGnRaFRYpG5rBUipYThvXH5NKQmu1tCfyLwD+vk
         St80c4IGtKVXhd+jTP+akCeoGVflqSwB5sWyapR7rtq8GqiqruPlN1/TKCcwIg49MmX+
         qvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=CHuHcZ8z1G/gZyAcP8m0NguS2aXSsn8ECAT4gmAhZ3Y=;
        b=p09H/yPVU488po6U+FWDEnTi4Md9mVVuQa5mv1tZaLfhxA/DGyYhWIwu6D+ujccE5I
         nvP1lkXj6zlbzhXNVfbNFciHJNG6owiES3X3eZUyTvxAicZYNznFjxKI2ns2f9/BKAD6
         TiIaXwIhhVUBa5xg0NsfRzFO2TE2ci8b3b/dET3M5k//PrYYfEPNup76Ex8moxFdSYTO
         t/ZvQVLzb3sCNrxWzmUK+jbJQv9W+qvfhsj21qNA06oYIRfsV/H8ycnT9d1KTy3BrYnI
         r3yjNWZd9zeoWRJwdPYU1C0uku2mEuMfSjjmRFW/ZehLpebCEKCGciimkPMDMaprHeVP
         KzVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11si5492723edj.412.2019.05.14.03.00.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 03:00:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQUEw-0006VU-4W
	for alex.bennee@linaro.org; Tue, 14 May 2019 06:00:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQUEg-0006UP-Hp
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:00:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hQUEf-0003i2-FP
	for qemu-arm@nongnu.org; Tue, 14 May 2019 06:00:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54112)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hQUEf-0003g7-A4; Tue, 14 May 2019 06:00:37 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B987309B151;
	Tue, 14 May 2019 10:00:36 +0000 (UTC)
Received: from thuth.com (ovpn-116-85.ams2.redhat.com [10.36.116.85])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B80445C207;
	Tue, 14 May 2019 10:00:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Date: Tue, 14 May 2019 12:00:17 +0200
Message-Id: <20190514100019.13263-3-thuth@redhat.com>
In-Reply-To: <20190514100019.13263-1-thuth@redhat.com>
References: <20190514100019.13263-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 14 May 2019 10:00:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/4] hw/core: Add a config switch for the
 "or-irq" device
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Trh9n5NsWnqC

The "or-irq" device is only used by certain machines. Let's add
a proper config switch for it so that it only gets compiled when we
really need it.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/Kconfig        | 2 ++
 hw/core/Kconfig       | 3 +++
 hw/core/Makefile.objs | 2 +-
 hw/pci-host/Kconfig   | 3 ++-
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index af8cffde9c..0bb3bbe9d3 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -277,6 +277,7 @@ config RASPI
 config STM32F205_SOC
     bool
     select ARM_V7M
+    select OR_IRQ
     select STM32F2XX_TIMER
     select STM32F2XX_USART
     select STM32F2XX_SYSCFG
@@ -424,6 +425,7 @@ config ARMSSE
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
index d493a051ee..dd2c2ca812 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -17,7 +17,7 @@ common-obj-$(CONFIG_SOFTMMU) +=3D loader.o
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

