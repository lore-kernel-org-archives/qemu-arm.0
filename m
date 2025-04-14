Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2266304njc;
        Mon, 14 Apr 2025 14:14:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVReeWot5JIarFYqtr7CdDEyLZL3vxrsjyDUBf5R2GgH/2DSGIcS5LN1fk19eMiLyjPmDAR3ohC/jpvEA==@linaro.org
X-Google-Smtp-Source: AGHT+IGzgh3FlHbsU8taqnDI4x5q5vjnIfJUBaqQl8a4aWpQjbfNrTrkjkpk24sx+J6+1lsxrXKx
X-Received: by 2002:ac8:5fc1:0:b0:476:aa36:d674 with SMTP id d75a77b69052e-4797756e17amr232739731cf.28.1744665271707;
        Mon, 14 Apr 2025 14:14:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744665271; cv=none;
        d=google.com; s=arc-20240605;
        b=bJqpteSQ5SXoI5OeiXeXaH9sppfCo/MXdMR1vhqOPS/0D+P1aoikJTuCEBaZMQPnpF
         qUiuWhLDiYIPFXNkLa+Wvmh8SPWvMIRPaKfh687eH7CfeWt7QFnVfhnt8NRrIUdm9MbH
         3ONlUFCikrdYKMihkiu85Pg4C1QGGHv8OxuBa4ZPHHEagrnxHCD0uln//ARQra3uaJ7d
         yKrwbWe4Yzt74xMF+TiGUczFyR55ZOPVXn0Ctnd0h/padWD89r+MxRcUYvHUjU+KKZh/
         uaSOOhmv9G+ni4yq83j3JmzlTREUS+FNW5T2ipObnlB4im112mGMvxU6C0vCvWCnklNU
         N7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iyXYy0TxsCzGQDwyZDZ/T8g1YF2uIjz5iZRVQWLX5GM=;
        fh=iYmyDDcVtKf+m5I/60wA390qngW1suQPChOJJWpcmAI=;
        b=aAP2HjWOq6qQb9gCPkU/0Phugx4C1SNc/a2kF3XIeEWlt/lg4C34iFkcPzC+5j6Tkc
         AwEz1WEUmCQGytKmlViBgnfLd7CzgCsLJ01F9Qd0rssEIjVD1p/P1GH4gzJNfH0wwaTS
         xGQlqJUtg7ACbJ1xIS+rFTv3mchBGNUsEt5u7hB7b+o4JVENv8XqfsxaWdqFkHu/4faP
         9cHjQdGHSppUl22oxXgXH7ci1HZHLRq7KlKXhjVw6Dv7K+boiU2fshcioFiSciEcZXzs
         qakejSxbKWGBEPLcc+qbFBd7Pp1EZi7QGgiOoErfIgjUaKKmUEQOC4/4bXgSWKtqEyOw
         KQBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JVludzGX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edd68efsi95489931cf.391.2025.04.14.14.14.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Apr 2025 14:14:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=JVludzGX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4R8J-0001xk-Rm; Mon, 14 Apr 2025 17:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u4R8I-0001xI-CQ
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 17:14:22 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u4R8G-0006sk-EU
 for qemu-arm@nongnu.org; Mon, 14 Apr 2025 17:14:22 -0400
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-4769e30af66so38531cf.1
 for <qemu-arm@nongnu.org>; Mon, 14 Apr 2025 14:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744665258; x=1745270058; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iyXYy0TxsCzGQDwyZDZ/T8g1YF2uIjz5iZRVQWLX5GM=;
 b=JVludzGXiWwsPzDF+hndNV1y82NBslRYqW0ssx12DTbgA82Osi9C9ucoyqVSnseyaT
 WX29kezmn5vOBxKcYVaU4cYaSVpScuy6R4DTyK8Vm5ozvuCBOJSCKiUgJdZ54CwaELB7
 pHU30MIpAbhrbXN+nLiULhIJA7kBzUXxHXKqxYMS214VNhy5IFBNUsaOagaU4Fk0x8P4
 kShSJiP98pZuiBqdJSolxopJCpKy3RIN3J4N5AP3BFQ7Wce5tHauYVkR6X8MEvdrINbF
 CmufPsn4lsnnN9Y50h7n+Ol7jpzhP+sLV1dB2EYzCn6DLPV55QD2MaDVIf2hrg2fL/PG
 c71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744665258; x=1745270058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iyXYy0TxsCzGQDwyZDZ/T8g1YF2uIjz5iZRVQWLX5GM=;
 b=HkG5ZDFFmMiQoiD6g/zfLzh5vK95lKJA2+yBKEYlMBJ6nQSBMNyBQX7eGTUlZ9zBfe
 j7kuVBNAy/Au5oAEN0NY4WrXundcOihOCiKtltvwCdA1B5Yh/Az7a+l+st374YMaGiah
 BM8IHej4PsYIGFbEEB1+V8s6lt+qM+g+NlTirFb3cirTQF8dzk2cxJH/Ua0/T2UpWNkT
 Uk7wvrByJUuYqO732UhTdxroz3ey/c2MAXgV9m0nHjhFzhIYsbwhXcP4zt7e1Kw44yo3
 ymfvUGmMDRdnpz6n6UtMFuLjzscHOWFeLW7Rbih8K6iGWFbp1Vqn5J2stk/9fixBINEe
 LkwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtsOlov+anyvheC8nu9lUrpd+FUX9gDYuLbvOabZo8N1fetINny7MUaintUkTfxEPJpOnr8o1P3A==@nongnu.org
X-Gm-Message-State: AOJu0Yymsb1WmBEzAWvAy5bMMriiIlrS+qM5XiqjWDVcevP6gs8qiGn+
 hGsyO7Li9XaAbYDfakdpiEiBr9eSNfJd9xug5voUXQphp/sJuBmJKP9LG8iHEbGrxXov6Mv+YH9
 W9Rm5uSoOLaSrZhYodttsN5FJXQfKHCum8BV/
X-Gm-Gg: ASbGncuam7E/rSFBYe9LUILVcRqwWUDmDM3HhNPT/uoMlcnsxqjFDZyDbMW8vrauFAh
 cDGkeCYvS6LSuAAnbCTCdaQ9aZBveSQnayPnKJLzmG0KTJkftSjvOpvZMMk++fGda8yt3W5jwMd
 f6PNda6LB4PUarsQo09g4FFUOOSUpvj1WeQO5aVwLISUA/CQpnOpts
X-Received: by 2002:ac8:5e54:0:b0:476:f4e9:314e with SMTP id
 d75a77b69052e-47a6df7fe61mr531301cf.25.1744665258085; Mon, 14 Apr 2025
 14:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
 <20250410023856.500258-8-jamin_lin@aspeedtech.com>
 <860fbb39-feec-4c1d-b05f-aea7889a698f@kaod.org>
 <SI2PR06MB5041C73D934E10DEC9B66805FCB32@SI2PR06MB5041.apcprd06.prod.outlook.com>
In-Reply-To: <SI2PR06MB5041C73D934E10DEC9B66805FCB32@SI2PR06MB5041.apcprd06.prod.outlook.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 14 Apr 2025 14:14:06 -0700
X-Gm-Features: ATxdqUHbeBVHksXcaxozRloooei0x9lQC3xo_LIKfTeKeXH-RM-PTknDsIO8uWQ
Message-ID: <CA+QoejUvnwZBqS6nJBi5y=g1-r+f=9SnDD4SQOL3kxqeMbS_cw@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] hw/arm/aspeed: Add support for loading vbootrom
 image via "-bios"
To: Jamin Lin <jamin_lin@aspeedtech.com>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Troy Lee <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x834.google.com
X-Spam_score_int: -178
X-Spam_score: -17.9
X-Spam_bar: -----------------
X-Spam_report: (-17.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.268,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8mkUBmh5m1qG

Hi Jamin and Cedric,

On Sun, Apr 13, 2025 at 8:17=E2=80=AFPM Jamin Lin <jamin_lin@aspeedtech.com=
> wrote:
>
> Hi Cedric,
>
> > Subject: Re: [PATCH v2 07/10] hw/arm/aspeed: Add support for loading
> > vbootrom image via "-bios"
> >
> > On 4/10/25 04:38, Jamin Lin wrote:
> > > Introduce "aspeed_load_vbootrom()" to support loading a virtual boot
> > > ROM image into the vbootrom memory region, using the "-bios"
> > command-line option.
> > >
> > > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > > ---
> > >   hw/arm/aspeed.c | 32 ++++++++++++++++++++++++++++++++
> > >   1 file changed, 32 insertions(+)
> > >
> > > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c index
> > > b70a120e62..2811868c1a 100644
> > > --- a/hw/arm/aspeed.c
> > > +++ b/hw/arm/aspeed.c
> > > @@ -27,6 +27,7 @@
> > >   #include "system/reset.h"
> > >   #include "hw/loader.h"
> > >   #include "qemu/error-report.h"
> > > +#include "qemu/datadir.h"
> > >   #include "qemu/units.h"
> > >   #include "hw/qdev-clock.h"
> > >   #include "system/system.h"
> > > @@ -305,6 +306,32 @@ static void
> > aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBackend *blk,
> > >                      rom_size, &error_abort);
> > >   }
> > >
> > > +/*
> > > + * This function locates the vbootrom image file specified via the
> > > +command line
> > > + * using the -bios option. It loads the specified image into the
> > > +vbootrom
> > > + * memory region and handles errors if the file cannot be found or l=
oaded.
> > > + */
> > > +static void aspeed_load_vbootrom(MachineState *machine, uint64_t
> > > +rom_size)
> >
> > please add an 'Error **' parameter and let the caller decide to exit.
> >
>
> Will add.
>
> > > +{
> > > +    AspeedMachineState *bmc =3D ASPEED_MACHINE(machine);
> > > +    const char *bios_name =3D machine->firmware;
> > > +    g_autofree char *filename =3D NULL;
> > > +    AspeedSoCState *soc =3D bmc->soc;
> > > +    int ret;
> > > +
> > > +    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> >
> > What if the user didn't provide any -bios command line option ?
> >
>
>
> Will update to support both vbootrom and loader.

For this case, could we have something like the npcm8xx_board.c where we
have a default bootrom and override it with -bios? That would also fix the
qtest issues with the ast2700 qtests which fail with this patchset.

>
> > > +    if (!filename) {
> > > +        error_report("Could not find vbootrom image '%s'", bios_name=
);
> > > +        exit(1);
> > > +    }
> > > +
> > > +    ret =3D load_image_mr(filename, &soc->vbootrom);
> > > +    if (ret < 0) {
> > > +        error_report("Failed to load vbootrom image '%s'", filename)=
;
> > > +        exit(1);
> > > +    }
> > > +}
> > > +
> > >   void aspeed_board_init_flashes(AspeedSMCState *s, const char
> > *flashtype,
> > >                                         unsigned int count, int
> > unit0)
> > >   {
> > > @@ -483,6 +510,11 @@ static void aspeed_machine_init(MachineState
> > *machine)
> > >           }
> > >       }
> > >
> > > +    if (amc->vbootrom) {
> > > +        rom_size =3D memory_region_size(&bmc->soc->vbootrom);> +
> > aspeed_load_vbootrom(machine, rom_size);
> > > +    }
> > > +
> >
> > Even without a vbootrom file, the machine could boot with '-device load=
er'
> > options. We should preserve this way of booting an ast2700-evb machine.
> >
>
> Will support both loader and vbootrom.
> Thanks for review and suggestion.
>
> Jamin
> >
> > Thanks,
> >
> > C.
> >
> >
> >
> >
> > >       arm_load_kernel(ARM_CPU(first_cpu), machine,
> > &aspeed_board_binfo);
> > >   }
> > >
>

Also, tested against our custom machine + custom bmc image and the
bootrom itself works.
I think it might just need that default set.

Tested-By: Nabih Estefan <nabihestefan@google.com>
