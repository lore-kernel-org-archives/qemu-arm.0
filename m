Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp919898wrx;
        Thu, 18 Apr 2019 11:01:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzDEa4Nxzw1+XSTPKYA7YeDQlLz/Rx/+v+5PL1QTfcKPvRHcEh7XFzptKtlP+G0PjayGmGT
X-Received: by 2002:a5d:448f:: with SMTP id j15mr55965323wrq.79.1555610502744;
        Thu, 18 Apr 2019 11:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555610502; cv=none;
        d=google.com; s=arc-20160816;
        b=QBRZ5g1aic1OBRQjrTRSEoCZI3BFygmU3ybquCYzOX6D7XlASpDcwmfYFLY+cZJ1w3
         eM/CuTTVsa9uw6Ub0bF6lh6VXy6qkhLKXpSUJhCYJs4VdAdllRhJjaDL4vFlziHwLT13
         S5BT4jxAmxz0vePW8N1RDI4iWnvevEs7/qibK/U1lvUyOxypNpopptUyjjqx/f6RuooT
         KatqmJZlDW2sWBZwuZNg26XW374K1bc0f0b0SmlHOqNmmOYEZuKNoroeo8m6J1SG0JZV
         H8j5t7rymtVkBN06pzLfywhZkBHa5wEySesMDyNggHRRrsL0KofMgeqGOFxxZmxDJpMh
         Q9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ycnEk3xc0T0Mb/MUNcG2DvWiUTVrPLNBDAGj/G9uIjo=;
        b=SsdFqkNc20R4TkWULNxmEgQeyNzxhzncFDgGt9hGU126W1B0+P7sTfqZXt9quwFmgl
         K9ELViL7oDPR3YFvNw4MIaKwLlvsQyB4CyoBeYFJ5PPubSLKbN9pSNPDT5GDnXcZ0Uyj
         wCiAkWKcZ45c+WzWZF+MsWZsqvbRMAZY1POLXLQg6p92VsIfznX4aifILOvgagKi71Dq
         6vYzsvjN12jEDHchFAKlIwji+UvW3aalDFEqg7ADFkc8Sbiwgozc8hcknV3q0MkuPaVK
         ES1s2SjV9zL+sFFxM970tLRLakmJN6E+9wTqvFIPsTELSMJ5Vs5a129zlysUPkJc66JM
         heKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10si1996578wmh.8.2019.04.18.11.01.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 11:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:45009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHBLx-0002Vb-Q8
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 14:01:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBLa-0002LK-Oz
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:01:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hHBLZ-0001EW-8Z
	for qemu-arm@nongnu.org; Thu, 18 Apr 2019 14:01:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56278)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hHBLY-0001E6-WC; Thu, 18 Apr 2019 14:01:17 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E17D23019880;
	Thu, 18 Apr 2019 18:01:15 +0000 (UTC)
Received: from thuth.com (ovpn-116-56.ams2.redhat.com [10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EFF61018A0E;
	Thu, 18 Apr 2019 18:01:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: yang.zhong@intel.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Date: Thu, 18 Apr 2019 20:00:29 +0200
Message-Id: <20190418180057.3593-2-thuth@redhat.com>
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
References: <20190418180057.3593-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Thu, 18 Apr 2019 18:01:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-QEMU-4.1 v5 01/29] hw/pci/pci-stub: Add
 msi_enabled() and msi_notify() to the pci stubs
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Cedric Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
	Andrew Jeffery <andrew@aj.id.au>, Philippe Mathieu-Daude <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oKc4U+Mmd4LK

Some machines have an AHCI adapter, but no PCI. To be able to
compile hw/ide/ahci.c without CONFIG_PCI, we still need the two
functions msi_enabled() and msi_notify() for linking.
This is required for the new Kconfig-like build system, if a user
wants to compile a QEMU binary with just one machine that has AHCI,
but no PCI, like the ARM "cubieboard" for example.

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/pci/pci-stub.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
index b941a0e842..c04a5df651 100644
--- a/hw/pci/pci-stub.c
+++ b/hw/pci/pci-stub.c
@@ -53,3 +53,14 @@ uint16_t pci_requester_id(PCIDevice *dev)
     g_assert(false);
     return 0;
 }
+
+/* Required by ahci.c */
+bool msi_enabled(const PCIDevice *dev)
+{
+    return false;
+}
+
+void msi_notify(PCIDevice *dev, unsigned int vector)
+{
+    g_assert_not_reached();
+}
--=20
2.21.0

