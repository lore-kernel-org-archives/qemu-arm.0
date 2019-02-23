Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7781656wrx;
        Fri, 22 Feb 2019 23:50:37 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZDW6lx+wSNNX67KRg1CSoIjyk9djzCuOMm90yjrCL+ZLBI4QmCRFXB/sIavzSTNgL2lgOP
X-Received: by 2002:a25:e68d:: with SMTP id d135mr4378049ybh.334.1550908237144;
        Fri, 22 Feb 2019 23:50:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908237; cv=none;
        d=google.com; s=arc-20160816;
        b=jCMaTZYHB/jSDyRiYd04BxV0i/1brdFoZETVayy1q6jzsSR4ufAD3m4DGjBQXoG9h9
         tK5OyhyS0qVzcUaYpJR5sReCA4h0YN228lqCcRj0Qva3BKdblNGCmu0VRrPbPJxDay3/
         1UCL5b3QIM7BRlcXtFc46kQ/f48sWq+15nYBaN+Az7rXiDDDSykY62IDYt3ok3xQu7oC
         2YfybV5v2N6GhIBhJ38saJ/DSV5auZdkHXIaW4QTohRVJzbt6uwMg+nzFbEz5kvTmiwH
         QhW9R6zzxPeUiYbPacArmWgViXZliqVCrfgZ1tX/3LLrwvCDQMl/Iw792Kz6levUGAm5
         5dnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=mvdowafB+jdOdpe+ogtjnMmL+imgI63mhcOGcEf4/E4=;
        b=ugUIu5LDmjIEm0PM5u0Hi3fm/2xdetj/C5dhY0joIfxF6v80Dx0XcOAaN6KV7+bzMz
         94Q6Hqwkh1z+5V5EIuL27aoKLs/QXoeMNCPNIRFSCXvkTvDBUZ4DZtbL1Ab2zllsbtjv
         18l8kVdcTaA5JW0/94Cv+FS4IrobIUuFjKjA9PhWgLrsZUEQpm2J1xex01oBHK9G/Y9T
         iG+GNPLv3OsFhjBft79RUs5TkwpXg3T7+DhC5x+IIWOUOdClrvrBpEr+Sxk/nFroHhBI
         FFQ/2c2Tm7lxbN8bJ6eQLsf6f55kpxRuf+dpaGigjT+9jNpo4mfp0UJ3uEY4z81ImdI8
         8tUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6si2100054ybl.194.2019.02.22.23.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:50:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxS4y-0004w7-Hx
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:50:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57035)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS46-0004Tv-3X
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS44-0001pG-7X
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:49:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43672)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS42-0001ka-5g; Sat, 23 Feb 2019 02:49:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8210C3082B52;
	Sat, 23 Feb 2019 07:49:34 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EFED5D9CA;
	Sat, 23 Feb 2019 07:49:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:48:55 +0100
Message-Id: <1550908162-22644-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Sat, 23 Feb 2019 07:49:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 03/30] hw/ide/ahci: Add a Kconfig switch for
 the AHDI-ICH9 device
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZN2XijE5XyIq

Some of our machines (like the ARM cubieboard) use CONFIG_AHCI for an AHCI
sysbus device, but do not use CONFIG_PCI since they do not feature a PCI
bus. With CONFIG_AHCI but without CONFIG_PCI, currently linking fails:

    ../hw/ide/ich.o: In function `pci_ich9_ahci_realize':
    hw/ide/ich.c:124: undefined reference to `pci_allocate_irq'
    hw/ide/ich.c:126: undefined reference to `pci_register_bar'
    hw/ide/ich.c:128: undefined reference to `pci_register_bar'
    hw/ide/ich.c:131: undefined reference to `pci_add_capability'
    hw/ide/ich.c:147: undefined reference to `msi_init'
    ../hw/ide/ich.o: In function `pci_ich9_uninit':
    hw/ide/ich.c:158: undefined reference to `msi_uninit'
    ../hw/ide/ich.o:(.data.rel+0x50): undefined reference to `vmstate_pci_device'

We must only compile ich.c if CONFIG_PCI is available, too, so introduce a
new config switch for this device.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/ide/Kconfig       | 6 +++++-
 hw/ide/Makefile.objs | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index ab47b6a..5d9106b 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -44,9 +44,13 @@ config MICRODRIVE
 
 config AHCI
     bool
+    select IDE_QDEV
+
+config AHCI_ICH9
+    bool
     default y if PCI_DEVICES
     depends on PCI
-    select IDE_QDEV
+    select AHCI
 
 config IDE_SII3112
     bool
diff --git a/hw/ide/Makefile.objs b/hw/ide/Makefile.objs
index a142add..faf04e0 100644
--- a/hw/ide/Makefile.objs
+++ b/hw/ide/Makefile.objs
@@ -9,6 +9,6 @@ common-obj-$(CONFIG_IDE_MMIO) += mmio.o
 common-obj-$(CONFIG_IDE_VIA) += via.o
 common-obj-$(CONFIG_MICRODRIVE) += microdrive.o
 common-obj-$(CONFIG_AHCI) += ahci.o
-common-obj-$(CONFIG_AHCI) += ich.o
+common-obj-$(CONFIG_AHCI_ICH9) += ich.o
 common-obj-$(CONFIG_ALLWINNER_A10) += ahci-allwinner.o
 common-obj-$(CONFIG_IDE_SII3112) += sii3112.o
-- 
1.8.3.1

