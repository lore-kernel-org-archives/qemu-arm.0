Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7199772wrx;
        Thu, 7 Mar 2019 06:22:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqyAJt252vQFmfLqllTX6/pfYc+CqOPgt9ByZ0qFXDFcVPiYxzTfCboqUSmoiDlTI0w4hRJK
X-Received: by 2002:a5b:f05:: with SMTP id x5mr6450212ybr.131.1551968539371;
        Thu, 07 Mar 2019 06:22:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551968539; cv=none;
        d=google.com; s=arc-20160816;
        b=Mwx9IMO7JKpSPPe/+hOOqYM/ijosHZi1i2c24Gk/ZunrlEuKy+7QbP3eY81Vlj/ycx
         t26d3D9kkC+1u3MfmAXsIG9HLmZrsuvMP6hZVBRhgTMNP9LD24rX73C688fCaNdRJ5Lk
         HWi34KTqT9nSivkk7H6xSZqf+SSRkByDiqX3MEX/F4xeU5Oyz7yJf57IVNFUuu21s1/P
         pjtwc9pQJm9/ckUx+6Y5CybbyDfugLu0/hPAOuf3O7KwY5zoomQ6GdbCpzgnUgTsltdC
         pDZkpgbbpRfSpdfM+zSkYh94qm4PrnNPONN0JRzOs4c33wDvF7aXiRcDKWeh7fPqFnMB
         IEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=mvdowafB+jdOdpe+ogtjnMmL+imgI63mhcOGcEf4/E4=;
        b=bouUkKWI4N92EpPjKg4xqVqaVjDvk9IBRcLbcHrxRBA5QI5lHnLzzIbIX+SZDQsufR
         rtc5ZGcS10DlnrPsR+nIM4yFgvmZPUXmF/tJGYzBbWkovZFgpW4hpcNhi0sVlhWiNfC5
         cgY97ZROdPvibBR//G1OwJAyOBg0r/TzzNsrRl1nisme2wFRLqDkDD0JHa1TFBwWQ+c9
         k7V0WxvvKLdqf2x2fOBpj5jLBp0RpBaXqmMqwuwQiU/L7mjMx9xsY64oKEuaO0hq5RWy
         A7AVqRfEXhDy02e7gkrtIOqsq1vojJhZsh51FIXKP38I4KMcDeu0uGPPt+NAldwy+jgh
         v0Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10si2620434ybq.131.2019.03.07.06.22.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Mar 2019 06:22:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1tuc-0006p3-M8
	for alex.bennee@linaro.org; Thu, 07 Mar 2019 09:22:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1trj-0004Iq-Ml
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:19:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1h1tri-00082X-Vg
	for qemu-arm@nongnu.org; Thu, 07 Mar 2019 09:19:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1h1tri-00082C-Pt; Thu, 07 Mar 2019 09:19:18 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1305681F18;
	Thu,  7 Mar 2019 14:19:18 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D1A45C1B5;
	Thu,  7 Mar 2019 14:19:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com,
	pbonzini@redhat.com,
	qemu-devel@nongnu.org
Date: Thu,  7 Mar 2019 15:18:27 +0100
Message-Id: <1551968334-18982-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1551968334-18982-1-git-send-email-thuth@redhat.com>
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 07 Mar 2019 14:19:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 02/29] hw/ide/ahci: Add a Kconfig switch for
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ouW+jezb3lWP

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

