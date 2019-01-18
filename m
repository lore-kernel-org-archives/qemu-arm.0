Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2862237wrt;
        Fri, 18 Jan 2019 02:19:01 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5VzGizvSMmM6hzKzxxTRYhzIFDG0D1Ommy2UCed8d/OeGG1FxCquCQo6ZABgoMPGNZD4fZ
X-Received: by 2002:a1c:cf82:: with SMTP id f124mr15508902wmg.95.1547806741836;
        Fri, 18 Jan 2019 02:19:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547806741; cv=none;
        d=google.com; s=arc-20160816;
        b=imys9Z3oIVCb07w/SZyzEnve3eZ13v34EjlguCIME9tHSn3gW3eyMaHmgVrpxzRY9T
         hKco7A/W17dZK9FlA8jVrOX/3GQTF/sMgkMmgeSh20VI1+2foXZIdVCQ4H4nbI9VjIcI
         VDk6fGCm+u1kDX3JkHZCq8uXJN1dRYv+yk90oj2WCeCFhZwMGGL8WnowKPJMUqMcJAqk
         3Sx/V47k2RXD93VmBLd+8ENBMSoXluejmSlx455WKuYjAB8VcvDPoKOTY0blnbVYCoCs
         dH6S6xBKVIzZIOeEXzhSYVYD6o6JCE449IwZeGMGYfMDtXHTxwYswd9hVZVCFzkNaC/S
         dhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=U9E765YUc0K2k/pe+CeEPXAKPClrhar3d0KcyRv1qlc=;
        b=px149WmS4DRd0yUfBqgM41iIgFW5t3f6hUp10Y3SiZo5FZmMKbK4tCzJVAcOyumtih
         cfmlBJYFnnpkoAtkNlEwmn0VnUOhixR45C0l0mHMXWDlA0mJSoNudO8mGHM+m4DcsCyA
         TFpZYvBHRqkISbQrvMvR+7TuL0hM7c9jDcZdyRsLYnwZjX8dPJ1dQ+pTBZhLXBCytLvg
         1a1Xr06qNkhM8d7P5bUdMrb2oPum5tr1f411n4XkYGjPGu4xA8e4L4VxlppC7Z+EFYq0
         m12C+DxSWIo9FMdU70wPf2zAwUE1NkosKSzXY8NaqwEDBkoKZGBjEkHESVifCRJ9twBw
         4Asg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w72si27354851wme.155.2019.01.18.02.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Jan 2019 02:19:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:35552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkREq-00086C-QR
	for alex.bennee@linaro.org; Fri, 18 Jan 2019 05:19:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1gkRAn-0005r7-2K
	for qemu-devel@nongnu.org; Fri, 18 Jan 2019 05:14:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1gkRAl-0004kP-G9
	for qemu-devel@nongnu.org; Fri, 18 Jan 2019 05:14:49 -0500
Received: from mel.act-europe.fr ([2a02:2ab8:224:1::a0a:d2]:43466
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1gkRAh-0004Wo-BR; Fri, 18 Jan 2019 05:14:43 -0500
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 8222B8137A;
	Fri, 18 Jan 2019 11:14:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5MlP0S_Ebhg; Fri, 18 Jan 2019 11:14:27 +0100 (CET)
Received: from openvpn-soho-18.act-europe.fr (openvpn-soho-18.act-europe.fr
	[10.10.9.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id C5AB581339;
	Fri, 18 Jan 2019 11:14:26 +0100 (CET)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Jo=c3=a3o_Gaspar?= <joaogaspar_csw_qemu@hotmail.com>
References: <DB7PR04MB4505EEB04A9500D8162463B9B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
	<DB7PR04MB45057508E2DF87EE77572CE3B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
	<dbf1160d-be81-741c-acef-aabcf99179a9@amsat.org>
From: KONRAD Frederic <frederic.konrad@adacore.com>
Message-ID: <32a14c0d-ca3b-f3aa-d277-9a15c9b8575e@adacore.com>
Date: Fri, 18 Jan 2019 11:14:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <dbf1160d-be81-741c-acef-aabcf99179a9@amsat.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: fr
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a02:2ab8:224:1::a0a:d2
Subject: Re: [Qemu-devel] [Qemu-arm] Problems adding TMS570LC43 - Cortex-R5f
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pl5lgSxy/Tpc



Le 1/17/19 =E0 7:00 PM, Philippe Mathieu-Daud=E9 a =E9crit=A0:
> Hi,
>=20
> On 1/17/19 5:54 PM, Jo=E3o Gaspar wrote:
>> Hi!
>> I'm new at QEMU so I have some questions.
>>
>> I'm trying to create a new support machine to QEMU, the TMS570LC43
>> board, this board use the Cortex-R5f microcontroller.
>> At this moment when I do the "qemu-system-arm -M help" my machine is
>> showed with the name "cortex-r5".
>=20
> OMG why on Earth do you want to model a Hercules SoC? Speaking of
> experience, I used to work with those and spend some time tring to mode=
l
> them, I don't recommend this to you to start modelling an ARM SoC with
> QEMU. So I'm curious to understand your goal here, is it for hobby or
> univ/job assignment?
> Do you plan to run real world firmwares or simple/generic programs?
> Designed for Safety critical/Real-Time embedded world, it has plenty of
> very specific features that a safe firmware should be using, thus makin=
g
> the work of modelling very teddious.
> Any unmodified firmware require you to implement the Clock Monitoring,
> PBIST, and part of the ESM.
> Also, you might be limited to run from SRAM then EMIF, because the flas=
h
> registers (F021) aren't public.
> Also the CPU boots in Big Endian, and while QEMU backend support both
> endianess, there are no ARM system booting BE, and you might encounter
> weird bugs has it happened to me.

We have a TMS570 platform as well (very minimal though to boot our runtim=
es) and
I can confirm that there are some endianness pain with this platform.

For the initial question it seems that you used "cortex-r5" in:

 >>      DEFINE_MACHINE("cortex-r5", cortexR5_machine_init)

So expect the machine to be called like that.

Cheers,
Fred

>=20
> So if you don't have a strong reason, I'd redirect you to use another
> ARM SoC.
>=20
>> The probleme start when I try to instaciate the machine with the coman=
d
>> "qemu-system-arm --machine cortex-r5 -cpu cortex-r5f", after that I
>> received the message "segmentation fault (core dump)".
>>
>> Does anyone have an possible cause to my problem or an tip?
>=20
> Since this question isn't ARM specific but generic about QEMU machines,
> I recommend you to also post to the qemu-devel@nongnu.org list (now cop=
ied).
>=20
> You can have a more verbose debug output configuring QEMU as:
>=20
> ./configure ... --extra-cflags=3D--ggdb --enable-debug
>=20
> Regards,
>=20
> Phil.
>=20
>>
>> I'm gonna let the code too, because probably I'm doing aniything wrong=
!
>>
>>      #include "qemu/osdep.h"
>>      #include "qapi/error.h"
>>      #include "qemu-common.h"
>>      #include "hw/arm/arm.h"
>>      #include "exec/address-spaces.h"
>>      #include "qemu/error-report.h"
>>      #include "qom/object.h"
>>      #include "cpu.h"
>>      #include "hw/sysbus.h"
>>      #include "hw/arm/cortex-R5.h"
>>
>>      //RTI -> Real Time Interruption
>>      //static const uint32_t RTI_addr =3D 0xFFFFFC00;
>>
>>      //SPI
>>      static const uint32_t spi_addr[CR5_NUM_SPI] =3D {0xFFF7F400,
>>      0xFFF7F600, 0xFFF7F800, 0xFFF7FA00, 0xFFF7FC00};
>>      //I2C
>>      static const uint32_t i2c_addr[CR5_NUM_I2C] =3D {0xFFF7D400, 0xFF=
F7D500};
>>      //CAN
>>      static const uint32_t can_addr[CR5_NUM_CAN] =3D {0XFFF7DC00,
>>      0XFFF7DE00, 0X0FFF7E00, 0X0FFF7E200};
>>      //ADC
>>      static const uint32_t adc_addr[CR5_NUM_ADC] =3D {0xFFF7C000, 0xFF=
F7C200};
>>      //GIO
>>      static const uint32_t gio_addr[CR5_NUM_GIO] =3D {0xFFF7BC00};
>>
>>      /*IRQ
>>      Interrupt Request Assignement
>>      http://www.ti.com/lit/ds/spns195c/spns195c.pdf
>>      Page: 118
>>      */
>>      //irq RTI
>>      /* static const int rti_cmp_irq0 =3D 2;
>>      static const int rti_cmp_irq1 =3D 3;
>>      static const int rti_cmp_irq2 =3D 4;
>>      static const int rti_cmp_irq3 =3D 5;
>>      static const int rti_oflw_irq0 =3D 6;
>>      static const int rti_oflw_irq1 =3D 7;
>>      static const int rti_timebase_irq =3D 8; */
>>      //irq SPI
>>      static const int spi_l0_irq[CR5_NUM_SPI] =3D {12, 17, 37, 49, 53}=
;
>>      static const int spi_l1_irq[CR5_NUM_SPI] =3D {26, 30, 38, 54, 56}=
;
>>      //irq I2C
>>      static const int i2c_irq[CR5_NUM_I2C] =3D {66, 114};
>>      //irc CAN
>>      static const int can_l0_irq[CR5_NUM_CAN] =3D {16, 35, 45, 113};
>>      static const int can_l1_irq[CR5_NUM_CAN] =3D {29, 42, 55, 117};
>>      static const int can_if3_irq[CR5_NUM_CAN] =3D {44, 46, 60, 120};
>>      //irq ADC
>>      static const int adc_swgroup1_irq[CR5_NUM_ADC] =3D {15, 51};
>>      static const int adc_swgroup2_irq[CR5_NUM_ADC] =3D {28, 57};
>>      static const int adc_eventgroup_irq[CR5_NUM_ADC] =3D {14, 50};
>>      static const int adc_magnitudecmp_irq[CR5_NUM_ADC] =3D {31, 59};
>>      //irq GIO
>>      static const int gio_high_irq[CR5_NUM_GIO] =3D {9};
>>      static const int gio_low_irq[CR5_NUM_GIO] =3D {23};
>>
>>
>>      static void cortexR5_initf(MachineState *mc)
>>      {
>>      =A0 =A0 CORTEXR5State *s =3D g_new0(CORTEXR5State, 1);
>>
>>      =A0 =A0 DeviceState *dev;
>>      =A0 =A0 SysBusDevice *busdev;
>>      =A0 =A0 Error *err =3D NULL;
>>
>>      =A0 =A0 int i;
>>      =A0 =A0 ARMCPU *cpu;
>>
>>
>>      =A0 =A0 MemoryRegion *system_memory =3D get_system_memory();
>>      =A0 =A0 MemoryRegion *ram =3D g_new(MemoryRegion, 1);
>>      =A0 =A0 MemoryRegion *flash =3D g_new(MemoryRegion, 1);
>>      =A0 =A0 MemoryRegion *flash_alias =3D g_new(MemoryRegion, 1);
>>
>>        =20
>>
>>      =A0 =A0 //s->cr5_cpu =3D ARM_CPU(object_new(mc->cpu_type));
>>      =A0 =A0 cpu =3D ARM_CPU(object_new(mc->cpu_type));
>>
>>      =A0 =A0 //object_initialize_child(obj, "cpu", &s->cr5_cpu,
>>      sizeof(s->cr5_cpu), ARM_CPU_TYPE_NAME("cortex-r5f"), &error_abort=
,
>>      NULL);
>>      =A0 =A0 object_property_set_bool(OBJECT(cpu), true, "realized",
>>      &error_fatal);
>>
>>      =A0 =A0 memory_region_init_ram(flash, NULL, "CORTEXR5.flash",
>>      FLASH_SIZE, &error_fatal);
>>
>>      =A0 =A0 memory_region_init_alias(flash_alias, NULL,
>>      "CORTEXR5.flash.alias", flash, 0, FLASH_SIZE);
>>
>>      =A0 =A0 memory_region_set_readonly(flash, true);
>>      =A0 =A0 memory_region_set_readonly(flash_alias, true);
>>
>>      =A0 =A0 memory_region_add_subregion(system_memory, FLASH_BASE_ADD=
RESS,
>>      flash);
>>      =A0 =A0 memory_region_add_subregion(system_memory, 0, flash_alias=
);
>>
>>      =A0 =A0 memory_region_init_ram(ram, NULL, "CORTEXR5.ram", SRAM_SI=
ZE,
>>      &error_fatal);
>>      =A0 =A0 memory_region_add_subregion(system_memory, RAM_BASE_ADDRE=
SS, ram);
>>
>>      =A0 =A0 //SPI
>>      =A0 =A0 for (i =3D 0; i < CR5_NUM_SPI; i++)
>>      =A0 =A0 {
>>      =A0 =A0 =A0 =A0 dev =3D DEVICE(&(s->spi[i]));
>>      =A0 =A0 =A0 =A0 object_property_set_bool(OBJECT(&s->spi[i]), true=
,
>>      "realized", &err);
>>      =A0 =A0 =A0 =A0 if (err !=3D NULL)
>>      =A0 =A0 =A0 =A0 {
>>      =A0 =A0 =A0 =A0 =A0 =A0 //error_propagate(errp, err);
>>      =A0 =A0 =A0 =A0 =A0 =A0 return;
>>      =A0 =A0 =A0 =A0 }
>>      =A0 =A0 =A0 =A0 busdev =3D SYS_BUS_DEVICE(dev);
>>      =A0 =A0 =A0 =A0 sysbus_mmio_map(busdev, 0, spi_addr[i]);
>>      =A0 =A0 =A0 =A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DE=
VICE(dev),
>>      spi_l0_irq[i]));
>>      =A0 =A0 =A0 =A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DE=
VICE(dev),
>>      spi_l1_irq[i]));
>>      =A0 =A0 }
>>
>>      =A0 =A0 //I2C
>>      =A0 =A0 for (i =3D 0; i < CR5_NUM_I2C; i++)
>>      =A0 =A0 {
>>      =A0 =A0 =A0 =A0 dev =3D DEVICE(&(s->i2c[i]));
>>      =A0 =A0 =A0 =A0 object_property_set_bool(OBJECT(&s->i2c[i]), true=
,
>>      "realized", &err);
>>      =A0 =A0 =A0 =A0 if (err !=3D NULL)
>>      =A0 =A0 =A0 =A0 {
>>      =A0 =A0 =A0 =A0 =A0 =A0 //error_propagate(errp, err);
>>      =A0 =A0 =A0 =A0 =A0 =A0 return;
>>      =A0 =A0 =A0 =A0 }
>>      =A0 =A0 =A0 =A0 busdev =3D SYS_BUS_DEVICE(dev);
>>      =A0 =A0 =A0 =A0 sysbus_mmio_map(busdev, 0, i2c_addr[i]);
>>      =A0 =A0 =A0 =A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DE=
VICE(dev),
>>      i2c_irq[i]));
>>      =A0 =A0 }
>>
>>      =A0 =A0 //CAN
>>      =A0 =A0 for (i =3D 0; i < CR5_NUM_CAN; i++)
>>      =A0 =A0 {
>>      =A0 =A0 =A0 =A0 dev =3D DEVICE(&(s->can[i]));
>>      =A0 =A0 =A0 =A0 object_property_set_bool(OBJECT(&s->can[i]), true=
,
>>      "realized", &err);
>>      =A0 =A0 =A0 =A0 if (err !=3D NULL)
>>      =A0 =A0 =A0 =A0 {
>>      =A0 =A0 =A0 =A0 =A0 =A0 //error_propagate(errp, err);
>>      =A0 =A0 =A0 =A0 =A0 =A0 return;
>>      =A0 =A0 =A0 =A0 }
>>      =A0 =A0 =A0 =A0 busdev =3D SYS_BUS_DEVICE(dev);
>>      =A0 =A0 =A0 =A0 sysbus_mmio_map(busdev, 0, can_addr[i]);
>>      =A0 =A0 =A0 =A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DE=
VICE(dev),
>>      can_l0_irq[i]));
>>      =A0 =A0 =A0 =A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DE=
VICE(dev),
>>      can_l1_irq[i]));
>>      =A0 =A0 =A0 =A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DE=
VICE(dev),
>>      can_if3_irq[i]));
>>      =A0 =A0 }
>>
>>      =A0 =A0 //ADC
>>      =A0 =A0 object_property_set_int(OBJECT(s->adc_irqs), CR5_NUM_ADC,
>>      "num-lines", &err);
>>      =A0 =A0 object_property_set_bool(OBJECT(s->adc_irqs), true, "real=
ized",
>>      &err);
>>      =A0 =A0 if (err !=3D NULL)
>>      =A0 =A0 {
>>      =A0 =A0 =A0 =A0 //error_propagate(errp, err);
>>      =A0 =A0 =A0 =A0 return;
>>      =A0 =A0 }
>>      =A0 =A0// qdev_connect_gpio_out(DEVICE(s->adc_irq), 0,
>>      qdev_get_gpio_in(dev));
>>
>>      =A0 =A0 for (i =3D 0; i < CR5_NUM_ADC; i++)
>>      =A0 =A0 {
>>      =A0 =A0 =A0 =A0 dev =3D DEVICE(&(s->adc[i]));
>>      =A0 =A0 =A0 =A0 object_property_set_bool(OBJECT(&s->adc[i]), true=
,
>>      "realized", &err);
>>      =A0 =A0 =A0 =A0 if (err !=3D NULL)
>>      =A0 =A0 =A0 =A0 {
>>      =A0 =A0 =A0 =A0 =A0 =A0 //error_propagate(errp, err);
>>      =A0 =A0 =A0 =A0 =A0 =A0 return;
>>      =A0 =A0 =A0 =A0 }
>>      =A0 =A0 =A0 =A0 busdev =3D SYS_BUS_DEVICE(dev);
>>      =A0 =A0 =A0 =A0 sysbus_mmio_map(busdev, 0, adc_addr[i]);
>>      =A0 =A0 =A0 =A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DE=
VICE(dev),
>>      adc_swgroup1_irq[i]));
>>      =A0 =A0 =A0 =A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DE=
VICE(dev),
>>      adc_swgroup2_irq[i]));
>>      =A0 =A0 =A0 =A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DE=
VICE(dev),
>>      adc_eventgroup_irq[i]));
>>      =A0 =A0 =A0 =A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DE=
VICE(dev),
>>      adc_magnitudecmp_irq[i]));
>>      =A0 =A0 }
>>
>>      =A0 =A0 //GIO
>>      =A0 =A0 for (i =3D 0; i < CR5_NUM_GIO; i++)
>>      =A0 =A0 {
>>      =A0 =A0 =A0 =A0 dev =3D DEVICE(&(s->gio[i]));
>>      =A0 =A0 =A0 =A0 object_property_set_bool(OBJECT(&s->gio[i]), true=
,
>>      "realized", &err);
>>      =A0 =A0 =A0 =A0 if (err !=3D NULL)
>>      =A0 =A0 =A0 =A0 {
>>      =A0 =A0 =A0 =A0 =A0 =A0 //error_propagate(errp, err);
>>      =A0 =A0 =A0 =A0 =A0 =A0 return;
>>      =A0 =A0 =A0 =A0 }
>>      =A0 =A0 =A0 =A0 busdev =3D SYS_BUS_DEVICE(dev);
>>      =A0 =A0 =A0 =A0 sysbus_mmio_map(busdev, 0, gio_addr[i]);
>>      =A0 =A0 =A0 =A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DE=
VICE(dev),
>>      gio_high_irq[i]));
>>      =A0 =A0 =A0 =A0 sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DE=
VICE(dev),
>>      gio_low_irq[i]));
>>      =A0 =A0 }
>>      }
>>
>>
>>
>>      static void cortexR5_machine_init(MachineClass *mc){
>>      =A0 =A0//mc->name =3D "Cortex-R5f";
>>      =A0 =A0 mc->desc =3D "Based on TMS570LC43x";
>>      =A0 =A0 mc->init =3D =A0cortexR5_initf;
>>      =A0 =A0 mc->max_cpus =3D 1;
>>      =A0 =A0 mc->ignore_memory_transaction_failures =3D true;
>>      =A0 =A0 mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-r5f");
>>      }
>>
>>
>>
>>      DEFINE_MACHINE("cortex-r5", cortexR5_machine_init)
>>
>>
>>
>>
>> Thanks in advanced,
>>
>> Jo=E3o Gaspar
>>
>> Enviado do Outlook <http://aka.ms/weboutlook>
>=20
