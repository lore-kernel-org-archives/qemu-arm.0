Received: by 10.25.208.211 with SMTP id h202csp1806207lfg;
        Tue, 1 Mar 2016 11:58:22 -0800 (PST)
X-Received: by 10.140.81.51 with SMTP id e48mr28918780qgd.27.1456862300163;
        Tue, 01 Mar 2016 11:58:20 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b141si890234qhb.101.2016.03.01.11.58.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 11:58:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aaqR0-0001Pi-P8
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 14:58:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aaqQy-0001P5-BW
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 14:58:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aaqQv-0007kR-32
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 14:58:16 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:33262)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aaqQu-0007k6-Mq; Tue, 01 Mar 2016 14:58:13 -0500
Received: by mail-lf0-x241.google.com with SMTP id l83so6541270lfd.0;
	Tue, 01 Mar 2016 11:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=KvfJijQxDf0tAxs2thtPbxtcA0CEM9JcWGiQatYGNos=;
	b=QipM1+D17+cd3M+HgzUwrW4UyIx1I/OBnY9lOLvioLJiGtjShrGx14waiM+t/5jYQt
	BJuK/JL1VaeW5BYXsHoaYpoUgv0lq5jiG0DZnkQEruqFbBoFD/v/LcPVTjIkO3wh+qq1
	RfVPTlpG3BcDFnJXprhiE6nm6k9GxXWfhbEou4J7jBBNEM1twsDIPvTDK80wJc0SENzS
	NG+Gr06mAW1VOUvPD8tAEm0FLZ2a0u0ZI9RpsGvjhfF1CvFLRFlZA1gajivDt0zuoi5+
	TRo5gY8jVaf/hUrmRoif2btulzyjdeHZT8aSvYbuUchgb0IHMLj+/X7dJTSEiSk2ALA3
	N/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=KvfJijQxDf0tAxs2thtPbxtcA0CEM9JcWGiQatYGNos=;
	b=SbB7WBwBfEgNUfZ56JgAbDJ1AoKynJmOVLRBClRs4gKBjPBEDsZPeCDbVMcgXo10pY
	C8iketbJ1DXgu5mtmzDIfrWd/YFexr6sZvvo/1zT0X7wZygWpEugq5cr7Kd9q3FYFEEJ
	srAD88ttP6XbXHgn39AGkayT6m6u7ZnK4xiZzVsmJ89ffC18gKKnmzHYOETuWXsHwl+n
	0rBcQpyvxl9TYpe/kIIuEFD3FoXw0M9lRkuwKQJZ1QyL2f/JWuqGNz6CT3S6OiXQY+a8
	zgSffkDZuj9KpahBnW+vNODbwS7xFPy+6nyknRh0uELDh+LqFFYaEluKnMqwPIsgG/Ez
	Aclg==
X-Gm-Message-State: AD7BkJLecpSQj+Wzyl/uzvprvcsPyQd2F5y6Xc/FyKIJij0zp7d1V8Q2lbsJtAsTzwwByQ==
X-Received: by 10.25.218.148 with SMTP id r142mr8681536lfg.154.1456862291211; 
	Tue, 01 Mar 2016 11:58:11 -0800 (PST)
Received: from [192.168.0.65] (broadband-46-188-121-154.2com.net.
	[46.188.121.154]) by smtp.gmail.com with ESMTPSA id
	193sm5191419lfz.26.2016.03.01.11.58.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2016 11:58:10 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1456854176-7813-1-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56D5F451.3000304@gmail.com>
Date: Tue, 1 Mar 2016 22:58:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1456854176-7813-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] hw/intc/arm_gic.c: Implement
 GICv2 GICC_DIR
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: au/aNwovW2ce

On 01.03.2016 20:42, Peter Maydell wrote:
> The GICv2 introduces a new CPU interface register GICC_DIR, which
> allows an OS to split the "priority drop" and "deactivate interrupt"
> parts of interrupt completion. Implement this register.
> (Note that the register is at offset 0x1000 in the CPU interface,
> which means it is on a different 4K page from all the other registers.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> changes v1->v2: remove unnecessary gic_update() call
>
>   hw/cpu/a15mpcore.c       |  2 +-
>   hw/intc/arm_gic.c        | 45 ++++++++++++++++++++++++++++++++++++++++++++-
>   hw/intc/arm_gic_common.c |  2 +-
>   3 files changed, 46 insertions(+), 3 deletions(-)
>
> diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
> index e9063ad..a221b8f 100644
> --- a/hw/cpu/a15mpcore.c
> +++ b/hw/cpu/a15mpcore.c
> @@ -109,7 +109,7 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
>       /* Memory map (addresses are offsets from PERIPHBASE):
>        *  0x0000-0x0fff -- reserved
>        *  0x1000-0x1fff -- GIC Distributor
> -     *  0x2000-0x2fff -- GIC CPU interface
> +     *  0x2000-0x3fff -- GIC CPU interface
>        *  0x4000-0x4fff -- GIC virtual interface control (not modelled)
>        *  0x5000-0x5fff -- GIC virtual interface control (not modelled)
>        *  0x6000-0x7fff -- GIC virtual CPU interface (not modelled)
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 60ab9b8..0834c2f 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -500,6 +500,41 @@ static uint8_t gic_get_running_priority(GICState *s, int cpu, MemTxAttrs attrs)
>       }
>   }
>   
> +/* Return true if we should split priority drop and interrupt deactivation,
> + * ie whether the relevant EOIMode bit is set.
> + */
> +static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)
> +{
> +    if (s->revision != 2) {
> +        /* Before GICv2 prio-drop and deactivate are not separable */
> +        return false;
> +    }
> +    if (s->security_extn && !attrs.secure) {
> +        return s->cpu_ctlr[cpu] & GICC_CTLR_EOIMODE_NS;
> +    }
> +    return s->cpu_ctlr[cpu] & GICC_CTLR_EOIMODE;
> +}
> +
> +static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
> +{
> +    int cm = 1 << cpu;
> +    int group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);

Looks like we don't have to check for gic_has_groups() here, because 
there is no way to set the interrupt group to 1, if gic_has_groups() is 
not true. Anyway,

Reviewed-by: Sergey Fedorov <serge.fdrv@gmail.com>

> +
> +    if (!gic_eoi_split(s, cpu, attrs)) {
> +        /* This is UNPREDICTABLE; we choose to ignore it */
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "gic_deactivate_irq: GICC_DIR write when EOIMode clear");
> +        return;
> +    }
> +
> +    if (s->security_extn && !attrs.secure && !group) {
> +        DPRINTF("Non-secure DI for Group0 interrupt %d ignored\n", irq);
> +        return;
> +    }
> +
> +    GIC_CLEAR_ACTIVE(irq, cm);
> +}
> +
>   void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>   {
>       int cm = 1 << cpu;
> @@ -544,7 +579,11 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>        */
>   
>       gic_drop_prio(s, cpu, group);
> -    GIC_CLEAR_ACTIVE(irq, cm);
> +
> +    /* In GICv2 the guest can choose to split priority-drop and deactivate */
> +    if (!gic_eoi_split(s, cpu, attrs)) {
> +        GIC_CLEAR_ACTIVE(irq, cm);
> +    }
>       gic_update(s);
>   }
>   
> @@ -1210,6 +1249,10 @@ static MemTxResult gic_cpu_write(GICState *s, int cpu, int offset,
>           s->nsapr[regno][cpu] = value;
>           break;
>       }
> +    case 0x1000:
> +        /* GICC_DIR */
> +        gic_deactivate_irq(s, cpu, value & 0x3ff, attrs);
> +        break;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "gic_cpu_write: Bad offset %x\n", (int)offset);
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index ac8cf42..707d00d 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -121,7 +121,7 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
>            * neither it can use KVM.
>            */
>           memory_region_init_io(&s->cpuiomem[0], OBJECT(s), ops ? &ops[1] : NULL,
> -                              s, "gic_cpu", s->revision == 2 ? 0x1000 : 0x100);
> +                              s, "gic_cpu", s->revision == 2 ? 0x2000 : 0x100);
>           sysbus_init_mmio(sbd, &s->cpuiomem[0]);
>       }
>   }

