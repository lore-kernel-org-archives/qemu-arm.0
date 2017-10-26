Received: by 10.223.161.27 with SMTP id o27csp788161wro;
        Thu, 26 Oct 2017 07:45:53 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RSWPTHLKmmWGujfFzSkf9t08sgt2z1wXCXtzbxh4y3n6B4NVwDI53FjFP1xy6iDe5fJNGy
X-Received: by 10.13.226.80 with SMTP id l77mr15243561ywe.14.1509029153847;
        Thu, 26 Oct 2017 07:45:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509029153; cv=none;
        d=google.com; s=arc-20160816;
        b=a5iyPuUtvJpRfWLfK1AY3gMtW0Yz7t620cIvIS63XZ0mfqbnWzbe8+z7R38dh0Ngek
         GGW3AZ7Tljz9Sfv7lxNQbintHhu7YyMeHOya/JPUt2CVQHAHK7DpD+YzWQBVBt9liwVM
         bWv8DTX6HHT+zM/aUw9BImhaW+2hImgFe8LLoNtVWhxoB5ESB7vyRT7ZXTz94l1qwCHN
         UCNQVV+j/YJoUZDQTvvybhqm7vFYP6F6NVnKoTSD3e5ULjrE2tsaSqJzmTQYsEmZuraw
         x8kq5bgOj+kd8L2tN0PhJW1G4p0CClAEeuyC/4H47okgXIdbNXgdDAXFGiOsNSVJao96
         ZIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=xX3XrjeOh5zX7VURJTu/t/et+kHj9czy//HA4B0QP2g=;
        b=U69iTyQvQCuQrUXSCJoHKWfCHQDCt1Fz6eyzpkDb9Da4fzOYLH4OYr1UznqFksF3S1
         MxlDNaY2yqpcfHIlnPO7Fi1mkXZRVhCF4BB1wc3DrqgHUCxjBV2stL4x5/m+4hbq/mSm
         XhCjgfw6rz7AqRrPhMDv4sE8aq8wRuo89zaXP2KpNp24YpGGGgN4YEmwuk+7kSu5UCwI
         4LRR/3KROes+GKoVTchqoFmaSbDIOXAL0nVwi80In5ggv0BBKDwbYwY2jBUjM3xB6Nm3
         tTF+3OPYOfVnjLY9zwtIWvjbE/dRVtdnoVMTZqOSggNhdFAmkfRdIc4JcimdhqS/gmbv
         IIug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iWsK7Bxo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n185si810992ywe.179.2017.10.26.07.45.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 07:45:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=iWsK7Bxo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7jPt-0004gY-Bp
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 10:45:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e7jIz-0007Jp-95
	for qemu-devel@nongnu.org; Thu, 26 Oct 2017 10:38:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gabriel291075@gmail.com>) id 1e7jIy-0007m3-7x
	for qemu-devel@nongnu.org; Thu, 26 Oct 2017 10:38:45 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:46598)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gabriel291075@gmail.com>)
	id 1e7jIy-0007lK-4A; Thu, 26 Oct 2017 10:38:44 -0400
Received: by mail-qt0-x243.google.com with SMTP id 1so4554110qtn.3;
	Thu, 26 Oct 2017 07:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xX3XrjeOh5zX7VURJTu/t/et+kHj9czy//HA4B0QP2g=;
	b=iWsK7Bxo1Eb+NNLjjuBgXd14ioWz13TKNjEhzgdolAxB1iXy2OqFxTxwKMGQVBM+QG
	QrHs5yiD/u2pp2CTywywniDxKkh5ph4YB/w4j8n2IWdcLHon/r4eBP+FPLWIFijDui+y
	uF6JdniOT0BeyGgVG3kh5G2/9trEAaEBTAWN1nVxTo9Wc2VdjtY/yPMNuD6UUBUWHKi8
	26C+3WXIIs1xr+v+h570u/immk7t3jRMMM0QLuNy/Jceiq6y5PHBu9rQVHlepXtoSC1K
	3qcl5mATtJG+mBZNYTdQWNmgNQRX810MvYjuh5r6zJ638DsmtP+nfTLWoU+DIAVWtlcX
	WDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xX3XrjeOh5zX7VURJTu/t/et+kHj9czy//HA4B0QP2g=;
	b=Qt8KYLwqwRjN1QWUcvaXMvMiIdmLtCS4ALbiqepA33ydkSBA2BLa5S3hYqgxQo0dRq
	X1HS+unXcxGAprfchr87avedmuj7g7/2bQTDcTDBJeUEHneLiS9pNFCUc1fuQAUeV2d+
	UCrI7Vn/bmhAFgwPgd0UowErY67/ka17xqdefqFamd+9abgdCTpd9DcRAIsaXAYb5XR5
	85YRGYcMQOEku2Lq2mb2MpXN0uZrWJ5fgXvVrygeh+u6AWFrnm7pAjoYLtSObAOrVXAX
	Dk4zEDJlklDjuBak8IBn94SIIbMIM5Vh/HmR3F5t8ACOKfh85LsIvKUNU//Cq8XVgoTE
	c1Hw==
X-Gm-Message-State: AMCzsaWvZbSYw5SZ53MYQdr+PqVhtoYa8CbYbNmHsQvWArIrnyI68Raw
	lXh5wyLTtr105Ea5SLVLzRsIHcYg
X-Received: by 10.237.60.154 with SMTP id d26mr15172954qtf.227.1509028723340; 
	Thu, 26 Oct 2017 07:38:43 -0700 (PDT)
Received: from localhost.localdomain ([208.94.106.99])
	by smtp.googlemail.com with ESMTPSA id
	l126sm3352746qkf.96.2017.10.26.07.38.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Oct 2017 07:38:42 -0700 (PDT)
From: Gabriel Costa <gabriel291075@gmail.com>
X-Google-Original-From: Gabriel Costa <costa@advantech.ca>
To: qemu-devel@nongnu.org
Date: Thu, 26 Oct 2017 06:34:13 -0400
Message-Id: <1509014053-28134-7-git-send-email-costa@advantech.ca>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1509014053-28134-1-git-send-email-costa@advantech.ca>
References: <1509014053-28134-1-git-send-email-costa@advantech.ca>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v6]arm: Makefiles to kinetis k64 platform
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, f4bug@amsat.org,
	Gabriel Augusto Costa <gabriel291075@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 40tsudgxjQrR

From: Gabriel Augusto Costa <gabriel291075@gmail.com>

This file change the Makefiles to compile the mk64fn1m0 machine.

Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
---
 default-configs/arm-softmmu.mak | 1 +
 hw/arm/Makefile.objs            | 1 +
 hw/char/Makefile.objs           | 1 +
 hw/misc/Makefile.objs           | 3 +++
 4 files changed, 6 insertions(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 5059d13..a835d4f
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -130,3 +130,4 @@ CONFIG_SMBIOS=y
 CONFIG_ASPEED_SOC=y
 CONFIG_GPIO_KEY=y
 CONFIG_MSF2=y
+CONFIG_KINETIS_K64=y
diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 2794e08..874a38a
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -20,3 +20,4 @@ obj-$(CONFIG_FSL_IMX6) += fsl-imx6.o sabrelite.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_soc.o aspeed.o
 obj-$(CONFIG_MPS2) += mps2.o
 obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
+obj-$(CONFIG_KINETIS_K64) += mk64fn1m0.o
diff --git a/hw/char/Makefile.objs b/hw/char/Makefile.objs
index 1bcd37e..75b194c
--- a/hw/char/Makefile.objs
+++ b/hw/char/Makefile.objs
@@ -31,3 +31,4 @@ common-obj-$(CONFIG_SCLPCONSOLE) += sclpconsole.o sclpconsole-lm.o
 
 obj-$(CONFIG_VIRTIO) += virtio-serial-bus.o
 obj-$(CONFIG_TERMINAL3270) += terminal3270.o
+obj-$(CONFIG_KINETIS_K64) += kinetis_k64_uart.o
diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 19202d9..c5c8589
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -61,3 +61,6 @@ obj-$(CONFIG_AUX) += auxbus.o
 obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
 obj-y += mmio_interface.o
 obj-$(CONFIG_MSF2) += msf2-sysreg.o
+obj-$(CONFIG_KINETIS_K64) += kinetis_k64_mcg.o
+obj-$(CONFIG_KINETIS_K64) += kinetis_k64_pmux.o
+obj-$(CONFIG_KINETIS_K64) += kinetis_k64_system.o
-- 
2.1.4

