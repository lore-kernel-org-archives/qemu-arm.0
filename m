Received: by 10.223.197.9 with SMTP id q9csp1215230wrf;
        Thu, 5 Oct 2017 20:46:38 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAowKyjGwvevLLyaIXPMDrGdYWCOu7SbtNf/VPzKC3qQ/jMbSHZQ7aG2VQ8DPumHg4Ew/eO
X-Received: by 10.55.24.93 with SMTP id j90mr33869268qkh.301.1507261598701;
        Thu, 05 Oct 2017 20:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507261598; cv=none;
        d=google.com; s=arc-20160816;
        b=r6N1TaLCtCKoN83Gsfty3RHb3QxCtlZekNol9iAs4hEAlZ/TlSLdK+R4nMMoSdpBLb
         wflZWp7rtqQh6PVP9wwqpn13HspoipK96aNZYkZ3eNUXBEMxEYvW1lqvrmVU5qMn8aiJ
         Ybwj4F8gae/Zp6cLWTH5IrHtx9qLrXIGf8uWpOF3OwS5kQ0GM6MOw/HlkqqdBoo2fVbU
         DwDg2JbfjuVwV08BW8GEhlPgiV4XI9Z26qp4B7bVcZ1gf9E0Eqwk/AXPGja/nMdHnTlb
         srpNHXv8soh6tl2DA5yxTHDUKyU07FySBiKtF+DAHVBEDLxVpgFxj5bCrIcTCXtVowk9
         jrTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=EKzf2Eu26KyEWtnG1r6be8HE/pVjFvZaPfeu/CRZo+A=;
        b=xKsas2o1/BEBAs1zvv9I+ohIIUYjBDYbVogcTdNgwcaLo1lE0QSgjdaWRTo1NzMLZh
         O0nHMsmJgIHBd4qX44+o+leRPbrOSkEotj2VaMc/ZWEWxjuRoHyHOtNlIScB173XgAYl
         stM8hcIVLS/vlAcdnAZiaILGea1ZPuv9LQ3Txkj7Y7r8nYuJjH7xA/Da+SpNY6EDIRSl
         F7AjRiE+jUJc7rCEpAhl0okHlJJfhjGUTlJLQ3mPAD68Ml2uMYwB55i+C3CSJn7+yeUS
         cwXjvVLbXlqNU1+gXUxjaq9W4WE7zxGF4IhJdXFTWpUcKvttLyYgB1VJQ+PvWczxRDFP
         R0ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=iw6CsPM2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c47si530309qtb.135.2017.10.05.20.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 05 Oct 2017 20:46:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nxp.com header.s=selector1 header.b=iw6CsPM2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from localhost ([::1]:42848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0Jaw-0004Sh-74
	for alex.bennee@linaro.org; Thu, 05 Oct 2017 23:46:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1e0Jag-0004Rc-J4
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 23:46:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bharat.bhushan@nxp.com>) id 1e0Jaf-0007WU-LP
	for qemu-arm@nongnu.org; Thu, 05 Oct 2017 23:46:22 -0400
Received: from mail-ve1eur01on0040.outbound.protection.outlook.com
	([104.47.1.40]:8849
	helo=EUR01-VE1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <bharat.bhushan@nxp.com>)
	id 1e0Jaa-0007Pc-1P; Thu, 05 Oct 2017 23:46:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=EKzf2Eu26KyEWtnG1r6be8HE/pVjFvZaPfeu/CRZo+A=;
	b=iw6CsPM2dHO2fNvd4cM65dXe/0UhNB7D1a/PT7uBM6hT+9c4IFvE83iV5XEF4G7yQAyHW1OxmVBMU5lx4yhy2fbmYEsnXvqkwVenX62uj2glYC/BIyBoO+0PyNdoyUdwpJpn0us1t7LALoedKCr+585lmykpFxO6IhRxHAqfOk4=
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com (10.169.245.8) by
	AM5PR0401MB2547.eurprd04.prod.outlook.com (10.169.245.10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Fri, 6 Oct 2017 03:46:11 +0000
Received: from AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327]) by
	AM5PR0401MB2545.eurprd04.prod.outlook.com
	([fe80::a470:3643:ce8f:6327%18]) with mapi id 15.20.0077.018;
	Fri, 6 Oct 2017 03:46:11 +0000
From: Bharat Bhushan <bharat.bhushan@nxp.com>
To: Auger Eric <eric.auger@redhat.com>, Linu Cherian <linuc.decode@gmail.com>
Thread-Topic: [Qemu-devel] [Qemu-arm] [PATCH v4 0/5] virtio-iommu: VFIO
	integration
Thread-Index: AQHTN1rqdMCSmFjsv0elJFTnh6rDzqLIWUMAgAANSjCAAAdfgIAAB3OAgAAAoICACyjhgIABgMuAgAATFACAAAU8AIAAUL0AgACy/lA=
Date: Fri, 6 Oct 2017 03:46:11 +0000
Message-ID: <AM5PR0401MB254548523AC95D0A2A8A92E69A710@AM5PR0401MB2545.eurprd04.prod.outlook.com>
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
In-Reply-To: <b740e8b7-5859-fd6a-1f1e-480aef6ef4f0@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bharat.bhushan@nxp.com; 
x-originating-ip: [192.88.169.1]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0401MB2547;
	6:6qnvaoXgxMnc8MfHMK7NcdFmCnTL/RqMux/GuCwESsKrYHyqM1Rx96TPiifRVnUsGDutjKbnmNAMeYod1Q4xr6ppIvKR/nZ4F7pI5J3bHm0v38E/JVJlSVzA3SMngeKBU0BBC198w4qcU7fgnxuNsqTJNCFpwVQ0Q9h9M6RSpnkUsd1+tjIrS2iU+/qRnZab21ZBZLkXBVXPoU2sEv+Ewk2+tE57RZFR72IYZ/gqB9t55yyfdExfi+SFStgeYVGBSAcFE4PeAMqm+kq4qQKeQgI+F44wplGaIXLVrjyN3DlyfIMSKR3h/62YQ+L4jfJ/8VVWanJYtjoSBxXe9tezug==;
	5:+ipuyEI0jM32/CLq+/rkWHaem9L/7blby9xgNpD6W1IsI7Y3U8oHrXVxNQW8ukUMiuxPqvMby/5e0CDhrLP5nptprdJaYqr4/TnagQLUpR9eudBLBxwiP8j09nx8CsQ42vSfEDmn8SnXw/sESaf1Rw==;
	24:qPtUyGovXqpwDWJhtRF3kurriKPgLHr4CRvjmPmDyPItSRu8l44xp/8PYRgdJtiYjrtMScf+4CRSfvJiqt7ArbO4iHarDB55e0rWH2mhSPo=;
	7:N+Tz/SUuwaX9YCRzjnshXY7bY2AMcDvSoF90Fw5hR6paMqvymq1twrzA56Ta46IXQtse1MFmU6uyvcnWD5Jb7d6nXXM9amsR2u/SKUyFNonLRgHkJGu7lh/xCwWEEQZf3f5cVxPBw90mo5btnG8Lx8hn6Hxc0OqxaLcYu6MRWeDkGgcbrnUyiizSW87UNulrY1yPLcEitobc1QKBdd4SB6ED8Bsm+Amgcc7C0dH+v+8=
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: cf12a970-7061-4b20-6f57-08d50c6cc97c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(48565401081)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:AM5PR0401MB2547; 
x-ms-traffictypediagnostic: AM5PR0401MB2547:
x-exchange-antispam-report-test: UriScan:;
x-microsoft-antispam-prvs: <AM5PR0401MB2547C6BF867F95FB23B58EA09A710@AM5PR0401MB2547.eurprd04.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(100000703101)(100105400095)(93006095)(93001095)(3002001)(6055026)(6041248)(20161123564025)(20161123558100)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:AM5PR0401MB2547; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:AM5PR0401MB2547; 
x-forefront-prvs: 0452022BE1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(199003)(189002)(68736007)(9686003)(106356001)(53936002)(55016002)(2900100001)(99286003)(105586002)(97736004)(8936002)(229853002)(86362001)(101416001)(14454004)(5250100002)(25786009)(33656002)(6246003)(6436002)(50986999)(54356999)(102836003)(3846002)(39060400002)(6116002)(316002)(2906002)(74316002)(7416002)(81166006)(81156014)(66066001)(305945005)(76176999)(2950100002)(5660300001)(7696004)(93886005)(7736002)(4326008)(110136005)(189998001)(478600001)(6506006)(3660700001)(54906003)(3280700002)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0401MB2547;
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2017 03:46:11.7763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2547
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.1.40
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
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"bharatb.yadav@gmail.com" <bharatb.yadav@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rnbd6dOf6YUB



> >> Thanks
> >>
> >> Eric
> >>>
> >>> However you should be allowed to map 1 sg element of 5 pages and
> >>> then notify the host about this event I think. Still looking at the c=
ode...
> >>>
> >>> I still can't reproduce the issue at the moment. What kind of device
> >>> are you assigning?
> >>>
> >>> Thanks
> >>>
> >>> Eric
> >>>>
> >>>> Atleast vfio_get_vaddr called from vfio_iommu_map_notify in Qemu
> >>>> expects the map size to be a power of 2.
> >
> > Actually I missed the most important here ;-)
> >>>>
> >>>>  if (len & iotlb->addr_mask) {
> > This check looks suspiscious to me. In our case the len is not
> > modified by the previous translation and it fails, I don't see why. It
> > should be valid to be able to notify 5 granules.
>=20
> So after discussion with Alex, looks the way we notify the host currently=
 is
> wrong. we set the addr_mask to the mapping/unmapping size
> -1 whereas this should be a page mask instead (granule size or block size=
?).
> So if the guest maps 5 x 4kB pages we should send 5 notifications for eac=
h
> page and not a single one. It is unclear to me if we can notify with
> hugepage/block page size mask. Peter may confirm/infirm this. in vsmmuv3
> code I notify by granule or block size.
>=20
> Bharat, please can you add this to your TODO list?
>=20
> Linu, thanks a lot for the time you spent debugging this issue.
> Curiously on my side, it is really seldom hit but it is ...

Thanks Linu and Eric, I added this to my todo list.
While I am still not able to reproduce the issue.  I tried with e1000 and n=
ow try with ixgbe device. May I know which device can be used to reproduce =
this issue?

Thanks
-Bharat

>=20
> Thanks!
>=20
> Eric
> >
> > Thanks
> >
> > Eric
> >>>>         error_report("iommu has granularity incompatible with target=
 AS");
> >>>>         return false;
> >>>>     }
> >>>>
> >>>> Just trying to understand how this is not hitting in your case.
> >>>>
> >>>>
> >>>
> >>
> >
