Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2809854lfm;
        Fri, 3 Jul 2020 14:08:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznZPjkiwt9K8WSboLBqAc2HVwIOaxdrchiXRVFFd6b4ITAhB2XZotrUcBFw2hx4wTLrWSn
X-Received: by 2002:a05:6902:6c9:: with SMTP id m9mr62605983ybt.372.1593810489539;
        Fri, 03 Jul 2020 14:08:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593810489; cv=none;
        d=google.com; s=arc-20160816;
        b=kPfJ0wg0h4Cardj24YQnx167jhhFV/kW0oIvKAUPmNLnSdH/n02KRGaHDjIdRSPEVu
         wBhFIeHQUSJQgk8Vfi0oyEdhY2Mwe/PMnMbthGO5a8BCufJzfysenVKI+ZEEAbRzb6Qu
         o0zYrtT/QRItVzBZxhR+2JBDSteanMHt0FE1by/cO1uHf+Z1Y3rSuYY1eY0Xtq8eSZ2F
         Lf+SpufDKKptTjHzzrG5QySwciMmgz2yHMDqQbAc8ITPfKja2XGR0gujAXeogoCA2Klx
         oTvqROVWnRo4XwxlrlT6xUcyPPEKZUdSCnXUdSAUlIkRKysZApfMR1nosei24gSlRSbc
         TLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=itS6dSrCgMMyMc53eXZOLlFFRtRNAyIJ+G+nB3RGmlo=;
        b=k3EAc7CreGvHDpQlBFMmDwJ/GC+2Wcr61lfsYTGzfb56zyhFD1+62rMho1Cyzxyzyb
         Alzo3gnbqOjnUHd3jzdrWcN0gh+/N0FMChuOmkQbH+8MK4/pYkFEojHxZE7CrSFkT5fo
         0uei/oyZLSbe+CnC4TUVbrK5onhDmUyrweXICoz7TbRo7ey71B4cMcNnKFEek6LmgFSa
         nNRxUJSIXJd7EVjujEqQjj9SFf2Ocmn384YX3OgYBhQc3JLH0w+DHjGKqj8X9Tqy2eEA
         XVZ299kafPM/no55+Drz0h3PsRla/jCdsagJ4WilcQaYGsHd5ZZ2ZhI2jI1QTGr/h5HJ
         LZ7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=HSDVH1Wc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w75si12204163ybe.5.2020.07.03.14.08.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 14:08:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=HSDVH1Wc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:55568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrSum-0004BB-Tc
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 17:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrSue-0004AU-94
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 17:08:00 -0400
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42]:32846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrSub-00044e-LR
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 17:08:00 -0400
Received: by mail-vk1-xa42.google.com with SMTP id r7so7367243vkf.0
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 14:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=itS6dSrCgMMyMc53eXZOLlFFRtRNAyIJ+G+nB3RGmlo=;
 b=HSDVH1Wc257Dy5QhL4tIi+ih069CMZ/oItKyM4ZuLtCz2eWUB9p11m0DlABvhd19R+
 9D0nbIJL5RYtJmCu08KRsmzDC9EDo696UuuYD8gCaepWXIxT5oc1eDaQzihZyjAJYluo
 wlhfxsnP7AHAjvlZQQqhKjjBfEZFzoyjPa9Zr8zWRzhypBRiX2S82+QjeLsAyYUDefsh
 zlNJ1UHvj4yPA3yzlbkNR7hZomAPy7QTbqptasG41RQCaCcvvL6lgGW+zzLnWBYjP1LE
 x+81ONuGsVoCeAUZY5OhQzmmuY1kn4Dr2SspwhHn8/Yh+gHgGvzE++FV6Il2oWyugvnT
 HfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=itS6dSrCgMMyMc53eXZOLlFFRtRNAyIJ+G+nB3RGmlo=;
 b=YPrPS1ATEM4ZfXjC7TzJ+uM+IGVPmtBr3oGNQnRVYl9ITycpT5teqp5qKUk5jO40hc
 lSq3NGeUJeRADMMD6tWqm+Vdt/HWo4BBwtqUODUrHRHjGrT6BlxOM07xp8iYbzY8bzga
 kiXQMUIK3idwsiLWJ1n/PqjXtmFziZlLxH5pHho0VVMYOxa/OW/kslPnfp3AXb/yRrvD
 8BuLuX4iBVUaXKcxZ/wWN0JgClkehGKjXLqlzVqvc4K3HqzYwQM9iGvRvWn5RgBvHbQp
 NSm4xzYFzaeNg3UqUM3NtnnV3BFrFCCpD+37FK21cgfZMzfMVr6Dd3Ui3FDN9ZYRPuSm
 x5wg==
X-Gm-Message-State: AOAM530InQY7IH2afBDIgWNtxYG/mSrsDE9pLADWXvMHWAc04jVlgSOk
 mjidGZsfwjkKHjoGJTFFRA+Nlafz9DF5sIBsZDCIfA==
X-Received: by 2002:a1f:3113:: with SMTP id x19mr27110586vkx.91.1593810476317; 
 Fri, 03 Jul 2020 14:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
 <20200626235519.591734-9-hskinnemoen@google.com>
 <abdb209d-7268-7997-2caa-95cb984269da@amsat.org>
In-Reply-To: <abdb209d-7268-7997-2caa-95cb984269da@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 3 Jul 2020 14:07:44 -0700
Message-ID: <CAFQmdRYZWhA-957jRHfiRHfYoOk-c2TJVtqoz6LMOhDgJwMiCg@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::a42;
 envelope-from=hskinnemoen@google.com; helo=mail-vk1-xa42.google.com
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
X-TUID: zdmIAvg8vr8r

On Fri, Jul 3, 2020 at 6:46 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 6/27/20 1:55 AM, Havard Skinnemoen wrote:
> > +static void npcm7xx_otp_realize(DeviceState *dev, Error **errp)
> > +{
> > +    NPCM7xxOTPClass *oc =3D NPCM7XX_OTP_GET_CLASS(dev);
> > +    NPCM7xxOTPState *s =3D NPCM7XX_OTP(dev);
> > +    SysBusDevice *sbd =3D &s->parent;
> > +
> > +    s->array =3D g_malloc0(NPCM7XX_OTP_ARRAY_BYTES);
>
> The possibility to reuse persistent OTP seems important.
> This can be added later of course.

Agree, it's an important part of the behavior of the module. But it's
not essential to be able to boot a BMC firmware image, so I left it
out initially.

> See simple example in hw/nvram/eeprom_at24c.c which use
> a BlockBackend so the OTP content is not lost after reset
> or migration.

I'll take a look at that, thanks!

> > +
> > +    memory_region_init_io(&s->mmio, OBJECT(s), oc->mmio_ops, s, "regs"=
,
> > +                          NPCM7XX_OTP_REGS_SIZE);
> > +    sysbus_init_mmio(sbd, &s->mmio);
> > +}
> > +
> > +static void npcm7xx_otp_class_init(ObjectClass *klass, void *data)
> > +{
> > +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > +
>
> Missing migration vmstate for NPCM7xxOTPState::regs[].

Ah, you're right. This is probably true for most of the peripherals in
this series. I'll see if I can get it sorted out for the next
iteration.
