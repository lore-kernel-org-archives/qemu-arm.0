Received: by 10.25.0.144 with SMTP id 138csp1451413lfa;
        Mon, 17 Apr 2017 15:02:54 -0700 (PDT)
X-Received: by 10.200.55.235 with SMTP id e40mr10777895qtc.219.1492466574576;
        Mon, 17 Apr 2017 15:02:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f131si12113943qkb.116.2017.04.17.15.02.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Apr 2017 15:02:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0EjV-0002qd-Uw
	for alex.bennee@linaro.org; Mon, 17 Apr 2017 18:02:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d0Egg-0000es-Hs
	for qemu-arm@nongnu.org; Mon, 17 Apr 2017 17:59:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d0Egf-0005sd-Ec
	for qemu-arm@nongnu.org; Mon, 17 Apr 2017 17:59:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50976)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d0Egf-0005sT-83; Mon, 17 Apr 2017 17:59:57 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1197D33C17F;
	Mon, 17 Apr 2017 21:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1197D33C17F
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1197D33C17F
Received: from localhost (ovpn-116-4.gru2.redhat.com [10.97.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6D545C54E;
	Mon, 17 Apr 2017 21:59:51 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Apr 2017 18:59:16 -0300
Message-Id: <20170417215916.12431-8-ehabkost@redhat.com>
In-Reply-To: <20170417215916.12431-1-ehabkost@redhat.com>
References: <20170417215916.12431-1-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 17 Apr 2017 21:59:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 7/7] pci: Set phb->bus inside pci_bus_new_inplace()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>, David Gibson <dgibson@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U/u6i+oxVCJR

Every single caller of pci_bus_new_inplace() sets phb->bus to point to
'bus'. Do that inside pci_bus_new_inplace() to avoid code duplication
and make it harder to break.

Cc: "Herv=C3=A9 Poussineau" <hpoussin@reactos.org>
Cc: Marcel Apfelbaum <marcel@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-ppc@nongnu.org
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/pci-host/prep.c      | 2 --
 hw/pci-host/versatile.c | 1 -
 hw/pci/pci.c            | 1 +
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
index 2e2cd267f4..6efa5bc5ef 100644
--- a/hw/pci-host/prep.c
+++ b/hw/pci-host/prep.c
@@ -284,8 +284,6 @@ static void raven_pcihost_initfn(Object *obj)
     address_space_init(&s->bm_as, &s->bm, "raven-bm");
     pci_setup_iommu(&s->pci_bus, raven_pcihost_set_iommu, s);
=20
-    h->bus =3D &s->pci_bus;
-
     object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_RAVEN_PCI_DE=
VICE);
     pci_dev =3D DEVICE(&s->pci_dev);
     qdev_set_parent_bus(pci_dev, BUS(&s->pci_bus));
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index 24ef87610b..630f1ac1c5 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -389,7 +389,6 @@ static void pci_vpb_init(Object *obj)
     pci_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), h, "pci",
                         &s->pci_mem_space, &s->pci_io_space,
                         PCI_DEVFN(11, 0), TYPE_PCI_BUS);
-    h->bus =3D &s->pci_bus;
=20
     object_initialize(&s->pci_dev, sizeof(s->pci_dev), TYPE_VERSATILE_PC=
I_HOST);
     qdev_set_parent_bus(DEVICE(&s->pci_dev), BUS(&s->pci_bus));
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 486aeb7514..ef226f8b41 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -397,6 +397,7 @@ void pci_bus_new_inplace(PCIBus *bus, size_t bus_size=
,
 {
     qbus_create_inplace(bus, bus_size, typename, DEVICE(phb), name);
     pci_bus_init(bus, phb, address_space_mem, address_space_io, devfn_mi=
n);
+    phb->bus =3D bus;
 }
=20
 PCIBus *pci_bus_new(PCIHostState *phb, const char *name,
--=20
2.11.0.259.g40922b1

