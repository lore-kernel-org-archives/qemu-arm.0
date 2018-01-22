Received: by 10.28.71.27 with SMTP id u27csp2930361wma;
        Mon, 22 Jan 2018 07:27:58 -0800 (PST)
X-Google-Smtp-Source: AH8x224uJK+vECTrIjULx7c9aAzRMzfDIbBZU3hoj+KY61ygaE92lsLgg/HthFwvLrpBLgYo015Q
X-Received: by 10.129.61.7 with SMTP id k7mr7580167ywa.457.1516634878891;
        Mon, 22 Jan 2018 07:27:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516634878; cv=none;
        d=google.com; s=arc-20160816;
        b=ESuhJKLXA1nkP8nMrvyq1UMs78lA436COl78PdxAdeDXqDeGrDnxinq4dAAFJkveZB
         B+wBkuby6IQbecVUrZ1bTjDdrtOcQ1Esmu9l5LqVy3vM3z1L3V0vf+ehpLvGNawk6sFT
         UXMUgQ6AkRRmqhIqCS/zawIUt7WWeZmMki0Nr3cN54kJejhbjzSATbiMplEwkeWxh4U3
         Oq4Q5hcuSDPH7e2fD0xEf35gbERzLlM9WToufhe+vSCoaEnKVdTZsQIooDVYjZz2ww77
         sB6ZluuImm4nUl8oDsOara2TOvVA4lNEykKnV5ZJdvcYF3bVsVUsikFiac0B5NM+3FtT
         Hf3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=1BbCHHsROp7qLCDbTVFyVdNZGEm+PAB1a1HcnsdBfcc=;
        b=fVtTtxyNwi3dRV44JhW9rs4BySSV9CvDwzsjLBODWyQH2Ice4NMxNRZ5SDt5BqHocj
         XqDL7GuyDQdAFNqp+S5r/EgOoHQbAGIib/vmtvGXo4vC4xVfHMulMuE1QFI50VLPgKIo
         Q379vpy7VonAUb8iKKGMAM6LotumH8pplXQiqcaaBLEv6KiyDyZXwNtUS3itZvNkNVt7
         ZC+5rzRVWBlWNbIAPA7IrUtZUq4R2Y5PkRC3avNY4K8rdqtGXq4i4L2InEwmeAw5Y7cV
         UYAgmcNI9MbsxR1N3NPJSdLouLnchpE9rUAluju9TkqP9+0zTH0axXRSkjyAR3Chnuz4
         cpEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n184si2033005ybn.336.2018.01.22.07.27.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 07:27:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ede0s-0001TY-5l
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 10:27:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ede0c-0001Rw-DS
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 10:27:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ede0X-00042X-GZ
	for qemu-arm@nongnu.org; Mon, 22 Jan 2018 10:27:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37084)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ede0X-000425-7N; Mon, 22 Jan 2018 10:27:37 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D0B166854;
	Mon, 22 Jan 2018 15:27:36 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F3AA95DA2A;
	Mon, 22 Jan 2018 15:27:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jan 2018 16:27:33 +0100
Message-Id: <1516634853-15883-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 22 Jan 2018 15:27:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] i2c: Add a CONFIG_I2C master switch to the
 configuration files
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iRwo0bgFKYaJ

The i2c core and the at24c EEPROM should only be compiled and linked
on the machines that support i2c. Otherwise it's quite strange to see
the at24c-eeprom to be "available" on qemu-system-s390x for example.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak         | 1 +
 default-configs/i386-softmmu.mak        | 1 +
 default-configs/mips-softmmu-common.mak | 1 +
 default-configs/ppc-softmmu.mak         | 1 +
 default-configs/ppcemb-softmmu.mak      | 1 +
 default-configs/x86_64-softmmu.mak      | 1 +
 hw/i2c/Makefile.objs                    | 2 +-
 hw/nvram/Makefile.objs                  | 2 +-
 8 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index b0d6e65..ca34cf4 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -67,6 +67,7 @@ CONFIG_CADENCE=y
 CONFIG_XGMAC=y
 CONFIG_EXYNOS4=y
 CONFIG_PXA2XX=y
+CONFIG_I2C=y
 CONFIG_BITBANG_I2C=y
 CONFIG_FRAMEBUFFER=y
 CONFIG_XILINX_SPIPS=y
diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmmu.mak
index 95ac4b4..4bc8f25 100644
--- a/default-configs/i386-softmmu.mak
+++ b/default-configs/i386-softmmu.mak
@@ -61,3 +61,4 @@ CONFIG_HYPERV_TESTDEV=$(CONFIG_KVM)
 CONFIG_PXB=y
 CONFIG_ACPI_VMGENID=y
 CONFIG_FW_CFG_DMA=y
+CONFIG_I2C=y
diff --git a/default-configs/mips-softmmu-common.mak b/default-configs/mips-softmmu-common.mak
index 7d8f5db..e31f046 100644
--- a/default-configs/mips-softmmu-common.mak
+++ b/default-configs/mips-softmmu-common.mak
@@ -34,3 +34,4 @@ CONFIG_ISA_TESTDEV=y
 CONFIG_EMPTY_SLOT=y
 CONFIG_MIPS_CPS=y
 CONFIG_MIPS_ITU=y
+CONFIG_I2C=y
diff --git a/default-configs/ppc-softmmu.mak b/default-configs/ppc-softmmu.mak
index 3baed6a..65680d8 100644
--- a/default-configs/ppc-softmmu.mak
+++ b/default-configs/ppc-softmmu.mak
@@ -23,6 +23,7 @@ CONFIG_PLATFORM_BUS=y
 CONFIG_ETSEC=y
 CONFIG_SM501=y
 CONFIG_IDE_SII3112=y
+CONFIG_I2C=y
 
 # For Macs
 CONFIG_MAC=y
diff --git a/default-configs/ppcemb-softmmu.mak b/default-configs/ppcemb-softmmu.mak
index 5db4618..bc5e1b3 100644
--- a/default-configs/ppcemb-softmmu.mak
+++ b/default-configs/ppcemb-softmmu.mak
@@ -17,3 +17,4 @@ CONFIG_XILINX=y
 CONFIG_XILINX_ETHLITE=y
 CONFIG_SM501=y
 CONFIG_IDE_SII3112=y
+CONFIG_I2C=y
diff --git a/default-configs/x86_64-softmmu.mak b/default-configs/x86_64-softmmu.mak
index 0221236..f0b7bcd 100644
--- a/default-configs/x86_64-softmmu.mak
+++ b/default-configs/x86_64-softmmu.mak
@@ -61,3 +61,4 @@ CONFIG_HYPERV_TESTDEV=$(CONFIG_KVM)
 CONFIG_PXB=y
 CONFIG_ACPI_VMGENID=y
 CONFIG_FW_CFG_DMA=y
+CONFIG_I2C=y
diff --git a/hw/i2c/Makefile.objs b/hw/i2c/Makefile.objs
index 0594dea..37cacde 100644
--- a/hw/i2c/Makefile.objs
+++ b/hw/i2c/Makefile.objs
@@ -1,4 +1,4 @@
-common-obj-y += core.o smbus.o smbus_eeprom.o
+common-obj-$(CONFIG_I2C) += core.o smbus.o smbus_eeprom.o
 common-obj-$(CONFIG_DDC) += i2c-ddc.o
 common-obj-$(CONFIG_VERSATILE_I2C) += versatile_i2c.o
 common-obj-$(CONFIG_ACPI_X86) += smbus_ich9.o
diff --git a/hw/nvram/Makefile.objs b/hw/nvram/Makefile.objs
index 0f4ee71..a912d25 100644
--- a/hw/nvram/Makefile.objs
+++ b/hw/nvram/Makefile.objs
@@ -1,6 +1,6 @@
 common-obj-$(CONFIG_DS1225Y) += ds1225y.o
 common-obj-y += eeprom93xx.o
-common-obj-y += eeprom_at24c.o
+common-obj-$(CONFIG_I2C) += eeprom_at24c.o
 common-obj-y += fw_cfg.o
 common-obj-y += chrp_nvram.o
 common-obj-$(CONFIG_MAC_NVRAM) += mac_nvram.o
-- 
1.8.3.1

