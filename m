Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727D8EB2704
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 19:25:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vptMo-0000jx-8e; Tue, 10 Feb 2026 14:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vptMf-0000jA-8S
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 14:25:37 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vptMd-0003Xu-Fz
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 14:25:36 -0500
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-505d3baf1a7so48381cf.1
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 11:25:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770751533; cv=none;
 d=google.com; s=arc-20240605;
 b=AS/B2vx8lZ3lKFCJuakpr9V+X+xs/E5IAzSQHgyXYnMzUxzkqzkaL7fI37U2SDOHVu
 RmWbyGdJTFlH2LpjnBbG5xpok7Ti8jNinfnbOuLgopiP+p6hb+Kx2nHIuA+hkz3K3HD6
 u5KHqFmbyLW6dd4eKcxfOOoNd329jclGcoBV7kVHaIALIeIyqSaLh5vqyUWPePAfNXoS
 Nvj11zYVzmrKPEs+4sC2XE8fzMld57Futy6O/yr8fjPF3vn7SfOejhQ4ezuaeKk/Svxo
 QaVJuQIv+pX7rk12UcSRNGS4ZTOlJGWTTLo98Atlgzb2btVBjNx/eCoo7+E8mYQzNqvU
 sGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=IYXaxxlBgc8Kqkh4DZ+jrMOV88/UOIu8btwWCvjGJBs=;
 fh=H2MVxiJUG9y4yNnM+wNizZdzwoWfciN5bD+p14zDwKM=;
 b=GNj73Keq1FygAUzkbDsM5gvwkav6vN7stxhBIloHyWMoSoS9C+u/I6IWwtOyC016Sr
 cq9N6uug3HGlEFpNrtyT3rSSc0mjuraLbRqWEA3/8099yp/d7iWpNkQ97pufo/BqXlVU
 gwq9SD08MyEIu7yPz2Mi2+c+2fpC7msx/fdqpgbjgCcoCKmCRHVQ0oKF1kZNwdaK6bFW
 ZurbDPYAR7sJZbosj4zKhO7Rp3fOMAVc2N8oxyeW+FVGoF0ydv9ziDeM8eLfK6xVt+zo
 SuGmlq6RmtgBlCMzbimifJftslxCcRJUXiDtMZpaoG/MbJAx1wEbnzyHNms6y8VoJpQg
 JlVg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1770751533; x=1771356333; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYXaxxlBgc8Kqkh4DZ+jrMOV88/UOIu8btwWCvjGJBs=;
 b=t28JaZymDK/yIzfrCNQhM0QeRbwOcDsSwhbwSz+LVh5keZY3GojcqvvEHKndwbAdC4
 gRbsoGulWm0uQ1heUJ+2xLXqkKpTOvxHNonau8BucMPKq0inhQonvXtWoJu02DyZU5u0
 v6cRqOTjtrI0JiSb2yG23hyhd+yWuz6B6GgTAINmRSvRdG12DN3xypMsW46K5pJjfmZi
 vEr3HUsX/nRHDgdN0e4VEhk/dWVAAqt1qpAVDDTNgHgD9B7oE8M2yEp+aDTXpqAcdKIX
 oLxH9FuNpEUb/Ae8Ig0iSyyRUgggSda0wwtHfuugfk4ARxlhdZZXA6g73o+f34HLOhLy
 OpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770751533; x=1771356333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IYXaxxlBgc8Kqkh4DZ+jrMOV88/UOIu8btwWCvjGJBs=;
 b=h6Pkl1WJX5DPM8NpvM5p9rjcCYoIDnoRmzj0XUgP4pzDg1wwHQckzJ7Sfg4nsDcyFA
 HkCCCpBHz+jzyNuYcVOi0e1YT3s/H8aPkv9R18j/OyHbWmp7ZzYgXNKtCYHeZLK+jz/o
 n6VguTTMD/oJaet63o3no3L9i8oDIUAnRBS2iV/DRRX7Rtyv4Ztr2A9g+aCEtU3V64hW
 /WBKanofSXnsbElHOCMTcY5FJUBX/0/GF878RQ9k1COHpYso6cM5r907NurYI5fZgTyS
 VyDQ7cbH2uykaROLuO9/eGqtzPj1Wqy/9HnxeyQG+CQXNLji5BIOcxGA9QgzXTM4GuPs
 HX2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2aj1e6SgfgwkS8VSXXOCBy0meJpty0i0DfzWPoCpjXoZhTrPoIXOX50yzXa+/JBY4SiE+d0F5eA==@nongnu.org
X-Gm-Message-State: AOJu0YylliDEZwD3++wsh9pMKht1jO4MO5hMEqpXtLlrNofyjkzPilr/
 5jrgPzMysjBjiVY479VlYQCD+mcPPtzwV8g7fUqXDZ7xdcFXKcgE1Jv8kEgfgDOKB2juET8lrBH
 bQbvcjRSrYgsjSI7ETZZNAV6uL8euUsUQfAk5RWb4
X-Gm-Gg: AZuq6aLpDMrYyaG5nJJkrR1JpvwNrNw6M+AesmJA06BVXXjUIoSOfmIOwE+c0c3sSAq
 xxsNJmUniwiGHyfv58Kwhijvj5IunsRBErh2my8HeQEJuBOYLzmmwoGFtnobkRdYKFxX2b0YSvR
 zTw7K69blT5EVQ8Fb94W9x0xiNOpM3GUJEABCsn79n3fTdq7iW+uG61j9c3lTPdOr4fJHPgj92m
 YSfL9Fpa/V62dxjdVjJ6wxWrgfBBjaYpd1qfDbCEVxBKi/kmaTSkRQccYJjsttDwAaVdtb7WImA
 u6pM7DBSQO0jMbfKfQukT8egCec7+ONRyOyBWlle2vTLPRu6yUra/oBZBtWM2BYEButLlgYazOw
 xvq3yjSIwsQSB+2qz8l3VYMTfqVkkuR0nDm+9
X-Received: by 2002:a05:622a:181e:b0:4f1:9c3f:2845 with SMTP id
 d75a77b69052e-50681698b91mr1199401cf.9.1770751532817; Tue, 10 Feb 2026
 11:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20260210051008.355149-1-jamin_lin@aspeedtech.com>
 <20260210051008.355149-4-jamin_lin@aspeedtech.com>
 <209dc94c-080b-49fa-afd0-d89d43b318e6@kaod.org>
In-Reply-To: <209dc94c-080b-49fa-afd0-d89d43b318e6@kaod.org>
From: Nabih Estefan <nabihestefan@google.com>
Date: Tue, 10 Feb 2026 11:25:21 -0800
X-Gm-Features: AZwV_QiXX0lIrUovR96uGyKhGgKuHxyY0dsqY6eriDCvxKbghRyk07xLJ9lR-Ng
Message-ID: <CA+QoejU4FBKwUEK2FCVmdLydjBcCKvtGdLq=1GxBHXOEAGYSVQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] hw/arm/aspeed_ast27x0: Add AST2700 A2 SoC support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Feb 9, 2026 at 11:14=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 2/10/26 06:10, Jamin Lin wrote:
> > AST2700 A2 is functionally identical to AST2700 A1.
> > There are no changes to the IRQ layout, memory map, or peripheral
> > configuration. The only difference is the silicon revision.
> >
> > This commit introduces a dedicated AST2700 A2 SoC type by reusing
> > the existing AST2700 A1 implementation and setting the A2 silicon
> > revision accordingly.
> >
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > ---
> >   hw/arm/aspeed_ast27x0.c | 36 ++++++++++++++++++++++++++++++++++++
> >   1 file changed, 36 insertions(+)
> >
> > diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> > index 61790ea1cc..87dcb82e1b 100644
> > --- a/hw/arm/aspeed_ast27x0.c
> > +++ b/hw/arm/aspeed_ast27x0.c
> > @@ -1166,6 +1166,36 @@ static void aspeed_soc_ast2700a1_class_init(Obje=
ctClass *oc, const void *data)
> >       sc->memmap       =3D aspeed_soc_ast2700_memmap;
> >   }
> >
> > +static void aspeed_soc_ast2700a2_class_init(ObjectClass *oc, const voi=
d *data)
> > +{
> > +    static const char * const valid_cpu_types[] =3D {
> > +        ARM_CPU_TYPE_NAME("cortex-a35"),
> > +        NULL
> > +    };
> > +    DeviceClass *dc =3D DEVICE_CLASS(oc);
> > +    AspeedSoCClass *sc =3D ASPEED_SOC_CLASS(oc);
> > +
> > +    /* Reason: The Aspeed SoC can only be instantiated from a board */
> > +    dc->user_creatable =3D false;
> > +    dc->realize      =3D aspeed_soc_ast2700_realize;
> > +
> > +    sc->valid_cpu_types =3D valid_cpu_types;
> > +    sc->silicon_rev  =3D AST2700_A2_SILICON_REV;
> > +    sc->sram_size    =3D 0x20000;
> > +    sc->pcie_num     =3D 3;
> > +    sc->spis_num     =3D 3;
> > +    sc->sgpio_num    =3D 2;
> > +    sc->ehcis_num    =3D 4;
> > +    sc->wdts_num     =3D 8;
> > +    sc->macs_num     =3D 3;
> > +    sc->uarts_num    =3D 13;
> > +    sc->num_cpus     =3D 4;
> > +    sc->ioexp_num    =3D 2;
> > +    sc->uarts_base   =3D ASPEED_DEV_UART0;
> > +    sc->irqmap       =3D aspeed_soc_ast2700a1_irqmap;
> > +    sc->memmap       =3D aspeed_soc_ast2700_memmap;
> > +}
> > +
> >   static const TypeInfo aspeed_soc_ast27x0_types[] =3D {
> >       {
> >           .name           =3D TYPE_ASPEED27X0_SOC,
> > @@ -1179,6 +1209,12 @@ static const TypeInfo aspeed_soc_ast27x0_types[]=
 =3D {
> >           .instance_init  =3D aspeed_soc_ast2700_init,
> >           .class_init     =3D aspeed_soc_ast2700a1_class_init,
> >       },
> > +    {
> > +        .name           =3D "ast2700-a2",
> > +        .parent         =3D TYPE_ASPEED27X0_SOC,
> > +        .instance_init  =3D aspeed_soc_ast2700_init,
> > +        .class_init     =3D aspeed_soc_ast2700a2_class_init,
> > +    },
> >   };
> >
> >   DEFINE_TYPES(aspeed_soc_ast27x0_types)
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>
>
> Thanks,
>
> C.
>
>
Technically applies to the whole patchset, but specifically pointing
our internal machines to use this SoC so sending it to the relevant
patch.
Machines boot and work as intended once the SoC is updated, thank you Jamin=
!

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>

Thanks,
Nabih

