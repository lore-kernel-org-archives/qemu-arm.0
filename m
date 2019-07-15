Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3938141wrv;
        Mon, 15 Jul 2019 02:57:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwGroNxW0iM6IgXIU/Qw6l5QlSW8MJqaZp7OC+neMySgjoHM1OgHMat/IDbBx7qCcShcDST
X-Received: by 2002:a17:906:474a:: with SMTP id j10mr19952637ejs.104.1563184623631;
        Mon, 15 Jul 2019 02:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563184623; cv=none;
        d=google.com; s=arc-20160816;
        b=Aygn9Z8bb29Pg71DaBcphy1kUkAzq/ZjRlRHA5x7tBu+FON910T/U4nCaoWDDmQDxF
         SufDgtsUkN/m1jJd7lK9OXncteMjZnfWt7nEq2CA8EIf+tMRqwxRsAzRcybVL57z1B6K
         1ArOFI0Hp04yfJ7eriCwRMs6ky7TtfqghvocfIrwGcNlttEPbPRtPbP5okp6IJpaTuSJ
         BKFx5HmhEbDVjXGP1lUlPKfDu+E8/gAc5s2OuOLRTLjj0FfBttgCkOqnOq07gWYKbO4H
         io9XG/jdO312bi5xJwFtBnLj/faz7HlZzK1vHz3yAdc2LL64XTSNjlfP2wzSQHMrHo+R
         cW9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=MuSAdXi7HWCVrT8X0Abp7GHjcVBAC8EG0QnKP1bPhr0=;
        b=gM7k2uaiqNzLZrxTZkAAtkevrfBS1/TShkVMn8NJ+R6mq+3TxpoIK5rf+hDor2kTTZ
         Dp8nIZbG4cgL3kyRoUjaG8k68EU6+PTHhT9SR76dAv6dzWVX3YtgJPqsgXZs9j1qomTB
         jjYlvDnDZDwaw+3IxXXGaiVKeuk4jINnxoL/MtFbZF0if+rPTnrhpXPwGnWsJRSkdYP4
         2l0jR6L+439gEgNl7acVZwrquJuvnpGe5b54u+/CgF/oJ7zIv5SsXGClQgo/jKTVaVs+
         tYhtKz3PYeVcw2IG31Hg8FK6ac28tIAQIf7SOKtsFCS7nr2zOArIJpwCnI2ptwRiOKo8
         MsyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y24si9593431edm.354.2019.07.15.02.57.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 02:57:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36465 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmxjC-0002Fn-I8
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 05:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57923)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hmxip-0000pC-VP
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 05:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hmxin-0001wb-SH
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 05:56:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51222)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hmxin-0001wJ-Mu; Mon, 15 Jul 2019 05:56:37 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 931A3307FBCB;
 Mon, 15 Jul 2019 09:56:36 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 185426012C;
 Mon, 15 Jul 2019 09:56:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 11:55:44 +0200
Message-Id: <20190715095545.28545-3-philmd@redhat.com>
In-Reply-To: <20190715095545.28545-1-philmd@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 15 Jul 2019 09:56:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.2 2/3] hw/usb/Kconfig: Add
 CONFIG_USB_EHCI_PCI
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q4xgkYUfxaRt

The USB_EHCI entry currently include PCI code. Since the EHCI
implementation is already split in sysbus/PCI, add a new
USB_EHCI_PCI. There are no logical changes, but the Kconfig
dependencies tree is cleaner.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/usb/Kconfig       | 9 ++++++---
 hw/usb/Makefile.objs | 5 +++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 564305e283..495c6f2d48 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -19,13 +19,16 @@ config USB_OHCI_PCI
=20
 config USB_EHCI
     bool
-    default y if PCI_DEVICES
-    depends on PCI
     select USB
=20
+config USB_EHCI_PCI
+    bool
+    default y if PCI_DEVICES
+    select USB_EHCI
+
 config USB_EHCI_SYSBUS
     bool
-    select USB
+    select USB_EHCI
=20
 config USB_XHCI
     bool
diff --git a/hw/usb/Makefile.objs b/hw/usb/Makefile.objs
index 81688f6e70..303ac084a0 100644
--- a/hw/usb/Makefile.objs
+++ b/hw/usb/Makefile.objs
@@ -6,8 +6,9 @@ common-obj-$(CONFIG_USB) +=3D desc.o desc-msos.o
 common-obj-$(CONFIG_USB_UHCI) +=3D hcd-uhci.o
 common-obj-$(CONFIG_USB_OHCI) +=3D hcd-ohci.o
 common-obj-$(CONFIG_USB_OHCI_PCI) +=3D hcd-ohci-pci.o
-common-obj-$(CONFIG_USB_EHCI) +=3D hcd-ehci.o hcd-ehci-pci.o
-common-obj-$(CONFIG_USB_EHCI_SYSBUS) +=3D hcd-ehci.o hcd-ehci-sysbus.o
+common-obj-$(CONFIG_USB_EHCI) +=3D hcd-ehci.o
+common-obj-$(CONFIG_USB_EHCI_PCI) +=3D hcd-ehci-pci.o
+common-obj-$(CONFIG_USB_EHCI_SYSBUS) +=3D hcd-ehci-sysbus.o
 common-obj-$(CONFIG_USB_XHCI) +=3D hcd-xhci.o
 common-obj-$(CONFIG_USB_XHCI_NEC) +=3D hcd-xhci-nec.o
 common-obj-$(CONFIG_USB_MUSB) +=3D hcd-musb.o
--=20
2.20.1

