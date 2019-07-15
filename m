Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3937423wrv;
        Mon, 15 Jul 2019 02:56:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhIulKtmvi2JQvoI9shw2TpAlYVNCPWDc+22r7e6ZLKOhgImgTxqRmAZu3Nls5LXI2BxCf
X-Received: by 2002:aa7:cf0c:: with SMTP id a12mr22209909edy.146.1563184580137;
        Mon, 15 Jul 2019 02:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563184580; cv=none;
        d=google.com; s=arc-20160816;
        b=G+nFTwD9bfQqBdHfbFuQ33r9MSEYcmmlL1Y4yK1DGot/wuxyqlfN5G2AvD4aIlQAu3
         72wn7SUNRcH6nnDcaXKjd4rWpZ2NgpVsT6plLq1QJETnWhN69fmjfoiu4zvZGe4rhji8
         /HyQJrOFsM4jHmLVXoLja5xTN6MdD3vOzty1GTYTFU5Y2CiiyEQMAMoXsLCHmoLiwiY8
         a7qTZYyudu1L7YehivhOswM+5nhzABy21b9aYE64lortjWObL5D/zj8T3SgFmuUd/Tpi
         7++2CJUSxaLsKNcQfT3DILRIJVp4whCo3FWSuKr0d1Vcxo4tuEvxlPv7KTVwc7bk08i9
         AdNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=TA6m42deUsOTeRy8HosN46iGq2XyRT5TnTZZ5el88t4=;
        b=hzn6/7osW60DNyrcGi/gDOjG5SHGZed5oFw93Ac6qeBOo8ph+Yb6G2Van7sRXCyyJR
         uD6N1v/UajSvJoH1BCuEjFcqTO+/vS/3GYZZW534ZD+QExenJDfN1o7YQuWdDa5X/8Hy
         iJJzWCDhw99jmymbGQHs4zJW7l+0H2jteD+ItggXstBnsrc6m74WK7pXr7Y7Zhe0oLg1
         V/VoxtcXV6DXqOMuVVE3kQcJvlGQktyfuQTyz1UBm0DRiE6LTv2Ae5/I311A27NYZUzf
         hest6zxrhrURHbeo7enKuWzVrJc/xUbvACXJqXVU+q9aRywcrj3pWeK8QryMwGmjurEA
         sBYw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si10006603edc.440.2019.07.15.02.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 02:56:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmxiV-0007wz-7x
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 05:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hmxiS-0007wq-S1
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 05:56:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hmxiS-0001nT-0P
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 05:56:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51846)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hmxiR-0001mL-R8; Mon, 15 Jul 2019 05:56:15 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BBBCC3DD47;
 Mon, 15 Jul 2019 09:56:12 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B00B6012C;
 Mon, 15 Jul 2019 09:55:53 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 11:55:42 +0200
Message-Id: <20190715095545.28545-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Mon, 15 Jul 2019 09:56:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/3] hw/Kconfig: PCI & USB fixes
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
X-TUID: 6LQ/tjkvf9Zs

I actually wanted to clean the USB devices (i.e. to not have
USB3 devices appear on OHCI buses) but this is too late for
the next release, so let's post the patches accumulated.

Philippe Mathieu-Daud=C3=A9 (3):
  hw/Kconfig: PCI bus implies PCI_DEVICES
  hw/usb/Kconfig: Add CONFIG_USB_EHCI_PCI
  hw/usb/Kconfig: USB_XHCI_NEC requires USB_XHCI

 docs/devel/kconfig.rst |  1 -
 hw/alpha/Kconfig       |  1 -
 hw/arm/Kconfig         |  4 ----
 hw/hppa/Kconfig        |  1 -
 hw/i386/Kconfig        |  1 -
 hw/pci/Kconfig         |  1 +
 hw/ppc/Kconfig         |  6 ------
 hw/riscv/Kconfig       |  1 -
 hw/sh4/Kconfig         |  1 -
 hw/sparc64/Kconfig     |  1 -
 hw/usb/Kconfig         | 11 +++++++----
 hw/usb/Makefile.objs   |  5 +++--
 12 files changed, 11 insertions(+), 23 deletions(-)

--=20
2.20.1

