Received: by 10.223.188.70 with SMTP id a6csp1669763wrh;
        Wed, 23 Aug 2017 22:57:44 -0700 (PDT)
X-Received: by 10.55.95.194 with SMTP id t185mr6619051qkb.61.1503554264171;
        Wed, 23 Aug 2017 22:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503554264; cv=none;
        d=google.com; s=arc-20160816;
        b=qwpCeHJBWgyGYdI/MnDCR7jtjGQJadozrU5KUsPLocvuc2UCoFlX7G/vJXXhpfmUj9
         mZV4FLOWUd7D5l/BxXZVjVwxvOAePr4H9802HqIIyt4zWYEKKfg4hZ/zrcvXyBhsVvac
         nCX2mIgCFepcugXMAg2sPin9/TisQWKOKYn1WFFKHTcFRDtNCUBYjayNJpkHmu+nuQDP
         SaU2pja9+FhjoaS8HTIk4nd0HBfJw5qxuNKglBVJBgznCoEdE8eztCiltJIhdQ4T91Nr
         3lwprEwKHk4GDOG/lx+KFSAkU9/ICQ6N2vnO2FuACP4RPUa2Q86g0V3UF9oavEggd2D8
         vhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=4nT4aZFO3QV0VItFL9IlSsjdwp/HKrEIBKX95nATxuk=;
        b=Qq2/DzX2L2BpGzWbYmFMVGn7dMre66uQQz+XGCC9gefgGtSeEg7J6/XwOLafY614S+
         67tGoJyg3rKiF8w23DTWpMeIEKfthMdEAwz8TczuQPrVHWj4dLZgMpGxUPYHASUpSLyh
         G+E/RPzEAdMAo4uGt9K5XC4x7m2aBiae9jJ9aEPf2sHC9av4fEaZG07d0yYzoG3ANtAY
         uv892pzsVQbomgKgKK189gPLR4Jmw6Dinuk9tE5moiWmn7iSrSaEFC1+80ZNvrTM82Cd
         Nckyo+YobcMNOeSwRCLiNOnWSUf0A9mtNP1GqriHgUKqE/DLxMJJ9mvgYFazcOPB0N6s
         Ag8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=XHLb7/jm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v75si3344326qkb.35.2017.08.23.22.57.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Aug 2017 22:57:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=XHLb7/jm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:46825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkl9B-0000X1-SW
	for alex.bennee@linaro.org; Thu, 24 Aug 2017 01:57:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dkl8z-0000V5-LQ
	for qemu-arm@nongnu.org; Thu, 24 Aug 2017 01:57:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dkl8v-0007E9-IJ
	for qemu-arm@nongnu.org; Thu, 24 Aug 2017 01:57:29 -0400
Received: from mail-db5eur01on0058.outbound.protection.outlook.com
	([104.47.2.58]:14174
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dkl8v-0007DG-4n; Thu, 24 Aug 2017 01:57:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=4nT4aZFO3QV0VItFL9IlSsjdwp/HKrEIBKX95nATxuk=;
	b=XHLb7/jmpi4MX9Ky76//NgHy+VVo3ZyxgxY1rYNRPaqIDcy7FCMqZu4Z870IqN2JN4a7qrAcGCzgzJYOzJV+tLFV8C4m13yuHZiTKSOyhqEnriTKIGgn+CPunPVGgxLEQ3/k0eZgrxiCfHQdsl+1cxh2ZdNfrGucyqWU9914gV8=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2484.eurprd04.prod.outlook.com (10.169.244.140) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.1385.9;
	Thu, 24 Aug 2017 05:57:21 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::e5cb:77cb:372c:4817]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::e5cb:77cb:372c:4817%17]) with mapi id 15.01.1385.009;
	Thu, 24 Aug 2017 05:57:20 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH v3 0/2] virtio-iommu: VFIO integration
Thread-Index: AQHTGmt5KHc5JuRSYUG3gkO3aouxUKKSKIaAgADG4IA=
Date: Thu, 24 Aug 2017 05:57:20 +0000
Message-ID: <AM5PR0401MB25451870DCC640CF63AEA4449A9A0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1503312534-6642-1-git-send-email-Bharat.Bhushan@nxp.com>
	<2e23327a-3e5e-abaf-387f-d23462d8aba7@redhat.com>
In-Reply-To: <2e23327a-3e5e-abaf-387f-d23462d8aba7@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2484;
	6:CCZWQaCiZ9avEHKIDDTCf5lItwjTkPGmmnH/Hx11A0cJERznBYgnXtLBJ/y2LWeHN8UHnfyrH7QR963ug5ZZJ61wWhu+48kqOOe+9ROb7+CX8BcUYdVcOcRNrcc2uZb6ipjNiC/Q93xsgucQ+7NkCCrArQPIAOscF7Tnynr4zj6miMG+C29jYl0m09jAuSzoTiGZif+6L7GOnpA8leR/XxACC3u3vhyK9Ll0YVc4BjEwAB8kLXNk7zHtl30FBOwZ4G4Sr95XArR8QcGhN2S1UaGfinlExP8w5MCagNG43uXml0ywzTf31ibecWtwiWXJBw36fqsnw1L4sk68U5XzyQ==;
	5:q+gkdulUXtHPnckBbW3Xwd/eGl77KZIdkyx2PfGedc8PBLQbiZCaDeD524XavNJmfyhHZcYT3IGOzqiLhyARxfXoK5tVFp7hTDcfxwtUyrQz5REr7WvIJt6Cx5sXK3jJ1rxMYESrsjaNYE7bewlQdw==;
	24:oRcCgv+ofVy1eQbF+87yMLcIO/yVT1GeboG6k6mYUvAMkaMOuf0MANf8ewi/cG00zWJkDY6Q6xntgm9swiFbxhzgRX1QhOgkdzzvSk674p8=;
	7:lUNHJvwW2mGe9YuIznpBRUDIKoj+aSydrbuDlbzZJIkG6FEwlIsr4Qrs7wRCevjJgT6Nr3xv1rKdWwM4gY0NVCNXBymsQHvQ1AsHNaiHw07/G4fJxsUI3GSfZLYug3G/W7prCl5KIwyqYyvijwJvX/KLr3Pa8hqdiV9VY+Q5QFC6dQ/iPuY8FAcw3ZrGwO5PdR803NRRMqihQf5oyFYurcydEvfnxKBoCzOqqGDwOjA=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 4f8a1da1-779d-41ab-f5d4-08d4eab4fbe3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(300000502095)(300135100095)(22001)(2017030254152)(300000503095)(300135400095)(48565401081)(2017052603195)(201703131423075)(201703031133081)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:AM5PR0401MB2484; 
x-ms-traffictypediagnostic: AM5PR0401MB2484:
x-exchange-antispam-report-test: UriScan:(226959686518644)(180628864354917)(22074186197030)(185117386973197)(228905959029699);
x-microsoft-antispam-prvs: <AM5PR0401MB2484A685815E033121EBC4079A9A0@AM5PR0401MB2484.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(20161123555025)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2484; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2484; 
x-forefront-prvs: 04097B7F7F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(189002)(24454002)(377454003)(13464003)(199003)(55016002)(101416001)(81156014)(8676002)(7696004)(81166006)(25786009)(50986999)(54356999)(76176999)(5660300001)(66066001)(39060400002)(561944003)(54906002)(305945005)(97736004)(8936002)(53546010)(2900100001)(99286003)(4326008)(2501003)(9686003)(7416002)(2950100002)(106356001)(3846002)(102836003)(6116002)(14454004)(6306002)(189998001)(2201001)(74316002)(33656002)(5250100002)(478600001)(7736002)(86362001)(6436002)(2906002)(3280700002)(53936002)(68736007)(105586002)(6506006)(6246003)(229853002)(3660700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2484;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2017 05:57:20.6022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2484
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.58
Subject: Re: [Qemu-arm] [PATCH v3 0/2] virtio-iommu: VFIO integration
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
X-TUID: QrVD5cWI8BJv

Hi Eric,

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Wednesday, August 23, 2017 10:12 PM
> To: Bharat Bhushan <bharat.bhushan@nxp.com>;
> eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
> qemu-devel@nongnu.org
> Cc: wei@redhat.com; kevin.tian@intel.com; marc.zyngier@arm.com;
> tn@semihalf.com; will.deacon@arm.com; drjones@redhat.com;
> robin.murphy@arm.com; christoffer.dall@linaro.org
> Subject: Re: [PATCH v3 0/2] virtio-iommu: VFIO integration
>=20
> Hi Bharat,
>=20
> On 21/08/2017 12:48, Bharat Bhushan wrote:
> > This V3 version is mainly about rebasing on v3 version on Virtio-iommu
> > device framework from Eric Augur and addresing review comments.
> s/Augur/Auger ;-)
I am sorry,

> >
> > This patch series allows PCI pass-through using virtio-iommu.
> >
> > This series is based on:
> >  - virtio-iommu specification written by Jean-Philippe Brucker
> >    [RFC 0/3] virtio-iommu: a paravirtualized IOMMU,
> >
> >  - virtio-iommu driver by Jean-Philippe Brucker
> >    [RFC PATCH linux] iommu: Add virtio-iommu driver
> >
> >  - virtio-iommu device emulation by Eric Augur.
> >    [RFC v3 0/8] VIRTIO-IOMMU device
> >
> > PCI device pass-through and virtio-net-pci is tested with these
> > changes using dma-ops
>=20
> I confirm it works fine now with 2 assigned VFs.
>=20
> However at the moment DPDK testpmd using those 2 VFs does not work for
> me:
> 1:
> [/home/augere/UPSTREAM/dpdk/install/bin/testpmd(rte_dump_stack+0x2
> 4)
> [0x4a8a78]]
>=20
> I haven't investigated yet...

I have not run DPDK before, I am compiling right now and run.

Thanks
-Bharat

>=20
> Thanks
>=20
> Eric
> >
> > This patch series does not implement RESV_MEM changes proposal by
> Jean-Philippe "https://lists.gnu.org/archive/html/qemu-devel/2017-
> 07/msg01796.html"
> >
> > v2->v3:
> >  - This series is based on "[RFC v3 0/8] VIRTIO-IOMMU device"
> >    Which is based on top of v2.10-rc0 that
> >  - Fixed issue with two PCI devices
> >  - Addressed review comments
> >
> > v1->v2:
> >   - Added trace events
> >   - removed vSMMU3 link in patch description
> >
> > Bharat Bhushan (2):
> >   target/arm/kvm: Translate the MSI doorbell in
> kvm_arch_fixup_msi_route
> >   virtio-iommu: vfio integration with virtio-iommu
> >
> >  hw/virtio/trace-events           |   5 ++
> >  hw/virtio/virtio-iommu.c         | 163
> +++++++++++++++++++++++++++++++++++++++
> >  include/hw/virtio/virtio-iommu.h |   6 ++
> >  target/arm/kvm.c                 |  27 +++++++
> >  target/arm/trace-events          |   3 +
> >  5 files changed, 204 insertions(+)
> >
