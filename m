Received: by 10.25.205.13 with SMTP id d13csp10260550lfg;
        Fri, 6 Jan 2017 04:01:38 -0800 (PST)
X-Received: by 10.200.52.105 with SMTP id v38mr7659602qtb.227.1483704098249;
        Fri, 06 Jan 2017 04:01:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k23si3565231qtb.147.2017.01.06.04.01.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 04:01:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPTDD-00015p-Kw
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 07:01:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPTD8-0000yE-B7
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 07:01:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPTD7-00036i-IP
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 07:01:30 -0500
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:36511)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cPTD7-00036d-FE
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 07:01:29 -0500
Received: by mail-ua0-x22c.google.com with SMTP id 88so398879320uaq.3
	for <qemu-arm@nongnu.org>; Fri, 06 Jan 2017 04:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oFkopreh+/i/DG7Z5uELdztnWHYJLH0ww2yC4nrLxP4=;
	b=XsN5RcgIKCo0gT1Q0MWKhnhvjS75VEE7L3i+LlX2bbuTlYRn1v0JxR2pwH+Cd9ocw9
	1FSpAhP5TRlPQI0VL3MpVG9W1ilshnXxZgJ8c0RvoS2SWpuXooiO3bG6zX/1auGoEGUc
	KQV7gvMX8iGaH9hgszwXmKbSiSvgDXv1u9mD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oFkopreh+/i/DG7Z5uELdztnWHYJLH0ww2yC4nrLxP4=;
	b=foAVxIy2RVmp120zacUZIZpglJgQddlD1Y2LVj5J8mokoJjpmP8w42OzLMpPBtUvOO
	C21nTLHShTu9fubcRA5vtOcEAZc6XptseTri0EB6wkaxLHZ8pf5/O4jR/HzxBQtBDzKI
	agMxT3WoSdSb9v0relu4mqs4cBJ6UgbZHBz9tzsKBKWD9dSwbi3NNfSd031UOwxuOzQE
	TUi5DLMfLRJiWA9i0YzKz87GqR2fglECcFGE9iBDFUjW51z1NAsW3+G6QfgHu9ucdihn
	X9BKzdLGxHx1XURKqH9Y+neiVfTg8VLqFgoYKOA0dkf08s2RrwLX2qrBdayaXrg1KvAJ
	dEsw==
X-Gm-Message-State: AIkVDXIhGVp5FHZpdwegbj7eTJX4Yr8+R/Thhnq1lm5x+rzXlt8nSc/1ELXELVcsvP3KPh7JJxU3XU3khGCN4eWB
X-Received: by 10.176.91.222 with SMTP id z30mr58114519uae.140.1483704088865; 
	Fri, 06 Jan 2017 04:01:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 6 Jan 2017 04:01:08 -0800 (PST)
In-Reply-To: <b9c61e0c893b6215531ea210e566c9057d28c792.1482265908.git.alistair.francis@xilinx.com>
References: <cover.1482265908.git.alistair.francis@xilinx.com>
	<b9c61e0c893b6215531ea210e566c9057d28c792.1482265908.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2017 12:01:08 +0000
Message-ID: <CAFEAcA-p0MYiiDO-h88fKkueNDzx28wH2Ef6bPFV+MZ65GH_bg@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: Re: [Qemu-arm] [PATCH v3 2/3] arm_generic_timer: Add support for
 the ReadBase memory map
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tNKSjGtZQh/M

On 20 December 2016 at 22:42, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Add support for the read only regions in the ReadBase memory map.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>
>  hw/timer/arm_generic_timer.c         | 27 +++++++++++++++++++++++++++
>  include/hw/timer/arm_generic_timer.h | 12 ++++++++++++
>  2 files changed, 39 insertions(+)
>
> diff --git a/hw/timer/arm_generic_timer.c b/hw/timer/arm_generic_timer.c
> index da434a7..5392657 100644
> --- a/hw/timer/arm_generic_timer.c
> +++ b/hw/timer/arm_generic_timer.c
> @@ -100,6 +100,17 @@ static RegisterAccessInfo arm_gen_timer_regs_info[] = {
>      /* We don't model the CounterID registers either */
>  };
>
> +static RegisterAccessInfo arm_gen_timer_read_regs_info[] = {
> +    {   .name = "CNTCV_READ_LOWER",
> +        .addr = A_CNTCV_READ_LOWER, .ro = 0xFFFF,
> +        .post_read = counter_low_value_postr,
> +    },{ .name = "CNTCV_READ_UPPER",
> +        .addr = A_CNTCV_READ_UPPER, .ro = 0xFFFF,
> +        .post_read = counter_high_value_postr,
> +    }

Needs to support 64-bit reads too.

> +    /* We don't model the CounterID registers */

(same query about ID regs as in patch 1)

> +};
> +
>  static void arm_gen_timer_reset(DeviceState *dev)
>  {
>      ARMGenTimer *s = ARM_GEN_TIMER(dev);
> @@ -166,6 +177,7 @@ static void arm_gen_timer_init(Object *obj)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>      RegisterInfoArray *reg_array;
>
> +    /* Create the ControlBase memory region */
>      memory_region_init_io(&s->iomem, obj, &arm_gen_timer_ops, s,
>                            TYPE_ARM_GEN_TIMER, R_ARM_GEN_TIMER_MAX * 4);
>      reg_array =
> @@ -179,6 +191,21 @@ static void arm_gen_timer_init(Object *obj)
>                                  A_CNTCR,
>                                  &reg_array->mem);
>      sysbus_init_mmio(sbd, &s->iomem);
> +
> +    /* Create the ReadBase memory region */
> +    memory_region_init_io(&s->iomem_read, obj, &arm_gen_timer_ops, s,
> +                          TYPE_ARM_GEN_TIMER "-read", R_ARM_GEN_TIMER_READ_MAX * 4);

checkpatch.pl complains that this line needs wrapping.

> +    reg_array =
> +        register_init_block32(DEVICE(obj), arm_gen_timer_read_regs_info,
> +                              ARRAY_SIZE(arm_gen_timer_read_regs_info),
> +                              s->regs_read_info, s->regs_read,
> +                              &arm_gen_timer_ops,
> +                              ARM_GEN_TIMER_ERR_DEBUG,
> +                              R_ARM_GEN_TIMER_READ_MAX * 4);
> +    memory_region_add_subregion(&s->iomem_read,
> +                                R_CNTCV_READ_LOWER,
> +                                &reg_array->mem);
> +    sysbus_init_mmio(sbd, &s->iomem_read);
>  }

Otherwise this looks good.

thanks
-- PMM
