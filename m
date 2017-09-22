Received: by 10.223.172.38 with SMTP id v35csp2803690wrc;
        Fri, 22 Sep 2017 00:31:14 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD0uV9B5XMbcUJe7jT+JDbjuLj1EM8Um3xlbq0TcQk/OAxaFWqrNglgkAqROwgD3fk3CnZS
X-Received: by 10.200.9.61 with SMTP id t58mr7342729qth.317.1506065474578;
        Fri, 22 Sep 2017 00:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506065474; cv=none;
        d=google.com; s=arc-20160816;
        b=cmHJeTdX235B+UxkLUk8Du9gcOrq9tqnxD7G2MCSUq1gjyj05R6PmotwUeTVXVO/y0
         Zq8ywn1yRHBesDz/k3Lxgeowc5QW2D3flnWqwu+2aJucwUOEb76dzdtd2bQ0K4NiPtDe
         QyTN8dZJRhSoGwhJCdT9+qwMfCO7OTkXpPpNV7CBNTyzmzbsgwLgDDElHgeGFnA/HEKL
         6CHoZqSPvGjfhS4Mrz0AJZLyzO4DYdLedfS7qLRFAczCQ5jOwK1lwHJE3SNyVqyULmY5
         Ag00XsmG8EgPQOtGC+NSjGiYlchBiJGwnnizq+4w5RF1O5ntybaHaP8HPGKAn2ce3X+7
         jYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=IpwpFvb5EuYaTserbLlqaj9YhCofzGHNVxASsAVAO3o=;
        b=qP3+TM6B6Y8HYLQd0XSq7013RAnlq7kSdpuQ6n0fzekT/PAIiFNTnkz4RuJlXdltW/
         HW/RDv53936/Y1SNRh2hF/tk3xe2u/gDIXDg5NXAE8UHyuAmdK8NpwGuR+JzUKwy9B9F
         Os5HM8iZn9KZlP54ABaoFOwRMD7FFVDj6swlSz83W+ECHL+aGdBVAUKkXyfbwt9ej4D2
         vzgoYWB+Ket2PCXrYrNXD9pG9uLVnWtHuUGYFoHmK0teooNvhzxOL6m7ng2+6NJquAi4
         znLZNtAKyKdV11zOxcRIFoGweGl77fWl/YOwwMk7CDJ0V8nJzv+7+yBHj1CH4a2I0DDv
         XX9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=vH+HjZUW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n44si3267976qta.141.2017.09.22.00.31.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 00:31:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=vH+HjZUW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:57081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvIQZ-0001zJ-T9
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 03:31:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dvIPS-00016d-V1
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 03:30:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dvIPP-0006Zf-KT
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 03:30:02 -0400
Received: from mail-he1eur01on0073.outbound.protection.outlook.com
	([104.47.0.73]:20800
	helo=EUR01-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dvIPP-0006XV-43; Fri, 22 Sep 2017 03:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=IpwpFvb5EuYaTserbLlqaj9YhCofzGHNVxASsAVAO3o=;
	b=vH+HjZUWpGoa1BFNA45yTao6Itts4KR1dvtZGE1+IdMkbAmhwqcYXloi9LKQ4DhrFp8tb7NVDCncmzRzBJZcZ7n80tRjouo9imrdvrp+Hz76hsPRwGDxlbXxc9hCGhKWT/Ai5rI6MyV63cXT+r3BrSJjgs+w7JuPUctWx4xs1TI=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2547.eurprd04.prod.outlook.com (10.169.245.10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Fri, 22 Sep 2017 07:29:55 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327%18]) with mapi id 15.20.0077.011;
	Fri, 22 Sep 2017 07:29:55 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "jean-philippe.brucker@arm.com"
	<jean-philippe.brucker@arm.com>
Thread-Topic: [RFC v4 06/16] virtio-iommu: Register attached devices
Thread-Index: AQHTMRumtxy7OYfQbUSfg0b0w0wpQKLAg7Cw
Date: Fri, 22 Sep 2017 07:29:55 +0000
Message-ID: <AM5PR0401MB2545106DCDDCEEE06A18B9F29A670@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
	<1505807208-9063-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1505807208-9063-7-git-send-email-eric.auger@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2547;
	6:vmylrv48DHDtbXh/U9fOZO2ReqebbcRQNTIr/2pD8HF9FBovffQrQPCg/VLO09KcbWSz3g4lnTBci4+5xfPqQEZyQTKwBMMCcSn6XcG/mj/ajOhkYncWP+Zn+VGYgOonFBOT6H2UjW9uIuiaAjvuYXS3audLYk18amrGliQ/C3zlsutDMRlDd2dEBS8QmMFW5ZOJN2nwNaaBqxPqKKozlNkaxzlqrC9wzOrYykeBlrYMr4RGKdawvHbmZw8zMdIACUSH3nmXGfRvXm+HDkxlsgFyG5EEpt3FbuWa4pB+JjcxRmiKyLVul3QmWHcD+jbzgGn4IIk5l9i5bh335LJvOA==;
	5:8AEOQh44bfZoiwJ4mbj/AQ6C6AcH+vrl3r9cpNw65dIql6WYaF5jkDTnUkiVy5HhLsuqHrABaEiWA1aS/SIzOMkyI7Y7WSD+3EZaboaYKCy0IcQQP0qTRKcZECgbbx6uibQ8Z3v7Nj2rPfE/4K18sg==;
	24:/4Cks49nROHpQWBOI1FrTD7oZS8VQGc41KHHImETrGCVOPA8/qQ7wYyKlR6rqgukE7qKmQfJx2S5glOr4zWT1ejTvQFFTcyIqiDI26r+Qrw=;
	7:1buTUNdoc+tSVBUNYl417NVRg0zbsTl1YlQamF0M5Do5sUv/PeR06xgx58O6e9sxK+15SV3W/uvmJtj8UWJLgvdL32FMEsvG7/hFK5ceOOTFaqYZsMCz1wiPfP1pNILFHm1wIzTjGeq/p/z5JMnIlEZ0UOMvD++MtEyflUUxzN+0ZUKPxafqwl2nu8TTgjCj1r1+d7U/C8Y3DnbFDfYthUEFFCMTOwRQUq10NGOvyoU=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: be81beb5-30dd-408c-4b99-08d5018bb8e3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2547; 
x-ms-traffictypediagnostic: AM5PR0401MB2547:
x-exchange-antispam-report-test: UriScan:(180628864354917)(185117386973197)(228905959029699); 
x-microsoft-antispam-prvs: <AM5PR0401MB2547FFAE7A9D0C3A1A6D9B749A670@AM5PR0401MB2547.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6055026)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123560025)(20161123562025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2547; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2547; 
x-forefront-prvs: 0438F90F17
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(39860400002)(346002)(13464003)(377454003)(199003)(189002)(81156014)(6116002)(102836003)(189998001)(110136005)(99286003)(25786009)(8936002)(2201001)(97736004)(53546010)(2950100002)(316002)(3280700002)(14454004)(74316002)(8676002)(68736007)(3846002)(6436002)(81166006)(3660700001)(55016002)(53936002)(54906003)(66066001)(6506006)(4326008)(7696004)(9686003)(54356999)(7736002)(50986999)(305945005)(2501003)(7416002)(86362001)(101416001)(229853002)(5660300001)(33656002)(39060400002)(5250100002)(478600001)(2900100001)(106356001)(2906002)(6246003)(105586002)(5890100001)(76176999);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2547;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2017 07:29:55.5841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2547
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.0.73
Subject: Re: [Qemu-arm] [RFC v4 06/16] virtio-iommu: Register attached
 devices
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
	"peterx@redhat.com" <peterx@redhat.com>,
	"linuc.decode@gmail.com" <linuc.decode@gmail.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GRWQnjz1d71I



> -----Original Message-----
> From: Eric Auger [mailto:eric.auger@redhat.com]
> Sent: Tuesday, September 19, 2017 1:17 PM
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
> philippe.brucker@arm.com
> Cc: will.deacon@arm.com; kevin.tian@intel.com; marc.zyngier@arm.com;
> christoffer.dall@linaro.org; drjones@redhat.com; wei@redhat.com;
> tn@semihalf.com; Bharat Bhushan <bharat.bhushan@nxp.com>;
> peterx@redhat.com; linuc.decode@gmail.com
> Subject: [RFC v4 06/16] virtio-iommu: Register attached devices
>=20
> This patch introduce address space and device internal
> datatypes. Both are stored in RB trees. The address space
> owns a list of devices attached to it.
>=20
> It is assumed the devid corresponds to the PCI BDF.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
> v3 -> v4:
> - new separate patch
> ---
>  hw/virtio/trace-events   |   4 ++
>  hw/virtio/virtio-iommu.c | 120
> +++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 124 insertions(+)
>=20
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index bc65356..74b92d3 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -38,3 +38,7 @@ virtio_iommu_map(uint32_t as, uint64_t phys_addr,
> uint64_t virt_addr, uint64_t s
>  virtio_iommu_unmap(uint32_t as, uint64_t virt_addr, uint64_t size) "as=
=3D %d
> virt_addr=3D0x%"PRIx64" size=3D0x%"PRIx64
>  virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, in=
t
> flag) "mr=3D%s rid=3D%d addr=3D0x%"PRIx64" flag=3D%d"
>  virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
> +virtio_iommu_get_dev(uint32_t devid) "Alloc devid=3D%d"
> +virtio_iommu_put_dev(uint32_t devid) "Free devid=3D%d"
> +virtio_iommu_get_as(uint32_t asid) "Alloc asid=3D%d"
> +virtio_iommu_put_as(uint32_t asid) "Free asid=3D%d"
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index f4cb76f..41a4bbc 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -32,15 +32,116 @@
>  #include "hw/virtio/virtio-bus.h"
>  #include "hw/virtio/virtio-access.h"
>  #include "hw/virtio/virtio-iommu.h"
> +#include "hw/pci/pci_bus.h"
> +#include "hw/pci/pci.h"
>=20
>  /* Max size */
>  #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>=20
> +typedef struct viommu_as {
> +    uint32_t id;
> +    GTree *mappings;
> +    QLIST_HEAD(, viommu_dev) device_list;
> +} viommu_as;
> +
> +typedef struct viommu_dev {
> +    uint32_t id;
> +    viommu_as *as;
> +    QLIST_ENTRY(viommu_dev) next;
> +    VirtIOIOMMU *viommu;
> +} viommu_dev;
> +
> +typedef struct viommu_interval {
> +    uint64_t low;
> +    uint64_t high;
> +} viommu_interval;
> +
>  static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)
>  {
>      return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
>  }
>=20
> +static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer
> user_data)
> +{
> +    viommu_interval *inta =3D (viommu_interval *)a;
> +    viommu_interval *intb =3D (viommu_interval *)b;
> +
> +    if (inta->high <=3D intb->low) {
> +        return -1;
> +    } else if (intb->high <=3D inta->low) {
> +        return 1;
> +    } else {
> +        return 0;
> +    }
> +}
> +
> +static void virtio_iommu_detach_dev_from_as(viommu_dev *dev)
> +{
> +    QLIST_REMOVE(dev, next);
> +    dev->as =3D NULL;
> +}
> +
> +static viommu_dev *virtio_iommu_get_dev(VirtIOIOMMU *s, uint32_t
> devid)
> +{
> +    viommu_dev *dev;
> +
> +    dev =3D g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
> +    if (dev) {
> +        return dev;
> +    }
> +    dev =3D g_malloc0(sizeof(*dev));
> +    dev->id =3D devid;
> +    dev->viommu =3D s;
> +    trace_virtio_iommu_get_dev(devid);
> +    g_tree_insert(s->devices, GUINT_TO_POINTER(devid), dev);
> +    return dev;
> +}
> +
> +static void virtio_iommu_put_dev(gpointer data)
> +{
> +    viommu_dev *dev =3D (viommu_dev *)data;
> +
> +    if (dev->as) {
> +        virtio_iommu_detach_dev_from_as(dev);
> +        g_tree_unref(dev->as->mappings);
> +    }
> +
> +    trace_virtio_iommu_put_dev(dev->id);
> +    g_free(dev);
> +}
> +
> +viommu_as *virtio_iommu_get_as(VirtIOIOMMU *s, uint32_t asid);
> +viommu_as *virtio_iommu_get_as(VirtIOIOMMU *s, uint32_t asid)
> +{
> +    viommu_as *as;
> +
> +    as =3D g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
> +    if (as) {
> +        return as;
> +    }
> +    as =3D g_malloc0(sizeof(*as));
> +    as->id =3D asid;

I see now you maintain device-list in address-space in your base patches, b=
ut I do not see where it is initialized?
Should not that be initialized here (vfio integration patches initialized h=
ere).

Thanks
-Bharat

> +    as->mappings =3D g_tree_new_full((GCompareDataFunc)interval_cmp,
> +                                   NULL, (GDestroyNotify)g_free,
> +                                   (GDestroyNotify)g_free);
> +    g_tree_insert(s->address_spaces, GUINT_TO_POINTER(asid), as);
> +    trace_virtio_iommu_get_as(asid);
> +    return as;
> +}
> +
> +static void virtio_iommu_put_as(gpointer data)
> +{
> +    viommu_as *as =3D (viommu_as *)data;
> +    viommu_dev *iter, *tmp;
> +
> +    QLIST_FOREACH_SAFE(iter, &as->device_list, next, tmp) {
> +        virtio_iommu_detach_dev_from_as(iter);
> +    }
> +    g_tree_destroy(as->mappings);
> +    trace_virtio_iommu_put_as(as->id);
> +    g_free(as);
> +}
> +
>  static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void
> *opaque,
>                                                int devfn)
>  {
> @@ -70,6 +171,8 @@ static AddressSpace
> *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
>          sdev->bus =3D bus;
>          sdev->devfn =3D devfn;
>=20
> +        virtio_iommu_get_dev(s, PCI_BUILD_BDF(pci_bus_num(bus), devfn));
> +
>          trace_virtio_iommu_init_iommu_mr(name);
>=20
>          memory_region_init_iommu(&sdev->iommu_mr, sizeof(sdev-
> >iommu_mr),
> @@ -360,6 +463,12 @@ static inline guint as_uint64_hash(gconstpointer v)
>      return (guint)*(const uint64_t *)v;
>  }
>=20
> +static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data=
)
> +{
> +    uint ua =3D GPOINTER_TO_UINT(a);
> +    uint ub =3D GPOINTER_TO_UINT(b);
> +    return (ua > ub) - (ua < ub);
> +}
>=20
>  static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>  {
> @@ -375,17 +484,28 @@ static void
> virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      s->config.page_size_mask =3D TARGET_PAGE_MASK;
>      s->config.input_range.end =3D -1UL;
>=20
> +    qemu_mutex_init(&s->mutex);
> +
>      memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
>      s->as_by_busptr =3D g_hash_table_new_full(as_uint64_hash,
>                                              as_uint64_equal,
>                                              g_free, g_free);
>=20
> +    s->address_spaces =3D g_tree_new_full((GCompareDataFunc)int_cmp,
> +                                         NULL, NULL, virtio_iommu_put_as=
);
> +    s->devices =3D g_tree_new_full((GCompareDataFunc)int_cmp,
> +                                 NULL, NULL, virtio_iommu_put_dev);
> +
>      virtio_iommu_init_as(s);
>  }
>=20
>  static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp=
)
>  {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> +    VirtIOIOMMU *s =3D VIRTIO_IOMMU(dev);
> +
> +    g_tree_destroy(s->address_spaces);
> +    g_tree_destroy(s->devices);
>=20
>      virtio_cleanup(vdev);
>  }
> --
> 2.5.5

