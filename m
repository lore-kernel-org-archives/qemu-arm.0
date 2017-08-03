Received: by 10.25.221.202 with SMTP id w71csp424246lfi;
        Thu, 3 Aug 2017 03:15:58 -0700 (PDT)
X-Received: by 10.237.53.83 with SMTP id b19mr1295282qte.312.1501755357956;
        Thu, 03 Aug 2017 03:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501755357; cv=none;
        d=google.com; s=arc-20160816;
        b=xCm+cWPul3TDTnXj5Z27h+aYAG2qCmQOiGYMnEmtVTaAgVXMmhvj6yETMMrpxWVJ0t
         8lE5bDLdYhGXYpccBpxw64UfuAKOvw0ukDQ5vW41NbCYNRNJOe6TcmktScURm+z+oKzV
         +F7by0uBhC1TiiSoPqRslrbSe30HHGaTEzq+XzFscqMkX8eKw7f2Gdg3MOwkOS0xRPBL
         SM5iyHrWNuf6IbAsGXeeljqOyepUnmddL6ggzcv3//2xqzSTRz/XnjCtxpBrYe1+viVK
         SLRxqKXf40rVEHGmHH5BjIDwxUbaKuNJf1cSbqUOAC3Y3eIfdaMIWRD7rJAEFoOQtXIi
         ypMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=BZepZatGlFr9iiV28/MQsrUhnaDF2NRPXcDv5VrWDgg=;
        b=whvLuHp730Gv4dYCQnMfNJLyvuLyR2HrnBELJ1tqO66JcYybGnbv6Sk0Md+etNwtho
         68R8ovLuJ1v5LspnhlCzSnKbTln6obSvq/IGNWPGlsQN6hTSbZAbkaWIrFz0a59tEMMT
         IqeFXZCqpQ8wFhwLPrQAPw9BzxJu6xNu+SuAeo1TtRTWjb7tZj0HVCBZ6TLaUd0JiDna
         IGn93iorvv7stbzJQe/ArHjz0GqGa3lZAceqbijQBY3DjALCydp2S07uxJamNlKeDz7n
         eHoTyPBU1tK+6veb6JXvi32xab8/XJ2x1YYFrIkOX+02r7ynesBRLbTB3RQTbV7u5rfy
         Sg6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=RTs4hDPb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k123si4778877qkc.372.2017.08.03.03.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 03:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=RTs4hDPb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:53933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddDAY-0007na-Ui
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 06:15:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1ddDAT-0007kz-9x
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 06:15:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1ddDAO-000513-TN
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 06:15:49 -0400
Received: from mail-eopbgr00071.outbound.protection.outlook.com
	([40.107.0.71]:41170
	helo=EUR02-AM5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1ddDAO-0004x2-81; Thu, 03 Aug 2017 06:15:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BZepZatGlFr9iiV28/MQsrUhnaDF2NRPXcDv5VrWDgg=;
	b=RTs4hDPbtvjUTTheRh5LU9JHvKTmdC62zVFUYEKUSJ11JV4HMIQqD4sFX+RObvVkFLCvD0sJKK2OYAnlT+JYpeH0+ngjvTmwpbeUJzv/4Hw+hIlIRtoNpewTykCtfk2QC0QhWmdmFL1RoyLT4VcKLPqZRqBrG/fGrkIeyy1c65w=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2546.eurprd04.prod.outlook.com (10.169.245.9) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.1.1304.22; Thu, 3 Aug 2017 10:15:39 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::dc43:4720:e703:7cfa]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::dc43:4720:e703:7cfa%18]) with mapi id 15.01.1304.023;
	Thu, 3 Aug 2017 10:15:39 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "jean-philippe.brucker@arm.com"
	<jean-philippe.brucker@arm.com>
Thread-Topic: [RFC v3 6/8] virtio-iommu: Implement the translation and commands
Thread-Index: AQHTCql23BCm0WxwGEuJLmZ/jfBZJKJyaQfQ
Date: Thu, 3 Aug 2017 10:15:39 +0000
Message-ID: <AM5PR0401MB2545A56E7495DFC82FC3E3BB9AB10@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1501579994-3320-1-git-send-email-eric.auger@redhat.com>
	<1501579994-3320-7-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1501579994-3320-7-git-send-email-eric.auger@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2546;
	7:BRN1VojVbR9uRQgctYMWCoRct3gf30Kp7P8k3RyMgsQk4yn6jyiKHfD3plgEYKBdn1S4GqprzFWWt+sIgglKYUWQNwDAdXiu/OcUTTejT51T0CMPV5+IgbL47vcMWfYy+W8dbqStfsKHnBI1fFFepKHkb8fZhDfKV70TSP++vegPPu8rMIKrLzg5MRGX9G8q0XcZ8NomtIykbLgAt7YolR/2XBLNFQbU7vD10XWSV0EI1UyVGxNmWYb9RGp0k5bFIxdoz3tVaujMet8ZlbrjB5pBDFZWOKm9hfa9sa8ew1tfoaE5ALPPyCUJ31TtdcOeGWHdhAQqHBxfk+tHdvQ0/piurBvimkMbNHWp6QdBork8Ca/Eh51VkKGBYKNBjtjcEOic7NN0517Zz2JRtGJvLIEXuCkOaQO2289tjrZzfPBPe0DS2f4PW16mJ5ctqoqmq1H6G2j0aLqyjFOvyXSUa4eJXrzQnrOCwMLaO61KV3j1x6HZZl9ZSvV/4HRbzNyYnIP+ZTyfcKDGrKYobY7Nxt/M6bPAQ1UWIUbuMj+WFTytWMaPHhx9A0nzusIgLrqsirJOc5QS7p15HbUGM7senlFuQAkDr44zRvn8yXyiYMUEL+DAWTyjAKm+g2sOKecSdCrHvmrqFwL4T3zcX7cngoaGPuZX0+aoAUrre4clLfyxXs5VhCP0lkqwr1FQgxsmdqFHfj1rgz4ipfKZD1jHITILe11jGyfiSuzz7nAtfLmL5ZHYzBmVZSUDahBgNdKWCZzdNBGo3kKC3lK3qbqDTKdmjGT0bcCs6MhXs92cBXQ=
x-ms-office365-filtering-correlation-id: c340a72e-608f-4f77-24d4-08d4da589757
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2546; 
x-ms-traffictypediagnostic: AM5PR0401MB2546:
x-exchange-antispam-report-test: UriScan:(180628864354917)(185117386973197)(228905959029699); 
x-microsoft-antispam-prvs: <AM5PR0401MB2546CCD6EA240C4FEBE5327A9AB10@AM5PR0401MB2546.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123555025)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2546; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2546; 
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39410400002)(39450400003)(39850400002)(39840400002)(39860400002)(39400400002)(189002)(13464003)(199003)(377454003)(53546010)(2900100001)(5660300001)(38730400002)(106356001)(2950100002)(39060400002)(101416001)(66066001)(2906002)(81166006)(81156014)(74316002)(8676002)(2501003)(5890100001)(478600001)(229853002)(86362001)(4326008)(5250100002)(6436002)(6246003)(54906002)(7416002)(99286003)(189998001)(55016002)(3280700002)(9686003)(53946003)(53936002)(6116002)(105586002)(3846002)(97736004)(7736002)(8936002)(102836003)(305945005)(33656002)(54356999)(76176999)(2201001)(7696004)(50986999)(25786009)(68736007)(6506006)(14454004)(3660700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2546;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2017 10:15:39.5724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2546
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.0.71
Subject: Re: [Qemu-arm] [RFC v3 6/8] virtio-iommu: Implement the translation
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
	"peterx@redhat.com" <peterx@redhat.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bMdfCKnsY7LT

Hi Eric,

> -----Original Message-----
> From: Eric Auger [mailto:eric.auger@redhat.com]
> Sent: Tuesday, August 01, 2017 3:03 PM
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
> philippe.brucker@arm.com
> Cc: will.deacon@arm.com; kevin.tian@intel.com; marc.zyngier@arm.com;
> christoffer.dall@linaro.org; drjones@redhat.com; wei@redhat.com;
> tn@semihalf.com; Bharat Bhushan <bharat.bhushan@nxp.com>;
> peterx@redhat.com
> Subject: [RFC v3 6/8] virtio-iommu: Implement the translation and
> commands
>=20
> This patch adds the actual implementation for the translation routine
> and the virtio-iommu commands.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
> v2 -> v3:
> - init the mutex
> - return VIRTIO_IOMMU_S_INVAL is reserved field is not null on
>   attach/detach commands
> - on attach, when the device is already attached to an address space,
>   detach it first instead of returning an error
> - remove nr_devices and use g_tree_ref/unref to destroy the as->mappings
>   on last device detach
> - map/unmap: return NOENT instead of INVAL error if as does not exist
> - remove flags argument from attach/detach trace functions
>=20
> v1 -> v2:
> - fix compilation issue reported by autobuild system
> ---
>  hw/virtio/trace-events   |  10 +-
>  hw/virtio/virtio-iommu.c | 232
> +++++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 232 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index 341dbdf..8db3d91 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -28,8 +28,14 @@ virtio_balloon_to_target(uint64_t target, uint32_t
> num_pages) "balloon target: %
>=20
>  # hw/virtio/virtio-iommu.c
>  #
> -virtio_iommu_attach(uint32_t as, uint32_t dev, uint32_t flags) "as=3D%d
> dev=3D%d flags=3D%d"
> -virtio_iommu_detach(uint32_t dev, uint32_t flags) "dev=3D%d flags=3D%d"
> +virtio_iommu_attach(uint32_t as, uint32_t dev) "as=3D%d dev=3D%d"
> +virtio_iommu_detach(uint32_t dev) "dev=3D%d"
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
> index e663d9e..9217587 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -32,10 +32,36 @@
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
> +    GTree *mappings;
> +};
> +
>  static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev)
>  {
>      return PCI_BUILD_BDF(pci_bus_num(dev->bus), dev->devfn);
> @@ -93,6 +119,29 @@ static void virtio_iommu_init_as(VirtIOIOMMU *s)
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
> +
> +static void virtio_iommu_detach_dev(VirtIOIOMMU *s, viommu_dev *dev)
> +{
> +    viommu_as *as =3D dev->as;
> +
> +    trace_virtio_iommu_detach(dev->id);
> +
> +    g_tree_remove(s->devices, GUINT_TO_POINTER(dev->id));
> +    g_tree_unref(as->mappings);
> +}
>=20
>  static int virtio_iommu_attach(VirtIOIOMMU *s,
>                                 struct virtio_iommu_req_attach *req)
> @@ -100,10 +149,42 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
>      uint32_t asid =3D le32_to_cpu(req->address_space);
>      uint32_t devid =3D le32_to_cpu(req->device);
>      uint32_t reserved =3D le32_to_cpu(req->reserved);
> +    viommu_as *as;
> +    viommu_dev *dev;
> +
> +    trace_virtio_iommu_attach(asid, devid);
> +
> +    if (reserved) {
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
> +
> +    dev =3D g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
> +    if (dev) {
> +        /*
> +         * the device is already attached to an address space,
> +         * detach it first
> +         */
> +         virtio_iommu_detach_dev(s, dev);
> +    }
>=20
> -    trace_virtio_iommu_attach(asid, devid, reserved);
> +    as =3D g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
> +    if (!as) {
> +        as =3D g_malloc0(sizeof(*as));
> +        as->id =3D asid;
> +        as->mappings =3D g_tree_new_full((GCompareDataFunc)interval_cmp,
> +                                         NULL, NULL, (GDestroyNotify)g_f=
ree);

"key" free function is not provided while "value" free function is provided=
 (continue ..)

> +        g_tree_insert(s->address_spaces, GUINT_TO_POINTER(asid), as);
> +        trace_virtio_iommu_new_asid(asid);
> +    }
>=20
> -    return VIRTIO_IOMMU_S_UNSUPP;
> +    dev =3D g_malloc0(sizeof(*dev));
> +    dev->as =3D as;
> +    dev->id =3D devid;
> +    trace_virtio_iommu_new_devid(devid);
> +    g_tree_insert(s->devices, GUINT_TO_POINTER(devid), dev);
> +    g_tree_ref(as->mappings);
> +
> +    return VIRTIO_IOMMU_S_OK;
>  }
>=20
>  static int virtio_iommu_detach(VirtIOIOMMU *s,
> @@ -111,10 +192,20 @@ static int virtio_iommu_detach(VirtIOIOMMU *s,
>  {
>      uint32_t devid =3D le32_to_cpu(req->device);
>      uint32_t reserved =3D le32_to_cpu(req->reserved);
> +    viommu_dev *dev;
> +
> +    if (reserved) {
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
> +
> +    dev =3D g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
> +    if (!dev) {
> +        return VIRTIO_IOMMU_S_INVAL;
> +    }
>=20
> -    trace_virtio_iommu_detach(devid, reserved);
> +    virtio_iommu_detach_dev(s, dev);
>=20
> -    return VIRTIO_IOMMU_S_UNSUPP;
> +    return VIRTIO_IOMMU_S_OK;
>  }
>=20
>  static int virtio_iommu_map(VirtIOIOMMU *s,
> @@ -125,10 +216,37 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
>      uint64_t virt_addr =3D le64_to_cpu(req->virt_addr);
>      uint64_t size =3D le64_to_cpu(req->size);
>      uint32_t flags =3D le32_to_cpu(req->flags);
> +    viommu_as *as;
> +    viommu_interval *interval;
> +    viommu_mapping *mapping;
> +
> +    interval =3D g_malloc0(sizeof(*interval));

"Key" is allocated here (continue below ...)

> +
> +    interval->low =3D virt_addr;
> +    interval->high =3D virt_addr + size - 1;
> +
> +    as =3D g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
> +    if (!as) {
> +        return VIRTIO_IOMMU_S_NOENT;
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

"Value" for b-tree is allocated here (continue below ..)

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
> @@ -138,10 +256,64 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
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
> +        return VIRTIO_IOMMU_S_NOENT;
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

"value" will be destroyed here but seems like "Key" are not freed.
Looks like memory allocated for "key" are never freed. Hopefully I am under=
standing it correctly

Thanks
-Bharat

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
> @@ -271,19 +443,46 @@ static IOMMUTLBEntry
> virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
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
>      sid =3D virtio_iommu_get_sid(sdev);
>=20
>      trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
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
> @@ -347,6 +546,12 @@ static inline guint as_uint64_hash(gconstpointer v)
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
> @@ -362,17 +567,28 @@ static void
> virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      s->config.page_sizes =3D TARGET_PAGE_MASK;
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

