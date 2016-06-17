Received: by 10.25.21.96 with SMTP id l93csp185809lfi;
        Fri, 17 Jun 2016 03:11:24 -0700 (PDT)
X-Received: by 10.233.232.148 with SMTP id a142mr1139680qkg.25.1466158280985;
        Fri, 17 Jun 2016 03:11:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f94si21524728qgd.7.2016.06.17.03.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Jun 2016 03:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55398 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bDqkC-0000w5-CZ
	for alex.bennee@linaro.org; Fri, 17 Jun 2016 06:11:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bDqk8-0000v1-Uj
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:11:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1bDqk7-0006TV-KQ
	for qemu-arm@nongnu.org; Fri, 17 Jun 2016 06:11:16 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:33912)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1bDqk0-0006Ss-Rj; Fri, 17 Jun 2016 06:11:09 -0400
Received: by mail-wm0-x242.google.com with SMTP id 187so15537332wmz.1;
	Fri, 17 Jun 2016 03:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=A40YPS7c5FpmwoS/vS4DtsVlH04Mkg9RY1ePDuTIxBI=;
	b=Ldw9u4jJlnTHYnJ1qOIqJsbiXPjgjbuQGYOaLO1YJPkMGmJ4kx9jQsx8sBC6gUYI5d
	Xw9OYvr9rUWYDT7+s0LzjsgPFtS9dYcW7hoctNPJraI/Tajnuw1DhY/xDrMXXwCij5+Y
	GODN9eXuDZ3ByITeh4JxixF8vI8+bGknxvWobaOOvznEjRxUDfEmhgCKRs0a4z+nqcea
	MNeo/K+3lsd5J6Y3Lq8OnsTfe7s2Jf8RaeKe/o2BQMkFu8/pt4wOItKoCG+Om8IGRlRa
	xMb+8GTkdxpF3J+9EowSsJdRu7KZsJ/3M1/DLTcKb8kMOOrJU1c5s/Ak1b1jVHN8KD0I
	AgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=A40YPS7c5FpmwoS/vS4DtsVlH04Mkg9RY1ePDuTIxBI=;
	b=RyI8TiXwZh13Y80zh1JUNv6hWcK5U+XAceTdI5p/Hb504fURkKVn3aw/JbYHd22+cB
	3zppzck3SvBxxFsjJADfGkoMfihvG35NhSdPzaNYJCbS345zrHmPYVhVXqXJpX1f2bed
	5eJjSZMah0CpPT1aacnzcgQbx2Cu8fUKgCQGRTx1g1Czb+iZZhzj7uSJna5GOJAnTaXJ
	TsF5ge9+hjAtz8LgJqUJC+RzRHkL7yLtldr6ARvt+BNFLtkVafXq4AefJXkhGdbJyeUy
	wHoxp6r4BnlSST07x+GvfMbkuYLlELeAT4LbRU0cIjH2Wr5WbM+KyytcuO7u5684LLGC
	2wJw==
X-Gm-Message-State: ALyK8tK+q35pnV1KfM6dLJotvQe6saHwp84Izpkb+UCViAjcB2T4F2p3YMrmX0xGtbeK+g==
X-Received: by 10.28.195.131 with SMTP id t125mr1412139wmf.25.1466158268119;
	Fri, 17 Jun 2016 03:11:08 -0700 (PDT)
Received: from [192.168.10.150] (94-39-188-118.adsl-ull.clienti.tiscali.it.
	[94.39.188.118]) by smtp.googlemail.com with ESMTPSA id
	x124sm19247349wmg.24.2016.06.17.03.11.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2016 03:11:07 -0700 (PDT)
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1466152555-10406-1-git-send-email-clg@kaod.org>
	<1466152555-10406-4-git-send-email-clg@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fdae95d6-1ab4-c2a7-d95e-148c86209e53@redhat.com>
Date: Fri, 17 Jun 2016 12:11:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <1466152555-10406-4-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [PATCH 3/4] ast2400: create SPI flash slaves
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w5HYCYrkyp/C



On 17/06/2016 10:35, Cédric Le Goater wrote:
> A set of SPI flash slaves is attached under the flash controllers of
> the palmetto platform. "n25q256a" flash modules are used for the BMC
> and "mx25l25635e" for the host. These types are common in the
> OpenPower ecosystem.
> 
> The segment addresses used for the memory mappings are the defaults
> provided by the specs. They can be changed with the Segment Address
> Register but this is not supported in the current implementation.

Do you mind if we fix the /* FIXME */ comment, regarding adding a drive
property to m25p80 instead of using drive_get_next?  I'll send a patch
shortly.

Paolo

> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/arm/palmetto-bmc.c       |  3 +++
>  hw/ssi/aspeed_smc.c         | 60 ++++++++++++++++++++++++++++++++++++++++++---
>  include/hw/ssi/aspeed_smc.h | 10 ++++++++
>  3 files changed, 70 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
> index a51d960510ee..0aed97a7d9cf 100644
> --- a/hw/arm/palmetto-bmc.c
> +++ b/hw/arm/palmetto-bmc.c
> @@ -47,6 +47,9 @@ static void palmetto_bmc_init(MachineState *machine)
>      object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>                               &error_abort);
>  
> +    aspeed_smc_init_flashes(&bmc->soc.smc, "n25q256a", &error_abort);
> +    aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l25635e", &error_abort);
> +
>      palmetto_bmc_binfo.kernel_filename = machine->kernel_filename;
>      palmetto_bmc_binfo.initrd_filename = machine->initrd_filename;
>      palmetto_bmc_binfo.kernel_cmdline = machine->kernel_cmdline;
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 6a02906c8f97..f7ef69418c0c 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -98,13 +98,32 @@
>  #define R_SPI_MISC_CRTL   (0x10 / 4)
>  #define R_SPI_TIMINGS     (0x14 / 4)
>  
> +/*
> + * Default segments mappings and size for each slave
> + */
> +static const AspeedSegments aspeed_segments_legacy[] = {
> +    { 0x14000000, 32 * 1024 * 1024 },
> +};
> +
> +static const AspeedSegments aspeed_segments_fmc[] = {
> +    { 0x20000000, 64 * 1024 * 1024 },
> +    { 0x24000000, 32 * 1024 * 1024 },
> +    { 0x26000000, 32 * 1024 * 1024 },
> +    { 0x28000000, 32 * 1024 * 1024 },
> +    { 0x2A000000, 32 * 1024 * 1024 }
> +};
> +
> +static const AspeedSegments aspeed_segments_spi[] = {
> +    { 0x30000000, 64 * 1024 * 1024 },
> +};
> +
>  static const AspeedSMCController controllers[] = {
>      { "aspeed.smc.smc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
> -      CONF_ENABLE_W0, 5 },
> +      CONF_ENABLE_W0, 5, aspeed_segments_legacy },
>      { "aspeed.smc.fmc", R_CONF, R_CE_CTRL, R_CTRL0, R_TIMINGS,
> -      CONF_ENABLE_W0, 5 },
> +      CONF_ENABLE_W0, 5, aspeed_segments_fmc },
>      { "aspeed.smc.spi", R_SPI_CONF, 0xff, R_SPI_CTRL0, R_SPI_TIMINGS,
> -      SPI_CONF_ENABLE_W0, 1 },
> +      SPI_CONF_ENABLE_W0, 1, aspeed_segments_spi },
>  };
>  
>  static bool aspeed_smc_is_ce_stop_active(AspeedSMCState *s, int cs)
> @@ -254,6 +273,8 @@ static int aspeed_smc_init(SysBusDevice *sbd)
>      memory_region_init_io(&s->mmio, OBJECT(s), &aspeed_smc_ops, s,
>                            s->ctrl->name, ASPEED_SMC_R_MAX * 4);
>      sysbus_init_mmio(sbd, &s->mmio);
> +
> +    s->flashes = g_new0(AspeedSMCFlashState *, s->num_cs);
>      return 0;
>  }
>  
> @@ -395,3 +416,36 @@ static void aspeed_smc_flash_register_types(void)
>  }
>  
>  type_init(aspeed_smc_flash_register_types)
> +
> +void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype,
> +                             Error **errp)
> +{
> +    int i ;
> +    char name[32];
> +
> +    for (i = 0; i < s->num_cs; ++i) {
> +        Object *obj = object_new(TYPE_ASPEED_SMC_FLASH);
> +        AspeedSMCFlashState *fl = ASPEED_SMC_FLASH(obj);
> +        qemu_irq cs_line;
> +
> +        s->flashes[i] = fl;
> +
> +        snprintf(name, sizeof(name), "%s.%d", s->ctrl->name, i);
> +
> +        fl->id = i;
> +        fl->controller = s;
> +        fl->size = s->ctrl->segments[i].size;
> +
> +        /* backing region */
> +        memory_region_init_io(&fl->mmio, obj, &aspeed_smc_flash_ops, fl, name,
> +                              fl->size);
> +        sysbus_init_mmio(SYS_BUS_DEVICE(fl), &fl->mmio);
> +
> +        /* SPI Flash module */
> +        fl->flash = ssi_create_slave(s->spi, flashtype);
> +        cs_line = qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
> +        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
> +
> +        sysbus_mmio_map(SYS_BUS_DEVICE(fl), 0, s->ctrl->segments[i].addr);
> +    }
> +}
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index abd0005b01c2..2636c775c90f 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -43,6 +43,11 @@ typedef struct AspeedSMCFlashState {
>  #define ASPEED_SMC_FLASH(obj) \
>      OBJECT_CHECK(AspeedSMCFlashState, (obj), TYPE_ASPEED_SMC_FLASH)
>  
> +typedef struct AspeedSegments {
> +    hwaddr addr;
> +    uint32_t size;
> +} AspeedSegments;
> +
>  typedef struct AspeedSMCController {
>      const char *name;
>      uint8_t r_conf;
> @@ -51,6 +56,7 @@ typedef struct AspeedSMCController {
>      uint8_t r_timings;
>      uint8_t conf_enable_w0;
>      uint8_t max_slaves;
> +    const AspeedSegments *segments;
>  } AspeedSMCController;
>  
>  #define TYPE_ASPEED_SMC "aspeed.smc"
> @@ -90,6 +96,10 @@ typedef struct AspeedSMCState {
>      uint8_t r_ctrl0;
>      uint8_t r_timings;
>      uint8_t conf_enable_w0;
> +
> +    AspeedSMCFlashState **flashes;
>  } AspeedSMCState;
>  
> +extern void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype,
> +                                    Error **errp);
>  #endif /* ASPEED_SMC_H */
> 
