Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1231639wrt;
        Wed, 17 Oct 2018 13:25:29 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60UO7M70A3EGuf2goBBp1ffi6G8TlFG3jOa//eZ12qJ7Zx9enpkHtaxcJSuwc36N+xVMDMF
X-Received: by 2002:a37:1128:: with SMTP id b40-v6mr4887910qkh.263.1539807929133;
        Wed, 17 Oct 2018 13:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539807929; cv=none;
        d=google.com; s=arc-20160816;
        b=pzF01KgRAs0rz0lMby/quzr5wmHmiIPC7LjVzdHps1Zfu6bzedg9evLqb64oBCZunb
         moS7BXQkEVfvUCxTMZyglTKUrs+TaztK0nNTNBGvnHgFvQVYk9n8PDVWEx2K14StEJEA
         RaL8E/eaw2qQ+7PwIfGM3ES+zHkbEQP0SibnLcxMoRJpMqLgh7LBc6UdtBeIEoakTY4Q
         TVeFHBCVX7hugY7fgj0WkhPaEQ6dIsnKSvebdotq73rdK6l/Q+XCvN1ACSCDrkVrTg1s
         wOUac5fMNODTXWp1i0M2kUAE95XSqOlj1l+fjI/FvDf1MXQEFpah0jUJa8FUqBcpU942
         BuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=3RUTlEDCRZrCD3SkC1tCOJHtpO5OWepRdgIB97QcleM=;
        b=U9ZN7YeysmYsEuzLuuOYedtw8HDgUSGdMEoLBI2Tm5HDCGpm109t2NSl4JAlji4nzh
         5c2vAcyQ94+vu/8WUfmjJLUT50Pjybs2r1YOXhnBxjrQaIxobrpVQnXiUJ5GFxXYIXbp
         F2+FWNGbUkAgm8KHYyDNnF9KdCQKqcNasB+AhE0c0QYpmLKsR63/35TTR8oEMBlK89fK
         b0eIfttKwYyFJoXRFt/HdSmR3AxHeya4rwJV4UKT3WLgio0WJuDPTxbjzu91yU0A0CWm
         uPWgkB/kFd2v+C1QhSBOGsqYRkTsfT4lwSjeD56/GNYp3IIVGKsGR+PW6WSqyrTEfwCo
         yy9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b="LFr/Iyxs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y30-v6si962759qth.357.2018.10.17.13.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 13:25:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b="LFr/Iyxs";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCsNk-0003ap-6t
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 16:25:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aaron@os.amperecomputing.com>) id 1gCsNd-0003aY-3e
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 16:25:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aaron@os.amperecomputing.com>) id 1gCsNX-0004MG-0M
	for qemu-arm@nongnu.org; Wed, 17 Oct 2018 16:25:19 -0400
Received: from mail-eopbgr730120.outbound.protection.outlook.com
	([40.107.73.120]:51280
	helo=NAM05-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Aaron@os.amperecomputing.com>)
	id 1gCsNW-0004Kc-Op; Wed, 17 Oct 2018 16:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=3RUTlEDCRZrCD3SkC1tCOJHtpO5OWepRdgIB97QcleM=;
	b=LFr/IyxsBgVHrpq0pEKpleio1AKMsk84LnZ8txWeIiniIVErA05CEiFdfkhY+9s1W1BiS1oA8zNld3QWrIfFUKWGycy/41e0/5nKfuQ0icE53nO/fOOF6OGUGPeZ9VOIFy9fVP2+0kSIVSvGE3V/fpdsFgOH3v0PvWn+M7GKFQM=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB3993.prod.exchangelabs.com (20.176.73.14) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1250.20; Wed, 17 Oct 2018 20:25:12 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::e89d:b810:e11c:e1e8]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::e89d:b810:e11c:e1e8%4]) with mapi id 15.20.1250.020;
	Wed, 17 Oct 2018 20:25:12 +0000
From: Aaron Lindsay <Aaron@os.amperecomputing.com>
To: Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH v6 12/14] target/arm: PMU: Set PMCR.N to 4
Thread-Index: AQHUZkqtClSdP8CrKE6ECjIGAbu+Z6Uj0EWAgAAEBoCAAA4agA==
Date: Wed, 17 Oct 2018 20:25:12 +0000
Message-ID: <20181017202505.GC25905@quinoa.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-13-aclindsa@gmail.com>
	<0fdcad4a-c8b5-3309-d2ce-f9be901ec52a@linaro.org>
	<20181017192013.GA25905@quinoa.localdomain>
	<31f327f4-42ee-55fc-596d-97d935803867@linaro.org>
In-Reply-To: <31f327f4-42ee-55fc-596d-97d935803867@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR0101CA0011.prod.exchangelabs.com
	(2603:10b6:405:2a::24) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB3993;
	6:uv1CICwL+i8eJSqfaypyYmwi/3i5pl3rYMvDOtyURf4EU2pxO3VVDcUYH/LA2BcpO3MqZ/X/fnXuaConY13YKpgMNE3mEl/5LgdJoVTbtC5AqCvXHbBd2ZM2Rh0zLivHp12e8G+IVV8EArHJz41i4PaFk/KByo9CrMtD1r05ssENSxjmMsvt+PYhinEnK13y1XnZhOoAshOzdpaBarMcSDkG7hZvi3A+yD8NAmuil5sjUzj2Luuw0HuEOew4foOhHOLol7lJAWcVnrxsaxqjqPKzTajC1bg0lr1JSvhfXkBSq6A24eR3fWWVbK0T2z9BObFymXaS6w226MhSmdFenwJLf/DWRt1CObM+Vn132UbpkuDGd7dive9x8VgsRO9Er8XhEXTMhwyAM4ot414tifbUPomGfOPTPWpa/Bzi9VW/5v+tIP9u/B4e2UXRFH80YS6LO5VmP7aPS5P7zMaS4Q==;
	5:r2MgQjjRco9IMDhW86Fs2Ud/y+ll0QZZ31vyDG1NL7Bvx245Kj4iULCmAT0OPpNFmmh5ems9CVnYh8/0nBNMZOm9uu6a0vdMVu506wWPWKWtJykzkrdydlviFJrdSYTWu6aFyBpNei0BH9/vNuFsM+O7J4JmQ+yrA1OTVfrcUrA=;
	7:P5nH87kfbOuXBWeG4gAJP3rXsxgG0gRPVFxew9lVCoE3wcJWionoKNQ8Sl3CR7cQZqh4l8sxZinF2YaOlr6xUs2h6kidyzbPEhj34i0Iw5BkmsXnEp+cStdKK3A4oc592oLOUOem5630cUW2+RpakaQ9cmBxItbn+D24H9b5c9kJpHIPuqO2y84IvCHmcb0xBwk/MlmGw2/xtTOvSkim54//l0W9z4rq87BNnxp7k/EywOPSV87ZmAT6NykBHtTj
x-ms-office365-filtering-correlation-id: 5f5b48f0-f61b-4451-29e5-08d6346ea403
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB3993; 
x-ms-traffictypediagnostic: DM6PR01MB3993:
x-microsoft-antispam-prvs: <DM6PR01MB3993F23513CCE419D1488C5D8AFF0@DM6PR01MB3993.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB3993; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB3993; 
x-forefront-prvs: 08286A0BE2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(376002)(346002)(39840400004)(396003)(366004)(52314003)(199004)(189003)(97736004)(478600001)(9686003)(2906002)(7416002)(11346002)(486006)(80792005)(72206003)(476003)(5660300001)(71190400001)(6486002)(5250100002)(39060400002)(14454004)(2900100001)(68736007)(6436002)(14444005)(256004)(33656002)(1076002)(53936002)(71200400001)(186003)(316002)(26005)(6116002)(229853002)(6512007)(446003)(3846002)(6246003)(86362001)(52116002)(102836004)(386003)(76176011)(81156014)(4326008)(8936002)(93886005)(305945005)(54906003)(105586002)(7736002)(53546011)(106356001)(6506007)(8676002)(66066001)(99286004)(6916009)(33896004)(25786009)(81166006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB3993;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 6mk5mNTeJJxnM4JkekB30nakALaFQT9jIOydc8AaMzQKC9Who8dLasrc/myd/VDD+uaMrIFMFBuzXDet3HO2pPMXnmnHl85CtffWZ8+UZ5GMjfNk5afu31dspg1SSY/dY5G1a7zo+LaIgYEo9yf/vyy7vHCtQzdXEerG2dIHZEwGJGENqh4gZviVSTx7VK0QeXYax7eicYOLi+L9YEa6FqZW2CN2dAdu+gBdt31buDmetVbaskD8vNjubf4mtUJnufXimOEC0nsxnlahFHXOL3alm8xxivFidUEmzUJapZkq+0zs9LkN96wKgXhVTu2EY1y2zXeFZNylEsrn7VNMzjkcT7fIOxesMDTDsp6zukE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BF1C43578DC6DA43A834DF202634E04F@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5b48f0-f61b-4451-29e5-08d6346ea403
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 20:25:12.8856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3993
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.73.120
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 12/14] target/arm: PMU: Set
 PMCR.N to 4
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TiCvIvu5vEg1

On Oct 17 12:34, Richard Henderson wrote:
> On 10/17/18 12:20 PM, Aaron Lindsay wrote:
> > On Oct 16 17:09, Richard Henderson wrote:
> >> On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> >>> This both advertises that we support four counters and enables them
> >>> because the pmu_num_counters() reads this value from PMCR.
> >>>
> >>> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> >>> ---
> >>>  target/arm/helper.c | 8 ++++----
> >>>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> It looks like this should have been folded into patch 10,
> >> or patch 10 split to include the code changes that go with
> >> these comment changes.
> >=20
> > By setting PMCR.N to 4, this commit is what causes all the previous
> > implementation of non-PMCCNTR counters to become usable by the guest -
> > both because the OS can now detect their presence in PMCR, and because
> > the system registers used to setup/access the counters are gated on
> > pmu_num_counters(), which uses PMCR.N to determine if a counter is
> > implemented.
>=20
> But e.g.
>=20
> > @@ -5412,8 +5412,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >      }
> >      if (arm_feature(env, ARM_FEATURE_V7)) {
> >          /* v7 performance monitor control register: same implementor
> > -         * field as main ID register, and we implement only the cycle
> > -         * count register.
> > +         * field as main ID register, and we implement four counters i=
n
> > +         * addition to the cycle count register.
> >           */
> >          unsigned int i, pmcrn =3D 4;
> >          ARMCPRegInfo pmcr =3D {
>=20
> clearly belongs with the previous patch, since pmcrn is already 4.

I suppose pmcrn (the local variable) should've been set to 0 before this
patch and updated here to be 4. However, even though it was already set
to 4 my amendment to the comment was still not true until this patch,
because it wasn't written into PMCR.N (the CP register).

> > @@ -1706,7 +1706,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
> >        .access =3D PL1_W, .type =3D ARM_CP_NOP },
> >      /* Performance monitors are implementation defined in v7,
> >       * but with an ARM recommended set of registers, which we
> > -     * follow (although we don't actually implement any counters)
> > +     * follow.
> >       *
> >       * Performance registers fall into three categories:
> >       *  (a) always UNDEF in PL0, RW in PL1 (PMINTENSET, PMINTENCLR)
>=20
> And this is out of date as well, and probably belonged elsewhere.
> Which leaves only

Why is this out of date? Because PMCR.N still contained zero, no
counters were implemented from the guest's standpoint until this patch.

> > @@ -5430,7 +5430,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
> >              .access =3D PL0_RW, .accessfn =3D pmreg_access,
> >              .type =3D ARM_CP_IO,
> >              .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmcr),
> > -            .resetvalue =3D cpu->midr & 0xff000000,
> > +            .resetvalue =3D (cpu->midr & 0xff000000) | (pmcrn << PMCRN=
_SHIFT),
> >              .writefn =3D pmcr_write, .raw_writefn =3D raw_write,
> >          };
>=20
> which suggests that this one line belonged to the patch that set pmcrn in=
 the
> first place.

I get the feeling we may be talking past each other/misunderstanding
somehow, but I'm not sure why/how. Maybe I'm thinking about whether or
not counters are implemented from the guest's standpoint and you're
thinking about it from the standpoint of whether the code to implement
them exists in QEMU?

Anyway, by splitting these patches apart, my intention was to separate
the plumbing work from turning on the water. If you believe it is better
to do both in the same patch, I'll make that change for v7.

-Aaron
