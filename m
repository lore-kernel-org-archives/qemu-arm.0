Received: by 10.25.0.147 with SMTP id 141csp368861lfa;
        Thu, 2 Mar 2017 08:50:28 -0800 (PST)
X-Received: by 10.55.17.138 with SMTP id 10mr18612493qkr.202.1488473428034;
        Thu, 02 Mar 2017 08:50:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5si7330257qtb.173.2017.03.02.08.50.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Mar 2017 08:50:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53312 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjTvt-0007eZ-CU
	for alex.bennee@linaro.org; Thu, 02 Mar 2017 11:50:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cjTvn-0007cC-1v
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:50:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cjTvj-000578-L1
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:50:19 -0500
Received: from mail.kernel.org ([198.145.29.136]:53710)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cjTvj-00056O-BZ; Thu, 02 Mar 2017 11:50:15 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 487682038A;
	Thu,  2 Mar 2017 16:50:13 +0000 (UTC)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5D8C42026F;
	Thu,  2 Mar 2017 16:50:11 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id l7so57302752ioe.3;
	Thu, 02 Mar 2017 08:50:11 -0800 (PST)
X-Gm-Message-State: AMke39lMAmjUp+W7KMsaZNkWwBFzX4wJjKx+MZtlPhRGGxHhbU+yNkUebeMknINzgn6pW4JfxThght8h2qfOCw==
X-Received: by 10.107.14.78 with SMTP id 75mr13808851ioo.76.1488473410815;
	Thu, 02 Mar 2017 08:50:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.59.133 with HTTP; Thu, 2 Mar 2017 08:50:10 -0800 (PST)
In-Reply-To: <CAFEAcA8F013ggLmx9hhg+z4ODq3YkU7vfAygjk+QF7dBV6WW5g@mail.gmail.com>
References: <20170301182618.22395-1-krzk@kernel.org>
	<20170301182618.22395-2-krzk@kernel.org>
	<CAFEAcA8F013ggLmx9hhg+z4ODq3YkU7vfAygjk+QF7dBV6WW5g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 2 Mar 2017 18:50:10 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe3ecS82Vn8F9otAEprNjnp1q55ZfVwAhy=jXPOPZLLXw@mail.gmail.com>
Message-ID: <CAJKOXPe3ecS82Vn8F9otAEprNjnp1q55ZfVwAhy=jXPOPZLLXw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
Subject: Re: [Qemu-arm] [PATCH 1/5] hw/intc/exynos4210_gic: Fix GIC memory
 mappings for secondary CPU
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LAk4fPOZ32Jk

On Thu, Mar 2, 2017 at 6:37 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 1 March 2017 at 18:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> Recent Linux kernel (tested next-20170224) was complaining about missing
>> GIC mask and was unable to bring up secondary CPU:
>>
>>     [    0.000000] NR_IRQS:16 nr_irqs:16 16
>>     [    0.000000] GIC CPU mask not found - kernel will fail to boot.
>>     ...
>>     [    0.400492] smp: Bringing up secondary CPUs ...
>>     [    1.413184] CPU1: failed to boot: -110
>>     [    1.423981] smp: Brought up 1 node, 1 CPU
>>
>> In its instance_init() call, the Exynos GIC driver was setting GIC
>> memory mappings for each CPU, from 1 up to "num-cpu" property.  The
>> Exynos4210 machine init call on the other hand, first created Exynos GIC
>> device and then set the "num-cpu" property which was too late.  The init
>> already happened with default "num-cpu" value of 1 thus GIC mappings
>> were created only for the first CPU.
>>
>> Split the Exynos GIC init code into realize function so the code will
>> see updated "num-cpu" property.  This fixes the warning and brings
>> second CPU:
>>     [    0.435780] CPU1: thread -1, cpu 1, socket 9, mpidr 80000901
>>     [    0.451838] smp: Brought up 1 node, 2 CPUs
>>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>> ---
>>
>> But please read cover letter!
>>
>> ---
>>  hw/intc/exynos4210_gic.c | 24 +++++++++++++++---------
>>  1 file changed, 15 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
>> index 2a55817b7660..5986e54d39c9 100644
>> --- a/hw/intc/exynos4210_gic.c
>> +++ b/hw/intc/exynos4210_gic.c
>> @@ -283,9 +283,19 @@ static void exynos4210_gic_set_irq(void *opaque, int irq, int level)
>>
>>  static void exynos4210_gic_init(Object *obj)
>>  {
>> -    DeviceState *dev = DEVICE(obj);
>>      Exynos4210GicState *s = EXYNOS4210_GIC(obj);
>> -    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>> +
>> +    memory_region_init(&s->cpu_container, obj, "exynos4210-cpu-container",
>> +            EXYNOS4210_EXT_GIC_CPU_REGION_SIZE);
>> +    memory_region_init(&s->dist_container, obj, "exynos4210-dist-container",
>> +            EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
>> +
>> +}
>> +
>> +static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
>> +{
>> +    Exynos4210GicState *s = EXYNOS4210_GIC(dev);
>> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>      uint32_t i;
>>      const char cpu_prefix[] = "exynos4210-gic-alias_cpu";
>>      const char dist_prefix[] = "exynos4210-gic-alias_dist";
>> @@ -306,15 +316,10 @@ static void exynos4210_gic_init(Object *obj)
>>      qdev_init_gpio_in(dev, exynos4210_gic_set_irq,
>>                        EXYNOS4210_GIC_NIRQ - 32);
>>
>> -    memory_region_init(&s->cpu_container, obj, "exynos4210-cpu-container",
>> -            EXYNOS4210_EXT_GIC_CPU_REGION_SIZE);
>> -    memory_region_init(&s->dist_container, obj, "exynos4210-dist-container",
>> -            EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
>> -
>>      for (i = 0; i < s->num_cpu; i++) {
>>          /* Map CPU interface per SMP Core */
>>          sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
>> -        memory_region_init_alias(&s->cpu_alias[i], obj,
>> +        memory_region_init_alias(&s->cpu_alias[i], OBJECT(s),
>>                                   cpu_alias_name,
>>                                   sysbus_mmio_get_region(busdev, 1),
>>                                   0,
>> @@ -324,7 +329,7 @@ static void exynos4210_gic_init(Object *obj)
>>
>>          /* Map Distributor per SMP Core */
>>          sprintf(dist_alias_name, "%s%x", dist_prefix, i);
>> -        memory_region_init_alias(&s->dist_alias[i], obj,
>> +        memory_region_init_alias(&s->dist_alias[i], OBJECT(s),
>>                                   dist_alias_name,
>>                                   sysbus_mmio_get_region(busdev, 0),
>>                                   0,
>
> Slightly better to define
>   Object *obj = OBJECT(dev);
> at the start of the realize function rather than doing the dynamic
> cast twice every time round the loop.
>
>> @@ -346,6 +351,7 @@ static void exynos4210_gic_class_init(ObjectClass *klass, void *data)
>>  {
>>      DeviceClass *dc = DEVICE_CLASS(klass);
>>
>> +    dc->realize = exynos4210_gic_realize;
>>      dc->props = exynos4210_gic_properties;
>>  }
>
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Sure, I'll re-spin with the cast and reviewed-by tags.

What about the issue I mentioned in the cover letter? Fixing the GIC
caused the recent Linux kernel to behave worst...

Best regards,
Krzysztof
