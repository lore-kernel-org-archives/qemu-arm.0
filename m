Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2895307wrt;
        Fri, 18 Jan 2019 02:59:31 -0800 (PST)
X-Google-Smtp-Source: ALg8bN63aBmYxjJpsqZexH6Yuu8aWSWllKbBU/r80nlXG4+1UQiVQ7pKGOj11vaMQCUnRQctXu7G
X-Received: by 2002:adf:b307:: with SMTP id j7mr16861547wrd.46.1547809171679;
        Fri, 18 Jan 2019 02:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547809171; cv=none;
        d=google.com; s=arc-20160816;
        b=lRxxx8ePYxx+eBAlM9AoyQiCaRcZYWKXg7XU3tBWZjHjo1AOO0oTwhXp62IUirIvGt
         cYvjk+pNAmkKJ08bemdi+8Dga0ozAmWOafdZ8oX4SoGemB/TVJYTTbGFh1yXtyxD4GeX
         YWfMM0UDyURvusfxEbfW/xD28Uj15JXzdklLmCH0p5VDqWUQj0kNrnUZycssEfMO65EK
         S/bZF2Ctn+znB9ukTP9TX8fTpZmzatcE7mIxHX7swdRxLJsEdEhx6IHdc3gT1aMbPxEQ
         9uw5hx9G+06Wpno3PbxxPk2QzjZR3yFVMF78BfNZ601+pguxMBOViyyOOF3YELtkUbFX
         DowQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:to:from:dkim-signature;
        bh=H+aQUdovhKRv9/xL6HJkObAAlz+WT65LQDas3mBQnGk=;
        b=suz0wxYkla76qYiFn4AhVeZNgxFQ9oiCyqPZoxksl/yYItk4fil0tVc/e1jfgkUrOa
         SU/Fbh2N++p6NqqpjdfN8eQfT+/7pHXDQ76Q0TfpuodSjvna2i0D1cc/c4zFIhTdulnD
         UyS8yV+c39xAr/k35r5jer91rD99l4v9thDmr/OFv0SrIYvB5VWaPVI7S8TUKk5I3QJI
         O5gsVgMt8YQYcTXBhCaaOduj4wmR9lPurcxbvKahoI5yt1gCqojiPHT3OcTqXuSsYyNP
         h+u2iEP/moIxm9m1bc9whfxQewqjMxsrewAdDB681BW+hZ8asLRZoJBq5qRgFnp/fUx8
         HGkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@hotmail.com header.s=selector1 header.b=dXh+rN+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=hotmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13si39214214wrr.57.2019.01.18.02.59.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Jan 2019 02:59:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@hotmail.com header.s=selector1 header.b=dXh+rN+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=hotmail.com
Received: from localhost ([127.0.0.1]:36340 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkRs2-00088D-Kq
	for alex.bennee@linaro.org; Fri, 18 Jan 2019 05:59:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joaogaspar_csw_qemu@hotmail.com>) id 1gkRro-000865-4E
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 05:59:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joaogaspar_csw_qemu@hotmail.com>) id 1gkRrl-0008Pv-H1
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 05:59:16 -0500
Received: from mail-db5eur03olkn081c.outbound.protection.outlook.com
	([2a01:111:f400:fe0a::81c]:52144
	helo=EUR03-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <joaogaspar_csw_qemu@hotmail.com>)
	id 1gkRri-0008KB-0y
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 05:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=H+aQUdovhKRv9/xL6HJkObAAlz+WT65LQDas3mBQnGk=;
	b=dXh+rN+fiph49K9Ua52IvOhyXC0pS0OKy6AMo9jB9IFLhodZHtzpIkAC3XV13vQGLsrBQrAI6RbU/fKo3viI+pPQfyIZyYZphNMKmGAv41/5M6+8ru4wXnT11jIKq8GUuYEj2OHOclrQYN20qrDXohf4BiTU6tMtuAoAaWqjswYNWcOz80UOaE79Ilux7N5LhLXNkkD7LHnAHe1Qq5+apIeAkraMeOQQ7Z+Z/1Vpvm5RjynniLYejKopWMvjBzJ3EsBM9dUDw6hCtqPv52+w5PA4y+qRElUhZL2hMalSP3GzALJ0otCRP9MsLJL9WXseHr94f3ONoXMO6uO+p8mW6g==
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
	(10.152.16.54) by AM5EUR03HT037.eop-EUR03.prod.protection.outlook.com
	(10.152.17.121) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1382.18;
	Fri, 18 Jan 2019 10:59:05 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (10.152.16.59) by
	AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.18 via Frontend Transport; Fri, 18 Jan 2019 10:59:05 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
	([fe80::9c2f:fe4e:620f:396b]) by
	DB7PR04MB4505.eurprd04.prod.outlook.com
	([fe80::9c2f:fe4e:620f:396b%4]) with mapi id 15.20.1537.018;
	Fri, 18 Jan 2019 10:59:05 +0000
From: =?iso-8859-1?Q?Jo=E3o_Gaspar?= <joaogaspar_csw_qemu@hotmail.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [Qemu-arm] Problems adding TMS570LC43 - Cortex-R5f
Thread-Index: AQHUrn+RvuL+87yNd0mrmTi3Wjo+z6WzrXobgAASnwCAARcvfIAABUk1
Date: Fri, 18 Jan 2019 10:59:05 +0000
Message-ID: <DB7PR04MB45050F871A204D198EBCADDAB99C0@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <DB7PR04MB4505EEB04A9500D8162463B9B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
	<DB7PR04MB45057508E2DF87EE77572CE3B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>,
	<CAFEAcA_4zpaGG5aV_Yy7vnXKdcuoBj3Q0jPFXYNnBRyjaK3CqQ@mail.gmail.com>,
	<DB7PR04MB45057281CC5FA50979C5A928B99C0@DB7PR04MB4505.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB45057281CC5FA50979C5A928B99C0@DB7PR04MB4505.eurprd04.prod.outlook.com>
Accept-Language: pt-PT, en-US
Content-Language: pt-PT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:8AEB757D34C27B53F48D371A47A4F6BBB0FDFFE0ED5BBD26ED1634A6D57091FC;
	UpperCasedChecksum:91C1DBBEDAE3246B646EFB57F609441D23A19F9FE4E5FCF531179CA20F6909D0;
	SizeAsReceived:7332; Count:45
x-tmn: [cA/mwQ6BnH4IuUFxPfNHgLLoLP1CDHT0]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5EUR03HT037;
	6:xgx32ybi1eDp6fA1jdDcWltMDoITX+sUir8TESZDbzonYUt4+3AZp0dV5fwrNIRcJPS+Gwq6cEBQRKQkvvBeqFXTFjT+azoW64xzSbsBlwCTRdK1eFn3WD+R3RGVPKMHCO4D1VUP+Nps8+0u+H2kWfiaGofRU32xSdpdvR8fvmnWaPHtq744Vwgkfzu7BntfZ6yvFgOGuVi11EFHLx+pKroxlBTV7m6JKk2sZJUUDARUn6vbY+wCLMn5WtQT8KsHfWjqO7J6x1afSsrfqbp/J33sir1JF6LTvbl/up2ZDKZ4JtxGSjywX/y8+5YauMTFLFOCnNDu9ehRcmslqvuAAvrewDhcwm7C+O3OOryecoYTjo1TR+i27MGwphCf+ZutWFIUaDNZ/wsHuWRhcw4HQIS3iCfTo1lUalQEuIR34FOS0WQ2fHl7/vEB+WxxYXhFfhJ/UyHQS3DuVqTu2XXA3w==;
	5:Q9OWvxtUFtyG+B0mVZdL4IrNyGZbfdDiTSxdxFO4VbvHMXUy1FZ97iNiMRGU6ACTV3ak9pf72fSqsN/xEE7g1KItGWJd3W3ArTcAiarw4YKxzyuCOxzi4i30AHw8Uu9vMTI/qpvG9rvWSDUZBXEaZ9bsLS1eozZgaLcFz44C+hQ=;
	7:Fl3Z9/Qve8qSjJ0SwR8NWTsdt8YdJbobWTG98G1J/3WEejBxeYw9iUDJmyq/LECgljnLqFiYFVVvuxdHop3E7FFZpp8hoNVNs3Az1C/fRYEJ5P1AyjKjT6iy33bgJ5SGF80Gcc3iGPgGMUi/zmhR5Q==
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(9118020)(2017031323274)(2017031324274)(2017031322404)(1601125500)(1603101475)(1701031045);
	SRVR:AM5EUR03HT037; 
x-ms-traffictypediagnostic: AM5EUR03HT037:
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(4566010)(82015058);
	SRVR:AM5EUR03HT037; BCL:0; PCL:0; RULEID:; SRVR:AM5EUR03HT037; 
x-microsoft-antispam-message-info: mNSlHXBZhXngoup7EXpCHdFd8iNYyx2/pDfCIeYYtsN0b3w//jZghmLIzet3a9xm
Content-Type: multipart/alternative;
	boundary="_000_DB7PR04MB45050F871A204D198EBCADDAB99C0DB7PR04MB4505eurp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: dd759f05-a917-4aa0-a2f5-4cc35c50e0c8
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b358bdc-f1e1-4e78-13f3-08d67d33f6ee
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: dd759f05-a917-4aa0-a2f5-4cc35c50e0c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2019 10:59:05.8835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5EUR03HT037
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe0a::81c
Subject: [Qemu-arm] FW:  Problems adding TMS570LC43 - Cortex-R5f
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OW9pErS9qD5C

--_000_DB7PR04MB45050F871A204D198EBCADDAB99C0DB7PR04MB4505eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Peter, thanks alot for your detailed answer!
In fact, it's a big challenge trying to create a new machine type on QEMU, =
and start is not to easy!

To start you have reason, the "cortex-r5" name is not a good name to the bo=
ard I will change to the name of the board.

Inicially I have start looking to the "stm32f205_soc.c" and trying to follo=
w the code, but then I was confused because I look to the "z2.c" and realiz=
ed that they are difrent. After that I trying to follow the "z2.c"  approac=
h, but like I say I got confused! Know I think that I understand what I'm d=
oing wrong! At this moment I'm just "realize" the device whithout never ini=
cialize!

Before I follow the "z2.c" approach, I have two methods one to "init" and a=
nother to "realize", but after I just make the realize whithout never inici=
alize. If I'm not wrong, what you say is that I have to inicialize and real=
ize in the same method.
Just to make a point of situation, I have created the peripherals files on =
there right package.

Well thanks a lot for your answare! You give me a lot of information to pro=
cess and I will going to take in consderation all the tips that you given m=
e!

Many thanks,

Jo=E3o Gaspar

________________________________
De: Peter Maydell <peter.maydell@linaro.org>
Enviado: 17 de janeiro de 2019 18:00
Para: Jo=E3o Gaspar
Cc: qemu-arm@nongnu.org
Assunto: Re: [Qemu-arm] Problems adding TMS570LC43 - Cortex-R5f

On Thu, 17 Jan 2019 at 17:20, Jo=E3o Gaspar
<joaogaspar_csw_qemu@hotmail.com> wrote:
>
> Hi!
> I'm new at QEMU so I have some questions.

Hi; I'll see if I can answer some of them. Note that creating
a new machine model isn't a trivial task. You should think of
it as about the same amount of effort and difficulty as doing
a port of Linux to a new piece of hardware.

> I'm trying to create a new support machine to QEMU, the TMS570LC43 board,=
 this board use the Cortex-R5f microcontroller.
> At this moment when I do the "qemu-system-arm -M help" my machine is show=
ed with the name "cortex-r5".

This isn't really a good name for the board, because
"cortex-r5" is a CPU, not a board. You should call it
"TMS570LC43x" or something similar, because that's what
you're modelling here.

> The probleme start when I try to instaciate the machine with the comand "=
qemu-system-arm --machine cortex-r5 -cpu cortex-r5f", after that I received=
 the message "segmentation fault (core dump)".
>
> Does anyone have an possible cause to my problem or an tip?

This means your code has a bug in it :-)

You need to run QEMU under a debugger and look at the back trace
to find out where it's crashing and why.

> I'm gonna let the code too, because probably I'm doing aniything wrong!

I have a few general notes below, which aren't necessarily
where your bug is (though there is one part that looks
like it probably is).

> //RTI -> Real Time Interruption
> //static const uint32_t RTI_addr =3D 0xFFFFFC00;
>
> //SPI
> static const uint32_t spi_addr[CR5_NUM_SPI] =3D {0xFFF7F400, 0xFFF7F600, =
0xFFF7F800, 0xFFF7FA00, 0xFFF7FC00};
> //I2C
> static const uint32_t i2c_addr[CR5_NUM_I2C] =3D {0xFFF7D400, 0xFFF7D500};
> //CAN
> static const uint32_t can_addr[CR5_NUM_CAN] =3D {0XFFF7DC00, 0XFFF7DE00, =
0X0FFF7E00, 0X0FFF7E200};
> //ADC
> static const uint32_t adc_addr[CR5_NUM_ADC] =3D {0xFFF7C000, 0xFFF7C200};
> //GIO
> static const uint32_t gio_addr[CR5_NUM_GIO] =3D {0xFFF7BC00};
>
> /*IRQ
> Interrupt Request Assignement
> http://www.ti.com/lit/ds/spns195c/spns195c.pdf
> Page: 118
> */
> //irq RTI
> /* static const int rti_cmp_irq0 =3D 2;
> static const int rti_cmp_irq1 =3D 3;
> static const int rti_cmp_irq2 =3D 4;
> static const int rti_cmp_irq3 =3D 5;
> static const int rti_oflw_irq0 =3D 6;
> static const int rti_oflw_irq1 =3D 7;
> static const int rti_timebase_irq =3D 8; */

These are weird. You'll notice that they don't follow the
style the rest of QEMU uses, which is mostly #defines for
constants. In general, you should follow some existing
(and ideally recently added) code that does the sort of
thing you're trying to do.


> //irq SPI
> static const int spi_l0_irq[CR5_NUM_SPI] =3D {12, 17, 37, 49, 53};
> static const int spi_l1_irq[CR5_NUM_SPI] =3D {26, 30, 38, 54, 56};
> //irq I2C
> static const int i2c_irq[CR5_NUM_I2C] =3D {66, 114};
> //irc CAN
> static const int can_l0_irq[CR5_NUM_CAN] =3D {16, 35, 45, 113};
> static const int can_l1_irq[CR5_NUM_CAN] =3D {29, 42, 55, 117};
> static const int can_if3_irq[CR5_NUM_CAN] =3D {44, 46, 60, 120};
> //irq ADC
> static const int adc_swgroup1_irq[CR5_NUM_ADC] =3D {15, 51};
> static const int adc_swgroup2_irq[CR5_NUM_ADC] =3D {28, 57};
> static const int adc_eventgroup_irq[CR5_NUM_ADC] =3D {14, 50};
> static const int adc_magnitudecmp_irq[CR5_NUM_ADC] =3D {31, 59};
> //irq GIO
> static const int gio_high_irq[CR5_NUM_GIO] =3D {9};
> static const int gio_low_irq[CR5_NUM_GIO] =3D {23};
>
>
> static void cortexR5_initf(MachineState *mc)
> {
>     CORTEXR5State *s =3D g_new0(CORTEXR5State, 1);

This isn't right -- you already have a state struct,
that's what the mc pointer is. You can add space for
anything you want at the machine level by subclassing
MachineState, and then casting the pointer here to
your subclass. hw/arm/aspeed.c (among others) has an
example of that.

>
>     DeviceState *dev;
>     SysBusDevice *busdev;
>     Error *err =3D NULL;
>
>     int i;
>     ARMCPU *cpu;
>
>
>     MemoryRegion *system_memory =3D get_system_memory();
>     MemoryRegion *ram =3D g_new(MemoryRegion, 1);
>     MemoryRegion *flash =3D g_new(MemoryRegion, 1);
>     MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
>
>
>
>     //s->cr5_cpu =3D ARM_CPU(object_new(mc->cpu_type));
>     cpu =3D ARM_CPU(object_new(mc->cpu_type));

You don't want to create the CPU at the top level "machine"
level of your code. (It can be made to work, but it's structured
all wrong.) What you want is to model the hardware:

 * have a model of the SoC (which is the chip on your test
   board which includes the CPU and typically various other devices
   such as UARTs, GPIOs, etc etc)
 * have a model of the board, which creates the SoC, and
   anything else that is on the board but not part of the
   SoC (usually including the main system memory)
 * devices that are part of the SoC go in their own files
   in hw/<whatever>/

You can see examples of this in
hw/arm/aspeed.c (board model) and hw/arm/aspeed_soc.c (SoC model).


>     //object_initialize_child(obj, "cpu", &s->cr5_cpu, sizeof(s->cr5_cpu)=
, ARM_CPU_TYPE_NAME("cortex-r5f"), &error_abort, NULL);
>     object_property_set_bool(OBJECT(cpu), true, "realized", &error_fatal)=
;
>
>     memory_region_init_ram(flash, NULL, "CORTEXR5.flash", FLASH_SIZE, &er=
ror_fatal);
>
>     memory_region_init_alias(flash_alias, NULL, "CORTEXR5.flash.alias", f=
lash, 0, FLASH_SIZE);
>
>     memory_region_set_readonly(flash, true);
>     memory_region_set_readonly(flash_alias, true);
>
>     memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash)=
;
>     memory_region_add_subregion(system_memory, 0, flash_alias);
>
>     memory_region_init_ram(ram, NULL, "CORTEXR5.ram", SRAM_SIZE, &error_f=
atal);
>     memory_region_add_subregion(system_memory, RAM_BASE_ADDRESS, ram);
>
>     //SPI
>     for (i =3D 0; i < CR5_NUM_SPI; i++)
>     {
>         dev =3D DEVICE(&(s->spi[i]));
>         object_property_set_bool(OBJECT(&s->spi[i]), true, "realized", &e=
rr);

You never created this device, so attempting to 'realize' it is going
to break badly (and is probably where your segfault is coming from).

QEMU's device object model has a sort of multiple-phase creation:
 * "init" -- usually either by calling 'object_initialize()' or
   'object_initialize_child()' on some piece of already-allocated
   memory, or by calling 'object_new()' or 'qdev_create()' to
   do 'allocate and init'.
 * set properties on the device to configure it if necessary
 * "realize" (either by setting the 'realized' property, or by
   calling qdev_init_nofail())
 * then you can map its MMIO regions and connect its IRQ lines

There are two styles of creating devices that you can find in
QEMU code:
 * the older style uses qdev_* functions, which are usually
   more compact in terms of numbers of lines of source code.
   These families of functions create devices in newly allocated
   memory, so a "container" device like an SoC ends up with a
   state struct full of pointers to other devices.
 * a newer style tends to embed the sub-devices into the state
   struct of the container device, and thus uses object_initialize_child()
   and similar object_* functions rather than the qdev functions.
   The SoC object usually does the "init" part of the creation
   of its subdevices in its own "init" method, and the "realize"
   part in its own "realize".

Part of your problem here seems to be that you've taken code from
an SoC object which uses the latter style and put it into a
machine function where you haven't set up a proper subclass
of MachineState, and also have only taken the 'realize' part
and not the 'init' part. (Machines don't have split 'init' and
'realize' methods, so the machine init function needs to do
both things.)

>         if (err !=3D NULL)
>         {
>             //error_propagate(errp, err);
>             return;
>         }
>         busdev =3D SYS_BUS_DEVICE(dev);
>         sysbus_mmio_map(busdev, 0, spi_addr[i]);
>         sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), spi_l=
0_irq[i]));
>         sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev), spi_l=
1_irq[i]));
>     }


>
> static void cortexR5_machine_init(MachineClass *mc){
>    //mc->name =3D "Cortex-R5f";
>     mc->desc =3D "Based on TMS570LC43x";
>     mc->init =3D  cortexR5_initf;
>     mc->max_cpus =3D 1;
>     mc->ignore_memory_transaction_failures =3D true;

This flag should never be set for new board models -- it is
only present for handling legacy old boards where we don't
know what guest code we might break by setting it to false.
For new boards you can create the right devices for the guest
code you care about to run. (There is an "unimplemented-device"
in hw/misc which can be used to stub out areas of memory where
there are devices in hardware which you haven't written yet.)

PS: if you run scripts/checkpatch.pl it will let you know about
various minor coding style nits like brace placement and
comment style that you might like to fix.

thanks
-- PMM

--_000_DB7PR04MB45050F871A204D198EBCADDAB99C0DB7PR04MB4505eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Peter, thanks alot for your detailed answer!<br>
</div>
<div id=3D"signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<div>In fact, it's a big challenge trying to create a new machine type on Q=
EMU, and start is not to easy!<br>
</div>
<div><br>
</div>
<div>To start you have reason, the &quot;cortex-r5&quot; name is not a good=
 name to the board I will change to the name of the board.
<br>
</div>
<div><br>
</div>
<div>Inicially I have start looking to the &quot;stm32f205_soc.c&quot; and =
trying to follow the code, but then I was confused because I look to the &q=
uot;z2.c&quot; and realized that they are difrent. After that I trying to f=
ollow the &quot;z2.c&quot; &nbsp;approach, but like I say I got confused!
 Know I think that I understand what I'm doing wrong! At this moment I'm ju=
st &quot;realize&quot; the device whithout never inicialize!
<br>
</div>
<div><br>
</div>
<div>Before I follow the &quot;z2.c&quot; approach, I have two methods one =
to &quot;init&quot; and another to &quot;realize&quot;, but after I just ma=
ke the realize whithout never inicialize. If I'm not wrong, what you say is=
 that I have to inicialize and realize in the same method.<br>
</div>
<div>Just to make a point of situation, I have created the peripherals file=
s on there right package.
<br>
</div>
<div><br>
</div>
<div>Well thanks a lot for your answare! You give me a lot of information t=
o process and I will going to take in consderation all the tips that you gi=
ven me!<br>
</div>
<div><br>
</div>
<div>Many thanks, <br>
</div>
<div><br>
</div>
<span>Jo=E3o Gaspar</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div id=3D"signature"></div>
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>De:</b> Peter Maydell &lt;peter=
.maydell@linaro.org&gt;<br>
<b>Enviado:</b> 17 de janeiro de 2019 18:00<br>
<b>Para:</b> Jo=E3o Gaspar<br>
<b>Cc:</b> qemu-arm@nongnu.org<br>
<b>Assunto:</b> Re: [Qemu-arm] Problems adding TMS570LC43 - Cortex-R5f</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Thu, 17 Jan 2019 at 17:20, Jo=E3o Gaspar<br>
&lt;joaogaspar_csw_qemu@hotmail.com&gt; wrote:<br>
&gt;<br>
&gt; Hi!<br>
&gt; I'm new at QEMU so I have some questions.<br>
<br>
Hi; I'll see if I can answer some of them. Note that creating<br>
a new machine model isn't a trivial task. You should think of<br>
it as about the same amount of effort and difficulty as doing<br>
a port of Linux to a new piece of hardware.<br>
<br>
&gt; I'm trying to create a new support machine to QEMU, the TMS570LC43 boa=
rd, this board use the Cortex-R5f microcontroller.<br>
&gt; At this moment when I do the &quot;qemu-system-arm -M help&quot; my ma=
chine is showed with the name &quot;cortex-r5&quot;.<br>
<br>
This isn't really a good name for the board, because<br>
&quot;cortex-r5&quot; is a CPU, not a board. You should call it<br>
&quot;TMS570LC43x&quot; or something similar, because that's what<br>
you're modelling here.<br>
<br>
&gt; The probleme start when I try to instaciate the machine with the coman=
d &quot;qemu-system-arm --machine cortex-r5 -cpu cortex-r5f&quot;, after th=
at I received the message &quot;segmentation fault (core dump)&quot;.<br>
&gt;<br>
&gt; Does anyone have an possible cause to my problem or an tip?<br>
<br>
This means your code has a bug in it :-)<br>
<br>
You need to run QEMU under a debugger and look at the back trace<br>
to find out where it's crashing and why.<br>
<br>
&gt; I'm gonna let the code too, because probably I'm doing aniything wrong=
!<br>
<br>
I have a few general notes below, which aren't necessarily<br>
where your bug is (though there is one part that looks<br>
like it probably is).<br>
<br>
&gt; //RTI -&gt; Real Time Interruption<br>
&gt; //static const uint32_t RTI_addr =3D 0xFFFFFC00;<br>
&gt;<br>
&gt; //SPI<br>
&gt; static const uint32_t spi_addr[CR5_NUM_SPI] =3D {0xFFF7F400, 0xFFF7F60=
0, 0xFFF7F800, 0xFFF7FA00, 0xFFF7FC00};<br>
&gt; //I2C<br>
&gt; static const uint32_t i2c_addr[CR5_NUM_I2C] =3D {0xFFF7D400, 0xFFF7D50=
0};<br>
&gt; //CAN<br>
&gt; static const uint32_t can_addr[CR5_NUM_CAN] =3D {0XFFF7DC00, 0XFFF7DE0=
0, 0X0FFF7E00, 0X0FFF7E200};<br>
&gt; //ADC<br>
&gt; static const uint32_t adc_addr[CR5_NUM_ADC] =3D {0xFFF7C000, 0xFFF7C20=
0};<br>
&gt; //GIO<br>
&gt; static const uint32_t gio_addr[CR5_NUM_GIO] =3D {0xFFF7BC00};<br>
&gt;<br>
&gt; /*IRQ<br>
&gt; Interrupt Request Assignement<br>
&gt; <a href=3D"http://www.ti.com/lit/ds/spns195c/spns195c.pdf">http://www.=
ti.com/lit/ds/spns195c/spns195c.pdf</a><br>
&gt; Page: 118<br>
&gt; */<br>
&gt; //irq RTI<br>
&gt; /* static const int rti_cmp_irq0 =3D 2;<br>
&gt; static const int rti_cmp_irq1 =3D 3;<br>
&gt; static const int rti_cmp_irq2 =3D 4;<br>
&gt; static const int rti_cmp_irq3 =3D 5;<br>
&gt; static const int rti_oflw_irq0 =3D 6;<br>
&gt; static const int rti_oflw_irq1 =3D 7;<br>
&gt; static const int rti_timebase_irq =3D 8; */<br>
<br>
These are weird. You'll notice that they don't follow the<br>
style the rest of QEMU uses, which is mostly #defines for<br>
constants. In general, you should follow some existing<br>
(and ideally recently added) code that does the sort of<br>
thing you're trying to do.<br>
<br>
<br>
&gt; //irq SPI<br>
&gt; static const int spi_l0_irq[CR5_NUM_SPI] =3D {12, 17, 37, 49, 53};<br>
&gt; static const int spi_l1_irq[CR5_NUM_SPI] =3D {26, 30, 38, 54, 56};<br>
&gt; //irq I2C<br>
&gt; static const int i2c_irq[CR5_NUM_I2C] =3D {66, 114};<br>
&gt; //irc CAN<br>
&gt; static const int can_l0_irq[CR5_NUM_CAN] =3D {16, 35, 45, 113};<br>
&gt; static const int can_l1_irq[CR5_NUM_CAN] =3D {29, 42, 55, 117};<br>
&gt; static const int can_if3_irq[CR5_NUM_CAN] =3D {44, 46, 60, 120};<br>
&gt; //irq ADC<br>
&gt; static const int adc_swgroup1_irq[CR5_NUM_ADC] =3D {15, 51};<br>
&gt; static const int adc_swgroup2_irq[CR5_NUM_ADC] =3D {28, 57};<br>
&gt; static const int adc_eventgroup_irq[CR5_NUM_ADC] =3D {14, 50};<br>
&gt; static const int adc_magnitudecmp_irq[CR5_NUM_ADC] =3D {31, 59};<br>
&gt; //irq GIO<br>
&gt; static const int gio_high_irq[CR5_NUM_GIO] =3D {9};<br>
&gt; static const int gio_low_irq[CR5_NUM_GIO] =3D {23};<br>
&gt;<br>
&gt;<br>
&gt; static void cortexR5_initf(MachineState *mc)<br>
&gt; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; CORTEXR5State *s =3D g_new0(CORTEXR5State, 1);=
<br>
<br>
This isn't right -- you already have a state struct,<br>
that's what the mc pointer is. You can add space for<br>
anything you want at the machine level by subclassing<br>
MachineState, and then casting the pointer here to<br>
your subclass. hw/arm/aspeed.c (among others) has an<br>
example of that.<br>
<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; DeviceState *dev;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; SysBusDevice *busdev;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; Error *err =3D NULL;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; ARMCPU *cpu;<br>
&gt;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; MemoryRegion *system_memory =3D get_system_mem=
ory();<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; MemoryRegion *ram =3D g_new(MemoryRegion, 1);<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; MemoryRegion *flash =3D g_new(MemoryRegion, 1)=
;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; MemoryRegion *flash_alias =3D g_new(MemoryRegi=
on, 1);<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; //s-&gt;cr5_cpu =3D ARM_CPU(object_new(mc-&gt;=
cpu_type));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; cpu =3D ARM_CPU(object_new(mc-&gt;cpu_type));<=
br>
<br>
You don't want to create the CPU at the top level &quot;machine&quot;<br>
level of your code. (It can be made to work, but it's structured<br>
all wrong.) What you want is to model the hardware:<br>
<br>
&nbsp;* have a model of the SoC (which is the chip on your test<br>
&nbsp;&nbsp; board which includes the CPU and typically various other devic=
es<br>
&nbsp;&nbsp; such as UARTs, GPIOs, etc etc)<br>
&nbsp;* have a model of the board, which creates the SoC, and<br>
&nbsp;&nbsp; anything else that is on the board but not part of the<br>
&nbsp;&nbsp; SoC (usually including the main system memory)<br>
&nbsp;* devices that are part of the SoC go in their own files<br>
&nbsp;&nbsp; in hw/&lt;whatever&gt;/<br>
<br>
You can see examples of this in<br>
hw/arm/aspeed.c (board model) and hw/arm/aspeed_soc.c (SoC model).<br>
<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; //object_initialize_child(obj, &quot;cpu&quot;=
, &amp;s-&gt;cr5_cpu, sizeof(s-&gt;cr5_cpu), ARM_CPU_TYPE_NAME(&quot;cortex=
-r5f&quot;), &amp;error_abort, NULL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; object_property_set_bool(OBJECT(cpu), true, &q=
uot;realized&quot;, &amp;error_fatal);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; memory_region_init_ram(flash, NULL, &quot;CORT=
EXR5.flash&quot;, FLASH_SIZE, &amp;error_fatal);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; memory_region_init_alias(flash_alias, NULL, &q=
uot;CORTEXR5.flash.alias&quot;, flash, 0, FLASH_SIZE);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; memory_region_set_readonly(flash, true);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; memory_region_set_readonly(flash_alias, true);=
<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; memory_region_add_subregion(system_memory, FLA=
SH_BASE_ADDRESS, flash);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; memory_region_add_subregion(system_memory, 0, =
flash_alias);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; memory_region_init_ram(ram, NULL, &quot;CORTEX=
R5.ram&quot;, SRAM_SIZE, &amp;error_fatal);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; memory_region_add_subregion(system_memory, RAM=
_BASE_ADDRESS, ram);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; //SPI<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; CR5_NUM_SPI; i&#43;&#43;)=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev =3D DEVICE(&amp;(s=
-&gt;spi[i]));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; object_property_set_bo=
ol(OBJECT(&amp;s-&gt;spi[i]), true, &quot;realized&quot;, &amp;err);<br>
<br>
You never created this device, so attempting to 'realize' it is going<br>
to break badly (and is probably where your segfault is coming from).<br>
<br>
QEMU's device object model has a sort of multiple-phase creation:<br>
&nbsp;* &quot;init&quot; -- usually either by calling 'object_initialize()'=
 or<br>
&nbsp;&nbsp; 'object_initialize_child()' on some piece of already-allocated=
<br>
&nbsp;&nbsp; memory, or by calling 'object_new()' or 'qdev_create()' to<br>
&nbsp;&nbsp; do 'allocate and init'.<br>
&nbsp;* set properties on the device to configure it if necessary<br>
&nbsp;* &quot;realize&quot; (either by setting the 'realized' property, or =
by<br>
&nbsp;&nbsp; calling qdev_init_nofail())<br>
&nbsp;* then you can map its MMIO regions and connect its IRQ lines<br>
<br>
There are two styles of creating devices that you can find in<br>
QEMU code:<br>
&nbsp;* the older style uses qdev_* functions, which are usually<br>
&nbsp;&nbsp; more compact in terms of numbers of lines of source code.<br>
&nbsp;&nbsp; These families of functions create devices in newly allocated<=
br>
&nbsp;&nbsp; memory, so a &quot;container&quot; device like an SoC ends up =
with a<br>
&nbsp;&nbsp; state struct full of pointers to other devices.<br>
&nbsp;* a newer style tends to embed the sub-devices into the state<br>
&nbsp;&nbsp; struct of the container device, and thus uses object_initializ=
e_child()<br>
&nbsp;&nbsp; and similar object_* functions rather than the qdev functions.=
<br>
&nbsp;&nbsp; The SoC object usually does the &quot;init&quot; part of the c=
reation<br>
&nbsp;&nbsp; of its subdevices in its own &quot;init&quot; method, and the =
&quot;realize&quot;<br>
&nbsp;&nbsp; part in its own &quot;realize&quot;.<br>
<br>
Part of your problem here seems to be that you've taken code from<br>
an SoC object which uses the latter style and put it into a<br>
machine function where you haven't set up a proper subclass<br>
of MachineState, and also have only taken the 'realize' part<br>
and not the 'init' part. (Machines don't have split 'init' and<br>
'realize' methods, so the machine init function needs to do<br>
both things.)<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err !=3D NULL)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; //error_propagate(errp, err);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; return;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; busdev =3D SYS_BUS_DEV=
ICE(dev);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_mmio_map(busdev=
, 0, spi_addr[i]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_connect_irq(bus=
dev, 0, qdev_get_gpio_in(DEVICE(dev), spi_l0_irq[i]));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sysbus_connect_irq(bus=
dev, 0, qdev_get_gpio_in(DEVICE(dev), spi_l1_irq[i]));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
<br>
&gt;<br>
&gt; static void cortexR5_machine_init(MachineClass *mc){<br>
&gt;&nbsp;&nbsp;&nbsp; //mc-&gt;name =3D &quot;Cortex-R5f&quot;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; mc-&gt;desc =3D &quot;Based on TMS570LC43x&quo=
t;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; mc-&gt;init =3D&nbsp; cortexR5_initf;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; mc-&gt;max_cpus =3D 1;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; mc-&gt;ignore_memory_transaction_failures =3D =
true;<br>
<br>
This flag should never be set for new board models -- it is<br>
only present for handling legacy old boards where we don't<br>
know what guest code we might break by setting it to false.<br>
For new boards you can create the right devices for the guest<br>
code you care about to run. (There is an &quot;unimplemented-device&quot;<b=
r>
in hw/misc which can be used to stub out areas of memory where<br>
there are devices in hardware which you haven't written yet.)<br>
<br>
PS: if you run scripts/checkpatch.pl it will let you know about<br>
various minor coding style nits like brace placement and<br>
comment style that you might like to fix.<br>
<br>
thanks<br>
-- PMM<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_DB7PR04MB45050F871A204D198EBCADDAB99C0DB7PR04MB4505eurp_--
