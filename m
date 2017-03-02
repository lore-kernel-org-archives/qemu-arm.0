Received: by 10.25.0.147 with SMTP id 141csp363821lfa;
        Thu, 2 Mar 2017 08:37:46 -0800 (PST)
X-Received: by 10.200.36.43 with SMTP id c40mr19530302qtc.161.1488472666517;
        Thu, 02 Mar 2017 08:37:46 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 52si7283755qtv.302.2017.03.02.08.37.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Mar 2017 08:37:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53237 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cjTjb-0008GZ-Q9
	for alex.bennee@linaro.org; Thu, 02 Mar 2017 11:37:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTjR-0008F3-Qv
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:37:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjTjQ-00070E-M9
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:37:33 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:36129)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjTjQ-0006zu-Es
	for qemu-arm@nongnu.org; Thu, 02 Mar 2017 11:37:32 -0500
Received: by mail-wm0-x234.google.com with SMTP id n11so29249628wma.1
	for <qemu-arm@nongnu.org>; Thu, 02 Mar 2017 08:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=P9HjcELCl6/TjKmuF+Na+/QZztwRpzvTX4gJ+YvhMhw=;
	b=NMbW2+FSdW+NLOnQyvt1bVWN5BKbZ/7Iakcna5q/VF8nPmUAe5vcQMhdHP4d6mRZCb
	MikNiAO2tsVt/e9DRZ1VAf64dxyKMoJs0ymPWNA5yoqVwijvsMoJdy76P9SIViDJYv8d
	GH06vufMqOXzGkw+PrAdXMrDE5w8XfrUhB/Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=P9HjcELCl6/TjKmuF+Na+/QZztwRpzvTX4gJ+YvhMhw=;
	b=fkwtU65VEyxULCmHzanfSrMfpsDIT7caNL4dtSPzIrhMrXyweHftvoNORM09FgyGKQ
	iEWBnLp4a+Trcp7BeqTIq+uE8OkoqN1yBbxc51Nzh2wA9jdaSbMd1pS3H5QtH1oiJBQT
	wNqgVcC6DIsUaWdJqxjE01RaQ8A04RarkMobPpDYkIxJkHL+mcC07IYSNBsFjvPiWaMM
	enlLm140m/lrWiW2KxGTvNavDfR6SGy+KxuZn4vWa73aPp4YWmrKukMC7y6269jbslfd
	fRCJspz4RtCUFdFDgNoWjtKqmEveBru7dz2H3Obb9iTkNBvMRcYYo0/h0w/EDGHSJVai
	42xw==
X-Gm-Message-State: AMke39kouVva9ctbsxKLDgaipaiEQ3xDR3tDUoBwKGCUxyq5xPUNzXIF2lne58HtERAVktDRLIMPvK5H24av9zx/
X-Received: by 10.28.226.215 with SMTP id z206mr8594050wmg.92.1488472650857;
	Thu, 02 Mar 2017 08:37:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 08:37:10 -0800 (PST)
In-Reply-To: <20170301182618.22395-2-krzk@kernel.org>
References: <20170301182618.22395-1-krzk@kernel.org>
	<20170301182618.22395-2-krzk@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 16:37:10 +0000
Message-ID: <CAFEAcA8F013ggLmx9hhg+z4ODq3YkU7vfAygjk+QF7dBV6WW5g@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
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
X-TUID: er5r8gV51skh

On 1 March 2017 at 18:26, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Recent Linux kernel (tested next-20170224) was complaining about missing
> GIC mask and was unable to bring up secondary CPU:
>
>     [    0.000000] NR_IRQS:16 nr_irqs:16 16
>     [    0.000000] GIC CPU mask not found - kernel will fail to boot.
>     ...
>     [    0.400492] smp: Bringing up secondary CPUs ...
>     [    1.413184] CPU1: failed to boot: -110
>     [    1.423981] smp: Brought up 1 node, 1 CPU
>
> In its instance_init() call, the Exynos GIC driver was setting GIC
> memory mappings for each CPU, from 1 up to "num-cpu" property.  The
> Exynos4210 machine init call on the other hand, first created Exynos GIC
> device and then set the "num-cpu" property which was too late.  The init
> already happened with default "num-cpu" value of 1 thus GIC mappings
> were created only for the first CPU.
>
> Split the Exynos GIC init code into realize function so the code will
> see updated "num-cpu" property.  This fixes the warning and brings
> second CPU:
>     [    0.435780] CPU1: thread -1, cpu 1, socket 9, mpidr 80000901
>     [    0.451838] smp: Brought up 1 node, 2 CPUs
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>
> But please read cover letter!
>
> ---
>  hw/intc/exynos4210_gic.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
> index 2a55817b7660..5986e54d39c9 100644
> --- a/hw/intc/exynos4210_gic.c
> +++ b/hw/intc/exynos4210_gic.c
> @@ -283,9 +283,19 @@ static void exynos4210_gic_set_irq(void *opaque, int irq, int level)
>
>  static void exynos4210_gic_init(Object *obj)
>  {
> -    DeviceState *dev = DEVICE(obj);
>      Exynos4210GicState *s = EXYNOS4210_GIC(obj);
> -    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +
> +    memory_region_init(&s->cpu_container, obj, "exynos4210-cpu-container",
> +            EXYNOS4210_EXT_GIC_CPU_REGION_SIZE);
> +    memory_region_init(&s->dist_container, obj, "exynos4210-dist-container",
> +            EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
> +
> +}
> +
> +static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
> +{
> +    Exynos4210GicState *s = EXYNOS4210_GIC(dev);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>      uint32_t i;
>      const char cpu_prefix[] = "exynos4210-gic-alias_cpu";
>      const char dist_prefix[] = "exynos4210-gic-alias_dist";
> @@ -306,15 +316,10 @@ static void exynos4210_gic_init(Object *obj)
>      qdev_init_gpio_in(dev, exynos4210_gic_set_irq,
>                        EXYNOS4210_GIC_NIRQ - 32);
>
> -    memory_region_init(&s->cpu_container, obj, "exynos4210-cpu-container",
> -            EXYNOS4210_EXT_GIC_CPU_REGION_SIZE);
> -    memory_region_init(&s->dist_container, obj, "exynos4210-dist-container",
> -            EXYNOS4210_EXT_GIC_DIST_REGION_SIZE);
> -
>      for (i = 0; i < s->num_cpu; i++) {
>          /* Map CPU interface per SMP Core */
>          sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
> -        memory_region_init_alias(&s->cpu_alias[i], obj,
> +        memory_region_init_alias(&s->cpu_alias[i], OBJECT(s),
>                                   cpu_alias_name,
>                                   sysbus_mmio_get_region(busdev, 1),
>                                   0,
> @@ -324,7 +329,7 @@ static void exynos4210_gic_init(Object *obj)
>
>          /* Map Distributor per SMP Core */
>          sprintf(dist_alias_name, "%s%x", dist_prefix, i);
> -        memory_region_init_alias(&s->dist_alias[i], obj,
> +        memory_region_init_alias(&s->dist_alias[i], OBJECT(s),
>                                   dist_alias_name,
>                                   sysbus_mmio_get_region(busdev, 0),
>                                   0,

Slightly better to define
  Object *obj = OBJECT(dev);
at the start of the realize function rather than doing the dynamic
cast twice every time round the loop.

> @@ -346,6 +351,7 @@ static void exynos4210_gic_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>
> +    dc->realize = exynos4210_gic_realize;
>      dc->props = exynos4210_gic_properties;
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
