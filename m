Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7795522wrx;
        Sat, 23 Feb 2019 00:11:45 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib2vHyYUvu48TqrMR2y+kLHfyo9HA0UMPpiyPsE/QJ0E+0vAnvNvBVMH+MkvR/oJl65CF/B
X-Received: by 2002:a25:8148:: with SMTP id j8mr6444411ybm.202.1550909505240;
        Sat, 23 Feb 2019 00:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550909505; cv=none;
        d=google.com; s=arc-20160816;
        b=gPr9e0cwmifzQqPKVYiJYXbwmj6Tjt86dl4aCNQcMW+hkIUU0IxVk2P/IvSGcsyLzT
         /XvOWJrzRTb2BV7qb9GUVlxH1jw+HJuYdu2q/bmesBBBXQ4uFS1rt2Q5udtkLoEaCb2W
         F/2g0TFuOxVinkg52Ff1duHu8QaxRJkKP4ES5YV5gMCg/mYl69RqIj1Yw4IdYagA9/q1
         +p4qaKt0IXTyG4J97F2aO91y7AdDPHZvDg5lO8kHb+WkgEareJWMAPZjg3kEciIud6WB
         /JNSO6/vyHinAHnwW9NvaxWYt0Dm+pBfr/KGma29KejDDwhZFJTtDhveQXUa40IiVJTU
         44Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=hC7dUpTd62DRtFAGniQpovBhq03idPWf1/6JlgH+kYA=;
        b=JJ1tZctM+pPWg+a2esFpCEUZn69i7jbhRvCth0axR3uMi0F9JlhZLRgSYao09xjwMM
         vsmR1nRuiZr3TLpMuno1iM2M4S8Iad0F1lISR9TULJFkKTr3MdBS7vyogEQujIqWpt0e
         7qcXViC/GRQfAAsa3V7CbA4Cu0wH/71gz2DujHe2p7WMCNkm5eoW7bVUqK36YLNqh6+j
         RHkZgm9UfqxiFE4hNGwBvUoEEZnX55V2/GDnLndzW5omPi29e6cJpNnfrcoh5OGxJvwY
         mu2eQjTOkJiPTJG7px+idi064EmcwzjnhtxLsDuzpHqzrl36t2Gciz9VTcVNb7SI7uYv
         sqIg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p123si1476304ybg.456.2019.02.23.00.11.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Feb 2019 00:11:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSPQ-0004YJ-M1
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 03:11:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS5C-0005Ny-Bo
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS5B-0002xL-Gc
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS5B-0002cK-8x; Sat, 23 Feb 2019 02:50:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C42DB3095870;
	Sat, 23 Feb 2019 07:50:22 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 688865D9CA;
	Sat, 23 Feb 2019 07:50:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:19 +0100
Message-Id: <1550908162-22644-28-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Sat, 23 Feb 2019 07:50:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 27/30] hw/arm: Express dependencies of the
 ZynqMP zcu102 machine with Kconfig
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
X-TUID: xECLJJYNeTYQ

This cleans up most settings in default-configs/aarch64-softmmu.mak.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/aarch64-softmmu.mak |  4 ----
 hw/arm/Kconfig                      | 11 +++++++++++
 hw/display/Kconfig                  |  1 +
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
index 4ea9add..3a4b15e 100644
--- a/default-configs/aarch64-softmmu.mak
+++ b/default-configs/aarch64-softmmu.mak
@@ -3,10 +3,6 @@
 # We support all the 32 bit boards so need all their config
 include arm-softmmu.mak
 
-CONFIG_AUX=y
-CONFIG_DDC=y
-CONFIG_DPCD=y
-CONFIG_XLNX_ZYNQMP=y
 CONFIG_XLNX_ZYNQMP_ARM=y
 CONFIG_XLNX_VERSAL=y
 CONFIG_ARM_SMMUV3=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 5ce6245..744b5ff 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -289,6 +289,17 @@ config STM32F205_SOC
 
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
 
 config XLNX_VERSAL
     bool
diff --git a/hw/display/Kconfig b/hw/display/Kconfig
index a5f3fc0..d2ae2f1 100644
--- a/hw/display/Kconfig
+++ b/hw/display/Kconfig
@@ -108,3 +108,4 @@ config VIRTIO_VGA
 
 config DPCD
     bool
+    select AUX
-- 
1.8.3.1

