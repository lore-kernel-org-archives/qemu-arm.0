Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3520506wrt;
        Fri, 18 Jan 2019 14:10:11 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4zi303wsQOUvS/dDyOLrKlq99wok/1sZc61hh5YQCKR5vVZOO1E4cM3JMUj/9YwrjU9Ql+
X-Received: by 2002:adf:fd87:: with SMTP id d7mr17657232wrr.74.1547849411631;
        Fri, 18 Jan 2019 14:10:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547849411; cv=none;
        d=google.com; s=arc-20160816;
        b=i4Do6zykaKxKk+0GWYOvD1m0Q1Y5gY8iNFy5QG2X3QO3acpNSFQescaxYLO0fze2Uu
         MO7UtfuIyQMKG7BlhZNeLEknV4kXGlsOImfoc9qRNVNJoWHJDlzeqbTODqbBCFi+UjNa
         FzR5nmGdAdScynSGbERtIAFQPE/T2zcwNQoQIOkKiELxRZTGj2ktRoZgI8EuXYuQtgDr
         07GLjJkhK560FxwRG9pEiVcaPz5XWKF3oswmKJnwK3rU69uOqk9ydAXN0ilWaHrZ3S8l
         UnaKa96ARktJue5khf5OpcwwDHdYy6/7kAvGH9QHs/c27AKCKHNF671e6zJKyt5D6oPz
         ne6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=1PAG+JIcc47fqrZD744KRkdnAA0e8DQ3bKw/dn8sVCg=;
        b=mIN40OsNuT71CzDAc0UiU+zz74mRvfvEqSH6Y0zUbmM9UwCO8o9pt17+Havz+VXtWi
         BWHU7l2VsPvrR6qCDZaWpAAz9dgDGlLPe7Lohqhn1fbssih+FdcUEWeWNIXx8SNCz8zQ
         lZLAGhOF0z7XoPhU9v1rvdLQdcvqZ8Qkz3uu2pRCHXJUsQ1DCJqjmFumXSfv231bOZ3S
         vfeUfO+QYQ4FDkuN6SSLQpdbWmfZGwuA9L8fNFTdIfFHTq2XwEIlgPANZ2ULplwHlYfT
         Q/uhebI1cAcHMw4eCRs7lpP04XvTi8VbwGBRmOXFk5YlgQfe8gr05nO0uasxdpqiVTl8
         XZHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=n2P1fQ6X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v132si27818231wmg.63.2019.01.18.14.10.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Jan 2019 14:10:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=n2P1fQ6X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:47933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkcL4-0002av-GT
	for alex.bennee@linaro.org; Fri, 18 Jan 2019 17:10:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gkbsx-0004CX-Hl
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 16:41:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gkbsv-0008C3-Hu
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 16:41:07 -0500
Received: from mail-eopbgr720111.outbound.protection.outlook.com
	([40.107.72.111]:2016
	helo=NAM05-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gkbst-00084q-Jm; Fri, 18 Jan 2019 16:41:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1PAG+JIcc47fqrZD744KRkdnAA0e8DQ3bKw/dn8sVCg=;
	b=n2P1fQ6XuQDFd2Yqi7nhlBGEdZ2vCxWnILuw5cJ19Xe2zDNbeHhhmpWFw5S+A/VIGRuNhT814vdNOo5c1HVyXx/K1mhvQ/Nmrh+WmZo4puhIsdn/Y42F4pMf2AdgD+yF6tvBK1GbuPTjz4E7Z3LKnQojJtYg/sIYIcBP9zqMEuY=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB3897.prod.exchangelabs.com (20.176.65.158) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1537.24; Fri, 18 Jan 2019 21:40:55 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1537.018;
	Fri, 18 Jan 2019 21:40:55 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 14/14] target/arm: Send interrupts on PMU counter
	overflow
Thread-Index: AQHUkWUdr/WJq8auikKadmPIluyvUaW0IvqAgAGnMwA=
Date: Fri, 18 Jan 2019 21:40:55 +0000
Message-ID: <20190118214052.GD5213@quinoa.localdomain>
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
	<20181211151945.29137-15-aaron@os.amperecomputing.com>
	<8683c2c4-0111-492c-c6f9-1b2dcc937405@linaro.org>
In-Reply-To: <8683c2c4-0111-492c-c6f9-1b2dcc937405@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR14CA0043.namprd14.prod.outlook.com
	(2603:10b6:903:101::29) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB3897;
	6:X0D0EjPNQo1oM68S0/Gi8SkApZrJCUod0cgjReQAA2HG8xnOJ9WPIsVjibKci+4BBqraRetR6lgUqYsElKI7Yyb5A7sCbJ2nEVm6kkdsyLaMydcZuj+GYMFNYmeBgwr7w3n1nQjuE3xcilQ742eZsY9EEhZpw92talCEEj4IhEWVj7gAJVHA4FLRlCo0j8WvLEz2revIv6z3vCkeUpykBDUXK3mXBVOnGeRyg3Zud2WaZdZeQkq7qCaUR6laEm0mHpyZvYBuvKqM7QLEPp0olmU4D8Eo7CuSx3glK2GjFrI6t8S0j9IEzb/qwsGnAkilQR6yV1Hby1aVOpBgoC7YBafRUJKiFOuMgwy+xpPtVwr/Z2JGw1ZqRkuaZKN4NO/WeWq8kufsiOw/lUNdaqD2hK0AG15XCGujZ+774LFwW4t/MiwMGLNOZVt+b0T8rWriUiKKukpRu4si/DKS/4e8+w==;
	5:IRNKyqknt1/NxRkLZjEeSDi0iJL2cmBXNuJXuKZwOABWt4nvOMU8p2HSLlMbbPhrzGBzesA2J4ckSI3i71RN0+S9mATNo09e3Fp3QvssEZnqUtVRhzE5Slmvyh53Nxuz0puMlXflgJKd23L22Ygz1WNQvukP/am7cNcaVIkvtabixy7tl3yDL2FlcRULgcdrB4bGZWQOS6k4ExyhZYGCrg==;
	7:ZbAUGiaP0VGAiVZKbY7hU68QiyLLB9GuKijaHjLAIh/x3PFxnyE4KT01THbJlPtpqNlA8PE4489gK+QAwB9+a7OXlmHTDreCGmSjmawx6sfoSg1lPT5wapSMXyly9iLv8oEaJkAkkh8Sjl0h3+tLeA==
x-ms-office365-filtering-correlation-id: caad3722-64a4-4fa5-b2fa-08d67d8d9ffc
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB3897; 
x-ms-traffictypediagnostic: DM6PR01MB3897:
x-microsoft-antispam-prvs: <DM6PR01MB38976813776E444DDC58FFD58A9C0@DM6PR01MB3897.prod.exchangelabs.com>
x-forefront-prvs: 0921D55E4F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(8936002)(6512007)(9686003)(1076003)(229853002)(86362001)(316002)(52116002)(256004)(14444005)(33656002)(106356001)(71190400001)(6436002)(305945005)(71200400001)(476003)(54906003)(446003)(486006)(81166006)(81156014)(2906002)(68736007)(11346002)(7736002)(8676002)(6486002)(14454004)(102836004)(39060400002)(6506007)(386003)(7416002)(53546011)(26005)(4326008)(6116002)(66066001)(25786009)(3846002)(97736004)(99286004)(186003)(105586002)(6246003)(33896004)(5660300001)(76176011)(6916009)(478600001)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB3897;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XtT+I7zkSfNP5SFXEW80NtEVTBSbgnXVQoZHmrhizsETG+qhg1AqbNKrzn+AznKw9i+fvVwUdCxlVrWokyX28b/rBj+pEihgsu9rA25fRiuMVIGShlHpXxCJo23apdwX9Cm6ttMbciZhmsaivG9gUAyoJHzQV81Nxqa9KsF+DLAebo1t4M834AB2OnQC3DsoDfKWBUWfLxjepJVpYhK+h/s2+0wEL1gYtCGa7t66axsDEzybbAufQw7EhegZxTBI3WuH75Sl1ZMNnnOrjf/Fw4GT3WT1+rSolbguORdcPjhRR9QzdJCG6NGiNuX1CbznGYt7ZeOUvsdjStOClJNKxqguMU1EBoYvdf05OLJAb3dENcj3mzGl4cCG6MWo307NCqdzyO2OcFO9s/ZJOK7GCi++kAGmtYLCOcXlGCchfFY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F1E4B8034F9D854A9B3068C3585D01F8@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caad3722-64a4-4fa5-b2fa-08d67d8d9ffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2019 21:40:53.8127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3897
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.72.111
Subject: Re: [Qemu-arm] [PATCH v10 14/14] target/arm: Send interrupts on PMU
 counter overflow
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
	Aaron Lindsay <alindsay@codeaurora.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ARCRGiNX/iBO

On Jan 18 07:26, Richard Henderson wrote:
> On 12/12/18 2:20 AM, Aaron Lindsay wrote:
> > Setup a QEMUTimer to get a callback when we expect counters to next
> > overflow and trigger an interrupt at that time.
> >=20
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> > ---
> >  target/arm/cpu.c    |  12 +++++
> >  target/arm/cpu.h    |   8 +++
> >  target/arm/helper.c | 126 +++++++++++++++++++++++++++++++++++++++++---
> >  3 files changed, 140 insertions(+), 6 deletions(-)
>=20
> Well, this patch is doing several things at once -- adding the timer, add=
ing
> the ns_per_count hook, updating irqs.  Not ideal, but I won't insist it b=
e split.
>=20
> You'll need to re-run against scripts/checkpatch, it would seem.
> The goal-posts with respect to comments have been changed since
> you started this.

Okay, I'll check that again before I send the next version out.

> > @@ -1305,7 +1338,19 @@ void pmccntr_op_start(CPUARMState *env)
> >              eff_cycles /=3D 64;
> >          }
> > =20
> > -        env->cp15.c15_ccnt =3D eff_cycles - env->cp15.c15_ccnt_delta;
> > +        uint64_t new_pmccntr =3D eff_cycles - env->cp15.c15_ccnt_delta=
;
> > +
> > +        unsigned int overflow_bit =3D (env->cp15.c9_pmcr & PMCRLC) ? 6=
3 : 31;
> > +        uint64_t overflow_mask =3D (uint64_t)1 << overflow_bit;
>=20
> Could just as easily be
>=20
>   uint64_t overflow_mask =3D env->cp15.c9_pmcr & PMCRLC ? INT64_MIN : INT=
32_MIN;

Updated.

> > +        if (env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask) {
> > +            env->cp15.c9_pmovsr |=3D (1 << 31);
> > +            if (!(env->cp15.c9_pmcr & PMCRLC)) {
> > +                new_pmccntr &=3D 0xffffffff;
> > +            }
>=20
> Why is this truncation buried within the overflow condition?  Simply beca=
use
> the high bits can't be set without overflow being noticed?  That could us=
e a
> comment, because it looks odd.

Upon re-reading the spec, I don't think this is needed (or even correct
behavior). I must've been thinking that PMCR.LC =3D=3D 0 implied that upper
32 bits could never be updated by the hardware and made PMCCNTR act like
its high bits didn't even exist, like one of the PMXEVCNTRs. I no longer
believe that is true and I'll remove this.

> > @@ -1340,8 +1399,15 @@ static void pmevcntr_op_start(CPUARMState *env, =
uint8_t counter)
> >      }
> > =20
> >      if (pmu_counter_enabled(env, counter)) {
> > -        env->cp15.c14_pmevcntr[counter] =3D
> > -            count - env->cp15.c14_pmevcntr_delta[counter];
> > +        uint64_t new_pmevcntr =3D count - env->cp15.c14_pmevcntr_delta=
[counter];
> > +
> > +        if (!(new_pmevcntr & PMEVCNTR_OVERFLOW_MASK) &&
> > +                (env->cp15.c14_pmevcntr[counter] & PMEVCNTR_OVERFLOW_M=
ASK)) {
> > +            env->cp15.c9_pmovsr |=3D (1 << counter);
> > +            new_pmevcntr &=3D ~PMEVCNTR_OVERFLOW_MASK;
>=20
> That, surely, does not do what you intend.  I can only imagine that you m=
eant
>=20
>     new_pmevcntr =3D (uint32_t)new_pmevcntr;
> or
>     new_pmevcntr &=3D PMEVCNTR_OVERFLOW_MASK - 1;
>=20
> depending on how much you want to depend on the symbol defining the width=
.

In practice, I think only the 32nd bit would ever need to be cleared,
but I agree it is more correct to clear them all.

> Given that it is architecturally defined to 32-bits, I think you could re=
ally
> just drop the define and use
>=20
>     uint32_t new_pmevcntr =3D ...;
>     if (env->cp15.c14_pmevcntr[counter] & ~new_pmevcntr & INT32_MIN)
>
> with equal clarity.

I don't know whether it is important for the resolution of this patch,
but what did you mean by the following?:

> The type of new_pmevcntr means you don't have to clear any
> high bits either.

> > +            /* Detect if this write causes an overflow since we can't =
predict
> > +             * PMSWINC overflows like we can for other events
> > +             */
> > +            uint64_t new_pmswinc =3D env->cp15.c14_pmevcntr[i] + 1;
> > +
> > +            if (!(new_pmswinc & PMEVCNTR_OVERFLOW_MASK) &&
> > +                    (env->cp15.c14_pmevcntr[i] & PMEVCNTR_OVERFLOW_MAS=
K)) {
> > +                env->cp15.c9_pmovsr |=3D (1 << i);
> > +                new_pmswinc &=3D ~PMEVCNTR_OVERFLOW_MASK;
>=20
> Likewise.

Thanks,

Aaron
