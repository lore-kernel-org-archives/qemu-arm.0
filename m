Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1607618wrt;
        Thu, 22 Nov 2018 22:38:45 -0800 (PST)
X-Google-Smtp-Source: AJdET5cs/yZO4/HmX6//o9e718Ijv7n4qDZYkr3StCxBexGkQY2MH4ZEKKHU04mWYv0FsZxmjCAM
X-Received: by 2002:a81:9184:: with SMTP id i126mr14522672ywg.371.1542955125565;
        Thu, 22 Nov 2018 22:38:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542955125; cv=none;
        d=google.com; s=arc-20160816;
        b=avLeYiYTKoiW5jkbb9GJIBAOmwP2asEYGwCBJeJAyZlu05vAeVreSWdL9tAyro9ued
         01NVLDsNnCHDuiB4HDHazhnNK8S6V5IPl6SJX21nBZvnXqYqrDGlFxpF57ZSkZgbJWS+
         xArTKgXe77KT4Fov9/enbLW7faigdDO4DsXQitWFnmPNQWvrUrLz6+vtMPvbM6szO7AU
         EXZjvxh9g89EDPRLnKMDSbz5muMC97ND/8zczvYELpXXipcvoYAnI2CEk3DkYRE6T2Sa
         7asSwXVyDZ7wDqP96zzHnFi38MeIBybhnFtq6lULwGFnEEKdIALXFaFjV3e6n/4o/7yu
         tAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=ky4ZqFTkC6YraW6Xz/pKnLMrXnPnxUi5DRiHUf7PV+4=;
        b=A5OGOaaoN/46zqITapLtbKBiZQpu4TRi2lnm7Frs26os1i97E0EUF1Psn83D3wgSDV
         lv0JkqMC1jlxpEEjKd1bemQOseVCOsIsuY6bC6klCXcH5s/Pj2B8+H1ayvxTN1fsBau1
         SQ6Be5sZRO55Eq2v8feqGVsSj00ztDmhWc1njebCcuFgPiCFitJAwLTGh0Fnl/s6ZcFB
         S/DVLAFUkdoQAKldEsUhma5xrVWaG6gVWDuWoy5yFaHEuAYy32g67Sf9R9bi3R6RnNSc
         g/okenVPkXdfx2x/vwLFc/XylTe0rdxbC77q15mk6yZKgXmkSPx5llLujO7FDQ+JkJVK
         VRiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=aLDdHgTx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w200-v6si12805450ybg.176.2018.11.22.22.38.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 22:38:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=aLDdHgTx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:50677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ56z-0008SV-25
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 01:38:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gQ56p-0008RM-Ap
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 01:38:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1gQ56o-0006FH-0V
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 01:38:35 -0500
Received: from mail-eopbgr20055.outbound.protection.outlook.com
	([40.107.2.55]:4271
	helo=EUR02-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1gQ56V-0005cr-4F; Fri, 23 Nov 2018 01:38:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ky4ZqFTkC6YraW6Xz/pKnLMrXnPnxUi5DRiHUf7PV+4=;
	b=aLDdHgTxI3wRvMkXKPLn/wmkRm8yiRaXg+UtNqU4OX2PsfLKnc2cfO3nOX2UQ7PUs/qhMtvC4GGTGKwkxeZS0B53CkoNMAY3Nbzy5Pe6uZsJhfOXfwBbFiq9O1V5n4+qeZ0sbcv2TVDV0COaadBJVXfYTNDSlu9wLYw3J+aGTd0=
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com (20.177.49.14) by
	VI1PR04MB4064.eurprd04.prod.outlook.com (10.171.183.28) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.15; Fri, 23 Nov 2018 06:38:12 +0000
Received: from VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a]) by
	VI1PR04MB4845.eurprd04.prod.outlook.com
	([fe80::21f7:a45b:3d8f:d16a%2]) with mapi id 15.20.1339.029;
	Fri, 23 Nov 2018 06:38:12 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "mst@redhat.com" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>
Thread-Topic: [RFC v9 06/17] virtio-iommu: Endpoint and domains structs and
	helpers
Thread-Index: AQHUgocWUvJY1jFZFUKe5ns8xItHyaVc5s4A
Date: Fri, 23 Nov 2018 06:38:12 +0000
Message-ID: <VI1PR04MB484549F41959A613D3517F7D9AD40@VI1PR04MB4845.eurprd04.prod.outlook.com>
References: <20181122171538.12359-1-eric.auger@redhat.com>
	<20181122171538.12359-7-eric.auger@redhat.com>
In-Reply-To: <20181122171538.12359-7-eric.auger@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [14.142.187.166]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR04MB4064;
	6:HP7kBwe/gu/aF5NRAflVPHYson1SCkFi63WFLYssJDRTdDWhG77S9FkjHqgZ723DO/PYtLSGUzOXzBI+c6Bwe15p7CUXRwMlsH51c8Z3sSO2uCTj/Hu9tLzgS01v11fjEwzC2Y4g/c1+LwbNJuCf/EXA+mXyw8JJ55lPmygoFylgS6HLys3mLcXUA340ylybaNUsXntPM8sO2d5PIdHY/4IzhOgbzuxdAuuOOK2i3vjqc5F8+5hWrY6tudKxTDgN5qvXz9ODRD7eTpekxD+Lhlf5w56QTW9+aGh1ldBiJJyFdtTVc5gvFqLu6HZQWaukBSjHbpjCp4T9b/Midm/XD/tz0ix9Qu6gCQps333OocNARpRE0wztnSFL7/TpRInEubheFm+dilt6U076E8qn3Nta3MUeM+x7ljxMbMPrfZTpn8g3tsNn4pj0gDxtRyoMLMURMXpKe1QtlBdiPAMKPA==;
	5:hA464WKSGzAr5F/LO7fI5t6woCU3g3chqA+xqrGl1IT1/H7nmibEouDJI/UOvlKMZ4pnYK6vxa12p4hk2oFp/5MBjaHBSPstmVfuUQr/zlGuAr+BSL4XOvqbYZpzWdiApoRRIvQrW1kCjjphvOsiXmPRnUfs0m6IuWXgDlbaE3o=;
	7:5oYnMeUaEHESJ2wAN5Qm31+9zZC9ioDFzYIxI5gPMNBV5O+X4IDHoApOFaVXfsBPj1bTbYa9HOiikdzm7hV9ghYyKoR3GFW66ZTerl0KJIhRXvXfURzbup5JtzOQGc1zzeUwroQ3xt+EGLfKdCrG5A==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: d7647b77-881e-4e34-e498-08d6510e3d77
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB4064; 
x-ms-traffictypediagnostic: VI1PR04MB4064:
x-microsoft-antispam-prvs: <VI1PR04MB4064CD482E334694F3408C729AD40@VI1PR04MB4064.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231442)(944501410)(52105112)(3002001)(10201501046)(6055026)(148016)(149066)(150057)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:VI1PR04MB4064; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB4064; 
x-forefront-prvs: 086597191B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(396003)(346002)(366004)(136003)(39860400002)(189003)(199004)(13464003)(478600001)(55016002)(71200400001)(71190400001)(110136005)(7416002)(86362001)(54906003)(81156014)(81166006)(6436002)(2900100001)(8936002)(229853002)(8676002)(105586002)(9686003)(97736004)(106356001)(78486014)(4326008)(2906002)(33656002)(14454004)(2201001)(68736007)(476003)(486006)(11346002)(76176011)(25786009)(305945005)(26005)(102836004)(2501003)(74316002)(446003)(316002)(55236004)(99286004)(66066001)(53936002)(39060400002)(5660300001)(7736002)(7696005)(6506007)(186003)(44832011)(6246003)(53546011)(5024004)(256004)(14444005)(6116002)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4064;
	H:VI1PR04MB4845.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 1Kl0+TiYd9hu1I95NeRawS2Aa1q99zFl6C1FBALG1USSr0y8VPWRqPBDr0X1rq8ItStD3/BgninHgufYrrRh7R53UXj+RWALW4XQ42mKV4GlUNPm3gwGfbHCawrcbYWolcpOSSekl58DAi0Z8GzJQZmCVdSUcHT+gz89UwiXenrS0YiEgeMpCUuIGql/xXHU/Pnq6f01Ou8T1YVyqqwJsbN3mne2JhMg1Kmyail5cMz67IhJ5z1sxt6KeG5hNPKHrhZiTRU0cN+dhuYyDzREhaGsiPAIrr42eBNGtpb64vCdP+3rp1Y3Zur7tadmnwPbv4rxXLTeOyvHFnOfhz1RnO9CcGYogtRKWfYGUWWtsRo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7647b77-881e-4e34-e498-08d6510e3d77
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2018 06:38:12.1069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4064
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.2.55
Subject: Re: [Qemu-arm] [RFC v9 06/17] virtio-iommu: Endpoint and domains
 structs and helpers
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
Cc: "tn@semihalf.com" <tn@semihalf.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"peterx@redhat.com" <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GsDqE26mUBbu

Hi Eric,

> -----Original Message-----
> From: Eric Auger <eric.auger@redhat.com>
> Sent: Thursday, November 22, 2018 10:45 PM
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
> devel@nongnu.org; qemu-arm@nongnu.org; peter.maydell@linaro.org;
> mst@redhat.com; jean-philippe.brucker@arm.com
> Cc: kevin.tian@intel.com; tn@semihalf.com; Bharat Bhushan
> <bharat.bhushan@nxp.com>; peterx@redhat.com
> Subject: [RFC v9 06/17] virtio-iommu: Endpoint and domains structs and
> helpers
>=20
> This patch introduce domain and endpoint internal datatypes. Both are
> stored in RB trees. The domain owns a list of endpoints attached to it.
>=20
> Helpers to get/put end points and domains are introduced.
> get() helpers will become static in subsequent patches.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
>=20
> v6 -> v7:
> - on virtio_iommu_find_add_as the bus number computation may
>   not be finalized yet so we cannot register the EPs at that time.
>   Hence, let's remove the get_endpoint and also do not use the
>   bus number for building the memory region name string (only
>   used for debug though).

Endpoint registration from virtio_iommu_find_add_as to PROBE request.
It is mentioned that " the bus number computation may not be finalized ". C=
an you please give some more information.
I am asking this because from vfio perspective translate/replay will be cal=
led much before the PROBE request and endpoint needed to be registered by t=
hat time.


Thanks
-Bharat

>=20
> v4 -> v5:
> - initialize as->endpoint_list
>=20
> v3 -> v4:
> - new separate patch
> ---
>  hw/virtio/trace-events   |   4 ++
>  hw/virtio/virtio-iommu.c | 125
> ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 128 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events index
> 9270b0463e..4b15086872 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -61,3 +61,7 @@ virtio_iommu_map(uint32_t domain_id, uint64_t
> virt_start, uint64_t virt_end, uin  virtio_iommu_unmap(uint32_t domain_id=
,
> uint64_t virt_start, uint64_t virt_end) "domain=3D%d virt_start=3D0x%"PRI=
x64"
> virt_end=3D0x%"PRIx64  virtio_iommu_translate(const char *name, uint32_t
> rid, uint64_t iova, int flag) "mr=3D%s rid=3D%d addr=3D0x%"PRIx64" flag=
=3D%d"
>  virtio_iommu_init_iommu_mr(char *iommu_mr) "init %s"
> +virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoint=3D%d"
> +virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=3D%d"
> +virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=3D%d"
> +virtio_iommu_put_domain(uint32_t domain_id) "Free domain=3D%d"
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c index
> dead062baf..1b9c3ba416 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -33,20 +33,124 @@
>  #include "hw/virtio/virtio-bus.h"
>  #include "hw/virtio/virtio-access.h"
>  #include "hw/virtio/virtio-iommu.h"
> +#include "hw/pci/pci_bus.h"
> +#include "hw/pci/pci.h"
>=20
>  /* Max size */
>  #define VIOMMU_DEFAULT_QUEUE_SIZE 256
>=20
> +typedef struct viommu_domain {
> +    uint32_t id;
> +    GTree *mappings;
> +    QLIST_HEAD(, viommu_endpoint) endpoint_list; } viommu_domain;
> +
> +typedef struct viommu_endpoint {
> +    uint32_t id;
> +    viommu_domain *domain;
> +    QLIST_ENTRY(viommu_endpoint) next;
> +    VirtIOIOMMU *viommu;
> +} viommu_endpoint;
> +
> +typedef struct viommu_interval {
> +    uint64_t low;
> +    uint64_t high;
> +} viommu_interval;
> +
>  static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)  {
>      return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);  }
>=20
> +static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer
> +user_data) {
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
> +static void
> virtio_iommu_detach_endpoint_from_domain(viommu_endpoint
> +*ep) {
> +    QLIST_REMOVE(ep, next);
> +    ep->domain =3D NULL;
> +}
> +
> +viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
> uint32_t
> +ep_id); viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
> +uint32_t ep_id) {
> +    viommu_endpoint *ep;
> +
> +    ep =3D g_tree_lookup(s->endpoints, GUINT_TO_POINTER(ep_id));
> +    if (ep) {
> +        return ep;
> +    }
> +    ep =3D g_malloc0(sizeof(*ep));
> +    ep->id =3D ep_id;
> +    ep->viommu =3D s;
> +    trace_virtio_iommu_get_endpoint(ep_id);
> +    g_tree_insert(s->endpoints, GUINT_TO_POINTER(ep_id), ep);
> +    return ep;
> +}
> +
> +static void virtio_iommu_put_endpoint(gpointer data) {
> +    viommu_endpoint *ep =3D (viommu_endpoint *)data;
> +
> +    if (ep->domain) {
> +        virtio_iommu_detach_endpoint_from_domain(ep);
> +        g_tree_unref(ep->domain->mappings);
> +    }
> +
> +    trace_virtio_iommu_put_endpoint(ep->id);
> +    g_free(ep);
> +}
> +
> +viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t
> +domain_id); viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU
> *s,
> +uint32_t domain_id) {
> +    viommu_domain *domain;
> +
> +    domain =3D g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
> +    if (domain) {
> +        return domain;
> +    }
> +    domain =3D g_malloc0(sizeof(*domain));
> +    domain->id =3D domain_id;
> +    domain->mappings =3D
> g_tree_new_full((GCompareDataFunc)interval_cmp,
> +                                   NULL, (GDestroyNotify)g_free,
> +                                   (GDestroyNotify)g_free);
> +    g_tree_insert(s->domains, GUINT_TO_POINTER(domain_id), domain);
> +    QLIST_INIT(&domain->endpoint_list);
> +    trace_virtio_iommu_get_domain(domain_id);
> +    return domain;
> +}
> +
> +static void virtio_iommu_put_domain(gpointer data) {
> +    viommu_domain *domain =3D (viommu_domain *)data;
> +    viommu_endpoint *iter, *tmp;
> +
> +    QLIST_FOREACH_SAFE(iter, &domain->endpoint_list, next, tmp) {
> +        virtio_iommu_detach_endpoint_from_domain(iter);
> +    }
> +    g_tree_destroy(domain->mappings);
> +    trace_virtio_iommu_put_domain(domain->id);
> +    g_free(domain);
> +}
> +
>  static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void
> *opaque,
>                                                int devfn)  {
>      VirtIOIOMMU *s =3D opaque;
>      IOMMUPciBus *sbus =3D g_hash_table_lookup(s->as_by_busptr, bus);
> +    static uint32_t mr_index;
>      IOMMUDevice *sdev;
>=20
>      if (!sbus) {
> @@ -60,7 +164,7 @@ static AddressSpace
> *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
>      if (!sdev) {
>          char *name =3D g_strdup_printf("%s-%d-%d",
>                                       TYPE_VIRTIO_IOMMU_MEMORY_REGION,
> -                                     pci_bus_num(bus), devfn);
> +                                     mr_index++, devfn);
>          sdev =3D sbus->pbdev[devfn] =3D g_malloc0(sizeof(IOMMUDevice));
>=20
>          sdev->viommu =3D s;
> @@ -75,6 +179,7 @@ static AddressSpace
> *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
>                                   UINT64_MAX);
>          address_space_init(&sdev->as,
>                             MEMORY_REGION(&sdev->iommu_mr),
> TYPE_VIRTIO_IOMMU);
> +        g_free(name);
>      }
>=20
>      return &sdev->as;
> @@ -332,6 +437,13 @@ static const VMStateDescription
> vmstate_virtio_iommu_device =3D {
>      },
>  };
>=20
> +static gint int_cmp(gconstpointer a, gconstpointer b, gpointer
> +user_data) {
> +    uint ua =3D GPOINTER_TO_UINT(a);
> +    uint ub =3D GPOINTER_TO_UINT(b);
> +    return (ua > ub) - (ua < ub);
> +}
> +
>  static void virtio_iommu_device_realize(DeviceState *dev, Error **errp) =
 {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev); @@ -356,6 +468,8 @@ stati=
c
> void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MAP_UNMAP);
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>=20
> +    qemu_mutex_init(&s->mutex);
> +
>      memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
>      s->as_by_busptr =3D g_hash_table_new(NULL, NULL);
>=20
> @@ -364,11 +478,20 @@ static void
> virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      } else {
>          error_setg(errp, "VIRTIO-IOMMU is not attached to any PCI bus!")=
;
>      }
> +
> +    s->domains =3D g_tree_new_full((GCompareDataFunc)int_cmp,
> +                                 NULL, NULL, virtio_iommu_put_domain);
> +    s->endpoints =3D g_tree_new_full((GCompareDataFunc)int_cmp,
> +                                   NULL, NULL,
> + virtio_iommu_put_endpoint);
>  }
>=20
>  static void virtio_iommu_device_unrealize(DeviceState *dev, Error **errp=
)
> {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> +    VirtIOIOMMU *s =3D VIRTIO_IOMMU(dev);
> +
> +    g_tree_destroy(s->domains);
> +    g_tree_destroy(s->endpoints);
>=20
>      virtio_cleanup(vdev);
>  }
> --
> 2.17.2

