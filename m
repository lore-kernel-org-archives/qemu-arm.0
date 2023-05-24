Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2630253ejb;
        Wed, 24 May 2023 08:18:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Zr8JgU4lf88uPY4SbE/lF/K23JgJQXMH2oTBtcx8fcgq4r/4H9LW8Bmms4F+5p2nf3s3D
X-Received: by 2002:a05:622a:118f:b0:3ed:ed43:6129 with SMTP id m15-20020a05622a118f00b003eded436129mr30359752qtk.2.1684941490405;
        Wed, 24 May 2023 08:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684941490; cv=none;
        d=google.com; s=arc-20160816;
        b=v6BrbqanuwXol61xFZilEE3545vRCaK+sDrH63eXSjgdZJWNq8dcfd+OZ1Vwftx+xj
         IcPVLwDxCPVktkWXxxTEXUtCcZYYewAIBYEUJ3Tnm7q2+jGBox1xIHZRveCZuLWfK9b1
         CExOx0xjYAfvYDbKoo2CrRjzTqlnOHDiO51FUtxKL7KqS7qDBkoqpvpyhsdOOvuJ1D2U
         acavromJWCEbaSd2ETJsYOA9sBSiEISN16j7RXsECFqDcxPS9pmK2aF2p9avQkDOkv/Z
         /Eya8YMukCZ2tSy1Qv7Sg2jNFday6pkUtg777vN5Aw+yDkrNZSFRgrVss0kQmqVjCCcV
         Y8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=Aqer011XrU8QhlLWL3VDVFSSZ44UDQ23B1rg3lZglNU=;
        b=0gM7per7e1OiPM0uilhRjGIK5h9od0bllKZtrkvjWBGGkniuMcnkbh2LEQzVEqk5Ie
         TeaEulCS13V1F1Ri2PKb/LRLGLGKksUzogobjwEBBlp2M53wskLfIuuMwhSEOx/AXgxQ
         gxc34H/27OdLpFxMKU3CsQ5lyeuh9r0FUrfnUJpgqWL9QDrWQ3xtwKp0A/lq/U+DKbkt
         TgSblVL/ixT33c4dAXEetLNJCXzO6wIUgsHEPq9h9TVESFjYhSDz12NYWdRgEBhdqgRS
         VLmvJ9uSyut9dL4iJuWNlwf8/bcTSzbOCLYTkgm7xSxpIjjViHsz5KyixBXmd5Yuc0Oa
         E0ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=jBNov6dU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=adacore.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p13-20020a05622a048d00b003f4f44d9676si6691249qtx.615.2023.05.24.08.18.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 08:18:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=jBNov6dU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=adacore.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1qFS-00054z-GI; Wed, 24 May 2023 11:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1q1qFQ-00053b-JC
 for qemu-arm@nongnu.org; Wed, 24 May 2023 11:17:56 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1q1qFN-0003kO-SL
 for qemu-arm@nongnu.org; Wed, 24 May 2023 11:17:56 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1ae4e49727eso3739535ad.1
 for <qemu-arm@nongnu.org>; Wed, 24 May 2023 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1684941471; x=1687533471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Aqer011XrU8QhlLWL3VDVFSSZ44UDQ23B1rg3lZglNU=;
 b=jBNov6dUmetFuYmtOyd2dntEmACdnH96b2Z9CFqmn7lnA2cinRUqFdAtIAUj0SAT0E
 AdwDUVfusZ1Hc0lKaCOhvAnYk7tg5EvEaT9oBF2FzaYkAJBCmygrbXbJ+byMB+lwoXCw
 QedMkvc7ercrDqca1iCYh8+UDubh81URyafXM7u6dh9MK9ww3nZ23aiCZVtyeI7xAMk2
 5FPBYeSwfAtThvIpsNE3fQ59TLP4880ABtn+2NJ67IW73oh6xB6lKfZ1+6QFltExnRQW
 y0ueAAIqDJwN5h9TekS6pGncjEr5Km1LWZcc8yQIqf6/zwi1wkbSRnmXwE8DTdWklz6F
 I2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684941471; x=1687533471;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Aqer011XrU8QhlLWL3VDVFSSZ44UDQ23B1rg3lZglNU=;
 b=HrF4kDUxXwNF1m4BMXnHW+OlesB3Kbh4Du6FlXsk4WnQOe0jbKNOMrlvGNocLk0+b5
 XkF2Gs1FnP1pzS7dxxJcbDyQ/l+5AfAOV52y/jFd7KYSjm1WI25T8wKWMimThDeE6ZHk
 x4AiNGH4XFuFZUjOPXo5zkkYaYr38ckVDDpBw7dwk5Bo80Aotl0edOZAV94Us17fGgg9
 h9lWBh5a8is2Tng1YbLPiH/4cr2W+o113ZAAJpeQAHvkTVL7ALjZd7H3Z6PEB6lWzvNT
 PjCkyLHZ6v7ISfe9LkcROGRaPTnb/TXnWKYfzj/AYn8UlpBodcAJRfevUBBMbqNsny1z
 rWDg==
X-Gm-Message-State: AC+VfDwazWtI9Fi9pYfiUZ1Q/+AcViF2TojkQPEp9/MFu7v+PuVwaUWO
 8UFjt3ILb3iqP+EqjgehHhGevonpF9h+wNKw6dPA+A==
X-Received: by 2002:a17:902:6bc2:b0:1ae:6e7b:9bb4 with SMTP id
 m2-20020a1709026bc200b001ae6e7b9bb4mr15649550plt.59.1684941471069; Wed, 24
 May 2023 08:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230524143714.565792-1-chigot@adacore.com>
 <14ef3e93-65b2-5c27-5126-3a67e73dc9da@linaro.org>
In-Reply-To: <14ef3e93-65b2-5c27-5126-3a67e73dc9da@linaro.org>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Wed, 24 May 2023 17:17:40 +0200
Message-ID: <CAJ307EjQMw_sg-2wNRqOSSC8OjXn5Z_4mdYZZBZTOnfEaZaVwA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xlnx-zynqmp: fix unsigned error when checking the
 RPUs number
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, edgar.iglesias@gmail.com, 
 alistair@alistair23.me, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=chigot@adacore.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: M0+lysJEsvow

On Wed, May 24, 2023 at 5:06=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi Cl=C3=A9ment,
>
> On 24/5/23 16:37, Cl=C3=A9ment Chigot wrote:
> > When passing --smp with a number lower than XLNX_ZYNQMP_NUM_APU_CPUS,
> > the expression (ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS) will result
> > in a positive number as ms->smp.cpus is a unsigned int.
> > This will raise the following error afterwards, as Qemu will try to
> > instantiate some additional RPUs.
> >    | $ qemu-system-aarch64 --smp 1 -M xlnx-zcu102
> >    | **
> >    | ERROR:../src/tcg/tcg.c:777:tcg_register_thread:
> >    |   assertion failed: (n < tcg_max_ctxs)
> >
> > Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
> > ---
> >   hw/arm/xlnx-zynqmp.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> > index 335cfc417d..5905a33015 100644
> > --- a/hw/arm/xlnx-zynqmp.c
> > +++ b/hw/arm/xlnx-zynqmp.c
> > @@ -213,7 +213,7 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms=
, XlnxZynqMPState *s,
> >                                      const char *boot_cpu, Error **errp=
)
> >   {
> >       int i;
> > -    int num_rpus =3D MIN(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS,
> > +    int num_rpus =3D MIN((int)(ms->smp.cpus - XLNX_ZYNQMP_NUM_APU_CPUS=
),
> >                          XLNX_ZYNQMP_NUM_RPU_CPUS);
> >
> >       if (num_rpus <=3D 0) {
>
> Can we set mc->min_cpus in xlnx_zcu102_machine_class_init() instead?
>
> -- >8 --
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index 4c84bb932a..60a2710e21 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -269,6 +269,7 @@ static void
> xlnx_zcu102_machine_class_init(ObjectClass *oc, void *data)
>       mc->block_default_type =3D IF_IDE;
>       mc->units_per_default_bus =3D 1;
>       mc->ignore_memory_transaction_failures =3D true;
> +    mc->min_cpus =3D XLNX_ZYNQMP_NUM_APU_CPUS;
>       mc->max_cpus =3D XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPU=
S;
>       mc->default_cpus =3D XLNX_ZYNQMP_NUM_APU_CPUS;
>       mc->default_ram_id =3D "ddr-ram";
> ---
>
> $ qemu-system-aarch64 -M xlnx-zcu102 -smp 1
> qemu-system-aarch64: Invalid SMP CPUs 1. The min CPUs supported by
> machine 'xlnx-zcu102' is 4

We encountered this issue when we were trying to emulate a zynqmp with
only two cortex-a53 cores. I don't have the full context but this was
probably to debug a race condition or something like that.
Thus, I would like to keep the possibility of lowering the CPU number,
even if it doesn't match the real board.

Cl=C3=A9ment
