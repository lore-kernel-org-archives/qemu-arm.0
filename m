Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7785556wrx;
        Fri, 22 Feb 2019 23:57:32 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibex1zhl1n4g0BM+HZhcDCiPhhjAqZIE3etlkJbgELVb81U23Z49SGWAWYvZWjOcMozyTlW
X-Received: by 2002:a5b:985:: with SMTP id c5mr6410293ybq.271.1550908651947;
        Fri, 22 Feb 2019 23:57:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550908651; cv=none;
        d=google.com; s=arc-20160816;
        b=orOqNkrnk9h9igTDXzQk8SN9O8VPYPJqtKV3KXwUrFpy40l1MsdB/5VmUtWI5cH8QY
         6HdllTvPhuKjq8x39P6NnRrSRccZyqy2zzZzMdBYi7kAoBKGmqxEH53Ko5iGyneyqV+I
         lrjjBo1EXDD1BIYuDRMpPXbZ39FmlLFvMfFGibaVJlJvB7iwLLOlYD7GC2Igs/q+QPqU
         B8xmEVtgijU8L8rAfiiuxjOUIq6TSttw5Ps+ySZTSBIiUZOKEAZGQxaaC6Y6txlW1NT9
         K7OLcMEMwChUVEG1AyLk5y3I+M44oz9/0CA3Py4yWAcq6U+SCN1wGBXGrP96GEh+rBBg
         Wz+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=bMJo0IFhPNKGDk+UMBvOVNZj7rZ0LnBx+qo7cUTlMvQ=;
        b=Rpf4PaH/Cjkjv9vvGMt09FI/O8oOkGwfa3J67r4IBJAKn6qswbkPbaMbpIb9AQTmTO
         IM1zmNWWyMTC2Yx/9GhY2pYO+W24Y3mKFMdkpPwC9JkwD0phGQblqbxbbYTspPbuOx+L
         DlP6pPQ8b1Dfp1hx7wiab1IH11yn91zCh5tStjuN731Gm9KFBMa1yBFPmlHb4zt0QbvR
         fOBFdyozaJv6lXX4b06q/qUTz4YkIQ8yKgHG27gWTcQDE4WrbZZyqGpGds9QDUXahxU3
         BbBmOBMcZCiVm+4THtRYtRElRPwibYHKxcZet8PAiH3gqmGjJJAaSh7y7HJYLf90rFPG
         YLBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 191si2091771ybr.410.2019.02.22.23.57.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 23:57:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxSBf-0001wL-CQ
	for alex.bennee@linaro.org; Sat, 23 Feb 2019 02:57:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4W-0004kc-91
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gxS4V-0002Fc-5s
	for qemu-arm@nongnu.org; Sat, 23 Feb 2019 02:50:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43694)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gxS4U-00023P-HQ; Sat, 23 Feb 2019 02:50:07 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55CE93082B52;
	Sat, 23 Feb 2019 07:49:55 +0000 (UTC)
Received: from thuth.com (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F29B85D9CA;
	Sat, 23 Feb 2019 07:49:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Sat, 23 Feb 2019 08:49:06 +0100
Message-Id: <1550908162-22644-15-git-send-email-thuth@redhat.com>
In-Reply-To: <1550908162-22644-1-git-send-email-thuth@redhat.com>
References: <1550908162-22644-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Sat, 23 Feb 2019 07:49:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v3 14/30] hw/arm: Express dependencies of
 xilinx-zynq with Kconfig
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
X-TUID: 9GM2H68+XaWN

Add Kconfig dependencies for the xilinx-zynq-a9 board.
This patch is based on earlier work by =C3=81kos Kov=C3=A1cs (i.e.
his "hw/arm/Kconfig: Add ARM Kconfig" patch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 default-configs/arm-softmmu.mak |  7 +------
 hw/arm/Kconfig                  | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index cba62ba..b9fce47 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -16,6 +16,7 @@ CONFIG_STELLARIS=3Dy
 CONFIG_REALVIEW=3Dy
 CONFIG_VERSATILE=3Dy
 CONFIG_VEXPRESS=3Dy
+CONFIG_ZYNQ=3Dy
 CONFIG_MAINSTONE=3Dy
 CONFIG_GUMSTIX=3Dy
 CONFIG_SPITZ=3Dy
@@ -35,16 +36,11 @@ CONFIG_VIRTIO_MMIO=3Dy
=20
 CONFIG_NETDUINO2=3Dy
=20
-CONFIG_PL330=3Dy
-CONFIG_CADENCE=3Dy
 CONFIG_FRAMEBUFFER=3Dy
-CONFIG_XILINX_SPIPS=3Dy
-CONFIG_ZYNQ_DEVCFG=3Dy
=20
 CONFIG_DIGIC=3Dy
 CONFIG_MPS2=3Dy
 CONFIG_RASPI=3Dy
-CONFIG_ZYNQ=3Dy
 CONFIG_STM32F2XX_TIMER=3Dy
 CONFIG_STM32F2XX_USART=3Dy
 CONFIG_STM32F2XX_SYSCFG=3Dy
@@ -99,7 +95,6 @@ CONFIG_SMBUS_EEPROM=3Dy
 CONFIG_GPIO_KEY=3Dy
 CONFIG_MSF2=3Dy
 CONFIG_FW_CFG_DMA=3Dy
-CONFIG_XILINX_AXI=3Dy
 CONFIG_PCI_EXPRESS_DESIGNWARE=3Dy
=20
 CONFIG_STRONGARM=3Dy
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index fd6b92c..78e694b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -208,6 +208,20 @@ config VEXPRESS
=20
 config ZYNQ
     bool
+    select A9MPCORE
+    select CADENCE # UART
+    select PCI
+    select PFLASH_CFI02
+    select PL330
+    select SDHCI
+    select SSI_M25P80
+    select USB_EHCI
+    select USB_EHCI_SYSBUS
+    select XILINX # UART
+    select XILINX_AXI
+    select XILINX_SPI
+    select XILINX_SPIPS
+    select ZYNQ_DEVCFG
=20
 config ARM_V7M
     bool
--=20
1.8.3.1

