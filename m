Received: by 10.25.21.156 with SMTP id 28csp1741927lfv;
        Tue, 19 Jul 2016 11:25:26 -0700 (PDT)
X-Received: by 10.55.144.69 with SMTP id s66mr52145061qkd.6.1468952726053;
        Tue, 19 Jul 2016 11:25:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y11si10671196qka.154.2016.07.19.11.25.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 19 Jul 2016 11:25:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57834 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bPZht-00013e-3d
	for alex.bennee@linaro.org; Tue, 19 Jul 2016 14:25:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1bPZAi-0002xi-I9
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 13:51:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1bPZAg-0000rH-NM
	for qemu-arm@nongnu.org; Tue, 19 Jul 2016 13:51:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45148)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1bPZAg-0000rD-HZ; Tue, 19 Jul 2016 13:51:06 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 15F6EC04B323;
	Tue, 19 Jul 2016 17:51:06 +0000 (UTC)
Received: from redhat.com (vpn1-7-82.ams2.redhat.com [10.36.7.82])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id u6JHp1PW013471; Tue, 19 Jul 2016 13:51:03 -0400
Date: Tue, 19 Jul 2016 20:51:01 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20160719175101.GA32652@redhat.com>
References: <1468950176-31959-1-git-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1468950176-31959-1-git-send-email-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 19 Jul 2016 17:51:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL v2 08/55] hw/versatile: realize the PCI root bus
 as part of the versatile init
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
Cc: Marcel Apfelbaum <marcel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U/GP/zrQNXt0

From: Marcel Apfelbaum <marcel@redhat.com>

'Realize' the PCI root bus manually since the 'realize' mechanism
does not propagate to child devices yet.

Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/pci-host/versatile.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index 0792c45..467cbb9 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -455,6 +455,7 @@ static void pci_vpb_realize(DeviceState *dev, Error **errp)
     }
 
     /* TODO Remove once realize propagates to child devices. */
+    object_property_set_bool(OBJECT(&s->pci_bus), true, "realized", errp);
     object_property_set_bool(OBJECT(&s->pci_dev), true, "realized", errp);
 }
 
-- 
MST

