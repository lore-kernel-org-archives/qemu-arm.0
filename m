Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5104856ejc;
        Thu, 31 Aug 2023 06:42:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxJr+QXUKJq1AR7Lkgz6GB9yuJwzrBkAyhxljI9mfAprSaJSdRLaMzh7/XQ5nzwJGx5BxV
X-Received: by 2002:a67:cd11:0:b0:44e:dd14:24a4 with SMTP id u17-20020a67cd11000000b0044edd1424a4mr5104635vsl.29.1693489351077;
        Thu, 31 Aug 2023 06:42:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693489351; cv=none;
        d=google.com; s=arc-20160816;
        b=lYizG7S4vxthOrxeBulmx5Mel0hmpnnnsXSzXruVnBSfAOrRCpkk08FGeoj7lwDM77
         nG0r0+OBSmTNOQkd9vp5qIB6/qf+UmtuYB3y5EQGRfjNluFjHVJNjSUP8rH4u2q1KmW/
         LK441LeLJd8ZzUSWEnRpzYz9AhH8fguw5sdVvxlNqzCcFOV4yzikvTQ0I7k/0uZn9xHP
         ZqISSnRXvwCt5DeWWdbYZzkTHSvAHw7EHat6Jq0YZ55PMBrXvfENtZ11A/VuN9rcJW/y
         Wry0n56V+qCqa2i6eI5kXMqe7hnoUmJh/0prBUOzecG+6sdImTOurC0Dv8wr4WCgCtee
         ujUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fHfXKsk4Fp2//RuLUG648k4PSIDJ9GIP2HHnP04Uc/A=;
        fh=900r/RVX9bHCr7Kmf5xsMYOFmLCFG2QrYSCnHWr/tx0=;
        b=ANpfnphMs2L6sb6tI25Y24ABIrxTIAQbG5IH/OG4nqTHTrbNE3GDsOFuhgRuKuup81
         O4uGDiNEOIUpim8D6TKPJB7fRNfFipDvLX3y2JS748oT4h16UIy5DoRT/b92VdgFZQZS
         O+A6nbmhlcySXR1PMlG4qbzJz6DkRWy5Sog3OAUNzaZf6BuGLBIR8tEumSo748nGux9J
         UpGoalvHCVt6wXzZ/7RsQvLywy/Zhm2UyGTGDhFP0iioty/oPpv+qtotoMMIqZC71eiS
         5TwSZs0cwX15RfAA2mA8QTddLhs15LIKx869s6VzK9zzWf/Fnd7lL/fPLCvgZYKCbhil
         yJ3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=bSaLibuX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020a0cf452000000b006471113a986si873459qvm.323.2023.08.31.06.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:42:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=bSaLibuX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbhwH-0000tp-F2; Thu, 31 Aug 2023 09:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1qbhwF-0000lT-7a; Thu, 31 Aug 2023 09:42:23 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1qbhwC-0003BM-DI; Thu, 31 Aug 2023 09:42:22 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so95677766b.3; 
 Thu, 31 Aug 2023 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1693489338; x=1694094138; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fHfXKsk4Fp2//RuLUG648k4PSIDJ9GIP2HHnP04Uc/A=;
 b=bSaLibuX3z2briMh165CtPcQNTe4D/8jbc5SpAtRsxNQt/IrQuIyqVmjw3penIa+3Q
 xh0nREtVAYH6be40Ia7VO6oq8ETV6sMy0LyaYfzTf+qYbh06yMHe+cfPmHRESHsyRQBT
 KHI3MU4mouo1xiWOBUunQuxaZWyBR9VUNIssk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693489338; x=1694094138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fHfXKsk4Fp2//RuLUG648k4PSIDJ9GIP2HHnP04Uc/A=;
 b=HEZB/Bssn20KE4Hpw644u7dTHWHjgYrxC/2dnmF/QCFFBl2REuJ6zvh+vfA2XP3MF9
 5VHlahQo0fYw/hidCBR8g8JeJuNVxx3iu/KbGsEylsSg0YObXpOOIS9TQ5P6GUpmw1Ib
 5UtWxZXPFcGc7mqu7VeuJTWh4YesAsm+v2fWd3gs2meIJfBGbbukHy06CXyW+CoeO9Qf
 lq9+AJjshOlCSSX/Rv5xd/nGV9DI3K5ozJZfJPTGAItcywTOuuSK/xOWr3kUS0EA8oKd
 4whxxH8ePHevOUkD8nZVX5EDlB3Rn3hyWLxQiNogpa/A0kYwIgyBLnMmw9fnStbofyVI
 NjwA==
X-Gm-Message-State: AOJu0YwiRSLJSkLW8Bf0LtNrqqyH9FxnTwkTzLQ+DA/vYtHUvPMik5vc
 lawkWWBPngyu3yWyxPx0ms0QbsHECwLUllZteRw=
X-Received: by 2002:a17:907:7758:b0:99c:6692:7f76 with SMTP id
 kx24-20020a170907775800b0099c66927f76mr4571158ejc.16.1693489337965; Thu, 31
 Aug 2023 06:42:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230831123922.105200-1-clg@kaod.org>
 <20230831123922.105200-6-clg@kaod.org>
 <CACPK8XdiTpONmuLag5HnTCPXtoz+Zg-Yo+rrzt+Wuz17hbdDRg@mail.gmail.com>
 <a35c9605-7bea-0252-359e-86855e8ee304@kaod.org>
In-Reply-To: <a35c9605-7bea-0252-359e-86855e8ee304@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 31 Aug 2023 13:42:06 +0000
Message-ID: <CACPK8Xd_XXTStxrNkx36TtE7dfRR2yG0oS3Mfa62F3ap-52OHg@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] aspeed: Create flash devices only when defaults
 are enabled
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=joel.stan@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: ewi6W1igKp1C

On Thu, 31 Aug 2023 at 13:22, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 8/31/23 15:00, Joel Stanley wrote:
> > On Thu, 31 Aug 2023 at 12:39, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> >>
> >> When the -nodefaults option is set, flash devices should be created
> >> with :
> >>
> >>      -blockdev node-name=3Dfmc0,driver=3Dfile,filename=3D./flash.img \
> >>      -device mx66u51235f,cs=3D0x0,bus=3Dssi.0,drive=3Dfmc0 \
> >>
> >> To be noted that in this case, the ROM will not be installed and the
> >> initial boot sequence (U-Boot loading) will fetch instructions using
> >> SPI transactions which is significantly slower. That's exactly how HW
> >> operates though.
> >>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >
> > I think this is the first foray for the aspeed machines into
> > nodefaults removing things that previously would have just worked.
>
> This is true. It is change from the previous behavior.
>
> QEMU should probably complain if no fmc0 are found to boot from.
> Would that be ok ? And yes, documentation needs some update.

I didn't consider warning. That would help users who blindly added
-nodefaults and wondered why nothing was happening.

This is what happens if you add -nodefaults to an "old" command line
with your patch applied:

$ ./build/qemu-system-arm -M rainier-bmc -nographic -nodefaults
-serial stdio -drive
file=3Dobmc-phosphor-image-rainier.static.mtd,if=3Dmtd,format=3Draw
qemu-system-arm: -drive
file=3Dobmc-phosphor-image-rainier.static.mtd,if=3Dmtd,format=3Draw: machin=
e
type does not support if=3Dmtd,bus=3D0,unit=3D0

Which at least isn't sitting there spinning, as I was worried. I'll
leave it to you as to whether it needs a helpful message.

Cheers,

Joel



>
> Thanks,
>
> C.
>
> > I
> > know we haven't had it in our recommended command lines for a long
> > time, so that's fine.
> >
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> >
> > Should the content of your commit message go in the docs?
> >
> >> ---
> >>   hw/arm/aspeed.c | 6 ++++--
> >>   1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> >> index cd92cf9ce0bb..271512ce5ced 100644
> >> --- a/hw/arm/aspeed.c
> >> +++ b/hw/arm/aspeed.c
> >> @@ -396,12 +396,14 @@ static void aspeed_machine_init(MachineState *ma=
chine)
> >>       connect_serial_hds_to_uarts(bmc);
> >>       qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
> >>
> >> -    aspeed_board_init_flashes(&bmc->soc.fmc,
> >> +    if (defaults_enabled()) {
> >> +        aspeed_board_init_flashes(&bmc->soc.fmc,
> >>                                 bmc->fmc_model ? bmc->fmc_model : amc-=
>fmc_model,
> >>                                 amc->num_cs, 0);
> >> -    aspeed_board_init_flashes(&bmc->soc.spi[0],
> >> +        aspeed_board_init_flashes(&bmc->soc.spi[0],
> >>                                 bmc->spi_model ? bmc->spi_model : amc-=
>spi_model,
> >>                                 1, amc->num_cs);
> >> +    }
> >>
> >>       if (machine->kernel_filename && sc->num_cpus > 1) {
> >>           /* With no u-boot we must set up a boot stub for the seconda=
ry CPU */
> >> --
> >> 2.41.0
> >>
>
