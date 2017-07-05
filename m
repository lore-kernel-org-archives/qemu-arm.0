Received: by 10.25.44.15 with SMTP id s15csp433502lfs;
        Wed, 5 Jul 2017 01:24:31 -0700 (PDT)
X-Received: by 10.55.102.84 with SMTP id a81mr50281244qkc.154.1499243071267;
        Wed, 05 Jul 2017 01:24:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499243071; cv=none;
        d=google.com; s=arc-20160816;
        b=TkyFWuZB8U2VMWKnhwalIZdYpbo8F+8j2H6+JKxLdbFXw+pkgDHNErbF674UxHrAv8
         ZHi8QDeK3CdY/JImCnavl3U7SMSLojXTcsoaH6OwLlUiNivmBB35dJ/eDznm49+RfzNg
         aYrV3wmKiqJfDMKm1BOOIi2vik2wq07841rxePcM3kKGlfWHLQpqdxifrOMZdSB5TwLJ
         ncW7mtQQ+9kEVSIxxmY2iH1artrjCnzZqSIGFdjQU5xt9oBSNTfHaVi35xa9hH4ZBK+Y
         YY29VRPNruvEEaHdesT8t0NQ1PuekoV5iQVqQFCfHOoFCZauBW9W6/ejuQZzMX6KI6Dr
         +TOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=vH7CXtGrh8ZB5vg+xRJhTexwSouaHEH6uCz5OThHfio=;
        b=yTZpeZ2Ra2IcG13cOwsdzl3e8ehe/qXZn2qYikGWnk3wlaPLnIgREx0+8iIjq+6Y0k
         0LkXu3iw7RfXBMe8ndGgiz9PIJ00I/MRXbWoyEbYf7g7H+lzb2znBVeKUwmgbK79NaAF
         bssIHyTtJeJqViFT2i+FbxR+oLSjlfeRi/iWvbBab6fV9Mfu22n7jD1bJ0irtBVlvoxQ
         KSAVAjaq96YBSM7EirZPpuPwU61Dm8P1JRl6BQGy5RTNmjJ27Kcy4HoOTX1SIKXgxqFV
         ygijoySO9e05fz2uw/bY5ynmnFxR3MQUubp7tDqIxeihx9ie1VAXyQLogyRoAC7X1/Q3
         2Vqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=P8eNaTqG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 23si13496153qtt.185.2017.07.05.01.24.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jul 2017 01:24:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=P8eNaTqG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:44795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dSfbo-0000Bg-Az
	for alex.bennee@linaro.org; Wed, 05 Jul 2017 04:24:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dSfb6-00086G-8u
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 04:23:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dSfb3-00016d-0P
	for qemu-arm@nongnu.org; Wed, 05 Jul 2017 04:23:44 -0400
Received: from mail-ve1eur01on0042.outbound.protection.outlook.com
	([104.47.1.42]:11136
	helo=EUR01-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dSfb2-00016H-8U; Wed, 05 Jul 2017 04:23:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=vH7CXtGrh8ZB5vg+xRJhTexwSouaHEH6uCz5OThHfio=;
	b=P8eNaTqGbKhTLtmvtngPu4ocJdgduYmDXwZTbm180ZeBxBD/l32g3zcagQmkmnc4DAqeKR2E6ZZnmbIMOVpljC+xtdqhIHirHZociiV3XGPzFelscVC9dfXV3vdhulLw3VV7DU8EfupDXcaxcZU0PNkLw4xnxSFtAUjyx3b5SOQ=
Received: from HE1PR0401MB2556.eurprd04.prod.outlook.com (10.168.148.10) by
	HE1PR0401MB2555.eurprd04.prod.outlook.com (10.168.148.9) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1220.11; Wed, 5 Jul 2017 08:23:35 +0000
Received: from HE1PR0401MB2556.eurprd04.prod.outlook.com
	([fe80::d985:38ae:fd1:4e88]) by
	HE1PR0401MB2556.eurprd04.prod.outlook.com
	([fe80::d985:38ae:fd1:4e88%18]) with mapi id 15.01.1220.018;
	Wed, 5 Jul 2017 08:23:35 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "jean-philippe.brucker@arm.com"
	<jean-philippe.brucker@arm.com>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36dbfM0cmMlk0UqAg6W7m9YdMaIcD2KwgAAIugCAAE8owIAAB4qAgA9wB1CACwTDgIAOGkuA
Date: Wed, 5 Jul 2017 08:23:35 +0000
Message-ID: <HE1PR0401MB2556D19D91F25DCE96FE7B199AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
In-Reply-To: <c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0401MB2555;
	7:czZ7n3s9thqqAwGR6MBLJ8EQZCxXg5sQcJDN6RqE9dbeSl6+HlcTLly5uaNv1PQb3X6ANYHSCrC/Z6lUxvhTIp0oSYfKu52TxT19hl+edH4LwIiCnXHgDmKyJZcpg900Kt3dzOj0/MkIWBWUpSyrfgxouVskDXSSx1JDb6SW8I1t5MG00JYzFdKoDRhTB3PEqkRDvdGeVqCB7pj0Tr9lx4/YbWUCnh2G5659LuS0r2562eOJWo9HqMhioRhJ2vkjfpFYJvFcTkxdYH34iwuBWo8n9Gtc0Gf+Av49s4WAwRjXH2aVJBH5NzYpg/NzCqN6veshe9t1fdp6ZecP/zSqLzxnH7GqAsEzydSzhbYsO2v03prTiAeJ8DmA4eG0V5ta0m71wwwzH5LyaCrCmFzxaqV8y2nmWnsNEMpQpgEi7IpSqlNGSiNakCNTinJvR0Q/V7xHxrpu7MahkCCbu5sgx1KPkA8/QnBR4AG2BmAyd54atqAMLXREGdxpSP7z/bAJqL2R03CzGH6RsPs0sHriNqAogC4tfpW6VNDJmA6ZCNg4ngS7OSCRN8rEKkwP5DIyfBugMIhOKL3cSIIopzMx4mACEvZtJuIKk+WPqGbujQFbufpmSd8+MYCoJVZeGAuN4KEGfsyjw7Yls1WL3DsrIJP60yQk6MyTXH2gumpLICKdmf/UCYouIiSQgwb4r8gAsuumG6THu+IqISGOIt4XTXyP8j5qgfaWr0avBgIdd7YNUHCiQd3e86p03XhCkOgZCIhE3XDqh+uZnx0ZhTrSyoL9jaABVmsDoINdGeg0IDQ=
x-ms-office365-filtering-correlation-id: e26d66cb-164c-4311-37bb-08d4c37f2179
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(48565401081)(300000503095)(300135400095)(2017052603031)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:HE1PR0401MB2555; 
x-ms-traffictypediagnostic: HE1PR0401MB2555:
x-microsoft-antispam-prvs: <HE1PR0401MB2555592BD4ECF1CB5582BA579AD40@HE1PR0401MB2555.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(133145235818549)(166708455590820)(236129657087228)(185117386973197)(167848164394848)(228905959029699)(247924648384137);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123562025)(20161123560025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:HE1PR0401MB2555; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1PR0401MB2555; 
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39850400002)(39860400002)(39410400002)(39840400002)(39450400003)(39400400002)(13464003)(53234004)(377454003)(24454002)(478600001)(8936002)(2906002)(3280700002)(6506006)(189998001)(99286003)(5660300001)(7696004)(55016002)(54906002)(6436002)(3660700001)(53936002)(50986999)(76176999)(9686003)(93886004)(25786009)(54356999)(6306002)(305945005)(53546010)(966005)(2201001)(2950100002)(3846002)(7736002)(33656002)(6116002)(102836003)(2501003)(5250100002)(229853002)(106356001)(66066001)(14454004)(4326008)(39060400002)(2900100001)(6246003)(81166006)(7416002)(8676002)(86362001)(74316002)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0401MB2555;
	H:HE1PR0401MB2556.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2017 08:23:35.4356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2555
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.1.42
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
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
X-TUID: fNooMg0FRe5h

Hi Eric,

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Monday, June 26, 2017 1:25 PM
> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com
> Cc: wei@redhat.com; kevin.tian@intel.com; marc.zyngier@arm.com;
> tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com;
> robin.murphy@arm.com; christoffer.dall@linaro.org
> Subject: Re: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
>=20
> Hi Bharat,
>=20
> On 19/06/2017 09:54, Bharat Bhushan wrote:
> > Hi Eric,
> >
> > I started added replay in virtio-iommu and came across how MSI interrup=
ts
> with work with VFIO.
> > I understand that on intel this works differently but vsmmu will have s=
ame
> requirement.
> > kvm-msi-irq-route are added using the msi-address to be translated by
> viommu and not the final translated address.
> > While currently the irqfd framework does not know about emulated
> iommus (virtio-iommu, vsmmuv3/vintel-iommu).
> > So in my view we have following options:
> > - Programming with translated address when setting up
> > kvm-msi-irq-route
> > - Route the interrupts via QEMU, which is bad from performance
> > - vhost-virtio-iommu may solve the problem in long term
>=20
> Sorry for the delay. With regard to the vsmmuv3/vfio integration I think =
we
> need to use the guest physical address otherwise the MSI address will not=
 be
> recognized as an MSI doorbell.
>=20
> Also the fact on ARM we map the MSI doorbell causes an assert in
> vfio_get_vaddr() as the vITS doorbell is not a RAM region. We will need t=
o
> handle this specifically.

Also when setup msi-route kvm_irqchip_add_msi_route() we needed to provide =
the translated address.
According to my understanding this is required because kernel does no go th=
rough viommu translation when generating interrupt, no?=20

Thanks
-Bharat

>=20
> Besides I have not looked specifically at the virtio-iommu/vfio integrati=
on
> yet.
>=20
> Thanks
>=20
> Eric
> >
> > Is there any other better option I am missing?
> >
> > Thanks
> > -Bharat
> >
> >> -----Original Message-----
> >> From: Auger Eric [mailto:eric.auger@redhat.com]
> >> Sent: Friday, June 09, 2017 5:24 PM
> >> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
> >> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> >> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
> >> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com
> >> Cc: wei@redhat.com; kevin.tian@intel.com; marc.zyngier@arm.com;
> >> tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com;
> >> robin.murphy@arm.com; christoffer.dall@linaro.org
> >> Subject: Re: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
> >>
> >> Hi Bharat,
> >>
> >> On 09/06/2017 13:30, Bharat Bhushan wrote:
> >>> Hi Eric,
> >>>
> >>>> -----Original Message-----
> >>>> From: Auger Eric [mailto:eric.auger@redhat.com]
> >>>> Sent: Friday, June 09, 2017 12:14 PM
> >>>> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
> >>>> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> >>>> alex.williamson@redhat.com; mst@redhat.com; qemu-
> arm@nongnu.org;
> >>>> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com
> >>>> Cc: will.deacon@arm.com; robin.murphy@arm.com;
> >> kevin.tian@intel.com;
> >>>> marc.zyngier@arm.com; christoffer.dall@linaro.org;
> >>>> drjones@redhat.com; wei@redhat.com; tn@semihalf.com
> >>>> Subject: Re: [RFC v2 0/8] VIRTIO-IOMMU device
> >>>>
> >>>> Hi Bharat,
> >>>>
> >>>> On 09/06/2017 08:16, Bharat Bhushan wrote:
> >>>>> Hi Eric,
> >>>>>
> >>>>>> -----Original Message-----
> >>>>>> From: Eric Auger [mailto:eric.auger@redhat.com]
> >>>>>> Sent: Wednesday, June 07, 2017 9:31 PM
> >>>>>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> >>>>>> peter.maydell@linaro.org; alex.williamson@redhat.com;
> >>>> mst@redhat.com;
> >>>>>> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
> >>>>>> philippe.brucker@arm.com
> >>>>>> Cc: will.deacon@arm.com; robin.murphy@arm.com;
> >>>> kevin.tian@intel.com;
> >>>>>> marc.zyngier@arm.com; christoffer.dall@linaro.org;
> >>>>>> drjones@redhat.com; wei@redhat.com; tn@semihalf.com; Bharat
> >>>> Bhushan
> >>>>>> <bharat.bhushan@nxp.com>
> >>>>>> Subject: [RFC v2 0/8] VIRTIO-IOMMU device
> >>>>>>
> >>>>>> This series implements the virtio-iommu device. This is a proof
> >>>>>> of concept based on the virtio-iommu specification written by
> >>>>>> Jean-Philippe
> >>>> Brucker [1].
> >>>>>> This was tested with a guest using the virtio-iommu driver [2]
> >>>>>> and exposed with a virtio-net-pci using dma ops.
> >>>>>>
> >>>>>> The device gets instantiated using the "-device virtio-iommu-devic=
e"
> >>>>>> option. It currently works with ARM virt machine only as the
> >>>>>> machine must handle the dt binding between the virtio-mmio
> "iommu"
> >>>>>> node and the PCI host bridge node. ACPI booting is not yet
> supported.
> >>>>>>
> >>>>>> This should allow to start some benchmarking activities against
> >>>>>> pure emulated IOMMU (especially ARM SMMU).
> >>>>>
> >>>>> I am testing this on ARM64 and see below continuous error prints:
> >>>>>
> >>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>>>
> >>>>>
> >>>>> Also in guest I do not see device-tree node with virtio-iommu.
> >>>> do you mean the virtio-mmio with #iommu-cells property?
> >>>>
> >>>> This one is created statically by virt machine. I would be
> >>>> surprised if it were not there. Are you using the virt =3D virt2.10 =
machine.
> >>>> Machines before do not support its instantiation.
> >>>>
> >>>> Please can you add a printf in hw/arm/virt.c create_virtio_mmio()
> >>>> at the moment when this node is created. Also you can add a printf
> >>>> in
> >>>> bind_virtio_iommu_device() to make sure the binding with the PCI
> >>>> host bridge is added on machine init done.
> >>>>
> >>>> Also worth to check, CONFIG_VIRTIO_IOMMU=3Dy on guest side.
> >>>
> >>> It works on my side.
> >> Great.
> >>
> >>  The driver config was disabled and also I was using guest kernel
> >> which was not have deferred-probing.
> >> Yes I did not mention in my cover letter the guest I have been using
> >> is based on Jean-Philippe's branch, featuring deferred IOMMU probing.
> >> I I have not tried yet with an upstream guest.
> >>  Now after fixing it works on my side
> >>> I placed some prints to see dma-map are mapping regions in
> >>> virtio-iommu,
> >> it uses emulated iommu.
> >>>
> >>> I will continue to add VFIO support now on this and more testing !!
> >>
> >> OK. I will do the VFIO integration first on the vsmmuv3 device as I
> >> already prepared the VFIO replay and hopefully we will sync ;-)
> >>
> >> Thanks
> >>
> >> Eric
> >>>
> >>> Thanks
> >>> -Bharat
> >>>
> >>>>
> >>>> Thanks
> >>>>
> >>>> Eric
> >>>>
> >>>>> I am using qemu-tree you mentioned below and iommu-driver
> patches
> >>>> published by Jean-P.
> >>>>> Qemu command line have additional ""-device virtio-iommu-device".
> >>>>> What
> >>>> I am missing ?
> >>>>
> >>>>
> >>>>>
> >>>>> Thanks
> >>>>> -Bharat
> >>>>>
> >>>>>>
> >>>>>> Best Regards
> >>>>>>
> >>>>>> Eric
> >>>>>>
> >>>>>> This series can be found at:
> >>>>>> https://github.com/eauger/qemu/tree/virtio-iommu-rfcv2
> >>>>>>
> >>>>>> References:
> >>>>>> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU, [2] [RFC
> >>>>>> PATCH linux]
> >>>>>> iommu: Add virtio-iommu driver [3] [RFC PATCH kvmtool 00/15] Add
> >>>>>> virtio- iommu
> >>>>>>
> >>>>>> History:
> >>>>>> v1 -> v2:
> >>>>>> - fix redifinition of viommu_as typedef
> >>>>>>
> >>>>>> Eric Auger (8):
> >>>>>>   update-linux-headers: import virtio_iommu.h
> >>>>>>   linux-headers: Update for virtio-iommu
> >>>>>>   virtio_iommu: add skeleton
> >>>>>>   virtio-iommu: Decode the command payload
> >>>>>>   virtio_iommu: Add the iommu regions
> >>>>>>   virtio-iommu: Implement the translation and commands
> >>>>>>   hw/arm/virt: Add 2.10 machine type
> >>>>>>   hw/arm/virt: Add virtio-iommu the virt board
> >>>>>>
> >>>>>>  hw/arm/virt.c                                 | 116 ++++-
> >>>>>>  hw/virtio/Makefile.objs                       |   1 +
> >>>>>>  hw/virtio/trace-events                        |  14 +
> >>>>>>  hw/virtio/virtio-iommu.c                      | 623
> >>>> ++++++++++++++++++++++++++
> >>>>>>  include/hw/arm/virt.h                         |   5 +
> >>>>>>  include/hw/virtio/virtio-iommu.h              |  60 +++
> >>>>>>  include/standard-headers/linux/virtio_ids.h   |   1 +
> >>>>>>  include/standard-headers/linux/virtio_iommu.h | 142 ++++++
> >>>>>>  linux-headers/linux/virtio_iommu.h            |   1 +
> >>>>>>  scripts/update-linux-headers.sh               |   3 +
> >>>>>>  10 files changed, 957 insertions(+), 9 deletions(-)  create mode
> >>>>>> 100644 hw/virtio/virtio-iommu.c  create mode 100644
> >>>>>> include/hw/virtio/virtio- iommu.h  create mode 100644
> >>>>>> include/standard- headers/linux/virtio_iommu.h  create mode
> >>>>>> 100644 linux-headers/linux/virtio_iommu.h
> >>>>>>
> >>>>>> --
> >>>>>> 2.5.5
> >>>>>
> >>>
> >
