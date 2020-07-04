Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2938564lfm;
        Fri, 3 Jul 2020 17:50:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFoJDmuzzEFNhi6CFwQU5kkEj8vgSJNnOONEmSCUaTLSOSH8oTNiwvme4zTA09nxcCMUZk
X-Received: by 2002:a25:d754:: with SMTP id o81mr8841376ybg.138.1593823830957;
        Fri, 03 Jul 2020 17:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593823830; cv=none;
        d=google.com; s=arc-20160816;
        b=RMShjrdAqwKhJN1yensoWPMVrb3xeizWlF189iWvVtU5mTy+4HGDMNlm5JgPS7V4gG
         viuOV/uMBx781SPVHPLNXKFXH5K1E9f5m2Y1sPrL4hPjTgu7XGawlwdrI2IVkj207Mt+
         eV9VJ9GhYDbw8nL6uNusjEmFDF1586ey3AXkwNLL0iM/udDtRbMnt5l2QP/O9iNxVO4c
         AYiyraXa/0aDoOmRQl7YsLEELjAOUJTEaSh39Ou8INdrFprdgRJx7jeKFYuYJ3SwsDE9
         93Pi9ecgDhsZOKH9tNoHNQ5ZqCa0IOogZhwupQMhg/UZn+hGkqUa5EcJhWqkozE3dPAL
         o+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=oM8V3dJ30E+i8OPC6HeE0rR8gA6+16SARIhE7deSAUE=;
        b=N2eFGlte6pJJ5aLacNJkF5u0LWatVrtvZ5yMHBgaYLoGJwi6kL7k9i0bYnir8bA/l0
         FrYNNqrvDAk3RW0wHDoosP5LOIwH5GyvmuArIw94VUVtRxke/Txncnt+r2+UrJGk35jJ
         WUEo65MGG8dPUmCg1PgWTh7ylg7nNRA4XOBXJ7Y2Ep+AlFQqGD+XumLCqM+kfcjWlOwH
         7LqJ4dn9cAs5MG18sLizWVSt63BAQX04KpHiCy9WfNkvnTLxSAdt+BywDrQaKnbAgNQS
         vDE5hZd1Y9TfJkPB+Gx8enzyw1cVNALfvWymlCINHm7f1E58zXqvIBQIeGrCjX5hdj3t
         flTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=dDrVjpDQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 195si12153572ybe.280.2020.07.03.17.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 17:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=dDrVjpDQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:46218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrWNy-0005GN-Ax
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 20:50:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrWNp-0005Fv-0y
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 20:50:21 -0400
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:40650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jrWNl-00075V-65
 for qemu-arm@nongnu.org; Fri, 03 Jul 2020 20:50:20 -0400
Received: by mail-vs1-xe43.google.com with SMTP id e15so17900656vsc.7
 for <qemu-arm@nongnu.org>; Fri, 03 Jul 2020 17:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oM8V3dJ30E+i8OPC6HeE0rR8gA6+16SARIhE7deSAUE=;
 b=dDrVjpDQPtxQv578OZtNU8Txdaa9h+WE3aBfMAHcPW3di1BS16bMDLZBkyfSM75I0M
 fhmI52UOUHXgE88ONkrPxp8It2rAbcHinoUPyQcP0aGeaGgSLYiTdny6ZtXy8QfphUej
 lZzX61d3BznQhcw1hhqlj75elB/kC/frIBylay/V77GN3xovt7QZ7aHMQMF7MU99PZTq
 Choluo5Ymc/x18MeAPm0xLhZepz5oal8MdI5GKm7YcgwqBpIy/rj98bYUrEH4sFvp+WT
 5/bRo4NpzCYBGTEpDy/kpYOXBMxMG2p5Mta7RMDhQutXu2cUSFk5iLPfe6rppzW5LMVl
 pJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oM8V3dJ30E+i8OPC6HeE0rR8gA6+16SARIhE7deSAUE=;
 b=Gm4sI/cGQTZcd9r35QkWSbG/61UPT0vgs0Ftee4HzSMYvmLjO1ZcJG6QUQnDHxfJl1
 9bdVfhoh4FGeIxqEK/9OhgX+dQPv2ufQ9RjWzn0rQTfK34+3Ft2DQf1NSxV2HGTlKXRG
 8HDPaspfNIdWBLLYlxGUZxs4JCm2NdeRhDynZ7EaMF3w/5c7IlVsdd5FjVQTg7aHJhVp
 e94rZ4m8hHKujpXjG9TYHI8n7G0obUjxX+y/lH0Iq42AgieN7cskVnpmJkfjuJrqy8Of
 BpDlhVID8jZ/+thyp59foGTACiPOrmTfkAjpg2Fl8aiUFumfNBlL+hEv5e6Fg3FR4kXQ
 4Mcw==
X-Gm-Message-State: AOAM5335VehqieMx2ey8/ZplSZHBad2s+RhzZbq4TUfnOchK1R9r1SVb
 sI2y1EoPdevRMaMUm1l04x2WuO8XkpqLh03smlMe7g==
X-Received: by 2002:a67:1b85:: with SMTP id
 b127mr24937666vsb.152.1593823815770; 
 Fri, 03 Jul 2020 17:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
 <20200626235519.591734-9-hskinnemoen@google.com>
 <abdb209d-7268-7997-2caa-95cb984269da@amsat.org>
 <CAFQmdRYZWhA-957jRHfiRHfYoOk-c2TJVtqoz6LMOhDgJwMiCg@mail.gmail.com>
 <9f8c6cb0-cac3-2afe-a98a-c627cb04bd4b@amsat.org>
In-Reply-To: <9f8c6cb0-cac3-2afe-a98a-c627cb04bd4b@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Fri, 3 Jul 2020 17:50:03 -0700
Message-ID: <CAFQmdRZ79Fx-tdVaEjiAR=5ignn_Rw95HT7sjDxs7rYtD4ADTg@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e43;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
X-TUID: tYYrX6K/3do/

On Fri, Jul 3, 2020 at 3:24 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 7/3/20 11:07 PM, Havard Skinnemoen wrote:
> > On Fri, Jul 3, 2020 at 6:46 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >>
> >> On 6/27/20 1:55 AM, Havard Skinnemoen wrote:
> >>> +static void npcm7xx_otp_realize(DeviceState *dev, Error **errp)
> >>> +{
> >>> +    NPCM7xxOTPClass *oc =3D NPCM7XX_OTP_GET_CLASS(dev);
> >>> +    NPCM7xxOTPState *s =3D NPCM7XX_OTP(dev);
> >>> +    SysBusDevice *sbd =3D &s->parent;
> >>> +
> >>> +    s->array =3D g_malloc0(NPCM7XX_OTP_ARRAY_BYTES);
> >>
> >> The possibility to reuse persistent OTP seems important.
> >> This can be added later of course.
> >
> > Agree, it's an important part of the behavior of the module. But it's
> > not essential to be able to boot a BMC firmware image, so I left it
> > out initially.
>
> This is not a problem until someone else try to use it. And OTP/NVRAM
> are devices currently in hype. Meanwhile we have another technical debt.
> I am just giving generic review comments.
>
> What bugs me particularly is the OTP content zeroed at reset without
> any warning. Maybe you can add something like:
>
>   qemu_log_mask(LOG_UNIMP,
>                 "Persistence not supported, OTP content erased!\n");
>
> in npcm7xx_otp_enter_reset().

Ah, but it only zeroes the registers. The OTP array is only zeroed in reali=
ze().

But I see your point about persistence. I will work on that.

One possible complication is that real boards are expected to be
programmed a certain way, so some reasonable defaults need to be
loaded when the user doesn't specify an image (and perhaps also if the
user specifies an "uninitialized" image, if there's any way to detect
that). Would it make sense to add pc-bios blobs that can be loaded by
default, and used as a starting point or backing file for users that
need persistent OTP arrays? Or maybe just OR the factory-programmed
bits into the user-provided image, since that would match the OTP
nature of those bits.

> >
> >> See simple example in hw/nvram/eeprom_at24c.c which use
> >> a BlockBackend so the OTP content is not lost after reset
> >> or migration.
> >
> > I'll take a look at that, thanks!
> >
> >>> +
> >>> +    memory_region_init_io(&s->mmio, OBJECT(s), oc->mmio_ops, s, "reg=
s",
> >>> +                          NPCM7XX_OTP_REGS_SIZE);
> >>> +    sysbus_init_mmio(sbd, &s->mmio);
> >>> +}
> >>> +
> >>> +static void npcm7xx_otp_class_init(ObjectClass *klass, void *data)
> >>> +{
> >>> +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> >>> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> >>> +
> >>
> >> Missing migration vmstate for NPCM7xxOTPState::regs[].
> >
> > Ah, you're right. This is probably true for most of the peripherals in
> > this series. I'll see if I can get it sorted out for the next
> > iteration.
>
> IIUC Peter is ready to queue your series on Monday if you fix the
> license, but he usually doesn't accept devices without vmstate via
> his tree, you got lucky ;) See:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg643089.html
>
> Adding the vmstate is not a hard task. If you need to respin,
> I strongly recommend you to consider adding them.

Yeah, I'll add vmstate for v4. Thanks for the blog link, that looks
like what I need.
