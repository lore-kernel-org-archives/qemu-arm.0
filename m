Received: by 10.25.0.23 with SMTP id 23csp714401lfa;
        Sun, 11 Jun 2017 22:59:18 -0700 (PDT)
X-Received: by 10.237.56.228 with SMTP id k91mr14461731qte.41.1497247158794;
        Sun, 11 Jun 2017 22:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497247158; cv=none;
        d=google.com; s=arc-20160816;
        b=fUxHrNQkpKTIR0wmjA0lo44Jt2WrA3t7IC94bX7C1Me6FAzXNgUeVXihK7EtTu4WIl
         N7eC+23SNRC2FInSLWbxhmRtI+0zcXjyXo21vZLazUi+Vl5qqlyQ4kKIcK3IEY4b2icf
         vfbqmkcEuls6KLB2MW4uXSKjoYHIVuYEAayR2HPDNQNCwNEiU8c9qmhy9s+lK00t5HWw
         TtNSzcUDVhHS0WuQt+ZtPFxiRgEGgufhHJheEYpU3wDtzPYRNMtkAfybX5cXPqKPucjh
         TjUoQqIOmL9g+CZVzE1dPKZYLm4ngUw106YaS8tDOeFzegQDTz/1r+S21m7ucptQkosE
         Saqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=qDOCuEHNgl0TBU+idw4/QPIf0L6plHGhMz2q1xv4EiM=;
        b=JT1iceAYIejU1D70bv0/Y30P1P/OAJd8dL93NZ8PJN9epf0ybmW4GiIYbpJ/SaNZRR
         RB7wxleK5gNNqi1anWk8BEJlPDQmBhDBRAb1fqDgASHYZoxaQG3ST7rW1PPTx21ElOW4
         eLuf4eDOMiNo18ZYSD7Ilb+fSfExVe+2prslScgcaGRGFU0ZbgJYGqpdNzwtfgrg1mdh
         iQoAy4HNjEsdMbWJNF0/AONDuYs7FZ4uqTG5n2fgvSMgKqjgqZvwhg2hNJ6qPxMEAJSl
         InrqHm3T8IdTbxk5UEsz28jc29SSEZOm1LCQ2W1uT0wampR+6Nntw9HAK9ufbGpLP4S/
         NEag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 90si3915526qky.286.2017.06.11.22.59.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Jun 2017 22:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:36228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dKINf-00034L-Df
	for alex.bennee@linaro.org; Mon, 12 Jun 2017 01:59:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dKINb-00034D-Jh
	for qemu-arm@nongnu.org; Mon, 12 Jun 2017 01:59:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dKINY-0000KE-Cj
	for qemu-arm@nongnu.org; Mon, 12 Jun 2017 01:59:11 -0400
Received: from mail-eopbgr50087.outbound.protection.outlook.com
	([40.107.5.87]:5591
	helo=EUR03-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dKINX-0000JS-SH; Mon, 12 Jun 2017 01:59:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=qDOCuEHNgl0TBU+idw4/QPIf0L6plHGhMz2q1xv4EiM=;
	b=hkn5OEFXYJFgw6msShLhOUgsAXSNkZV0VIYv1bPR8XfOfHud6xpLqAiBQb3bLaTErvKOD2hRDAh0FgmDMlIj3IYq0+lDt77aZw8Yq2vdThBk61lLdPReyj7/MvtvH/yxIndwkr5wwt3ZZj4ko2NFgjTJ2WaYoaaXX+p7AVihYgw=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2548.eurprd04.prod.outlook.com (10.169.245.11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Mon, 12 Jun 2017 05:59:03 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::50bc:c8c2:47cb:95da]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::50bc:c8c2:47cb:95da%17]) with mapi id 15.01.1157.014;
	Mon, 12 Jun 2017 05:59:03 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "jean-philippe.brucker@arm.com"
	<jean-philippe.brucker@arm.com>
Thread-Topic: [RFC v2 5/8] virtio_iommu: Add the iommu regions
Thread-Index: AQHS36dsha7D6x4Aa0iBtsypdKSSZKIgwlAw
Date: Mon, 12 Jun 2017 05:59:03 +0000
Message-ID: <AM5PR0401MB25452EEAC31C36F5745038619ACD0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-6-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496851287-9428-6-git-send-email-eric.auger@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2548;
	7:tq7uD+VgHDTCzorQTaeSEK9VccBGqHk+WJZ4d/hrpaBbSTeHw7kCRQeJeIOgc1vdEIkl0Q9jbu9NPYXZ1i53Pf8yExtd6s8CGN0KfS84D9i3vnfod5NMCSpJ5HyLkljXEpUyg+3yVKXXZWMl/7It4PC2f3T0ZhfQSgnZr5N+fiFEnPKkQA3krErmZ5HCHdP3UWWvjCkqKILvXktL4l3LOO1rR0EIjCT+wFqJ3xhYyVk3pkqGvkfHPh6SKQJG2ea0YVqow7jBwAbhL1ih4PPALP9EXup55ON7egUuQfqiy0DJSnaMK3VAhiWqTBzNAa28npt1/8VhF8bTqrYQhavNow==
x-ms-traffictypediagnostic: AM5PR0401MB2548:
x-ms-office365-filtering-correlation-id: cac5b756-8f79-4ad2-074f-08d4b1582128
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081);
	SRVR:AM5PR0401MB2548; 
x-microsoft-antispam-prvs: <AM5PR0401MB2548CA328EBC9FBBB268D3BC9ACD0@AM5PR0401MB2548.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(185117386973197)(228905959029699); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6055026)(6041248)(20161123560025)(20161123558100)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2548; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2548; 
x-forefront-prvs: 03361FCC43
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39850400002)(39410400002)(39400400002)(39450400003)(39860400002)(39840400002)(377454003)(13464003)(8676002)(6436002)(7736002)(33656002)(189998001)(38730400002)(6246003)(5250100002)(7696004)(2501003)(25786009)(5660300001)(5890100001)(3280700002)(39060400002)(4326008)(3660700001)(53546009)(74316002)(9686003)(2906002)(3846002)(305945005)(66066001)(7416002)(99286003)(55016002)(54906002)(478600001)(50986999)(76176999)(54356999)(229853002)(6116002)(81166006)(2900100001)(8936002)(102836003)(2201001)(6506006)(86362001)(2950100002)(14454004)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2548;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2017 05:59:03.4950 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2548
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.5.87
Subject: Re: [Qemu-arm] [RFC v2 5/8] virtio_iommu: Add the iommu regions
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HLUYKH1xPL8m

Hi Eric,

> -----Original Message-----
> From: Eric Auger [mailto:eric.auger@redhat.com]
> Sent: Wednesday, June 07, 2017 9:31 PM
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
> philippe.brucker@arm.com
> Cc: will.deacon@arm.com; robin.murphy@arm.com; kevin.tian@intel.com;
> marc.zyngier@arm.com; christoffer.dall@linaro.org; drjones@redhat.com;
> wei@redhat.com; tn@semihalf.com; Bharat Bhushan
> <bharat.bhushan@nxp.com>
> Subject: [RFC v2 5/8] virtio_iommu: Add the iommu regions
>=20
> This patch initializes the iommu memory regions so that
> PCIe end point transactions get translated. The translation function
> is not yet implemented at that stage.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/virtio/trace-events   |  1 +
>  hw/virtio/virtio-iommu.c | 97
> ++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 98 insertions(+)
>=20
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index fba1da6..341dbdf 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -32,3 +32,4 @@ virtio_iommu_attach(uint32_t as, uint32_t dev, uint32_t
> flags) "as=3D%d dev=3D%d fla
>  virtio_iommu_detach(uint32_t dev, uint32_t flags) "dev=3D%d flags=3D%d"
>  virtio_iommu_map(uint32_t as, uint64_t phys_addr, uint64_t virt_addr,
> uint64_t size, uint32_t flags) "as=3D %d phys_addr=3D0x%"PRIx64"
> virt_addr=3D0x%"PRIx64" size=3D0x%"PRIx64" flags=3D%d"
>  virtio_iommu_unmap(uint32_t as, uint64_t virt_addr, uint64_t size, uint3=
2_t
> reserved) "as=3D %d virt_addr=3D0x%"PRIx64" size=3D0x%"PRIx64" reserved=
=3D%d"
> +virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, in=
t
> flag) "mr=3D%s rid=3D%d addr=3D0x%"PRIx64" flag=3D%d"
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index ea1caa7..902c779 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -23,6 +23,7 @@
>  #include "hw/virtio/virtio.h"
>  #include "sysemu/kvm.h"
>  #include "qapi-event.h"
> +#include "qemu/error-report.h"
>  #include "trace.h"
>=20
>  #include "standard-headers/linux/virtio_ids.h"
> @@ -35,6 +36,59 @@
>  /* Max size */
>  #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>=20
> +static inline uint16_t smmu_get_sid(IOMMUDevice *dev)

This should be virtio-iommu not smmu ?

Thanks
-Bharat

> +{
> +    return  ((pci_bus_num(dev->bus) & 0xff) << 8) | dev->devfn;
> +}
> +
> +static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void
> *opaque,
> +                                              int devfn)
> +{
> +    VirtIOIOMMU *s =3D opaque;
> +    uintptr_t key =3D (uintptr_t)bus;
> +    IOMMUPciBus *sbus =3D g_hash_table_lookup(s->as_by_busptr, &key);
> +    IOMMUDevice *sdev;
> +
> +    if (!sbus) {
> +        uintptr_t *new_key =3D g_malloc(sizeof(*new_key));
> +
> +        *new_key =3D (uintptr_t)bus;
> +        sbus =3D g_malloc0(sizeof(IOMMUPciBus) +
> +                         sizeof(IOMMUDevice *) * IOMMU_PCI_DEVFN_MAX);
> +        sbus->bus =3D bus;
> +        g_hash_table_insert(s->as_by_busptr, new_key, sbus);
> +    }
> +
> +    sdev =3D sbus->pbdev[devfn];
> +    if (!sdev) {
> +        sdev =3D sbus->pbdev[devfn] =3D g_malloc0(sizeof(IOMMUDevice));
> +
> +        sdev->viommu =3D s;
> +        sdev->bus =3D bus;
> +        sdev->devfn =3D devfn;
> +
> +        memory_region_init_iommu(&sdev->iommu_mr, OBJECT(s),
> +                                 &s->iommu_ops, TYPE_VIRTIO_IOMMU,
> +                                 UINT64_MAX);
> +        address_space_init(&sdev->as, &sdev->iommu_mr,
> TYPE_VIRTIO_IOMMU);
> +    }
> +
> +    return &sdev->as;
> +
> +}
> +
> +static void virtio_iommu_init_as(VirtIOIOMMU *s)
> +{
> +    PCIBus *pcibus =3D pci_find_primary_bus();
> +
> +    if (pcibus) {
> +        pci_setup_iommu(pcibus, virtio_iommu_find_add_as, s);
> +    } else {
> +        error_report("No PCI bus, virtio-iommu is not registered");
> +    }
> +}
> +
> +
>  static int virtio_iommu_attach(VirtIOIOMMU *s,
>                                 struct virtio_iommu_req_attach *req)
>  {
> @@ -208,6 +262,26 @@ static void
> virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
>      }
>  }
>=20
> +static IOMMUTLBEntry virtio_iommu_translate(MemoryRegion *mr,
> hwaddr addr,
> +                                            IOMMUAccessFlags flag)
> +{
> +    IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);
> +    uint32_t sid;
> +
> +    IOMMUTLBEntry entry =3D {
> +        .target_as =3D &address_space_memory,
> +        .iova =3D addr,
> +        .translated_addr =3D addr,
> +        .addr_mask =3D ~(hwaddr)0,
> +        .perm =3D IOMMU_NONE,
> +    };
> +
> +    sid =3D smmu_get_sid(sdev);
> +
> +    trace_virtio_iommu_translate(mr->name, sid, addr, flag);
> +    return entry;
> +}
> +
>  static void virtio_iommu_get_config(VirtIODevice *vdev, uint8_t
> *config_data)
>  {
>      VirtIOIOMMU *dev =3D VIRTIO_IOMMU(vdev);
> @@ -253,6 +327,21 @@ static const VMStateDescription
> vmstate_virtio_iommu_device =3D {
>      },
>  };
>=20
> +/*****************************
> + * Hash Table
> + *****************************/
> +
> +static inline gboolean as_uint64_equal(gconstpointer v1, gconstpointer v=
2)
> +{
> +    return *((const uint64_t *)v1) =3D=3D *((const uint64_t *)v2);
> +}
> +
> +static inline guint as_uint64_hash(gconstpointer v)
> +{
> +    return (guint)*(const uint64_t *)v;
> +}
> +
> +
>  static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>  {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> @@ -266,6 +355,14 @@ static void virtio_iommu_device_realize(DeviceState
> *dev, Error **errp)
>=20
>      s->config.page_sizes =3D ~((1ULL << 12) - 1);
>      s->config.input_range.end =3D -1UL;
> +
> +    s->iommu_ops.translate =3D virtio_iommu_translate;
> +    memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
> +    s->as_by_busptr =3D g_hash_table_new_full(as_uint64_hash,
> +                                            as_uint64_equal,
> +                                            g_free, g_free);
> +
> +    virtio_iommu_init_as(s);
>  }
>=20
>  static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp=
)
> --
> 2.5.5

