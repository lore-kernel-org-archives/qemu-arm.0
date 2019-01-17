Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2108818wrt;
        Thu, 17 Jan 2019 10:01:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7dV9Z4H5pMIIxg1wsWSziy4UOrno37U7kvPmzrs8ObJCNLh1AkJNzA3K6kz/IjWgZFA7Z0
X-Received: by 2002:a1c:a401:: with SMTP id n1mr13368167wme.101.1547748089901;
        Thu, 17 Jan 2019 10:01:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547748089; cv=none;
        d=google.com; s=arc-20160816;
        b=tRzN0rgTn4RolPbBrWVAdJDngK79BzscYGteKiqhF//MJXfsMTNzLzWzfKZZxY0b2e
         O37gMypqeoUAvaiPIB368ve+A4sFi+vkajDwR7+o3cO4s1u3xJF1rUqb8r8IL9ls8DDI
         ZsnkpCiCyLgFuQLtXU3PnY0lbI87lQAOp8SuDgSUh4SLgXU0F046bPWQeXn/RLpJJCsF
         7b4wILewViymRbJMIqeAsKc+/iv58hUE3hKjLoEScyswrkJnNIZ9zp5IyMYvuFkeO8Xj
         jahVDTTy7Ibj2rIHYNMIVpBUddu0B2ruZc2deCLK140bBChu4EfDaKxamA+zrknJYNC5
         mz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=FzgG91XwW/a3jXCwy1wpAozppi6ibvEsO2hBXILQrRQ=;
        b=n+ctAwGh6byEDiferWi+lSOrSQPRGzoKe7xn2Nn81tYw6/afW51DrpxVLGd+Inqj9n
         2dW54JGTIT6V2erDCktDHW/e+DCsL6fLf+szNYlNYSQLUEjilbScmhrcI4PE2pvybfW4
         06MIh9U6HfM1L9FnNB2ZjAzkKlTXsGvhhw2hSC8Wp39UVngfMWefg4dk1EI1vnVCSJou
         4KQ56zHve1k3sOJV2jgpbZlcPTrYhrquqkD4m7HvQJ+mCvYt5RPYCelCjN8tYH3/lIfU
         VNAil6GpHQ3M03HlYtsox4MM+FBn+2zDIkkPl6O14hs8+gnPnh4ITHMXt/r8wUJfUOcE
         1aGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=joGBu6Bu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si54262601wre.392.2019.01.17.10.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Jan 2019 10:01:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=joGBu6Bu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49275 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkByq-0003Fc-Ou
	for alex.bennee@linaro.org; Thu, 17 Jan 2019 13:01:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkByK-0002yD-Ba
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 13:00:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkByH-0001Q6-KJ
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 13:00:56 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:36336)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gkByH-0001I4-6v
	for qemu-arm@nongnu.org; Thu, 17 Jan 2019 13:00:53 -0500
Received: by mail-oi1-x232.google.com with SMTP id x23so6876745oix.3
	for <qemu-arm@nongnu.org>; Thu, 17 Jan 2019 10:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FzgG91XwW/a3jXCwy1wpAozppi6ibvEsO2hBXILQrRQ=;
	b=joGBu6ButyFyADQBrUy4mh1oL9z4kYwlxV5vALa9BJg20DBZPlLaAUcl9KvBHqrLXA
	ufqKlPu6TJiK2N01Pa5tk6+MjJTA9UR3yGBe8e1e/eNxFnLXw8qio+aKApEUYDJ0dnbV
	LOy9gEmk9HK6NIMNaod1kcVxvcPqp48g7vwPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FzgG91XwW/a3jXCwy1wpAozppi6ibvEsO2hBXILQrRQ=;
	b=U83HhjZM+sRiQ0vEfN0Dm253NdJADx0/y+slFl+hiXqa0HJFdPBDbRld59MlWfGVqg
	dByOP+vx7NjF/njU393Tgj9uP1+8UOiDejmsOIuyHAvRA/RH9HnrXHPaDQxCgpR/Gd1n
	A1NvvYioi9uYjE7IlZuB5bBzybCYhJnLn4Co3JGi9wAmgxM516kT7W6qSyBYWnuY1/eU
	tPgg3vHnw/b7LKHwpqGCZ1BoRu3DWrxN+KkrcB7/Zv2x2k6hC9wNt8q3zXoIqveJT/oy
	bBS8ByLJCy4uROFLG8m93wDybS859sNOU3uyZn/M5VrXKXW9tON4ZRQTWAQ+rS83vczX
	pcpw==
X-Gm-Message-State: AJcUukfVuyjCt/d1EzuAs3eBgEIfmeWS2ti851iJEZOZGEyQ7mMpIKJs
	qdScQcqk5vQbUEKYAUiVyl5XiwIHhvZGF4jb3+fe0w==
X-Received: by 2002:aca:b58b:: with SMTP id e133mr687280oif.25.1547748048995; 
	Thu, 17 Jan 2019 10:00:48 -0800 (PST)
MIME-Version: 1.0
References: <DB7PR04MB4505EEB04A9500D8162463B9B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
	<DB7PR04MB45057508E2DF87EE77572CE3B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB45057508E2DF87EE77572CE3B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Jan 2019 18:00:36 +0000
Message-ID: <CAFEAcA_4zpaGG5aV_Yy7vnXKdcuoBj3Q0jPFXYNnBRyjaK3CqQ@mail.gmail.com>
To: =?UTF-8?B?Sm/Do28gR2FzcGFy?= <joaogaspar_csw_qemu@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::232
Subject: Re: [Qemu-arm] Problems adding TMS570LC43 - Cortex-R5f
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iXaQt82awSJ4

On Thu, 17 Jan 2019 at 17:20, Jo=C3=A3o Gaspar
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
