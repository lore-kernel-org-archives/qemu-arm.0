Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2827286lfm;
        Fri, 3 Jul 2020 14:37:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxImIJSb/bpmnHLql7939G+e8CPYPKyLhGj85Hi5JlBntuKNWhVoWoec/YX+OLNEyXM2I7A
X-Received: by 2002:a25:4e45:: with SMTP id c66mr15091012ybb.333.1593812274547;
        Fri, 03 Jul 2020 14:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593812274; cv=none;
        d=google.com; s=arc-20160816;
        b=jepoA0iKKUVJBmtjvTvWw1ARqbQOAZxpCFG6FY3A+8mhD9cvtjD5QeJN3vMWnjOmmo
         iLoarHU3/MDynQemizZ2DP7Ddif4PVhZaic7/C+9PbsYRuKktjHYdb60VVKYYEzLirhu
         l51HxXjF2KtTwY7bPcK//o8907dD16OkaMtRD8eDBG/smdzuBXZdQbx1ZbuENQ98dTwG
         Dkj/aYVcyvw+6Jl3WZdQlLqbzvaMuOH+/aIBflANPNA4Bppt1s4n7JtbKtJsiBobMCKR
         ZyiH8C+93zDu6BwgiPMNz14HuA5qpwEymhelcxM92azO/7YKmYvFmtf7WEU08PVxVuiO
         YKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version;
        bh=EDT9qdBoQNR9VTW3ES56rpOn4j5tQXgMZcioLsQbiow=;
        b=R52TbKGnOmuQQgr2Q+kzJUEbXxG2dbmCOWTKdFSmkkxFLZyZzdwiceX+E0377nQnfw
         cJf90hKCvjgFILH8swC2Q4iLQKsCkU5iUNyGskp4qBJAZDXB59SAUI+hU47ZXmhyCDE8
         ZcaavrhOzYv2Gu69U8qJMOo5yiaTWIxKpxwR7/Rb1YjrqTfpcTxgp3KMonbVoM2ChcNW
         A2EXK4JnksSgZt/MG8jGfEoHB0DDB4ZLc9LmlncEz/1NhYplxRT5ngoQm7ZAbizzr1Bi
         Jq46Rkz5wdijnfBwLcMmFTgP0vttp3mru+rVd69OfHV0JBuXMTaOaFYoIVzN9joY6sZz
         p+sA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s17si11424671ybp.90.2020.07.03.14.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jul 2020 14:37:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrTNZ-0002pp-W5
	for alex.bennee@linaro.org; Fri, 03 Jul 2020 17:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrTKR-00010a-1z; Fri, 03 Jul 2020 17:34:39 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrTKP-00017Q-CU; Fri, 03 Jul 2020 17:34:38 -0400
Received: by mail-ed1-f67.google.com with SMTP id a8so27734022edy.1;
 Fri, 03 Jul 2020 14:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=EDT9qdBoQNR9VTW3ES56rpOn4j5tQXgMZcioLsQbiow=;
 b=hxhEUD17edrILPhaIPaIdTOwf7Pssj0wel8YWT2z4zec7W+2TAROxe9aZnrI+QJ76A
 6ZF4xL0YRTSAHqvM3jdX9g4bR2F5LQGrueoSPiaLkNxgUCXJwoCepz/g3zp6PCUlbe2Q
 aZASGz/zoNsrdLJ3XL5YxBdORGoSKMccO4ah0W7jfRx0b045IYiBY1adfLo+dYLHAILk
 7MLtrwjMcqdudsNvZAO8GTUqAzDH2pCsyNGq4VaMUSh5Cwz95PqVGIORJDYwIVjZIOph
 esGdYoGLpMl0SxY0YJG34FscWR8AFeUD5+Hu0WtB+GIrE3Zeaqj9BNXdEUSnWuymZmuU
 zUdg==
X-Gm-Message-State: AOAM532a6nmNvmuRL0AmRMi4ImG4z9K3qxjRjtbJzwgh8gDqpfA8jizW
 6NgJOPD3n2P14jCxUAvptFACZSPI/MMSbk6jJwk=
X-Received: by 2002:a50:c8c9:: with SMTP id k9mr41604414edh.157.1593812075578; 
 Fri, 03 Jul 2020 14:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200626235519.591734-1-hskinnemoen@google.com>
 <20200626235519.591734-9-hskinnemoen@google.com>
 <abdb209d-7268-7997-2caa-95cb984269da@amsat.org>
 <CAFQmdRYZWhA-957jRHfiRHfYoOk-c2TJVtqoz6LMOhDgJwMiCg@mail.gmail.com>
 <CAFQmdRYxzf7LrtsrNUSNpyN-Ve6fSFGJhyRBPMNL=nFCf+zHgg@mail.gmail.com>
In-Reply-To: <CAFQmdRYxzf7LrtsrNUSNpyN-Ve6fSFGJhyRBPMNL=nFCf+zHgg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 3 Jul 2020 23:34:24 +0200
Message-ID: <CAAdtpL55prff3hzd+WssvBjjTkbH20WwXtQWYEo9UmYcdQ7aDg@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] hw/nvram: NPCM7xx OTP device model
To: Havard Skinnemoen <hskinnemoen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.208.67;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-f67.google.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 17:34:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=1,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AeN2XrGDmG2k

On Fri, Jul 3, 2020 at 11:19 PM Havard Skinnemoen
<hskinnemoen@google.com> wrote:
>
> On Fri, Jul 3, 2020 at 2:07 PM Havard Skinnemoen <hskinnemoen@google.com>=
 wrote:
> >
> > On Fri, Jul 3, 2020 at 6:46 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> > >
> > > On 6/27/20 1:55 AM, Havard Skinnemoen wrote:
> > > > +static void npcm7xx_otp_realize(DeviceState *dev, Error **errp)
> > > > +{
> > > > +    NPCM7xxOTPClass *oc =3D NPCM7XX_OTP_GET_CLASS(dev);
> > > > +    NPCM7xxOTPState *s =3D NPCM7XX_OTP(dev);
> > > > +    SysBusDevice *sbd =3D &s->parent;
> > > > +
> > > > +    s->array =3D g_malloc0(NPCM7XX_OTP_ARRAY_BYTES);
> > >
> > > The possibility to reuse persistent OTP seems important.
> > > This can be added later of course.
> >
> > Agree, it's an important part of the behavior of the module. But it's
> > not essential to be able to boot a BMC firmware image, so I left it
> > out initially.
> >
> > > See simple example in hw/nvram/eeprom_at24c.c which use
> > > a BlockBackend so the OTP content is not lost after reset
> > > or migration.
> >
> > I'll take a look at that, thanks!
> >
> > > > +
> > > > +    memory_region_init_io(&s->mmio, OBJECT(s), oc->mmio_ops, s, "r=
egs",
> > > > +                          NPCM7XX_OTP_REGS_SIZE);
> > > > +    sysbus_init_mmio(sbd, &s->mmio);
> > > > +}
> > > > +
> > > > +static void npcm7xx_otp_class_init(ObjectClass *klass, void *data)
> > > > +{
> > > > +    ResettableClass *rc =3D RESETTABLE_CLASS(klass);
> > > > +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> > > > +
> > >
> > > Missing migration vmstate for NPCM7xxOTPState::regs[].
> >
> > Ah, you're right. This is probably true for most of the peripherals in
> > this series. I'll see if I can get it sorted out for the next
> > iteration.
>
> Btw, do you have any advice on how to test device migration? I'm not
> planning to do actual migration of BMCs in the near future, so I'm not
> sure if I'd notice if I get it wrong.

Peter Maydell described it very simply here:
https://translatedcode.wordpress.com/category/debugging-tricks/
