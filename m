Received: by 10.25.0.23 with SMTP id 23csp3006192lfa;
        Fri, 9 Jun 2017 04:30:51 -0700 (PDT)
X-Received: by 10.200.54.56 with SMTP id m53mr40407812qtb.220.1497007851493;
        Fri, 09 Jun 2017 04:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497007851; cv=none;
        d=google.com; s=arc-20160816;
        b=hUipmFIkWFrsci/xzcNE9CmkW1vzOFWMWMb2Rchx3TbqjQzNfhnBhN3ec+VIjt05aG
         5NbShQUoJr+RfoX+V4jbi1qQNx98tMw0kdwpouPHNs6A2Rg1QvWZrHoTGLdHDfaiyDkU
         EK+lEdiY2gVtGkjmYG/okhP3bC0Wp6ThZOupCqPGCpYM2Kb9SDl0nXPyAMdOIvWyPhGQ
         X7/60XtgCdz9kDc3HTPQO0kiwV03/MB7vTbsnG7byjvRTp7p911uHRaWEvoCm1qzVZZE
         7S3GpYT/Yi4LONdw6i7g6fzsjUSBNqqLixoruEO2kdV+D/YWVNR2fWV6D8GG20Nh55o+
         1xCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=gBXIsCJoT7sQWKBDd32F7KVAWTHBcsPV8Xcs54a2fSo=;
        b=eKjAR2Eio8ErtZWNQDmtj3CSO/hT0wa0n3+vU4GwW9m3Z9cmzXWeDhVSzZ2N89EAkQ
         kUz/w2RVaoj9B9sjZ4C43aTA0GHZs6sjcp1cn+RY3Pfq2NntgLjU9CE2YnsOF3C3Um6x
         uvOIOwA1nbNHwlqcL3Gx/Rf8vUpitYN7vFi+SGu9aL7iLGaJWQ+J1R/Jw+cLj9Eu8+Q0
         vMLnk5eo59gtNq8bgtg5B8UtGYgSYCxDPVKU8HURuDOUQnaDRskG9A6ur8Cgjkwjgfn+
         ziILawt7sXD6kLRIYLPTy7zTlbV/XpM2RoT2f7LKTiNB6J8JP8OhxwboHV50W+HU50++
         Zj9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a33si743848qtc.22.2017.06.09.04.30.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Jun 2017 04:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:53919 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dJI7s-0007io-Ph
	for alex.bennee@linaro.org; Fri, 09 Jun 2017 07:30:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dJI7h-0007gJ-6o
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 07:30:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dJI7d-0001zN-4V
	for qemu-arm@nongnu.org; Fri, 09 Jun 2017 07:30:37 -0400
Received: from mail-eopbgr10080.outbound.protection.outlook.com
	([40.107.1.80]:53367
	helo=EUR02-HE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dJI7c-0001wi-Bn; Fri, 09 Jun 2017 07:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=gBXIsCJoT7sQWKBDd32F7KVAWTHBcsPV8Xcs54a2fSo=;
	b=Zpc2Z1gKizTL5FOTnZextFcKEhIvpTFOcUKqcLx8W5OBm6/yE5Ea2kj+Wtn6kmoBMKzWZ7CH+HJAL4fRFHqQt6all+ODp7XYEbe4lznVbtHnNmlshM4x0WgKQXpyEONppsNFVe3Q/SpnmIkz3QXiv4XvJlPFiwv40NhB5ijZ0vA=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2548.eurprd04.prod.outlook.com (10.169.245.11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Fri, 9 Jun 2017 11:30:28 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::50bc:c8c2:47cb:95da]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::50bc:c8c2:47cb:95da%17]) with mapi id 15.01.1157.014;
	Fri, 9 Jun 2017 11:30:28 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "jean-philippe.brucker@arm.com"
	<jean-philippe.brucker@arm.com>
Thread-Topic: [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36dbfM0cmMlk0UqAg6W7m9YdMaIcD2KwgAAIugCAAE8owA==
Date: Fri, 9 Jun 2017 11:30:28 +0000
Message-ID: <AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
In-Reply-To: <14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2548;
	7:OfgzwHpJOC1JYSLOVoIzg9y4bdTR2JKzUdEqSxxMhEW7L4QndU6BoPnILiMaBvKO9b3mqRF+ApjAJohl9WIhTIB7Hu+c1EmcWRV2pBTfZbeZUuwGEPqFb1kxg9qHvpCe2uQV5/USVaEQFF6gYMRPU8tzy9dy9Ytvt/Ie+xZQ2aFXYtpEbp4AVRzDFRv0U21fkXYEEpYR2pY2Y1ZnFgk9c4Xi28xvtRpt8kwIEVrjTSPKTYOyf1HPC36kB3ceSHQolNBYuynPGN7+7O1HDnbR3FZsiMjD1D1vlzWwROScujF3PPxb/gD6XPMcZwfeQORDRbjRxbw+9MGv9m/b1jVVKw==
x-ms-traffictypediagnostic: AM5PR0401MB2548:
x-ms-office365-filtering-correlation-id: e2220505-6973-4df1-c215-08d4af2aee41
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081);
	SRVR:AM5PR0401MB2548; 
x-microsoft-antispam-prvs: <AM5PR0401MB2548EF79C8E80529B8A928B49ACE0@AM5PR0401MB2548.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(166708455590820)(185117386973197)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123555025)(20161123558100)(20161123560025)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2548; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2548; 
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39400400002)(39410400002)(39450400003)(39850400002)(39840400002)(39860400002)(377454003)(24454002)(13464003)(8676002)(53546009)(7736002)(38730400002)(7696004)(6246003)(5250100002)(33656002)(2501003)(25786009)(5660300001)(4326008)(189998001)(9686003)(6306002)(39060400002)(3280700002)(66066001)(3660700001)(74316002)(53936002)(102836003)(2906002)(6116002)(3846002)(305945005)(7416002)(54906002)(99286003)(55016002)(478600001)(54356999)(76176999)(50986999)(229853002)(86362001)(81166006)(2900100001)(6436002)(8936002)(966005)(2201001)(6506006)(2950100002)(14454004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2548;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2017 11:30:28.5195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2548
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.1.80
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
X-TUID: cMdsr1jYodEk

Hi Eric,

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Friday, June 09, 2017 12:14 PM
> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com
> Cc: will.deacon@arm.com; robin.murphy@arm.com; kevin.tian@intel.com;
> marc.zyngier@arm.com; christoffer.dall@linaro.org; drjones@redhat.com;
> wei@redhat.com; tn@semihalf.com
> Subject: Re: [RFC v2 0/8] VIRTIO-IOMMU device
>=20
> Hi Bharat,
>=20
> On 09/06/2017 08:16, Bharat Bhushan wrote:
> > Hi Eric,
> >
> >> -----Original Message-----
> >> From: Eric Auger [mailto:eric.auger@redhat.com]
> >> Sent: Wednesday, June 07, 2017 9:31 PM
> >> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> >> peter.maydell@linaro.org; alex.williamson@redhat.com;
> mst@redhat.com;
> >> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
> >> philippe.brucker@arm.com
> >> Cc: will.deacon@arm.com; robin.murphy@arm.com;
> kevin.tian@intel.com;
> >> marc.zyngier@arm.com; christoffer.dall@linaro.org;
> >> drjones@redhat.com; wei@redhat.com; tn@semihalf.com; Bharat
> Bhushan
> >> <bharat.bhushan@nxp.com>
> >> Subject: [RFC v2 0/8] VIRTIO-IOMMU device
> >>
> >> This series implements the virtio-iommu device. This is a proof of
> >> concept based on the virtio-iommu specification written by Jean-Philip=
pe
> Brucker [1].
> >> This was tested with a guest using the virtio-iommu driver [2] and
> >> exposed with a virtio-net-pci using dma ops.
> >>
> >> The device gets instantiated using the "-device virtio-iommu-device"
> >> option. It currently works with ARM virt machine only as the machine
> >> must handle the dt binding between the virtio-mmio "iommu" node and
> >> the PCI host bridge node. ACPI booting is not yet supported.
> >>
> >> This should allow to start some benchmarking activities against pure
> >> emulated IOMMU (especially ARM SMMU).
> >
> > I am testing this on ARM64 and see below continuous error prints:
> >
> > 	virtio_iommu_translate sid=3D8 is not known!!
> > 	virtio_iommu_translate sid=3D8 is not known!!
> > 	virtio_iommu_translate sid=3D8 is not known!!
> > 	virtio_iommu_translate sid=3D8 is not known!!
> > 	virtio_iommu_translate sid=3D8 is not known!!
> > 	virtio_iommu_translate sid=3D8 is not known!!
> > 	virtio_iommu_translate sid=3D8 is not known!!
> > 	virtio_iommu_translate sid=3D8 is not known!!
> > 	virtio_iommu_translate sid=3D8 is not known!!
> > 	virtio_iommu_translate sid=3D8 is not known!!
> >
> >
> > Also in guest I do not see device-tree node with virtio-iommu.
> do you mean the virtio-mmio with #iommu-cells property?
>=20
> This one is created statically by virt machine. I would be surprised if i=
t were
> not there. Are you using the virt =3D virt2.10 machine. Machines before d=
o not
> support its instantiation.
>=20
> Please can you add a printf in hw/arm/virt.c create_virtio_mmio() at the
> moment when this node is created. Also you can add a printf in
> bind_virtio_iommu_device() to make sure the binding with the PCI host
> bridge is added on machine init done.
>=20
> Also worth to check, CONFIG_VIRTIO_IOMMU=3Dy on guest side.

It works on my side. The driver config was disabled and also I was using gu=
est kernel which was not have deferred-probing. Now after fixing it works o=
n my side
I placed some prints to see dma-map are mapping regions in virtio-iommu, it=
 uses emulated iommu.

I will continue to add VFIO support now on this and more testing !!

Thanks
-Bharat

>=20
> Thanks
>=20
> Eric
>=20
> > I am using qemu-tree you mentioned below and iommu-driver patches
> published by Jean-P.
> > Qemu command line have additional ""-device virtio-iommu-device". What
> I am missing ?
>=20
>=20
> >
> > Thanks
> > -Bharat
> >
> >>
> >> Best Regards
> >>
> >> Eric
> >>
> >> This series can be found at:
> >> https://github.com/eauger/qemu/tree/virtio-iommu-rfcv2
> >>
> >> References:
> >> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU, [2] [RFC PATCH
> >> linux]
> >> iommu: Add virtio-iommu driver [3] [RFC PATCH kvmtool 00/15] Add
> >> virtio- iommu
> >>
> >> History:
> >> v1 -> v2:
> >> - fix redifinition of viommu_as typedef
> >>
> >> Eric Auger (8):
> >>   update-linux-headers: import virtio_iommu.h
> >>   linux-headers: Update for virtio-iommu
> >>   virtio_iommu: add skeleton
> >>   virtio-iommu: Decode the command payload
> >>   virtio_iommu: Add the iommu regions
> >>   virtio-iommu: Implement the translation and commands
> >>   hw/arm/virt: Add 2.10 machine type
> >>   hw/arm/virt: Add virtio-iommu the virt board
> >>
> >>  hw/arm/virt.c                                 | 116 ++++-
> >>  hw/virtio/Makefile.objs                       |   1 +
> >>  hw/virtio/trace-events                        |  14 +
> >>  hw/virtio/virtio-iommu.c                      | 623
> ++++++++++++++++++++++++++
> >>  include/hw/arm/virt.h                         |   5 +
> >>  include/hw/virtio/virtio-iommu.h              |  60 +++
> >>  include/standard-headers/linux/virtio_ids.h   |   1 +
> >>  include/standard-headers/linux/virtio_iommu.h | 142 ++++++
> >>  linux-headers/linux/virtio_iommu.h            |   1 +
> >>  scripts/update-linux-headers.sh               |   3 +
> >>  10 files changed, 957 insertions(+), 9 deletions(-)  create mode
> >> 100644 hw/virtio/virtio-iommu.c  create mode 100644
> >> include/hw/virtio/virtio- iommu.h  create mode 100644
> >> include/standard- headers/linux/virtio_iommu.h  create mode 100644
> >> linux-headers/linux/virtio_iommu.h
> >>
> >> --
> >> 2.5.5
> >
