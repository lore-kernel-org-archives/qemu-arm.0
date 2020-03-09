Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1022559lfc;
        Mon, 9 Mar 2020 04:18:24 -0700 (PDT)
X-Received: by 2002:a9d:a51:: with SMTP id 75mr11619800otg.112.1583752704400;
        Mon, 09 Mar 2020 04:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583752704; cv=none;
        d=google.com; s=arc-20160816;
        b=lyqCGnOTewCdpcYlOl0CNmuXt4ja9okkLzQdOjXSNzJ+rRjAuct8wke2vZ4xA9qCNO
         TVTnM1vZLqevKxVt+SArnni2U4hot8mZr6QcFO3urMhKryoi1hc8ZOn0o50iG0wo8eBg
         5FQINRvCD/9iYfeS7HkPzawbJAaRQ+gdnWE4KJUZUYLpQgbVx2PB5vt+ABkRCB0EKzFE
         gpaXypV7tqiekSiUjezBOpupyFxGm8q581g3Pxk0rZDxBu0bEbcIQP/UDJx180hEJAz9
         YPcmfgfZ4BQP1Ctzd+nxlzFzJ1V9msjHR5TxBt55VuA0/oXDL+kbdRkYzbrnaTedVL1U
         1v4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tPVIgXL/FdByrIYAPc7+POTrdEznd6YhHH7HyAf5JHk=;
        b=R9g7nO0KIQZyBdnpaSdAsVmVAqHg9kJDivin9zfpj7Rc2q2+OqB/EgqSiX2fiJpiSl
         EKTmKOD9pz30e6Bkj7ty0zTCXIbRbD6SRcO2Vexc/FRcO27YTbMX+PynFqvmpTm2CdXm
         +Uc9U8+1XWtEJ/aWyUNuEThq3wo2PMoWLCXfv2mg1A/WrUkTnTR0nXKoeuBN+HTcpG5M
         oA99MrXQMqd0gedxON337p6y2qnrXbM3vQVa4RsmoU4Grz2scv/ViZU+i2dlCUOHvsf6
         rlg4GSQJ4PdRBfNQPww6DCVy40HuqAabe0PjLJTKa8zCrMw9pgc/vbsMSOq6UBYF5okj
         GNxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SBbixkgN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r21sor1848053oic.7.2020.03.09.04.18.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Mar 2020 04:18:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SBbixkgN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tPVIgXL/FdByrIYAPc7+POTrdEznd6YhHH7HyAf5JHk=;
        b=SBbixkgNQt6QCn4/I57V+qNf/5/Ie8XtqhnDC427jT3u9BlUjs0vEsEMk4+5Bxd82E
         QWpKEIqeuHivIrkGLuB4EY/kAU6ylhj2LYMl3vUPYloeVxHenPVFPfYtBQcG5JVHHxXH
         1VfnMux7qDWH83qVLG4KWSdhSkge4X46lU3HUaJTTHMGUhUqbrPIBAz7hRBseg2IS+6k
         o4t/9kWFSDnB5exz43EpJGuEojjrSzL4eHM7k9SgHZ87leYFYP3xb2XNoRuIPfklmCpd
         C5TDewwPcxwYfsOPPNHWS9+9lpGx64L2NpmXwradkWAFIyw4Y20qaSd5nFSagDtixLD4
         bjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tPVIgXL/FdByrIYAPc7+POTrdEznd6YhHH7HyAf5JHk=;
        b=BX1U9R6zG0DGRlX7fwuYIzxv4HFaHW32VkvgK40IVHCMxOy+P20PV6Bywf0GwfoJ/s
         IcMKZeok73Jyll4/pZuYl5zN7YkbD8xQx9Ze/eWS1cuWgSm+60Shebiw2k5LbaVMwgOy
         VXQqKr6IoMsgNyJ71Zub0fJ2eHbV4h1xAS6QYI5qrCPXdFAa56BlXI4iE9TVRTM9FQQo
         rHrGE1qQ5pwM9o3Nt4jTSVqff/tSsNB0Q8U+5p9Z3no95K/TNBqHH0iug4m0fZ7OLWtd
         9sGfnSGcDay3VgmmRNutxpqpq8FmQ0rB0jQrpsXyM8QylVoY02IOIYFLB+dnoHcUbCcf
         wqLg==
X-Gm-Message-State: ANhLgQ3ITt9g4EvhHD8pTHK5wwxfbY4Ne70FuGuRYxEFwecIGz4JIzrV
	hJnFwS87T4lNSfV0vwv8wJMVwPoxUdIu2RyM54/SSZ5t
X-Google-Smtp-Source: ADFU+vvYMl+XkB6EY3jdh0NZlSDjk+IY5/RbOSWCl2FkYxuz057GyycYa1IeeSVrOIu8J9upLeIwNPGlOyshHr81pQs=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr11283474oiy.170.1583752703873;
 Mon, 09 Mar 2020 04:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-7-nieklinnenbank@gmail.com> <87d09t7i8i.fsf@linaro.org> <CAPan3Wo6_15zFSHJwf0hVq9CVUSfOBU+frwSLQX21SWrXW03iA@mail.gmail.com>
In-Reply-To: <CAPan3Wo6_15zFSHJwf0hVq9CVUSfOBU+frwSLQX21SWrXW03iA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 11:18:12 +0000
Message-ID: <CAFEAcA_wTrqgAh+NK5jmtqPeU9y6bhouzaXWQyPR_iYU5waOGg@mail.gmail.com>
Subject: Re: [PATCH v6 06/18] hw/arm/allwinner: add CPU Configuration module
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: sBUa6wL4VopL

On Tue, 3 Mar 2020 at 20:15, Niek Linnenbank <nieklinnenbank@gmail.com> wro=
te:
> On Tue, Mar 3, 2020 at 1:09 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
>> > +static void allwinner_cpucfg_cpu_reset(AwCpuCfgState *s, uint8_t cpu_=
id)
>> > +{
>> > +    int ret;
>> > +
>> > +    trace_allwinner_cpucfg_cpu_reset(cpu_id, s->entry_addr);
>> > +
>> > +    ret =3D arm_set_cpu_on(cpu_id, s->entry_addr, 0,
>> > +                         CPU_EXCEPTION_LEVEL_ON_RESET, false);
>>
>> According to the arm_set_cpu_on code:
>>
>>     if (!target_aa64 && arm_feature(&target_cpu->env, ARM_FEATURE_AARCH6=
4)) {
>>         /*
>>          * For now we don't support booting an AArch64 CPU in AArch32 mo=
de
>>          * TODO: We should add this support later
>>          */
>>         qemu_log_mask(LOG_UNIMP,
>>                       "[ARM]%s: Starting AArch64 CPU %" PRId64
>>                       " in AArch32 mode is not supported yet\n",
>>                       __func__, cpuid);
>>         return QEMU_ARM_POWERCTL_INVALID_PARAM;
>>     }
>>
>> Do you really want to reboot in aarch32 mode on a reset? If so we should
>> fix the TODO.
>
> The Allwinner H3 has four ARM Cortex-A7 cores and are 32-bit, so in the
> early version I filled the @target_aa64 parameter with false to
> keep it in 32-bit mode. And for usage in the current Allwinner H3 SoC
> that is sufficient, but as soon as a potential new SoC implementation
> with a 64-bit CPU starts to use this module, the hardcoded @target_aa64
> parameter will become a problem.

> Maybe I should just use some function to check if the current emulated
> CPU its 32-bit or 64-bit and use that for @target_aa64?

If the intended behaviour is "just power on the CPU into EL3
in the aarch32/aarch64 state it would naturally have out of reset"
then you can get the right value to pass to target_aa64 like this:

   ARMCPU *target_cpu =3D ARM_CPU(arm_get_cpu_by_id(cpu_id));

   if (!target_cpu) {
       /*
        * handle the case of "guest wrote bogus value to RST_CTRL
        * field, probably by returning doing nothing
        */
   }
   target_aa64 =3D arm_feature(&target_cpu->env, ARM_FEATURE_AARCH64);

Or if the required behaviour for a 64-bit CPU is more complicated
you can just assert or something with a comment that this would need
updating if we ever modelled a 64-bit Allwinner SoC.

thanks
-- PMM
