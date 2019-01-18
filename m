Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2902652wrt;
        Fri, 18 Jan 2019 03:06:49 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7V8jjqMZ0SGXqCuf+SgQZItqoG53ZQSYGXaKxfdqgaZ/V+dUGtpnVevRL7eSftxo8Na1p3
X-Received: by 2002:a7b:c24c:: with SMTP id b12mr8616497wmj.29.1547809609494;
        Fri, 18 Jan 2019 03:06:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547809609; cv=none;
        d=google.com; s=arc-20160816;
        b=EVU2QYCvJvqIAcUssavghLyqoZtC47UKWdEtkpobYetnf3Og0mUh6G0nfbpfUemF8x
         ZFjNl/9lSkUh4i6ICmVAb44cADylDgRgo4KnE/lR8LJn3b/jwFXQV5E4zRaypevbpkHZ
         FBfsB8ZaGoKfqZL4NMpPMV648etXOJ3Al5j9O2IdOIMf515I6VfYUYmia7qjwE1gIKUm
         kT02ZdFR16g6WLRB0dknu2AMOxzWwq7lVNqHg9jgty/MRG7XpWJi+BAJZascS1XMvxwR
         ye1MGG8FqwYggjxE2ndJ4FGKhWh1mSOXrIUMRlm+TdF+ssEtKqJjlC+Vd1Dg56Y5x47r
         s46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=SQoFdrmXiU0BkrNDWtbBjMYLv54nPwNzvkEqGpINLHQ=;
        b=UHnPchnMPnmu6BXs4Ng48gFX13y0mZQL5sAztFn7pL/u1YKDyPyPLjMjhf2iIc05jx
         +MiXoNvKIUfBceU6rdWYo1QY7O4NsGGnYlkGlS/HB4ypCpU4AbD86ciaeBb6R7k8SPin
         mzjASetdKXkU3D3i4Yv1OlN+e3+mkStZuaaX8FoBKMHjiyl7rkPjMg4K1hZnlM8Ac2Ws
         OcihHh7mALXfO5oQ7QrsvV3YtYK3nrpozZIy4sSa9JhmnMjn6vkh3X3FjhPLuNyzhqm+
         MftK0Tq48kaMTsUxRGcbg8RBlHlLTk7v8+7mopMN9L4AGI2DeOL+V89/+eugxGtjE7b/
         HLEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tqI6fw8d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17si60492303wrp.108.2019.01.18.03.06.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Jan 2019 03:06:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tqI6fw8d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:36436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkRz6-0001zd-Bb
	for alex.bennee@linaro.org; Fri, 18 Jan 2019 06:06:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gkRyF-0001xH-UV
	for qemu-devel@nongnu.org; Fri, 18 Jan 2019 06:05:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gkRyC-0005zi-Er
	for qemu-devel@nongnu.org; Fri, 18 Jan 2019 06:05:55 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46595)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gkRyC-0005nz-3O; Fri, 18 Jan 2019 06:05:52 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l9so14461461wrt.13;
	Fri, 18 Jan 2019 03:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SQoFdrmXiU0BkrNDWtbBjMYLv54nPwNzvkEqGpINLHQ=;
	b=tqI6fw8d4DYkl7UzP1nmcyS5WITTskR8PuxFfhvO7a+kyKJp3QYj1cOEa0annMu+ba
	KFB/tNTkv9EEh5hzzEMuQRmYKOUs0TbM8Yd7ywwo3ZTapSGSgCXUtxYFwDl54suTpQhC
	9wYjKAwUWPrCkprW7TnFk+yr3HtCoy6oYHg5zM0/k69SpBR3vjgUcv0s4l7QMa+fU7Ce
	XmEt7c8ebRMePEWIj/mfce8WcMF7qPa+M2pIRZ40ObIZ3CNWRuLw25veg78wwj/iVXwe
	SonyzoaqJQrKAo1eq/E4Cv/OEJGXLr49760rwwEoXCBzeOGRnV3sDfWAN5sm5Lo5JiG7
	UYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=SQoFdrmXiU0BkrNDWtbBjMYLv54nPwNzvkEqGpINLHQ=;
	b=TCzJQnYy8GFI6dNUIEnVilLv/I/qk8vAjQsIzWsn4A2YPh44EjUgCDEwAkw0qfKO06
	dDadtvBHuTGrq4vI6GDslMhfbobDMrslAl+adORNutbuYza+2QyS/R0bRXMheXOcO+6B
	NHAfb1pvLTRhT3vuEqwGPmPvJ9G9vdY/uiRrNEHTpkAyORuidjk4FjVkv3WbNoVgKZji
	Kjup+rRvkztll2CsiZy1cX4LAu8gbDbyQ8IssxiccU2D8sq5uGjBHxz7S5KxmXZ5qcU6
	J5GeoEmguARu7B+1qLXWu0rz9k+xOQ5AvZ0MgvBbvhiPS/fUrjocic7nys415TGGmrdT
	lr0Q==
X-Gm-Message-State: AJcUukftzWmMfFYhGyhD4Pg78G4PGK4BDd9xnjWUNVfT6+IYFEkDr8VB
	dzT6GuoFspBpxn5TdMpH6VQ=
X-Received: by 2002:a05:6000:1287:: with SMTP id
	f7mr16726543wrx.302.1547809543070; 
	Fri, 18 Jan 2019 03:05:43 -0800 (PST)
Received: from [10.201.33.118] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	c15sm33301707wml.27.2019.01.18.03.05.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jan 2019 03:05:42 -0800 (PST)
To: KONRAD Frederic <frederic.konrad@adacore.com>,
	=?UTF-8?Q?Jo=c3=a3o_Gaspar?= <joaogaspar_csw_qemu@hotmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <DB7PR04MB4505EEB04A9500D8162463B9B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
	<DB7PR04MB45057508E2DF87EE77572CE3B9830@DB7PR04MB4505.eurprd04.prod.outlook.com>
	<dbf1160d-be81-741c-acef-aabcf99179a9@amsat.org>
	<32a14c0d-ca3b-f3aa-d277-9a15c9b8575e@adacore.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <aba0f3f3-c967-7edb-b172-216eb7d94766@amsat.org>
Date: Fri, 18 Jan 2019 12:05:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <32a14c0d-ca3b-f3aa-d277-9a15c9b8575e@adacore.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::42b
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
Cc: Julian Brown <julian@codesourcery.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 03RygUvX9RLk

On 1/18/19 11:14 AM, KONRAD Frederic wrote:
> Le 1/17/19 à 7:00 PM, Philippe Mathieu-Daudé a écrit :
>> On 1/17/19 5:54 PM, João Gaspar wrote:
>>> Hi!
>>> I'm new at QEMU so I have some questions.
>>>
>>> I'm trying to create a new support machine to QEMU, the TMS570LC43
>>> board, this board use the Cortex-R5f microcontroller.
>>> At this moment when I do the "qemu-system-arm -M help" my machine is
>>> showed with the name "cortex-r5".
>>
>> OMG why on Earth do you want to model a Hercules SoC? Speaking of
>> experience, I used to work with those and spend some time tring to model
>> them, I don't recommend this to you to start modelling an ARM SoC with
>> QEMU. So I'm curious to understand your goal here, is it for hobby or
>> univ/job assignment?
>> Do you plan to run real world firmwares or simple/generic programs?
>> Designed for Safety critical/Real-Time embedded world, it has plenty of
>> very specific features that a safe firmware should be using, thus making
>> the work of modelling very teddious.
>> Any unmodified firmware require you to implement the Clock Monitoring,
>> PBIST, and part of the ESM.
>> Also, you might be limited to run from SRAM then EMIF, because the flash
>> registers (F021) aren't public.
>> Also the CPU boots in Big Endian, and while QEMU backend support both
>> endianess, there are no ARM system booting BE, and you might encounter
>> weird bugs has it happened to me.
> 
> We have a TMS570 platform as well (very minimal though to boot our
> runtimes) and
> I can confirm that there are some endianness pain with this platform.

There also used to be GCC (now fixed) and newlib (in specs) bugs...
I.E. https://answers.launchpad.net/gcc-arm-embedded/+question/189066
'Support for Cortex-R4F Big-Endian' asked on 2012-02-28, last comment on
2018-06-11: "the tool chain does not support big-endian out of the box".

Frederic, one of my BE issues was fixed by this commit:
https://git.qemu.org/?p=qemu.git;a=commitdiff;h=98f52cdbb5c
"Fix access_with_adjusted_size(small size) on big-endian memory regions"

Also the Thumb code is now readable since this commit:
https://git.qemu.org/?p=qemu.git;a=commitdiff;h=f7478a92dd9
"Fix Thumb-1 BE32 execution and disassembly"

João, something that helped me quite a lot (I guess Peter Maydell
suggested it to me once at Connect) is to switch the CPU in
little-endian, then modelling on QEMU is somehow easier.
However at the time of my efforts, firmwares were only
TÜV/SÜD/SIL3/MISRA certifiable for BE, and the F021 libs were only
available for BE. At the time the LE series went out (RM48) I lost
interest and moved on.

An useful example of endianess switch is this test from Peter Crosthwaite:
https://github.com/pcrost/arm-be-test/blob/master/main.c#L36

Regards,

Phil.

> For the initial question it seems that you used "cortex-r5" in:
> 
>>>      DEFINE_MACHINE("cortex-r5", cortexR5_machine_init)
> 
> So expect the machine to be called like that.
> 
> Cheers,
> Fred
> 
>>
>> So if you don't have a strong reason, I'd redirect you to use another
>> ARM SoC.
>>
>>> The probleme start when I try to instaciate the machine with the comand
>>> "qemu-system-arm --machine cortex-r5 -cpu cortex-r5f", after that I
>>> received the message "segmentation fault (core dump)".
>>>
>>> Does anyone have an possible cause to my problem or an tip?
>>
>> Since this question isn't ARM specific but generic about QEMU machines,
>> I recommend you to also post to the qemu-devel@nongnu.org list (now
>> copied).
>>
>> You can have a more verbose debug output configuring QEMU as:
>>
>> ./configure ... --extra-cflags=--ggdb --enable-debug
>>
>> Regards,
>>
>> Phil.
>>
>>>
>>> I'm gonna let the code too, because probably I'm doing aniything wrong!
>>>
>>>      #include "qemu/osdep.h"
>>>      #include "qapi/error.h"
>>>      #include "qemu-common.h"
>>>      #include "hw/arm/arm.h"
>>>      #include "exec/address-spaces.h"
>>>      #include "qemu/error-report.h"
>>>      #include "qom/object.h"
>>>      #include "cpu.h"
>>>      #include "hw/sysbus.h"
>>>      #include "hw/arm/cortex-R5.h"
>>>
>>>      //RTI -> Real Time Interruption
>>>      //static const uint32_t RTI_addr = 0xFFFFFC00;
>>>
>>>      //SPI
>>>      static const uint32_t spi_addr[CR5_NUM_SPI] = {0xFFF7F400,
>>>      0xFFF7F600, 0xFFF7F800, 0xFFF7FA00, 0xFFF7FC00};
>>>      //I2C
>>>      static const uint32_t i2c_addr[CR5_NUM_I2C] = {0xFFF7D400,
>>> 0xFFF7D500};
>>>      //CAN
>>>      static const uint32_t can_addr[CR5_NUM_CAN] = {0XFFF7DC00,
>>>      0XFFF7DE00, 0X0FFF7E00, 0X0FFF7E200};
>>>      //ADC
>>>      static const uint32_t adc_addr[CR5_NUM_ADC] = {0xFFF7C000,
>>> 0xFFF7C200};
>>>      //GIO
>>>      static const uint32_t gio_addr[CR5_NUM_GIO] = {0xFFF7BC00};
>>>
>>>      /*IRQ
>>>      Interrupt Request Assignement
>>>      http://www.ti.com/lit/ds/spns195c/spns195c.pdf
>>>      Page: 118
>>>      */
>>>      //irq RTI
>>>      /* static const int rti_cmp_irq0 = 2;
>>>      static const int rti_cmp_irq1 = 3;
>>>      static const int rti_cmp_irq2 = 4;
>>>      static const int rti_cmp_irq3 = 5;
>>>      static const int rti_oflw_irq0 = 6;
>>>      static const int rti_oflw_irq1 = 7;
>>>      static const int rti_timebase_irq = 8; */
>>>      //irq SPI
>>>      static const int spi_l0_irq[CR5_NUM_SPI] = {12, 17, 37, 49, 53};
>>>      static const int spi_l1_irq[CR5_NUM_SPI] = {26, 30, 38, 54, 56};
>>>      //irq I2C
>>>      static const int i2c_irq[CR5_NUM_I2C] = {66, 114};
>>>      //irc CAN
>>>      static const int can_l0_irq[CR5_NUM_CAN] = {16, 35, 45, 113};
>>>      static const int can_l1_irq[CR5_NUM_CAN] = {29, 42, 55, 117};
>>>      static const int can_if3_irq[CR5_NUM_CAN] = {44, 46, 60, 120};
>>>      //irq ADC
>>>      static const int adc_swgroup1_irq[CR5_NUM_ADC] = {15, 51};
>>>      static const int adc_swgroup2_irq[CR5_NUM_ADC] = {28, 57};
>>>      static const int adc_eventgroup_irq[CR5_NUM_ADC] = {14, 50};
>>>      static const int adc_magnitudecmp_irq[CR5_NUM_ADC] = {31, 59};
>>>      //irq GIO
>>>      static const int gio_high_irq[CR5_NUM_GIO] = {9};
>>>      static const int gio_low_irq[CR5_NUM_GIO] = {23};
>>>
>>>
>>>      static void cortexR5_initf(MachineState *mc)
>>>      {
>>>          CORTEXR5State *s = g_new0(CORTEXR5State, 1);
>>>
>>>          DeviceState *dev;
>>>          SysBusDevice *busdev;
>>>          Error *err = NULL;
>>>
>>>          int i;
>>>          ARMCPU *cpu;
>>>
>>>
>>>          MemoryRegion *system_memory = get_system_memory();
>>>          MemoryRegion *ram = g_new(MemoryRegion, 1);
>>>          MemoryRegion *flash = g_new(MemoryRegion, 1);
>>>          MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
>>>
>>>        
>>>          //s->cr5_cpu = ARM_CPU(object_new(mc->cpu_type));
>>>          cpu = ARM_CPU(object_new(mc->cpu_type));
>>>
>>>          //object_initialize_child(obj, "cpu", &s->cr5_cpu,
>>>      sizeof(s->cr5_cpu), ARM_CPU_TYPE_NAME("cortex-r5f"), &error_abort,
>>>      NULL);
>>>          object_property_set_bool(OBJECT(cpu), true, "realized",
>>>      &error_fatal);
>>>
>>>          memory_region_init_ram(flash, NULL, "CORTEXR5.flash",
>>>      FLASH_SIZE, &error_fatal);
>>>
>>>          memory_region_init_alias(flash_alias, NULL,
>>>      "CORTEXR5.flash.alias", flash, 0, FLASH_SIZE);
>>>
>>>          memory_region_set_readonly(flash, true);
>>>          memory_region_set_readonly(flash_alias, true);
>>>
>>>          memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS,
>>>      flash);
>>>          memory_region_add_subregion(system_memory, 0, flash_alias);
>>>
>>>          memory_region_init_ram(ram, NULL, "CORTEXR5.ram", SRAM_SIZE,
>>>      &error_fatal);
>>>          memory_region_add_subregion(system_memory, RAM_BASE_ADDRESS,
>>> ram);
>>>
>>>          //SPI
>>>          for (i = 0; i < CR5_NUM_SPI; i++)
>>>          {
>>>              dev = DEVICE(&(s->spi[i]));
>>>              object_property_set_bool(OBJECT(&s->spi[i]), true,
>>>      "realized", &err);
>>>              if (err != NULL)
>>>              {
>>>                  //error_propagate(errp, err);
>>>                  return;
>>>              }
>>>              busdev = SYS_BUS_DEVICE(dev);
>>>              sysbus_mmio_map(busdev, 0, spi_addr[i]);
>>>              sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>>>      spi_l0_irq[i]));
>>>              sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>>>      spi_l1_irq[i]));
>>>          }
>>>
>>>          //I2C
>>>          for (i = 0; i < CR5_NUM_I2C; i++)
>>>          {
>>>              dev = DEVICE(&(s->i2c[i]));
>>>              object_property_set_bool(OBJECT(&s->i2c[i]), true,
>>>      "realized", &err);
>>>              if (err != NULL)
>>>              {
>>>                  //error_propagate(errp, err);
>>>                  return;
>>>              }
>>>              busdev = SYS_BUS_DEVICE(dev);
>>>              sysbus_mmio_map(busdev, 0, i2c_addr[i]);
>>>              sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>>>      i2c_irq[i]));
>>>          }
>>>
>>>          //CAN
>>>          for (i = 0; i < CR5_NUM_CAN; i++)
>>>          {
>>>              dev = DEVICE(&(s->can[i]));
>>>              object_property_set_bool(OBJECT(&s->can[i]), true,
>>>      "realized", &err);
>>>              if (err != NULL)
>>>              {
>>>                  //error_propagate(errp, err);
>>>                  return;
>>>              }
>>>              busdev = SYS_BUS_DEVICE(dev);
>>>              sysbus_mmio_map(busdev, 0, can_addr[i]);
>>>              sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>>>      can_l0_irq[i]));
>>>              sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>>>      can_l1_irq[i]));
>>>              sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>>>      can_if3_irq[i]));
>>>          }
>>>
>>>          //ADC
>>>          object_property_set_int(OBJECT(s->adc_irqs), CR5_NUM_ADC,
>>>      "num-lines", &err);
>>>          object_property_set_bool(OBJECT(s->adc_irqs), true, "realized",
>>>      &err);
>>>          if (err != NULL)
>>>          {
>>>              //error_propagate(errp, err);
>>>              return;
>>>          }
>>>         // qdev_connect_gpio_out(DEVICE(s->adc_irq), 0,
>>>      qdev_get_gpio_in(dev));
>>>
>>>          for (i = 0; i < CR5_NUM_ADC; i++)
>>>          {
>>>              dev = DEVICE(&(s->adc[i]));
>>>              object_property_set_bool(OBJECT(&s->adc[i]), true,
>>>      "realized", &err);
>>>              if (err != NULL)
>>>              {
>>>                  //error_propagate(errp, err);
>>>                  return;
>>>              }
>>>              busdev = SYS_BUS_DEVICE(dev);
>>>              sysbus_mmio_map(busdev, 0, adc_addr[i]);
>>>              sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>>>      adc_swgroup1_irq[i]));
>>>              sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>>>      adc_swgroup2_irq[i]));
>>>              sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>>>      adc_eventgroup_irq[i]));
>>>              sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>>>      adc_magnitudecmp_irq[i]));
>>>          }
>>>
>>>          //GIO
>>>          for (i = 0; i < CR5_NUM_GIO; i++)
>>>          {
>>>              dev = DEVICE(&(s->gio[i]));
>>>              object_property_set_bool(OBJECT(&s->gio[i]), true,
>>>      "realized", &err);
>>>              if (err != NULL)
>>>              {
>>>                  //error_propagate(errp, err);
>>>                  return;
>>>              }
>>>              busdev = SYS_BUS_DEVICE(dev);
>>>              sysbus_mmio_map(busdev, 0, gio_addr[i]);
>>>              sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>>>      gio_high_irq[i]));
>>>              sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(DEVICE(dev),
>>>      gio_low_irq[i]));
>>>          }
>>>      }
>>>
>>>
>>>
>>>      static void cortexR5_machine_init(MachineClass *mc){
>>>         //mc->name = "Cortex-R5f";
>>>          mc->desc = "Based on TMS570LC43x";
>>>          mc->init =  cortexR5_initf;
>>>          mc->max_cpus = 1;
>>>          mc->ignore_memory_transaction_failures = true;
>>>          mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-r5f");
>>>      }
>>>
>>>
>>>
>>>      DEFINE_MACHINE("cortex-r5", cortexR5_machine_init)
>>>
>>>
>>>
>>>
>>> Thanks in advanced,
>>>
>>> João Gaspar
>>>
>>> Enviado do Outlook <http://aka.ms/weboutlook>
>>
> 
