Received: by 10.25.0.23 with SMTP id 23csp2906565lfa;
        Thu, 8 Jun 2017 23:16:22 -0700 (PDT)
X-Received: by 10.237.44.101 with SMTP id f92mr13055525qtd.150.1496988982616;
        Thu, 08 Jun 2017 23:16:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496988982; cv=none;
        d=google.com; s=arc-20160816;
        b=FI/2s4paNfay30eVGCztF2yX0UjDQe1t35KdNWhuTZ8JeS6msU64DqO4ULmA3AV5+b
         xQi8KK5A5UDIul9XUc6KX4+6GHAIlEL4wvZFkBDpSL2jgT1Fqn+JM0iwL6MQwLb3bLnZ
         /l2wwr4PRfyNxGV1fE5xrW3lwrMPOi7IURXkNyzfNkdu0aBeS+gCcCYDBVndUM57E40s
         69uwF+uBqnDSDcVHcXm+THx0C8SFx4UzBmtAJAj1Qz1bAA2PJT0Jb9jkvhQ2Cdvl1y+/
         65klU7lK6TLtDEd/zqT0ZH2Ig23II4CvP4KStrgSJzXErqsni5xa8XyW3k4jP2urNOJL
         5kcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=3X4UZeB+01daOxcGlG+J0QKb26XfIQAoozJdm9N5ork=;
        b=D06VT5GSom95cNHomuof0Aj0RXqkbZbx6/5A2UoD/IDVh0N1o7bLtanBIvK/JrDvZC
         yqZCO1bBd5XX86zZD0d8zGf9tofVWNtP3rsZ5rXCglDJvXuO7xyFToETyEywPSFD0xKj
         hz8wM6DMkCf32OFeX6vPrtNnCCWuehW49O+fyB3NsDjgJU34bVxqsxM2dAj5AO7SXTIO
         Hrh4cd0FsGB9HwYBiPut/x5J2BVO2NrRoBXocCukzrW1b1O7FCsDcgnZTKKFcoySkfaK
         YCVRBPGiacILEWfnJvwKyOIxhaMcg/X9+wSafU2TSAc06/w20ZArSb45/pgBfgXxTGVv
         S++A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7si140012qkb.250.2017.06.08.23.16.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Jun 2017 23:16:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:52890 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJDDX-0003zH-QN
	for alex.bennee@linaro.org; Fri, 09 Jun 2017 02:16:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dJDDO-0003xR-3H
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 02:16:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dJDDK-0000IR-NI
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 02:16:10 -0400
Received: from mail-db5eur01on0043.outbound.protection.outlook.com
	([104.47.2.43]:25600
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dJDDK-0000H5-5V; Fri, 09 Jun 2017 02:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3X4UZeB+01daOxcGlG+J0QKb26XfIQAoozJdm9N5ork=;
	b=vZo2JHEzGX8CMAdTCf+CdpzzvIoaDXp+AsW3VSAPPfOwJ4eoRi6EDDgJM5WiKfSNq/ob2txjkMiGBG65eQWjsMoNYaNr2HSY4BSgGxG0Y0QXesKrwg3vzU5Cu47DSfKg3eNOA1BSpK8wtj3MFXE/DCLWsfGJD3fZQInNaNzEJlM=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Fri, 9 Jun 2017 06:16:03 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::50bc:c8c2:47cb:95da]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::50bc:c8c2:47cb:95da%17]) with mapi id 15.01.1157.014;
	Fri, 9 Jun 2017 06:16:02 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "jean-philippe.brucker@arm.com"
	<jean-philippe.brucker@arm.com>
Thread-Topic: [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36dbfM0cmMlk0UqAg6W7m9YdMaIcD2Kw
Date: Fri, 9 Jun 2017 06:16:02 +0000
Message-ID: <AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2545;
	7:+R8gvYN195sUi9DnFBn1Wo2OF7OfoOGcCvLc5uLSwEGbhGk6n5+EluvZiPLimvNPzZ2TEHH3bI/5sJzPQRL+UCWzVlePouXJgDMdia0Q+MwRbl4eo4fuTXCr+npwMgKuvRsrfQeINQyIFJ/IsSedQIUdLsmMbvswXaru3bouEybWvex7y2eYT341I1SQbyQ6Ina61bEcrml7Q2PW7Khtt5AbDMZDjpniOTy8Ekz5GbJlct9ltV0+YRl9En3m5VslD5urbWwmsRlZBSNXeiWYxJQRZ2uuQcogelTTaQU7nj5qsLW9yChFyZG4lLvmQvSLbsAYLZsYRQqOb0CpW4QK7g==
x-ms-traffictypediagnostic: AM5PR0401MB2545:
x-ms-office365-filtering-correlation-id: fb4ec314-c299-41b0-cb3e-08d4aeff0134
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081)(201702281549075);
	SRVR:AM5PR0401MB2545; 
x-microsoft-antispam-prvs: <AM5PR0401MB25455F6104EB0D239E5F26219ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(166708455590820)(185117386973197)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123560025)(20161123555025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2545; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2545; 
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39850400002)(39400400002)(39410400002)(39860400002)(39450400003)(39840400002)(13464003)(377454003)(7736002)(5250100002)(39060400002)(99286003)(9686003)(6306002)(478600001)(25786009)(8936002)(53546009)(33656002)(54906002)(86362001)(2906002)(7416002)(38730400002)(14454004)(6506006)(66066001)(2950100002)(7696004)(189998001)(3280700002)(2501003)(3660700001)(305945005)(55016002)(2201001)(6246003)(2900100001)(54356999)(50986999)(6116002)(5660300001)(229853002)(76176999)(102836003)(53936002)(3846002)(6436002)(81166006)(74316002)(4326008)(966005)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2545;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2017 06:16:02.3090 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2545
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.43
Subject: Re: [Qemu-arm] [RFC v2 0/8] VIRTIO-IOMMU device
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
X-TUID: MaJEjezkIpzK

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
> Subject: [RFC v2 0/8] VIRTIO-IOMMU device
>=20
> This series implements the virtio-iommu device. This is a proof of concep=
t
> based on the virtio-iommu specification written by Jean-Philippe Brucker =
[1].
> This was tested with a guest using the virtio-iommu driver [2] and expose=
d
> with a virtio-net-pci using dma ops.
>=20
> The device gets instantiated using the "-device virtio-iommu-device"
> option. It currently works with ARM virt machine only as the machine must
> handle the dt binding between the virtio-mmio "iommu" node and the PCI
> host bridge node. ACPI booting is not yet supported.
>=20
> This should allow to start some benchmarking activities against pure
> emulated IOMMU (especially ARM SMMU).

I am testing this on ARM64 and see below continuous error prints:

	virtio_iommu_translate sid=3D8 is not known!!
	virtio_iommu_translate sid=3D8 is not known!!
	virtio_iommu_translate sid=3D8 is not known!!
	virtio_iommu_translate sid=3D8 is not known!!
	virtio_iommu_translate sid=3D8 is not known!!
	virtio_iommu_translate sid=3D8 is not known!!
	virtio_iommu_translate sid=3D8 is not known!!
	virtio_iommu_translate sid=3D8 is not known!!
	virtio_iommu_translate sid=3D8 is not known!!
	virtio_iommu_translate sid=3D8 is not known!!=20


Also in guest I do not see device-tree node with virtio-iommu.
I am using qemu-tree you mentioned below and iommu-driver patches published=
 by Jean-P.
Qemu command line have additional ""-device virtio-iommu-device". What I am=
 missing ?

Thanks
-Bharat

>=20
> Best Regards
>=20
> Eric
>=20
> This series can be found at:
> https://github.com/eauger/qemu/tree/virtio-iommu-rfcv2
>=20
> References:
> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU, [2] [RFC PATCH linux=
]
> iommu: Add virtio-iommu driver [3] [RFC PATCH kvmtool 00/15] Add virtio-
> iommu
>=20
> History:
> v1 -> v2:
> - fix redifinition of viommu_as typedef
>=20
> Eric Auger (8):
>   update-linux-headers: import virtio_iommu.h
>   linux-headers: Update for virtio-iommu
>   virtio_iommu: add skeleton
>   virtio-iommu: Decode the command payload
>   virtio_iommu: Add the iommu regions
>   virtio-iommu: Implement the translation and commands
>   hw/arm/virt: Add 2.10 machine type
>   hw/arm/virt: Add virtio-iommu the virt board
>=20
>  hw/arm/virt.c                                 | 116 ++++-
>  hw/virtio/Makefile.objs                       |   1 +
>  hw/virtio/trace-events                        |  14 +
>  hw/virtio/virtio-iommu.c                      | 623 ++++++++++++++++++++=
++++++
>  include/hw/arm/virt.h                         |   5 +
>  include/hw/virtio/virtio-iommu.h              |  60 +++
>  include/standard-headers/linux/virtio_ids.h   |   1 +
>  include/standard-headers/linux/virtio_iommu.h | 142 ++++++
>  linux-headers/linux/virtio_iommu.h            |   1 +
>  scripts/update-linux-headers.sh               |   3 +
>  10 files changed, 957 insertions(+), 9 deletions(-)  create mode 100644
> hw/virtio/virtio-iommu.c  create mode 100644 include/hw/virtio/virtio-
> iommu.h  create mode 100644 include/standard-
> headers/linux/virtio_iommu.h
>  create mode 100644 linux-headers/linux/virtio_iommu.h
>=20
> --
> 2.5.5

