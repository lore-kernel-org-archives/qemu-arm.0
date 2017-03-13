Received: by 10.25.77.4 with SMTP id a4csp1304067lfb;
        Mon, 13 Mar 2017 12:30:38 -0700 (PDT)
X-Received: by 10.233.216.68 with SMTP id u65mr32444888qkf.68.1489433438340;
        Mon, 13 Mar 2017 12:30:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k77si1193746qkl.14.2017.03.13.12.30.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 12:30:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54016 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnVfv-00032l-PS
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 15:30:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36491)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVfr-0002zI-IG
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 15:30:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVfq-0006TB-IK
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 15:30:31 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:36570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVfl-0006S8-1g; Mon, 13 Mar 2017 15:30:25 -0400
Received: by mail-qk0-x243.google.com with SMTP id n141so38484407qke.3;
	Mon, 13 Mar 2017 12:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=fj2lqOQP4p2QN+EbexAB53gEJbbvigHjU4ySakjsE2g=;
	b=LGgYnZZ1skh20ZOzWRxRcLJ8Iiqj9SV09L/Zq5VDgy8fK/M9fHzC8NZzuOi2wm73rT
	puclERJ4Lj1SdUAHOvzLDzJzqevc6lOrCTY/k4zW3K8e+XCxWGOYBM5ZWnDg9IpfX6EW
	yOEZz/tPjM6eeU72mPtCsigiw+Kull9uBFSHUaCPcT1n1/H/zTXhE79s95vpVovXNovq
	daYH6/W4+z2CQhk/4ZmVdUFTP18o3tOSkwj0GEUmOaqJbjiVf/VCvZkRpQbJxHl7hkRr
	5s55iCMcC7IJwpOgwd3sbBWCWb1H1fuO6NC0ZfGnrHGMrL69r0SxvgAWFhKWJIznmfJN
	UIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=fj2lqOQP4p2QN+EbexAB53gEJbbvigHjU4ySakjsE2g=;
	b=I0FsyGTgNFPgWAWznn+RUAvZbWRaQIGfd8uMZ/ejKslh/vQ/YjWM4qpAX8/FysZi9L
	R0jUZiyPKChVQzGWXSGMIrUVwKMU9UqBx2dhGIY/JwYEXMIyliAnZtcyrXfM1xs05vAr
	tN/79vpvuIh8HMhGKzoI4WOZX1jMLytt2QqCGJ16QIQekZGQIuQLbzjT9DWPNIW0L293
	boVBMrgoS73INDWqvrHQU/+4RjGSmXxP3tOf1s0OPAgUnBJ4ySwlAYBra9ddmxbhkfJh
	IDLVNm1Kar0+F2jwsMz/0TTYpVCKUqIa3aKfUzvbWhfXwhAwWf7UqILod+YpDUnLBiM/
	8IrQ==
X-Gm-Message-State: AFeK/H274GqokPsqY5IF/DOVI7Tj4YKXOo25A+5QE0EQUxg+lZMJKVP3v4DtpjQyOPLgOw==
X-Received: by 10.55.221.1 with SMTP id n1mr31773240qki.221.1489433424462;
	Mon, 13 Mar 2017 12:30:24 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v39sm12804097qtv.61.2017.03.13.12.30.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 12:30:23 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>
References: <20170313180432.7067-1-krzk@kernel.org>
	<20170313180432.7067-3-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3ec3158f-dd55-fe19-3778-b4c1cc4492dc@amsat.org>
Date: Mon, 13 Mar 2017 16:30:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170313180432.7067-3-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v2 2/5] hw/intc/exynos4210_gic: Use more
 meaningful name for local variable
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
X-TUID: 5k880nhGG0dw

On 03/13/2017 03:04 PM, Krzysztof Kozlowski wrote:
> There are to SysBusDevice variables in exynos4210_gic_realize()
> function: one for the device itself and second for arm_gic device.  Add
> a prefix "gic" to the second one so it will be easier to understand the
> code.
>
> While at it, put local uninitialized 'i' variable at the end, next to
> other uninitialized ones.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/exynos4210_gic.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
> index 222cfd6c6387..9a2254f0b13c 100644
> --- a/hw/intc/exynos4210_gic.c
> +++ b/hw/intc/exynos4210_gic.c
> @@ -297,21 +297,21 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
>      Exynos4210GicState *s = EXYNOS4210_GIC(dev);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>      Object *obj = OBJECT(dev);
> -    uint32_t i;
>      const char cpu_prefix[] = "exynos4210-gic-alias_cpu";
>      const char dist_prefix[] = "exynos4210-gic-alias_dist";
>      char cpu_alias_name[sizeof(cpu_prefix) + 3];
>      char dist_alias_name[sizeof(cpu_prefix) + 3];
> -    SysBusDevice *busdev;
> +    SysBusDevice *gicbusdev;
> +    uint32_t i;
>
>      s->gic = qdev_create(NULL, "arm_gic");
>      qdev_prop_set_uint32(s->gic, "num-cpu", s->num_cpu);
>      qdev_prop_set_uint32(s->gic, "num-irq", EXYNOS4210_GIC_NIRQ);
>      qdev_init_nofail(s->gic);
> -    busdev = SYS_BUS_DEVICE(s->gic);
> +    gicbusdev = SYS_BUS_DEVICE(s->gic);
>
>      /* Pass through outbound IRQ lines from the GIC */
> -    sysbus_pass_irq(sbd, busdev);
> +    sysbus_pass_irq(sbd, gicbusdev);
>
>      /* Pass through inbound GPIO lines to the GIC */
>      qdev_init_gpio_in(dev, exynos4210_gic_set_irq,
> @@ -322,7 +322,7 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
>          sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
>          memory_region_init_alias(&s->cpu_alias[i], obj,
>                                   cpu_alias_name,
> -                                 sysbus_mmio_get_region(busdev, 1),
> +                                 sysbus_mmio_get_region(gicbusdev, 1),
>                                   0,
>                                   EXYNOS4210_GIC_CPU_REGION_SIZE);
>          memory_region_add_subregion(&s->cpu_container,
> @@ -332,7 +332,7 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
>          sprintf(dist_alias_name, "%s%x", dist_prefix, i);
>          memory_region_init_alias(&s->dist_alias[i], obj,
>                                   dist_alias_name,
> -                                 sysbus_mmio_get_region(busdev, 0),
> +                                 sysbus_mmio_get_region(gicbusdev, 0),
>                                   0,
>                                   EXYNOS4210_GIC_DIST_REGION_SIZE);
>          memory_region_add_subregion(&s->dist_container,
>
