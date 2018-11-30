Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3838977wrt;
        Fri, 30 Nov 2018 09:39:34 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U/npi8E6lJQuFNkHc+GTRs4dP8DVXe495ASIhybwIVw3R8k1B9D3jMcdKkfzV4svC0fd2S
X-Received: by 2002:a81:6c51:: with SMTP id h78mr6562354ywc.116.1543599574609;
        Fri, 30 Nov 2018 09:39:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543599574; cv=none;
        d=google.com; s=arc-20160816;
        b=gUVkthcfojupdBu4hIxxF4jZDFbP8NMzIXupV/pu0YN+5O+tupBBTYaE/45jZsP0ge
         lk7fTlhAa94IKxBCy7B2vl/vR5gdJRX7gRGVxOpP2ewPZ9QPfx0fkxjR0YBApUoPG+Xb
         XA06PiNMN0sI69YvlcTAiI8Lm28a0K8u4ZeHh/CYcyXiQBJGcbMWw+uQCiYWZ71TRVc7
         koMkbzIhCvm2sBmS2dggHbyLe4UjZFPnxdm/UOFkprPAU020G3oWgQP7CvXanpPqC+Er
         eWdr7KLIjOQ7PrHZ+ac1bnfKNhtSwXbOhGfs24VB/j+4UufwWVKlSAeOA5SA1CvwMMsf
         EZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+0Jc10Qa6DFvTzr4cv8ILOjLWfoFX64iA+HsKrIHQl4=;
        b=vpAVWTweM8fYsrqzvFZiII9K9QpZScx16BRKVq33E76CaBeVWG6ACPmXkqmSibrqea
         5paa2OE8AdKcZ1us6+SQo4ick/rspA2JHdKlhYlMrTEAW9QdzAS3rwdfZTaSgBDy1Vw5
         gjeUgz8CELV8PYZ3NQGq6VzGRR3kxPBW4ucqS4Hle2oR833zJuZfqt2Esh12jyAdV7GY
         39I5M4ZduSJlz8Uq+4haYMVvvV9jSg2vHBrUqkm/SPmp5R0CgYS4VZBB0A1OMf2nj/uD
         u8RrUy6eM+YvBd2/ZRY4MHI8NRJaEHoNiPd2b8wR1IvZxdozMAUk6VNONDalrYhaEJoy
         LGaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u50OtnWr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7-v6si3531265ywf.398.2018.11.30.09.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 09:39:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=u50OtnWr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33981 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSmlK-0003fK-0i
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 12:39:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gSml7-0003eC-TV
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 12:39:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gSml7-0000WA-46
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 12:39:21 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:42911)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gSml1-0000SJ-W7; Fri, 30 Nov 2018 12:39:17 -0500
Received: by mail-lf1-x143.google.com with SMTP id l10so4685692lfh.9;
	Fri, 30 Nov 2018 09:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+0Jc10Qa6DFvTzr4cv8ILOjLWfoFX64iA+HsKrIHQl4=;
	b=u50OtnWrb01sFxtgm1XY1KuQ7pVj/LDiBtCKSyAfblzDyEZpSvqEsoZoSrJhVDNJjw
	F811h1zn7nHsr66u7M3S1pMBlkFEaSO60wq+N37+vfWDSr6r29r1MKA2XKFGsFc1ZTrH
	zVez/oZ4hJGnWSZBF8+twccuk+PjPPOhoUtS/buXIKeFqMOhb7CsJauqxxfDDiNMudSZ
	hEnA/NABBHvJsrgFlg4I5x1Bfc1njP/XdTvg/bR8Z29OMw7eC9WuMbFYL9PS7cFmXid7
	1TpZiDi1uStb06iAb+t8zEDtrw72Bi2xfdjlhCoY4CFDCsdlNIdFplbW4QUQ+UjosjZA
	U8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+0Jc10Qa6DFvTzr4cv8ILOjLWfoFX64iA+HsKrIHQl4=;
	b=Q/m7NnHAGiBfcC+1VmZ5urF2MWJaYnbMA28khL1uG/3RD52RZUKqAizpl4mtmV6eWA
	39lOokaCgk5i9h2tLaMmnI92p6FrcOtTmRAKYtYFctTv4tybcgVwX76ppYtW1qWC2u9y
	X9njfuuQKT/ALPlVzKcDHnt8BLJjm8RqoS9LOTyAogDwPrZwzDGQ8W8GH8tAYBihCI4x
	aw5boFJGygowkehCvLuAJGVULgGw+1pBX9WaPhor6QaXbNc066FxaJfStdZgJh14FSSD
	V97vKUkgbjcuIZ0FBNf7zdtuihhCIiDrv1VLVU/0XfWaFoyWZBmCqvrepUTnGicdxe/2
	iSXg==
X-Gm-Message-State: AA+aEWY5xngdkTI359k5wzlEf5bWxEhWOzNKYvVLrDCpLwOHKcg3Faaq
	/k+qSlqJ6oelGTZN4ys/ubPaECWod7xd8F9ClWI=
X-Received: by 2002:a19:1f0a:: with SMTP id f10mr3930639lff.94.1543599550851; 
	Fri, 30 Nov 2018 09:39:10 -0800 (PST)
MIME-Version: 1.0
References: <20181129163655.20370-1-edgar.iglesias@gmail.com>
	<20181129163655.20370-4-edgar.iglesias@gmail.com>
In-Reply-To: <20181129163655.20370-4-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 30 Nov 2018 09:38:43 -0800
Message-ID: <CAKmqyKOrVy5EhWCemPfkLEYWhi7N8jbyzN98KYmVsw=Kde6KEw@mail.gmail.com>
To: Edgar Iglesias <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 3/4] hw/arm: versal: Use IRQs
 111 - 118 for virtio-mmio
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
Cc: figlesia@xilinx.com, Peter Maydell <peter.maydell@linaro.org>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Stefano Stabellini <sstabellini@kernel.org>, muhammad_bilal@mentor.com,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k40/uMw7+QMA

On Thu, Nov 29, 2018 at 8:39 AM Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Use IRQs 111 - 118 for virtio-mmio. The interrupts we're currently
> using 160+ are not available in the Versal GIC.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-versal-virt.c    | 4 ++--
>  include/hw/arm/xlnx-versal.h | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 2ed6ee9934..c6feeac532 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -351,7 +351,7 @@ static void create_virtio_regions(VersalVirt *s)
>      for (i = 0; i < NUM_VIRTIO_TRANSPORT; i++) {
>          char *name = g_strdup_printf("virtio%d", i);;
>          hwaddr base = MM_TOP_RSVD + i * virtio_mmio_size;
> -        int irq = VERSAL_RSVD_HIGH_IRQ_FIRST + i;
> +        int irq = VERSAL_RSVD_IRQ_FIRST + i;
>          MemoryRegion *mr;
>          DeviceState *dev;
>          qemu_irq pic_irq;
> @@ -368,7 +368,7 @@ static void create_virtio_regions(VersalVirt *s)
>
>      for (i = 0; i < NUM_VIRTIO_TRANSPORT; i++) {
>          hwaddr base = MM_TOP_RSVD + i * virtio_mmio_size;
> -        int irq = VERSAL_RSVD_HIGH_IRQ_FIRST + i;
> +        int irq = VERSAL_RSVD_IRQ_FIRST + i;
>          char *name = g_strdup_printf("/virtio_mmio@%" PRIx64, base);
>
>          qemu_fdt_add_subnode(s->fdt, name);
> diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
> index 9da621e4b6..76fb9de391 100644
> --- a/include/hw/arm/xlnx-versal.h
> +++ b/include/hw/arm/xlnx-versal.h
> @@ -75,9 +75,9 @@ typedef struct Versal {
>  #define VERSAL_GEM1_IRQ_0          58
>  #define VERSAL_GEM1_WAKE_IRQ_0     59
>
> -/* Architecturally eserved IRQs suitable for virtualization.  */
> -#define VERSAL_RSVD_HIGH_IRQ_FIRST 160
> -#define VERSAL_RSVD_HIGH_IRQ_LAST  255
> +/* Architecturally reserved IRQs suitable for virtualization.  */
> +#define VERSAL_RSVD_IRQ_FIRST 111
> +#define VERSAL_RSVD_IRQ_LAST  118
>
>  #define MM_TOP_RSVD                 0xa0000000U
>  #define MM_TOP_RSVD_SIZE            0x4000000
> --
> 2.17.1
>
>
