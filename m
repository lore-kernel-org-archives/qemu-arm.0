Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1110486wrt;
        Wed, 23 Jan 2019 12:15:58 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5vmo8F5xOS+Duy2He8hF8wf9la5ZP+0kn62+pemd2rc2GtLfV6dcRHjRIMEJEr/LSAcZEH
X-Received: by 2002:a1c:70b:: with SMTP id 11mr4226267wmh.74.1548274558786;
        Wed, 23 Jan 2019 12:15:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548274558; cv=none;
        d=google.com; s=arc-20160816;
        b=V5LorTiW2X1naetVMWZ7T1uN7N6ciDoxcjfBS1hQprrzlGzJ9SikcQpQoLGCQA3GBd
         cM1K4vVa2TlwGCNy7Df4dEKVYTwPNbuQN1PgyRYDMTFxZbk6QuUbUFTt4UvNTaoWPRkU
         zcLE23ADNFIdtWHDhr9r1iduOhRgqxm7kSaoPHE9/WmtRxizops0PeIwenZEXis4URSs
         D+iuGxs7KsSrCBePtGuucH5v9s0Ix6DDw/cncl0b3D6//2/w8CFoYUc6gLLA5ks03bsG
         J5j8bAs7MZDdYvN7vXoCTNh/8gxF9hGFIlTx9+4LsIcMhvz60J0kZ3Tfz9sPkOqOXnIO
         kExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=j1SOxUiaftdJzOpNAGqwVegqnT6e5pa57PCkvfojmlQ=;
        b=qk59Eqpk4/4oz1qoRgQcTvlZqKJg6IMl04gmXtakVwGuuelaCXmJ+y65rGgzIe26Mi
         Y5INInCdQCcy5R4Kz2gcHI6KND+IChRIQNwk3RiHw2Dmsxd5RNfsKj6aI79P4DrFdWTL
         8kZ08J3/6eYiDDqUFQWZAk3hLFgkceHQCc9sDPg4JpqzQ9QAW3+2IsR5l1DLmAC4a1V8
         hucRBE0Zgv+D4aGBvhwqjEH4YJHEWMNRiLlggaIKKuyLAr/mQ6yKmEwloPHWFvIa7E4m
         QO5u28nVsV+z4rwR68+/YkvuxEmRZCDmvVxqsziUZUCSUJLuFWVaWF0YiD6N3T+7q6Pq
         vo+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=s31dz5OP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a126si25145358wmc.150.2019.01.23.12.15.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 12:15:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=s31dz5OP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:41183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmOwH-0001Zm-Lp
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 15:15:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51056)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmOlm-0000Yo-3k
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 15:05:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmOll-0007h0-3g
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 15:05:06 -0500
Received: from mail-co1nam04on0709.outbound.protection.outlook.com
	([2a01:111:f400:fe4d::709]:24480
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gmOlj-0007eX-8N; Wed, 23 Jan 2019 15:05:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=j1SOxUiaftdJzOpNAGqwVegqnT6e5pa57PCkvfojmlQ=;
	b=s31dz5OPSp2WCNA/+dmpssuVcI8DwATdN4Rpv3FJYm+mqA++JclfbFD/ZeqwMHZ3cRhxV4KHRJRsydHYNItOicBt5MD5lqimH9yjcFk8yMhSm4/iulEaryEsj5QcEoftfM/DqXAvD+JmWlk6C8HWU6vzdrJcrlC37Ijt9gSvG+Q=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5209.prod.exchangelabs.com (20.176.122.90) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1537.29; Wed, 23 Jan 2019 20:04:57 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1558.016;
	Wed, 23 Jan 2019 20:04:57 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v10 00/14] More fully implement ARM PMUv3
Thread-Index: AQHUkWT9yoTnQLK4wEyGDenROpz3o6W1TVEAgAg9uoA=
Date: Wed, 23 Jan 2019 20:04:57 +0000
Message-ID: <20190123200459.GE5213@quinoa.localdomain>
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
	<CAFEAcA8Kvx9ATDgj5mOqcJGQf_T-Sw0ut5N6w3CBs9pBA4d1_A@mail.gmail.com>
In-Reply-To: <CAFEAcA8Kvx9ATDgj5mOqcJGQf_T-Sw0ut5N6w3CBs9pBA4d1_A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR02CA0016.namprd02.prod.outlook.com
	(2603:10b6:903:18::26) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.152]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5209;
	6:mKTQHOrkK/rT1tpvDzssvwgvxhBwljHh116hpa1NzdffM5s1YHyy7gJHmaGZiGRbwaokp5FKcq0+pK8bCTDbTQK/cFjqnmEOvxytlusa09RVP77hNIs5/4fog+3Z5J9dKETfGDP+jRA/6XhKrwSRdDrPDxktBDmR9vEi2l+c9Fz1z4K0n+O2omnlupXjIOwhHO/qZwcIbPavUoNZi775tvHZLnbUNj84Ops1HXKhq28hrFpIu/WPt9nWjuj3edhbMj2WM+e0TPeFuyWNS4SSE/FF4hJvwdtQ7MFv4e4zIMIat5f80ZYh7nlF3hRLgUU8sqb3cENU5mkYvjAiNk9bddzBZiAiysTaiB84EgGCLpWYZf3l7yiimUYNC/vcoWDmmKa5Y9Atw7q0A3wa9DWM4zuUQfUY7HmAf4t8vrspxtzhBrAo68SHSUR8cECkyi9MQym1Uyj9dA5abRdkC2fS0w==;
	5:9hCNdUFN+AuAAlteF5cUAP9F0BA1o13JbulqXzCWVIkKQoeB37KcysZ9dgxX6QRju9gOXYMgyFspAIvItaLjRM18aRPC7k2JqUKr1fekFLGAMMRykrpUGUrh/QhFTenZFtJ+qF0fJw0Vtm9EdzhOqZdCEjrLoGBPYbdW6C9/3atWJTNbbT4+FC5Hydi2lOeWivJzHHjcynyzChE1eBE4Uw==;
	7:GxGWdxTmMegL9DtZSBk4a3N0N/J0glstkpNFZYT6VVFXmixNgkYV5ETaGMF09CH21Vozh96YcvlNdp3KnJYegpu0XhOqJFCFgJLrJqxnP7ug/D3+rxVDPcBnkw3Q8YTWTE2GZjDwB3L0nT2XToI/6Q==
x-ms-office365-filtering-correlation-id: 1173c1d0-defb-496b-3b5e-08d6816e0c4a
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5209; 
x-ms-traffictypediagnostic: DM6PR01MB5209:
x-microsoft-antispam-prvs: <DM6PR01MB5209F2D511B82E8AB45ECFE38A990@DM6PR01MB5209.prod.exchangelabs.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(39840400004)(136003)(396003)(366004)(189003)(199004)(53936002)(476003)(14454004)(186003)(81166006)(102836004)(26005)(966005)(81156014)(7736002)(2906002)(305945005)(68736007)(6512007)(33896004)(386003)(6306002)(6506007)(478600001)(4326008)(39060400002)(6246003)(486006)(9686003)(3846002)(25786009)(71200400001)(71190400001)(8676002)(6116002)(11346002)(256004)(86362001)(446003)(33656002)(316002)(229853002)(6486002)(6916009)(76176011)(6436002)(1076003)(99286004)(52116002)(54906003)(66066001)(97736004)(8936002)(105586002)(106356001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5209;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gnlEivAx3v+/BpW/+V8ji+QloylcDq7BpODOfSzPmdjLm6ezx3zh+qaYeyLoVWQrQok/9WCCGSiy8XoOZZa8DSlOGlGCkRF72TWjO4G4H7qZWe72k9H8H7KYg8M3Jp+DOYsrm1zT3eaDmGJn2YjwGLLcYF3ffaYVS85hzW3iMgA3Wd/fkOuD33yXWuxiURM1/G5q6xTykOr1G5E2rut439cjKgwxbcyjyB5gogJuzfMS4WDiNY0upAwnM+rFcENtlt6J4VU8/METXTNEU81/nSukwgSRQGz79Juo8m1iigunBmWgntx6jDMj/MkyIQUakYktopUXKn4S4aPPG6mtNS72yYZDPXCSJBZF2RUGrc9xKXHNeDmr74I1SpE+AgzpZsg53H0zD8In964SFnuTqD6+x4eLpvme+595J7EJ8rc=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F7333B513CCAB54798913EE8CEC62CDD@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1173c1d0-defb-496b-3b5e-08d6816e0c4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 20:04:56.2854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5209
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe4d::709
Subject: Re: [Qemu-arm] [PATCH v10 00/14] More fully implement ARM PMUv3
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zt/wH0L3wo86

On Jan 18 14:13, Peter Maydell wrote:
> On Tue, 11 Dec 2018 at 15:20, Aaron Lindsay
> <aaron@os.amperecomputing.com> wrote:
> >
> > The ARM PMU implementation currently contains a basic cycle counter, bu=
t
> > it is often useful to gather counts of other events, filter them based
> > on execution mode, and/or be notified on counter overflow. These patche=
s
> > flesh out the implementations of various PMU registers including
> > PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to represent
> > arbitrary counter types, implement mode filtering, send interrupts on
> > counter overflow, and add instruction, cycle, and software increment
> > events.
> >
> > Since v9 [1] I have made the following changes:
> > * Added a clarifying comment about how the PMU timer's migration is
> >   handled
> > * Added a check against implementing PMCEID[23] if ID_DFR0.PerfMon =3D=
=3D
> >   0xf
> > * Added TRACEFILT to the ID_DFR0 field definitions
> >
> > [1] - https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg00805.ht=
ml
> >
>=20
> Richard has made some comments on patch 14; since 1-13 have
> all been reviewed now I'm going to apply those to target-arm.next.

Thanks.

I also apologize - I just uncovered a bug I should've caught sooner, and
sent out a fix to the list as:

	Subject: [PATCH] target/arm: Don't clear supported PMU events when
	initializing PMCEID1

-Aaron
