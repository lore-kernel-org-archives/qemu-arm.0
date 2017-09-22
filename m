Received: by 10.223.172.38 with SMTP id v35csp2815661wrc;
        Fri, 22 Sep 2017 00:45:32 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDm39dG37Lk9t53tf2X/bg/2vCZgaoRsFgpQwK7xnUhC/PpZtGzfuXzblqS0ijDfkMwY2pS
X-Received: by 10.200.55.40 with SMTP id o37mr6926428qtb.248.1506066332071;
        Fri, 22 Sep 2017 00:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506066332; cv=none;
        d=google.com; s=arc-20160816;
        b=R1Tia8d1Cmy3RgGckil7/GHLc4v8MnZZM9W3uYmvEyKz9G16SBqy/6AF5u3Y0QCu77
         MCl1IW/jnbLCbMuta77isLH5xQi3EI5RkCbTTy5uRDorL/cXX6mqPybm0lsrKtHCWTXS
         u5dMDDmuyYmxnNIJ7ZvnIYzGG/ado7zP4H5ppePOa/4kP6r2bMEQ4owwBzGB9ObnABh8
         8Z985pfkxVf5bXfE98jUieaZ7eHQrtjn7zOGEpftS6G7ZbAsKh0UpQVQeiQTJeri3fL/
         5yk6O3oLY5YDqLdErdKAmVihkFQ1OyQgr9XOpO1jsQJZ3HZUZ4ZP0uvIvCpNA2Vjg5b9
         4G7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=MDwzImR7Heo5uGvr8nC2K+FrpkNfqkFc9epsnYytElU=;
        b=1FpJjmpiLkHT3EpiJTUHIN3Of9tsit68Z/VM65Nq7YIHKMBjBckQ4K76Becm9ZDnbY
         fitkiDiwFkgzkE7XStXkiIAHfs94OxgsdsOSYwgzEokX+H3GGa6G9p9CriPz7yyfOMep
         bMsu0WKkc6SENqUbchzp/KQmXVHOA5attKw8QWNYqv/B1+npASq4kmKwWmYUiTktj6bJ
         jhXklP5lqqiPemPgX9KM47ebe00behVJt0i2p1bGGq+Id6yzI5c8izw4tZiNx+xJuISi
         m5rhedWyrlqyq0212FWtklPVdMTZmRTURmE1YmWqr70L/5/ixQth3KCS6fSX+naGrmuA
         pzRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=WbCbmupd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l32si3157692qtd.335.2017.09.22.00.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 00:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=WbCbmupd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:57125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvIeP-000765-J7
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 03:45:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dvIeH-00075n-7s
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 03:45:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dvIeE-0000Ls-1r
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 03:45:21 -0400
Received: from mail-he1eur01on0054.outbound.protection.outlook.com
	([104.47.0.54]:27032
	helo=EUR01-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dvIeD-0000LB-Cw; Fri, 22 Sep 2017 03:45:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MDwzImR7Heo5uGvr8nC2K+FrpkNfqkFc9epsnYytElU=;
	b=WbCbmupdwndvzI01fdkDPzVJ0GM7KjM09xJ4928JHexMElKHwq/bcktYyf0wkZOZsUSox7w/eiZAMCmB7HWqzCQByLY9EFJGdzReH9u1uWO6sKi8b0WWu00i/sHB/TI8DfWMwz1VmMliTeoBdFneTqG1kGmcN8eJnmbL7x7EfTQ=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2548.eurprd04.prod.outlook.com (10.169.245.11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Fri, 22 Sep 2017 07:45:14 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327%18]) with mapi id 15.20.0077.011;
	Fri, 22 Sep 2017 07:45:14 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v3 2/2] virtio-iommu: vfio integration with
	virtio-iommu
Thread-Index: AQHTGmuBAP6tLjtAoEuJIKfr/2Df3KK6b/cAgAZHpvA=
Date: Fri, 22 Sep 2017 07:45:14 +0000
Message-ID: <AM5PR0401MB25458E4A0B2134C51B438E2D9A670@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1503312534-6642-1-git-send-email-Bharat.Bhushan@nxp.com>
	<1503312534-6642-3-git-send-email-Bharat.Bhushan@nxp.com>
	<98b80288-9c4f-874a-9604-aa1a71525a59@redhat.com>
In-Reply-To: <98b80288-9c4f-874a-9604-aa1a71525a59@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2548;
	6:dbxFfY8qMf9HefvCBoJn3VsoOrp/PGMsNnWA5Z0fvpyrufAsFDLwOWFKOKnzyKanOKVFkSJ6H7ARBt6FyrXDTDJpqmhLEBGZXA4vRGRGw9J6gtL8hSgB3D1HVZcrd3yD+CMEZrkLW3gql0AXz6sE5WIMr1Xw7R70AxnDTcyBl0Z/A+qc9wViDjircpPTOKaB8LBFib18u84qpPzGdS4Yo8c5WSt3tMCQZbsi3D4P/43GV07hjqrUbfTtYwvC9GMjt6LaAGBguRhIPTMMYCI8qI1uMJTsnCU/5hYqsgCJ7mP62qirblMU4JBfvKhWelk4h1yKvqCtkXipRi5p0wixIA==;
	5:qP9WkagB3Ko+tSQ9RcmurLB6DHMarodEYYkcqU3AQw2OTLDVzFL8ikW9sKotIeD3ca0od+LhkpvfoVsXHrWHJZNx7zc8KrOar8F8AahmkzYh4IN4GJCO7tRZa8nSRhnb+OjGh8RrC3Jyt66b1tEgwg==;
	24:hbvtaLbYmHFMx88NzpBuOY33p0L1i/I9XiPm1CzVMBYqrirp6bBxU+OKbHmk3UeURyb+lHZvv7YCASQmlFRsKj6Szu0PM2iNPcREzkPfUt0=;
	7:QUL6bsvuUQH3lT5wJ10Fakz5c3Jy0aLGsjSAQ+IYVEltZAulGlEzmzrgLu1MXsnVVdC+H9PtdS5sHDbkiHDjzBxg5niPR4zcqZqMB1OqFI7Icma4uOWMqUJdvCAS62DrGkI1V85kOcrDsT6LfCSkF89JN952lnyWSXjG9zp4zqaQPrNRljheZ7XJRQclogr6vSPatdB9yrhEy1/39/53JNm6KEYkjd+h4h16bwksdJc=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: ba4fecc8-50f6-4c8d-0029-08d5018ddc81
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254152)(48565401081)(300000503095)(300135400095)(2017052603199)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2548; 
x-ms-traffictypediagnostic: AM5PR0401MB2548:
x-exchange-antispam-report-test: UriScan:(190756311086443)(180628864354917)(185117386973197)(228905959029699);
x-microsoft-antispam-prvs: <AM5PR0401MB2548C87C26EE04E2AD27D3ED9A670@AM5PR0401MB2548.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6055026)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123560025)(20161123564025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2548; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2548; 
x-forefront-prvs: 0438F90F17
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(377454003)(199003)(189002)(13464003)(24454002)(2906002)(6506006)(6116002)(54906003)(102836003)(478600001)(3846002)(2900100001)(3280700002)(68736007)(55016002)(99286003)(9686003)(3660700001)(86362001)(106356001)(6436002)(105586002)(8936002)(229853002)(189998001)(8676002)(7416002)(7696004)(81166006)(4326008)(2950100002)(101416001)(2501003)(14454004)(5250100002)(5890100001)(5660300001)(25786009)(81156014)(2201001)(53546010)(54356999)(7736002)(305945005)(97736004)(316002)(6246003)(74316002)(53946003)(39060400002)(33656002)(76176999)(53936002)(110136005)(66066001)(50986999);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2548;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2017 07:45:14.2845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2548
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.0.54
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 2/2] virtio-iommu: vfio
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
X-TUID: GI4Qsnt6VWY1



> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Monday, September 18, 2017 1:18 PM
> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
> qemu-devel@nongnu.org
> Cc: wei@redhat.com; kevin.tian@intel.com; marc.zyngier@arm.com;
> tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com;
> robin.murphy@arm.com; christoffer.dall@linaro.org
> Subject: Re: [Qemu-devel] [PATCH v3 2/2] virtio-iommu: vfio integration w=
ith
> virtio-iommu
>=20
> Hi Bharat,
>=20
> On 21/08/2017 12:48, Bharat Bhushan wrote:
> > This RFC patch allows virtio-iommu protection for PCI
> > device-passthrough.
> >
> > MSI region is mapped by current version of virtio-iommu driver.
> > This uses VFIO extension of map/unmap notification when an area of
> > memory is mappedi/unmapped in emulated iommu device.
> >
> > This series is tested with 2 PCI devices to virtual machine using
> > dma-ops and DPDK in VM is not yet tested.
> >
> > Also with this series we observe below prints for MSI region mapping
> >
> >    "qemu-system-aarch64: iommu map to non memory area 0"
> >
> >    This print comes when vfio/map-notifier is called for MSI region.
> >
> > vfio map/unmap notification is called for given device
> >    This assumes that devid passed in virtio_iommu_attach is same as dev=
fn
> >    This assumption is based on 1:1 mapping of requested-id with device-=
id
> >    in QEMU.
> >
> > Signed-off-by: Bharat Bhushan <Bharat.Bhushan@nxp.com>
> > ---
> > v2->v3:
> >  - Addressed review comments:
> >     - virtio-iommu_map_region function is split in two functions
> >       virtio_iommu_notify_map/virtio_iommu_notify_unmap
> >     - use size received from driver and do not split in 4K pages
> >
> >  - map/unmap notification is called for given device/as
> >    This relies on devid passed in virtio_iommu_attach is same as devfn
> >    This is assumed as iommu-map maps 1:1 requested-id to device-id in
> QEMU
> >    Looking for comment about this assumtion.
> >
> >  - Keeping track devices in address-space
> >
> >  - Verified with 2 PCI endpoints
> >  - some code cleanup
> >
> >  hw/virtio/trace-events           |   5 ++
> >  hw/virtio/virtio-iommu.c         | 163
> +++++++++++++++++++++++++++++++++++++++
> >  include/hw/virtio/virtio-iommu.h |   6 ++
> >  3 files changed, 174 insertions(+)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events index
> > 8db3d91..7e9663f 100644
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
> > +virtio_iommu_notify_map(hwaddr iova, hwaddr paddr, hwaddr
> map_size) "iova=3D0x%"PRIx64" pa=3D0x%" PRIx64" size=3D0x%"PRIx64""
> > +virtio_iommu_notify_unmap(hwaddr iova, hwaddr paddr, hwaddr
> map_size) "iova=3D0x%"PRIx64" pa=3D0x%" PRIx64" size=3D0x%"PRIx64""
> useless paddr
> > diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c index
> > 9217587..9eae050 100644
> > --- a/hw/virtio/virtio-iommu.c
> > +++ b/hw/virtio/virtio-iommu.c
> > @@ -55,11 +55,13 @@ typedef struct viommu_interval {  typedef struct
> > viommu_dev {
> >      uint32_t id;
> >      viommu_as *as;
> > +    QLIST_ENTRY(viommu_dev) next;
> >  } viommu_dev;
> >
> >  struct viommu_as {
> >      uint32_t id;
> >      GTree *mappings;
> > +    QLIST_HEAD(, viommu_dev) device_list;
> >  };
> >
> >  static inline uint16_t virtio_iommu_get_sid(IOMMUDevice *dev) @@
> > -133,12 +135,70 @@ static gint interval_cmp(gconstpointer a, gconstpoin=
ter
> b, gpointer user_data)
> >      }
> >  }
> >
> > +static void virtio_iommu_notify_map(IOMMUMemoryRegion *mr,
> hwaddr iova,
> > +                                    hwaddr paddr, hwaddr size) {
> > +    IOMMUTLBEntry entry;
> > +
> > +    entry.target_as =3D &address_space_memory;
> > +    entry.addr_mask =3D size - 1;
> > +
> > +    entry.iova =3D iova;
> > +    trace_virtio_iommu_notify_map(iova, paddr, size);
> > +    entry.perm =3D IOMMU_RW;
> > +    entry.translated_addr =3D paddr;
> > +
> > +    memory_region_notify_iommu(mr, entry); }
> > +
> > +static void virtio_iommu_notify_unmap(IOMMUMemoryRegion *mr,
> hwaddr iova,
> > +                                      hwaddr paddr, hwaddr size)
> unmap() doesn't need to have paddr arg.

Yes, will fix this

> > +{
> > +    IOMMUTLBEntry entry;
> > +
> > +    entry.target_as =3D &address_space_memory;
> > +    entry.addr_mask =3D size - 1;
> > +
> > +    entry.iova =3D iova;
> > +    trace_virtio_iommu_notify_unmap(iova, paddr, size);
> ditto
> > +    entry.perm =3D IOMMU_NONE;
> > +    entry.translated_addr =3D 0;
> > +
> > +    memory_region_notify_iommu(mr, entry); }
> > +
> > +static gboolean virtio_iommu_maping_unmap(gpointer key, gpointer
> value,
> > +                                          gpointer data)
> s/virtio_iommu_maping_unmap/virtio_iommu_mapping_unmap
> > +{
> > +    viommu_mapping *mapping =3D (viommu_mapping *) value;
> > +    IOMMUMemoryRegion *mr =3D (IOMMUMemoryRegion *) data;
> > +
> > +    virtio_iommu_notify_unmap(mr, mapping->virt_addr, 0,
> > + mapping->size);
> > +
> > +    return true;
> > +}
> > +
> >  static void virtio_iommu_detach_dev(VirtIOIOMMU *s, viommu_dev
> *dev)
> > {
> > +    VirtioIOMMUNotifierNode *node;
> >      viommu_as *as =3D dev->as;
> > +    int devid =3D dev->id;
> >
> >      trace_virtio_iommu_detach(dev->id);
> >
> > +    /* Remove device from address-space list */
> > +    QLIST_REMOVE(dev, next);
> > +    /* unmap all if no devices attached to address-spaceRemove */
> comment to be reworked
> > +    if (QLIST_EMPTY(&as->device_list)) {
> I don't get why you execute the code below only if the device_list is emp=
ty.
> Each time a device is detached don't you need to notify its associated
> iommu_mr?

There can be multiple devices share same address space, should not we unmap=
 address space when last device in removed?=20

> > +        QLIST_FOREACH(node, &s->notifiers_list, next) {
> > +            if (devid =3D=3D node->iommu_dev->devfn) {
> > +                g_tree_foreach(as->mappings, virtio_iommu_maping_unmap=
,
> > +                               &node->iommu_dev->iommu_mr);
> > +            }
> > +        }
> > +    }
> > +
> > +    /* Remove device from global list */
> >      g_tree_remove(s->devices, GUINT_TO_POINTER(dev->id));
> >      g_tree_unref(as->mappings);
> >  }
> > @@ -171,6 +231,7 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
> >      if (!as) {
> >          as =3D g_malloc0(sizeof(*as));
> >          as->id =3D asid;
> > +        QLIST_INIT(&as->device_list);
> >          as->mappings =3D g_tree_new_full((GCompareDataFunc)interval_cm=
p,
> >                                           NULL, NULL, (GDestroyNotify)g=
_free);
> >          g_tree_insert(s->address_spaces, GUINT_TO_POINTER(asid), as);
> > @@ -182,6 +243,7 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
> >      dev->id =3D devid;
> >      trace_virtio_iommu_new_devid(devid);
> >      g_tree_insert(s->devices, GUINT_TO_POINTER(devid), dev);
> > +    QLIST_INSERT_HEAD(&as->device_list, dev, next);
> >      g_tree_ref(as->mappings);
> >
> >      return VIRTIO_IOMMU_S_OK;
> > @@ -219,6 +281,8 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
> >      viommu_as *as;
> >      viommu_interval *interval;
> >      viommu_mapping *mapping;
> > +    VirtioIOMMUNotifierNode *node;
> > +    viommu_dev *dev;
> >
> >      interval =3D g_malloc0(sizeof(*interval));
> >
> > @@ -230,6 +294,11 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
> >          return VIRTIO_IOMMU_S_NOENT;
> >      }
> >
> > +    dev =3D QLIST_FIRST(&as->device_list);
> > +    if (!dev) {
> > +        return VIRTIO_IOMMU_S_NOENT;
> > +    }
> > +
> >      mapping =3D g_tree_lookup(as->mappings, (gpointer)interval);
> >      if (mapping) {
> >          g_free(interval);
> > @@ -246,6 +315,14 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
> >
> >      g_tree_insert(as->mappings, interval, mapping);
> >
> > +    /* All devices in an address-space share mapping */
> > +    QLIST_FOREACH(node, &s->notifiers_list, next) {
> > +        if (dev->id =3D=3D node->iommu_dev->devfn) {
> > +            virtio_iommu_notify_map(&node->iommu_dev->iommu_mr,
> virt_addr,
> > +                                    phys_addr, size);
> > +        }
> > +    }
> > +
> >      return VIRTIO_IOMMU_S_OK;
> >  }
> >
> > @@ -259,6 +336,8 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
> >      viommu_mapping *mapping;
> >      viommu_interval interval;
> >      viommu_as *as;
> > +    VirtioIOMMUNotifierNode *node;
> > +    viommu_dev *dev;
> >
> >      trace_virtio_iommu_unmap(asid, virt_addr, size, flags);
> >
> > @@ -267,6 +346,12 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
> >          error_report("%s: no as", __func__);
> >          return VIRTIO_IOMMU_S_NOENT;
> >      }
> > +
> > +    dev =3D QLIST_FIRST(&as->device_list);
> > +    if (!dev) {
> > +        return VIRTIO_IOMMU_S_NOENT;
> > +    }
> > +
> >      interval.low =3D virt_addr;
> >      interval.high =3D virt_addr + size - 1;
> >
> > @@ -296,7 +381,15 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
> >          } else {
> >              break;
> >          }
> > +
> extra line
> >          if (interval.low >=3D interval.high) {
> > +            /* All devices in an address-space share mapping */
> > +            QLIST_FOREACH(node, &s->notifiers_list, next) {
> > +                if (dev->id =3D=3D node->iommu_dev->devfn) {
> > +                    virtio_iommu_notify_unmap(&node->iommu_dev-
> >iommu_mr, virt_addr,
> > +                                              0, size);
> Why do you notify only a single mr? All devices belonging to the as are
> affected by this change. So don't you need to notify all as device's mr?
> > +                }
> > +            }
> >              return VIRTIO_IOMMU_S_OK;
> >          } else {
> >              mapping =3D g_tree_lookup(as->mappings,
> > (gpointer)&interval); @@ -439,6 +532,36 @@ static void
> virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
> >      }
> >  }
> >
> > +static void virtio_iommu_notify_flag_changed(IOMMUMemoryRegion
> *iommu_mr,
> > +                                          IOMMUNotifierFlag old,
> > +                                          IOMMUNotifierFlag new) {
> > +    IOMMUDevice *sdev =3D container_of(iommu_mr, IOMMUDevice,
> iommu_mr);
> > +    VirtIOIOMMU *s =3D sdev->viommu;
> > +    VirtioIOMMUNotifierNode *node =3D NULL;
> > +    VirtioIOMMUNotifierNode *next_node =3D NULL;
> > +
> > +    if (old =3D=3D IOMMU_NOTIFIER_NONE) {
> > +        trace_virtio_iommu_notify_flag_add(iommu_mr-
> >parent_obj.name);
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
> > +                trace_virtio_iommu_notify_flag_del(iommu_mr-
> >parent_obj.name);
> > +                QLIST_REMOVE(node, next);
> > +                g_free(node);
> > +            }
> > +            return;
> > +        }
> > +    }
> > +}
> > +
> >  static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion
> *mr, hwaddr addr,
> >                                              IOMMUAccessFlags flag)  {
> > @@ -553,11 +676,49 @@ static gint int_cmp(gconstpointer a, gconstpointe=
r
> b, gpointer user_data)
> >      return (ua > ub) - (ua < ub);
> >  }
> >
> > +static gboolean virtio_iommu_remap(gpointer key, gpointer value,
> > +gpointer data) {
> > +    viommu_mapping *mapping =3D (viommu_mapping *) value;
> > +    IOMMUMemoryRegion *mr =3D (IOMMUMemoryRegion *) data;
> > +
> > +    trace_virtio_iommu_remap(mapping->virt_addr, mapping->phys_addr,
> > +                             mapping->size);
> > +    /* unmap previous entry and map again */
> > +    virtio_iommu_notify_unmap(mr, mapping->virt_addr, 0,
> > + mapping->size);
> > +
> > +    virtio_iommu_notify_map(mr, mapping->virt_addr, mapping-
> >phys_addr,
> > +                            mapping->size);
> > +    return true;
> you need to return false here otherwise  g_tree_foreach will return on th=
e
> first as mapping.

Yes,

Thanks
-Bharat
>=20
> Thanks
>=20
> Eric
> > +}
> > +
> > +static void virtio_iommu_replay(IOMMUMemoryRegion *mr,
> IOMMUNotifier
> > +*n) {
> > +    IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);
> > +    VirtIOIOMMU *s =3D sdev->viommu;
> > +    uint32_t sid;
> > +    viommu_dev *dev;
> > +
> > +    sid =3D virtio_iommu_get_sid(sdev);
> > +
> > +    qemu_mutex_lock(&s->mutex);
> > +
> > +    dev =3D g_tree_lookup(s->devices, GUINT_TO_POINTER(sid));
> > +    if (!dev) {
> > +        goto unlock;
> > +    }
> > +
> > +    g_tree_foreach(dev->as->mappings, virtio_iommu_remap, mr);
> > +
> > +unlock:
> > +    qemu_mutex_unlock(&s->mutex);
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
> > @@ -644,6 +805,8 @@ static void
> virtio_iommu_memory_region_class_init(ObjectClass *klass,
> >      IOMMUMemoryRegionClass *imrc =3D
> IOMMU_MEMORY_REGION_CLASS(klass);
> >
> >      imrc->translate =3D virtio_iommu_translate;
> > +    imrc->notify_flag_changed =3D virtio_iommu_notify_flag_changed;
> > +    imrc->replay =3D virtio_iommu_replay;
> >  }
> >
> >  static const TypeInfo virtio_iommu_info =3D { diff --git
> > a/include/hw/virtio/virtio-iommu.h b/include/hw/virtio/virtio-iommu.h
> > index f9c988f..7e04184 100644
> > --- a/include/hw/virtio/virtio-iommu.h
> > +++ b/include/hw/virtio/virtio-iommu.h
> > @@ -46,6 +46,11 @@ typedef struct IOMMUPciBus {
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
> > @@ -56,6 +61,7 @@ typedef struct VirtIOIOMMU {
> >      GTree *address_spaces;
> >      QemuMutex mutex;
> >      GTree *devices;
> > +    QLIST_HEAD(, VirtioIOMMUNotifierNode) notifiers_list;
> >  } VirtIOIOMMU;
> >
> >  #endif
> >
