Received: by 10.25.44.15 with SMTP id s15csp530344lfs;
        Fri, 21 Jul 2017 04:16:20 -0700 (PDT)
X-Received: by 10.55.41.217 with SMTP id p86mr8623879qkp.149.1500635780035;
        Fri, 21 Jul 2017 04:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500635780; cv=none;
        d=google.com; s=arc-20160816;
        b=rbQvk5RUZ+lImSBzIjdzXEEPLJhZqx7GT/OnJ/l9TlXJ8wgGF236LAJwPlvmMMjWZv
         PCfhYt5yMos1F6b9vTf3xKv0+L5ba/RktWgxbsoDB6AtY77j1gYEv6q7js8J4owEKFL+
         VtGXn8qNJmJIqFnanpm5B0fah6kEF9e5NoylRJkEGujXW0CMBJRxHL16zXKK7TpaGq+T
         315FWYIFAzOBWuG6SC0sOVFT4xormczIpYzXcriOLgi+rfKZz/q84loO/IVnq6G01pkZ
         HKuiVzaLmvCpygIFtO30aqSzfuKdSNwpqd5NNB6f1/aOeAEdq3pK6/23CT++Y1ErB8Fl
         2voA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=n1jBFbYfoZl7cSUK+BJluNzKdYFy4rFNnsZfCblfAjI=;
        b=ZPNyyayt726EkbQ1CPbOgqZHK3fFpDSI3zzOIZppvQSrR+frj4xN9Z3j48fjnewI5R
         5OdtmXBvhEf1pNoyGqe18fF5AX+nA1hsHWNQ3PdyCyV40W7vb5/IBEDQwtpDo932KLEY
         a2HNhvC8yFmKCUIEUwyP1yHUoeixg3CvGH4N7OBBv6/RzwM9Wyj91Sh2a5xliNfFEgau
         fy1pzvmuhweTJqrb4Ge0JaiSzLw4CD91SsZyUhQ4Kd11AwnjE1v4+f2KKsG9JbSyevYN
         wCC8PLk2+5MJFCvldVVD++aqqnK/StBGPfrli/o245x33Rk7TEQMT6+h4qRVwzAoU7sa
         /M3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=ak1qIhb3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q62si3742361qtd.451.2017.07.21.04.16.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Jul 2017 04:16:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=ak1qIhb3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42334 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dYVur-0004gU-F1
	for alex.bennee@linaro.org; Fri, 21 Jul 2017 07:16:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cdall@linaro.org>) id 1dYVuo-0004gJ-Eh
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:16:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cdall@linaro.org>) id 1dYVul-0007G1-AV
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:16:14 -0400
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:36756)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <cdall@linaro.org>) id 1dYVul-0007ES-3f
	for qemu-arm@nongnu.org; Fri, 21 Jul 2017 07:16:11 -0400
Received: by mail-wm0-x230.google.com with SMTP id w191so5823368wmw.1
	for <qemu-arm@nongnu.org>; Fri, 21 Jul 2017 04:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=n1jBFbYfoZl7cSUK+BJluNzKdYFy4rFNnsZfCblfAjI=;
	b=ak1qIhb3m2RmvLuzT1+3p8v/IQyaD0+sVSLg0vqkA006uzutZ5hm5iyVjeS/f9zmBx
	lviwI973mdeQKOkd3XMlSh3037lA33nEWjBPYG5dXO8E2WlQDfIiUVR7q+r5JpyNPl8M
	hGIxgy++mgnLK3q5a0Kh+jrqpYdp3GgX6Zu3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=n1jBFbYfoZl7cSUK+BJluNzKdYFy4rFNnsZfCblfAjI=;
	b=c9KdAz0YbW7+AJavxgsvrVuGNjgY4KgR2kOI7tbuTxH6bNMzQDRBiB06TvfoVs3toY
	JSDy/iGY+cj2iAKimaoebFTcfW+GlsI3264yKoi08rgM5MGLUQAVnpiUK90zNRzjEz3X
	aWFuweWLXRfc19iYxoKZ8+eBlFVudSi/03hozsflLM9B8HTKMWvVF6vJbKcIQqrpg8y/
	MeSlL2hzwNej2f9hU4CM+3LtcAQQpQnBd2K8YYLvf6XBo3eApPBIFNXPZlU82NdHUPRF
	UK9ixirVTTsT62/ZXEXk88bdzYr5t7M9kY6xB2mqknMYbnqdy8ha3dbSn+Way6FhwvVR
	CqZA==
X-Gm-Message-State: AIVw110em0C8Vri4CLCPFR6luKldldNuVDB+pUBaAm4AlJFzwUCGx5wV
	FX0ZNrUM719Qdb4q
X-Received: by 10.80.137.112 with SMTP id f45mr3777155edf.152.1500635768400;
	Fri, 21 Jul 2017 04:16:08 -0700 (PDT)
Received: from localhost (xd93ddc2d.cust.hiper.dk. [217.61.220.45])
	by smtp.gmail.com with ESMTPSA id k14sm376338edj.24.2017.07.21.04.16.07
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 21 Jul 2017 04:16:07 -0700 (PDT)
Date: Fri, 21 Jul 2017 13:16:07 +0200
From: Christoffer Dall <cdall@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20170721111607.GA16350@cbox>
References: <1500471597-2517-1-git-send-email-drjones@redhat.com>
	<1500471597-2517-2-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1500471597-2517-2-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-arm] [PATCH v2 1/4] hw/arm/virt: add pmu interrupt state
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z2I5E42FWts0

On Wed, Jul 19, 2017 at 09:39:54AM -0400, Andrew Jones wrote:
> Mimicking gicv3-maintenance-interrupt, add the PMU's interrupt to
> CPU state.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/virt.c    | 3 +++
>  target/arm/cpu.c | 2 ++
>  target/arm/cpu.h | 2 ++
>  3 files changed, 7 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 31739d75a3e0..ea26f0c473c2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -610,6 +610,9 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>          qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
>                                      qdev_get_gpio_in(gicdev, ppibase
>                                                       + ARCH_GICV3_MAINT_IRQ));
> +        qdev_connect_gpio_out_named(cpudev, "pmu-interrupt", 0,
> +                                    qdev_get_gpio_in(gicdev, ppibase
> +                                                     + VIRTUAL_PMU_IRQ));

I know Peter reviewed this, but isn't it a bit strange to create the
pmu-interrupt when creating the gic (as this isn't an output from the
GIC like the maintenance interrupt is) ?

Thanks,
-Christoffer

>  
>          sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
>          sysbus_connect_irq(gicbusdev, i + smp_cpus,
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 96d1f840301f..fd82c7944840 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -499,6 +499,8 @@ static void arm_cpu_initfn(Object *obj)
>  
>      qdev_init_gpio_out_named(DEVICE(cpu), &cpu->gicv3_maintenance_interrupt,
>                               "gicv3-maintenance-interrupt", 1);
> +    qdev_init_gpio_out_named(DEVICE(cpu), &cpu->pmu_interrupt,
> +                             "pmu-interrupt", 1);
>  #endif
>  
>      /* DTB consumers generally don't in fact care what the 'compatible'
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 102c58afac52..8d91166eb97b 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -584,6 +584,8 @@ struct ARMCPU {
>      qemu_irq gt_timer_outputs[NUM_GTIMERS];
>      /* GPIO output for GICv3 maintenance interrupt signal */
>      qemu_irq gicv3_maintenance_interrupt;
> +    /* GPIO output for the PMU interrupt */
> +    qemu_irq pmu_interrupt;
>  
>      /* MemoryRegion to use for secure physical accesses */
>      MemoryRegion *secure_memory;
> -- 
> 1.8.3.1
> 
