Received: by 10.223.172.38 with SMTP id v35csp4376949wrc;
        Tue, 26 Sep 2017 23:48:21 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBpj6pSvKNENr5sv5gZ53sTzweyZXxzjhpymKD6USeApIoMJ9kn+o3IftzC7XP6+8PslT5D
X-Received: by 10.55.160.4 with SMTP id j4mr922207qke.357.1506494901336;
        Tue, 26 Sep 2017 23:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506494901; cv=none;
        d=google.com; s=arc-20160816;
        b=u4C/5BSM6IOO1sSPLXpVReL3dTiVgGXksjMCWhp3oJT4AL7vS1Vay3Zx8KIet5i8oc
         4RxRtQKdPbJLEke5/bHYqYupwh3lHwXRCClnGO9UHhCK/8BA0XmskKk1MgHXdcv/ky8a
         yGAimbxBGTvVs0n7TI+eLbgkAts1z1uPenbMiV1lkTfhafL6iWLAvEnYmcy8Wkhvv+Lc
         wbh/0RYZVCBBRloaRA8RWS95yijWO3YqpOgT+q7StUU7lI8G8foII1gbiN4GMZdx1VOJ
         2x7PxrK/+kQXv4Rbb9VfYKYU5PDICi6m+POidY5c2CLwdZAqMFxQBlAfPXP3/sGgY3l+
         Y44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=bkjcFu9+cHvjCxwZ8nVMFBZ51GXYG3J1CvVcVGIXIZA=;
        b=GkmLgLEvLBRj+XeJh4a2zxqnda3W5NqFhGeJYDm1WW9j0im8Pyv0VU4SgvzVRTd0z0
         eyXI/E7t+qKTMQ8qJS6c0DAtEsZfOpeEDz9zY1mkhztVaWj0AuhfVHS7b4WPviaM7Kwt
         +pGDt/3Ydtu1gk8mm8wOdBSZ0BhyIpfv1s9WGesxGaSUn6Yuugw/Z/w1GWN1ctJz3zh/
         Om/HXiMjA/2R4ZADkViSsHS5zALuCO3V/eG3LelR0rkqgOj81GlmSc1SBitt9FM1sp3z
         nV3Bi6SYjWxg1GhKQsR5603G/qU//Wa8SrT08gjD+GNI3W/aBhwDyQIzSOxffnbUAx/7
         2Ugw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=CxycgCKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t72si8848540qkg.527.2017.09.26.23.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Sep 2017 23:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=CxycgCKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:52470 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx68p-0007j8-2r
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 02:48:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dx672-0006hs-2u
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 02:46:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dx66y-0003Qv-5B
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 02:46:28 -0400
Received: from mail-ve1eur01on0084.outbound.protection.outlook.com
	([104.47.1.84]:49568
	helo=EUR01-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dx66x-0003QW-Lk; Wed, 27 Sep 2017 02:46:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=bkjcFu9+cHvjCxwZ8nVMFBZ51GXYG3J1CvVcVGIXIZA=;
	b=CxycgCKlDxhK9i1pHmXUW6DtTl4RkgOoqh8Bo0jhyP1NLym5DNW71hyhYa2hNGRiNCqzu5LzNPunO3zW1xF0pszbTHjS+nol4DdCa4K0394qF9AkeLO/1UEbYsqs4JahaxewFqGdU3HqrxzVrKpMWr71ZsVG0LctjGSt7fEZNlI=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2548.eurprd04.prod.outlook.com (10.169.245.11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 27 Sep 2017 06:46:19 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327%18]) with mapi id 15.20.0077.016;
	Wed, 27 Sep 2017 06:46:18 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Bharat Bhushan <bharat.bhushan@nxp.com>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "peterx@redhat.com" <peterx@redhat.com>
Thread-Topic: [PATCH v4 0/5] virtio-iommu: VFIO integration
Thread-Index: AQHTN1rqdMCSmFjsv0elJFTnh6rDzqLIR3Yg
Date: Wed, 27 Sep 2017 06:46:18 +0000
Message-ID: <AM5PR0401MB25458FFED2D7D405A71F954C9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
In-Reply-To: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2548;
	6:gFys2/lOfDrhWyYCRCg0jE1D5tBbe4M/xpKpUhiV+JY4LlTn0XpFhaGcgZS/kZSYYMIgYMW7oTFndDT5Jmjm+Gvv5mVsIsxA+Ll25PHZTvvUWYP4fYB1exD23uIBZPgUDQrkgabHFy6A6o5wSsjamVfrRVMdTCJixP6f3gZ5R00y62m49G7AF6Us0MT5E1fyQAVxsLCCYanMwaFRDICQ/pcyATE9TBgH9478CM7sKusBoiavpbUpH533WwAgWh06c3J1YPJsQgxbppNNZvVoX9M2E+OF+fPw3AxNLmzJSz6n7ITF7mzZndwc7FQ44VW09UvF9mOZwhLap5dFhSWPPg==;
	5:VrVHRR6NS9BQkaHuPgyKshDIQ4kQOoV18N2DgANowBhPQPNSCkLSDOby+WaCBjR0pB6fGyuSNTIzRpFTYR2PHmfavs7CCe1XwRni88YTNLS094wScIFtDB3/uOHIVhGQB5hNqvdZzCdTzxQwIJpJWg==;
	24:R03RyknZas6oqGmLCQWcC1n0vwRWZOwLaT9erUS5hCIgDUDQC7thdCB3apD3hwiZHLNgFhZ/vwQ2Az+hlG0uC8i3JMv3ZYXsKs3PLBXEr9o=;
	7:ud1EcA8efsSrJ3PS1gJKUkrOm01vrdGOvDaOrwae1DCQyWoHXjWPM6P/0LnGU0Bwj5jqmunuQD2sX12kN1J1EO1Wssuszl3Is59U6bnDM2sV9++vy/t3P5MGf6cRuEyCfC/HLtp0xLvbB+ddte9Zq2sVDSo4Hu+aNYhiqBMDjVvE60SGtNIOm95oN+2p+UnSz75PP9frvjI7T9HROS67LDKK0q7fOG4J3MR/uTmvqn4=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(376002)(346002)(189002)(13464003)(199003)(377454003)(6246003)(305945005)(7416002)(53936002)(5890100001)(53546010)(97736004)(5250100002)(2501003)(39060400002)(2201001)(7736002)(2900100001)(966005)(81156014)(8676002)(8936002)(189998001)(99286003)(6306002)(55016002)(9686003)(81166006)(74316002)(5660300001)(2950100002)(14454004)(4326008)(7696004)(54906003)(106356001)(105586002)(110136005)(101416001)(6436002)(478600001)(86362001)(6506006)(76176999)(25786009)(3660700001)(33656002)(3280700002)(68736007)(316002)(229853002)(102836003)(2906002)(50986999)(54356999)(6116002)(3846002)(66066001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2548;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-ms-office365-filtering-correlation-id: af013446-6d97-4c08-d311-08d50573751f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(48565401081)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:AM5PR0401MB2548; 
x-ms-traffictypediagnostic: AM5PR0401MB2548:
x-exchange-antispam-report-test: UriScan:(180628864354917)(166708455590820)(185117386973197)(228905959029699);
x-microsoft-antispam-prvs: <AM5PR0401MB25485E817A24B439934E4E3D9A780@AM5PR0401MB2548.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041248)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123558100)(20161123564025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2548; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2548; 
x-forefront-prvs: 04433051BF
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2017 06:46:18.5941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2548
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.1.84
Subject: Re: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
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
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sv7UAUo+tAoC

Hi Peter,

While vfio with virtio-iommu I observed one issue,  When virtio-iommu devic=
e exists but guest kernel does not have virtio-iommu driver (not enabled in=
 Config) then IOMMU faults are reported on host.

This is because no mapping is created in IOMMU, not even default guest-phys=
ical to real-physical. While looking at vfio_listener_region_add(), it does=
 not create initial mapping in IOMMU and relies on guest to create mapping.=
 Is this something known or I am missing something?

Thanks
-Bharat

> -----Original Message-----
> From: Bharat Bhushan [mailto:Bharat.Bhushan@nxp.com]
> Sent: Wednesday, September 27, 2017 12:03 PM
> To: eric.auger@redhat.com; eric.auger.pro@gmail.com;
> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
> qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Cc: wei@redhat.com; kevin.tian@intel.com; marc.zyngier@arm.com;
> tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com;
> robin.murphy@arm.com; christoffer.dall@linaro.org;
> bharatb.yadav@gmail.com; Bharat Bhushan <bharat.bhushan@nxp.com>
> Subject: [PATCH v4 0/5] virtio-iommu: VFIO integration
>=20
> This patch series integrates VFIO/VHOST with virtio-iommu.
>=20
> This version is mainly about rebasing on v4 version on virtio-iommu devic=
e
> framework from Eric Augur and addresing review comments.
>=20
> This patch series allows PCI pass-through using virtio-iommu.
>=20
> This series is based on:
>  - virtio-iommu kernel driver by Jean-Philippe Brucker
>     [1] [RFC] virtio-iommu version 0.4
>     git://linux-arm.org/virtio-iommu.git branch viommu/v0.4
>=20
>  - virtio-iommu device emulation by Eric Augur.
>    [RFC v4 00/16] VIRTIO-IOMMU device
>    https://github.com/eauger/qemu/tree/v2.10.0-virtio-iommu-v4
>=20
> Changes are available at : https://github.com/bharaty/qemu.git virtio-
> iommu-vfio-integration-v4
>=20
> v3->v4:
>  - Rebase to v4 version from Eric
>  - Fixes from Eric with DPDK in VM
>  - Logical division in multiple patches
>=20
> v2->v3:
>  - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
>    Which is based on top of v2.10-rc0 that
>  - Fixed issue with two PCI devices
>  - Addressed review comments
>=20
> v1->v2:
>   - Added trace events
>   - removed vSMMU3 link in patch description
>=20
> Bharat Bhushan (5):
>   target/arm/kvm: Translate the MSI doorbell in kvm_arch_fixup_msi_route
>   virtio-iommu: Add iommu notifier for map/unmap
>   virtio-iommu: Call iommu notifier for attach/detach
>   virtio-iommu: add iommu replay
>   virtio-iommu: add iommu notifier memory-region
>=20
>  hw/virtio/trace-events           |   5 ++
>  hw/virtio/virtio-iommu.c         | 181
> ++++++++++++++++++++++++++++++++++++++-
>  include/hw/virtio/virtio-iommu.h |   6 ++
>  target/arm/kvm.c                 |  27 ++++++
>  target/arm/trace-events          |   3 +
>  5 files changed, 219 insertions(+), 3 deletions(-)
>=20
> --
> 1.9.3

