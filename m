Received: by 10.25.77.65 with SMTP id a62csp519721lfb;
        Fri, 10 Feb 2017 06:53:51 -0800 (PST)
X-Received: by 10.28.17.133 with SMTP id 127mr7666253wmr.80.1486738431479;
        Fri, 10 Feb 2017 06:53:51 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x230.google.com (mail-wr0-x230.google.com. [2a00:1450:400c:c0c::230])
        by mx.google.com with ESMTPS id a9si2449164wrb.49.2017.02.10.06.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Feb 2017 06:53:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::230 as permitted sender) client-ip=2a00:1450:400c:c0c::230;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::230 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x230.google.com with SMTP id 89so109734141wrr.2
        for <alex.bennee@linaro.org>; Fri, 10 Feb 2017 06:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BCGdx/qCjmGPcaYyvx7L/BIf8FJIeVzqkCuxf84PnQQ=;
        b=cS0cH6rBFKpR3oIGrqlPc6SsGKblnzz7MwEExG5RFgGjBYwrUXpfhapDFuj2I0/jSz
         GE/py3x9aomYHSMyIXb9V7y430tIEgAhcgIniaLCewvmd7TaBWaI4VXdoCQ1d9saUlQ7
         gTikWKkJymMGa7aKD+q9daIvTbeyMQYGVKNh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BCGdx/qCjmGPcaYyvx7L/BIf8FJIeVzqkCuxf84PnQQ=;
        b=N/toLdxXnP4mykmOtIqwceEIJUTpU11XKPD0g2UY9PoW4LXZqCTK/GZlpzz8iybvyB
         IKWEOcHabWRivrv+G1keYYRjFdvqTXNcyR+Snr23pijlFMhnVraHDSmeYgbXCxNqr9Mi
         Ssm1O8o4BYtwVb17fbwFPjQiOTAknMe9xE5dJSbkgb25EkOJB4EFOpVSqYV/HaGYIDhk
         tedqvSc2Igld7HZ0e7/DZ7C6g+zVC0raxH9ph1Km5Ln/9zUhed4GPIoODp7ZwDd5W7jL
         rBXntWeiDIGKWJhDRZIlbbmAoW+XYkm87Rz5XgDJg7KPUICb2MWGPz8ghdEtn2KHCCJC
         dX/A==
X-Gm-Message-State: AMke39lHgcIr84WlW/a7BoqZKMyC6Rf8Klf+nbpDDB6SefRXnZq/3ccD7RLgzGhHid2tnchMXikjr90HxKKcFktNJ80=
X-Received: by 10.223.142.131 with SMTP id q3mr7978733wrb.195.1486738431072;
 Fri, 10 Feb 2017 06:53:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 10 Feb 2017 06:53:30 -0800 (PST)
In-Reply-To: <20170209170904.5713-24-alex.bennee@linaro.org>
References: <20170209170904.5713-1-alex.bennee@linaro.org> <20170209170904.5713-24-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2017 14:53:30 +0000
Message-ID: <CAFEAcA8_UNip6QooREop-T5RBpdo1me0piEAscJRC+G7tGcNrA@mail.gmail.com>
Subject: Re: [PATCH v11 23/24] hw/misc/imx6_src: defer clearing of SRC_SCR
 reset bits
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, MTTCG Devel <mttcg@listserver.greensocs.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, Peter Chubb <peter.chubb@nicta.com.au>, 
	"open list:i.MX31" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: cFI5xfojHnAG

On 9 February 2017 at 17:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> The arm_reset_cpu/set_cpu_on/set_cpu_off() functions do their work
> asynchronously in the target vCPUs context. As a result we need to
> ensure the SRC_SCR reset bits correctly report the reset status at the
> right time. To do this we defer the clearing of the bit with an async
> job which will run after the work queued by ARM powerctl functions.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/misc/imx6_src.c | 58 +++++++++++++++++++++++++++++++++++++++++++++---=
------
>  1 file changed, 49 insertions(+), 9 deletions(-)
>
> diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
> index 55b817b8d7..f7c1d94a3e 100644
> --- a/hw/misc/imx6_src.c
> +++ b/hw/misc/imx6_src.c
> @@ -14,6 +14,7 @@
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
>  #include "arm-powerctl.h"
> +#include "qom/cpu.h"
>
>  #ifndef DEBUG_IMX6_SRC
>  #define DEBUG_IMX6_SRC 0
> @@ -113,6 +114,45 @@ static uint64_t imx6_src_read(void *opaque, hwaddr o=
ffset, unsigned size)
>      return value;
>  }
>
> +
> +/* The reset is asynchronous so we need to defer clearing the reset
> + * bit until the work is completed.
> + */
> +
> +struct src_scr_reset_info {

Struct names should be CamelCase.

> +    IMX6SRCState *s;
> +    unsigned long reset_bit;

Unsigned long ? That's always a bit of a red flag because it's
variable in size from host to host. I think you want "int".

> +};
> +
> +static void imx6_clear_reset_bit(CPUState *cpu, run_on_cpu_data data)
> +{
> +    struct src_scr_reset_info *ri =3D data.host_ptr;
> +    IMX6SRCState *s =3D ri->s;
> +
> +    assert(qemu_mutex_iothread_locked());
> +
> +    s->regs[SRC_SCR] =3D deposit32(s->regs[SRC_SCR], ri->reset_bit, 1, 0=
);
> +    DPRINTF("reg[%s] <=3D 0x%" PRIx32 "\n",
> +            imx6_src_reg_name(SRC_SCR), s->regs[SRC_SCR]);
> +
> +    g_free(ri);
> +}
> +
> +static void imx6_defer_clear_reset_bit(int cpuid,
> +                                       IMX6SRCState *s,
> +                                       unsigned long reset_shift)
> +{
> +    struct src_scr_reset_info *ri;
> +
> +    ri =3D g_malloc(sizeof(struct src_scr_reset_info));
> +    ri->s =3D s;
> +    ri->reset_bit =3D reset_shift;
> +
> +    async_run_on_cpu(arm_get_cpu_by_id(cpuid), imx6_clear_reset_bit,
> +                     RUN_ON_CPU_HOST_PTR(ri));
> +}

What happens if we do a system reset between calling this
and the async hook running? Do all the outstanding async
run hooks guarantee to run first?

I guess a malloc-and-free is OK since the guest isn't going to be
bouncing CPUs through reset very often, though it's a bit ugly to
see in device code.

Otherwise this looks OK.

thanks
-- PMM
