Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2766424njc;
        Tue, 15 Apr 2025 09:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbNUcqiGYmSADVP2awGeI5TqntD6n3bh8BwRSpv5Dj3W1I0+Tz9rqaVUSD7k6PXCJj7dkD9opyODipAw==@linaro.org
X-Google-Smtp-Source: AGHT+IG1H3NJwlJRJb2Lu3LwC4504/DHqNNkbueJJuviGG6CxjNJk87IP4Vl16Q6JCLMC4DZIxbM
X-Received: by 2002:a05:6214:1312:b0:6e8:fe16:4d4f with SMTP id 6a1803df08f44-6f2ad965487mr301146d6.26.1744733302236;
        Tue, 15 Apr 2025 09:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744733302; cv=none;
        d=google.com; s=arc-20240605;
        b=fKl7ielRp0sVLAulj/EMb7tO64YuggCN8a9ncnDiuEki2JNIe2Sj+kADDoeSkKZiJa
         4Wj2N9ZaHu58xv2jLCdS+So6Ec8echK/cZpmwee7TCceEN3MYqiia3VU1riAR/uZTae4
         vSDL12Owthbd+FnF0cNCJOY/W77HAwjf9xFUyyuW7Y0/L4C7Nfxix0qgfLRoqp3b84VG
         i52JuCW5vzLZnB/Lki9OEJkn/bJFpYTzTtIoOknCI+s37Yd3Rcu8OPbtWIinxdCRUZ+Q
         M9Wxw1hCSwMLLw2nGMic7P+HL1CCdXHvXQ5vh/UQaWcZx0ON8F3xrEjoUTSF/5DNbDD3
         bNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=67Seyv2EQ0eH3fvOgQj/T82RXsQkB/pngLiaqKyBV0I=;
        fh=AhEnKAycGUuZrYTJStevuC6CzQq0fPkOxjrOk3Xi4ao=;
        b=GpU4j1ZXDHWY9HKBHVySuWGZ56syF0omNkK36DvF7+pMsXMA4Eb00QyMvreyRbEJqB
         G2x6wJVKau4mVoo6F+hQHgmeC55XqRwxt/LfdE1XTdvxgI9cFqoNaIhYnd64Y2gWn6QA
         3zehMRu17EEhcZ+Qj4sUP/iy9XNp07/vm6PdTmnH+6yHWXb9AFZrcw6UqdwCTYH0l7aE
         1bT4lnuL05a9UqaP2/MZJyP/XY6N2YXVCjnyB6Dmimz0fXiHny545L4CTDRKvKE9Bck0
         jU1yDmAQU/X/5EEAJk3wkJPtkc+gfz+7ddToaViGog+U2mtrA4ob0Ijrx+va4k3utyhm
         3D8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="H/izhTIF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f0de95f9d3si126577056d6.92.2025.04.15.09.08.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 09:08:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="H/izhTIF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4ipZ-0004hK-6q; Tue, 15 Apr 2025 12:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u4ipP-0004fD-KH
 for qemu-arm@nongnu.org; Tue, 15 Apr 2025 12:08:06 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1u4ipI-0003Nb-W8
 for qemu-arm@nongnu.org; Tue, 15 Apr 2025 12:08:00 -0400
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-47681dba807so252831cf.1
 for <qemu-arm@nongnu.org>; Tue, 15 Apr 2025 09:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1744733272; x=1745338072; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=67Seyv2EQ0eH3fvOgQj/T82RXsQkB/pngLiaqKyBV0I=;
 b=H/izhTIFFMqgloOKyebQ6GlCeQXdHfH4zMyBc+4yUkl5mg1+mCYaaTRxhyhKgVwwGs
 Op/D1uNIDIxc9HAuyJ4lBoVGOGAKz3PUkewUzAhuekaXDLWdAn1nzce8CHA0Q7ZOKhK+
 a1PL9hNpRkM+Y3UrRLu+rDFYvESpFbMOA9tAdL7dxSc2C6mt6+6wWv2VImiYK4/ZGLOk
 mssv/JGldLUHvuX+nV1ZPmHW4KNZhtjLZ/mhp88dOZgfcSejCjXQI3Io0dcodYHAxABp
 pIXXEWgMRRd8oeDm5nHYiTYuJf8fSYXOFd3sTPwfWLhkUlqPBJ9VJxlwXbj2MNOzvhcF
 iO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744733272; x=1745338072;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=67Seyv2EQ0eH3fvOgQj/T82RXsQkB/pngLiaqKyBV0I=;
 b=DsDr1muzLFixYBPahE4mNKd476VDWmlAQwYe/7x3lLz7Z4d2o87jAPdM+QY+QjVJMb
 t62US/zJc5vrt/3T3VHcrtLLfFUoD8kAr+eBuT1R8Kb0v5LVLzghqW21qlIBaw3Q3XWZ
 dPzfrWVUPnKCTYjO1p0PmPaH7H7S3GEGKgfH/YquEPTMKnPDM/dcg06DXr7m40QTzhi6
 dfMjjfkfV8fER94qSVrPqeeDdD3KuQIinjiYSOD4cODZrQ7I37yIK7D8NGvmdVykQWlO
 GviDO/41VksDCRHs0alr1PkacyEGtM1TVVTvIoDVzsrP6pSA3sFWNz4rdd2ibXhiPRrX
 AOHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCQV5+fD310hwnx/k4gC4t32cHFKY3/Q7HmBDUpZz9WVHEN+ZYpwuVy17xWJZN9mqkQjWZFWOlOA==@nongnu.org
X-Gm-Message-State: AOJu0YymldOO366SCG7mcht1oS41l9c8HSsvhlqkIfAS1SFA4IA8Cd47
 nf1pJxO/4h8/gAX4BW6IBNHVyDJwNP0RoZVm3glDOdTPtzPTBZeTsf0Wi5CZiUiGOR/KB0FMy2g
 ZZR+MREyzVVdhxDd6ocrkwfFyt6qRlwFEJtOU
X-Gm-Gg: ASbGnctefcT3BA4UMlSoiBe5Dj8gneB0+NZIppH/MREbkgJNodlX4j2dB9W2toCCLLH
 wlC+HQwiX4zt5vWghG1sqN5SQlvUot3HBo5Pjp/p/Xui1kMhvXiKH5hejDk9wXRhyKw9ta09p9Y
 RtYyq8hQzrVe4f0G94Z2A49S5y3dQcZO2OB2/T+4RVC3Th2lxnwO54
X-Received: by 2002:ac8:5801:0:b0:477:1f86:178c with SMTP id
 d75a77b69052e-47a6df06376mr4380841cf.26.1744733271903; Tue, 15 Apr 2025
 09:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250410023856.500258-1-jamin_lin@aspeedtech.com>
 <20250410023856.500258-8-jamin_lin@aspeedtech.com>
 <860fbb39-feec-4c1d-b05f-aea7889a698f@kaod.org>
 <SI2PR06MB5041C73D934E10DEC9B66805FCB32@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <CA+QoejUvnwZBqS6nJBi5y=g1-r+f=9SnDD4SQOL3kxqeMbS_cw@mail.gmail.com>
 <SI2PR06MB50413B875162D6ADD2F182ECFCB22@SI2PR06MB5041.apcprd06.prod.outlook.com>
In-Reply-To: <SI2PR06MB50413B875162D6ADD2F182ECFCB22@SI2PR06MB5041.apcprd06.prod.outlook.com>
From: Nabih Estefan <nabihestefan@google.com>
Date: Tue, 15 Apr 2025 09:07:40 -0700
X-Gm-Features: ATxdqUEDZ5sbYGTAI86OPcyf-gBj1X5yKajDTplXBh0qjAyehNVapIKvkzq136A
Message-ID: <CA+QoejWEn-B8E_QC-hAM87j_5TQXMYZRgDNUvq5qUTYUr9VQ-Q@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82b.google.com
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
X-TUID: oLKd40PSrvNk

Hi Jamin,


On Tue, Apr 15, 2025 at 2:35=E2=80=AFAM Jamin Lin <jamin_lin@aspeedtech.com=
> wrote:
>
> Hi Nabih,
>
> > <qemu-arm@nongnu.org>; Troy Lee <troy_lee@aspeedtech.com>
> > Subject: Re: [PATCH v2 07/10] hw/arm/aspeed: Add support for loading
> > vbootrom image via "-bios"
> >
> > Hi Jamin and Cedric,
> >
> > On Sun, Apr 13, 2025 at 8:17=E2=80=AFPM Jamin Lin <jamin_lin@aspeedtech=
.com>
> > wrote:
> > >
> > > Hi Cedric,
> > >
> > > > Subject: Re: [PATCH v2 07/10] hw/arm/aspeed: Add support for loadin=
g
> > > > vbootrom image via "-bios"
> > > >
> > > > On 4/10/25 04:38, Jamin Lin wrote:
> > > > > Introduce "aspeed_load_vbootrom()" to support loading a virtual
> > > > > boot ROM image into the vbootrom memory region, using the "-bios"
> > > > command-line option.
> > > > >
> > > > > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > > > > ---
> > > > >   hw/arm/aspeed.c | 32 ++++++++++++++++++++++++++++++++
> > > > >   1 file changed, 32 insertions(+)
> > > > >
> > > > > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c index
> > > > > b70a120e62..2811868c1a 100644
> > > > > --- a/hw/arm/aspeed.c
> > > > > +++ b/hw/arm/aspeed.c
> > > > > @@ -27,6 +27,7 @@
> > > > >   #include "system/reset.h"
> > > > >   #include "hw/loader.h"
> > > > >   #include "qemu/error-report.h"
> > > > > +#include "qemu/datadir.h"
> > > > >   #include "qemu/units.h"
> > > > >   #include "hw/qdev-clock.h"
> > > > >   #include "system/system.h"
> > > > > @@ -305,6 +306,32 @@ static void
> > > > aspeed_install_boot_rom(AspeedMachineState *bmc, BlockBackend *blk,
> > > > >                      rom_size, &error_abort);
> > > > >   }
> > > > >
> > > > > +/*
> > > > > + * This function locates the vbootrom image file specified via
> > > > > +the command line
> > > > > + * using the -bios option. It loads the specified image into the
> > > > > +vbootrom
> > > > > + * memory region and handles errors if the file cannot be found =
or
> > loaded.
> > > > > + */
> > > > > +static void aspeed_load_vbootrom(MachineState *machine, uint64_t
> > > > > +rom_size)
> > > >
> > > > please add an 'Error **' parameter and let the caller decide to exi=
t.
> > > >
> > >
> > > Will add.
> > >
> > > > > +{
> > > > > +    AspeedMachineState *bmc =3D ASPEED_MACHINE(machine);
> > > > > +    const char *bios_name =3D machine->firmware;
> > > > > +    g_autofree char *filename =3D NULL;
> > > > > +    AspeedSoCState *soc =3D bmc->soc;
> > > > > +    int ret;
> > > > > +
> > > > > +    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> > > >
> > > > What if the user didn't provide any -bios command line option ?
> > > >
> > >
> > >
> > > Will update to support both vbootrom and loader.
> >
> > For this case, could we have something like the npcm8xx_board.c where w=
e
> > have a default bootrom and override it with -bios? That would also fix =
the qtest
> > issues with the ast2700 qtests which fail with this patchset.
> >
> Do you mean that if the user does not specify "-bios", we should still lo=
ad a default vbootrom image into the vbootrom memory region?
> We can verify whether -bios was provided by checking if machine->firmware=
 is NULL.
> It seems that if the user doesn't provide -bios, NPCM QEMU will look for =
a default vbootrom image in the current working directory =E2=80=94 is that=
 correct?
> https://github.com/qemu/qemu/blob/master/hw/arm/npcm8xx_boards.c#L37

Yeah. IIUC the default functionality should be to use a vbootrom to
boot with the AST27X0 so
if there is no bootrom declared we should default to the one you
created. for the NPCM one, if
we don't provide bios it will default to the one in pc-bios since it's
supposed to be the base true version.
I think it makes sense to do the same thing in ast2700. If we really
find use in supporting attaching the
loader binaries separately we could add a flag that skip the vbootrom,
but I don't see much use in that
since the information that would change is in the "image-bmc".

>
> ```
> const char *bios_name =3D machine->firmware ?: npcm8xx_default_bootrom;
> ```
> Could you let me know which qtest(s) failed, so I can run them and verify=
 everything before sending out the v3 patch?

qemu:qtest+qtest-aarch64 / qtest-aarch64/ast2700-gpio-test
qemu:qtest+qtest-aarch64 / qtest-aarch64/ast2700-smc-test

They both fail with " qemu-system-aarch64: Could not find vbootrom
image '(null)' " so setting the default
bootrom should fix this.

>
> Thanks-Jamin
>
> > >
> > > > > +    if (!filename) {
> > > > > +        error_report("Could not find vbootrom image '%s'",
> > bios_name);
> > > > > +        exit(1);
> > > > > +    }
> > > > > +
> > > > > +    ret =3D load_image_mr(filename, &soc->vbootrom);
> > > > > +    if (ret < 0) {
> > > > > +        error_report("Failed to load vbootrom image '%s'", filen=
ame);
> > > > > +        exit(1);
> > > > > +    }
> > > > > +}
> > > > > +
> > > > >   void aspeed_board_init_flashes(AspeedSMCState *s, const char
> > > > *flashtype,
> > > > >                                         unsigned int count, int
> > > > unit0)
> > > > >   {
> > > > > @@ -483,6 +510,11 @@ static void aspeed_machine_init(MachineState
> > > > *machine)
> > > > >           }
> > > > >       }
> > > > >
> > > > > +    if (amc->vbootrom) {
> > > > > +        rom_size =3D memory_region_size(&bmc->soc->vbootrom);> +
> > > > aspeed_load_vbootrom(machine, rom_size);
> > > > > +    }
> > > > > +
> > > >
> > > > Even without a vbootrom file, the machine could boot with '-device =
loader'
> > > > options. We should preserve this way of booting an ast2700-evb mach=
ine.
> > > >
> > >
> > > Will support both loader and vbootrom.
> > > Thanks for review and suggestion.
> > >
> > > Jamin
> > > >
> > > > Thanks,
> > > >
> > > > C.
> > > >
> > > >
> > > >
> > > >
> > > > >       arm_load_kernel(ARM_CPU(first_cpu), machine,
> > > > &aspeed_board_binfo);
> > > > >   }
> > > > >
> > >
> >
> > Also, tested against our custom machine + custom bmc image and the boot=
rom
> > itself works.
> > I think it might just need that default set.
> >
> > Tested-By: Nabih Estefan <nabihestefan@google.com>

Thanks,
Nabih
