Received: by 10.223.197.9 with SMTP id q9csp3241218wrf;
        Mon, 9 Oct 2017 23:42:43 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QClyilVrgJrguJJW8WwbZvLfiL6r+QxcgBGXDRbC6Qt+uzqEGnhlYGWQnCGDQ4GFPOF4Q4t
X-Received: by 10.55.94.65 with SMTP id s62mr5378160qkb.282.1507617763200;
        Mon, 09 Oct 2017 23:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507617763; cv=none;
        d=google.com; s=arc-20160816;
        b=X+xiy9S/Tf1wKWXTAOfalITE1o3ieEdP2gNdydNptVxC42Sud/r8MMhfXuUbTnuYJ4
         CeLrkAYINaCdDoG8RmXD9GfGE8VSn3X/gpIKU8Q6QZ39tauZWhLmf2M8T4eUWaz+QEF5
         5RpvArw+G1TQoKXk9YP1H7zXiNwHA5NW2GXmteSKNTn5qR5Jn+2+5yoxD1LLs4j35Kb3
         DsUgbcp1sOlkbYBArU4pGKt22g46L+p/jaVIoqmzvh7vo4E5j8iaQtzPNb+wyzVcjJl6
         q8ph72gO10z2v39/Xw2zExUvLWmix7igPZ94ctHio8wmvi3cAMA+7jDZy9pAAY/L7JGM
         2Uzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=iTKfUOd8gnGIk7DWyNiBOfs1m1SaxqOoPwDQO2YvDuA=;
        b=zerYCSRSCZHvccdRO5GZiES0F/6rlElZR3a0nJzRiPdU7XxK7K+jhcOwZx4vG8cjHE
         F+Y5FoUiN7x/z+0EWvEOMqVjvsC9hLnWfdVEufOO4EFrkZcOQeB4KvRUcY83c/eI5Y/E
         dhNYYYnnPEPOcVBLJHZDwYL3ivNdRRrJv9sNsLEtnb484/coFJ4xO1gE4DWjMWWV29Am
         jkhNoySoJMU9atCOYstUDG3ZVqCREc0ptYn5Tak4lnQpLXvAr5yGonvBKzS27oVLkRHm
         r00pUrA4xg2LKB/WwTNM1Hf+waOQwaIDEC0aKh1qHLd/nZY8tfg7nJYOeCWMDXvn45Pw
         zTBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=aE/g2iqv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h9si315724qkh.328.2017.10.09.23.42.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 23:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=aE/g2iqv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:33107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1oFU-0000FW-Rw
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 02:42:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59049)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1e1oFB-0000Bp-Hp
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 02:42:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1e1oF8-00036O-Cb
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 02:42:21 -0400
Received: from mail-db5eur01on0047.outbound.protection.outlook.com
	([104.47.2.47]:64512
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1e1oEy-0002y7-Mr; Tue, 10 Oct 2017 02:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=iTKfUOd8gnGIk7DWyNiBOfs1m1SaxqOoPwDQO2YvDuA=;
	b=aE/g2iqvS1MFLfN65odXKTlxpFY19IguB9BnAQQgYjcdmRy676pe+lIrmsRkMyHXUbixYOdx62WhR/IhOJADgXB8WWhM48Cw4QwvGDF8Ol4wiAKUod/cNljfgnVkAueQMkapLHGasOjdFNX3IOjkQCDQYGDpBhPASKJUll9Do9o=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Tue, 10 Oct 2017 06:42:05 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327%18]) with mapi id 15.20.0077.020;
	Tue, 10 Oct 2017 06:42:04 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Bharat Bhushan <bharat.bhushan@nxp.com>, Auger Eric
	<eric.auger@redhat.com>, Linu Cherian <linuc.decode@gmail.com>
Thread-Topic: [Qemu-devel] [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO
	integration
Thread-Index: AQHTN1rqdMCSmFjsv0elJFTnh6rDzqLIWUMAgAANSjCAAAdfgIAAB3OAgAAAoICACyjhgIABgMuAgAATFACAAAU8AIAAUL0AgACy/lCABnHvAA==
Date: Tue, 10 Oct 2017 06:42:04 +0000
Message-ID: <AM5PR0401MB254512CE483DD6E684037A629A750@AM5PR0401MB2545.eurprd04.prod.outlook.com>
References: <1506494000-31982-1-git-send-email-Bharat.Bhushan@nxp.com>
	<20170927074109.GA31587@virtx40>
	<AM5PR0401MB25450ACC804B20D93C4F2D9D9A780@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<9700cf30-65ed-9c55-c1b9-14bb8deb669f@redhat.com>
	<20170927092147.GA32183@virtx40>
	<0af599c0-f859-f90c-c999-bc4a0a678768@redhat.com>
	<20171004114910.GA6932@virtx40>
	<79234c56-c524-5359-de8a-f266b19821eb@redhat.com>
	<9d173ea5-75a6-c684-7f8d-e2ec1d3eddff@redhat.com>
	<1017080b-aa5f-4a1f-9905-e65f22717cd1@redhat.com>
	<b740e8b7-5859-fd6a-1f1e-480aef6ef4f0@redhat.com>
	<AM5PR0401MB254548523AC95D0A2A8A92E69A710@AM5PR0401MB2545.eurprd04.prod.outlook.com>
In-Reply-To: <AM5PR0401MB254548523AC95D0A2A8A92E69A710@AM5PR0401MB2545.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2545;
	6:j1oigZArhSFmFbQL02mVPt6q1DHLKeT3Por+hUkQC8Q0soVH2lFHB/x0WHinOMgEHsHnqZ/caFYb6r4Bs9TRCAgxP7A7RDRBrNl0XCTnCv40vkyKNM4TydhiSoQd/ejq2cMRzsrhy3O/pRk1IMxki9ZcEG+K+HXox/qBcLhtrZdiiV8w2c5jHLUwqsHXF05ZI0pfbat3Mzzlvx7ba/m3cd6m97/G4b0+mO3hb7D+MYJsm25cy+esW7qyIFNLXQud+ADA1cDFA31uN3PHVUnfJ8Bb70etK/gCXONPF9tGPEEuDQDC3grhIHCNTh+MJU68I7JJ2JFBarTxC/tJ5lM91w==;
	5:R6tSSFDAMRgpHqS4KwT++aOYCtyShSUqOKRJCIVVlkEsSZiBvvYmQGsOYNQ2o05aRDzCz0RDTGQiuaZpWss4TJvSUgUjfOGGHu8dRe7qmlvnQwjqwFR7ditwBcN3Cxiz6cTlIeDKVvu+JZ5nEzzHZw==;
	24:HWKhiuXXAVocn7SyCShLXTULV/hAPFuvAGvLv9JxH0CE8QlKbgW3Z0E/iZwQBBtWWoC+1Vmn9cLPvsho3pzfTW6/bjnP+02B6Hok/7TIlj4=;
	7:CGkESGqUagZISpb62PKNQ/4FD1S0zlw82XWmGjFzV97h9JitOsLBkZE2jhytghJbJYDww/SirJCW1wVf3HZpHAUtzYGkBlshfsDTEPe+KciBSd91cak9QrUy5ZWpOQpj98msqI0pFU76W6DWW87Dw8XB/iQDf8SEb3G1K9eri5p/SATiJQbaU+X5hmCMHoblR7pJOpPb8vS21Rjl50sOn5gQ5ORPeq6EfkV+2iAoagM=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(39860400002)(376002)(199003)(189002)(377454003)(13464003)(3280700002)(8676002)(39060400002)(8936002)(4326008)(66066001)(14454004)(6116002)(7736002)(305945005)(102836003)(5250100002)(2906002)(74316002)(7416002)(316002)(97736004)(3846002)(93886005)(110136005)(189998001)(6506006)(105586002)(2950100002)(106356001)(54906003)(5660300001)(81166006)(81156014)(33656002)(76176999)(54356999)(3660700001)(6436002)(50986999)(229853002)(86362001)(55016002)(53936002)(99286003)(478600001)(7696004)(6246003)(101416001)(25786009)(9686003)(2900100001)(68736007)(53546010);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2545;
	H:AM5PR0401MB2545.eurprd04.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-ms-office365-filtering-correlation-id: ad173c4e-c63d-45eb-7dd1-08d50faa04f2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(48565401081)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:AM5PR0401MB2545; 
x-ms-traffictypediagnostic: AM5PR0401MB2545:
x-exchange-antispam-report-test: UriScan:(180628864354917)(228905959029699);
x-microsoft-antispam-prvs: <AM5PR0401MB2545603E8C6F2D216F6F9A919A750@AM5PR0401MB2545.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(100000703101)(100105400095)(10201501046)(6055026)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2545; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2545; 
x-forefront-prvs: 04569283F9
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2017 06:42:04.3713 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2545
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.47
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 0/5] virtio-iommu: VFIO
 integration
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
	"mst@redhat.com" <mst@redhat.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"linu.cherian@cavium.com" <linu.cherian@cavium.com>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u6pE0imMS77c

Hi Alex, Eric,

> -----Original Message-----
> From: Qemu-devel [mailto:qemu-devel-
> bounces+bharat.bhushan=3Dnxp.com@nongnu.org] On Behalf Of Bharat
> Bhushan
> Sent: Friday, October 06, 2017 9:16 AM
> To: Auger Eric <eric.auger@redhat.com>; Linu Cherian
> <linuc.decode@gmail.com>
> Cc: peter.maydell@linaro.org; kevin.tian@intel.com; mst@redhat.com;
> marc.zyngier@arm.com; tn@semihalf.com; will.deacon@arm.com;
> drjones@redhat.com; qemu-devel@nongnu.org;
> alex.williamson@redhat.com; qemu-arm@nongnu.org;
> linu.cherian@cavium.com; eric.auger.pro@gmail.com;
> robin.murphy@arm.com; christoffer.dall@linaro.org;
> bharatb.yadav@gmail.com
> Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO
> integration
>=20
>=20
>=20
> > >> Thanks
> > >>
> > >> Eric
> > >>>
> > >>> However you should be allowed to map 1 sg element of 5 pages and
> > >>> then notify the host about this event I think. Still looking at the=
 code...
> > >>>
> > >>> I still can't reproduce the issue at the moment. What kind of
> > >>> device are you assigning?
> > >>>
> > >>> Thanks
> > >>>
> > >>> Eric
> > >>>>
> > >>>> Atleast vfio_get_vaddr called from vfio_iommu_map_notify in Qemu
> > >>>> expects the map size to be a power of 2.
> > >
> > > Actually I missed the most important here ;-)
> > >>>>
> > >>>>  if (len & iotlb->addr_mask) {
> > > This check looks suspiscious to me. In our case the len is not
> > > modified by the previous translation and it fails, I don't see why.
> > > It should be valid to be able to notify 5 granules.
> >
> > So after discussion with Alex, looks the way we notify the host
> > currently is wrong. we set the addr_mask to the mapping/unmapping size
> > -1 whereas this should be a page mask instead (granule size or block si=
ze?).
> > So if the guest maps 5 x 4kB pages we should send 5 notifications for
> > each page and not a single one. It is unclear to me if we can notify
> > with hugepage/block page size mask. Peter may confirm/infirm this. in
> > vsmmuv3 code I notify by granule or block size.

My understanding is that host provides supported page sizes (page_size_mask=
), and Size of each notification to host should be exactly best fit of supp=
orted page-size and/or multiples of supported page-sizes.
So if guest maps 20K size (single request), and supported page size is 4K, =
so we can still send one 20K size request.
Not sure I get it, why multiples of supported page-size cannot be provided =
in one notification to host.

Thanks
-Bharat

> >
> > Bharat, please can you add this to your TODO list?
> >
> > Linu, thanks a lot for the time you spent debugging this issue.
> > Curiously on my side, it is really seldom hit but it is ...
>=20
> Thanks Linu and Eric, I added this to my todo list.
> While I am still not able to reproduce the issue.  I tried with e1000 and=
 now
> try with ixgbe device. May I know which device can be used to reproduce t=
his
> issue?
>=20
> Thanks
> -Bharat
>=20
> >
> > Thanks!
> >
> > Eric
> > >
> > > Thanks
> > >
> > > Eric
> > >>>>         error_report("iommu has granularity incompatible with targ=
et
> AS");
> > >>>>         return false;
> > >>>>     }
> > >>>>
> > >>>> Just trying to understand how this is not hitting in your case.
> > >>>>
> > >>>>
> > >>>
> > >>
> > >

