Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2817277lfm;
        Fri, 3 Jul 2020 14:19:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVNiJZ7E4k5D3ynuUfvPkHqCmhNAxIHn+ABfaaEkLafJ7vsf9rztJeDaguxM2QIirhqDIg
X-Received: by 2002:a5b:804:: with SMTP id x4mr2130082ybp.499.1593811189919;
        Fri, 03 Jul 2020 14:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593811189; cv=none;
        d=google.com; s=arc-20160816;
        b=qdB+vvwTpK8HOY465rgQRPreioV2jO+lvLZtQQvOIx/c7ZLapOuvUB+18k/gUIqZAq
         eVLvHEJBxjVCDnchHXVnp8c/DICgSeUzDyqT8BVIjO4WaLM/nm0snRH5/ktZzCUwA2ul
         3KzSDTIlu+fcm++oQ9NxsVoKGp3QeZ4jiCb6RR9H0zmVcUAgLHcTQU/gOdTKqZMfhrTQ
         vihVtyLblG3e8794ZleJgU9ZsLC3eYC4xQ1sViy7QwallSwodxspybdsG1y/DlCJwlok
         LH3r4FqWkidzPNqhQPIc5a1NAp89m7xPd961YhpQeg9mowkt2YEjRHFEIaK1zvMnWAHU
         0upw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=yuU30o8g/Px0gTd4YpwqhPl9ilWvzec7vcR3IpaT5GI=;
        b=bGDh8FJTA3iIMRglyp5oprT5LWz9r71b33cVepah6IGGVonSm5ORA3DdWwKuQh82tH
         jBl86bM8einq0c55FzmLQuFdjCOw5c4ohjRNlEb3nqiKedsP5YtdjzThJtpEqJ0DjgcJ
         BGhXuzGqJs30Fa5aKRA/Vr7zURg4tPsLs43TWLPpVbGOTpgxudSmzwWBafqC24DU5x00
         fA893THjGClGnmJJaWvg7+qqnYI1L3w703X3GKkWlCBap2LHuVsDE8D8ZiXYJxLPEeoa
         HlPHEdgJ1khos9BVcXfUSCh4DZHblF3DxPt6765y4r1lxs6aFCN6YCQkrx3N42Oct/hw
         cydA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=lveCnJ2q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si12754170ybb.250.2020.07.03.14.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 14:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=lveCnJ2q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:36398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrT65-0002tX-63
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 17:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrT5v-0002sr-7l
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 17:19:39 -0400
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:34431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrT5s-00066P-S2
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 17:19:38 -0400
Received: by mail-vs1-xe41.google.com with SMTP id f24so17742591vsg.1
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 14:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yuU30o8g/Px0gTd4YpwqhPl9ilWvzec7vcR3IpaT5GI=;
 b=lveCnJ2qb+2pH/IgJxdWNP+4kCWv2gmPtPVCtDlqiXKcjFu4WT4QDuSvdqhM9hDKpg
 AsFH4IqKnh21pQjWmvjjRAEVlh2I7QFUrLE3Y7iwmiZI4GpkD0lxfFfUKJqrho8roh/O
 bVcsUF2D2tM4e6cjKIul8+ZsT66Y8qEbDeJve6L+xfEARJDiKrF/xwS+Xx56/A1gj9Bv
 8IUoAp1+8shUjQbG/Sdy3xBK/seEfyopRub0WfUfvixAvZlbe8BDzgdQKvcBJhNmV+zH
 74+mEzzUpAVK3h9fMCGQnHhjKad6Osfo9eAvIT4kWsephRCfdXMOVV+tSKUJqsidHIXa
 fqbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yuU30o8g/Px0gTd4YpwqhPl9ilWvzec7vcR3IpaT5GI=;
 b=FtmdvD9dbpnP0MeU5Tvof0q3z8XcaNNBOleA7NE5HvODo56Gk45bOstE0an2MG9+KQ
 iUR8k584C3vYBDHiL6iUIs3Z4FfsUrStwxMTPR8S/mUFJAZuqJgZjVOx7pV8eQv3DC3q
 5W4mbajJzkiKVWyj7FiwU6v/U0fUgPhJ39THH4yQGWmAim1bI1StS3IjJFNAvN5Q1A+h
 1NK+Wf1Fpp1aOvn9plYbcdj5rK1aD74NqkbVgba7R2zaK8sGOE7xI/04/AsxLQldF4Qy
 7TVz02BGRKt8bJcoO0PtDRbvyd0P+syDmNcL/tj+iMZftw6z2Na4Tl7MVDhD1xDSMaU/
 PBAg==
X-Gm-Message-State: AOAM531xqkMm+hkVvRh9ov8qIsRXMuNR9uCPGkoFSYLI8QUwiHO7kRmr
 qn62x5Co2Y3vC60UDDHrYpQXd2NQrdzl/A8fP1Xz/Q==
X-Received: by 2002:a67:7f8e:: with SMTP id
 a136mr23106995vsd.232.1593811175040; 
 Fri, 03 Jul 2020 14:19:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
 <20200626235519.591734-9-hskinnemoen@google.com>
 <abdb209d-7268-7997-2caa-95cb984269da@amsat.org>
 <CAFQmdRYZWhA-957jRHfiRHfYoOk-c2TJVtqoz6LMOhDgJwMiCg@mail.gmail.com>
In-Reply-To: <CAFQmdRYZWhA-957jRHfiRHfYoOk-c2TJVtqoz6LMOhDgJwMiCg@mail.gmail.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 3 Jul 2020 14:19:23 -0700
Message-ID: <CAFQmdRYxzf7LrtsrNUSNpyN-Ve6fSFGJhyRBPMNL=nFCf+zHgg@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] hw/nvram: NPCM7xx OTP device model
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e41;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
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
X-TUID: oAJMcgCULS43

On Fri, Jul 3, 2020 at 2:07 PM Havard Skinnemoen <hskinnemoen@google.com> w=
rote:
>
> On Fri, Jul 3, 2020 at 6:46 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> >
> > On 6/27/20 1:55 AM, Havard Skinnemoen wrote:
> > > +static void npcm7xx_otp_realize(DeviceState *dev, Error **errp)
> > > +{
> > > +    NPCM7xxOTPClass *oc =3D NPCM7XX_OTP_GET_CLASS(dev);
> > > +    NPCM7xxOTPState *s =3D NPCM7XX_OTP(dev);
> > > +    SysBusDevice *sbd =3D &s->parent;
> > > +
> > > +    s->array =3D g_malloc0(NPCM7XX_OTP_ARRAY_BYTES);
> >
> > The possibility to reuse persistent OTP seems important.
> > This can be added later of course.
>
> Agree, it's an important part of the behavior of the module. But it's
> not essential to be able to boot a BMC firmware image, so I left it
> out initially.
>
> > See simple example in hw/nvram/eeprom_at24c.c which use
> > a BlockBackend so the OTP content is not lost after reset
> > or migration.
>
> I'll take a look at that, thanks!
>
> > > +
> > > +    memory_region_init_io(&s->mmio, OBJECT(s), oc->mmio_ops, s, "reg=
s",
> > > +                          NPCM7XX_OTP_REGS_SIZE);
> > > +    sysbus_init_mmio(sbd, &s->mmio);
> > > +}
> > > +
> > > +static void npcm7xx_otp_class_init(ObjectClass *klass, void *data)
> > > +{
> > > +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> > > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > > +
> >
> > Missing migration vmstate for NPCM7xxOTPState::regs[].
>
> Ah, you're right. This is probably true for most of the peripherals in
> this series. I'll see if I can get it sorted out for the next
> iteration.

Btw, do you have any advice on how to test device migration? I'm not
planning to do actual migration of BMCs in the near future, so I'm not
sure if I'd notice if I get it wrong.
