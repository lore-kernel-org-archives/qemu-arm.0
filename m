Received: by 10.25.159.19 with SMTP id i19csp799051lfe;
        Tue, 12 Jan 2016 15:53:35 -0800 (PST)
X-Received: by 10.55.74.14 with SMTP id x14mr41272984qka.70.1452642815758;
        Tue, 12 Jan 2016 15:53:35 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c69si32976143qkb.11.2016.01.12.15.53.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jan 2016 15:53:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:34620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aJ8kp-0000fu-9t
	for alex.bennee@linaro.org; Tue, 12 Jan 2016 18:53:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aJ8kT-0000Nm-BN
	for qemu-devel@nongnu.org; Tue, 12 Jan 2016 18:53:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aJ8kO-0006r1-AN
	for qemu-devel@nongnu.org; Tue, 12 Jan 2016 18:53:13 -0500
Received: from mail-bn1bn0101.outbound.protection.outlook.com
	([157.56.110.101]:3431
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aJ8kO-0006qt-0t; Tue, 12 Jan 2016 18:53:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=5KeUs+hBqQ18w7hHM4+AjxkFTRWZtXERA2SqO2R5iIs=;
	b=L7wq3UlCUl1GugGimNM7PJCmuH1TIpPt8je/Tw2zyzl5N0t3O11TTwdzx1F8Dtnp1rCFaR1TWjLTJxn4Rvk+lY7B+2rcUq4L3hUFTsNW39I0rNnkdNI8ZyPcLd4q765pva6C6OLgkhnRrRR9qFozTNmD1pf4XlD1/HVuBkgBj7E=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with Microsoft
	SMTP Server (TLS) id 15.1.365.19; Tue, 12 Jan 2016 23:53:06 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0365.022; Tue, 12 Jan 2016 23:53:06 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Thread-Topic: [PATCH v3 7/7] raspi: add raspberry pi 2 machine
Thread-Index: AQHRRCvQrdqc5QRVI0SWrS1zLOHRB573UnuAgAFA88A=
Date: Tue, 12 Jan 2016 23:53:05 +0000
Message-ID: <BLUPR0301MB2034BFDBF9CE361133F26B8E9ECA0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1451608294-16432-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1451608294-16432-8-git-send-email-Andrew.Baumann@microsoft.com>
	<20160112035753.GD3308@pcrost-box>
In-Reply-To: <20160112035753.GD3308@pcrost-box>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Andrew.Baumann@microsoft.com; 
x-originating-ip: [2001:4898:80e8:6::724]
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2036;
	5:Vqm9FtWWlMIU0jtObNY7lAXkCS6/vLovyNZBLIIefaQNZa0Tsshj8SO54fWFeZEcx5Pvmpw05DyGz8/AGWlrUna5ioumBkuHDW7hkrNnKsmyfLuHwXyaxavfBOoBtTMPFgWhjEiYApy09vhDJvVSTA==;
	24:Od9jq+UatoKIU0hBn+8CX4NHSPq4Mlbx+Om0SpTDxpiCL/htC7ghC8d0sTZtOZ1I6dCXY2AwCOM51To3mUxkWt9KmZV6p9WfaBbGxPcnQyY=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
x-ms-office365-filtering-correlation-id: e27c786f-bcd7-4d95-a9d5-08d31bab844c
x-microsoft-antispam-prvs: <BLUPR0301MB2036E2F2C7436CA57AFBD8F69ECA0@BLUPR0301MB2036.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(520078)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
x-forefront-prvs: 081904387B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(10400500002)(40100003)(5008740100001)(110136002)(5005710100001)(77096005)(586003)(10090500001)(76576001)(102836003)(8990500004)(101416001)(4326007)(1096002)(10290500002)(189998001)(5001960100002)(97736004)(5002640100001)(81156007)(6116002)(5003600100002)(2900100001)(2950100001)(2906002)(5004730100002)(122556002)(1220700001)(54356999)(76176999)(92566002)(99286002)(11100500001)(575784001)(87936001)(105586002)(50986999)(1411001)(106116001)(106356001)(19580395003)(33656002)(86612001)(86362001)(19580405001)(74316001)(3826002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2016 23:53:05.9064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.101
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?iso-8859-1?Q?Gr=E9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 7/7] raspi: add raspberry pi 2 machine
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e/JONSaujOpG

> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
> Sent: Monday, 11 January 2016 19:58
[...]
> > +static void write_board_setup(ARMCPU *cpu, const struct arm_boot_info
> *info)
>=20
> This is almost identical to Highbank, I'm guessing you are stubbing monit=
or
> firmware where you get away with nopping all the SMCs? Maybe we should
> split
> Highbanks version off to common code, and parameterise the few
> differences.
>=20
> write_board_setup_dummy_monitior(ARMCPU *cpu ..., uint32_t scr_flags);
>=20
> or something like it. Makes sense to be in arm/boot.c .

Actually, I added this only to make Linux happy (and yes, it was derived fr=
om highbank). Without it, I was seeing complaints about:
Ignoring attempt to switch CPSR_A flag from non-secure world with SCR.AW bi=
t clear
Ignoring attempt to switch CPSR_F flag from non-secure world with SCR.FW bi=
t clear

I don't believe anything actually uses the SMC handler after boot. I think =
it's just an architectural requirement to flush the change to non-secure mo=
de.

I would prefer not to touch highbank, because I don't know how to test it. =
Is it better to submit this patch without the board setup?

>=20
> > +{
> > +    static const uint32_t board_setup[] =3D {
> > +        /* MVBAR_ADDR: secure monitor vectors */
> > +        0xEAFFFFFE, /* (spin) */
> > +        0xEAFFFFFE, /* (spin) */
> > +        0xE1B0F00E, /* movs pc, lr ;SMC exception return */
> > +        0xEAFFFFFE, /* (spin) */
> > +        0xEAFFFFFE, /* (spin) */
> > +        0xEAFFFFFE, /* (spin) */
> > +        0xEAFFFFFE, /* (spin) */
> > +        0xEAFFFFFE, /* (spin) */
> > +        /* BOARDSETUP_ADDR */
> > +        0xE3A00B01, /* mov     r0, #0x400             ;MVBAR_ADDR */
> > +        0xEE0C0F30, /* mcr     p15, 0, r0, c12, c0, 1 ;set MVBAR */
> > +        0xE3A00031, /* mov     r0, #0x31              ;enable AW, FW, =
NS */
> > +        0xEE010F11, /* mcr     p15, 0, r0, c1, c1, 0  ;write SCR */
>=20
> If combining with HB, could you do this as read-modify-write?
>=20
> > +        0xE1A0100E, /* mov     r1, lr                 ;save LR across =
SMC */
> > +        0xE1600070, /* smc     #0                     ;monitor call */
> > +        0xE1A0F001, /* mov     pc, r1                 ;return */
>=20
> I'm looking at the Highbank version which doesn't save lr across the SMC =
and
> wondering why it doesn't. Is this banked by CPU mode and do you get from
> already-in-monitor-mode? Or simply, that Highbank code may have a bug?

I think it's needed because I call the board setup blob on each core (from =
the smpboot blob), but highbank doesn't. I found that I needed to do this t=
o avoid the above warnings on an SMP boot; I don't know why highbank doesn'=
t.

[...]
> > +    /* Allocate and map RAM */
> > +    memory_region_allocate_system_memory(&s->ram,
> OBJECT(machine), "ram",
> > +                                         machine->ram_size);
> > +    memory_region_add_subregion_overlap(get_system_memory(), 0,
> &s->ram, 0);
>=20
> I thought the SoC handled this now? Why do you need to add to
> system_memory?

If I don't map it here, how do RAM accesses from the CPUs work?

Or are you saying that I should still do this, but do it in the SoC not the=
 board level?

[...]
> > +static void raspi2_machine_init(MachineClass *mc)
> > +{
> > +    mc->desc =3D "Raspberry Pi 2";
> > +    mc->init =3D raspi2_init;
> > +    mc->block_default_type =3D IF_SD;
>=20
> > +    mc->no_parallel =3D 1;
> > +    mc->no_floppy =3D 1;
> > +    mc->no_cdrom =3D 1;
>=20
> Curious, what do these do from a user-visible point of view? Maybe we
> should
> add them to more ARM boards as they certainly make sense.

I think they turn off some redundant stuff in the UI (e.g., there's no View=
->Parallel menu option). I'm guessing they also disable the -cdrom and  -fd=
* options, but didn't test that.

Cheers,
Andrew
