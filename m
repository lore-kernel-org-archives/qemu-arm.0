Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3938038wrv;
        Mon, 15 Jul 2019 02:56:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRbbuGdQ2WKCypt41/CxcCKqQJjfVv3qnHBo16VpuayTdyCxrTzowOiX37FZV/z05ng6sy
X-Received: by 2002:a50:ba1b:: with SMTP id g27mr21950845edc.18.1563184616738;
        Mon, 15 Jul 2019 02:56:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563184616; cv=none;
        d=google.com; s=arc-20160816;
        b=AbYcDsphbSc9nY4/DvdeVhpSsW7vhtkze38V1hCoX95HubpKmWStA2oQTcLj3hLaW7
         QIy0Zu29oaI5KUWCFLK01BXGXtzjAhTtDd+flJq11HhyckPLcUUx8mELrCk7QCYibPty
         dhtZjWGaTnmCauazTlsQC9gJWyFIITrYaXRLD5mykTEoIsfr47XattKFWzLN0K5Idbz6
         aL69xb4tFbWpkDFs5JZfb8pzFqLO64eDcEE5euFItS6el1CQu7ErCXGUPoSncoFpD1Br
         WDH8SNhDzkhGe9pNpgGjN9LneNm1UlQVTXYxdNgdA0AXxa43lFcCzAAf6KKUuj3HRcIK
         4I6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=uqtCodEzGJsdkFVLpWgbthu3H1Cfh2Bxl9EJEaKqL7g=;
        b=pan1mW9HGQgIWuPu9ER/GsUd09GrKOJeeh6zWmBql//8CI78iPz0ukHq1pOAHcHZf6
         JnnRrbcPrQcTWYGkMNU4fZ/UL5raM+Ab1d10Y9vR7gj8yW4EBmJP9buVYGKtShl9ZTkh
         Y7LaicmV9AptpVzENj0CztZCJ36sOF8WUe/gOw5vhb8V0xZMPMaRCY6WJ+S2F1eolhCJ
         QuqJpD+QFCzPMiadG38qWj46eiV2sJ1u1rGj4tkUeFZKjoB+/WCsT9nNUFbDxEwrjuCo
         zSUzn/wP1yMTbkN+CjAdoOfBGXqDpFlq/cHHtp3xqRIZdCl9n955QO7BDXxHx0a2SJCN
         wfsA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si9061746ejs.376.2019.07.15.02.56.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 02:56:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmxj5-0001fi-EI
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 05:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58023)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hmxiy-0001SR-P9
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 05:56:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hmxix-00021Y-8i
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 05:56:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45180)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hmxix-000219-31; Mon, 15 Jul 2019 05:56:47 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3DE70308FEC0;
 Mon, 15 Jul 2019 09:56:46 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C2166012C;
 Mon, 15 Jul 2019 09:56:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 11:55:45 +0200
Message-Id: <20190715095545.28545-4-philmd@redhat.com>
In-Reply-To: <20190715095545.28545-1-philmd@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 15 Jul 2019 09:56:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1? 3/3] hw/usb/Kconfig: USB_XHCI_NEC
 requires USB_XHCI
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
X-TUID: tjbxLZL387sp

TYPE_NEC_XHCI is child of TYPE_XHCI. Add the missing Kconfig
dependency.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/usb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
index 495c6f2d48..555e09377b 100644
--- a/hw/usb/Kconfig
+++ b/hw/usb/Kconfig
@@ -40,7 +40,7 @@ config USB_XHCI_NEC
     bool
     default y if PCI_DEVICES
     depends on PCI
-    select USB
+    select USB_XHCI
=20
 config USB_MUSB
     bool
--=20
2.20.1

