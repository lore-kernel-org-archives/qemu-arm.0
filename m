Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp296949wrq;
        Fri, 8 Feb 2019 22:48:56 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbsiNHJ1Xz2XFHejxKeJP+CAKz8qMZpXjZmyyI0CmF5ShVgC7PWIgy71acUeR4tkgeCbKFA
X-Received: by 2002:adf:ec50:: with SMTP id w16mr20008160wrn.171.1549694936143;
        Fri, 08 Feb 2019 22:48:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549694936; cv=none;
        d=google.com; s=arc-20160816;
        b=QhIL76vPpC5QwmF57+V4zzJunPn+fH83pCJ9vzVklyij/a81Fx2UR4mV6sE0W+0i/w
         N7yLeQCnfFzhsn2saz0gXZAwtQFmBjlahq/5YxNrcOwNnGHi4TATv+pppcPEGNWFuh19
         Bh0vLY3Wn80Zd1K9f4XJ1KfrBNl7KP0lxt1scw0+ESUr48ehxNx5DEjVwRvLj/MdoGfh
         9+0DpL8nMGLAEe1QM6/qEoHpM523aCjTR64uHOy5yoqMKlr+StYUbYNerJaXSo+oMcE2
         ladS33MjbRLH6ZRa3+fBqoo1bhL21kaHrWpWEUQDuRBJX7QR7hg1+dbfcbQZc6nQmz7m
         1LUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=b7luqHza6/AwfJTgkpUwaDD/ushU1apGe1PZ4Tk1QEs=;
        b=rHsmjEuCOee2/cuKoOmPSFBr009zbMSFumfI29JUKhtebGPXcMyEdvKrkPtlIGYou2
         OQQ0gHnzTxw5i6vY/jYObKdpuHK9b9rVBDGibRMjyd8rjuotFkd8sYBvD5jevFY8buZL
         AkuENQE8UeS0jT9mmCFehsSirXe3ruhwiZJ/RQOeaOaoMh/cUDrqOtJwlAaYJyYuLgHB
         aLr9PuyWshhiA8scmgI8zly7rFgFLz9oR+sa8Pj5bOf8dojh/2GhaNSXbjcgwj93PtkW
         3RV6KnKNDtrYLxCR6IE9PPOYraR4hrlGMLnvgVl7eVz2PPu5yjt2KUTI4MF0bnJe/5F7
         WphA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i134si3442094wmg.71.2019.02.08.22.48.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Feb 2019 22:48:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41562 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsMRb-0002an-5w
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 01:48:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJn-0004SJ-Of
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gsMJl-0004Pc-7T
	for qemu-arm@nongnu.org; Sat, 09 Feb 2019 01:40:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50430)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gsMJk-00046g-Up; Sat, 09 Feb 2019 01:40:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 80988C07754E;
	Sat,  9 Feb 2019 06:40:30 +0000 (UTC)
Received: from thuth.com (ovpn-116-16.ams2.redhat.com [10.36.116.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EFEA554505;
	Sat,  9 Feb 2019 06:40:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	yang.zhong@intel.com,
	pbonzini@redhat.com
Date: Sat,  9 Feb 2019 07:39:24 +0100
Message-Id: <1549694366-1284-24-git-send-email-thuth@redhat.com>
In-Reply-To: <1549694366-1284-1-git-send-email-thuth@redhat.com>
References: <1549694366-1284-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Sat, 09 Feb 2019 06:40:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 23/25] hw/arm: Express dependencies of the ZynqMP
 zcu102 machine with Kconfig
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
Cc: qemu-arm@nongnu.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ho43EFflyJJw

This cleans up most settings in default-configs/aarch64-softmmu.mak.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/aarch64-softmmu.mak |  4 ----
 hw/arm/Kconfig                      | 12 ++++++++++++
 hw/display/Kconfig                  |  1 +
 3 files changed, 13 insertions(+), 4 deletions(-)

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
index aad2dd3..3577550 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -291,6 +291,18 @@ config STM32F205_SOC
 
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
+    select PCI      # TODO: Currently required for SDHCI and AHCI, remove later
 
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

