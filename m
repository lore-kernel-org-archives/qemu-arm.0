Received: by 10.103.98.197 with SMTP id w188csp343647vsb;
        Tue, 21 Feb 2017 03:36:50 -0800 (PST)
X-Received: by 10.237.34.125 with SMTP id o58mr23452264qtc.95.1487677010476;
        Tue, 21 Feb 2017 03:36:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c44si14901422qtc.314.2017.02.21.03.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 03:36:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cg8kT-0006Js-Ti
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 06:36:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cg8jG-0005Mt-Ra
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 06:35:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cg8jF-0007gW-Ld
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 06:35:34 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33615)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cg8jF-0007g7-Hz; Tue, 21 Feb 2017 06:35:33 -0500
Received: by mail-oi0-x244.google.com with SMTP id 2so4653499oif.0;
	Tue, 21 Feb 2017 03:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=xg/oWa50s3mua3fXKIbMAYY3psrTfhRxohhHfQQ1KHo=;
	b=NetHusGoG5pDH7+a+3uIRFtIxM4zpg8fGUQ8IFgVnW/kNbPH7/Q/4kj0TiRHKk4BqZ
	o69+BdHUUr5A3za3AzUzNJ+bA84+/MOLLMxNqBKdJoDoMh9MG/m/hSDmPSGdBDnFkEXn
	Z2edKghFKKuYaJgeczXnkg4o8Nr2QuHvYudR/CFaI+W36VpG8BTU2W7XMmadVY4D62YF
	IvDgEz1mBvVh2MozfsRsg4AjvY1sAngZJaTqt9giVqdhtFtBAdwOhC85uGd1dU9zIIUE
	T+qAsD1j85RqgAxJnt2atXxS8qYBFem60inF93fs6MP4MqnFtSLL2TaVFEcAEeaWD6ZB
	uB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=xg/oWa50s3mua3fXKIbMAYY3psrTfhRxohhHfQQ1KHo=;
	b=AucJnTe0KN224us934TwW8S7luw7LuG52PyGTF/q681jc/Kuh1OFMilMR3PPGVd/yL
	BHo+xPDRTzJ9ke10vcCUyIX25UcczsZgHwVVyJBUx3QRh3uMSJAxD+EcsEMUkcnolka9
	iT8RSH2bDFGmuKpTq5/i7mu1h0ptFRaCHp4/NwduPsa6hWUkyR2eBs2Dg4ULPX7ew3lA
	O7yLxFlgCY3XiLZRcen7ciqqMgWU4EIjIfwXSRrxrLgkDpgM0DesVIz58eo3EfjKB01L
	tvAoxa6VE/dDpzRRl6Oq59FxtWILDib2P0ci9Zw8xtiwIMtAQSEJNyH6PTT1VqumTogO
	8RFw==
X-Gm-Message-State: AMke39nGxc52ivofqSsyrrAU4NsEt2YXGlzZsiYH4I18X+j9pU7lvkwcohPz3KtUcMiQUx6jSaDeEzfL3bkrUw==
X-Received: by 10.202.76.146 with SMTP id z140mr14126800oia.68.1487676932840; 
	Tue, 21 Feb 2017 03:35:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.183.26.67 with HTTP; Tue, 21 Feb 2017 03:35:02 -0800 (PST)
In-Reply-To: <e6ebfe0d-c866-e28e-2366-d55ac5d77d47@amsat.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
	<1487604965-23220-2-git-send-email-peter.maydell@linaro.org>
	<e6ebfe0d-c866-e28e-2366-d55ac5d77d47@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Feb 2017 03:35:02 -0800
Message-ID: <CAKmqyKMBX6QYDHDk2ZYp6qza8JKKa5SkHveTH1Oxe+ebbUU1Zw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 01/11] armv7m: Abstract out the "load kernel"
 code
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
X-TUID: m1152dnDYHtC

On Mon, Feb 20, 2017 at 8:23 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 02/20/2017 12:35 PM, Peter Maydell wrote:
>>
>> Abstract the "load kernel" code out of armv7m_init() into its own
>> function.  This includes the registration of the CPU reset function,
>> to parallel how we handle this for A profile cores.
>>
>> We make the function public so that boards which choose to
>> directly instantiate an ARMv7M device object can call it.
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
>>  include/hw/arm/arm.h | 12 ++++++++++++
>>  hw/arm/armv7m.c      | 23 ++++++++++++++++++-----
>>  2 files changed, 30 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
>> index c175c0e..a3f79d3 100644
>> --- a/include/hw/arm/arm.h
>> +++ b/include/hw/arm/arm.h
>> @@ -26,6 +26,18 @@ typedef enum {
>>  /* armv7m.c */
>>  DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int
>> num_irq,
>>                        const char *kernel_filename, const char
>> *cpu_model);
>> +/**
>> + * armv7m_load_kernel:
>> + * @cpu: CPU
>> + * @kernel_filename: file to load
>> + * @mem_size: mem_size: maximum image size to load
>> + *
>> + * Load the guest image for an ARMv7M system. This must be called by
>> + * any ARMv7M board, either directly or via armv7m_init(). (This is
>> + * necessary to ensure that the CPU resets correctly on system reset,
>> + * as well as for kernel loading.)
>> + */
>> +void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int
>> mem_size);
>>
>>  /*
>>   * struct used as a parameter of the arm_load_kernel machine init
>> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
>> index 0c9ca7b..b2cc6e9 100644
>> --- a/hw/arm/armv7m.c
>> +++ b/hw/arm/armv7m.c
>> @@ -176,10 +176,6 @@ DeviceState *armv7m_init(MemoryRegion *system_memor=
y,
>> int mem_size, int num_irq,
>>      ARMCPU *cpu;
>>      CPUARMState *env;
>>      DeviceState *nvic;
>> -    int image_size;
>> -    uint64_t entry;
>> -    uint64_t lowaddr;
>> -    int big_endian;
>>
>>      if (cpu_model =3D=3D NULL) {
>>         cpu_model =3D "cortex-m3";
>> @@ -199,6 +195,16 @@ DeviceState *armv7m_init(MemoryRegion *system_memor=
y,
>> int mem_size, int num_irq,
>>      qdev_init_nofail(nvic);
>>      sysbus_connect_irq(SYS_BUS_DEVICE(nvic), 0,
>>                         qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
>> +    armv7m_load_kernel(cpu, kernel_filename, mem_size);
>> +    return nvic;
>> +}
>> +
>> +void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int
>> mem_size)
>> +{
>> +    int image_size;
>> +    uint64_t entry;
>> +    uint64_t lowaddr;
>> +    int big_endian;
>>
>>  #ifdef TARGET_WORDS_BIGENDIAN
>>      big_endian =3D 1;
>> @@ -224,8 +230,15 @@ DeviceState *armv7m_init(MemoryRegion *system_memor=
y,
>> int mem_size, int num_irq,
>>          }
>>      }
>>
>> +    /* CPU objects (unlike devices) are not automatically reset on syst=
em
>> +     * reset, so we must always register a handler to do so. Unlike
>> +     * A-profile CPUs, we don't need to do anything special in the
>> +     * handler to arrange that it starts correctly.
>> +     * This is arguably the wrong place to do this, but it matches the
>> +     * way A-profile does it. Note that this means that every M profile
>> +     * board must call this function!
>> +     */
>>      qemu_register_reset(armv7m_reset, cpu);
>> -    return nvic;
>>  }
>>
>>  static Property bitband_properties[] =3D {
>>
>
