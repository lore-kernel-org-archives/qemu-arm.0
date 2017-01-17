Received: by 10.25.205.13 with SMTP id d13csp709281lfg;
        Tue, 17 Jan 2017 13:51:23 -0800 (PST)
X-Received: by 10.55.99.81 with SMTP id x78mr42434131qkb.62.1484689883884;
        Tue, 17 Jan 2017 13:51:23 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f72si12795178qka.229.2017.01.17.13.51.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jan 2017 13:51:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37847 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cTbez-00080G-9O
	for alex.bennee@linaro.org; Tue, 17 Jan 2017 16:51:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTbdq-0007wN-Mj
	for qemu-devel@nongnu.org; Tue, 17 Jan 2017 16:50:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1cTbdq-0005rG-2A
	for qemu-devel@nongnu.org; Tue, 17 Jan 2017 16:50:10 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:35920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1cTbdn-0005lb-QZ; Tue, 17 Jan 2017 16:50:07 -0500
Received: by mail-ot0-x244.google.com with SMTP id 36so10372599otx.3;
	Tue, 17 Jan 2017 13:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=a/NfgMTM/12R7U96+rLNSbp0kvQipNAkASSfgXAbGhw=;
	b=iFLhHbeva0nuL54RQT3Z8W/qSJq1bUalzXbPWi7S4KdC3EyVyJqJlkAR6x2HvzCK4G
	7SPXTb5zqcOi0nqTPNvoz9YDV/t95YSgqfuIjMjzawT4DV2Qyd2uY5hxR/2FI3owkyV7
	FEy/iyyKIcG9pfZ/W7LsMaJikZxGoJovRSufS0YQmMPvxgt0lpTtYpJpUnoPRKT11AkU
	pBpfLXIJuFN6K4exlfyLyeHyfLUVoyTqsDoJPY6yY0j/nHScl6DViAlRHqY+p9/YlLpz
	B+j6Ln3YzTmCn1mgw5XeacUcqOgbCqNfHk9gf9VsiAg/C46CErgZm0zQWS6fJ/xKlyDB
	X0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=a/NfgMTM/12R7U96+rLNSbp0kvQipNAkASSfgXAbGhw=;
	b=Mj9AijQ2BW72ds+osYNzB83Aed43YAeWGP4gyYC0hTt02UD8c7yyLim8L18eb+KLi3
	4L92JikQIXda52zcCDEgXvRCo+uA88QI3Y8hh6bh9JHVFf6ZYmXn518mcCQbWcC3uwZ6
	+2zKbS64xauXLrl2x9SHfjq67xNdFhR+VTpdyB7JUl38aP+aVoR2iFuQjw/6X9JU6ToW
	vJ5wo3IMbOXJiM4LygjnkjmdAr8OLkoiyrXKUHKM+ZE4BSDskBzltsNLsw1xdXp8W9iz
	C7O3dVUaNnKY4wBvwLO9vcrleTaTAUXp+cGHRWiRHJNSyGhDb6mrl0fE4O2w7iRZmQm6
	y+UA==
X-Gm-Message-State: AIkVDXJ8JwG4yVL0+kr8KNqbcq5s/kK8Zp1pxm5ZO6kMaFydNjk8kbkgxcJ4iJ/ttggrfeEaadTeNoQTsted/Q==
X-Received: by 10.157.19.117 with SMTP id q50mr21711123otq.54.1484689805605;
	Tue, 17 Jan 2017 13:50:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.98.133 with HTTP; Tue, 17 Jan 2017 13:49:35 -0800 (PST)
In-Reply-To: <1483977924-14522-2-git-send-email-peter.maydell@linaro.org>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<1483977924-14522-2-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 17 Jan 2017 13:49:35 -0800
X-Google-Sender-Auth: 8HETLH1l3KSbtkrPBngrzj_If6I
Message-ID: <CAKmqyKMBpvETvPGEG+amBBaubA7GDban8fc+iDMexVNdm6BC5g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-devel] [PATCH v2 01/18] hw/intc/arm_gicv3: Add external
 IRQ lines for VIRQ and VFIQ
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Andrew Jones <drjones@redhat.com>, Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KZ+6pZqXFVU1

On Mon, Jan 9, 2017 at 8:05 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Augment the GICv3's QOM device interface by adding two
> new sets of sysbus IRQ lines, to signal VIRQ and VFIQ to
> each CPU.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  include/hw/intc/arm_gicv3_common.h | 2 ++
>  hw/intc/arm_gicv3_common.c         | 6 ++++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 341a311..beb2c77 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -145,6 +145,8 @@ struct GICv3CPUState {
>      CPUState *cpu;
>      qemu_irq parent_irq;
>      qemu_irq parent_fiq;
> +    qemu_irq parent_virq;
> +    qemu_irq parent_vfiq;
>
>      /* Redistributor */
>      uint32_t level;                  /* Current IRQ level */
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 0aa9b9c..0ee67a4 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -126,6 +126,12 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>      for (i = 0; i < s->num_cpu; i++) {
>          sysbus_init_irq(sbd, &s->cpu[i].parent_fiq);
>      }
> +    for (i = 0; i < s->num_cpu; i++) {
> +        sysbus_init_irq(sbd, &s->cpu[i].parent_virq);
> +    }
> +    for (i = 0; i < s->num_cpu; i++) {
> +        sysbus_init_irq(sbd, &s->cpu[i].parent_vfiq);
> +    }
>
>      memory_region_init_io(&s->iomem_dist, OBJECT(s), ops, s,
>                            "gicv3_dist", 0x10000);
> --
> 2.7.4
>
>
