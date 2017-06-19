Received: by 10.25.15.165 with SMTP id 37csp237876lfp;
        Mon, 19 Jun 2017 00:54:30 -0700 (PDT)
X-Received: by 10.31.69.138 with SMTP id s132mr13265818vka.13.1497858870149;
        Mon, 19 Jun 2017 00:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1497858870; cv=none;
        d=google.com; s=arc-20160816;
        b=H61XDa/XjztXPHPtZH2kV23YsIU40EFvdtS80iLjB67rDEobwwNFtxDGc4L+t7v+0X
         cO1yMWOvOS5hhRZyL7xUAJ84O7IafRGaodyl1VCEePp76d/c+yLfN/i8NYzVBjpfQKlB
         ecBebSyz3wlwaU+nKl8PpFwDICfI4zAWC4TeAOBTykGy61QYslotxTxqluu8wnAXIqAO
         u3TESjr0bNwC0Crt++rKzPVAFsclKKHfreTNKD6P7wDgckSp7sNyZLyVLaQHSOhCOyR3
         oWLpMIfvUtGCxGbrdZUXC1WxrMNuM17xSq2xIwmpIWWDQQ1rlYB53ExTiIXe15anka6V
         zQEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=pOJ2UqlyA6kVUzsBVmSkS1NeeEVwm8B4d1gH73BzVdg=;
        b=YRGe+8kf4D4+HPd5fIkm17BgjfOzBjb0UI0Hvf01OQOHTZtcBAfI2G8QHED3chjGFQ
         mqpYXXW4OLpbdgvbh6LpVn3FkWgCC7gw1ZiaLfVTUo0arjmiEbMp3Vac6BVeZ8l9aFqa
         ib6W04IcnRvA75AELSL5j/kj6S7Qcg4X82Gpjjf85vO4bIwk/jTE3KF94cojuVWPrPX/
         HeDJrWOXZ/y137lTvXDsqN6DVvCvtMuYaLHUFV6dxjnBXQwMIpIjS9Pru1mECauTHkme
         FP53HHKwzrDihSq89siq2oTpcdjQ6nFtNsCiQMwvTscVFQTlEb4XSmqC1p8GxemsXanH
         6R4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.b=uaJ8tI5W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j190si4215275vkf.100.2017.06.19.00.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Jun 2017 00:54:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.b=uaJ8tI5W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:41028 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dMrW1-0001h7-HR
	for alex.bennee@linaro.org; Mon, 19 Jun 2017 03:54:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dMrVu-0001gq-3j
	for qemu-arm@nongnu.org; Mon, 19 Jun 2017 03:54:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dMrVr-00023b-05
	for qemu-arm@nongnu.org; Mon, 19 Jun 2017 03:54:22 -0400
Received: from mail-eopbgr20048.outbound.protection.outlook.com
	([40.107.2.48]:14571
	helo=EUR02-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dMrVq-000226-Ci; Mon, 19 Jun 2017 03:54:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pOJ2UqlyA6kVUzsBVmSkS1NeeEVwm8B4d1gH73BzVdg=;
	b=uaJ8tI5WqOY+pCJG8S+2hgL+C4oO21IUAN0I+WpT3uJpZ+NMJ2dvacjZ+QV4WRSEL/x6Nbqt4HQWtClV2tWhJlm2xCoU3+ojjQIybl7Mdn8BUXP+OoWaEYzpwvQ2J8hBgI9E9gogkxo+lmRtF8AZGBn+KVJ1qwF7VInv6oJ3Vy0=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1178.14; Mon, 19 Jun 2017 07:54:12 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::2da9:49d5:a9e4:54fd]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::2da9:49d5:a9e4:54fd%18]) with mapi id 15.01.1178.018;
	Mon, 19 Jun 2017 07:54:12 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "jean-philippe.brucker@arm.com"
	<jean-philippe.brucker@arm.com>
Thread-Topic: [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
Thread-Index: AQHS36dbfM0cmMlk0UqAg6W7m9YdMaIcD2KwgAAIugCAAE8owIAAB4qAgA9wB1A=
Date: Mon, 19 Jun 2017 07:54:12 +0000
Message-ID: <AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
In-Reply-To: <6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2545;
	7:dsL9u0JCsIgSYcSvpg3KIm1NZBRmv5n72APaGRRcid7qj5W+6ix90zxvzg/GT2YSpKAE0T9UlXiDGdIIkjRWsWl5hv6cQgF+DoXvINaqOUy2pD1CbcEcABV4n+m0lOSqPX1I8MEU6TZHw26C8Eep6peinJq8wAAbjThZNv+KviXP8XUQv7RJ7F0W1XqiuVojq2TsWOvbAZOiE5NnWAp219X9RSCkWyhWTIbykGFPGjhSGdVuYa06Z5N1E9BJHszOajpi13kkwutW0U/wkb8moA+7YbbV0qTY4kWePrRmrdP5DrlcZX45I/4Z2agzsKkKVcuTNqxHGXXnQPDjAX8abPzi74LOJD5OHPdplYZXRWnJUz98nhUHA2Z/eVcorBa8shFLhwXJRY6qbZBuazeVVVJji0CwWOQoxteNhFwaxSXrcv7pfUuIdgddZE7LCPyxtYYNkjyg5alX2y8vy62EknuZXd3LvjD/K/fdfHWkLUsky9f1L+f/Sucif3zEjds/8N1gLRMfgq9ViLh+8U80ndGJrVTtNCV7/GLiLoPMmLIm5r9cbc1BT68NouL0ysvCP4MRHLpo5nJ4BLxs0D124DuwNYmoxqPOdAgwLajGMWcAuje/wvXWn8WoiWeLA+u8nP2JoSX00Zu6ywh+J1d6eZ4tNgjXTZjxbmCMi4Dm1898yW1GqjfJbVgeBhqnR4FxQDMZVOco7djqG9hnmRigVW1dX8eVihei9r0BW9olJ7nBGhS35FwtAlrDNsujrqVN4Jj7re9Z2XZ5PwolfyaU2B1RvtO9s3yMjvecEiL4eKk=
x-ms-office365-filtering-correlation-id: 208a4885-f8aa-4dd5-61be-08d4b6e86027
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081);
	SRVR:AM5PR0401MB2545; 
x-ms-traffictypediagnostic: AM5PR0401MB2545:
x-microsoft-antispam-prvs: <AM5PR0401MB254500B659E1AF7287C2F1A59AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(166708455590820)(185117386973197)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(100000703101)(100105400095)(6055026)(6041248)(20161123558100)(20161123564025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123555025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2545; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2545; 
x-forefront-prvs: 0343AC1D30
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(39400400002)(39860400002)(39840400002)(39410400002)(39450400003)(39850400002)(377454003)(24454002)(53234004)(13464003)(39060400002)(99286003)(74316002)(3280700002)(229853002)(305945005)(2201001)(6246003)(2906002)(38730400002)(2900100001)(4326008)(33656002)(55016002)(5250100002)(2501003)(3660700001)(9686003)(6306002)(76176999)(189998001)(54356999)(54906002)(50986999)(53936002)(53546009)(25786009)(66066001)(6506006)(2950100002)(14454004)(6436002)(966005)(93886004)(478600001)(102836003)(8676002)(7736002)(81156014)(7696004)(6116002)(3846002)(5660300001)(7416002)(86362001)(8936002)(81166006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2545;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2017 07:54:12.5872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2545
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.2.48
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
X-TUID: NgIK4Bbcqw2T

Hi Eric,

I started added replay in virtio-iommu and came across how MSI interrupts w=
ith work with VFIO.=20
I understand that on intel this works differently but vsmmu will have same =
requirement.=20
kvm-msi-irq-route are added using the msi-address to be translated by viomm=
u and not the final translated address.
While currently the irqfd framework does not know about emulated iommus (vi=
rtio-iommu, vsmmuv3/vintel-iommu).
So in my view we have following options:
- Programming with translated address when setting up kvm-msi-irq-route
- Route the interrupts via QEMU, which is bad from performance
- vhost-virtio-iommu may solve the problem in long term

Is there any other better option I am missing?

Thanks
-Bharat

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Friday, June 09, 2017 5:24 PM
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
> On 09/06/2017 13:30, Bharat Bhushan wrote:
> > Hi Eric,
> >
> >> -----Original Message-----
> >> From: Auger Eric [mailto:eric.auger@redhat.com]
> >> Sent: Friday, June 09, 2017 12:14 PM
> >> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
> >> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> >> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
> >> qemu-devel@nongnu.org; jean-philippe.brucker@arm.com
> >> Cc: will.deacon@arm.com; robin.murphy@arm.com;
> kevin.tian@intel.com;
> >> marc.zyngier@arm.com; christoffer.dall@linaro.org;
> >> drjones@redhat.com; wei@redhat.com; tn@semihalf.com
> >> Subject: Re: [RFC v2 0/8] VIRTIO-IOMMU device
> >>
> >> Hi Bharat,
> >>
> >> On 09/06/2017 08:16, Bharat Bhushan wrote:
> >>> Hi Eric,
> >>>
> >>>> -----Original Message-----
> >>>> From: Eric Auger [mailto:eric.auger@redhat.com]
> >>>> Sent: Wednesday, June 07, 2017 9:31 PM
> >>>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com;
> >>>> peter.maydell@linaro.org; alex.williamson@redhat.com;
> >> mst@redhat.com;
> >>>> qemu-arm@nongnu.org; qemu-devel@nongnu.org; jean-
> >>>> philippe.brucker@arm.com
> >>>> Cc: will.deacon@arm.com; robin.murphy@arm.com;
> >> kevin.tian@intel.com;
> >>>> marc.zyngier@arm.com; christoffer.dall@linaro.org;
> >>>> drjones@redhat.com; wei@redhat.com; tn@semihalf.com; Bharat
> >> Bhushan
> >>>> <bharat.bhushan@nxp.com>
> >>>> Subject: [RFC v2 0/8] VIRTIO-IOMMU device
> >>>>
> >>>> This series implements the virtio-iommu device. This is a proof of
> >>>> concept based on the virtio-iommu specification written by
> >>>> Jean-Philippe
> >> Brucker [1].
> >>>> This was tested with a guest using the virtio-iommu driver [2] and
> >>>> exposed with a virtio-net-pci using dma ops.
> >>>>
> >>>> The device gets instantiated using the "-device virtio-iommu-device"
> >>>> option. It currently works with ARM virt machine only as the
> >>>> machine must handle the dt binding between the virtio-mmio "iommu"
> >>>> node and the PCI host bridge node. ACPI booting is not yet supported=
.
> >>>>
> >>>> This should allow to start some benchmarking activities against
> >>>> pure emulated IOMMU (especially ARM SMMU).
> >>>
> >>> I am testing this on ARM64 and see below continuous error prints:
> >>>
> >>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>> 	virtio_iommu_translate sid=3D8 is not known!!
> >>>
> >>>
> >>> Also in guest I do not see device-tree node with virtio-iommu.
> >> do you mean the virtio-mmio with #iommu-cells property?
> >>
> >> This one is created statically by virt machine. I would be surprised
> >> if it were not there. Are you using the virt =3D virt2.10 machine.
> >> Machines before do not support its instantiation.
> >>
> >> Please can you add a printf in hw/arm/virt.c create_virtio_mmio() at
> >> the moment when this node is created. Also you can add a printf in
> >> bind_virtio_iommu_device() to make sure the binding with the PCI host
> >> bridge is added on machine init done.
> >>
> >> Also worth to check, CONFIG_VIRTIO_IOMMU=3Dy on guest side.
> >
> > It works on my side.
> Great.
>=20
>  The driver config was disabled and also I was using guest kernel which w=
as
> not have deferred-probing.
> Yes I did not mention in my cover letter the guest I have been using is b=
ased
> on Jean-Philippe's branch, featuring deferred IOMMU probing. I I have not
> tried yet with an upstream guest.
>  Now after fixing it works on my side
> > I placed some prints to see dma-map are mapping regions in virtio-iommu=
,
> it uses emulated iommu.
> >
> > I will continue to add VFIO support now on this and more testing !!
>=20
> OK. I will do the VFIO integration first on the vsmmuv3 device as I alrea=
dy
> prepared the VFIO replay and hopefully we will sync ;-)
>=20
> Thanks
>=20
> Eric
> >
> > Thanks
> > -Bharat
> >
> >>
> >> Thanks
> >>
> >> Eric
> >>
> >>> I am using qemu-tree you mentioned below and iommu-driver patches
> >> published by Jean-P.
> >>> Qemu command line have additional ""-device virtio-iommu-device".
> >>> What
> >> I am missing ?
> >>
> >>
> >>>
> >>> Thanks
> >>> -Bharat
> >>>
> >>>>
> >>>> Best Regards
> >>>>
> >>>> Eric
> >>>>
> >>>> This series can be found at:
> >>>> https://github.com/eauger/qemu/tree/virtio-iommu-rfcv2
> >>>>
> >>>> References:
> >>>> [1] [RFC 0/3] virtio-iommu: a paravirtualized IOMMU, [2] [RFC PATCH
> >>>> linux]
> >>>> iommu: Add virtio-iommu driver [3] [RFC PATCH kvmtool 00/15] Add
> >>>> virtio- iommu
> >>>>
> >>>> History:
> >>>> v1 -> v2:
> >>>> - fix redifinition of viommu_as typedef
> >>>>
> >>>> Eric Auger (8):
> >>>>   update-linux-headers: import virtio_iommu.h
> >>>>   linux-headers: Update for virtio-iommu
> >>>>   virtio_iommu: add skeleton
> >>>>   virtio-iommu: Decode the command payload
> >>>>   virtio_iommu: Add the iommu regions
> >>>>   virtio-iommu: Implement the translation and commands
> >>>>   hw/arm/virt: Add 2.10 machine type
> >>>>   hw/arm/virt: Add virtio-iommu the virt board
> >>>>
> >>>>  hw/arm/virt.c                                 | 116 ++++-
> >>>>  hw/virtio/Makefile.objs                       |   1 +
> >>>>  hw/virtio/trace-events                        |  14 +
> >>>>  hw/virtio/virtio-iommu.c                      | 623
> >> ++++++++++++++++++++++++++
> >>>>  include/hw/arm/virt.h                         |   5 +
> >>>>  include/hw/virtio/virtio-iommu.h              |  60 +++
> >>>>  include/standard-headers/linux/virtio_ids.h   |   1 +
> >>>>  include/standard-headers/linux/virtio_iommu.h | 142 ++++++
> >>>>  linux-headers/linux/virtio_iommu.h            |   1 +
> >>>>  scripts/update-linux-headers.sh               |   3 +
> >>>>  10 files changed, 957 insertions(+), 9 deletions(-)  create mode
> >>>> 100644 hw/virtio/virtio-iommu.c  create mode 100644
> >>>> include/hw/virtio/virtio- iommu.h  create mode 100644
> >>>> include/standard- headers/linux/virtio_iommu.h  create mode 100644
> >>>> linux-headers/linux/virtio_iommu.h
> >>>>
> >>>> --
> >>>> 2.5.5
> >>>
> >
