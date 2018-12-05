Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9369724wrt;
        Wed, 5 Dec 2018 05:20:51 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WQmAAmrPqhEZuO8ieix/yBn70K2cx5i7Ea/GuGQSdwXRowziJCbaINuCTya+U02lK1teXB
X-Received: by 2002:a0c:afd1:: with SMTP id t17mr23531441qvc.93.1544016051643;
        Wed, 05 Dec 2018 05:20:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544016051; cv=none;
        d=google.com; s=arc-20160816;
        b=hSOF9+4vea4SKuTboGf3naOUq243C9r5SntUd1s1YUIA38wIToxTy0dkBdXW8KRCHz
         ml8lrS1Nip2HiwcdrZAwbtOJZStxhOfuE5C9fXF5sdC9U3ntP2jlF0ziRmiIAkWVNjh9
         a+sezLI1s6Y5++o7wuNs1RozATQ1rHeCKr4hjQ6XBUDk1iQfykNgY4V2fHM9atwP+Voc
         tKpo4akbHQW+jKwrE9OO3lruMUakLlw3ibPAkqJFeBqXw/+Q7GFV3YcpcjaT7mwK7uQz
         rUmJEtwSLSlclVVYWScdrAVZ8TVVXk3ub9nIP4mW4GB74fx/mssUQ858DNtuO9pG8Zgj
         vyCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=tUyL5wiTIFgeaYsJTlc7JTJ1utt5OWs071PHz54ZHN4=;
        b=B6W6Wv4fX8JGbB0iyk91ix+ytf25kUkzEE7tyaEiojcQniVS9zA6NMT8O+T+PWuJ0V
         J+G8RoAmRv+DKPoi4ogkDjaRdAkU2afUWuJrSViIx4zai446++OLOeno+To/kjKRL5JP
         ZPR/yjP92K6wp1kY/lW28sxSlAu7j3UXlXQsNJwa4Et+rMnr6F5uirZjfdUGNi4QBQ6p
         2RrQ7vFItySSiu0F424KwCiOnAYIct3dPJXytCCw5W3jsMBysOaUkaJFNIr65fPlK1oC
         yhPijCFxcysE1pAyrlzrRy3ycVom/UkFh4QzaUdDebUVj3PHwI6pT3+EJbPTsPsNDJ88
         pwSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=PhMc574V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i36si5064505qvi.129.2018.12.05.05.20.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:20:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=PhMc574V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34220 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUX6g-0005T1-Gz
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:20:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUWnY-0003jM-AI
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:01:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUWnS-0007h4-6K
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:01:04 -0500
Received: from mail-cys01nam02on072b.outbound.protection.outlook.com
	([2a01:111:f400:fe45::72b]:14086
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUWnR-0007dW-RZ; Wed, 05 Dec 2018 08:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=tUyL5wiTIFgeaYsJTlc7JTJ1utt5OWs071PHz54ZHN4=;
	b=PhMc574VbSGN+nz5nC3qu39V+bKm+hYSRx3zrFuPLZ2be088rLp7RXgBQHzGqBeCZrxI210pLte2YfEBPRiPku358W+4ZM52YT64Tmefr+7MbYCnPVYJEvnTfHw+WpjWvqM6aqfnfYdQjcJM9whLtKp0taEg/s0yoT4cORb3a3U=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4953.prod.exchangelabs.com (20.176.120.13) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 5 Dec 2018 13:00:53 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:00:52 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 07/13] target-arm: Make PMCEID[01]_EL0 64 bit
	registers, add PMCEID[23]
Thread-Index: AQHUgRe6PKv4vgGF2kKNh/7lbe8jmaVojB2AgAUDxwCAABqHAIAACmiAgAJ+EYA=
Date: Wed, 5 Dec 2018 13:00:52 +0000
Message-ID: <20181205130047.GC5549@quinoa.localdomain>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-8-aaron@os.amperecomputing.com>
	<CAFEAcA92+6NdqpB+L42cu1Ba7qvvHoLkjSDgcEDLvR=iqpd4gg@mail.gmail.com>
	<20181203204452.GB5549@quinoa.localdomain>
	<CAFEAcA900U3amGOGRKGNu+-j9EDhdrZ1U1U5MtoW5BeTo74iOQ@mail.gmail.com>
	<05205391-27bf-c6be-bc71-648eee127c47@linaro.org>
In-Reply-To: <05205391-27bf-c6be-bc71-648eee127c47@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR14CA0039.namprd14.prod.outlook.com
	(2603:10b6:404:13f::25) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4953;
	6:oEvtm6LeffpSYtOnoK6LWsMWfmVDpgQCfochlgvSYV5a80MzIFNSh2l5DKj6GMQGzYJwUB1IEm+cjgWmH1FyiISV5zlZd/G0HfnJgHUa8fX+vfjKuqM798ZqaPVPiOp5DLwQQG73UxURFyEmGt6FSZIFGA7InN2uwzO1vbi2uhn1Xj5fjW48mS65kwxbX3oeT+ENgB47f1Ur1LA5ceoEKXr4JvRalamQdvpvM/X80lBw+AAgpAAl3zI2d5fen/k9DsEeIXR31jW6r/JuSclcEh2qT3oJJOpbFkhwLRo8fCnk314ab97v66Q100EzxuXiyDhemAsL1EcmaRsX3RfwkAxdlG1ov9xX3/h16LWRd0mPAwSaf28ufBGVXgthgQjAKE8nkrSFdpdfOQOHrJu00816UDs+/QWlavleT7uYkz1AEOrd6LxBnvWGOW/8YhJ8SR9NN5u96pSQihApWE3WYQ==;
	5:/eCnqQ67rshdqhrkiu1Ml7Ejis7HxzFfwbTwmShfg/4SfCTZ66UUmmpeXX9egVteI3wE0u3YOxCdh4LDyMWbX2+K8cNGxrGkm6TGpnrg1sdneq5mQ7piX50tK7y9OrJE/K6OQt59K0VvXKCVazRdm/qSR8ayVgiaZ9LMSokar7Y=;
	7:bD+4j5qV3wPTJMBcQ8psKPdCWukuvYzWT71tueU+uomOz6wTYZm13Vut/PLVp5bJFlNZx/spT8JrbwJAD5aIub7931yBTKJyP6slmIHNHuZjXGY0lXe3Xiv4+HiYXaY8RYC3aQQ5YddOUcYxrC+3LA==
x-ms-office365-filtering-correlation-id: 0f4a2ddf-6d13-45c2-7612-08d65ab1afad
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4953; 
x-ms-traffictypediagnostic: DM6PR01MB4953:
x-microsoft-antispam-prvs: <DM6PR01MB4953B9420F39F9C96B11925F8AA80@DM6PR01MB4953.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231455)(999002)(944501520)(52105112)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4953; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4953; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(376002)(346002)(136003)(396003)(39840400004)(189003)(199004)(51444003)(14454004)(6916009)(106356001)(6116002)(3846002)(52116002)(99286004)(66066001)(5660300001)(105586002)(33656002)(2906002)(54906003)(316002)(6486002)(6436002)(7736002)(305945005)(1076002)(229853002)(97736004)(93886005)(68736007)(486006)(476003)(102836004)(6506007)(4326008)(6246003)(39060400002)(53546011)(386003)(8936002)(478600001)(8676002)(81166006)(81156014)(186003)(86362001)(446003)(26005)(11346002)(25786009)(6512007)(9686003)(33896004)(71190400001)(76176011)(71200400001)(53936002)(256004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4953;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: dEE1Ix7F5LV83o5pr/GY1peVBlDCEXZI55Cd8/RaTeSPZg//KsmMtEVpS6ci2nXlhbNObNpxOMWGSD4lMWR3s1dzsVAa0TN+8txde+jVKo4ifOpMA14Fk5eSG7wVyHFcSl9Dw4moJoovTH273SKV/jqSA+a1j/wZ5CLK5jQj0O2KDCxlvPnAvLcqhjinCi5ESU5kr0WD39r3NCFDbEuCAtjZgkDLVRZcw4sJ4Q3015nJK7sohKRth8+7frPFPAyKRbNgI5yRMWZ15fgdNJCDQkAPMhPHCw7mqBs13XVKsFVcGFZ6sawTPkLrLVXwl3xfAryXE5BC+D1oFdcXEaSXBFCjsF4OX0k/r6UMrTMLaLs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6952A6B6FE1A5B4BB7CF61744BF78C88@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4a2ddf-6d13-45c2-7612-08d65ab1afad
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:00:52.7439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4953
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe45::72b
Subject: Re: [Qemu-arm] [PATCH v8 07/13] target-arm: Make PMCEID[01]_EL0 64
 bit registers, add PMCEID[23]
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
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dJPpDPk6VNOO

On Dec 03 16:57, Richard Henderson wrote:
> On 12/3/18 4:19 PM, Peter Maydell wrote:
> > On Mon, 3 Dec 2018 at 20:45, Aaron Lindsay <aaron@os.amperecomputing.co=
m> wrote:
> >>
> >> On Nov 30 16:10, Peter Maydell wrote:
> >>> PMCEID2 and PMCEID3 are only defined from ARMv8.1; before that they
> >>> are UNDEFINED. So these registers need to be only defined if a
> >>> suitable feature bit or ID register field check passes.
> >>
> >> It looks like we don't currently support any ARMv8.1+ CPUs and don't
> >> have an entry in the `arm_features` enum for it. I'll plan to add
> >> ARM_FEATURE_V81 and make defining these registers depend on it, assumi=
ng
> >> any future CPUs supporting it will use that, unless you feel I should =
do
> >> something different.
> >=20
> > I think that the idea going forward is to prefer an ID
> > register check of some kind -- Richard ?
>=20
> Yes.  It would appear that this feature should be controlled by
> ID_DFR0.PerfMon.  So,
>=20
>   if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >=3D 4)
>=20
> once the appropriate FIELDs are added to cpu.h.
>=20
> Since this test is not used within translate*.c, there is no need to move
> id_dfr* into ARMISARegisters.  Since these are only aliases, they do not =
affect
> migration, and so do not (yet) need to be filled in by kvm.

Sounds reasonable to me. One clarification - do we also need to guard
against the 0b1111 value for ID_DFR0.PerfMon, which implies an
implementation-defined, non-PMUv3 PMU, or is it safe to assume no one
will attempt that flavor in QEMU?

-Aaron
