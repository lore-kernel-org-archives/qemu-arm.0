Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1142716lfm;
        Thu, 9 Jul 2020 00:23:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLO2qZkn/JAtkzy91hDG2pGgCWQ3cN9PY/xzTZFtlO1ZXBKh9jMbrjhkeLslhMfJyG6+uH
X-Received: by 2002:a25:338a:: with SMTP id z132mr39097689ybz.316.1594279431583;
        Thu, 09 Jul 2020 00:23:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594279431; cv=none;
        d=google.com; s=arc-20160816;
        b=yVWm+s6qutBE2sGhL5tyMsvdiSSY/D80bjqsZKhbv0g77WVOy8hMbymSV9cNpvTqK4
         RvKlgOA6UMRaDKMrDGLwqpXcIWgvaE8H0VKrO/7aANbzyh6xMnc16XfRLDi7b5wtWiZe
         IrXLx+TL2Lbxlv0EmY1O01GeI7aK7D8q4SdboCp+vKqg//rfOJrcUMxdqAQ/EQtiEgx9
         Nxn9XthtMazpS7oYr22lSpxfo3aV36heneBbtBsDVRgJjfD0Hkw8ShH6G8ew8rj0Jzh7
         jEMawXHVLS4wapZKypzR8e7WZFrptnib1IdtKscAWcDugG9BYkAo7E23pGLAjzZglgYy
         1xQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=eUvZdEHgBMGrL/+yxMrn6JnFoapfozZri9F2FF+zy78=;
        b=iAFyf75XR3eKx5Vv1d5mIfmcW+a8damFmLOcXrStqd1MxUibC3XabvceeDVyDuYYFo
         Tqpu04zAu/KCY2g+k6Kxo798VOd/jxTDQv+px9dYcE8ffiNT+Q/dHQQu2c3fIRgLK3LV
         GUDdAgW94nsog6o6NRNvBRK8M0EQr5w52QoYQeZhoRSz08h+L9alWOXuaaEW+mQtCFD7
         s8j8nCSZ4360f0cL1+bYC2pAObl1LYwB6b/xfxRhMNhejKVnJIzdbM34PZk9+B1SUTIB
         Rhgbr6TQj5BcGoJdYALk5XZx7vE/wy2wOCX3WK35R3q1+eI8niQb7ARtf24HIOM5GwqT
         b+Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=YXalEV+J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e68si1869089ybh.334.2020.07.09.00.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 00:23:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=YXalEV+J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:51276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtQuM-0001NQ-V9
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 03:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jtQuE-0001LF-Vy
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 03:23:43 -0400
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941]:33773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jtQuB-0007SK-QR
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 03:23:42 -0400
Received: by mail-ua1-x941.google.com with SMTP id c7so421480uap.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2020 00:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eUvZdEHgBMGrL/+yxMrn6JnFoapfozZri9F2FF+zy78=;
 b=YXalEV+J/kUNOhHmZypE2wOWvLiTb9lsCMKRxeVOs3O9bZ8Bw/yCIUhO8yvEjuyWfQ
 nG28IQl4y89EbfEvopgaJvrzKE1zENx+rlxqdCh9qKeVv1ojm7nDNrx/lemkaCLEFSNq
 +PweWUoZV+GCOAxaXcz85+lbQcENFp6ogZaUH1j92JUyZYbZCuxCEP+UUPbwDCfYZxAJ
 T9a3vjrSGBm9JgYl1IG742rEkCdQEcShJOY/UvSVJ/bwpayOHhRk3nk8lzI7JmuEPPeg
 cedei4eJ1fOF9C21Cl0Cvc+oGMbcA0yjmTXfub7OGx2WYbYNypfxZcWam162uNxn2dtq
 /9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eUvZdEHgBMGrL/+yxMrn6JnFoapfozZri9F2FF+zy78=;
 b=Urwf4ufINrqFfwLX0lOqodoKscHFLualzMxwTwAZafm1E4fQBMLFiGODWRvWYxkilo
 9/1v0WSAQs7ongmB4xYfG+U1X52r96VhAHH/QaafiqoyRN5bs9e8r6ZiT5Bc8JNgLf5n
 DFgmZXFHprU5sZZsYVgb0XpHqRKW2qb1A1Rknk8ctfxoef73XfRxuZM8eXYI2xfHAUUT
 9lVGQJFU50L1r8znlFjSD1BdLXrcWeApsT5PWytep3MQ40hqVMkhGL/Z4TPh/MfIIjK7
 96JEicQFDi1Hvlii+jJv9CzhXJVhqEkeUx/awxnuZZYHhnmQGKV2dZncebS1OZQSaXci
 0WdQ==
X-Gm-Message-State: AOAM532fp2zHWdoMlkIbUYJnEwy2pK2cO3CdIFkB30iukXpyo7rLQ6iV
 qTtg118rnncd+TTUiiTpwCJnZs/woGLeHEjmf8lr4g==
X-Received: by 2002:ab0:6ec6:: with SMTP id c6mr54499527uav.7.1594279418295;
 Thu, 09 Jul 2020 00:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200707184730.3047754-1-hskinnemoen@google.com>
 <20200707184730.3047754-6-hskinnemoen@google.com>
 <4b7130f2-032c-3067-b2b6-876a2b17b707@amsat.org>
 <CAFQmdRYi5QFHbcWQH-bWqAsSCidzYMedC8n+mib1DPpJuEy-Rw@mail.gmail.com>
 <CAFQmdRZdUKvmi_eKdtCnR8uP63sRP9X0Z7oxZES56mtSz_=7FA@mail.gmail.com>
 <af879fd1-dea8-a3f2-d3fb-13be24c0b740@amsat.org>
In-Reply-To: <af879fd1-dea8-a3f2-d3fb-13be24c0b740@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Thu, 9 Jul 2020 00:23:26 -0700
Message-ID: <CAFQmdRaqx9+Ftu4_p85q1E0aPUjBZfJ0ARB564WQVHmeSbjwXg@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] hw/arm: Add NPCM730 and NPCM750 SoC models
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::941;
 envelope-from=hskinnemoen@google.com; helo=mail-ua1-x941.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iWdDeCdaSG/T

On Wed, Jul 8, 2020 at 10:34 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 7/9/20 2:06 AM, Havard Skinnemoen wrote:
> > On Wed, Jul 8, 2020 at 11:13 AM Havard Skinnemoen
> > <hskinnemoen@google.com> wrote:
> >> On Wed, Jul 8, 2020 at 10:31 AM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >>> On 7/7/20 8:47 PM, Havard Skinnemoen wrote:
> >>>> +typedef struct NPCM7xxClass {
> >>>> +    DeviceClass         parent;
> >>>
> >>> Similar comment that elsewhere on this series, if NPCM7xxClass not us=
ed
> >>> outside of npcm7xx.c, keep it local.
> >>
> >> OK, will do.
> >
> > Turns out it is used in npcm7xx_boards.c, so it has to stay where it is=
.
>
> Indeed:
>
> static void npcm7xx_load_kernel(MachineState *machine,
>                                 NPCM7xxState *soc)
> {
>     NPCM7xxClass *sc =3D NPCM7XX_GET_CLASS(soc);
>
>     npcm7xx_binfo.ram_size =3D machine->ram_size;
>     npcm7xx_binfo.nb_cpus =3D sc->num_cpus;
>
>     arm_load_kernel(&soc->cpu[0], machine, &npcm7xx_binfo);
> }
>
> This is fine.

It's also used here:

static void npcm7xx_set_soc_type(NPCM7xxMachineClass *nmc, const char *type=
)
{
    NPCM7xxClass *sc =3D NPCM7XX_CLASS(object_class_by_name(type));
    MachineClass *mc =3D MACHINE_CLASS(nmc);

    nmc->soc_type =3D type;
    mc->default_cpus =3D mc->min_cpus =3D mc->max_cpus =3D sc->num_cpus;
}

>
> Just thinking loudly, we traditionally add the load_kernel() code
> in the machine, because it is often specific to Linux guest, and
> the SoC doesn't need to know about the guest OS.
>
> hw/arm/boot.c contains helpers also useful for firmwares.
>
> The SoC has a link to the DRAM so can get its size.
> All the arm_boot_info fields are specific to this SoC.
> So we could move a lot of code to npcm7xx.c, only declaring:
>
>   void npcm7xx_load_kernel(MachineState *machine,
>                            NPCM7xxState *soc);

I can do that, but it doesn't completely get rid of all references to
NPCM7xxClass. I'm afraid there will always be some amount of coupling
between the machines and corresponding SoCs.

Havard
