Received: by 10.25.221.202 with SMTP id w71csp970816lfi;
        Fri, 11 Aug 2017 07:38:59 -0700 (PDT)
X-Received: by 10.200.58.199 with SMTP id x65mr20746289qte.205.1502462339037;
        Fri, 11 Aug 2017 07:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1502462339; cv=none;
        d=google.com; s=arc-20160816;
        b=r7IDI+mrFOCh8rK3UKULAACSKemnwliuh23gnhgbxxG0a8kR7be9wNpgqXox+UrCWF
         ui2dK6YRzjo772alJnDVkR7SeSQFpwXQRQx7q+PzceafSqto1EiS/bybfxkvS5X9MbUB
         nJigcWL0ekhJA2q+uWQ26VEi8Sm9SLumDoYTNqAHl2sS+rrt+6cE8x94dAQ6ifYDtCdk
         I1hfvPcRJq3OOwqVDU+fPaIwfkNw5G6CAVnkN4EAbDb2fUGe4VZIVhn9jL+3WKfdw7nw
         FjCLALGpNKUUssKpChb2rt9k5N6iqPFjPo4dm3dST5fa75S4tEpSw6ErzuQpaO3ePm2r
         BNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :spamdiagnosticmetadata:spamdiagnosticoutput:content-language
         :accept-language:references:message-id:date:thread-index
         :thread-topic:to:from:dkim-signature:arc-authentication-results;
        bh=yAGO/E2tf27xkwCb8sZGZV8HdJhN4e9xLg8Fc2iFP4E=;
        b=rKe5g5cSKDPdsPP0dXTUXzmTrZThbwuoJLbzFsFSSp9hk1D/OHBSR4v8LI8+eURgHh
         ERJGzguRgyPK6nWSws0tDFnVQ8yHyGB5+vgaoyG+HA7rgw5d/JdSHTPBnRG/2fujpPoT
         DmHySqqy40BtqRHaBAmD/nqu/h/mBRl+whbfoTaRD3XHuI5Z2HIjWJUYiQ3krokR1htZ
         U0uB0CNuXytsRiJXD9q2/brJHcgUJMBYyh3izdK5WbanJhEfb9gJN3u09r7KQXgada7j
         h7PwQ8yy8fME5ehr86SyJANDsqcbqiAkjFqA6W0BLonApLY5MMZbOr0gc8fGFzf4nexk
         CTrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=K0xOCWVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q6si909146qtc.337.2017.08.11.07.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Aug 2017 07:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=K0xOCWVp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:44891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dgB5T-00055D-T8
	for alex.bennee@linaro.org; Fri, 11 Aug 2017 10:38:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dgB1b-0001k8-3g
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 10:34:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <diana.craciun@nxp.com>) id 1dgB1Y-0006sv-93
	for qemu-arm@nongnu.org; Fri, 11 Aug 2017 10:34:55 -0400
Received: from mail-ve1eur01on0040.outbound.protection.outlook.com
	([104.47.1.40]:11074
	helo=EUR01-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <diana.craciun@nxp.com>)
	id 1dgB1R-0006qc-5r; Fri, 11 Aug 2017 10:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=yAGO/E2tf27xkwCb8sZGZV8HdJhN4e9xLg8Fc2iFP4E=;
	b=K0xOCWVpsc8SKYMZMv0QNQ/BrrlN4DYDgkWCCIv0DJv0D0bLElFSmu5Nn/Saz/GArbHntCYTG/YtGi61r4oXY3qg3oO++H7uU6N3Dl1n62E8dcKqTBTnrxZsApAyEh5G5yVvvU62WWFjBonGxpbibyHN/r3xfecT20U7BY7PsIs=
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com (10.255.133.15) by
	AM3PR04MB0806.eurprd04.prod.outlook.com (10.242.253.144) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1341.17; Fri, 11 Aug 2017 14:34:41 +0000
Received: from AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::840e:32fc:ecf4:2ffb]) by
	AM3PR04MB0616.eurprd04.prod.outlook.com
	([fe80::840e:32fc:ecf4:2ffb%14]) with mapi id 15.01.1341.019;
	Fri, 11 Aug 2017 14:34:40 +0000
From: Diana Madalina Craciun <diana.craciun@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH v2 2/2] Add a unique ID in the virt machine to be used as
	device ID
Thread-Index: AQHS07WQhQaf1stp7kus9qldhP1WKg==
Date: Fri, 11 Aug 2017 14:34:40 +0000
Message-ID: <AM3PR04MB0616B6DDCF5A59D8C29E9516FF890@AM3PR04MB0616.eurprd04.prod.outlook.com>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<1495537965-4187-3-git-send-email-diana.craciun@nxp.com>
	<b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=diana.craciun@nxp.com; 
x-originating-ip: [192.88.146.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM3PR04MB0806;
	6:R6poR8Ym6VXhh6w6iWYZgVBSmDqzmYoYCwpYiT3MdtYifZwTYFzM0UxxSNHs1tOk3IxgSibC1goMKDf2pay9u+cqqTsDom7koh7BeN3L+VBJePSmNAL/KrQHVrKubo3GcqQRwRl3lttAbWJbU5A70yphVnd2iqc3MWW/RdUVV0fMIPuKi43lKpfGV7MqLOV6Y76ol04Zc6I35MgFwtQj/8tifpytHSk0JL/MWlQ82qPZN+FFgagUwX+r4mzD0BXoJNOVQXA/SK+n9y8Dt0SoOTSPG+YWnAvmhusJd53pz/rag/VhYDvCTpKT9gRHexKY8HosBJ9fcPOxkXzc0KR5wA==;
	5:Es5VAvJAlSIDgErd0G719F2gac1lU0sQzT229Rd9eMJoaFXotf09V1Zn94LOmfWG1JNSySF6+fbTwYtEdNgf6LT0opTNoe+kAiDse0y68y0xmlgnhdFSElEgxVRMHg554IGHTcTuko+HaMgt/IcZdQ==;
	24:qsMS0fyORtzyGg0sPIQ4hWTM2WHCLGjQ1XNAk+zMzeiKDpl2jenf7TN483pn62ZRHHMQ0OcCVN3rVmp8uZAjObu6rkV7Z0ohYQtnP91Jick=;
	7:Uz90AmVo703DNnTzxqJDIwuxBHkH/i/PkIFbp9aSG5qkQTktJCQvL8+TWpVz5UBzeHxz1/X4QmxXxPSfVGcTStRAPaz7TmtlWxiQfVmoKa7OHTKWlExVYwrqD+yPQIgkXBhUrCVjlC8yyCfQbuyVyLY5YYLt8lwrPGjcQc7DEzD122xlpjjjAflep/wYV7SYULfyn7Qae4+kzoqhafpZmnKfu61QgVFge38fzMh8qQ4=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(39860400002)(199003)(189002)(377454003)(24454002)(2900100001)(54906002)(14454004)(99286003)(105586002)(55016002)(101416001)(106356001)(6436002)(50986999)(76176999)(54356999)(9686003)(2906002)(236005)(54896002)(5250100002)(6506006)(2501003)(7736002)(229853002)(189998001)(66066001)(81156014)(8676002)(81166006)(8936002)(7696004)(3660700001)(33656002)(478600001)(102836003)(3846002)(5660300001)(6116002)(4326008)(97736004)(53546010)(6246003)(25786009)(3280700002)(53936002)(68736007)(74316002)(86362001)(575784001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB0806;
	H:AM3PR04MB0616.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-ms-office365-filtering-correlation-id: 300d2571-93c0-447a-261a-08d4e0c619d7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(300000503095)(300135400095)(48565401081)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM3PR04MB0806; 
x-ms-traffictypediagnostic: AM3PR04MB0806:
x-exchange-antispam-report-test: UriScan:(185117386973197);
x-microsoft-antispam-prvs: <AM3PR04MB080601FDA877834A63D8650DFF890@AM3PR04MB0806.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123562025)(20161123564025)(20161123558100)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM3PR04MB0806; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM3PR04MB0806; 
x-forefront-prvs: 03965EFC76
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
	boundary="_000_AM3PR04MB0616B6DDCF5A59D8C29E9516FF890AM3PR04MB0616eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2017 14:34:40.5807 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB0806
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.1.40
Subject: Re: [Qemu-arm] [PATCH v2 2/2] Add a unique ID in the virt machine
 to be used as device ID
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
Cc: "mst@redhat.com" <mst@redhat.com>, Mike Caraman <mike.caraman@nxp.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel@redhat.com" <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>, Laurentiu
	Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z9Y3CPJWAM0A

--_000_AM3PR04MB0616B6DDCF5A59D8C29E9516FF890AM3PR04MB0616eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Thanks for looking into this.

On 07/26/2017 03:22 PM, Auger Eric wrote:

Hi Diana,
On 23/05/2017 13:12, Diana Craciun wrote:


Device IDs are required by the ARM GICv3 ITS for IRQ remapping.
Currently, for PCI devices, the requester ID was used as device
ID in the virt machine. If the system has multiple masters that


if the system has multiple root complex?

Well ... root complex is PCI specific terminology. Our device is not a PCI =
device. However masters is not the best choice either, it should be rephras=
ed.





use MSIs a unique ID accross the platform is needed.


across


A static scheme is used and each master is allocated a range of IDs
with the formula:
DeviceID =3D zero_extend( RequesterID[15:0] ) + 0x10000*Constant (as
recommended by SBSA).

This ID will be configured in the machine creation and if not configured
the PCI requester ID will be used insteead.


instead



Signed-off-by: Diana Craciun <diana.craciun@nxp.com><mailto:diana.craciun@n=
xp.com>
---
 hw/arm/virt.c              | 26 ++++++++++++++++++++++++++
 hw/pci-host/gpex.c         |  6 ++++++
 hw/pci/msi.c               |  2 +-
 hw/pci/pci.c               | 25 +++++++++++++++++++++++++
 include/hw/arm/virt.h      |  1 +
 include/hw/pci-host/gpex.h |  2 ++
 include/hw/pci/pci.h       |  8 ++++++++
 kvm-all.c                  |  4 ++--
 8 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5f62a03..a969694 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -110,6 +110,8 @@ static ARMPlatformBusSystemParams platform_bus_params;
 #define RAMLIMIT_GB 255
 #define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)

+#define STREAM_ID_RANGE_SIZE 0x10000
+
 /* Addresses and sizes of our components.
  * 0..128MB is space for a flash device so we can run bootrom code such as=
 UEFI.
  * 128MB..256MB is used for miscellaneous device I/O.
@@ -162,6 +164,22 @@ static const int a15irqmap[] =3D {
     [VIRT_PLATFORM_BUS] =3D 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 *=
/
 };

+/* Device IDs are required by the ARM GICV3 ITS for IRQ remapping. Current=
ly
+ * for PCI devices the requester ID was used as device ID. But if the syst=
em has
+ * multiple masters that use MSIs, the requester ID may cause deviceID cla=
shes.
+ * So a unique number is  needed accross the system.
+ * We are using the following formula:
+ * DeviceID =3D zero_extend( RequesterID[15:0] ) + 0x10000*Constant
+ * (as recommanded by SBSA). Currently we do not have an SMMU emulation, b=
ut the
+ * same formula can be used for the generation of the streamID as well.
+ * For each master the device ID will be derrived from the requester ID us=
ing
+ * the abovemntione formula.
+ */


I think most of this comment should only be in the commit message. typos
in derived and above mentioned.

OK.




stream id is the terminology for the id space at the input of the smmu.
device id is the terminology for the id space at the input of the msi
controller I think.

RID -> deviceID (no IOMMU)
RID -> streamID -> deviceID (IOMMU)

I would personally get rid of all streamid uses as the smmu is not yet
supported and stick to the
Documentation/devicetree/bindings/pci/pci-msi.txt terminology?


OK.





+
+static const uint32_t streamidmap[] =3D {
+    [VIRT_PCIE] =3D 0,         /* currently only one PCI controller */
+};
+
 static const char *valid_cpus[] =3D {
     "cortex-a15",
     "cortex-a53",
@@ -980,6 +998,7 @@ static void create_pcie(const VirtMachineState *vms, qe=
mu_irq *pic)
     hwaddr base_ecam =3D vms->memmap[VIRT_PCIE_ECAM].base;
     hwaddr size_ecam =3D vms->memmap[VIRT_PCIE_ECAM].size;
     hwaddr base =3D base_mmio;
+    uint32_t stream_id =3D vms->streamidmap[VIRT_PCIE] * STREAM_ID_RANGE_S=
IZE;


msi-base?

OK, I will get rid of the stream_id naming.



STREAM_ID_RANGE_SIZE ~ MSI_MAP_LENGTH?

OK.





     int nr_pcie_buses =3D size_ecam / PCIE_MMCFG_SIZE_MIN;
     int irq =3D vms->irqmap[VIRT_PCIE];
     MemoryRegion *mmio_alias;
@@ -992,6 +1011,7 @@ static void create_pcie(const VirtMachineState *vms, q=
emu_irq *pic)
     PCIHostState *pci;

     dev =3D qdev_create(NULL, TYPE_GPEX_HOST);
+    qdev_prop_set_uint32(dev, "stream-id-base", stream_id);
     qdev_init_nofail(dev);

     /* Map only the first size_ecam bytes of ECAM space */
@@ -1056,6 +1076,11 @@ static void create_pcie(const VirtMachineState *vms,=
 qemu_irq *pic)
     if (vms->msi_phandle) {
         qemu_fdt_setprop_cells(vms->fdt, nodename, "msi-parent",
                                vms->msi_phandle);
+        qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "msi-map",
+                                     1, 0,
+                                     1, vms->msi_phandle,
+                                     1, stream_id,
+                                     1, STREAM_ID_RANGE_SIZE);
     }

     qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
@@ -1609,6 +1634,7 @@ static void virt_2_9_instance_init(Object *obj)

     vms->memmap =3D a15memmap;
     vms->irqmap =3D a15irqmap;
+    vms->streamidmap =3D streamidmap;
 }

 static void virt_machine_2_9_options(MachineClass *mc)
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
index 66055ee..de72408 100644
--- a/hw/pci-host/gpex.c
+++ b/hw/pci-host/gpex.c
@@ -43,6 +43,11 @@ static void gpex_set_irq(void *opaque, int irq_num, int =
level)
     qemu_set_irq(s->irq[irq_num], level);
 }

+static Property gpex_props[] =3D {
+    DEFINE_PROP_UINT32("stream-id-base", GPEXHost, stream_id_base, 0),


msi_base_base


+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void gpex_host_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *pci =3D PCI_HOST_BRIDGE(dev);
@@ -83,6 +88,7 @@ static void gpex_host_class_init(ObjectClass *klass, void=
 *data)

     hc->root_bus_path =3D gpex_host_root_bus_path;
     dc->realize =3D gpex_host_realize;
+    dc->props =3D gpex_props;
     set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
     dc->fw_name =3D "pci";
 }
diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 7925851..b60a410 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -336,7 +336,7 @@ void msi_send_message(PCIDevice *dev, MSIMessage msg)
 {
     MemTxAttrs attrs =3D {};

-    attrs.stream_id =3D pci_requester_id(dev);
+    attrs.stream_id =3D pci_stream_id(dev);
     address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
                          attrs, NULL);
 }
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 259483b..92e9a2b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -951,6 +951,30 @@ uint16_t pci_requester_id(PCIDevice *dev)
     return pci_req_id_cache_extract(&dev->requester_id_cache);
 }

+static uint32_t pci_get_stream_id_base(PCIDevice *dev)
+{
+    PCIBus *rootbus =3D pci_device_root_bus(dev);
+    PCIHostState *host_bridge =3D PCI_HOST_BRIDGE(rootbus->qbus.parent);
+    Error *err =3D NULL;
+    int64_t stream_id;
+
+    stream_id =3D object_property_get_int(OBJECT(host_bridge), "stream-id-=
base",
+                                        &err);
+    if (stream_id < 0) {
+        stream_id =3D 0;
+    }
+
+    return stream_id;
+}
+
+uint32_t pci_stream_id(PCIDevice *dev)
+{
+    /* Stream ID =3D RequesterID[15:0] + stream_id_base. stream_id_base ma=
y
+     * be 0 for devices that are not using any translation between request=
er_id
+     * and stream_id */
+    return  (uint16_t)pci_requester_id(dev) + dev->stream_id_base;
+}


I think you should split the changes in virt from pci/gpex generic changes.

I agree.






+
 /* -1 for devfn means auto assign */
 static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,
                                          const char *name, int devfn,
@@ -1000,6 +1024,7 @@ static PCIDevice *do_pci_register_device(PCIDevice *p=
ci_dev, PCIBus *bus,

     pci_dev->devfn =3D devfn;
     pci_dev->requester_id_cache =3D pci_req_id_cache_get(pci_dev);
+    pci_dev->stream_id_base =3D pci_get_stream_id_base(pci_dev);


looks strange to me to store the rid base in the end point as this is
rather a property of the PCI complex. I acknowledge this is much more
simple than reworking pci_requester_id() though.

I actually did implemented it in a different way at the beginning:

+uint32_t pci_stream_id(PCIDevice *dev)
+{
+    PCIBus *rootbus =3D pci_device_root_bus(dev);
+    PCIHostState *host_bridge =3D PCI_HOST_BRIDGE(rootbus->qbus.parent);
+    Error *err =3D NULL;
+    int64_t stream_id;
+
+    stream_id =3D object_property_get_int(OBJECT(host_bridge), "stream-id-=
base",
+                                        &err);
+    if (stream_id < 0) {
+        stream_id =3D  0;
+    }
+    /* DeviceID =3D RequesterID[15:0] + stream_id_base. If the stream-id-b=
ase
+     * property is not found (e.g. for platforms that are not needing a
+     * global ID) the requester ID will be used instead. */
+    stream_id +=3D (uint16_t)pci_requester_id(dev);
+
+    return stream_id;
+}

The reason I have changed was to avoid traversing the entire hierarchy each=
 time the ID is needed (for example each time when a MSI is sent).







     memory_region_init(&pci_dev->bus_master_container_region, OBJECT(pci_d=
ev),
                        "bus master container", UINT64_MAX);
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3..94c007a 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -99,6 +99,7 @@ typedef struct {
     struct arm_boot_info bootinfo;
     const MemMapEntry *memmap;
     const int *irqmap;
+    const uint32_t *streamidmap;
     int smp_cpus;
     void *fdt;
     int fdt_size;
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index 68c9348..47df01a 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -48,6 +48,8 @@ typedef struct GPEXHost {

     GPEXRootState gpex_root;

+    uint32_t stream_id_base;
+
     MemoryRegion io_ioport;
     MemoryRegion io_mmio;
     qemu_irq irq[GPEX_NUM_IRQS];
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index a37a2d5..e6e9334 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -283,6 +283,12 @@ struct PCIDevice {
      * MSI). For conventional PCI root complex, this field is
      * meaningless. */
     PCIReqIDCache requester_id_cache;
+    /* Some platforms need a unique ID for IOMMU source identification
+     * or MSI source identification. QEMU implements a simple scheme:
+     * stream_id =3D  stream_id_base + requester_id. The stream_id_base wi=
ll
+     * ensure that all the devices in the system have different stream ID
+     * domains */
+    uint32_t stream_id_base;


get rid of IOMMU terminology?

OK.




Note that when adding other sub-systems you will need to address the
ACPI side as the IORT table built by hw/arm/virt-acpi-build.c currently
defines an RID mapping for the single root complex.

I am not quite familiar with ACPI but for sure I will take a look into this=
. Thanks for pointing it out.

Thanks,

Diana

--_000_AM3PR04MB0616B6DDCF5A59D8C29E9516FF890AM3PR04MB0616eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body bgcolor=3D"#FFFFFF" text=3D"#000000">
<div class=3D"moz-cite-prefix">Hi Eric,<br>
<br>
Thanks for looking into this.<br>
<br>
On 07/26/2017 03:22 PM, Auger Eric wrote:<br>
</div>
<blockquote cite=3D"mid:b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com" ty=
pe=3D"cite">
<pre wrap=3D"">Hi Diana,=0A=
On 23/05/2017 13:12, Diana Craciun wrote:=0A=
</pre>
<blockquote type=3D"cite">
<pre wrap=3D"">Device IDs are required by the ARM GICv3 ITS for IRQ remappi=
ng.=0A=
Currently, for PCI devices, the requester ID was used as device=0A=
ID in the virt machine. If the system has multiple masters that=0A=
</pre>
</blockquote>
<pre wrap=3D"">if the system has multiple root complex?</pre>
</blockquote>
<br>
Well ... root complex is PCI specific terminology. Our device is not a PCI =
device. However masters is not the best choice either, it should be rephras=
ed.<br>
<br>
<blockquote cite=3D"mid:b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com" ty=
pe=3D"cite">
<pre wrap=3D"">=0A=
</pre>
<blockquote type=3D"cite">
<pre wrap=3D"">use MSIs a unique ID accross the platform is needed.=0A=
</pre>
</blockquote>
<pre wrap=3D"">across=0A=
</pre>
<blockquote type=3D"cite">
<pre wrap=3D"">A static scheme is used and each master is allocated a range=
 of IDs=0A=
with the formula:=0A=
DeviceID =3D zero_extend( RequesterID[15:0] ) &#43; 0x10000*Constant (as=0A=
recommended by SBSA).=0A=
=0A=
This ID will be configured in the machine creation and if not configured=0A=
the PCI requester ID will be used insteead.=0A=
</pre>
</blockquote>
<pre wrap=3D"">instead=0A=
</pre>
<blockquote type=3D"cite">
<pre wrap=3D"">=0A=
Signed-off-by: Diana Craciun <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:diana.craciun@nxp.com">&lt;diana.craciun@nxp.com&gt;</a>=0A=
---=0A=
 hw/arm/virt.c              | 26 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;=0A=
 hw/pci-host/gpex.c         |  6 &#43;&#43;&#43;&#43;&#43;&#43;=0A=
 hw/pci/msi.c               |  2 &#43;-=0A=
 hw/pci/pci.c               | 25 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;=0A=
 include/hw/arm/virt.h      |  1 &#43;=0A=
 include/hw/pci-host/gpex.h |  2 &#43;&#43;=0A=
 include/hw/pci/pci.h       |  8 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
=0A=
 kvm-all.c                  |  4 &#43;&#43;--=0A=
 8 files changed, 71 insertions(&#43;), 3 deletions(-)=0A=
=0A=
diff --git a/hw/arm/virt.c b/hw/arm/virt.c=0A=
index 5f62a03..a969694 100644=0A=
--- a/hw/arm/virt.c=0A=
&#43;&#43;&#43; b/hw/arm/virt.c=0A=
@@ -110,6 &#43;110,8 @@ static ARMPlatformBusSystemParams platform_bus_para=
ms;=0A=
 #define RAMLIMIT_GB 255=0A=
 #define RAMLIMIT_BYTES (RAMLIMIT_GB * 1024ULL * 1024 * 1024)=0A=
 =0A=
&#43;#define STREAM_ID_RANGE_SIZE 0x10000=0A=
&#43;=0A=
 /* Addresses and sizes of our components.=0A=
  * 0..128MB is space for a flash device so we can run bootrom code such as=
 UEFI.=0A=
  * 128MB..256MB is used for miscellaneous device I/O.=0A=
@@ -162,6 &#43;164,22 @@ static const int a15irqmap[] =3D {=0A=
     [VIRT_PLATFORM_BUS] =3D 112, /* ...to 112 &#43; PLATFORM_BUS_NUM_IRQS =
-1 */=0A=
 };=0A=
 =0A=
&#43;/* Device IDs are required by the ARM GICV3 ITS for IRQ remapping. Cur=
rently=0A=
&#43; * for PCI devices the requester ID was used as device ID. But if the =
system has=0A=
&#43; * multiple masters that use MSIs, the requester ID may cause deviceID=
 clashes.=0A=
&#43; * So a unique number is  needed accross the system.=0A=
&#43; * We are using the following formula:=0A=
&#43; * DeviceID =3D zero_extend( RequesterID[15:0] ) &#43; 0x10000*Constan=
t=0A=
&#43; * (as recommanded by SBSA). Currently we do not have an SMMU emulatio=
n, but the=0A=
&#43; * same formula can be used for the generation of the streamID as well=
.=0A=
&#43; * For each master the device ID will be derrived from the requester I=
D using=0A=
&#43; * the abovemntione formula.=0A=
&#43; */=0A=
</pre>
</blockquote>
<pre wrap=3D"">I think most of this comment should only be in the commit me=
ssage. typos=0A=
in derived and above mentioned.</pre>
</blockquote>
<br>
OK.<br>
<br>
<blockquote cite=3D"mid:b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com" ty=
pe=3D"cite">
<pre wrap=3D"">=0A=
=0A=
stream id is the terminology for the id space at the input of the smmu.=0A=
device id is the terminology for the id space at the input of the msi=0A=
controller I think.=0A=
=0A=
RID -&gt; deviceID (no IOMMU)=0A=
RID -&gt; streamID -&gt; deviceID (IOMMU)=0A=
=0A=
I would personally get rid of all streamid uses as the smmu is not yet=0A=
supported and stick to the=0A=
Documentation/devicetree/bindings/pci/pci-msi.txt terminology?=0A=
</pre>
</blockquote>
<br>
OK.<br>
<br>
<blockquote cite=3D"mid:b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com" ty=
pe=3D"cite">
<pre wrap=3D"">=0A=
</pre>
<blockquote type=3D"cite">
<pre wrap=3D"">&#43;=0A=
&#43;static const uint32_t streamidmap[] =3D {=0A=
&#43;    [VIRT_PCIE] =3D 0,         /* currently only one PCI controller */=
=0A=
&#43;};=0A=
&#43;=0A=
 static const char *valid_cpus[] =3D {=0A=
     &quot;cortex-a15&quot;,=0A=
     &quot;cortex-a53&quot;,=0A=
@@ -980,6 &#43;998,7 @@ static void create_pcie(const VirtMachineState *vms=
, qemu_irq *pic)=0A=
     hwaddr base_ecam =3D vms-&gt;memmap[VIRT_PCIE_ECAM].base;=0A=
     hwaddr size_ecam =3D vms-&gt;memmap[VIRT_PCIE_ECAM].size;=0A=
     hwaddr base =3D base_mmio;=0A=
&#43;    uint32_t stream_id =3D vms-&gt;streamidmap[VIRT_PCIE] * STREAM_ID_=
RANGE_SIZE;=0A=
</pre>
</blockquote>
<pre wrap=3D"">msi-base?</pre>
</blockquote>
<br>
OK, I will get rid of the stream_id naming.<br>
<br>
<blockquote cite=3D"mid:b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com" ty=
pe=3D"cite">
<pre wrap=3D"">=0A=
STREAM_ID_RANGE_SIZE ~ MSI_MAP_LENGTH?</pre>
</blockquote>
<br>
OK.<br>
<br>
<blockquote cite=3D"mid:b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com" ty=
pe=3D"cite">
<pre wrap=3D"">=0A=
</pre>
<blockquote type=3D"cite">
<pre wrap=3D"">     int nr_pcie_buses =3D size_ecam / PCIE_MMCFG_SIZE_MIN;=
=0A=
     int irq =3D vms-&gt;irqmap[VIRT_PCIE];=0A=
     MemoryRegion *mmio_alias;=0A=
@@ -992,6 &#43;1011,7 @@ static void create_pcie(const VirtMachineState *vm=
s, qemu_irq *pic)=0A=
     PCIHostState *pci;=0A=
 =0A=
     dev =3D qdev_create(NULL, TYPE_GPEX_HOST);=0A=
&#43;    qdev_prop_set_uint32(dev, &quot;stream-id-base&quot;, stream_id);=
=0A=
     qdev_init_nofail(dev);=0A=
 =0A=
     /* Map only the first size_ecam bytes of ECAM space */=0A=
@@ -1056,6 &#43;1076,11 @@ static void create_pcie(const VirtMachineState *=
vms, qemu_irq *pic)=0A=
     if (vms-&gt;msi_phandle) {=0A=
         qemu_fdt_setprop_cells(vms-&gt;fdt, nodename, &quot;msi-parent&quo=
t;,=0A=
                                vms-&gt;msi_phandle);=0A=
&#43;        qemu_fdt_setprop_sized_cells(vms-&gt;fdt, nodename, &quot;msi-=
map&quot;,=0A=
&#43;                                     1, 0,=0A=
&#43;                                     1, vms-&gt;msi_phandle,=0A=
&#43;                                     1, stream_id,=0A=
&#43;                                     1, STREAM_ID_RANGE_SIZE);=0A=
     }=0A=
 =0A=
     qemu_fdt_setprop_sized_cells(vms-&gt;fdt, nodename, &quot;reg&quot;,=
=0A=
@@ -1609,6 &#43;1634,7 @@ static void virt_2_9_instance_init(Object *obj)=
=0A=
 =0A=
     vms-&gt;memmap =3D a15memmap;=0A=
     vms-&gt;irqmap =3D a15irqmap;=0A=
&#43;    vms-&gt;streamidmap =3D streamidmap;=0A=
 }=0A=
 =0A=
 static void virt_machine_2_9_options(MachineClass *mc)=0A=
diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c=0A=
index 66055ee..de72408 100644=0A=
--- a/hw/pci-host/gpex.c=0A=
&#43;&#43;&#43; b/hw/pci-host/gpex.c=0A=
@@ -43,6 &#43;43,11 @@ static void gpex_set_irq(void *opaque, int irq_num, =
int level)=0A=
     qemu_set_irq(s-&gt;irq[irq_num], level);=0A=
 }=0A=
 =0A=
&#43;static Property gpex_props[] =3D {=0A=
&#43;    DEFINE_PROP_UINT32(&quot;stream-id-base&quot;, GPEXHost, stream_id=
_base, 0),=0A=
</pre>
</blockquote>
<pre wrap=3D"">msi_base_base=0A=
</pre>
<blockquote type=3D"cite">
<pre wrap=3D"">&#43;    DEFINE_PROP_END_OF_LIST(),=0A=
&#43;};=0A=
&#43;=0A=
 static void gpex_host_realize(DeviceState *dev, Error **errp)=0A=
 {=0A=
     PCIHostState *pci =3D PCI_HOST_BRIDGE(dev);=0A=
@@ -83,6 &#43;88,7 @@ static void gpex_host_class_init(ObjectClass *klass, =
void *data)=0A=
 =0A=
     hc-&gt;root_bus_path =3D gpex_host_root_bus_path;=0A=
     dc-&gt;realize =3D gpex_host_realize;=0A=
&#43;    dc-&gt;props =3D gpex_props;=0A=
     set_bit(DEVICE_CATEGORY_BRIDGE, dc-&gt;categories);=0A=
     dc-&gt;fw_name =3D &quot;pci&quot;;=0A=
 }=0A=
diff --git a/hw/pci/msi.c b/hw/pci/msi.c=0A=
index 7925851..b60a410 100644=0A=
--- a/hw/pci/msi.c=0A=
&#43;&#43;&#43; b/hw/pci/msi.c=0A=
@@ -336,7 &#43;336,7 @@ void msi_send_message(PCIDevice *dev, MSIMessage ms=
g)=0A=
 {=0A=
     MemTxAttrs attrs =3D {};=0A=
 =0A=
-    attrs.stream_id =3D pci_requester_id(dev);=0A=
&#43;    attrs.stream_id =3D pci_stream_id(dev);=0A=
     address_space_stl_le(&amp;dev-&gt;bus_master_as, msg.address, msg.data=
,=0A=
                          attrs, NULL);=0A=
 }=0A=
diff --git a/hw/pci/pci.c b/hw/pci/pci.c=0A=
index 259483b..92e9a2b 100644=0A=
--- a/hw/pci/pci.c=0A=
&#43;&#43;&#43; b/hw/pci/pci.c=0A=
@@ -951,6 &#43;951,30 @@ uint16_t pci_requester_id(PCIDevice *dev)=0A=
     return pci_req_id_cache_extract(&amp;dev-&gt;requester_id_cache);=0A=
 }=0A=
 =0A=
&#43;static uint32_t pci_get_stream_id_base(PCIDevice *dev)=0A=
&#43;{=0A=
&#43;    PCIBus *rootbus =3D pci_device_root_bus(dev);=0A=
&#43;    PCIHostState *host_bridge =3D PCI_HOST_BRIDGE(rootbus-&gt;qbus.par=
ent);=0A=
&#43;    Error *err =3D NULL;=0A=
&#43;    int64_t stream_id;=0A=
&#43;=0A=
&#43;    stream_id =3D object_property_get_int(OBJECT(host_bridge), &quot;s=
tream-id-base&quot;,=0A=
&#43;                                        &amp;err);=0A=
&#43;    if (stream_id &lt; 0) {=0A=
&#43;        stream_id =3D 0;=0A=
&#43;    }=0A=
&#43;=0A=
&#43;    return stream_id;=0A=
&#43;}=0A=
&#43;=0A=
&#43;uint32_t pci_stream_id(PCIDevice *dev)=0A=
&#43;{=0A=
&#43;    /* Stream ID =3D RequesterID[15:0] &#43; stream_id_base. stream_id=
_base may=0A=
&#43;     * be 0 for devices that are not using any translation between req=
uester_id=0A=
&#43;     * and stream_id */=0A=
&#43;    return  (uint16_t)pci_requester_id(dev) &#43; dev-&gt;stream_id_ba=
se;=0A=
&#43;}=0A=
</pre>
</blockquote>
<pre wrap=3D"">I think you should split the changes in virt from pci/gpex g=
eneric changes.</pre>
</blockquote>
<br>
I agree.<br>
<br>
<blockquote cite=3D"mid:b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com" ty=
pe=3D"cite">
<pre wrap=3D"">=0A=
=0A=
</pre>
<blockquote type=3D"cite">
<pre wrap=3D"">&#43;=0A=
 /* -1 for devfn means auto assign */=0A=
 static PCIDevice *do_pci_register_device(PCIDevice *pci_dev, PCIBus *bus,=
=0A=
                                          const char *name, int devfn,=0A=
@@ -1000,6 &#43;1024,7 @@ static PCIDevice *do_pci_register_device(PCIDevic=
e *pci_dev, PCIBus *bus,=0A=
 =0A=
     pci_dev-&gt;devfn =3D devfn;=0A=
     pci_dev-&gt;requester_id_cache =3D pci_req_id_cache_get(pci_dev);=0A=
&#43;    pci_dev-&gt;stream_id_base =3D pci_get_stream_id_base(pci_dev);=0A=
</pre>
</blockquote>
<pre wrap=3D"">looks strange to me to store the rid base in the end point a=
s this is=0A=
rather a property of the PCI complex. I acknowledge this is much more=0A=
simple than reworking pci_requester_id() though.</pre>
</blockquote>
<br>
I actually did implemented it in a different way at the beginning:<br>
<br>
&#43;uint32_t pci_stream_id(PCIDevice *dev)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp; PCIBus *rootbus =3D pci_device_root_bus(dev);<br>
&#43;&nbsp;&nbsp;&nbsp; PCIHostState *host_bridge =3D PCI_HOST_BRIDGE(rootb=
us-&gt;qbus.parent);<br>
&#43;&nbsp;&nbsp;&nbsp; Error *err =3D NULL;<br>
&#43;&nbsp;&nbsp;&nbsp; int64_t stream_id;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp; stream_id =3D object_property_get_int(OBJECT(host_b=
ridge), &quot;stream-id-base&quot;,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &amp;err);<br>
&#43;&nbsp;&nbsp;&nbsp; if (stream_id &lt; 0) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stream_id =3D&nbsp; 0;<br>
&#43;&nbsp;&nbsp;&nbsp; }<br>
&#43;&nbsp;&nbsp;&nbsp; /* DeviceID =3D RequesterID[15:0] &#43; stream_id_b=
ase. If the stream-id-base<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; * property is not found (e.g. for platforms t=
hat are not needing a<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp; * global ID) the requester ID will be used in=
stead. */<br>
&#43;&nbsp;&nbsp;&nbsp; stream_id &#43;=3D (uint16_t)pci_requester_id(dev);=
<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp; return stream_id;<br>
&#43;} <br>
<br>
The reason I have changed was to avoid traversing the entire hierarchy each=
 time the ID is needed (for example each time when a MSI is sent).<br>
<br>
<br>
<blockquote cite=3D"mid:b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com" ty=
pe=3D"cite">
<pre wrap=3D"">=0A=
</pre>
<blockquote type=3D"cite">
<pre wrap=3D""> =0A=
     memory_region_init(&amp;pci_dev-&gt;bus_master_container_region, OBJEC=
T(pci_dev),=0A=
                        &quot;bus master container&quot;, UINT64_MAX);=0A=
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h=0A=
index 33b0ff3..94c007a 100644=0A=
--- a/include/hw/arm/virt.h=0A=
&#43;&#43;&#43; b/include/hw/arm/virt.h=0A=
@@ -99,6 &#43;99,7 @@ typedef struct {=0A=
     struct arm_boot_info bootinfo;=0A=
     const MemMapEntry *memmap;=0A=
     const int *irqmap;=0A=
&#43;    const uint32_t *streamidmap;=0A=
     int smp_cpus;=0A=
     void *fdt;=0A=
     int fdt_size;=0A=
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h=0A=
index 68c9348..47df01a 100644=0A=
--- a/include/hw/pci-host/gpex.h=0A=
&#43;&#43;&#43; b/include/hw/pci-host/gpex.h=0A=
@@ -48,6 &#43;48,8 @@ typedef struct GPEXHost {=0A=
 =0A=
     GPEXRootState gpex_root;=0A=
 =0A=
&#43;    uint32_t stream_id_base;=0A=
&#43;=0A=
     MemoryRegion io_ioport;=0A=
     MemoryRegion io_mmio;=0A=
     qemu_irq irq[GPEX_NUM_IRQS];=0A=
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h=0A=
index a37a2d5..e6e9334 100644=0A=
--- a/include/hw/pci/pci.h=0A=
&#43;&#43;&#43; b/include/hw/pci/pci.h=0A=
@@ -283,6 &#43;283,12 @@ struct PCIDevice {=0A=
      * MSI). For conventional PCI root complex, this field is=0A=
      * meaningless. */=0A=
     PCIReqIDCache requester_id_cache;=0A=
&#43;    /* Some platforms need a unique ID for IOMMU source identification=
=0A=
&#43;     * or MSI source identification. QEMU implements a simple scheme:=
=0A=
&#43;     * stream_id =3D  stream_id_base &#43; requester_id. The stream_id=
_base will=0A=
&#43;     * ensure that all the devices in the system have different stream=
 ID=0A=
&#43;     * domains */=0A=
&#43;    uint32_t stream_id_base;=0A=
</pre>
</blockquote>
<pre wrap=3D"">get rid of IOMMU terminology?</pre>
</blockquote>
<br>
OK.<br>
<br>
<blockquote cite=3D"mid:b58ccac8-06f0-d02d-5f65-c2a8d47c229b@redhat.com" ty=
pe=3D"cite">
<pre wrap=3D"">=0A=
=0A=
Note that when adding other sub-systems you will need to address the=0A=
ACPI side as the IORT table built by hw/arm/virt-acpi-build.c currently=0A=
defines an RID mapping for the single root complex.</pre>
</blockquote>
<br>
I am not quite familiar with ACPI but for sure I will take a look into this=
. Thanks for pointing it out.<br>
<br>
Thanks,<br>
<br>
Diana<br>
</body>
</html>

--_000_AM3PR04MB0616B6DDCF5A59D8C29E9516FF890AM3PR04MB0616eurp_--
