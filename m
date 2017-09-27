Received: by 10.223.172.38 with SMTP id v35csp4449183wrc;
        Wed, 27 Sep 2017 01:31:56 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA+DlAdfAPPSYU5j8oAYD6bCHx5qp5O3q6vonWs33eFD338nqJunW1lRBlZRXH0qw3Il6wq
X-Received: by 10.55.156.147 with SMTP id f141mr1346146qke.72.1506501116042;
        Wed, 27 Sep 2017 01:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506501116; cv=none;
        d=google.com; s=arc-20160816;
        b=PekBqZpizMZpNAlyK2Q/GiX81hISs7hrWjG4IyekwevWSDluLE/QLmenwWPbS1sscU
         meqTBbliIy5c4c8rcNHNyCbNERnXERDLQXZJFiKEBYLbdtNdzpgEg/2E+Wz0if0F/w8Q
         hvJ/qesjMNNh2me/ivBLf1ucSsj0PtRXQtAtVcs34y6iZo3VXT9HiSzRu6M6K/wNOku3
         kDE5IAW8Gx/iqudRkY67rOxTUW79hHl2SM0QCTBjZG/LFmo3E3gU961aa2DkCtfmXsTm
         DR2WVojvGIoGwWW7RGazMcxrB+NIdpaBkKVEjpaSaY11qt6QwBuRh7hErGSeaYZx0sUT
         A0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=KRP+50oJS/8XKyuXrXl0vCiSHaGm/qtxLfz+G1Tf45w=;
        b=lVR+FvPYWUGR79npChv/qdhRqWnoxIiCRZQ5BqqX3DVFjYKO9JkhW1YYKPYXZYuRXn
         9u9f+KnqMlpmQoSaut+Pi4L9ZfzANiImeNdMfSq+/9MFyPEQMRMk3T7GDGEaE21yh8+R
         mZvx+ihbPkERGuxqZ6hNmckuoiThrz+m1EfcGjRovpbRA+8AxpC+xF6rWOWLOxEheTdk
         xj+CHY1YVU6wqq2bO8lEblVvSPWu1xVlZ1PRy1xHsCNeETtbw40NW0nEUxOagHbmewJ0
         p1Otym2gbJNOw7j2klEpe581dLiuvNv73s9nC8Lf6LHyv923BtYjwFqEMF6wpaKXFTQo
         VYxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=k4jPQtH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y196si8299535qky.425.2017.09.27.01.31.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 01:31:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=k4jPQtH4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:53394 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dx7l3-0003FC-OE
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 04:31:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dx7kB-0002im-AC
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 04:31:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1dx7k7-0003vn-Ac
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 04:30:59 -0400
Received: from mail-db5eur01on0059.outbound.protection.outlook.com
	([104.47.2.59]:44672
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1dx7k6-0003ur-T0; Wed, 27 Sep 2017 04:30:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=KRP+50oJS/8XKyuXrXl0vCiSHaGm/qtxLfz+G1Tf45w=;
	b=k4jPQtH4mg/zm2BKesi2SImwf+hDPxmTSOfK7IFwMHuD1rmjDeD6h2MhaLfFfRm3ZpkKWFjWY0830hh7Kb/9IRZ6EDLoHaud+yaA6yl6zy/4CitSp5uSjDBex71viVHIBQL+6hTjn8MY3g1tktWuhQcA14MRusdAnfDhCW2LjpA=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Wed, 27 Sep 2017 08:30:51 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327%18]) with mapi id 15.20.0077.016;
	Wed, 27 Sep 2017 08:30:51 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Linu Cherian <linuc.decode@gmail.com>
Thread-Topic: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
Thread-Index: AQHTN1rqdMCSmFjsv0elJFTnh6rDzqLIWUMAgAANSjA=
Date: Wed, 27 Sep 2017 08:30:51 +0000
Message-ID: <AM5PR0401MB25450ACC804B20D93C4F2D9D9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
	<20170927074109.GA31587@virtx40>
In-Reply-To: <20170927074109.GA31587@virtx40>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2545;
	6:Z9y531QBLGncwNJttwBKA6nETe1sDmLFdh658fWegiKucxDH78nTJHzHBd3ycPWMlbKwm1JSrBBxCu+/qBXikjKbY0TdsX6JkFdSGQhJ2veyy7vIziVy7w/pXtjmFPHj+jaQkJva+Kpbn932uOcTRUW+QDiPf+V7yC59LBjlTjOF9df1cvNFRyNpkiK4nseyxUvSjtnPG4ug9d0eXNxOVFT+RebYrBPPJ0Ebpfac2CpHozHABlQuE73DELKDgOPvNrIxoAC/SB0b6ESf0TKE4QSu9LjmWzxEgL/AvpprVVDwnqDJ/4NT7ZjvQi1oQhTPykwBItK6CC/TI2JNlCyvIw==;
	5:aBVT9Uwl4O2nqRfAMe7OyOvFJY6m4VIEVwaX0oIdHkBAY4Tl8lY//lxOthx3+xjPpmrzAjrVHTNVyLPDkvotPMxmW6TQH9cnrXKmw8W8LgMIPa0152nyePRjfSOa2PQRS7c570wwZQaVJ2q97yHPjg==;
	24:DIhp3QvSM/KnNBhE9kItgtqoeoEWHU8P2XTYjGnzK3ooCLAOX3dcmkOeu+MbwtppVA3cqMpkeVm/Fq/tUDKr2S9jh4rrQSOTC4CT6hqOG34=;
	7:DrspO077wlYBb8BpxZ2gFSHURciEyHuIi3FBE45X6o13XPiEcGrSHvxrwA8R9jtEDMQj2JRfOahOH6t4lgVEb1WfYwf867W00eEyZ+aGOTKbOOYLBTEz6wbGb6VBrGI1sxMJJDj8YdygWngyisqiy/MYCruyPEncUsUrbKeRJpe3NDU85kdqZ52MD/e0Qyfptl5BnLlRvsjwAV23NjGxYYY7wpspg7fAr9hohTZZNJA=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: f73c05ec-9a75-4446-6f01-08d505820ff1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(48565401081)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:AM5PR0401MB2545; 
x-ms-traffictypediagnostic: AM5PR0401MB2545:
x-exchange-antispam-report-test: UriScan:(180628864354917)(166708455590820)(185117386973197)(228905959029699);
x-microsoft-antispam-prvs: <AM5PR0401MB25459251D45F12BBC66BC73C9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041248)(20161123558100)(20161123555025)(20161123564025)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2545; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2545; 
x-forefront-prvs: 04433051BF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(199003)(377454003)(13464003)(189002)(24454002)(101416001)(105586002)(5660300001)(3660700001)(54356999)(189998001)(3280700002)(76176999)(50986999)(81156014)(229853002)(25786009)(2950100002)(66066001)(7696004)(99286003)(9686003)(305945005)(55016002)(97736004)(316002)(6506006)(6306002)(53936002)(74316002)(6246003)(4326008)(6916009)(6436002)(39060400002)(7736002)(53546010)(3846002)(6116002)(102836003)(2906002)(54906003)(478600001)(2900100001)(86362001)(68736007)(5250100002)(7416002)(81166006)(14454004)(5890100001)(966005)(8676002)(8936002)(33656002)(106356001)(21314002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2545;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2017 08:30:51.3692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2545
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.59
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DEb5BqhlCkxK

Hi,

> -----Original Message-----
> From: Linu Cherian [mailto:linuc.decode@gmail.com]
> Sent: Wednesday, September 27, 2017 1:11 PM
> To: Bharat Bhushan <bharat.bhushan@nxp.com>
> Cc: eric.auger@redhat.com; eric.auger.pro@gmail.com;
> peter.maydell@linaro.org; alex.williamson@redhat.com; mst@redhat.com;
> qemu-arm@nongnu.org; qemu-devel@nongnu.org; kevin.tian@intel.com;
> marc.zyngier@arm.com; tn@semihalf.com; will.deacon@arm.com;
> drjones@redhat.com; robin.murphy@arm.com; christoffer.dall@linaro.org;
> bharatb.yadav@gmail.com
> Subject: Re: [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO integration
>=20
> Hi,
>=20
> On Wed Sep 27, 2017 at 12:03:15PM +0530, Bharat Bhushan wrote:
> > This patch series integrates VFIO/VHOST with virtio-iommu.
> >
> > This version is mainly about rebasing on v4 version on virtio-iommu
> > device framework from Eric Augur and addresing review comments.
> >
> > This patch series allows PCI pass-through using virtio-iommu.
> >
> > This series is based on:
> >  - virtio-iommu kernel driver by Jean-Philippe Brucker
> >     [1] [RFC] virtio-iommu version 0.4
> >     git://linux-arm.org/virtio-iommu.git branch viommu/v0.4
> >
> >  - virtio-iommu device emulation by Eric Augur.
> >    [RFC v4 00/16] VIRTIO-IOMMU device
> >    https://github.com/eauger/qemu/tree/v2.10.0-virtio-iommu-v4
> >
> > Changes are available at : https://github.com/bharaty/qemu.git
> > virtio-iommu-vfio-integration-v4
> >
>=20
> # With the above sources, was trying to test the vfio-pci device assigned=
 to
>   guest using Qemu.
> # Both guest and host kernels are configured with 4k as page size.
> # releavant qemu command snippet,
>   -device virtio-iommu-device -device virtio-blk-device,drive=3Dhd0 \
>   -net none -device vfio-pci,host=3Dxxx
>=20
>=20
> On guest booting, observed mutliple messages as below,
>=20
> qemu-system-aarch64: iommu has granularity incompatible with target AS
>=20
> # On adding necessary prints, 0x5000 is len, 0x4fff is address mask
>   and the code expects the address mask to be 0xfff.

I have not seen these errors, I am also using 4K page-size on both host and=
 guest. Can you share compete qemu command and log.=20

Thanks
-Bharat

>=20
> if (len & iotlb->addr_mask) {
>         error_report
>=20
> # vfio_dma_map is failing due to this error.
>=20
> Any pointers ?
>=20
>=20
> > v3->v4:
> >  - Rebase to v4 version from Eric
> >  - Fixes from Eric with DPDK in VM
> >  - Logical division in multiple patches
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
> > Bharat Bhushan (5):
> >   target/arm/kvm: Translate the MSI doorbell in
> kvm_arch_fixup_msi_route
> >   virtio-iommu: Add iommu notifier for map/unmap
> >   virtio-iommu: Call iommu notifier for attach/detach
> >   virtio-iommu: add iommu replay
> >   virtio-iommu: add iommu notifier memory-region
> >
> >  hw/virtio/trace-events           |   5 ++
> >  hw/virtio/virtio-iommu.c         | 181
> ++++++++++++++++++++++++++++++++++++++-
> >  include/hw/virtio/virtio-iommu.h |   6 ++
> >  target/arm/kvm.c                 |  27 ++++++
> >  target/arm/trace-events          |   3 +
> >  5 files changed, 219 insertions(+), 3 deletions(-)
> >
> > --
> > 1.9.3
> >
> >
>=20
> --
> Linu cherian
