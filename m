Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1863215ejb;
        Fri, 8 Mar 2024 07:02:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWVyI5zNpv4E+4Cs2acbr/WwZGoGVk/RRAq4pXWI0nfqa5qj3to1PQtZcSTzasGxw/xQS9x2Nu3CRydFxWQU9cefwQ3FP5z
X-Google-Smtp-Source: AGHT+IFTxvg3NrMYzmtTzn3VVc7kw5yFkquieKCCcwdCb5DHrqmwCrbVvcpnfOyQma8unhAvHaue
X-Received: by 2002:a05:6214:b23:b0:690:b727:b99a with SMTP id w3-20020a0562140b2300b00690b727b99amr1329429qvj.5.1709910139415;
        Fri, 08 Mar 2024 07:02:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709910139; cv=none;
        d=google.com; s=arc-20160816;
        b=l8nDxhwtcIPWLgWqDrhFrsd/T0fZXvz/Qqbt0rzpsfbbk5lY+23wK+uSteGxyfg2mM
         FprO99mBYQ0tVsFZ2xkGoRj0G9/HaRqtj1ZTUnwaTznbmVq6FrmhoDb94brXCeq41ijn
         m3mJyi6BlTZB1flu8NIwXwmit+NdGG86s6Em5+Es/KDa9P0odTTWN4aM0wlxezJsfa6N
         K7VzkNp1922maPaCTCwvL0FaYMMrfeX9qqmQBVSdnhaloVaaYVlxdish8uONgiNnftQn
         ZtJwRTeuUBIPoWfqEFJ9yu4ot3vEbCF17WkVq6MiXBVUTLiUUp7VyDFukPRJwFdRhYF5
         VkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wgb4/nwWcRVUazmGKiAvCcoOR0ZggHLtVCwE62RSFCs=;
        fh=wZblXrue4OXuWIb/ScdIuSwQjd+P9HXWIU//DCvhScU=;
        b=lb7XtLHpqjJaPZrjF1ahAURXbns4xSujx161N83EAJTY4Kk/omaTskOzOtNJpzccIn
         lQDilYf21xM+zQehL7YPI4QI8EQ5Ufl+/lqBXWdPZE/qOVhAkO3Tc2NU7CAP3fn94AG4
         TEO6NylQv6rcwv27kH8MyX10S0TPz9EXmXUhGfK5dnhZVXkT3omT6E7/n7Lm+5e7WpoL
         h1Y8Rn1jTp47fdtPy/IT4GnPqP5QUNK6R+xgXYivQIxNlPUD03NKhMMLYCHlhUDLEUCH
         YEUePWwiiNtXVycgOeRQBV6WYYQs5NWPZ2txQNZEucYbjR/2c1RhjyOJ9usSiAjTa/yN
         DWEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=Z6fhbJBr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 7-20020a0562140dc700b0068cb950df8asi19972831qvt.5.2024.03.08.07.02.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2024 07:02:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=Z6fhbJBr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ribjD-0006aP-40; Fri, 08 Mar 2024 10:01:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1ribj8-0006ZM-CZ
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 10:01:39 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1ribj2-0007Q7-V0
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 10:01:36 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-29bb557cb05so407885a91.1
 for <qemu-arm@nongnu.org>; Fri, 08 Mar 2024 07:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1709910091; x=1710514891; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgb4/nwWcRVUazmGKiAvCcoOR0ZggHLtVCwE62RSFCs=;
 b=Z6fhbJBrpBF59OdtDEwr2O4lQrKNX6KJlmnBVopQrwwEP0OnPQgZ3Z6DtIv91yKA+/
 7VW84EBHrlSHdY7oa8F6Wdv5oHbj9NWBCc4dYJADWRSFKd93e2+OR49E37kfX0/kqks7
 BvIDGoAltrwh+tT0j9sVvm/dZGMBe6ndTXsAdrahZR9LtOvnUAwZG59zFkhGjOx+Yv7A
 366HJ++S+JRb+yAFEBAf5i2SfWxtEVexX3pD3i3Giwo87u51+pgL78hiGDcCUd1JsaLi
 D1pJxYBrqxXVyb8TFREqFXwdbWrSC77eLy+RbbFp9OlWeWCZ8sRE4SviK4oHnR6SSLAX
 TESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709910091; x=1710514891;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wgb4/nwWcRVUazmGKiAvCcoOR0ZggHLtVCwE62RSFCs=;
 b=BjppGaNlBp9b0k1PkqHj0zGX0j7ZXGhzJo3jPYAaloMp63OOgfF+r/dA1LclU28ak2
 U1o6k3GCZ7Itc+hRs2TSGsvEm3zDxtEQkEhdcZdFH0K3i9Qe+neFLXGL1tqRPeL3EApK
 wOqOHBxv5i2qJ/dFUedgkH9drkSJCgg7c6bfdUsXKIr16sSIAcOfjiBiYcNng7xyBE8n
 uo/CI6V0mpTwAI5BQ8IMzPCpmpRphmMKMuwXj9oUf2/DctPtatbO4PmzJj1MBFL2Yhka
 waT90KDg9Fr7JMOpOPteXLXcC6+JFTG/RomqUagaIjArU8b//pIKPQcGP2EcPccexZ9J
 fV+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4T/gmzMpPL2lgHAHs66WWO+qk/BMlOfxeUjtKpeNTpJWW3tEYlWQXKtAaTSjl5LJ7bKiesOK2HO157PVi/Myspp+j
X-Gm-Message-State: AOJu0Ywj+eMt6uWV7pXbcgZIi4a8h9d8MAa8fBIYS3LVfOGsOq2mwCYi
 cgiYets7xaLX/0plkOgzjraFTvpfd6Zi94BwwI0cCoCkrJCwwL8yj54C5PGmvWuquRD1i1yCo7s
 1ylr+6exK0jb79i8F4VDrqjnjxiz5zo30Z2xW
X-Received: by 2002:a17:90a:e544:b0:29b:178e:d9cb with SMTP id
 ei4-20020a17090ae54400b0029b178ed9cbmr208905pjb.44.1709910090977; Fri, 08 Mar
 2024 07:01:30 -0800 (PST)
MIME-Version: 1.0
References: <20240215175752.82828-1-philmd@linaro.org>
 <20240215175752.82828-35-philmd@linaro.org>
 <CAFEAcA-HpKCk-n4HsnZPiz09xq9sk=Sh5nt05KpRymy-NQ2HEg@mail.gmail.com>
In-Reply-To: <CAFEAcA-HpKCk-n4HsnZPiz09xq9sk=Sh5nt05KpRymy-NQ2HEg@mail.gmail.com>
From: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Date: Fri, 8 Mar 2024 16:01:19 +0100
Message-ID: <CAJ307EhHYucqcYSDPzX6Bt9YYUxfWkOSEXLGwNTb2ivJhm=j3w@mail.gmail.com>
Subject: Re: [PULL 34/56] hw/intc/grlib_irqmp: add ncpus property
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, Frederic Konrad <konrad.frederic@yahoo.fr>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=chigot@adacore.com; helo=mail-pj1-x102b.google.com
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
X-TUID: TjW7hB1DO/FH

On Fri, Mar 8, 2024 at 2:27=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org> wrote:
>
> On Thu, 15 Feb 2024 at 18:04, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
> >
> > From: Cl=C3=A9ment Chigot <chigot@adacore.com>
> >
> > This adds a "ncpus" property to the "grlib-irqmp" device to be used
> > later, this required a little refactoring of how we initialize the
> > device (ie: use realize instead of init).
> >
> > Co-developed-by: Frederic Konrad <konrad.frederic@yahoo.fr>
> > Signed-off-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Message-ID: <20240131085047.18458-3-chigot@adacore.com>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Hi; Coverity points out a bug in this commit (CID 1534914):
>
>
> > -static void grlib_irqmp_init(Object *obj)
> > +static void grlib_irqmp_realize(DeviceState *dev, Error **errp)
> >  {
> > -    IRQMP *irqmp =3D GRLIB_IRQMP(obj);
> > -    SysBusDevice *dev =3D SYS_BUS_DEVICE(obj);
> > +    IRQMP *irqmp =3D GRLIB_IRQMP(dev);
> >
> > -    qdev_init_gpio_in(DEVICE(obj), grlib_irqmp_set_irq, MAX_PILS);
> > -    qdev_init_gpio_out_named(DEVICE(obj), &irqmp->irq, "grlib-irq", 1)=
;
> > -    memory_region_init_io(&irqmp->iomem, obj, &grlib_irqmp_ops, irqmp,
> > +    if ((!irqmp->ncpus) || (irqmp->ncpus > IRQMP_MAX_CPU)) {
> > +        error_setg(errp, "Invalid ncpus properties: "
> > +                   "%u, must be 0 < ncpus =3D< %u.", irqmp->ncpus,
> > +                   IRQMP_MAX_CPU);
> > +    }
>
> We detect the out-of-range 'ncpus' value, but forget the "return"
> statement, so execution will continue onward regardless, and
> overrun the irqmp->irq[] array when we call qdev_init_gpio_out_named().

Indeed, I'll send a patch.
Thanks for pointing that out.

Cl=C3=A9ment

> > +
> > +    qdev_init_gpio_in(dev, grlib_irqmp_set_irq, MAX_PILS);
> > +    qdev_init_gpio_out_named(dev, &irqmp->irq, "grlib-irq", 1);
> > +    memory_region_init_io(&irqmp->iomem, OBJECT(dev), &grlib_irqmp_ops=
, irqmp,
> >                            "irqmp", IRQMP_REG_SIZE);
> >
> >      irqmp->state =3D g_malloc0(sizeof *irqmp->state);
> >
> > -    sysbus_init_mmio(dev, &irqmp->iomem);
> > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &irqmp->iomem);
> >  }
>
> thanks
> -- PMM
