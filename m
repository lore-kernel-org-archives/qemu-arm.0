Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp810132wrw;
        Fri, 16 Nov 2018 12:09:33 -0800 (PST)
X-Google-Smtp-Source: AJdET5eMudOR10OVHAy4Cj5moicaQP7Ot5ht0Ik8ggQEiP15qR8gEkjwMZhGYoNri7WfaHro7Ucq
X-Received: by 2002:a37:90e:: with SMTP id 14mr11332943qkj.63.1542398973582;
        Fri, 16 Nov 2018 12:09:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542398973; cv=none;
        d=google.com; s=arc-20160816;
        b=uV6huqDsrp0R6YkHvv3WMANJubjsWvbnENTnVi8NbMo5hYbqVbXFFEirfOKrq4yjjH
         KJzaavH+BGlVsmC7phJcoSu1+XLinkLTXb+fOOBTzZTfUkI7qBCGCqzv5ZNyVKkZnPgK
         CBAJX+83WKpRIz/shXDRtyOCP5yR28zR3vEyGnM1AQ4LANhPVqfjQKsqCtadjKlV79D6
         HXZTcYYux22I75DajnL1jYto2kC9PcekDPT/ogwmZ6LFsIpEnBCu78ychbbxlVMTntUT
         H5EYgAAQGLwl9Sg1POkP7JsGz1SMJXguDFjI9Qll8+hu6SS4bw/q3bZbY7TaJRchVexp
         9LMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=Yzat8WxU1EOhARz5nwvGU8NJEjOhLylHJ1BY/9gbxIo=;
        b=sTz7fOfueYs8sULbNSvPhwmM9NoTa0ltagF254LK4ByyuSLhJSTQCDYQB9TUwwYm+A
         sQ2P4aJmvP8rwjiFV2+XyNNqeyCGUjyY0j6dwIBL1hhWcTg6P9HgIThfcVfAF3hZqvIo
         iW2g09DhKLYgRB/78TjNUOtbS1Wh8NJFErgVtyIJTme5avVuLX1FmymufPBnZbYxyfvc
         /HENZUHvv0QU3GmGq63ru/Z533gp1woZSqgy6scAQ+I7o4hesDC2mH2eXiaWYrIdDLFv
         Yas+OKZWTEXBd8Kubxj9gUZbtiynkMfHhna8O/W4nt+GkDVsmm/WMr0gfG4a/ojL6dla
         dCwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b="E4/fGflv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k1si111346qvf.53.2018.11.16.12.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 12:09:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b="E4/fGflv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:46874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNkQm-0006L5-SB
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 15:09:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gNkQd-0006Kn-T6
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 15:09:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gNkQZ-0004Lw-05
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 15:09:22 -0500
Received: from mail-eopbgr780103.outbound.protection.outlook.com
	([40.107.78.103]:4192
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gNkQY-0004KV-1K; Fri, 16 Nov 2018 15:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Yzat8WxU1EOhARz5nwvGU8NJEjOhLylHJ1BY/9gbxIo=;
	b=E4/fGflvFDbv9Nop+TP+RT6lz63B7qftuEagjm8onklS10jzHWe9z65HziE4ZZuhhIm/Uv/A3OqGeaIsvO7PqrQmr6N08JN5XDoVyIFpdQbgyGO0fmYjWhIWdpO+m+eEA53spwY4GH4nxoqDn1PxM7FnIFG77/Zg8Y6GdiI1NsE=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5164.prod.exchangelabs.com (20.176.121.209) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.20; Fri, 16 Nov 2018 20:09:13 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.045;
	Fri, 16 Nov 2018 20:09:13 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v7 07/12] target/arm: Add array for supported PMU events, 
	generate PMCEID[01]
Thread-Index: AQHUdTigFzoivX0Aakiay0YA2QVOXaVSkYGAgABUfwA=
Date: Fri, 16 Nov 2018 20:09:13 +0000
Message-ID: <20181116200904.GE23658@quinoa.localdomain>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-8-aaron@os.amperecomputing.com>
	<CAFEAcA8F5ZhPHU2ZC53xeXOEuR2NqzwHqjG9858VELjorwYj5g@mail.gmail.com>
In-Reply-To: <CAFEAcA8F5ZhPHU2ZC53xeXOEuR2NqzwHqjG9858VELjorwYj5g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR2201CA0034.namprd22.prod.outlook.com
	(2603:10b6:405:5e::47) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5164;
	6:BjK+2IWYP+WuoLXQ712HWxveT4NehZCBxdsVWJFYuVnYW320lYFUWqLmosHDz7kgP+Y3WqoY13Z9vtJCGcsK6C5zBZ+wt57x4iBBoU36N6pMeXSHjiEbgT4s0ceM3JlLYTdC1rSOwjZPDSpoERFKJzIDJXj4IlTmVZkDtcptfUGo+NieceuK1r2iuHyU8NrfBd3IL2oCybFwRxXiLm//yKgZDv0z6jmJ0K4aY1pwD+6WIfCn5iuxSG6XBRM/xKUnCKL8Fb7jMudVWpxVmKRdaceZJuS/gtAsnkbdVhzmjS/u893NR8Kxyj28sqFcG0xadUcUdLhHDT+3g52Hs5Q9LJ2C5t4XBMCk30lO2pe0YJs9qmy1awYnxggKiSGUoM35fj+/rdvSXlRLUewsiht7zy326lTRJcSVQW+6yTg571RcjoId9W52OwqrM3Vvg5O9QDHziJAAdfvl8QcyJ4qTgQ==;
	5:Q2+YRB2eEHT2ID5hnrPfISwtVCBIfhJ9WfDlJPVfYr5wjuBWaOWwZU1UpeU3/os/SdWbyCCYfJZqT1SRaGYAD3etMIz48kKlyQgkX+XbnnrlzNBKCi9ASWSiphfR7i+Pnc5yKuPyT0opc/cSNamDoHg+Q12866TKu11xOlOY338=;
	7:ksDJadIf7pp+tPkkSbwqBGMUvOwALjkXwhuvPZ+vXTFhkbksRaI/i0GebsbEdzG1Wty3QyVgePPQ3YFn7JzdB1sw1xBl6M8ZmIpX1teMpl2gWnDfHbbZGswOksSqmh6a5Z6RQWkiU8l5PAzOlISCXQ==
x-ms-office365-filtering-correlation-id: 793c916a-74f7-49dc-f382-08d64bff60f1
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5164; 
x-ms-traffictypediagnostic: DM6PR01MB5164:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-microsoft-antispam-prvs: <DM6PR01MB51640B490F4567888017ECA08ADD0@DM6PR01MB5164.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231415)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5164; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5164; 
x-forefront-prvs: 0858FF8026
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(39840400004)(346002)(366004)(376002)(124014002)(199004)(189003)(476003)(186003)(478600001)(4326008)(486006)(229853002)(71200400001)(1076002)(9686003)(71190400001)(97736004)(6512007)(6486002)(26005)(316002)(8676002)(7416002)(446003)(76176011)(14454004)(5660300001)(52116002)(256004)(66066001)(11346002)(14444005)(99286004)(105586002)(305945005)(33656002)(25786009)(3846002)(39060400002)(33896004)(53546011)(6116002)(6506007)(386003)(106356001)(81166006)(6916009)(6246003)(7736002)(53936002)(2900100001)(8936002)(54906003)(2906002)(6436002)(81156014)(102836004)(86362001)(68736007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5164;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 8aGCEqoxKJKjqeYCWSvn2RLA2DwWDaVYkxAVFEeAMtoOEybdVra9CDTjbdwpizRsfCQUn22hlgrRUIVwBEesq/omWHu3V5jkZNwMCxGKYj4wy9YZg2coZ0/nrAn7/aNaCnRYT3ZTLBlCgHJlhpATzfEkbM5ZgHo/XNwYQEGCOymPLU+hU8h2AyayFe9FpZZxxV2NRDSvMq0/OtBIfxMJa6pQ200oyopmYQppoEk/k4afIcrnw10mynmEAg38vksPxKr9auqFORzUOLBO3IIODxyD5rzs7PkkdWFfggsR/wZkTpXJ6HIDPVzPRr3RJSKJev7aIiOkpaQv17J9XpDtLE9CDPPxwOtTnsYnQSR020Q=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <689726F3A8957D40976F9424C435FD0D@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793c916a-74f7-49dc-f382-08d64bff60f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2018 20:09:13.8623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5164
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.78.103
Subject: Re: [Qemu-arm] [PATCH v7 07/12] target/arm: Add array for supported
 PMU events, generate PMCEID[01]
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NAcKgd+wcTzT

On Nov 16 15:06, Peter Maydell wrote:
> On 5 November 2018 at 18:51, Aaron Lindsay <aaron@os.amperecomputing.com>=
 wrote:
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -957,9 +957,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Er=
ror **errp)
> >      if (!cpu->has_pmu) {
> >          unset_feature(env, ARM_FEATURE_PMU);
> >          cpu->id_aa64dfr0 &=3D ~0xf00;
> > -    } else if (!kvm_enabled()) {
> > -        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
> > -        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
> > +    }
> > +    if (arm_feature(env, ARM_FEATURE_PMU)) {
> > +        uint64_t pmceid =3D get_pmceid(&cpu->env);
> > +        cpu->pmceid0 =3D extract64(pmceid, 0, 32);
> > +        cpu->pmceid1 =3D extract64(pmceid, 32, 32);
> > +
> > +        if (!kvm_enabled()) {
> > +            arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0=
);
> > +            arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
> > +        }
> > +    } else {
> > +        cpu->pmceid0 =3D 0x00000000;
> > +        cpu->pmceid1 =3D 0x00000000;
> >      }
>=20
> This now sets one of the ID registers for "we have no
> PMU" in the first "if (!cpu->has_pmu)" statement (id_aa64dfr0),
> and some of them (pmceid0, pcmeid1) in this else clause at the
> end. We should put them all in the same place.

I agree that would be cleaner - I'll move the id_aa64dfr0 update to
later else clause.

> > +/*
> > + * get_pmceid
> > + * @env: CPUARMState
> > + *
> > + * Return the PMCEID[01] register values corresponding to the counters=
 which
> > + * are supported given the current configuration (0 is low 32, 1 is hi=
gh 32
> > + * bits)
> > + */
> > +uint64_t get_pmceid(CPUARMState *env);
>=20
> This doesn't look like the right API, because in AArch64
> PMCEID0_EL0 and PMCEID1_EL0 are both 64-bit registers,
> so you can't fit them both into a single uint64_t.

Heh, I think I started working on this long enough ago that I was using
a copy of the ARMv8.0 ARM - before the statistical profiling extensions
were announced. I believe those are the only currently-defined common
events >=3D 0x4000, so they're the only bits defined in the upper 32 bits
of PMCEID[01].

Now that I look at it, pmceid[01] are currently only defined as
uint32_t, and we don't have PMCEID[23] for the high bits for AArch32.
Perhaps that should be a separate patch.

At any rate, I'll plan to update this the following signature for the
next version, where `which` is [01] for which PMCEID is being requested.
For now I'll probably just put a comment about not supporting the 0x40xx
events, since I don't know that coming up with a sparse array is worth
it, but the signature will be appropriate if we add support later:

uint64_t get_pmceid(CPUARMState *env, unsigned which);

-Aaron
