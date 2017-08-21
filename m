Received: by 10.223.188.70 with SMTP id a6csp3354610wrh;
        Mon, 21 Aug 2017 03:59:00 -0700 (PDT)
X-Received: by 10.237.55.228 with SMTP id j91mr23759566qtb.294.1503313140849;
        Mon, 21 Aug 2017 03:59:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503313140; cv=none;
        d=google.com; s=arc-20160816;
        b=GBgeavBr/7ihtS0i8R+Bxqanx1+dwoYrPRxfKS0RCl7M09qcBIMCUVraCkysfbp7eY
         23c/8oDMYXp2KBcXlfrLursKVmD3+NhVMWwnHNKMWh3nbUwP4gPQiHxa39VZSQZiV1V3
         rU0KMoGx8bH2BvprIyGfbo/YY89bQAJtGty7N419LbgQJ9dSKoLVTdxuocEcuyiV12K+
         FoJiKTowTg0Cqz6qmI5SOs4nLCQ2L6dwLOOAsovxcsNhDxbJMNyDwRD7nVkksPFcCX0F
         yvrYvDRavQyuHLGXyOpEPoCmtEn5yxXDKG3Cg/NZ01Kh7fcEnBQeJl+anQDx6Vgz4AOG
         7Ltg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=9/7Qvje1TxiTuFjzWzbyPjpNjXzNKlcBzaz2OUgJjZY=;
        b=wKwLvwvmkSjCzUtEfS1iVtQy8mimVJ/NcR21RnTQ9+2wGB6W5/7ipJupaLyYKD3rDS
         tVv5uXy+zV5vawPhnapgFKXEL+RkfaaBXkUOqSXdKZlEnAMPvLsQkMofbsrd3kVEPyFP
         C8m/zHlksenhvCbPyNGbmBUoTUNrQPniqrKatGFlVNnyQZMCF9av7FsUAF71j+RqevWY
         WvlmNIuh25qvxbRKf1gGwxK1Enr12Nk/N7+5VeT0qCUTN+P3bMuQOVr6ZmfJC7+/ydSf
         LtziIMxATHmq+lh/+o6UUgPEVOW3RooRGzTeNn1FQ1IC527/Jdvx2IOmEROEdHXF7bNk
         p6Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=bDOIDACS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j62si10574586qkd.539.2017.08.21.03.59.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Aug 2017 03:59:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=bDOIDACS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:33595 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1djkQ6-000475-CC
	for alex.bennee@linaro.org; Mon, 21 Aug 2017 06:58:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1djkOm-0002y7-Ut
	for qemu-arm@nongnu.org; Mon, 21 Aug 2017 06:57:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1djkOi-00052Z-MG
	for qemu-arm@nongnu.org; Mon, 21 Aug 2017 06:57:37 -0400
Received: from mail-he1eur01on0079.outbound.protection.outlook.com
	([104.47.0.79]:39680
	helo=EUR01-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1djkOh-00051X-Qr; Mon, 21 Aug 2017 06:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9/7Qvje1TxiTuFjzWzbyPjpNjXzNKlcBzaz2OUgJjZY=;
	b=bDOIDACSSQc6rT7N0Odu2WaDpouxm3TDyvMo/JbcpvaVkfF1NpAqOVPN9eeRlGOLMyqwniZHziCCAkJqL+IijGwWtj0RFVoHuvCXS+/4puUg//x3QYCgynOjBeiRFOXfcnVFGjqBfWrGtsGm9O04ou4N4pv3jNbVQmF6T39bUvE=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2610.eurprd04.prod.outlook.com (10.169.245.137) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1362.18;
	Mon, 21 Aug 2017 10:57:27 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::e5cb:77cb:372c:4817]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::e5cb:77cb:372c:4817%17]) with mapi id 15.01.1362.019;
	Mon, 21 Aug 2017 10:57:27 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 PATCH 2/2] virtio-iommu: vfio integration
	with virtio-iommu
Thread-Index: AQHS/HKx/X1rrYos3EmyyjMZHenwdqKI43AAgAX7P3A=
Date: Mon, 21 Aug 2017 10:57:27 +0000
Message-ID: <AM5PR0401MB2545562BA7146B129581C9719A870@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1500017104-3574-1-git-send-email-Bharat.Bhushan@nxp.com>
	<1500017104-3574-3-git-send-email-Bharat.Bhushan@nxp.com>
	<997bdcca-b84c-300c-bca0-5950c17db8d7@redhat.com>
In-Reply-To: <997bdcca-b84c-300c-bca0-5950c17db8d7@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2610;
	6:NIHu+lavZJu2Dc+HcuhULOpihaHblF9N2mVJ4TzQnqNsE0OL47xWf16TCsU7lABmQB1VQNy0Evyy2XMEvdMv2UQ1lwIOmIdU1ceM8GAgGajVlk+4QyO+fwXC2nxfZyoTQkx1FgLmdqpdlIDYz9nZmq+EDJJzey2+u0l1++stGVL+nlAnTcxqXbipCek09Z53T34+9BOAON+lYbILf97jsilqHvXK27jt/zB3rp77HsCYCAmKj4GCaKqvunYKgzUd9JWdjrbzvYJxM5LToFwHX5sHdrhalYBvspqsrYlyut1iWr88JLEbLvkbLBSNjCgTM7yLeBgvyNzvop1ZO6IrUQ==;
	5:RT18nJ0Fg21d1QWaFh5h4pNyNI9AZf+KVyN05ABwDzthQh2N8AoKmPjMFigBeeYKQUzzLQd2GAXViHIg0VXmgrhpALPhzLbPBwc0XkH8VGkHSMYtsN9Ne4RGASuag3V0nywZuPtfsA3q2I5u/oeflA==;
	24:nO65jsn6+yATkTVdKVMuWZVwfzf/oITOuUc+aZtYdfF/e/2cBSPeT0o2LgjNGr2mVj6+R4hRRyXTEiNXqftK8rjPK3uZwmwUsJ1uSDbgHCY=;
	7:VA5inLTBuuyRVfUr7S1pA79sUXQCNRDhMwsDae1qO2pC8S/mLA37L3mdFgUiTR2pPKhhWRhbxYMprBwkauB7Igbf1SWoldwwEJRKZGapFippcGLf9QSVaaL673sbtIpBcK/CBqaR3ot3nXC2xKgfcjSCMgJXdjQwL54XOa92gTEvxKPD6uWelMl1U+ad1o9Em8HBa3r+IuNGR1w5HE7j2QHMleAavRN/RwU884GczwU=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: dce0b876-ab76-4f91-71fb-08d4e88369b8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2610; 
x-ms-traffictypediagnostic: AM5PR0401MB2610:
x-exchange-antispam-report-test: UriScan:(180628864354917)(185117386973197)(228905959029699); 
x-microsoft-antispam-prvs: <AM5PR0401MB26106028988FFBE7F1D647C49A870@AM5PR0401MB2610.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(3002001)(6055026)(6041248)(20161123562025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2610; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2610; 
x-forefront-prvs: 040655413E
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(189002)(13464003)(24454002)(377454003)(199003)(33656002)(86362001)(81166006)(305945005)(478600001)(7736002)(7416002)(25786009)(5660300001)(2906002)(68736007)(8676002)(81156014)(8936002)(74316002)(39060400002)(5250100002)(6436002)(2900100001)(55016002)(2201001)(7696004)(2950100002)(101416001)(6246003)(2501003)(6506006)(5890100001)(6116002)(3846002)(14454004)(99286003)(9686003)(4326008)(102836003)(54356999)(76176999)(54906002)(229853002)(3280700002)(50986999)(66066001)(53546010)(189998001)(105586002)(106356001)(97736004)(3660700001)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2610;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2017 10:57:27.6731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2610
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.0.79
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 PATCH 2/2] virtio-iommu: vfio
 integration with virtio-iommu
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
X-TUID: 5mqX196gsxUv

Hi Eric,

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Thursday, August 17, 2017 9:03 PM
> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
> qemu-devel@nongnu.org
> Cc: wei@redhat.com; kevin.tian@intel.com; marc.zyngier@arm.com;
> tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com;
> robin.murphy@arm.com; christoffer.dall@linaro.org
> Subject: Re: [Qemu-devel] [RFC v2 PATCH 2/2] virtio-iommu: vfio integrati=
on
> with virtio-iommu
>=20
> Hi Bharat,
>=20
> On 14/07/2017 09:25, Bharat Bhushan wrote:
> > This patch allows virtio-iommu protection for PCI device-passthrough.
> >
> > MSI region is mapped by current version of virtio-iommu driver.
> > This MSI region mapping in not getting pushed on hw iommu
> > vfio_get_vaddr() allows only ram-region.
> Why is it an issue. As far as I understand this is not needed actually as=
 the
> guest MSI doorbell is not used by the host.
>  This RFC patch needed
> > to be improved.
> >
> > Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
> > ---
> > v1-v2:
> >   - Added trace events
> >
> >  hw/virtio/trace-events           |   5 ++
> >  hw/virtio/virtio-iommu.c         | 133
> +++++++++++++++++++++++++++++++++++++++
> >  include/hw/virtio/virtio-iommu.h |   6 ++
> >  3 files changed, 144 insertions(+)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events index
> > 9196b63..3a3968b 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -39,3 +39,8 @@ virtio_iommu_unmap_left_interval(uint64_t low,
> > uint64_t high, uint64_t next_low,
> virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t
> next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"],
> new interval=3D[0x%"PRIx64",0x%"PRIx64"]"
> >  virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap
> inc [0x%"PRIx64",0x%"PRIx64"]"
> >  virtio_iommu_translate_result(uint64_t virt_addr, uint64_t phys_addr,
> uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=3D%d"
> > +virtio_iommu_notify_flag_add(const char *iommu) "Add virtio-iommu
> notifier node for memory region %s"
> > +virtio_iommu_notify_flag_del(const char *iommu) "Del virtio-iommu
> notifier node for memory region %s"
> > +virtio_iommu_remap(hwaddr iova, hwaddr pa, hwaddr size)
> "iova=3D0x%"PRIx64" pa=3D0x%" PRIx64" size=3D0x%"PRIx64""
> > +virtio_iommu_map_region(hwaddr iova, hwaddr paddr, hwaddr
> map_size) "iova=3D0x%"PRIx64" pa=3D0x%" PRIx64" size=3D0x%"PRIx64""
> > +virtio_iommu_unmap_region(hwaddr iova, hwaddr paddr, hwaddr
> map_size) "iova=3D0x%"PRIx64" pa=3D0x%" PRIx64" size=3D0x%"PRIx64""
> > diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c index
> > cd188fc..61f33cb 100644
> > --- a/hw/virtio/virtio-iommu.c
> > +++ b/hw/virtio/virtio-iommu.c
> > @@ -129,6 +129,48 @@ static gint interval_cmp(gconstpointer a,
> gconstpointer b, gpointer user_data)
> >      }
> >  }
> >
> > +static void virtio_iommu_map_region(VirtIOIOMMU *s, hwaddr iova,
> hwaddr paddr,
> > +                                    hwaddr size, int map)
> bool map?
>=20
> the function name is a bit misleading to me and does not really explain w=
hat
> the function does. It "notifies" so why not using something like
> virtio_iommu_map_notify and virtio_iommu_unmap_notify. I tend to think
> having separate proto is cleaner and more standard.
>=20
> Binding should happen on a specific IOMMUmemoryRegion (see next
> comment).
>=20
> > +{
> > +    VirtioIOMMUNotifierNode *node;
> > +    IOMMUTLBEntry entry;
> > +    uint64_t map_size =3D (1 << 12);
> TODO: handle something else than 4K page.
> > +    int npages;
> > +    int i;
> > +
> > +    npages =3D size / map_size;
> > +    entry.target_as =3D &address_space_memory;
> > +    entry.addr_mask =3D map_size - 1;
> > +
> > +    for (i =3D 0; i < npages; i++) {
> Although I understand we currently fail checking the consistency between
> pIOMMU and vIOMMU page sizes, this will be very slow for guest DPDK use
> case where hugepages are used.
>=20
> Why not directly using the full size?  vfio_iommu_map_notify will report
> errors if vfio_dma_map/unmap() fail.
> > +        entry.iova =3D iova + (i * map_size);
> > +        if (map) {
> > +                trace_virtio_iommu_map_region(iova, paddr, map_size);
> > +                entry.perm =3D IOMMU_RW;
> > +                entry.translated_addr =3D paddr + (i * map_size);
> > +        } else {
> > +                trace_virtio_iommu_unmap_region(iova, paddr, map_size)=
;
> > +                entry.perm =3D IOMMU_NONE;
> > +                entry.translated_addr =3D 0;
> > +        }
> > +
> > +        QLIST_FOREACH(node, &s->notifiers_list, next) {
> > +            memory_region_notify_iommu(&node->iommu_dev->iommu_mr,
> > + entry);
> So as discussed this will notify *all* IOMMU memory regions and all their
> notifiers which is not what we want. You may have a look at
> vsmmuv3 v6 (or intel_iommu) where smmuv3_context_device_invalidate
> retrieves the mr from the sid.

I sent out next version of the patch and I took different approach, I assum=
ed that device-id in
virtio_iommu_attach is stream-id, and same as requested-id. This assumption=
 is because the
"iommu-map" property maps 1:1. Looking forward your view about this.

Hopefully I addressed other comments and fixed/code-rework planned.

Thanks
-Bharat

>=20
> > +        }
> > +    }
> > +}
> > +
> > +static gboolean virtio_iommu_unmap_single(gpointer key, gpointer
> value,
> > +                                          gpointer data) {
> > +    viommu_mapping *mapping =3D (viommu_mapping *) value;
> > +    VirtIOIOMMU *s =3D (VirtIOIOMMU *) data;
> > +
> > +    virtio_iommu_map_region(s, mapping->virt_addr, 0, mapping->size,
> > + 0);
> paddr=3D0? mapping->phys_addr as the trace() will be misleading. But as
> mentioned earlier better use unmap() separate function.
> > +
> > +    return true;
> > +}
> > +
> >  static int virtio_iommu_attach(VirtIOIOMMU *s,
> >                                 struct virtio_iommu_req_attach *req)
> > { @@ -170,10 +212,26 @@ static int virtio_iommu_detach(VirtIOIOMMU
> *s,
> > {
> >      uint32_t devid =3D le32_to_cpu(req->device);
> >      uint32_t reserved =3D le32_to_cpu(req->reserved);
> > +    viommu_dev *dev;
> >      int ret;
> >
> >      trace_virtio_iommu_detach(devid, reserved);
> >
> > +    dev =3D g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
> > +    if (!dev || !dev->as) {
> > +        return -EINVAL;
> > +    }
> > +
> > +    dev->as->nr_devices--;
> > +
> > +    /* Unmap all if this is last device detached */
> > +    if (dev->as->nr_devices =3D=3D 0) {
> > +        g_tree_foreach(dev->as->mappings, virtio_iommu_unmap_single,
> > + s);
> > +
> > +        g_tree_remove(s->address_spaces, GUINT_TO_POINTER(dev->as-
> >id));
> > +        g_tree_destroy(dev->as->mappings);
> > +    }
> so this should be rebased on new ref count code.
> > +
> >      ret =3D g_tree_remove(s->devices, GUINT_TO_POINTER(devid));
> >
> >      return ret ? VIRTIO_IOMMU_S_OK : VIRTIO_IOMMU_S_INVAL; @@ -
> 217,6
> > +275,7 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
> >
> >      g_tree_insert(as->mappings, interval, mapping);
> >
> > +    virtio_iommu_map_region(s, virt_addr, phys_addr, size, 1);
> >      return VIRTIO_IOMMU_S_OK;
> >  }
> >
> > @@ -267,7 +326,9 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
> >          } else {
> >              break;
> >          }
> > +
> >          if (interval.low >=3D interval.high) {
> > +            virtio_iommu_map_region(s, virt_addr, 0, size, 0);
> >              return VIRTIO_IOMMU_S_OK;
> >          } else {
> >              mapping =3D g_tree_lookup(as->mappings,
> > (gpointer)&interval); @@ -410,6 +471,37 @@ static void
> virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
> >      }
> >  }
> >
> > +static void virtio_iommu_notify_flag_changed(MemoryRegion *iommu,
> > +                                          IOMMUNotifierFlag old,
> > +                                          IOMMUNotifierFlag new) {
> > +    IOMMUDevice *sdev =3D container_of(iommu, IOMMUDevice,
> iommu_mr);
> > +    VirtIOIOMMU *s =3D sdev->viommu;
> > +    VirtioIOMMUNotifierNode *node =3D NULL;
> > +    VirtioIOMMUNotifierNode *next_node =3D NULL;
> > +
> > +    if (old =3D=3D IOMMU_NOTIFIER_NONE) {
> > +        trace_virtio_iommu_notify_flag_add(iommu->name);
> > +        node =3D g_malloc0(sizeof(*node));
> > +        node->iommu_dev =3D sdev;
> > +        QLIST_INSERT_HEAD(&s->notifiers_list, node, next);
> > +        return;
> > +    }
> > +
> > +    /* update notifier node with new flags */
> > +    QLIST_FOREACH_SAFE(node, &s->notifiers_list, next, next_node) {
> > +        if (node->iommu_dev =3D=3D sdev) {
> > +            if (new =3D=3D IOMMU_NOTIFIER_NONE) {
> > +                trace_virtio_iommu_notify_flag_del(iommu->name);
> > +                QLIST_REMOVE(node, next);
> > +                g_free(node);
> > +            }
> > +            return;
> > +        }
> > +    }
> > +}
> I think all that mechanics should be factorized somewhere else as all
> vIOMMUs use that but this goes beyond the scope of this series.
> > +
> > +
> >  static IOMMUTLBEntry virtio_iommu_translate(MemoryRegion *mr,
> hwaddr addr,
> >                                              IOMMUAccessFlags flag)  {
> > @@ -523,11 +615,50 @@ static gint int_cmp(gconstpointer a, gconstpointe=
r
> b, gpointer user_data)
> >      return (ua > ub) - (ua < ub);
> >  }
> >
> > +static gboolean virtio_iommu_remap(gpointer key, gpointer value,
> > +gpointer data) {
> > +    viommu_mapping *mapping =3D (viommu_mapping *) value;
> > +    VirtIOIOMMU *s =3D (VirtIOIOMMU *) data;
> > +
> > +    trace_virtio_iommu_remap(mapping->virt_addr, mapping->phys_addr,
> > +                             mapping->size);
> > +    /* unmap previous entry and map again */
> > +    virtio_iommu_map_region(s, mapping->virt_addr, 0, mapping->size,
> > + 0);
> > +
> > +    virtio_iommu_map_region(s, mapping->virt_addr, mapping-
> >phys_addr,
> > +                            mapping->size, 1);
> > +    return true;
> > +}
> > +
> > +static void virtio_iommu_replay(MemoryRegion *mr, IOMMUNotifier *n)
> {
> > +    IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);
> > +    VirtIOIOMMU *s =3D sdev->viommu;
> > +    uint32_t sid;
> > +    viommu_dev *dev;
> > +
> > +    sid =3D smmu_get_sid(sdev);
> > +
> > +    qemu_mutex_lock(&s->mutex);
> > +
> > +    dev =3D g_tree_lookup(s->devices, GUINT_TO_POINTER(sid));
> > +    if (!dev) {
> > +        goto unlock;
> > +    }
> > +
> > +    g_tree_foreach(dev->as->mappings, virtio_iommu_remap, s);
> > +
> > +unlock:
> > +    qemu_mutex_unlock(&s->mutex);
> > +    return;
> not needed
>=20
> Thanks
>=20
> Eric
> > +}
> > +
> >  static void virtio_iommu_device_realize(DeviceState *dev, Error
> > **errp)  {
> >      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> >      VirtIOIOMMU *s =3D VIRTIO_IOMMU(dev);
> >
> > +    QLIST_INIT(&s->notifiers_list);
> >      virtio_init(vdev, "virtio-iommu", VIRTIO_ID_IOMMU,
> >                  sizeof(struct virtio_iommu_config));
> >
> > @@ -538,6 +669,8 @@ static void
> virtio_iommu_device_realize(DeviceState *dev, Error **errp)
> >      s->config.input_range.end =3D -1UL;
> >
> >      s->iommu_ops.translate =3D virtio_iommu_translate;
> > +    s->iommu_ops.notify_flag_changed =3D
> virtio_iommu_notify_flag_changed;
> > +    s->iommu_ops.replay =3D virtio_iommu_replay;
> >      memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
> >      s->as_by_busptr =3D g_hash_table_new_full(as_uint64_hash,
> >                                              as_uint64_equal, diff
> > --git a/include/hw/virtio/virtio-iommu.h
> > b/include/hw/virtio/virtio-iommu.h
> > index 2259413..76c758d 100644
> > --- a/include/hw/virtio/virtio-iommu.h
> > +++ b/include/hw/virtio/virtio-iommu.h
> > @@ -44,6 +44,11 @@ typedef struct IOMMUPciBus {
> >      IOMMUDevice  *pbdev[0]; /* Parent array is sparse, so dynamically
> > alloc */  } IOMMUPciBus;
> >
> > +typedef struct VirtioIOMMUNotifierNode {
> > +    IOMMUDevice *iommu_dev;
> > +    QLIST_ENTRY(VirtioIOMMUNotifierNode) next; }
> > +VirtioIOMMUNotifierNode;
> > +
> >  typedef struct VirtIOIOMMU {
> >      VirtIODevice parent_obj;
> >      VirtQueue *vq;
> > @@ -55,6 +60,7 @@ typedef struct VirtIOIOMMU {
> >      GTree *address_spaces;
> >      QemuMutex mutex;
> >      GTree *devices;
> > +    QLIST_HEAD(, VirtioIOMMUNotifierNode) notifiers_list;
> >  } VirtIOIOMMU;
> >
> >  #endif
> >
