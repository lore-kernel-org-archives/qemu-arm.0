Received: by 10.103.98.197 with SMTP id w188csp343178vsb;
        Tue, 21 Feb 2017 03:35:31 -0800 (PST)
X-Received: by 10.200.42.243 with SMTP id c48mr6897939qta.74.1487676931422;
        Tue, 21 Feb 2017 03:35:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si14897832qkc.197.2017.02.21.03.35.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 03:35:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43826 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cg8jC-0005H9-S1
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 06:35:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cg8j6-0005FM-Up
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 06:35:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cg8j5-0007dC-Ut
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 06:35:25 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:36620)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cg8j5-0007d3-PK; Tue, 21 Feb 2017 06:35:23 -0500
Received: by mail-oi0-x241.google.com with SMTP id l128so163234oia.3;
	Tue, 21 Feb 2017 03:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=BF48pq/wuPIiAguCdG46oPV2TeLweDdPyySdtbmTkIM=;
	b=d0iebC+4HlPfc+jsC0vfDnYKZ/zztGkbGe/yarlcEOP7Uh2Lm1GI76g1eTEYEUUpMM
	gsB8XpcnP4N43DHemYPP1Ev14vhU44af31zAGBzhoN1k925n+zjUteG/mzrE/NAEdsaS
	H6w/nuxAyWZOEw+BhlJTov1NW8n9TI7EBCgZp2H190eA+VKuFdEtCn7JY3++lHjiFvX8
	UVUF2vJS063nvNuIpuYNmIeNJmRHqzRUK6PemzP9D0yJwCkW8bL6aLwNhwTwM0D20Pd7
	vk8QxKOTzsYWCZu1/f7Ka29AU3uvECFGU9XTpQofguppg7ouh/zxKngCzs/++voTNe51
	NZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=BF48pq/wuPIiAguCdG46oPV2TeLweDdPyySdtbmTkIM=;
	b=GEsGBauR52pFL4HZCpyua7TfEsHsGTPjLNm3NfsPA2TWKTT4i/shc9nOgvvDB+zhSX
	3tzLCDsp8sYImNZ+WaymqbN8s/uWy+VHIqLexNALD2UqAnINY6KOdld09gZ63GgxiRsy
	uDWhebdQWizteqb2eLJoi0hCQXKtyRKc+w+U4OqoHl7apjNZi+hP9Z1b5pJPZinvLTbi
	rRB+T/Hm14Lg8pSPt3LO4Qrc5euLOS0ZaoFoWgCkhMA3lPxoo5ceR8XifmZMqhTpm6zK
	Yl0uMM1tgAQwET2ghZQFhPwdm3tasAVfPXzDPfoC9L0y750FvFOtZ0Ql24yQbgyXlzI8
	Z/lQ==
X-Gm-Message-State: AMke39mNhdB5En/U5ve/OECFB2kt0JjDRP2YKBSThmKchFzFPy4Au7OladA1D6yaRxqm8mqlM/Kecc85y/w+7A==
X-Received: by 10.202.252.216 with SMTP id a207mr11910761oii.98.1487676923107; 
	Tue, 21 Feb 2017 03:35:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.183.26.67 with HTTP; Tue, 21 Feb 2017 03:34:52 -0800 (PST)
In-Reply-To: <5ff4146f-3ec0-615e-ff57-6df1041662ba@amsat.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
	<1487604965-23220-12-git-send-email-peter.maydell@linaro.org>
	<5ff4146f-3ec0-615e-ff57-6df1041662ba@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Feb 2017 03:34:52 -0800
Message-ID: <CAKmqyKPd-GZ8fhBQkpP4KQc0EOiufu0OXBpzCr1gXzCMAuKvSA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH 11/11] stm32f205: Rename 'nvic' local to
 'armv7m'
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
	Michael Davidsaver <mdavidsaver@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /wT1RLAH9ahv

On Mon, Feb 20, 2017 at 9:46 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 02/20/2017 12:36 PM, Peter Maydell wrote:
>>
>> The local variable 'nvic' in stm32f205_soc_realize() no longer
>> holds a direct pointer to the NVIC device; it is a pointer to
>> the ARMv7M container object. Rename it 'armv7m' accordingly.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

>
>
>> ---
>>  hw/arm/stm32f205_soc.c | 18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
>> index e6bd73a..6e1260d 100644
>> --- a/hw/arm/stm32f205_soc.c
>> +++ b/hw/arm/stm32f205_soc.c
>> @@ -85,7 +85,7 @@ static void stm32f205_soc_initfn(Object *obj)
>>  static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
>>  {
>>      STM32F205State *s =3D STM32F205_SOC(dev_soc);
>> -    DeviceState *dev, *nvic;
>> +    DeviceState *dev, *armv7m;
>>      SysBusDevice *busdev;
>>      Error *err =3D NULL;
>>      int i;
>> @@ -113,9 +113,9 @@ static void stm32f205_soc_realize(DeviceState
>> *dev_soc, Error **errp)
>>      vmstate_register_ram_global(sram);
>>      memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram)=
;
>>
>> -    nvic =3D DEVICE(&s->armv7m);
>> -    qdev_prop_set_uint32(nvic, "num-irq", 96);
>> -    qdev_prop_set_string(nvic, "cpu-model", s->cpu_model);
>> +    armv7m =3D DEVICE(&s->armv7m);
>> +    qdev_prop_set_uint32(armv7m, "num-irq", 96);
>> +    qdev_prop_set_string(armv7m, "cpu-model", s->cpu_model);
>>      object_property_set_link(OBJECT(&s->armv7m),
>> OBJECT(get_system_memory()),
>>                                       "memory", &error_abort);
>>      object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err=
);
>> @@ -133,7 +133,7 @@ static void stm32f205_soc_realize(DeviceState
>> *dev_soc, Error **errp)
>>      }
>>      busdev =3D SYS_BUS_DEVICE(dev);
>>      sysbus_mmio_map(busdev, 0, 0x40013800);
>> -    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic, 71));
>> +    sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m, 71));
>>
>>      /* Attach UART (uses USART registers) and USART controllers */
>>      for (i =3D 0; i < STM_NUM_USARTS; i++) {
>> @@ -147,7 +147,7 @@ static void stm32f205_soc_realize(DeviceState
>> *dev_soc, Error **errp)
>>          }
>>          busdev =3D SYS_BUS_DEVICE(dev);
>>          sysbus_mmio_map(busdev, 0, usart_addr[i]);
>> -        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic,
>> usart_irq[i]));
>> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m,
>> usart_irq[i]));
>>      }
>>
>>      /* Timer 2 to 5 */
>> @@ -161,7 +161,7 @@ static void stm32f205_soc_realize(DeviceState
>> *dev_soc, Error **errp)
>>          }
>>          busdev =3D SYS_BUS_DEVICE(dev);
>>          sysbus_mmio_map(busdev, 0, timer_addr[i]);
>> -        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic,
>> timer_irq[i]));
>> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m,
>> timer_irq[i]));
>>      }
>>
>>      /* ADC 1 to 3 */
>> @@ -173,7 +173,7 @@ static void stm32f205_soc_realize(DeviceState
>> *dev_soc, Error **errp)
>>          return;
>>      }
>>      qdev_connect_gpio_out(DEVICE(s->adc_irqs), 0,
>> -                          qdev_get_gpio_in(nvic, ADC_IRQ));
>> +                          qdev_get_gpio_in(armv7m, ADC_IRQ));
>>
>>      for (i =3D 0; i < STM_NUM_ADCS; i++) {
>>          dev =3D DEVICE(&(s->adc[i]));
>> @@ -198,7 +198,7 @@ static void stm32f205_soc_realize(DeviceState
>> *dev_soc, Error **errp)
>>          }
>>          busdev =3D SYS_BUS_DEVICE(dev);
>>          sysbus_mmio_map(busdev, 0, spi_addr[i]);
>> -        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(nvic,
>> spi_irq[i]));
>> +        sysbus_connect_irq(busdev, 0, qdev_get_gpio_in(armv7m,
>> spi_irq[i]));
>>      }
>>  }
>>
>>
>
