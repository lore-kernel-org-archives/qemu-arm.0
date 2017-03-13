Received: by 10.25.77.4 with SMTP id a4csp1305258lfb;
        Mon, 13 Mar 2017 12:34:12 -0700 (PDT)
X-Received: by 10.55.98.144 with SMTP id w138mr31988333qkb.118.1489433652767;
        Mon, 13 Mar 2017 12:34:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s126si1183859qkb.275.2017.03.13.12.34.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 12:34:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnVjO-0005KT-6z
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 15:34:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVi6-0004U1-O4
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 15:32:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVi5-0007Nm-J2
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 15:32:50 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:34987)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cnVi0-0007Lc-2G; Mon, 13 Mar 2017 15:32:44 -0400
Received: by mail-qk0-x243.google.com with SMTP id o135so38485002qke.2;
	Mon, 13 Mar 2017 12:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ILi3PrzcEk3WsiLGsdQA0+JuDk3D+BD1qi3TbvF85RQ=;
	b=oWcfMxwht/6WMX6k1vgCbaLsOTRxv+HVfMiV9angS0ixjptEIm9TUXFlUhrBI2eCwr
	hKQ2Qyxb3CgmeHqXJT5qg85ITzDb86HEDjOr4JrmIxZvdS4cjgd4oeJj3XkGzL3Y4s7Z
	ZWOHzqP8PYh4Jrg+QA/a78Yh1a1/tRynFWIdgdNLyokHGYTlJymm6MDc3kphAjZxaCIZ
	5MUBJhHmRzJWTbr7xHgWcyjUCXAUlauGw1LHQHk8m0Uz/bhrF6KoLz72m1tdkuu16vxh
	G3ZZTsjJF0CbF3nQA6hCPHUI38mNl/r/b78PI038kQ7LyXAKBw7URqWHd5dI+08pT2Za
	ZVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ILi3PrzcEk3WsiLGsdQA0+JuDk3D+BD1qi3TbvF85RQ=;
	b=Aa4jXDaEEufrXhUNFHR1B3tc/eHZv2QI6q68LXJCWYXYhYegrN4IfLgNAFwPLBUA4X
	UkYwj2WU0DBZeRB3GaO7ND3XfVtlN3h0rNkc/aHleEZzCysfu2lylKrFH6NTAqJH8f+8
	aBSUD5TW5MrIaX3BenOaX7xGlpnN3zN39n3C9OpD99hE0pWBGDhZ4Ly5S9j2pT3u4rlb
	m5Bqpu52+2JqXEKsoNgwdk2j+pXhn63N5DPYO4ibTQistIEkPVFK4utpuRreir8fbD4B
	i1dIBerGh6034O3E8GQY4pxbgxpp55Wis658QTH66QaMAcEhXkDIrgRhnnePbPFKUlXu
	5AOA==
X-Gm-Message-State: AMke39nUZTa08kiJW7YJsN80EaFyqovq4GWxHeNCleQ23dA9BgrMl5j30c3yzk5xpmRpiA==
X-Received: by 10.55.69.72 with SMTP id s69mr35050708qka.21.1489433563508;
	Mon, 13 Mar 2017 12:32:43 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	f35sm12748348qtb.49.2017.03.13.12.32.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 12:32:42 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>
References: <20170313180432.7067-1-krzk@kernel.org>
	<20170313180432.7067-2-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cf23c2b4-c4c1-bb46-626e-a54851b25cbb@amsat.org>
Date: Mon, 13 Mar 2017 16:32:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170313180432.7067-2-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH v2 1/5] hw/intc/exynos4210_gic: Fix GIC
 memory mappings for secondary CPU
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
X-TUID: qVoh6Geghxrj

On 03/13/2017 03:04 PM, Krzysztof Kozlowski wrote:
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
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/exynos4210_gic.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
> index 2a55817b7660..222cfd6c6387 100644
> --- a/hw/intc/exynos4210_gic.c
> +++ b/hw/intc/exynos4210_gic.c
> @@ -283,9 +283,20 @@ static void exynos4210_gic_set_irq(void *opaque, int irq, int level)
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
> +    Object *obj = OBJECT(dev);
>      uint32_t i;
>      const char cpu_prefix[] = "exynos4210-gic-alias_cpu";
>      const char dist_prefix[] = "exynos4210-gic-alias_dist";
> @@ -306,11 +317,6 @@ static void exynos4210_gic_init(Object *obj)
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
> @@ -346,6 +352,7 @@ static void exynos4210_gic_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>
> +    dc->realize = exynos4210_gic_realize;
>      dc->props = exynos4210_gic_properties;
>  }
>
>
