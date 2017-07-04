Received: by 10.25.44.15 with SMTP id s15csp699100lfs;
        Tue, 4 Jul 2017 02:13:53 -0700 (PDT)
X-Received: by 10.55.6.201 with SMTP id 192mr42697193qkg.226.1499159633029;
        Tue, 04 Jul 2017 02:13:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499159633; cv=none;
        d=google.com; s=arc-20160816;
        b=bqL7Ks7ZpHoS4QBpH6mKg0zXK6nG6jCmrfqy9PqW+s1lELfXrOtsNXUggtpbmd8Dpm
         I/GL2HoWbz6jUnVysYoupIPwL0DlrtJQY+2c1MlUzowbosIQasYfe89szrF4xA6qtNVH
         8mns6yWLNK3byM0nebpJhlGDiBnTTdkN8IcT7MDF1lKLbSKiqTJqySodZnlxpMGl+a6N
         F+nGPZVJL/tsURXb7PG2n3uq+pvmAscDN7liHSVxmppS0QaBNNzcYDFD6xWaUChVLBFr
         jpdRwwLEjxySmKTZVvi1+bCF87EdbNnjPgiHfcLTB+dxHOxCmjYViND2oyqU5dvG5q95
         /I8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=t0xPWNWrAa14hyaDeDAHrDQqBrewKviVM9HSyXP3DpQ=;
        b=fsjPk0njJ32L0yTSWETIYUpgUuHasthUf1q5QJ2qBFHeQWgQPaNYlmfdl68MvIs5Sq
         3VSTWouVzC34KdyXVsw3I25Whqy2toEROZ+k1cqemRUT+hhjT4LW0UKixW8S8crcBzwB
         E3jCOOZj016U5Y/8Y4dqBDCZUjFoPAwufmTrITGkiJ9Wk/NHDxYTmhFaBpeTQ8RV0whE
         QUWhVc7cHN2OKavmzvh5w7lHQYe1aeFbfBvz5z4VXJc/m60faO5G5+PVH4vPvEmjUgYM
         TV2d1iy7gVW7hTcL/ZpDqkgFUvcSSCnnavMpGaJBebiRw8fG3GYF/BFCBoadUVHeJRN7
         U0lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=ofY8iWs3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u42si17512587qta.154.2017.07.04.02.13.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Jul 2017 02:13:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=ofY8iWs3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:39667 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSJu2-0003lz-8C
	for alex.bennee@linaro.org; Tue, 04 Jul 2017 05:13:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dSJtv-0003ed-KL
	for qemu-arm@nongnu.org; Tue, 04 Jul 2017 05:13:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dSJtr-0004v7-8s
	for qemu-arm@nongnu.org; Tue, 04 Jul 2017 05:13:43 -0400
Received: from mail-he1eur01on0066.outbound.protection.outlook.com
	([104.47.0.66]:4032
	helo=EUR01-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dSJtq-0004uA-Ge; Tue, 04 Jul 2017 05:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=t0xPWNWrAa14hyaDeDAHrDQqBrewKviVM9HSyXP3DpQ=;
	b=ofY8iWs359TqDaZjlnAHPc5Bj/+LxZ3A/t0NG6qRk9ph6rAYNxMD9wWGyPOr4EvCAf20UIvyvyQ+P1Kur8KFv5/5xRqD767oqdk+OfcKdts1xUU/Qd9g/EGWZSFichiSvJkofrrayWU6G2eXK+b9dppYDd+JFkEiLILn+F8ZjQw=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2548.eurprd04.prod.outlook.com (10.169.245.11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.11; Tue, 4 Jul 2017 09:13:28 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a4b7:79c9:e861:3a2]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a4b7:79c9:e861:3a2%17]) with mapi id 15.01.1220.018;
	Tue, 4 Jul 2017 09:13:28 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "jean-philippe.brucker@arm.com"
	<jean-philippe.brucker@arm.com>
Thread-Topic: [RFC v2 6/8] virtio-iommu: Implement the translation and commands
Thread-Index: AQHS36dzyqTTC2TPF0WQrxpllPATmKJDi6sg
Date: Tue, 4 Jul 2017 09:13:27 +0000
Message-ID: <AM5PR0401MB2545DC8F3114607C77E57AF19AD70@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496851287-9428-7-git-send-email-eric.auger@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2548;
	7:Hd72wlLjuumWWHVFpNJqAUBEXPLdnpspnX/GEBOuJcV1+apxBc/RGFgcR+Plpxv6P5+PKq0Szceikk1kmcsGGlFr9XPllH3qWs2WkI6jZHjXikF3g6zddFq9rCdFeGo57bLmqal9QAbGPGhiQ46jzwDRpTPF8m3BGiC8QWQukjRHMcq1SICh5ZdGV3Svcq21MWa1UVRR6yrZ5awLlL5ivuLIpr/qWmTwi9Uss/r2xMu7Qb1ARjSpdeCFVyqCwJIhUHCKHZqVedx16fSIexrIUXCRMx6FVIITxGZVYsu+alLTsCMwBUYxmcqm8lNjCjje77eAS+tFFOWgKalEO4kSd5v9q9wZjZ7N2jkpe2vHDnPEKw3TXzeDEHZ3dfJ767lKcZ3LKnqDIg+XkyJVU4CkC3d2667ZQ3x9MtVoIbus7DvfIeiI0bsFXdIrxDUTQ+YO8GxFc+StvYDJB8+JO6/nE71GBOWUAyfNbaWf1u6Dasbh2AP4d/oOXM6YOHSednp3cJ7xlfAHvtMJQe1pjZR2ZkdFTrT8fO+y4nn/nMg3sVL2mnYKH6s1r9sxeT+1iFXbWHUeXapwVyHuqACMt0NqkS+Kx9PvZwrpTQhGUHTQ4D8uqnHsn9cD7UnlQKnYwpTdrvLoMOyFCIq1Bh+7nf7mmjHJ/qqXZoCH2FV3hmNSPpxYNAEUbcbwzcNUb9XMB084RFTFtz0pC9LVN6OB5ohTlvrotqcLxVnF3mcTVI4WlGr7RSInHQ1eIp2On7mL0IgGrj5OQ84iwXSj/s4bkzroskQcoqjmJyJYLcbryJbhEYk=
x-ms-office365-filtering-correlation-id: 7a07cdf3-fad8-4696-3e7a-08d4c2bceec0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2548; 
x-ms-traffictypediagnostic: AM5PR0401MB2548:
x-microsoft-antispam-prvs: <AM5PR0401MB2548689BEFC43DF9A0CE68FD9AD70@AM5PR0401MB2548.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(236129657087228)(185117386973197)(148574349560750)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041248)(20161123555025)(20161123558100)(20161123562025)(20161123564025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2548; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2548; 
x-forefront-prvs: 0358535363
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39410400002)(39860400002)(39840400002)(39450400003)(39400400002)(39850400002)(377454003)(13464003)(81156014)(39060400002)(8936002)(2950100002)(14454004)(81166006)(229853002)(66066001)(2900100001)(74316002)(53546010)(305945005)(33656002)(189998001)(97736004)(7416002)(25786009)(8676002)(5660300001)(3280700002)(54906002)(9686003)(5890100001)(4326008)(2906002)(478600001)(3660700001)(5250100002)(2501003)(86362001)(54356999)(76176999)(6246003)(2201001)(6436002)(38730400002)(55016002)(7736002)(99286003)(50986999)(6506006)(7696004)(3846002)(102836003)(53936002)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2548;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2017 09:13:28.0049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2548
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.0.66
Subject: Re: [Qemu-arm] [RFC v2 6/8] virtio-iommu: Implement the translation
 and commands
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
X-TUID: j5f4576XS+fW

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
> Subject: [RFC v2 6/8] virtio-iommu: Implement the translation and
> commands
>=20
> This patch adds the actual implementation for the translation routine
> and the virtio-iommu commands.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
>=20
> v1 -> v2:
> - fix compilation issue reported by autobuild system
> ---
>  hw/virtio/trace-events   |   6 ++
>  hw/virtio/virtio-iommu.c | 202
> +++++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 202 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 341dbdf..9196b63 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -33,3 +33,9 @@ virtio_iommu_detach(uint32_t dev, uint32_t flags)
> "dev=3D%d flags=3D%d"
>  virtio_iommu_map(uint32_t as, uint64_t phys_addr, uint64_t virt_addr,
> uint64_t size, uint32_t flags) "as=3D %d phys_addr=3D0x%"PRIx64"
> virt_addr=3D0x%"PRIx64" size=3D0x%"PRIx64" flags=3D%d"
>  virtio_iommu_unmap(uint32_t as, uint64_t virt_addr, uint64_t size, uint3=
2_t
> reserved) "as=3D %d virt_addr=3D0x%"PRIx64" size=3D0x%"PRIx64" reserved=
=3D%d"
>  virtio_iommu_translate(const char *name, uint32_t rid, uint64_t iova, in=
t
> flag) "mr=3D%s rid=3D%d addr=3D0x%"PRIx64" flag=3D%d"
> +virtio_iommu_new_asid(uint32_t asid) "Allocate a new asid=3D%d"
> +virtio_iommu_new_devid(uint32_t devid) "Allocate a new devid=3D%d"
> +virtio_iommu_unmap_left_interval(uint64_t low, uint64_t high, uint64_t
> next_low, uint64_t next_high) "Unmap left [0x%"PRIx64",0x%"PRIx64"],
> new interval=3D[0x%"PRIx64",0x%"PRIx64"]"
> +virtio_iommu_unmap_right_interval(uint64_t low, uint64_t high, uint64_t
> next_low, uint64_t next_high) "Unmap right [0x%"PRIx64",0x%"PRIx64"],
> new interval=3D[0x%"PRIx64",0x%"PRIx64"]"
> +virtio_iommu_unmap_inc_interval(uint64_t low, uint64_t high) "Unmap inc
> [0x%"PRIx64",0x%"PRIx64"]"
> +virtio_iommu_translate_result(uint64_t virt_addr, uint64_t phys_addr,
> uint32_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=3D%d"
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 902c779..cd188fc 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -32,10 +32,37 @@
>  #include "hw/virtio/virtio-bus.h"
>  #include "hw/virtio/virtio-access.h"
>  #include "hw/virtio/virtio-iommu.h"
> +#include "hw/pci/pci_bus.h"
> +#include "hw/pci/pci.h"
>=20
>  /* Max size */
>  #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>=20
> +typedef struct viommu_as viommu_as;
> +
> +typedef struct viommu_mapping {
> +    uint64_t virt_addr;
> +    uint64_t phys_addr;
> +    uint64_t size;
> +    uint32_t flags;
> +} viommu_mapping;
> +
> +typedef struct viommu_interval {
> +    uint64_t low;
> +    uint64_t high;
> +} viommu_interval;
> +
> +typedef struct viommu_dev {
> +    uint32_t id;
> +    viommu_as *as;
> +} viommu_dev;
> +
> +struct viommu_as {
> +    uint32_t id;
> +    uint32_t nr_devices;
> +    GTree *mappings;
> +};
> +
>  static inline uint16_t smmu_get_sid(IOMMUDevice *dev)
>  {
>      return  ((pci_bus_num(dev->bus) & 0xff) << 8) | dev->devfn;
> @@ -88,6 +115,19 @@ static void virtio_iommu_init_as(VirtIOIOMMU *s)
>      }
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
>=20
>  static int virtio_iommu_attach(VirtIOIOMMU *s,
>                                 struct virtio_iommu_req_attach *req)
> @@ -95,10 +135,34 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
>      uint32_t asid =3D le32_to_cpu(req->address_space);
>      uint32_t devid =3D le32_to_cpu(req->device);
>      uint32_t reserved =3D le32_to_cpu(req->reserved);
> +    viommu_as *as;
> +    viommu_dev *dev;
>=20
>      trace_virtio_iommu_attach(asid, devid, reserved);
>=20
> -    return VIRTIO_IOMMU_S_UNSUPP;
> +    dev =3D g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
> +    if (dev) {
> +        return -1;
> +    }
> +
> +    as =3D g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
> +    if (!as) {
> +        as =3D g_malloc0(sizeof(*as));
> +        as->id =3D asid;
> +        as->mappings =3D g_tree_new_full((GCompareDataFunc)interval_cmp,
> +                                         NULL, NULL, (GDestroyNotify)g_f=
ree);

Created the tree here but seems like missed destroy tree on detach.

Thanks
-Bharat

> +        g_tree_insert(s->address_spaces, GUINT_TO_POINTER(asid), as);
> +        trace_virtio_iommu_new_asid(asid);
> +    }
> +
> +    dev =3D g_malloc0(sizeof(*dev));
> +    dev->as =3D as;
> +    dev->id =3D devid;
> +    as->nr_devices++;
> +    trace_virtio_iommu_new_devid(devid);
> +    g_tree_insert(s->devices, GUINT_TO_POINTER(devid), dev);
> +
> +    return VIRTIO_IOMMU_S_OK;
>  }
>=20
>  static int virtio_iommu_detach(VirtIOIOMMU *s,
> @@ -106,10 +170,13 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
>  {
>      uint32_t devid =3D le32_to_cpu(req->device);
>      uint32_t reserved =3D le32_to_cpu(req->reserved);
> +    int ret;
>=20
>      trace_virtio_iommu_detach(devid, reserved);
>=20
> -    return VIRTIO_IOMMU_S_UNSUPP;
> +    ret =3D g_tree_remove(s->devices, GUINT_TO_POINTER(devid));
> +
> +    return ret ? VIRTIO_IOMMU_S_OK : VIRTIO_IOMMU_S_INVAL;
>  }
>=20
>  static int virtio_iommu_map(VirtIOIOMMU *s,
> @@ -120,10 +187,37 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
>      uint64_t virt_addr =3D le64_to_cpu(req->virt_addr);
>      uint64_t size =3D le64_to_cpu(req->size);
>      uint32_t flags =3D le32_to_cpu(req->flags);
> +    viommu_as *as;
> +    viommu_interval *interval;
> +    viommu_mapping *mapping;
> +
> +    interval =3D g_malloc0(sizeof(*interval));
> +
> +    interval->low =3D virt_addr;
> +    interval->high =3D virt_addr + size - 1;
> +
> +    as =3D g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
> +    if (!as) {
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
> +
> +    mapping =3D g_tree_lookup(as->mappings, (gpointer)interval);
> +    if (mapping) {
> +        g_free(interval);
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
>=20
>      trace_virtio_iommu_map(asid, phys_addr, virt_addr, size, flags);
>=20
> -    return VIRTIO_IOMMU_S_UNSUPP;
> +    mapping =3D g_malloc0(sizeof(*mapping));
> +    mapping->virt_addr =3D virt_addr;
> +    mapping->phys_addr =3D phys_addr;
> +    mapping->size =3D size;
> +    mapping->flags =3D flags;
> +
> +    g_tree_insert(as->mappings, interval, mapping);
> +
> +    return VIRTIO_IOMMU_S_OK;
>  }
>=20
>  static int virtio_iommu_unmap(VirtIOIOMMU *s,
> @@ -133,10 +227,64 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
>      uint64_t virt_addr =3D le64_to_cpu(req->virt_addr);
>      uint64_t size =3D le64_to_cpu(req->size);
>      uint32_t flags =3D le32_to_cpu(req->flags);
> +    viommu_mapping *mapping;
> +    viommu_interval interval;
> +    viommu_as *as;
>=20
>      trace_virtio_iommu_unmap(asid, virt_addr, size, flags);
>=20
> -    return VIRTIO_IOMMU_S_UNSUPP;
> +    as =3D g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
> +    if (!as) {
> +        error_report("%s: no as", __func__);
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
> +    interval.low =3D virt_addr;
> +    interval.high =3D virt_addr + size - 1;
> +
> +    mapping =3D g_tree_lookup(as->mappings, (gpointer)&interval);
> +
> +    while (mapping) {
> +        viommu_interval current;
> +        uint64_t low  =3D mapping->virt_addr;
> +        uint64_t high =3D mapping->virt_addr + mapping->size - 1;
> +
> +        current.low =3D low;
> +        current.high =3D high;
> +
> +        if (low =3D=3D interval.low && size >=3D mapping->size) {
> +            g_tree_remove(as->mappings, (gpointer)&current);
> +            interval.low =3D high + 1;
> +            trace_virtio_iommu_unmap_left_interval(current.low, current.=
high,
> +                interval.low, interval.high);
> +        } else if (high =3D=3D interval.high && size >=3D mapping->size)=
 {
> +            trace_virtio_iommu_unmap_right_interval(current.low, current=
.high,
> +                interval.low, interval.high);
> +            g_tree_remove(as->mappings, (gpointer)&current);
> +            interval.high =3D low - 1;
> +        } else if (low > interval.low && high < interval.high) {
> +            trace_virtio_iommu_unmap_inc_interval(current.low, current.h=
igh);
> +            g_tree_remove(as->mappings, (gpointer)&current);
> +        } else {
> +            break;
> +        }
> +        if (interval.low >=3D interval.high) {
> +            return VIRTIO_IOMMU_S_OK;
> +        } else {
> +            mapping =3D g_tree_lookup(as->mappings, (gpointer)&interval)=
;
> +        }
> +    }
> +
> +    if (mapping) {
> +        error_report("****** %s: Unmap 0x%"PRIx64" size=3D0x%"PRIx64
> +                     " from 0x%"PRIx64" size=3D0x%"PRIx64" is not suppor=
ted",
> +                     __func__, interval.low, size,
> +                     mapping->virt_addr, mapping->size);
> +    } else {
> +        error_report("****** %s: no mapping for
> [0x%"PRIx64",0x%"PRIx64"]",
> +                     __func__, interval.low, interval.high);
> +    }
> +
> +    return VIRTIO_IOMMU_S_INVAL;
>  }
>=20
>  #define get_payload_size(req) (\
> @@ -266,19 +414,46 @@ static IOMMUTLBEntry
> virtio_iommu_translate(MemoryRegion *mr, hwaddr addr,
>                                              IOMMUAccessFlags flag)
>  {
>      IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);
> +    VirtIOIOMMU *s =3D sdev->viommu;
>      uint32_t sid;
> +    viommu_dev *dev;
> +    viommu_mapping *mapping;
> +    viommu_interval interval;
> +
> +    interval.low =3D addr;
> +    interval.high =3D addr + 1;
>=20
>      IOMMUTLBEntry entry =3D {
>          .target_as =3D &address_space_memory,
>          .iova =3D addr,
>          .translated_addr =3D addr,
> -        .addr_mask =3D ~(hwaddr)0,
> -        .perm =3D IOMMU_NONE,
> +        .addr_mask =3D (1 << 12) - 1, /* TODO */
> +        .perm =3D 3,
>      };
>=20
>      sid =3D smmu_get_sid(sdev);
>=20
>      trace_virtio_iommu_translate(mr->name, sid, addr, flag);
> +    qemu_mutex_lock(&s->mutex);
> +
> +    dev =3D g_tree_lookup(s->devices, GUINT_TO_POINTER(sid));
> +    if (!dev) {
> +        /* device cannot be attached to another as */
> +        printf("%s sid=3D%d is not known!!\n", __func__, sid);
> +        goto unlock;
> +    }
> +
> +    mapping =3D g_tree_lookup(dev->as->mappings, (gpointer)&interval);
> +    if (!mapping) {
> +        printf("%s no mapping for 0x%"PRIx64" for sid=3D%d\n", __func__,
> +               addr, sid);
> +        goto unlock;
> +    }
> +    entry.translated_addr =3D addr - mapping->virt_addr + mapping-
> >phys_addr,
> +    trace_virtio_iommu_translate_result(addr, entry.translated_addr, sid=
);
> +
> +unlock:
> +    qemu_mutex_unlock(&s->mutex);
>      return entry;
>  }
>=20
> @@ -341,6 +516,12 @@ static inline guint as_uint64_hash(gconstpointer v)
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
> @@ -362,12 +543,21 @@ static void
> virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>                                              as_uint64_equal,
>                                              g_free, g_free);
>=20
> +    s->address_spaces =3D g_tree_new_full((GCompareDataFunc)int_cmp,
> +                                         NULL, NULL, (GDestroyNotify)g_f=
ree);
> +    s->devices =3D g_tree_new_full((GCompareDataFunc)int_cmp,
> +                                         NULL, NULL, (GDestroyNotify)g_f=
ree);
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

