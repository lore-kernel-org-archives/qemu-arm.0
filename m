Received: by 10.25.0.23 with SMTP id 23csp71945lfa;
        Fri, 2 Jun 2017 11:36:52 -0700 (PDT)
X-Received: by 10.237.37.154 with SMTP id x26mr10632876qtc.133.1496428612814;
        Fri, 02 Jun 2017 11:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496428612; cv=none;
        d=google.com; s=arc-20160816;
        b=lbBUfLK6b++CBBlWPEXfjaCIyRfnw/ZTNeFFCBGZ8HAdsp0l6/SfhNFzVVe+eFwYRS
         V5ZtV3rO5Tow9zVAn/dvv39GvNUm14DoM7iUalfu9qucYqijZwiizLN8AN+aNqQdlSKF
         ZeXK8igg7l05hgTkVlfUe6EbrFtuuzsMHxbaVWQMffte8t5zN/dxko/eHdSD1fR2kYG0
         RxPenJELCyG7we5pVONcxpHO2PGZGH6oocjBTH0l92x0fwSrMI8pCBU61Jc+0ARTmZje
         HIW/a9kDzUvaIjfc6oojMS2BQogVYC9SGvm1Cw7CRGxdJbyYVAP5yL3B6vwepx2bTHL6
         pgDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=Bdcs07OApcBdt17OvO2sFE1gL7nVL/CxebJyYcOMEJE=;
        b=K/dtZDqI7kkkZuAKeYnvF28OMQnovkDL2OKpRwC7rti+xnPiG28ZGX8FAMaV7S4XEr
         X2I/WqCR94GJgKhotZ5VbNvDWmchFwMWlReNDMdT0sGyJ5kl4ilO+bnXMmw0/BZbmCiV
         QZoGbjLuTHSVqBhnQRZy2uS20BTgO9tdlHa2dIwFxJ+uUtCsxbUo1KyGT2gO9EgQMkm5
         Jw6Mkte84lvqCYjIp1Ikpbdwm0TJwAR/5W4uri1jWyICkxfGTzDdVxBJ40lKoTKYFS6B
         q8qp/q/J6yOXD/e5SSacFt1ZUFNgiG/ZdBK2udR02T44Abwls4B4arMkd96fJNhQ6Bif
         3VNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f75si12873860qkh.13.2017.06.02.11.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 11:36:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51086 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGrRK-0003Lm-3r
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 14:36:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGrQL-000313-8Z
	for qemu-devel@nongnu.org; Fri, 02 Jun 2017 14:35:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGrQK-00040L-BR
	for qemu-devel@nongnu.org; Fri, 02 Jun 2017 14:35:49 -0400
Received: from mail-it0-x241.google.com ([2607:f8b0:4001:c0b::241]:34723)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dGrQK-0003yl-6K; Fri, 02 Jun 2017 14:35:48 -0400
Received: by mail-it0-x241.google.com with SMTP id d68so12510418ita.1;
	Fri, 02 Jun 2017 11:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Bdcs07OApcBdt17OvO2sFE1gL7nVL/CxebJyYcOMEJE=;
	b=RL3lOmAIpDOEq7oZMXP8PP1DeK9NuyfJI4MsBL5mwxwLkhYTH65sDFM40h0SBPEDVU
	0ow2rnsMF2RiEWSvdcjsDYRXP1RaIC3FixvdN+h90bn45wBcHIDRXmIuhO+T0ZEu3EPS
	icgUiSLNkdkqtI/ypqra5/zbUky0UgIJk++CikEk3lDaMRoz+CVadPkRSAwymAM8zYHn
	7pS1GchV0ptn853crmlO2dDswV37DlDte5YOv4e9eQf3umgfpITP4/mzgqxLRw/9Zxso
	3ga4pyDGakXMH13lq2JYBvtRf0kp9/tbSCJ8p0ZUeN1z5hBCzH4eNtAyt38Ux3rbBq/B
	nDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Bdcs07OApcBdt17OvO2sFE1gL7nVL/CxebJyYcOMEJE=;
	b=fsyAuuNXLgjRrcuUxyQrAGuuz0JqWp0re0gfkbaL32glAvksa9r2kO2Qe2bbTmyWAV
	/9lTwHYxcwpJMlZqb5eRmtduSrm87k4sk8tdncgM96NIg/EKljyy71YoTf0fgNmJpoa1
	2XkFvY+A0C2VdzLRAxvAixy5Iayjba6Q4zEdN3I2rOeVnhv/eNTniR/f5IYx4Mx+3bwp
	U346Hv6KS/rJ41tgkJPgZlMq0e3vQhuZNTmz8myH0X3Edcq5Ta3JmJj1Qq+1KcoIFPXd
	fV3oSO+bxdDFZx7u1y/6L4L8o5dlxPvu0eAPtTZaZKS7PVwuCM/tHuW2zMl/O8pchpOr
	v4Bg==
X-Gm-Message-State: AODbwcAxZ1MQD0tCB5J+R9Zr5Zvm1r91Zep+MgpQhQTywjWHVAXWpMuz
	JvA8RrZGVxnfwA==
X-Received: by 10.36.35.201 with SMTP id u192mr773289itu.40.1496428546027;
	Fri, 02 Jun 2017 11:35:46 -0700 (PDT)
Received: from ?IPv6:2602:30a:2c37:1a00::43? ([2602:30a:2c37:1a00::43])
	by smtp.gmail.com with ESMTPSA id
	c10sm10281365ioj.48.2017.06.02.11.35.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jun 2017 11:35:44 -0700 (PDT)
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20170602162857.6065-1-krzk@kernel.org>
	<20170602163618.6369-1-krzk@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f6e9e185-14b8-64bf-e295-803a1c0d1dae@amsat.org>
Date: Fri, 2 Jun 2017 15:35:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170602163618.6369-1-krzk@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::241
Subject: Re: [Qemu-devel] [PATCH v4 1/9] hw/intc/exynos4210_gic: Use more
 meaningful name for local variable
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UQGWnXnSheH8

On 06/02/2017 01:36 PM, Krzysztof Kozlowski wrote:
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
> index 2a55817b7660..62acede72f62 100644
> --- a/hw/intc/exynos4210_gic.c
> +++ b/hw/intc/exynos4210_gic.c
> @@ -286,21 +286,21 @@ static void exynos4210_gic_init(Object *obj)
>      DeviceState *dev = DEVICE(obj);
>      Exynos4210GicState *s = EXYNOS4210_GIC(obj);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
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
> @@ -316,7 +316,7 @@ static void exynos4210_gic_init(Object *obj)
>          sprintf(cpu_alias_name, "%s%x", cpu_prefix, i);
>          memory_region_init_alias(&s->cpu_alias[i], obj,
>                                   cpu_alias_name,
> -                                 sysbus_mmio_get_region(busdev, 1),
> +                                 sysbus_mmio_get_region(gicbusdev, 1),
>                                   0,
>                                   EXYNOS4210_GIC_CPU_REGION_SIZE);
>          memory_region_add_subregion(&s->cpu_container,
> @@ -326,7 +326,7 @@ static void exynos4210_gic_init(Object *obj)
>          sprintf(dist_alias_name, "%s%x", dist_prefix, i);
>          memory_region_init_alias(&s->dist_alias[i], obj,
>                                   dist_alias_name,
> -                                 sysbus_mmio_get_region(busdev, 0),
> +                                 sysbus_mmio_get_region(gicbusdev, 0),
>                                   0,
>                                   EXYNOS4210_GIC_DIST_REGION_SIZE);
>          memory_region_add_subregion(&s->dist_container,
>
